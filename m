Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D0613A258
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 22:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791585983; cv=pass; b=pyV1FWJB3MiWwRYWLYSPVKJ0x/ZYRltjx7A8OLdlgj7u61Eb+f/htlClNrU6VHmbV3fJxzbv0kpUkyQKH6pteo4HUELP1z+zCm8s3s9HvBgyX5jd5HMop2ztMVOGnUb+IoA48StifdoCszZGTXmI3GxeiR5F0V+PHs2P3qMgbsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791585983; c=relaxed/simple;
	bh=4KLRhiuXd6vs87HrQdRYKVSaRN0S916uaxbSgL9ZNic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWpV661jQEp6Vd7LWrlkHtUeymExVSSFy/9m6E/z9NfR9jGQtcgPDRoJLx2sA3tCcXPynCLguQMR0wYH2oTBgDtb0ds/VRi7fWm6hbyzpaCTGDz+O/OAjDdu1st6cxeoVml/CrAVwGRBcq71iy/u5Q9MnYUOJHqOWZzFtKejdmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YneIEVgo; arc=pass smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YneIEVgo"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-49e13495e5cso1662761fac.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 15:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791585981; cv=none;
        d=google.com; s=arc-20260327;
        b=DLR2S8T4TaD/akkjtWszpEZX7d6GFQxPJrEE1qznuRCGkCbDeBd6YGi4p7iR+SQcKu
         sIKTtf21DaLon6QbOVIESKqF1xdvJLA6hwrQ02EEGJsZ08CkZJ9e43mUD+EoaZhRVLhr
         Mr9pso4EnSjMWEZDmlWU+/3Mnhq079kO6+cs6RLEyZfQKS9nFSXeIZmRvrOBgxM7Hi85
         yTq9hN3Xgbjgwk3m3qNRkdWcMHN67E9XP3ojTxsDCAEt0mFOAjdoXq4GmoLdNAgbxNoj
         6QYsPfdOzwgqUZJCxPmMcD666Q0E9b95joceBZ8JrgON7MUcNCXwcSGqJtkkebg9/p+n
         x1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4ehjg9tbNZBPJeJol3tfp+R4B/4a7dVHLZ3bjJzX334=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=lH4ebm6dxHAhfEOS2go0HCJbMMMgp4R03erHFAiDyWe8eXC4uzbyX1vmg22a/9ktVz
         whuU8l8wYccdbf92/7ofyGe8IOzzanx5/JjVMgBGU8mWOo0aOKBMD7abUF9E5gzP9/F9
         x4WKNmHfcK6wCwbDdx89mEVJilqMFngHHWfE//F3jvL8URNBMVHaahrlv0cldp2gr9FY
         RhlQV+nnlCFzF7xqcc0M4RrMHzF1HElxWhMwRE12EskFpaDB+2HymXoBIRt320HtIbFQ
         erKfeBrtA9qHts8NSONfCC8Hehz6B7e4LVF0bfEbkYbWRIW39/eh6CqbvYeJbH0mNdAL
         FQwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791585981; x=1792190781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ehjg9tbNZBPJeJol3tfp+R4B/4a7dVHLZ3bjJzX334=;
        b=YneIEVgoAG/MK981Z5/bQFR2gzWTgNzxjWEIpYfySbhVbypojxUlYFB3Q0sfxogrhf
         Pvctg2pwcoGFbnSsy9wvf0B2hlXgZf3fXxTLq5VEwmenCaUciYV8JSbZ5rD7w3eJiegr
         C2qoqPS1VCTSXxyrC175cD8FlX/r69MCXGaWg7BCNPOlFDF7sQ1/355J3AIFQoAXLqSj
         0mgc+pTv3WMhobaPyIbnHENHam5eGsRR6H+oZE3kEFLAx7jtXD+S9bK+FrZTAC2S0epF
         W0i7cs7Y3Y1lfWAjWTvobGnATzfJyD1Q6vTXTVQBmfBlGO/B79MysoYhM9Wwjka+NxnU
         4ATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791585981; x=1792190781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ehjg9tbNZBPJeJol3tfp+R4B/4a7dVHLZ3bjJzX334=;
        b=aI7WUPw2EcWTAIlOt3QEWMcBhC6vISlpIZP+UU5WSX1wT8bDkcnuui6RrNcRcY91I0
         a7kP7K72jmlkwlSimF94kXMkJasJRxpjqi2TH2gDf4Cq6NZkjXaDmsB/iEJzQxZObsa6
         6+weAE7GO6GhgSFDm7SA9EwMXM7/fjX/GFfECT5z2BmzRPZQPguKJAjxy6cj9ukgmTw4
         3ztKcEeqfzGNJtgAjxYf9JyDUlg9Focv4XXFW3El0TyKyF579s2LaYO/iEWjaWYvTk4Q
         CY7qQC9yft3Rkr1weGuBTLToYzKTVcM/mhXmQu+Nco2HFTuoAhe9g4HHFrdzwUPa+Nca
         1HLA==
