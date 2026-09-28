Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECA84DE72A
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 17:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616826; cv=none; b=D0Kyq+8PkJZBMBEEqcvAUCtlPSeyHY/NpGYGdDNNTHe3G+nrKKjnIkAdppfAbXrEzVCPb8BpFYK1PQHuOFk9JMJSNwcBkdkzGI3X/bvI5GclplChxXOb3FkfnKJszxoWqmmM056G4lBHmvQoBR9zaF2854IV4LR+GKkIzfM2DVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616826; c=relaxed/simple;
	bh=JlLL4IqE/Ybkr2stZPnkzTFEKpV9lPoSBSlMb566Kik=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=doOKLsjBbB3Tw7HlMk+1ON8x45dPRhoxHFbDSBZW/uxSU9wQoY1Ny7VoX3kh/S5wDV8dY8+gW1PO8XtWZPTLBzNUDjW0U2nmXvLYrf7CwG35bkXXkfDznAZQMz70zxXFEqkuOXAiRIbUpJXb/V3njpq+NFR5HBqpVGouII6d8CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=O6oW5wGi; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="O6oW5wGi"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so31800045e9.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790616822; x=1791221622; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Nm+H1sF5plZg2FFwBIfCS3h66ScIgoJSGwKlR3JKRkg=;
        b=O6oW5wGi93uw6nfIEeMdfVv1YZXjxhwZ4G/9J8n2y69YMAsDBKWZ9NSdvaAyvlsddw
         DR9HFsPk7fOs1BALfXafgq15bl+WZ8kKJ1Y7AbevZig7K3uyAHF8IuFsk+QNjDnaBWRH
         zcgMpvfogHnVXDpeIBL1zPjj2T9ZzkoDHp8PCSOIZhXcDhWpeGeRv0kbQdBhX0d7i5Rg
         iid5zBSzbOIpZ9QMMFoI2ATZ7CDkamgIffWeIthFdzODOJ8sGsmqpnZAdkPobk3wBcMx
         UPSrY5Wshq6DRFs6/JFZGWNfVFRrCAu8+Z5XBH4ppaLGeq4cPxSE3I135Xhsd2pk8G83
         IG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790616822; x=1791221622;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nm+H1sF5plZg2FFwBIfCS3h66ScIgoJSGwKlR3JKRkg=;
        b=H5vO9SvUaZLBPz4miuI/Qu73uwzQLl05YGj5HzEoxeMr1PGASpkZXsJQpmI7s6Kvyn
         n4AOycgL2h9wOFfPQSaHXHbYrpokH9dero3wY+K2YK56jpQSJZzTTsh9LBnc3k5ZOaQU
         FrXi6u685xYV7RCg31mNERNTo8ebBKaiT2rfp2x/p4inXScN2Es4PRkYeRIFms6CaAZR
         Ri7/91cyWlcsoK4wBGMzhewDzXdG/+pkbYRJ1fnoLQIsC2uzeL7d0wOZWBNSzT+IvXFW
         O5pE1A16geiSaS+ZZ7Sfd8QpYh6bxC20XjrEuNvC9jCqxIISie1YdnKxqDMoPA/zqqTq
         evUw==
X-Forwarded-Encrypted: i=1; AKwUvBz0k+C7YSDvLVXw9vWcNOEpf2+aWyK71RE89PPdiR7yKORUMy2N0IWbgiL9qpJ5gzbd7mnVHphQPRbl@vger.kernel.org
X-Gm-Message-State: AFuF++mrAd6gzB4hOvngwIGU/YjfzmmyBuvDRxTz4rB84RUnvjwTsPPL
	l1/z4U0r5PX5lIjxqY6EguAHEwuf0XKO93g3eRR6DeEp6tT3grophAfbeeyNkRo0oEk=
