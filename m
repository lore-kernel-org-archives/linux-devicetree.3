Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932926;
	b=ISSf2eyoN5MoKNQnZMr/IuzaQy3UjTrxp2qvB3/MkuktxB7kEvGI43gTx3lwBBQHsOjd
	 Q4SxJrJ9uuS8r0dvDp03V5N7wDCSCdKs7h6/bCx6Vde8EeSRJwSFj1ObHrPw8hZAo5tBf
	 dLEJQlnImPqrjyhSofO8p4NYxGc2yC+KYDhXKdkQZjBnOwW/pV5i/ECT6c3BKus75HE2H
	 6L1WE5Fx9oOT3CJBjLb7q+QLVGMw5yTQDtQmVjlZ6ygquDJvynB9ALX7CQ9E4E1FLwf8u
	 m9u4OStmqarZ8zVe/VMWgK602LPRGZn9cQJZs9JAREBZUCtt9Dv/NgVAOlsI50yGxsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932926;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6852XYg4nQB/at/PLi5oS751NBudRh/wjJbfpaCbjiE=;
	b=bGYXSmKAaavcWC7UrJIgtLVdAWtb/OPUznajtoZo8vN8Xz9icLy9VhqK4h19d00g/X/p
	 Z+nHPbpJ5AQouvvrCcR9qZjX7Dc6K3NdcQkiUuQumOz8qfMM1rDL2Bzp/2Q3f3S2ZDMnf
	 vgwdc/W8N/zdGaFvK41IM0iLI1xhUlGai6DjU8gXSo2LLOu1UK2oR6ek7a1iu2T92JTvc
	 Nli1JSpMeK1wthXHzCPPx2rKMPJCuwomD+mnTe337AEkYgV0fTucauSuXa535aVcSkTsT
	 n8SW44FJkjBEL63mDznEwB5jRHLPvPSpys+j6dC1TQZNdZIExIfAUDfxLaUKS2bYonw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD103606A32C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 02:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD103606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab53a99771so224221fa.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 18:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932924; x=1794537724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6852XYg4nQB/at/PLi5oS751NBudRh/wjJbfpaCbjiE=;
        b=nHLfSvmPbpXyHGlzxbH16A+EP09GeZZPETJ0gXtjG7CLjjN459/8jTKqEHOiDkt/gj
         EMdjAulnnZAmD3jh2s1UCpUEKcgPxTlSJ1pwK7dtQoY48u09lF3MRfxPSYELo3Fdd3iE
         0X/1j4bd+4dSk+TfGK8lMd1WJYWMPmmwjD3KAjNMlW1p+ucmj4cYqkvTjbcstWvygFDB
         jHuFN4U7yCHIpHlWi0R9DUSqUgbnbfL0C4ZazGn8hRS6JBAQIIzQCVgmfBfcyKEYJJUf
         qNgkELHXz+CPrbUYmvD3hZ6BlmX0uR7ISLKM09LSovwVt9vD13Z0ZG2wti0Z/DrApTeq
         JCEw==
X-Forwarded-Encrypted: i=1; AKwUvBwCJuHsN8QHO+MCr+Jze7j79ppkiYzo3Fx197egJjDnZJxtBBdc2cgffcTpH0XAkzFsIrxs/IOfVTYF@vger.kernel.org
X-Gm-Message-State: APuU4Z9v+N6P5tJL0AmctRRTDb8PDA0WiGUMIIu7NNT5w29eTpDMbAhP
	AMVHjpIXFXemIVa8J/9b2pK9lyt5XPfLO5ThAhd8utS03rXgLsrsKpyyj8F0ut0LEgasjA==
X-Gm-Gg: AYBFou24n1PZaovXHtaF75DCVVdV7YbxZDFkMbM7FbPwIikgvR1JkSXaH0j6eqbIIob
	oatgx0z5BdSEo/Xu2+MVhOwj9mftrFx1LlCKbhwL8p9l51VcijGdImjFNwiDPo2HYUmauHqATi/
	pNoKiGqHMAI3CdrxZecAGT/bKxwlp3Pwar6J5RToLq2lwNVYhU/FEW9i6GlxSMzz1jLACuNNEFx
	HNRKUGbGLv6DUs/gbfJqYwqiVYX4r21TDjlnYXuIWj6oss/K5hM4Nj0S7rsGOjE8s7Gn89E6EhT
	FUu6DjD18gorb4UQ9ABJ7/Jyo3CfYzLw2zfhvr9HUBT6nUtONDck7b5KCJPqOJrXcaFr9O9i3xN
	OW7n/MNYYEPBauN5SBiSgVNfjndHU7bcM4k+8OGWq7NUM/kAOkVVRVRqL/laTNO4kT9l1LvQQbC
	HOoQ4wyeNsFgi922vZTwE9ihkVCwgm4ZzSUa1swNxwWkC35vcUSu7yIplwiM8JALWCi4h1dDEOi
	Pj8iqATNB6jkJ748vPmOom5U15f5LwV2ikchRhpA8wcOdGqFw7yjMKvRZ8ovfAqUzVBRSXwKAWM
	uXNIK0l3ClEl2kxHvanHlzPuU6lux8YR74+ySGxG/ib/+p7Jr0wDL+4SKHxaV6u5oEf6aJ0=
