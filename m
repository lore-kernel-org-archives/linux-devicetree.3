Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFC2346AFB
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 03:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788578222; cv=none; b=kKwvsop20gallE8MfbBMTsJxwEA4y85xlw2NszKpW3EYNLyj5k8zA8zOdOvQm1O3dVW2oe1cgi9Pv+eJRQk1VKqeH1rRqie5vPUPq78OtoCjcUODmR/1gSIL99RZdmPQfGFdsWU+DIHLigqLtlYVftJswX3Cc9SCM0YxR962MFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788578222; c=relaxed/simple;
	bh=nisr5ziN83/vvuUa7fT3PuLqT+p6PzbxVPM+MpNzzyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cNeLQTQwp778qgJVXDJOr1YTpeAqtmAkEchvu8W8X/YDADS99juLD75qM18/8mLmHWN6AREOo3zfTRf4jdblkQZCCId9ajUYCJp05Iv2cBy9xFUb6hWUzcBImLHM1zCDZaZBgOjA6P4mLgeket2Rdhttdl+I0O2GiCIfzr7OTcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emcElXoP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emcElXoP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso13282235e9.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 20:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788578219; x=1789183019; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8CCZA4VoDQ6PBSjxOO7MB9iXLnCy8XMS9eXQBMC5ARg=;
        b=emcElXoPd/CpicMigbR4GkjKbrYQqlM0ZiDTIA0ANk+1UIx4DZMwCvmaD2BhVVwdBT
         WANjQpLgcW9cQvDBap32/OtBEchdR6eyqPin1L8Y7HJgUtl6sq7vCxJjTJGp4EBgU+AD
         HXebsTKpdR3GW2XVvn9lX/evdwmDGjPOFU5yotWWARO7z7Wv41s7uDJ47fCLiHfVp/wU
         +NsMn/88ux5gUTECavihyiJTc/04/uN0eh4KV1vYeNebYcyh6OlA4Qk2bXnAH9uBWZqk
         YtExYwac8f6wab/wyv+C0eB8h2euyGqzA4qjDYMQhqnlE8SdeUjYB+7Fqzn1x+cRVxvV
         nOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788578219; x=1789183019;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8CCZA4VoDQ6PBSjxOO7MB9iXLnCy8XMS9eXQBMC5ARg=;
        b=Y1yJl2nKnkpeEJZ5PFyi4mLshZt2+dhZvERGBf5LbGZAh2ITbhCP4ClrzIglYu/W+g
         +4vK9Y2pNRNdbQxHUeGsPgCE27xjEdRHIuet5AqKRms+DKXS1xnTgZ+3U0ZXTQXw/AZC
         1wLg1TVqxrqKlZ7nN7PfCpkv+UTv0fFLmsVEDzrpQvJxe1H0nGDm/lnVAOF6RrY6q1Rr
         gLMtD3/mZyV0sPNbpbheU3r0Oks+eeJX98mgclIBv8zeMrYgecsCxObly6A5HmQ6QgQt
         2+VHlY8Gauq9bLhkx0a+TCJGK35jv32J+k2/vW08ejvPJYvWUAAbDZO9JE80Fmx44xuu
         3LVw==
X-Forwarded-Encrypted: i=1; AKwUvBzd59PFgq8e0tQ87tt9f4q/oSfDF8czEdw/WVeMW201bcYbojGmIlFNmPJ3yTL2LZcGdspY7fNzPKVJ@vger.kernel.org
X-Gm-Message-State: AFuF++nLU/NyCCaHEoVqpQOaDVGVPGAc7XsiVoIuBhlW3SMFk4lmjJyK
	aqz1oRk6wSoZdtmVDIV1dvbIs8AROAbC2dn0eY3wlo4vHygBo9+Y7ctF
X-Gm-Gg: AYBFou2cMZ9ZATP1SYW3NbvstPHFHfDVvqiSfddzlrTrBxZkeNI3+sBeI7wLDL60MXE
	0AlWCH4Qw4i4JVo8jtTrOcMwQX8/NB2cscbGXLRp+9Oj9XZIcqbtysYgh8PJgkhm6s6Ps1PRR6S
	NIYFOCvMBgMMEvJ34NTxWbvrSqtpf4Je8ddqelIs9ueexv751U8/Xo+Y9F1Y22o8NL/AXJGTaIb
	qD7ErltBgd207MtvXLBP6WDBsGi5p+cn6VMXGjmT6gflXUzR4oMijpNKWVkfhMKhmcVVSbS+Ihy
	+wJzLfAOf37gHsBYpYbfuJ0iezpgwQlGvn/7bE+jjTNa/lCxJRGe3fsdQevE3/GeIYXVJ9McjhO
	59Bd/DT/WA0srC3/R6hSOZRokUXoznNCnsjNC5NYmPj2YuBYvlWbC74UQFCAAW/tUJv0PaCi/nH
	OtMbXnlyzP8XfuvESADfkpKuQAMU7aUiCl6VJA8tehMOsgc80yx5eP2faskM4eRM776U6FA6f66
	H/SYENj8LdSBOyj5EHAS5LZz/kuPakSTf0qmsofybv0xaU+vtUnb7FHLO32+dlwlZ5oiSDvcPW9
	HTmlDhP6lSUjH5ggeLWCpIynqtwov8+SdCbOz45d9zPZS2RXKuOUXOZ7ppQq9pR85aMkWluSOzJ
	7lKAN+KyhSPziWB6GLxuKJYDdO9ZtKSNRmU5XdRNZ8XdYUwMKBrezEw==
