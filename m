Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471681;
	b=bAp3HDEfvSuq2Cqg1YxN0UHZbpSPE75FCdKQN0NaaC44wLD1qPfv4ziHGMkRWpn4JJmL
	 zuk0hD5ryN0Z1AQEd2ewLes2wRQtn7ys9qS/UGpruFdXSy0FsL5aVNAMANsheJlOeuXo1
	 BPCRsIfCYAMFmMM5Ea2+Vma8xFhhrOsX3u3k4Ol7HD4NvXEs0g6NwGkUxwsrJDDpWH9pK
	 qY7Ts1rBFz/MLqWihwvkC7m9R9brjlWP70fiSTfVaolDd3EPkvjAhhInpCSYEauc9Mcll
	 B8VPXqw/I2fjrl+7XKwwut6m+Pj4a9Vi5la3blpJIxc4Iw8NBgIQSlgaRPly70TkVYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BLmf+VwwIVZyRMRY3t5XyJMTsjjFkvnESjr9VVfHyWE=;
	b=Dp3coBDs2dug665OkfOi85DFqIXn+Rvy2dj1A3tRXhEEpHe9eQ5iznyDZwPcT6B0I59Y
	 3IrCTmxbJXevoC+Qsa5YUq+G81gWLaoPiYYHC7iWtGBWD0/uBX8gM/TGz8ToTgrL+KR8v
	 yX2I1lSKn6e2d111mNw6QV7qWAuKBplmWmZvYygHdvWYbTuPUhRiUkTR+9+5kWdMS0nFi
	 Jm+rN9X3MSxxyQSP+JK1UglVP7hwfT/ASnE6MYGAvgA1946TPb3kYELYI/8eJRHpF0/mN
	 a1rW+U2dcMP0zoGf/31E9w/a4/d28NbCZXZHgg2BtdlCOV3pF3RcFeSsV9fHiix0FQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TnItNOMI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D584260A2608
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D584260A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TnItNOMI
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so3821190e87.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794471679; cv=none;
        d=google.com; s=arc-20260327;
        b=s20mGgMy2pbsUI3xW/Pbntnp+jy7QCiCQTQz9mLIlq9vUQuSdLLxq99T3dZ4aPhYFM
         8LuJ24D/Jc1/Qn9ELqkG9+Gk9o6SFJRsNMGdTna7mz0vFbsl7BrLIuaiQC8K53piEv56
         xgmuYvZdLmf81QdU6VQaSCWMF+K0KlGi+brfkqc1s1sTLqM76yD7+i+eJgp83wAeDQ4/
         pKwzltLDp+3bnR/dkfIeSjY2Y+H07Lm3yHSk0VcBh6G4LJudDEVz5CysyzGmOnGCTnhV
         9cHVX6EhmhU1r2dvvWW0e5Y5jA/LV6iKrsCPNJ9Yrp0g9UEd94ILZRQku8tiJJqKy99S
         tghw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BLmf+VwwIVZyRMRY3t5XyJMTsjjFkvnESjr9VVfHyWE=;
        fh=3nlr/sPBnF3WGuDlzocPPmAkn8uhmSlOqX8XIr1ahMo=;
        b=o6PD0kiIksc70b1C0uo9YrjSiLzVQ4r4EqIqOwDr4+WT4ZAouvYpP0iC2Qq5pPiZyM
         6ZkIyQ63L1NR3bqS7inWNI8ykcRCT5dAq/wCP2IJ0oLJl+LqtCVA4zTeM7y+/kMJgg1R
         F5+0irgagr0bQ5L/ameIAvzZYHudfMNHYh4GjSj09iILplbVVM4uJ+j0Glmi2lXjDTXf
         nUyz7jhIkODG8sE0eCWEgnZqNTaojxDbj5kIKp4SeJBwypMH+GslbcadqOlozTFbb9kN
         gk/CdK49RygknvPpZM+q9fivbmPko79cQA3fkalLERgN6vwc8HhmtP+VukdiziYe9fs+
         k7Hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794471679; x=1795076479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BLmf+VwwIVZyRMRY3t5XyJMTsjjFkvnESjr9VVfHyWE=;
        b=TnItNOMICxsAi60hilZ58GoxH4iWeX1qTos6GZpm4UbZyQko8vEoCKUqEVAD8uTePW
         +DNzjRWU9M9l/picJ2QUc/lloAWhbWqIYPhym5Hoyy53SHY8U/QejvgvRrZvJUYCx5u2
         faoiJERjh8xXELJw+tUccsZJ8eG3C7CzjcD0NcRYJsTmnyZLh07SxtkFK5V5CrWt4mFn
         bxIIj6261VXjcYjDykiPkIsIwV/GsRGuKQ0QjtjHQHtuqRMPJjVVo21miw/0FKmXRPZH
         lV5ItoOMavDY54hwmrsCszPynSiqdA28NIS6VIq4Xr9aC3C/oRjOdQKWhUdZI+0a9IM8
         5yfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471679; x=1795076479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLmf+VwwIVZyRMRY3t5XyJMTsjjFkvnESjr9VVfHyWE=;
        b=eJieaBnwg8T3b/YvABEagxFLHz8TRtJkivjRZRxye63dvQOXdOhu5BspJNjpzSj09I
         IvsyGmim5I5eImQBDi/3SwNLSfkyrz1RQxXL6pPCKJpdgjcsfRePB8LDnMHxf/QZgpak
         L+fdi1OA6MELNhO6vGOq5auWt3XII+ImHFnH1OXPCv2lg+T7b7J1BUfIEqzthmuaLIkq
         fZVVgtPJHP6KX/+d2q1DjmPm8fK/CKXzR+aDLONKMzSiRPcPgG6AjeTuJbe2pjn9vcji
         8Jdt6J4qaLMyu4tx8bHNKR8ncMwM+MpCRpBOeRhTxxI9vVVPcOJYanp6Q8MJC3Nc0jPw
         R6Fg==
