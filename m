Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254591;
	b=aRzsXN3w5+omtndhzRt3Oh/upn4dejs8aFwIJA06R0ho1hb+Xfc1MpttdgUMWUcu5da7
	 J5icUiUH/J75LeZ+zs0de6JCdtckT27trwTO03SFb21QYG5UQMD4nEWp2JcfqIQEkRIND
	 mdcfDH+dQ+lX5XRugJy4U2dfYobr5BBsiGmnSjHfbzm26gisqG8gXtOYxNQN7sWWXDKgZ
	 0lxyXNYyQ4iZV8s8IbYsc9r5QbIucHzDgV+bnyqnHIoy5HzDn+WCoZMz6NgtM1DRz0Yj5
	 aBqC0n/SOaVj9znZN5NGiHFPpsYV2VsDq9SVEL1098ZNDP0Sc6oNvIKJe4lUPcpKXxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aR3beDR8KYIb6sJCWpDOl5ru/CgbY92xumEMG9nL/kk=;
	b=zVA2GVUCljhWAg/PHnLRd/JdGGJDA9hgDH+gH1J+FK3xc4byl29FapwdaN1mU84Sg3J2
	 fOzZ5MTf2flqnqwKKw3+4GfXZsbCcmJlR8TpBCNQ78BhBtd3uXH2ci6PihmiSpI0RgCVg
	 2ExhlQUvO5jLh7abedpvjjyC7KiLckwrLv/X8hVcQLeQ7WpWoKvMV82wYq9kQOyJRzpSE
	 Cko188rHb4vsIIp/ADCUzYyrRrxxU0esCI3RCm2ZyBVJmgMlwbz2OOl0cgxgcWXfo1TY3
	 mtxa06DhbUGgutrC/BIu7cKsFB7t8l+4sNx/hwYx8pcY7iZc7df2nvPQX44wehc7fbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pauqGAB7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0127E606A333
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 20:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0127E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pauqGAB7
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so1436886eec.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 12:03:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254590; cv=none;
        d=google.com; s=arc-20260327;
        b=soFInFJGDgT1ajgJMVMEjgc4J2ABH95oXdbY1FQamp7+Ihb3izxyOE7sPxvmxukaLJ
         Qkk9JGfxk8D7rGnGjf6r6duYngAH5unedSBVHTjlfqBzSui/WtANzWbPn2LsF2JRYkgI
         Cy/ooA8D5ae+4npAiXSrQf0MLE3xbOCLkv7lE6glvgRdYafHTD8mUclV5P8C07bDRc85
         V55bg+gllQEt/GmHz52UOdSXpKyQcciGPylQ8JOLHQQoZNUtkIJ6g4VGLPgKvJpCGO6+
         hbo4TT1/KFZiZVQRSp8xcogxG2krl1hdbYT29ioMERP6AWDtl6zMrFhbNdGAMf5h6K4k
         S9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aR3beDR8KYIb6sJCWpDOl5ru/CgbY92xumEMG9nL/kk=;
        fh=SgWlPtReAcrNAAMAtyCY2m7Ce/wUMDYRbxgMIxPjSUo=;
        b=TwZqrUNZUNvbMgy7VYTmue9H6gTiKVzRiG9OQCvg8fsHPBnziagVehaKnUVo8pTz/u
         oshcw2ateXsrs8phqxDL2PFbW0B4sZgc+elNhV+8yMCLy0e7TvDoE1iC2y7+t8d9IZLb
         qNTIFvo0efS9q2WDWQoqJG7OJQUqqrIH5ZCvHvgU/ztOsTEohUIUlqsFtH9gSo5pRPu+
         2EhviSSqYwAbA+uLV3RV9cclHsjwkOKtzY6FaFHn4DwhamMwA8PGZQg+tUU1J71u2r3X
         dOCBtRLPzaGV/HrIeQ9OMqq2nZ3ehZ+vN3cBSv1D0dkxuV/Z+/sg77DnaRbZTQXN52ZF
         Yc6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254590; x=1794859390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aR3beDR8KYIb6sJCWpDOl5ru/CgbY92xumEMG9nL/kk=;
        b=pauqGAB7iW8WqVFpP3B78xmoTnLrN6p5ndZ9lzti28u0fMNqiPAIZl7tQjR35aBPtR
         n754fi3Oz9sOzHIdpeuKGNI8LLC3kVK6pFWXDDzeZtVj7Uq+tnlRGCqj8wqNSVCBzFvz
         lpTjdMT6vg8DVIRGjEQKQvpIet2iMpJvuEBW4TIcG228V5M7x5ujdnKOf3QNAQIRwupp
         e4nuPDscdY4/35v1c2t02P/1p1/wXoLCL7+M52Ff4BnPgvfrEsQEcM5tyK/xPt3pYySK
         39Qz+9JgtfvdOfP7vE4PkPQdCZHhbXxm25uhzZ0Qq55lMrk7YZP7gMGLxoA2p4ucI7R3
         iLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254590; x=1794859390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aR3beDR8KYIb6sJCWpDOl5ru/CgbY92xumEMG9nL/kk=;
        b=YP/FsoxUp9sAKGfbyZ4sSEGT7bcJqCM3hIrlweWBq+jnRza0uBLtuYiLnRJ1BVJ+aU
         /qhh1HN3BlnxGwlM9IzCRBpoBcL0pCaginuHwuCM4FaXQhJH8V3mRvccBO+KCF0hgCmD
         RF8V3/4Xgdwa8YtSjXmL3o7pO09tRbN3ZkJVBrbFgIjzhb3gdqJGZ5KInUIIgji77LqA
         eTGldGX6zAIsFA67VIkbok4TPh+anq8113leOhrFCiMDq8Qb1zFXnH1xWjt1phYEktR5
         dTe/esjfW8jy10zKdvgv0EfsIIyaMoHzrYCg8cU8y/Jw4K03OLA56dfQYyHK/jSAg7xK
         LcCg==
