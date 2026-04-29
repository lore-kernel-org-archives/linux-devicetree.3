Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FAA10F2
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 01:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777426687; cv=pass; b=BLO7cp0f2otyQDjCdc5dO0wiVUOls0AhtRa5u7qYkAU4Gkjp/GhnC7T2pY5Y6/eukdgOIN5ASRFB0tqHlJqnUn4Jio2rPwmbohqw5XxadJVEW0iMg9fDW99AUu/0hebp1za+ltaZvKLkRPda4FU6Re8c9YcwbE6SiSTwmZG38m4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777426687; c=relaxed/simple;
	bh=TL2tkeFOgMZcOO+5OqeSu09okkedmEhoLbRE8Fw/jV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dfPdJye6CXkWR6NrRXMhYO8M13bP4pHo/At9/817Mb6sasIAKVdHmgb0yvAN3oYJLfP2dbqJ8m27z1DzqbCrZr53JFuf22psz+dCiIdAaRybCvrK2UwM1R7vQYrDyQ/CAkqmNHD/Mxr9f5Rh0B7/vrY4Jx+2rrmUht7vpsLENo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsS5ynxT; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsS5ynxT"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38dd9f0fdc6so4729981fa.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 18:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777426684; cv=none;
        d=google.com; s=arc-20240605;
        b=Tgn4EX4MQRIsHRFm6FEh/0o284Asz0IROYy61g4Bm1zZ3Od/xfL96VJbJuETmus13x
         WcvEMGUw+GjUhvRsFtVKAQb8DgGz4HKaLjzdhB2GAn8TjMEE+GkgvpWmCdl8SJHpRUfx
         EAZbwH/erdl5vLkQeZxPXEWyYTEU5mbPeY2g96K3BSk9Q8F5UBubsdo+CHGBa9CfQscz
         z+HAUHh3xkVE4cyyVwwAZ/v10wMRUThHlswW4AMX4eYA0QCgjVu8vcAk9K78t9Ue3MaG
         ab2mDNKzqU/MuqGBXoa0Qe9LgkHuP0aDnE0z2ELBHytjQwuiUh9g4GV4W2G3y4kMbST0
         FDrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TL2tkeFOgMZcOO+5OqeSu09okkedmEhoLbRE8Fw/jV4=;
        fh=FlezxS/2YaNRbDcVjaFELVkBtQtwxOKD/Hmvco3O7S4=;
        b=VKaLt4nTsA+i+ilTl3afhHiBUl40WvTrK3qEVRAWMKvaGyM7GZrGMZZiU2ggyQ8Brg
         EvaGYw17ZRwUzzrS5WD87/wTLQsPraJHQvHQFLRpk7eh5eV5LnZIRGgl44fVEkoJ0Zo3
         3QflalQkrl2gQ9qE/Dnfa+T0H8icEV4cw0sWXfYXRB6mrJLl5koBOXVtuPgzMmh8jJVm
         gDFRnUghG5wVyIUN9e/dGGgeZEnU11wuDOontJiMSNTZ5umnJJEq9ZVkJ0ydN/plev01
         EiWsrVF6LhOs9jrjJxlyFofGMHQ3XwKyl7O4I/5JceyYm8xR8bC7KfRe5WEmOCopcn1R
         jQAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777426684; x=1778031484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TL2tkeFOgMZcOO+5OqeSu09okkedmEhoLbRE8Fw/jV4=;
        b=jsS5ynxT7Aw1ws1FGs+q0Ah3m/eBICDORVM0HryOcAHACS26qCVFE8hazXjuBxBy5E
         KVXD/PGH5iWr8su0azrfW3RWh2jxY98yAdsmcNAJLBP2wyLmxAYd/suu6lGY6FRven43
         kdHnfQ3LMhLaff89npOf3ki6K65nIdN1MUKNzvHxYa8M+t22ySew45nNuCnTc6KtVm0B
         hO4D9uneHPBKW5WfF4HeEs8i/4Xxlk4w0wgHqMumDg8pt0NA/nBrsYMyYUJkHcOT3HUJ
         RCi8pDK2YFqlc+rkKLPRTp9gXL1z8hlYnrWEqKwMQePwONT0L7EAqwiAx9wDQuxlpSQ7
         3VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777426684; x=1778031484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TL2tkeFOgMZcOO+5OqeSu09okkedmEhoLbRE8Fw/jV4=;
        b=XVFcTuEPEPdGZ2qhLbvZEniidoTrd6PPFPK6No+YR2np71Lon5sJIBmWVZxS3fzy4b
         EI/sLczHcnwm+GzYUjiQc3lttI0DYh9yi+rXziEwZl5bKJ0TM2+TIM9J3Hlvdw1WbUNZ
         5WHR9N0FWhM7+4oGYIlE+W2ruaLTxw+74uemIlgvO95k2pNCUQ9EeQUZAAMd5IyqLQpE
         6hcJ/4frP1ioZhBZQZvE0LfheecJQFTvdRejNXFx2Zd3oADh26P+aAcSjMIW5yPo/oSJ
         Pn8leLCjB7xwSXRsU6uFPOh7EZBlPCMV4z0lJeusumPc6rFhc8wx2bt7LEVPBHh5HL92
         XWow==