X-Forwarded-Encrypted: i=1; AL+hErGo6ioBHmPQ7FIVddfmr2Tj+myIEBiWnKyE9Ht38gv8+yoH+v7WpiDOar8zXSsdCmcCKYrY7yf9rweV@vger.kernel.org
X-Gm-Message-State: APuU4Z9fWC3fp6kcfbuPk8Z97gTuaT6OV2pHCupeEVXvVdczQ3U9X7Kc
	+9mj9usahtWDy6kMaKoOrtEZhCVWY/HSdUvfxsRZT2JqtkS3jKdit+CMnP3TSADjTU7lbMek6hT
	DRRh7mGS6VoT1HtyxuODzyJ3XO25CBpo=
X-Gm-Gg: AYBFou0K2c68gx9oeubi171hqjJqALUQda/WQIsz53PjG6/qGXBrN6dBO3t6p+vsbxZ
	MS8H3gKdPPbYX65crbEa+s/cEX7YNu8+f/BAR9PGkVxHhWjjldYfGBU/N1tmLpvxcrM5mmqDGTI
	j9cmD7JjRTDMUM5BWMDapS3fxHrkSvD7bmMuYS44rFTgF7LnZ5TbF5nqTKSP5w6wNTMVcXBLQgg
	+Hzg5XaCts+6p9egaKXUxHAR//4czexXEf3L6vBbaFNYiXaCLNFtuLnYr7IIw1Ycn0hX+gNzkLT
	GHFhOwvDMn9cyh1PazRbKRUUaNU0b4YSQeMtnTqxmATvFP1PeCVm6Mh31lNY2E3PqpKaVtguUHt
	35GIIT8Br41czYzRlA8vDr3Q63oor+8wa2Fx9Udys
X-Received: by 2002:a05:6512:b14:b0:5c1:57ca:cf70 with SMTP id
 2adb3069b0e04-5c15d54550bmr1547851e87.4.1794471678774; Thu, 12 Nov 2026
 00:21:18 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030013135.158157-1-dc_redstone@outlook.com> <20261030013135.158157-7-dc_redstone@outlook.com>
In-Reply-To: <20261030013135.158157-7-dc_redstone@outlook.com>
From: Stone Red <redstone.dcity@gmail.com>
Date: Thu, 12 Nov 2026 16:21:06 +0800
X-Gm-Features: AclHuK-cdF5oOUlIDnhrvyKamG8d-Gg2BFIhhq-XgEnlCunW0Y4quLSUyzDkQSk
Message-ID: <CALkEBszG9OeUPEFcL9U7G6ahMBnrbkPxHFiRKNA5x20_t8C06A@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: sm8250-hdk: Add PM8150b LEDs
To: andersson@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	ShiTou Hong <dc_redstone@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I haven't seen any updates on this series for a while.
Could you confirm if it's acceptable, or if there is anything else
blocking the merge?

Link: https://lore.kernel.org/all/20261030013135.158157-1-dc_redstone@outlo=
ok.com

ShiTou Hong <redstone.dcity@gmail.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8830=
=E6=97=A5=E5=91=A8=E4=BA=94 09:32=E5=86=99=E9=81=93=EF=BC=9A
>
> There are 2 LEDs controlled by PM8150b on sm8250-hdk
> which are not added in the dts file.
> The LED1 is for heartbeat indicator,
> the LED2 is for wifi activity.
>
> Enable the LED controller of PM8150b,
> add the LED nodes with proper triggers into it.
>
> Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8250-hdk.dts
> index f25447f1d..58b58fca4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> @@ -7,6 +7,7 @@
>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include <dt-bindings/usb/pd.h>
> +#include <dt-bindings/leds/common.h>
>  #include "sm8250.dtsi"
>  #include "pm8150.dtsi"
>  #include "pm8150b.dtsi"
> @@ -618,6 +619,24 @@ &pcie2_phy {
>         status =3D "okay";
>  };
>
> +&pm8150b_lpg {
> +       status =3D "okay";
> +
> +       led@1 {
> +               reg =3D <1>;
> +               function =3D LED_FUNCTION_HEARTBEAT;
> +               color =3D <LED_COLOR_ID_GREEN>;
> +               linux,default-trigger =3D "heartbeat";
> +       };
> +
> +       led@2 {
> +               reg =3D <2>;
> +               function =3D LED_FUNCTION_WLAN;
> +               color =3D <LED_COLOR_ID_RED>;
> +               linux,default-trigger =3D "phy0tx";
> +       };
> +};
> +
>  &pm8150b_typec {
>         status =3D "okay";
>
> --
> 2.47.3
>