X-Received: by 2002:a05:600c:1d01:b0:499:cd34:f7c with SMTP id 5b1f17b1804b1-49cf81e6f87mr157093075e9.5.1788578218915;
        Fri, 04 Sep 2026 20:16:58 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm25312595e9.13.2026.09.04.20.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:16:58 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Barzin Lotfabadi <barzin221@gmail.com>
Cc: Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 0/2] arm64: dts: allwinner: h616: add HDMI device tree nodes
Date: Sat, 05 Sep 2026 05:16:55 +0200
Message-ID: <uGlvDrXdQ7mTWJ790WN0hw@gmail.com>
In-Reply-To: <20260904213329.3910099-1-barzin221@gmail.com>
References: <20260904213329.3910099-1-barzin221@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 4. september 2026 ob 23:33:27 Srednjeevropski poletni =C4=8Das j=
e Barzin Lotfabadi napisal(a):
> Hi all,
>=20
> These two patches add the device tree nodes needed for HDMI output on the
> Allwinner H616 family.  Tested on an Orange Pi Zero 3 (H618, 4GB), which
> drives a 1920x1080@60Hz desktop with these applied.
>=20
> Mainline already has DE33 mixer support in the sun4i driver, but there are
> no display nodes at all in sun50i-h616.dtsi, so nothing probes.  Ryan
> Walklin's "arm64: dts: allwinner: h616: add LCD timing controller and
> display engine support" series adds the display engine, bus, mixer and TC=
ON
> nodes, but states that HDMI output is not provided.  These patches are the
> missing HDMI half.
>=20
> Every register address, clock index and reset line was read out of the
> vendor device tree shipped with the board and translated to the mainline
> dt-bindings macros; the clock and reset numbering was verified identical
> between the vendor and mainline CCU headers before substitution.
>=20
> Two things I would appreciate guidance on:
>=20
> 1. Patch 1 currently also adds the display engine, bus, mixer and TCON
>    nodes, because Ryan's series has not landed and the HDMI nodes need
>    something to attach to.  If his series is merged first, I am happy to
>    respin this as an HDMI-only delta on top of it.  That is probably the
>    right shape; I did not want to post a series that applies to nothing in
>    the meantime.
>=20
> 2. These nodes alone are not sufficient for a picture.  Two driver changes
>    are also needed: an H616 variant in sun8i_hdmi_phy.c (only
>    a83t/h3/r40/a64/h6 exist today), and setting the TCON pad select bit in
>    sun4i_tcon.c.  Both exist in the Armbian sunxi-6.12 tree, authored by
>    The-going.  I have deliberately not included them here, because I cann=
ot
>    provide a Signed-off-by on another developer's work.  If someone in a
>    position to carry those forward would like to, I am happy to help test.
>    Without them these nodes probe but produce no output.
>=20
> checkpatch is clean apart from one 103-column warning on a remote-endpoint
> line in patch 1; the identical construct at the same width already exists=
 in
> sun50i-h6.dtsi:183, so I left it matching the surrounding convention.
>=20
> One implementation note worth recording, since it cost a boot cycle: the
> DE33 mixer's three register regions must be named "layers", "top" and
> "display".  The driver fetches the latter two by name, so a wrong name he=
re
> surfaces as "invalid resource (null)" and a -EINVAL bind failure several
> layers away from the cause.
>=20
> Result on the board, with the two driver patches also applied:
>=20
>   sun4i-drm display-engine: bound 1100000.mixer (ops sun8i_mixer_ops)
>   sun4i-drm display-engine: bound 6510000.tcon-top (ops sun8i_tcon_top_op=
s)
>   sun4i-drm display-engine: bound 6515000.lcd-controller (ops sun4i_tcon_=
ops)
>   sun8i-dw-hdmi 6000000.hdmi: Detected HDMI TX controller v2.12a with HDCP
>   sun4i-drm display-engine: bound 6000000.hdmi (ops sun8i_dw_hdmi_ops)
>   [drm] Initialized sun4i-drm 1.0.0 for display-engine on minor 0
>=20
> with the connector reading "connected", EDID read correctly from the sink,
> and 1920x1080 among the reported modes.
>=20
> Full boot logs, the decompiled vendor device tree the nodes were derived
> from, and a photo of the running desktop are at:
>=20
>   https://github.com/BarzinL/h616-hdmi-mainline
>=20
> Based on mainline a500db7819c5.

NACK.

This uses old, improper description of HW. That's why it was never
merged. Two mixers would never work with it. Also, TCON_TOP
isn't directly compatible with H6.

Here is newer work:
https://lore.kernel.org/linux-sunxi/20260509190015.79086-1-jernej.skrabec@s=
iol.net/

Best regards,
Jernej

>=20
> Barzin Lotfabadi (2):
>   arm64: dts: allwinner: h616: add display engine and HDMI nodes
>   arm64: dts: allwinner: orangepi-zero3: enable HDMI output
>=20
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 191 +++++++++++++++=
++++++
>  .../dts/allwinner/sun50i-h618-orangepi-zero3.dts   |  25 +++
>  2 files changed, 216 insertions(+)
>=20
>=20




