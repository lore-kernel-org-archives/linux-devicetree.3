Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4912937B41F
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 21:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542814; cv=none; b=V9Xb5RDWm/iCYGaGzmBTeMTBq35VGh91hWqHvZwx7yvjH5C8G8ak5g7XpWFfVQiCw71zSHNqN9p3QyHgk+R645vluagIDTGSi6hEeCQDmCJHi487vi1izcL6l1nEHYj68/OwYDSurJOpdU3zzUgtlLF8XZ0UiitefEAp7SXPIi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542814; c=relaxed/simple;
	bh=G2oUcl4PFuECTL7Wrpefi90ylipzCMBA/vio+TVO4HQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=twivELI3nxEttzuiIRDnLu4Qfe+2AxyKn824mSrKAj/ynHosBdWoYzxTIupeyk0/ROyaAzqzzPIztyun7cl7qLFvBbgIui+R8MbMaWnrs/JsseseYDj2L/KUhxA489sIt3EzDfrg9edZ4CPQsaTyb/+iuJP7YMnROQ0/fBP2IV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mvIk9pMc; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mvIk9pMc"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48882c1f261so750528f8f.0
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 14:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790542809; x=1791147609; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HdQLpvgoc2kmRQGNUAWswTV8bwgORG4pWTKI2Gc4aS0=;
        b=mvIk9pMcmF/eoSKyOQNUNXVRwuDcWeZMzIBthXsDBkf+q+dEkzkyD8+ch2buQsB0/T
         owvU5qY5AobLL5aHYwK58mA/NA2iPOddJOprjf/tVVN5gryy5yBCAOWtkxgPbP4ZnWSZ
         pb0NiEitsJt0Q7WUtLr/PR7ymVOWL1qQ5SZtvL92oruXlrRNaPc5npWURrKpfGS6bT0J
         wqf4MnTSmZtz2fjVkLl67Yjf/lRhpS9dfQZNXtpafrBCD5r0mS/Lcv7FbL6ONrk6bfh+
         ZqczdNFyfdYyn/pzVTYxPDjCj4lbwU2HNxrDCQd3iV6MUkRoUJdFeRfDlImDItCmFN5K
         2mrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790542809; x=1791147609;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdQLpvgoc2kmRQGNUAWswTV8bwgORG4pWTKI2Gc4aS0=;
        b=hEWCq9+4Cp+UTdl54l+7u6SBN3AHtHtlHaP7yXJiWuqnmiQ5PCaWQuvjn/9NtdRt5L
         0PGDapal+s4WS2OnPcNRJQBkwqnbNXAiGyx0R4lRVVUhxtIagTeWDLduVbrjGFCWig1X
         YIiEv4Sz/Jdw8a7FaQcVZxqEqQt4bbq33oikPUJesLnzIrsQMOcwrewMTa8ekGuWPnuK
         w8GjDIy7RqIT7jj4vFcfQYM73dhHsaZ5C2fbocmQvJMveEyQt06XiHRLPncRUG9xsP04
         JwsDGrMp0rgA7wTeHsmO5GPrbJnxAdOQL52VkhF3pNsiatIz0cxkIMkcj1Vty+ryxWWR
         w87g==
X-Forwarded-Encrypted: i=1; AKwUvBziMrrMKUFbrgLZoHmHneDTl6HY9jeUWgrGl58dPl4rlnq4s4wjRy3cRcxp6hxHDwperFPzVZXPrKWb@vger.kernel.org
X-Gm-Message-State: AFuF++knKj2A/x8CGtoLfktk8yYQEKN+cBPk43poDEO5iWHml82szizZ
	CrQt5N38/MalC9q/dbkf3CE6VoduIZOvmUTJCCW5nrtqrjw50VVPlGd1RMiSOdtN5Zs=
X-Gm-Gg: AYBFou34IU10+3z5bWUhRq3NwxP7w3y6AqHKBtNMcl2fQdfXSGQ9EYsATYq4mJjbmQl
	bew/jCTwZFRYMIjak94IhMlnMVh2Si4VWY9L0R5wNyu+QGqa9IdGZg8armde2M88iBKdXB/uc5C
	6ht8ILHWMwE6jTK1/ViI3cDRbNCHMRRfXlGDPQDc1lqPhu/25KlOs0EaAIk6KziPjdZ7vbAQp18
	Gy9XnMDWLSuuI9/WfZHHSJQyaXYHt/rPE2rkBe2eOhKQLiu/OJg+/Q4Nj4+vGuf0cdonkFepgJ/
	7lU6YAhVoG76+Tz/yEzbvdQ1Am8WTFljWMJWRUfCXqr7vQDJFjeehLlTjGJRTXXgkBDPvDkjdOj
	id6LNCi0oyDLIWq75VQtREwBMhbeCqxI+xZTN915aKsuXNGNbfe0ctKqZkzcgrtXYPxOCccruTn
	RINRnvYHlGK58ld+AJUCM9LOuWkyBOsTg81fBzyfVt9EhQTy2RDh2OrsJAXFnaIwHmUIN204w=
X-Received: by 2002:a05:600c:4e53:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49fe66c8288mr201327785e9.4.1790542809339;
        Sun, 27 Sep 2026 14:00:09 -0700 (PDT)
Received: from localhost ([62.217.52.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee6ced69sm146468965e9.0.2026.09.27.14.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 14:00:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 27 Sep 2026 23:00:07 +0200
Message-Id: <DLQEGA48W7X8.21N6R6EPU8C@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "erebion" <erebion@erebion.eu>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/8] arm64: dts: qcom: sm6350-lena: Add flash LED
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-1-b4612e3eb536@erebion.eu>
In-Reply-To: <20260926-pdx213-upstream-3-v2-1-b4612e3eb536@erebion.eu>

Hi erebion,

On Sat Sep 26, 2026 at 4:00 PM CEST, erebion wrote:
> Add a node for the camera flash LED found on the Xperia 10 III
>

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts      | 15 +++++++++=
++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 6e2bbf4f060ac..79aa2521aed40 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -4,9 +4,11 @@
>   */
>  /dts-v1/;
> =20
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sm6350.dtsi"
> +#include "pm6150l.dtsi"
>  #include "pm6350.dtsi"
> =20
>  / {
> @@ -302,6 +304,19 @@ touchscreen@48 {
>  	};
>  };
> =20
> +&pm6150l_flash {
> +	status =3D "okay";
> +
> +	led-0 {
> +		function =3D LED_FUNCTION_FLASH;
> +		color =3D <LED_COLOR_ID_WHITE>;
> +		led-sources =3D <1>;
> +		led-max-microamp =3D <180000>;
> +		flash-max-microamp =3D <1000000>;
> +		flash-max-timeout-us =3D <1280000>;
> +	};
> +};
> +
>  &pm6350_gpios {
>  	vol_down_n: vol-down-n-state {
>  		pins =3D "gpio2";