X-Received: by 2002:a05:651c:a32e:b0:3a9:c840:10fb with SMTP id 38308e7fff4ca-3acf38960fdmr2273161fa.2.1793932924029;
        Thu, 05 Nov 2026 18:42:04 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acf5db587csm773421fa.19.2026.11.05.18.42.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 18:42:03 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ace2e3a2acso959561fa.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 18:42:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByl2jZMmQjsRJ4T/NL0qUTHoDuEw/YrieK3Kqgb4mur35FS/GwRo3F+P2vEKctgIr6naZW4rF4jqgBc@vger.kernel.org
X-Received: by 2002:a2e:a80b:0:b0:3a9:db75:823b with SMTP id
 38308e7fff4ca-3acf3b2b509mr2161401fa.17.1793932922440; Thu, 05 Nov 2026
 18:42:02 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-3-7a9534a9a22f@andrewgigena.dev> <a83a948e-3430-4133-ade6-b30045b8b186@linaro.org>
In-Reply-To: <a83a948e-3430-4133-ade6-b30045b8b186@linaro.org>
From: Andrew Gigena <mail@andrewgigena.dev>
Date: Thu, 5 Nov 2026 23:41:35 -0300
X-Gmail-Original-Message-ID: <CANn8Umedp8s=rupOkSdi5NBxOE8AUnWSvfyeQsMSohZG+Hce8A@mail.gmail.com>
X-Gm-Features: AclHuK9yR1l3Ka6EneLFe1X-dNaa_gcGDfVBlZZtGQ6nC7Dgsgyzy5WyWv0PGgw
Message-ID: <CANn8Umedp8s=rupOkSdi5NBxOE8AUnWSvfyeQsMSohZG+Hce8A@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: qcom: camss: Add support for SM8150
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for checking the 1.1 sequence and confirming that the upstream
one is fine. I've fixed the ordering of CAMSS_8150 in the switch
statements for v2

Regarding Sashiko's note about the VFE-lite clocks: I confirmed it on
hardware. Routing the IMX363 through CSIPHY3 and CSID-lite1 to
VFE-lite1, the stream produces no frames and the clock stays at
19.2 MHz without the extra match. With the match, the same path
streams 10 frames and cam_cc_ife_lite_1_clk goes to 320 MHz. The normal
VFE0 path is unaffected.

I fixed it by making the driver also match the vfe_lite0/vfe_lite1
clock names. Since the same problem affects sc7280 and sc8280xp, should
I create a new patchset exclusively for this fix or include it on v2?

I can send the small media-ctl/v4l2-ctl script I used if it is useful.

Thanks,
Andrew

El jue, 5 nov 2026 a la(s) 6:44=E2=80=AFa.m., Bryan O'Donoghue
(bryan.odonoghue@linaro.org) escribi=C3=B3:
>
> On 04/11/2026 20:54, Andrew Gigena via B4 Relay wrote:
> > The hardware reuses the existing 3-phase 1.0 CSIPHY, Gen2 CSID and
> > VFE 17x implementations; the CSIPHY uses the SC8280XP lane register
> > layout. Add CAMSS_8150 to the version enum and to the shared code
> > paths, then add the per-block clock, regulator, power domain,
> > interrupt and interconnect resources.
>
> That's odd. sm8150 and sm8250 are proximate both seven nanometers
> sc8280xp is five nanometers.
>
> PHYs are about converting the analog to the digital domain and so
> process geometery - ends up making a difference.
>
> You can get the PHY init sequences here:
>
> drivers/media/platform/msm/camera/cam_sensor_module/cam_csiphy/
> =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_core.c
> =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_soc.c
> =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_dev.h
> =E2=94=94=E2=94=80=E2=94=80 include/
>      =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_1_0_hwreg.h    sdm845
>      =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_1_1_hwreg.h    sm8150
>      =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_1_2_hwreg.h    sm7150
>      =E2=94=94=E2=94=80=E2=94=80 cam_csiphy_1_2_1_hwreg.h  kona/sm8250
>
> https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kerne=
l/-/blob/LA.AU.1.3.7-02900-gen3_gvmgh.0/drivers/cam_sensor_module/cam_csiph=
y/include/cam_csiphy_1_1_hwreg.h?ref_type=3Dtags
>
> So yeah going by the name that's CSIPHY 1_1 same for sc8280xp and sm8150.
>
> Hmm so much for my understanding of how dependant on process node these
> sequences really are.. perhaps the PHYs area fully synthesizable in RTL,
> probably.
>
> Anyway.
>
> The one thing to do here is to please _verify_ what's upstream now
> against the tag provided there.
>
> If there is a divergence then we need to upstream a 8150 compliant versio=
n.
>
> ...
>
> Actually its fine, did the verification for you, the 1.1 init sequence
> as is upstream is fine.
>
> Just please tidy up the ordering of the 8150 switches.
>
> ---
> bod
>
