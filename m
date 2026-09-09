Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53A837F313
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 17:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975863; cv=none; b=MqvdfO8/aENW7mIYE/2S/gY+SzGMDhRoWlwZWYyQ79jil+6gnnJNmZE1XfyQzb7cdk91xeeM4hO7kKTwmVe4zqGE3sjSTvsQXxk18AobUS3I9dmdoSoa1FimExv/V4mMJjKeHEz8djTDuB6T/fEmZbzaWsPKGo7KQdGSEsfLBaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975863; c=relaxed/simple;
	bh=BBPSyJ7/hKXWiuHVdl/yyotbkQPjOBm7iSx2qGqswU4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=JXHv+f+l2cZ2Yrx4i5ZSuGiSUpSLuuyHuuXifj22ebZHIEei87f8DB9rGMPuMNl9NGUdvbmYvisWjZxABB0WyvzmRwPAnckCAmcq9cwTBvkRqxVaeaamnmpchjZ7/OQUP98FH9U+UVGuhX3+TuHlykjYqug5lwo8EhIC3vaHzAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/uFahfW; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/uFahfW"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so49131785e9.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 10:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788975860; x=1789580660; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eIx/jY7x22dvjb/1ZwlMJ+Vl85YQ/K+5ndS2MKjSdMc=;
        b=G/uFahfWczSXXV+OX1mcjrqi/jd8rUQFjIkJCGGeb9sPpb7RAAEXGRFWvm4OBb0BUE
         4Z66VOAL+j0GKjsrmIyCh5VELo51s5HydN2fhwX5ic/D6Bw0Mqw2LggDK3fma199jqqI
         4yJwph619M98f5s5KbNeXtQlE1c0/RwVmBzNjcBNdGlP93GCURiR9AiPi2uCYjxjsR7p
         NQYAxLPdGI08iLmW5gXzM+u2+KEmlrK0PafzbE88zenJU4ejaU5Mg5w0uA8dhW4kEy+E
         PjP5aT/mGYf+85+WppMty/Q+GVkmwZwZchVkCkWiboVWNBaOI/vpfXAeCVBqp1Qd5dEw
         gMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975860; x=1789580660;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eIx/jY7x22dvjb/1ZwlMJ+Vl85YQ/K+5ndS2MKjSdMc=;
        b=cAZ/HEh0UGfObF9h46xCPJvmowCZtD6s5JRzs+JEa5+9LZerXt7L0JmNQg50WNwDT7
         Q36xG8qOD8pwsOSbZPhrHOwkjv/ioTlk9HFh5mPkhgZhQAgAh1NCFl+Q683g0DyG/aHd
         863YR0Z29NSVXQRTjplHhxiJ8IWVKCA9jvI0j8+UrFfiDUkKHH6Ifl/UH3bN8+QJyZrx
         NQnsTGtJBSfQf9JWmaSm+Ki/oJqUdK25Qo4NMOfmMZuCl+OdYmLHDs1wtsPwc5ueRD46
         ELO1pLpIuGlS/Ei1xRue4qQONk6A2PAaU2I2RtFFFjDKguJMF+xptnr5zZ9NsDGCS32R
         0GIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHiLRaqC/KI2H/kQRENiXLB2/QndHAVnBEizhuN7XPI6lWzp4LhBVzZxvCc4smw0NUJqdMkD5HFszF@vger.kernel.org
X-Gm-Message-State: AFuF++lVSe2jnshhkESTjOLxc9UUSesGTYeRP9fgE95aWBV/hw1oIyAD
	42c8cq9c19XfWodS8xMQHZEAe1cPpgfAGsymmL+1jeFH19BaIcA/4E2+