X-Gm-Gg: AYBFou1AhWzt5/EVzN+uQMVwbPA5C9qocBLPuMSeRJG/MHFij68QHAF1cS3xYQOfdi9
	M3w2ihgGY9E4HFZdNtdFS1pw9eLRC7Ev2d8CA5Xk56pok5+p5lducxUmcoBwocH1TysSZDFH7ZO
	k61sZYhxNRlb8zqju3up+K7ymbnbtZQ1dCv40aYA5rdl701TwHOiJqOa3//zSEEuqIDl/PNp2qS
	qJhRhmaaINnOOwjCOYxwxGgOKQ4DU14MzTW12dYQmjWQbfEpTyuPVTI4oNq9N5+gBCSPwcqqF0V
	z9bUhTtQb5Y+4qwyV4+wmlo2urNM1gcAYufoE+HmyPGx/LhJ4VTbyGtRx1j5mUb7r+tetEwAMs2
	hCzVSYeuz8heHrMJGTnarlg2fWZnl4tGDl2ERM7XoG32Qfvv6pPGz3fIJp1sEB/A4VPOplA1Vff
	fRpRagnfzHCJ+0oD8e/Kv+jowVV0LRivjGZ98IDrIJRP13UkDaQOxtPEHPYAfK9H2BsgAkTfEiI
	ELO
X-Received: by 2002:a05:600c:4ed2:b0:49f:e3f2:f5a3 with SMTP id 5b1f17b1804b1-49fe6685393mr248630105e9.0.1790616821952;
        Mon, 28 Sep 2026 10:33:41 -0700 (PDT)
Received: from localhost ([2a03:2260:3006:212:74c7:e2df:8ae8:a3f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm7566165e9.15.2026.09.28.10.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:33:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 19:33:39 +0200
Message-Id: <DLR4OQOPXHKZ.36X3TK68F75K1@fairphone.com>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/8] arm64: dts: qcom: sm6350-lena: Add flash LED
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bjorn Andersson" <andersson@kernel.org>, "erebion" <erebion@erebion.eu>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-1-b4612e3eb536@erebion.eu>
 <arnF0u2F9ipfnNP-@zenbook>
In-Reply-To: <arnF0u2F9ipfnNP-@zenbook>

On Mon Sep 28, 2026 at 3:42 AM CEST, Bjorn Andersson wrote:
> On Sat, Sep 26, 2026 at 04:00:50PM +0200, erebion wrote:
>> Add a node for the camera flash LED found on the Xperia 10 III
>>=20
>> Signed-off-by: erebion <erebion@erebion.eu>
>
> Per
> https://www.kernel.org/doc/html/v4.19/process/submitting-patches.html#dev=
eloper-s-certificate-of-origin-1-1
> please use your real name.

Hi Bjorn,

As per updated versions of the docs
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign=
-your-work-the-developer-s-certificate-of-origin
it says "using a known identity".

I have met erebion multiple times at different events, so I can vouch
for them, in case that's what's needed here. And they have their website
and everything under this identity.

Regards
Luca

>
> Regards,
> Bjorn
>
>> ---
>>  .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts      | 15 ++++++++=
+++++++
>>  1 file changed, 15 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts=
 b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
>> index 6e2bbf4f060ac..79aa2521aed40 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
>> @@ -4,9 +4,11 @@
>>   */
>>  /dts-v1/;
>> =20
>> +#include <dt-bindings/leds/common.h>
>>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>  #include "sm6350.dtsi"
>> +#include "pm6150l.dtsi"
>>  #include "pm6350.dtsi"
>> =20
>>  / {
>> @@ -302,6 +304,19 @@ touchscreen@48 {
>>  	};
>>  };
>> =20
>> +&pm6150l_flash {
>> +	status =3D "okay";
>> +
>> +	led-0 {
>> +		function =3D LED_FUNCTION_FLASH;
>> +		color =3D <LED_COLOR_ID_WHITE>;
>> +		led-sources =3D <1>;
>> +		led-max-microamp =3D <180000>;
>> +		flash-max-microamp =3D <1000000>;
>> +		flash-max-timeout-us =3D <1280000>;
>> +	};
>> +};
>> +
>>  &pm6350_gpios {
>>  	vol_down_n: vol-down-n-state {
>>  		pins =3D "gpio2";
>>=20
>> --=20
>> 2.53.0
>>=20
>>=20