X-Gm-Message-State: AFuF++m/xxPgAXlCeRTHpgo3yQnppMLjtE8fWooni8t6NGBvgLiqETIz
	Yaw994SruDe0cS4NYV2pCBwIbVMiIa4W5TVAbPUQ9ygDYD11ZdBGqFqurCh0nuu3budLotrYdDy
	IgeAkGWBgCZ4MzLszdTHRbGJNeMPuZD0=
X-Gm-Gg: AYBFou1t869bWttUXB/xoNy4bzsIJKLMkReb8/xCeqRlTUXWy1AyI/ABZLkS2IB7JmR
	siSdU3KoEki8QHXwIL6yWWxcEPMVYHfWP8XLt2R3frHaShsyrvWJDizrV21N/s5hxoyJFk8leLi
	2Fu9ynIhRkC+a+wTTA6p/sWLjVaoVsEdc3179qfEiTc4mryjgjZO2zIxb2P55Z9OLu9qnxMkM5B
	yVLP4Mesbz4to4B4UnyMRy6753DbRqQpmkKirqRLiFc1z941MvRyT9I1oL/P9fs0vxZe2gtDXWa
	TpttV1x+SB7wTYDhw7WpOGULW9y1B3wZ19j1nMDfPU8auVuqTU/Ch+DAbM61BLiS5p15otniRnQ
	+yPxjaK+LykIM4A==
X-Received: by 2002:a05:6808:238f:b0:4af:aaca:7be3 with SMTP id
 5614622812f47-50b5c9bb14emr2445879b6e.12.1791585981270; Fri, 09 Oct 2026
 15:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009214404.722628-1-mmyangfl@gmail.com> <20261009214404.722628-2-mmyangfl@gmail.com>
 <sashiko-outbox-166096@kernel.org>
In-Reply-To: <sashiko-outbox-166096@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Sat, 10 Oct 2026 06:45:44 +0800
X-Gm-Features: AclHuK9BjguRECGBQxK9DXsJst-8IVoz5PwlgnNbwjYRPBtx-f5QOL3eB7nDJO4
Message-ID: <CAAXyoMMwUqwgyPXyG=zKqn1hkWeg769bPrwwWF=fNo0G7dzoNg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] regulator: dt-bindings: add hi3798cv200 regulator
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 5:52=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> [Severity: Medium]
> Will this strict constraint reject device trees for the other supported S=
oCs?
>
> The description explicitly mentions support for multiple HiSilicon STB So=
Cs
> (Hi3798cv200/mv100/mv200) which have different voltage reference designs.
> However, restricting the compatible property to a single exact value
> (hisilicon,hi3798cv200-regulator) rejects device trees that use SoC-speci=
fic
> compatible strings (e.g., hisilicon,hi3798mv200-regulator) or fallback li=
sts.
>
> This prevents the proper representation of the other supported hardware v=
ariants
> without failing schema validation (dt_binding_check).

No intend to introduce more compatibles; follows
hisilicon,hi3798cv200-pcie conventions.

> [Severity: High]
> Does the lack of hardware calibration properties here cause overvoltage
> in the driver?
>
> By not including properties to describe the physical hardware bounds (e.g=
.,
> duty-cycle mappings or pwm-regulator integration), strict validation prev=
ents
> defining these board-specific calibration values in the device tree.
>
> As a result, the follow-up commit "regulator: histb: add voltage regulato=
r
> driver" relies on the standard OS policy constraints (regulator-min-micro=
volt
> and regulator-max-microvolt) as physical 100% and 0% duty cycle calibrati=
on
> boundaries:
>
> drivers/regulator/histb-regulator.c:histb_regulator_probe() {
>     ...
>         priv->min_uV =3D init_data->constraints.min_uV;
>         priv->max_uV =3D init_data->constraints.max_uV;
>     ...
> }
>
> If a device tree author specifies a tighter policy constraint to protect
> hardware (e.g., a maximum of 1.0V when the physical maximum is 1.15V),
> a legitimate request for 1.0V outputs a 0% duty cycle:
>
> drivers/regulator/histb-regulator.c:histb_regulator_set_voltage() {
>     ...
>         if (min_uV >=3D priv->max_uV)
>                 duty =3D 0;
>     ...
> }
>
> This configures the hardware to physically deliver the unconstrained maxi=
mum
> of 1.15V, completely bypassing the intended safety bounds and potentially
> damaging connected components.

pwm-regulator.yaml: This mode uses the regulator's maximum and minimum
supplied voltages specified in the regulator-{min,max}-microvolt
properties to calculate appropriate duty-cycle values.
