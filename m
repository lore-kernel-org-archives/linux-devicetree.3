Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1772F3C3D
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788259216; cv=none; b=akWdKxHHBFdkhgk2COzkXawEZX2EmJyhb2SyWG40HaxsPdOgZkFXVU9bltLsOPEALDR1rXJ+ZS0BeEN2lWe/ZQcyY7qTNqiclg3JPhlInfLQ+EUzWr/R1/G/A1LinU5n0mowLRU6R8xELD7QGtMZpRFEzmkII1WY6orksZ+sSKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788259216; c=relaxed/simple;
	bh=Frxnc0U68CxHLDlT/x+hEArzK6ONHhJ+I5b2XDPsk6k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K5V7BfEW2hpz5Eblvbzuu2Cp22An36G2714Lo8RgAC8Z5Lhl+XJndazN0kJiJCN7gbi+BhledATShkx53k3Fo2PdOvpkcIw7xj2YYKFnxfPH+2ZpbNSSDrGyGqipdbT60jJSRlC50e5d5TqgrL3RjTrNkph9r9q1QkPIVfeKhpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/BfC3Jy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/BfC3Jy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923E61F000E9;
	Tue,  1 Sep 2026 10:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788259214;
	bh=flhPE/HZ6QFetlMK8pw49TvHBXi9O0KtN6mGeeoj60E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f/BfC3JyLUQ0F1Q6j/PxG6r+OMGBxzpEYPSGbWE9HdWge4F1jaNMoIcAEjmn92t5/
	 Yff1yniTbfUxxcBbZBHaNpOH4bSRTYgnDigTEP4NPRGh4OyEIRhhcRyrjdc3+0TA9M
	 BfhSmznrESqawkSl7fLURad/8bNxh5ongUDzgw94CBUGUfZWjjUtEWARfT7UxCZFf9
	 xTWC+Kcsd21iCW4Qx4UHz/7SsNjjuITBJM4chKYCQ5Ch0NgOMgsrMTFlIMhwFk96VZ
	 RNkkz9PnBBjt00HYa32naMwLMah6hHtb0ZjJGSIUIj5ZAADkD50YkEPOxf2yxCb7Rk
	 4W2rak/bg1Zzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 6/6] spmi: apple: Add interrupt functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260901-t603x-spmi-v9-6-09e702e3b153@chaosmail.tech>
References: <20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech>
 <20260901-t603x-spmi-v9-6-09e702e3b153@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 10:40:14 +0000
Message-Id: <20260901104014.923E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Race between command timeout recovery and delayed interrupt handle=
r causes spurious command failures (-EIO).
--

commit b173ce6913a5026fc32908944fd6149c07832b2c
Author: Alba Mendez <me@alba.sh>

spmi: apple: Add interrupt functionality

Add support for interrupts sent by slave devices and use IRQ for
RX FIFO if possible, reducing latency compared to polling.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index fabccd25aa0da..2390174452ab4 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -84,8 +165,10 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid, u16 param,
> =20
>  	if (spmi->prev_fail) {
>  		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
> +		apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_NOTIFY);
>  		spmi->prev_fail =3D false;
>  	}
> +	reinit_completion(&spmi->fifo_rx);
> =20
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);

[Severity: High]
Could this sequence lead to a race condition with a delayed interrupt?

If a previous command times out, setting spmi->prev_fail =3D true, but the
hardware responds shortly after, the NOTIFY interrupt might be raised.

If spmi_raw_cmd() is then called for the next command, it runs concurrently
with apple_spmi_irq_handler() on another CPU. The handler reads the NOTIFY
bit and commits to calling complete():

apple_spmi_irq_handler() {
    ...
    if (val & BIT(SPMI_IRQ_NOTIFY % 32)) {
        apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_NOTIFY);
        complete(&spmi->fifo_rx);
        handled =3D true;
    }
}

Concurrently, the thread clears the hardware IRQ state and calls
reinit_completion(&spmi->fifo_rx) here without synchronizing against the
IRQ handler (as the handler does not take fifo_lock).

If complete() executes after or concurrently with reinit_completion(), it
leaves fifo_rx signaled. The new command's wait_for_completion_timeout()
will return immediately, see an empty FIFO, and fail with -EIO.=20

Additionally, reinit_completion() performs a non-atomic update which races
with the spinlock operations inside complete().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-t603x-spmi=
-v9-0-09e702e3b153@chaosmail.tech?part=3D6
