Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1473FFF94
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 13:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764463; cv=none; b=CtNSG0kap7Sh/w3Lgo4orx70Wv81HLs0QFZQTe1dhXjcKvkk4/jCtw5yKdP0GEiYKYnu70hVBdgiMi7SwxT2L+oVPHILwfNj0/k+29DLS7Djj6fizmnM0mKQeCG/I0aSoTvld4GiccjXUgy/2599S9ew62cD+mg27RgLC9UQoMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764463; c=relaxed/simple;
	bh=QUwu3aM7wyALv6OrkMnJwvZksgF64OQt61uiYF6+Cxs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M6QT8YWi1nlq/Zj94r5i/JF92IyOqLRZ+lhkySm59ODi3Za83xBHkWW+ZAa9lSWnBl5DDyS4DTpKGd4Wz2HPtpoFUWuSQjKsV4R60r0L/t463FJ+1o0VfsbJ0d7GJb9v6QvxbG/EhA0xK+uhonBytHnSixpE6PtNVExUxJl+P/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gEz9prSz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gEz9prSz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFEC1F000E9;
	Mon,  3 Aug 2026 13:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785764462;
	bh=EFZeZplNyQ+RN6YUmOuBccf+iuq0oAQh+VXaLX9FTE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gEz9prSzUffzXLzJKPJc5eWA5n3BzrzK5aFiQvXqq4e1lyL8OkNn8LeVfv5XVCAsc
	 59cFgQEwzI2bL7u7Tv7mR9gPvIwyhHppBxidSId39lyUurUXzjMaXy91matzfOan26
	 dqP7aOWas5TJgiozU3UNEGA2U6GY7QWAj74TrH8ozxprjWnLOdnKKXz6068WebSaTc
	 XCLAJMLa+uGIG6Fp1KbFJC/alp+0h/3G5NTcrSBecjGBRlmUE1kOVuB3m+fKysdTXn
	 atTbs5hwvPerdpQGgjdUy9DYrSTbbZmiaGqJ+FIabozqW+Hl3MKh50bgsDPjSqReNF
	 3rgnTHOHI7GOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] spmi: apple: check transaction status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-t603x-spmi-v3-3-c17b506d91a1@chaosmail.tech>
References: <20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech>
 <20260803-t603x-spmi-v3-3-c17b506d91a1@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 13:41:01 +0000
Message-Id: <20260803134101.EAFEC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] Missing explicit header includes for bitfield and bitwise macros.

Pre-existing issues:
- [High] Leftover FIFO data on error paths permanently desynchronizes subse=
quent transactions.
- [High] Unbounded `while` loop polling hardware status can cause a kernel =
hard lockup.
--

--- Patch [3]: [PATCH v3 3/6] spmi: apple: check transaction status ---
commit c52cd20ea1913f6b44118c7681235dcecf7cc8dc
Author: Alba Mendez <me@alba.sh>

spmi: apple: check transaction status

This commit adds checks for parity errors and missing command ACKs in the
Apple SPMI controller driver. It extracts the reply status from the response
register instead of discarding it and returns an error if checks fail.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -22,6 +22,12 @@
>  #define SPMI_CMD_REG 0x4
>  #define SPMI_RSP_REG 0x8
> =20
> +/* SPMI_RSP_REG reply word */
> +#define SPMI_REPLY_FRAME_PARITY_STATUS GENMASK(31, 16)
> +#define SPMI_REPLY_ACK BIT(15)
> +#define SPMI_REPLY_SLAVE_ID GENMASK(14, 8)
> +#define SPMI_REPLY_CMD GENMASK(7, 0)
> +

[Severity: Low]
Are we missing explicit header includes for linux/bitfield.h and
linux/bits.h?

This patch introduces the use of GENMASK and FIELD_GET, but appears to rely
on transitive inclusions from other headers, which might cause future build
breakages if those headers change.

[ ... ]

> @@ -87,8 +93,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, =
u8 opc, u8 sid,
>  	if (ret)
>  		return ret;

[Severity: High]
This is a pre-existing issue, but does this error path leave stale data in
the RX FIFO?

If apple_spmi_wait_rx_not_empty() times out, it returns an error and aborts
immediately without draining the RX FIFO:

drivers/spmi/spmi-apple-controller.c:apple_spmi_wait_rx_not_empty() {
    ...
    ret =3D poll_reg(spmi, SPMI_STATUS_REG, status, !(status & SPMI_RX_FIFO=
_EMPTY));
    if (ret) {
        dev_err(&ctrl->dev, "failed to wait for RX FIFO not empty\n");
        return ret;
    }
}

The hardware might subsequently complete the transaction and push the reply
into the FIFO. Later commands will begin by writing to the command register
without first asserting that the RX FIFO is drained:

drivers/spmi/spmi-apple-controller.c:spmi_raw_cmd() {
    guard(mutex)(&spmi->fifo_lock);
    reinit_completion(&spmi->fifo_rx);
    writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
    ...
}

Could this permanently desynchronize subsequent transactions by causing them
to read the stale reply data left by the aborted transaction?

> -	/* Discard SPMI reply status */
> -	readl(spmi->regs + SPMI_RSP_REG);
> +	reply =3D readl(spmi->regs + SPMI_RSP_REG);

[ ... ]

> @@ -107,6 +112,10 @@ static int spmi_read_cmd(struct spmi_controller *ctr=
l, u8 opc, u8 sid,
> =20
>  	flush_extra_data(ctrl);

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for this call
to cause a kernel hard lockup?

The flush_extra_data() function implements an unbounded while loop polling
the hardware status:

drivers/spmi/spmi-apple-controller.c:flush_extra_data() {
    while (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
        ...
        readl(spmi->regs + SPMI_RSP_REG);
    }
}

If the hardware enters a faulty state or continuously reports that the FIFO
is not empty, could the CPU loop infinitely here without yielding or timing
out?

> +	if (~FIELD_GET(SPMI_REPLY_FRAME_PARITY_STATUS, reply) & ((1 << len) - 1=
)) {
> +		dev_err(&ctrl->dev, "some frames failed parity check\n");
> +		return -EIO;
> +	}
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-t603x-spmi=
-v3-0-c17b506d91a1@chaosmail.tech?part=3D3
