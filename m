Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F77221540
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 21:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778276120; cv=none; b=bYgBVhKSTZPLxkF5RPPs97Z5hJ9ndV9ctewMoHIWHQLnqM5iqmitVqRVv7Lhm5umjh3eYKnYLaCelJGujid0Gr97/H214OZINNJOUJHRiq5WJrQGAghmiILDmAMngDtmMzHFlFO4LFgfS3AuAvaOawQW8J2VCNBC3R6kRJTRRDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778276120; c=relaxed/simple;
	bh=B3+/6biVk3M6CvjVVPSDM9L16DohU8S2Ar7G492rdPw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EXMwYCiIey/j9ISnhqsDgcR+JnYNduIyDjuYPGe5d6z4jTvfwXCEJureeGYLzAnfIbkGIswq0dDXTyNXVtSx+GXa9QtCMJ2Bkdx2/cRp3Be7ygSyV8Qabpn1Yszyp3tIXqCPeXcGOLIDjf+th20k8vOix6oy0FTeOAGKcjfA0m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3XrAwV3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3XrAwV3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780E5C2BCB0;
	Fri,  8 May 2026 21:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778276119;
	bh=B3+/6biVk3M6CvjVVPSDM9L16DohU8S2Ar7G492rdPw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Z3XrAwV3OU562nSDkaobZJqDuY6eesjdSKxsmkm5b9T/GlLVfA5Akl4A+ZNdX9OdN
	 I+GxLeFpsFzYeFtEVfM5Y8AsJ4OHhvy4Fo9ayhxlkKwl7K7JNlVmKrTybAIxzSgjbz
	 3EBBYzoSUrwNUg4r1xyIgNmHEllYen9FyTRMsEE+B5WRJltppE2JizkF3DMJehmjBb
	 ga+OgJhF6odTTbOqfQSGQ6LfzWtmYwCd+OgaT8QZzSaLSb6jSlH8ZeIRjARINu3s3Z
	 IcnYY38GOE2D05A/JMyFcXdfh3THcVhHC5hpWfws9366iIr1vyIzn39dzAmxHhWqOm
	 vqPL1O+NLOGhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/15] can: grcan: Add saving and restoring of CAN FD
 baud-rate registers
Reply-To: sashiko@lists.linux.dev
To: "Arun Muthusamy" <arun.muthusamy@gaisler.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260508070121.6918-10-arun.muthusamy@gaisler.com>
References: <20260508070121.6918-10-arun.muthusamy@gaisler.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 21:35:18 +0000
Message-Id: <20260508213519.780E5C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The patch claims to save and restore CAN FD baud-rate registers up=
on reset but fails to restore the data bit-timing register (`regs->fdbtr`),=
 causing it to be permanently wiped.
- [Medium] The `GENMASK` definitions for the GRCANFD `NBTR` register fields=
 overlap, creating a latent bug in the hardware interface definition.
--

commit c685fd29f8a299a3b71b10448a638f1df08b5e0d
Author: Daniel Hellstrom <daniel@gaisler.com>

can: grcan: Add saving and restoring of CAN FD baud-rate registers

While reset the GRCAN baud-rates are preserved, since GRCANFD has the
baud-rate in different registers we need to add saving of those
registers too.

> diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
> index 6e0a393785e86..ccf4032ed642e 100644
> --- a/drivers/net/can/grcan.c
> +++ b/drivers/net/can/grcan.c
> @@ -528,6 +528,8 @@ static void grcan_reset(struct net_device *dev)
> =20
>  	/* Turn off hardware filtering - regs->rxcode set to 0 by reset */
>  	grcan_write_reg(&regs->rxmask, 0);
> +
> +	priv->hwcap->set_bittiming(dev);

Does this fully restore the CAN FD baud-rate registers?

The commit message indicates that the GRCANFD baud-rate registers need
to be saved and restored, but it looks like set_bittiming() only sets the
nominal bit-timing register (regs->nbtr):

drivers/net/can/grcan.c:grcanfd_set_bittiming() {
    ...
	timing |=3D FIELD_PREP(GRCANFD_NBTR_SJW, sjw);
	timing |=3D FIELD_PREP(GRCANFD_NBTR_PS1, ps1);
	timing |=3D FIELD_PREP(GRCANFD_NBTR_PS2, ps2);
	timing |=3D FIELD_PREP(GRCANFD_NBTR_SCALER, scaler);
	netdev_dbg(dev, "setting timing=3D0x%x\n", timing);
	grcan_write_bits(&regs->nbtr, timing, GRCANFD_NBTR_TIMING);

	return 0;
}

Since the hardware reset clears the registers, and the fast data bit-timing
register (regs->fdbtr) is not saved before the reset or recalculated here,
will regs->fdbtr be permanently wiped?

This could cause the data baud-rate scaler to become zero and break CAN FD
data phase communication if Bit Rate Switch (BRS) is enabled.

Additionally, while looking at the register field definitions used by
set_bittiming(), do the GENMASK definitions for the GRCANFD NBTR overlap?

drivers/net/can/grcan.c:
#define GRCANFD_NBTR_SCALER     GENMASK(23, 16)
#define GRCANFD_NBTR_PS1        GENMASK(17, 10)

Bits 16 and 17 are included in both GRCANFD_NBTR_SCALER and GRCANFD_NBTR_PS=
1.

While it seems the current maximum phase segment limit prevents active
collisions at runtime, any future increase or use of FIELD_GET could lead
to silent data corruption because the scaler and ps1 bits bleed into
each other.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508070121.6918=
-1-arun.muthusamy@gaisler.com?part=3D9