X-Gm-Gg: AYBFou1I957Q3PlVJEh9EsTLej0nHhDK1ilUI4tH8J71VGPn8vVk4WhAVcD4Nxy9UAt
	E70uhg8hUiN570uU62lDTTCqPA2ljNRlAwB6vHJQrxjxB4WT4YsI2VioECP56k85PpmbttrYkdf
	LTOCtzNzAJ5uQkwwinWYPOUTYXy0d3zroCPFWutZsrXCBKMVz9Gc31fzHkJ/fx0CSRMrg3BgqL6
	Hm6SryhKb4ryuN2/+whl3P8sBP8UpfBZIDv5P/qU00uGvvsltW1KAcCMMTKZHnYm+sDhUFn/XsT
	Fx0dlH2r1tCF9bi6DZg1Gx54RTxKpS5B9i/NI0GRz8yTnUkyRDohR9mvLXNIFaj/JYZ1yHvRfCy
	wsy3i5zf4QcS6QP1A5BibqHckfilUhYyXu+gV98Qo7TrEkcmPzBhNsM8BqGafsGFqElWTzYO09W
	XCO3Rdf5JpKqDJARMAK2EuPVVXoPXwPpA0Vq10n6w/lvnZJ0UmdC9AWYHm7EulJqLp/FzHVN5dj
	iBy12YvVzC4/VIeSUgYzC0FvA1Fmk8Y6tiuoORUvLENyuBrjp52n4Thsw==
X-Received: by 2002:a05:600c:4e8f:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-49cfa20cd1fmr333869075e9.19.1788975859551;
        Wed, 09 Sep 2026 10:44:19 -0700 (PDT)
Received: from localhost (89-74-4-99.dynamic.play.pl. [89.74.4.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be649asm6608365e9.5.2026.09.09.10.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 10:44:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 19:44:18 +0200
Message-Id: <DLAZ0JNOMKUB.3CMZBD3WTR5NG@gmail.com>
Cc: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sm8350-sony-xperia-sagami: enable
 UFS
From: "Jan Paszkowski" <jan.m.paszkowski@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Jan Paszkowski"
 <jan.m.paszkowski@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260909172421.33593-1-jan.m.paszkowski@gmail.com>
 <20260909172421.33593-2-jan.m.paszkowski@gmail.com>
 <20260909173032.240941F000FF@smtp.kernel.org>
In-Reply-To: <20260909173032.240941F000FF@smtp.kernel.org>

On Wed Sep 9, 2026 at 7:30 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Duplicate Device Tree property `vcc-max-microamp` overwrites the=
 intended value and leaves `vccq-max-microamp` unconfigured.
> --
>
> commit c3bcdc386d74df860f7d4d12d1aed983ad46ea5d
> Author: Jan Paszkowski <jan.m.paszkowski@gmail.com>
>
> arm64: dts: qcom: sm8350-sony-xperia-sagami: enable UFS
>
> This commit enables UFS on the sm8350-sony-xperia-sagami device, noting
> that previous device-killing bugs seem to be resolved.
>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/a=
rch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
>> index 4b62ee50da7be..969c8cb31df9f 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
>> @@ -893,9 +893,20 @@ sdc2_card_det_sleep: sd-card-det-sleep-state {
>
> [ ... ]
>
>> -/* BIG WARNING! DO NOT TOUCH UFS, YOUR DEVICE WILL DIE! */
>> -&ufs_mem_hc { status =3D "disabled"; };
>> -&ufs_mem_phy { status =3D "disabled"; };
>> +&ufs_mem_hc {
>> +	status =3D "okay";
>> +	reset-gpios =3D <&tlmm 203 GPIO_ACTIVE_LOW>;
>> +	vcc-supply =3D <&pm8350_l7>;
>> +	vcc-max-microamp =3D <800000>;
>> +	vccq-supply =3D <&pm8350_l9>;
>> +	vcc-max-microamp =3D <900000>;
>
> [Severity: High]
> Does this mistakenly define vcc-max-microamp twice instead of configuring
> vccq-max-microamp for the pm8350_l9 supply?
>
> Because the property name is duplicated, the device tree compiler will
> overwrite the initial 800,000 uA value with 900,000 uA, leaving the vccq
> regulator without its intended maximum microamp constraint.=20
>
> Given the history of UFS hardware issues mentioned in the commit message,
> could this unconfigured vccq regulator lead to system instability, boot
> failures, or hardware damage?
>
Yes, this is a typo in the sent patch. The patch I tested had
vccq-max-microamp here. Sorry for that.
>> +};
>> +
>> +&ufs_mem_phy {
>> +	status =3D "okay";
>> +	vdda-phy-supply =3D <&pm8350_l5>;
>> +	vdda-pll-supply =3D <&pm8350_l6>;
>> +};

