Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66042BCF7F
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 10:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786876629; cv=none; b=GU9fdMuwGaXL80RVED1V6KKUhHUxgkJ2KxWxOSdUjnYzy6idTKpE3UxTInHqlddnFiJIXSU2/fCz/dfaq0WvfDYwmf3p7lsefwfflN1YBbE9slFsQab48BrusraPqexqXYynpVyQ9JduoOhAOM5mg3xUdSQs5BgoDTBshLduiFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786876629; c=relaxed/simple;
	bh=VNrQPRtgY+E1Q0fcH/cSOzFSGI147bxzFHttI1VGXbw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hzf9HJqH5ZbTmqQsguVngnFVyKAXgR7YIyHfEAgaCaEayTq3gv8d59yMHAF6sABOYYv2sK3Pd2KjL/1qXz19seNgIFycr3QdSS05qIQ3USmTbAe6go7+xL2sZCh8VKpf5Hz5Zj8Bclk8SfURMjs+DHE3IXVikBnAzxsMI9QJJhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/d8LkZ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/d8LkZ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9F61F000E9;
	Sun, 16 Aug 2026 10:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786876628;
	bh=kc0/exVpO7R2snY+KR4Q4NycJH5CezG3JO0wSpu+KoE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z/d8LkZ1li2TbEoocDQuUC7d0C6thmj2NXrLIv7VX2SKSZARirlS0U6Bswh1G8hVF
	 lmh+HnhwOSSxRy0nTgkLGoVH8E1Iw9AtWnE81Ci96hqo6mFXq+VjW6CxGd/zLbh4WR
	 gevIUDrekzMRzsU3SiVsbjoL9lb++adRGJytuNuMwVkw1N6XazDpdpokXS557zm1Gp
	 byyds+X6jS9Obr1SdBucdzdUzhvMaHsBMdtpVVBZdpBaaaMr2MWwbvFMXMH4hcBubm
	 57Pqft4/LEcLGVIzgNkgtE9aUaOkXNXelcXkonuaK3ZFV1JeyjOEKk1BgbNx+UbFaO
	 CiBt7r9t5ZeAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/6] spmi: apple: check transaction status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260816-t603x-spmi-v6-3-c5ab87aa447b@chaosmail.tech>
References: <20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech>
 <20260816-t603x-spmi-v6-3-c5ab87aa447b@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 10:37:07 +0000
Message-Id: <20260816103708.1A9F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing concurrency protection for shared hardware controller regi=
sters.
--

--- Patch [3]: [PATCH v6 3/6] spmi: apple: check transaction status ---
commit 7a35e38337e2fbd8de6bb123e810dc5312c6e28b
Author: Alba Mendez <me@alba.sh>
spmi: apple: check transaction status

Check for parity errors and missing command ACKs.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index 15721cb41d5c8..b1c127cf5f441 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -66,7 +74,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, =
u8 opc, u8 sid,
>  {
>  	struct apple_spmi *spmi =3D spmi_controller_get_drvdata(ctrl);
>  	u32 spmi_cmd =3D apple_spmi_pack_cmd(opc, sid, saddr, len);
> -	u32 rsp;
> +	u32 reply, rsp;
>  	size_t len_read =3D 0;
>  	u8 i;
>  	int ret;

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for multiple
kernel threads to execute spmi_read_cmd() or spmi_write_cmd() concurrently
without locking?

If different threads communicate with multiple PMIC endpoints on the same S=
PMI
bus, it appears concurrent operations might invoke these functions
simultaneously. The core SPMI subsystem does not serialize transactions acr=
oss
different slaves.

In both functions, the driver writes to SPMI_CMD_REG and then enters a poll=
ing
wait without holding any locks. For example, in spmi_read_cmd():

	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);

	ret =3D apple_spmi_wait_rx_not_empty(ctrl);

Could this unprotected wait window allow interleaved accesses to corrupt the
shared command, status, and response registers? Is a mutex or spinlock
required here to protect the active transaction state from concurrent PMIC
transactions?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-t603x-spmi=
-v6-0-c5ab87aa447b@chaosmail.tech?part=3D3