X-Forwarded-Encrypted: i=1; AL+hErEHYHNHsQJTXAlZW5USkDCaxQmc/sjDAt7TCFammffNYYZWiXUlQooTKrOEATcNeqyVJmPtKTm4pFJB@vger.kernel.org
X-Gm-Message-State: APuU4Z9i/yanNZv665kDhSb2fGBTjOH5x78z0HHnS5m1EfNTudoYloCb
	btKXgw4oyWkeN0hBEIIgQnuKX4XaVdsMHqFmD/4NZTQ+sOAdIlwcBf4UtBxK7MwQeYI9t88qvR8
	fF5Bb0ndxKxFEtVa2qc/d8rSOVVQibBs=
X-Gm-Gg: AYBFou0dOBkogHjoiTay0HadXDAVEKOA0Vf5vr7HDTL6BO1JJpTbAKM2OYn4Jsqcs51
	llmFOEdYvEshjwLsgWswNRIANkkCwNQZTG9gXVXY4eZex1CrLi2y/bOxpwwSottwCVAlIEvLxEZ
	+xBelojmH2M2nAWji/vRgVfWtjbcuc7I2mAcgFJaGse5aJw8Wv1TGUs8Vv/UMG5vLGqTzdFOMiC
	PdnXIhK4XuA7QNpiDzjS+0SMox/ETfZJ6unwKcaSq9ZS81Q695ciwkwj5k49TVOVvT9D7yznRwE
	w8v7NNqahSn9lRCrYXUWBD03mdDbgSwTaUG7jNo7K8kv2HqnrQfG4YYYwP5SaYDIolR/I1XV2PS
	F8OmyeWcaw86DCC5tzu2Y4rAzYn6nKHn7HiCf3eBYGOAazpL7rYDu3olkoErV1s8gq1cjYeG/HH
	a2fpSgCaEzxrszDYm0Fin6n/bCYYnKKg==
X-Received: by 2002:a05:693c:6407:b0:36f:65b6:d137 with SMTP id
 5a478bee46e88-3751f45ff37mr398564eec.24.1794254589952; Mon, 09 Nov 2026
 12:03:09 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109184654.462128-1-robh@kernel.org>
In-Reply-To: <20261109184654.462128-1-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 9 Nov 2026 22:02:58 +0200
X-Gm-Features: AclHuK8Ot5ZO4cc4X4se4NcLqN__nckTkG3zWRI4jvXOHVz-rvBOJ38JU8eIc74
Message-ID: <CAPVz0n0qTnbERGguriGSn3r+R1UnLAo2hFSenC7ZC1S7a7yF8w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: max77620: Add gpio-hog nodes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 9 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:47=
 Rob Herring (Arm) <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Some Maxim max77620 users define gpio-hog nodes, so add support for them =
in
> the schema.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/maxim,max77620.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml b/=
Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
> index ac063c2bab73..99014b792a74 100644
> --- a/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
> @@ -165,6 +165,13 @@ properties:
>    regulators:
>      $ref: /schemas/regulator/maxim,max77620-regulator.yaml
>
> +patternProperties:
> +  "^(.+-hog(-[0-9]+)?)$":
> +    type: object
> +
> +    required:
> +      - gpio-hog
> +
>  allOf:
>    - if:
>        properties:
> --
> 2.53.0
>

Thanks!

Acked-by: Svyatoslav Ryhel <clamor95@gmail.com>