X-Forwarded-Encrypted: i=1; AFNElJ8/3xmESriTMtDH26EHAz6t21+9OM+q7qS0dCXgquf/Li74iSS3b6WxRKbzFAuqYn8SN6rFZmkTfBu4@vger.kernel.org
X-Gm-Message-State: AOJu0YxsokRNZGrt8qZCNqgaun1EBBqVFnZb/WZlFlkkz08bm2uAou4w
	KLXLIHCbPJT0AcrwBLgePcw1VD9Ny94f31lsJHAwo/Dbf7Plw4vn8+b0LwPVzt8joVJqtudqzpt
	x836nLOyJ/XanZIQk8aQf40WoDYOqMsztQQ==
X-Gm-Gg: AeBDieuR2318gFtg1+Pl1nFFtfxlocE11X5rmZfEz4un84GGsCRwlrQfNXApEI70l2D
	DqXDinuUOSv7sGdP/q3BsU52j5pjoZKo51ut9scI38K/l/oKzg6FUSFgjrL8//0WUAOqWU8qUk3
	qsszZgG0LClbm3nx0yJ2Wxvgkb/dRol52SINvqmnKr7mjLwrBuVIXNDTuwkUY/xKfk5KBTDPTd8
	7+mZJarbFW7UMUO8thMck85OWerjfae42VZdR/2X6gcsW8cHGMeK4xSpn+2SJcQczZ/m+z9dGhG
	S3TTTG6Hl1gxxOft5VcIJ70iumBFJ4jHyQ05jfZC5MOVeirdRryplfSkJmfXHGuikBrukyBxYWh
	X5UPWHw==
X-Received: by 2002:a05:6512:15a3:b0:5a2:a70a:a9e with SMTP id
 2adb3069b0e04-5a749fb8b0amr382100e87.3.1777426684004; Tue, 28 Apr 2026
 18:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-imx95_frdm_pro-v2-0-434240b652f4@nxp.com> <20260428-imx95_frdm_pro-v2-2-434240b652f4@nxp.com>
In-Reply-To: <20260428-imx95_frdm_pro-v2-2-434240b652f4@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 28 Apr 2026 22:37:52 -0300
X-Gm-Features: AVHnY4KSxb_H5o4trd0JTtQb0bsTzoHjYoluGAlKyA5vbmz4I0-kLq2-xvoMmcw
Message-ID: <CAOMZO5DV4Nnc+7DfAZT-VYDqxniz=ROR4-DnH3x9NbU4E8d9mQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add i.MX95 19x19 FRDM PRO
 board dts
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, xinyu.chen@nxp.com, 
	qijian.guo@oss.nxp.com, justin.jiang@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 5:03=E2=80=AFAM Joseph Guo <qijian.guo@nxp.com> wro=
te:
>
> NXP i.MX95 19x19 FRDM PRO is cost-effective with extensive
> expansion capabilities based on the i.MX95 19x19 SoC.

It would be good to explain the difference between the i.MX95 FRDM PRO
and i.MX95 FRDM.

Also, does it make sense to share common nodes in a dtsi that can be
used by the two variants?
