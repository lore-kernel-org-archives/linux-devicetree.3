Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916941;
	b=Qh9UivVlDuK/ZLiCKvT9fEOQ+TKJJa+E0cyGMeAqNOny+UuOaJIG4k1V3TjSbj72q7bH
	 R2olSenhA8MC5T3uHS9U3BRWVAtj+3RDX/KABuI24btCTMxQdBnsu62r4ML3JXaNY3BWH
	 pHKZ4tB+hXqgs1GEPKKxVO1hCWYnxJw55S/7JfjGqObqmAVEyI8HVjExTPfdvMbA0qTfn
	 7cH/+6JDd5K0ChOjH5Hi6w/2Bt8xCKDu/rXHOWljLE2laxFSVg7eNIUp2bJmLNzxNJS7r
	 ay6KYAcfXSYyb2gsFmABl1fPxrhE9bSfYkVlQwOTW3V9hOk1wFgJ2HlwPGZD8t6zszQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=SqFEWe0x1tzwyClz1tTRFPazaqExHTu4JKiosZvtC2E=;
	b=xUbn05tJ2XPsZUNexHUJcFvdnoxVWgWokmRW9CUgdU9JOo08OZ9qBncEICV/oeovVb+y
	 E0op5795AEurzeHwkN3ycJRC15huOl+YPPlpsUmOupSFCBtWZ+WlqMFEEZkMzzbYZ+Wew
	 0Nuafh6fUPwc4x+xAVct8VVmYxS623wx9CUiEMUY8DLVbf/EfvpPt4ftg975AI2+EC9g3
	 e4iKoxR/dvoxwqxvXc/9TSJIaEoXnXgEC88BPUXh8agtVXmOsBsYyqgKjnxXoLwexwa8J
	 cnSVa+Jzp/LQTZPn30G3r65Z4RnznTM7DDG74x208CQvnPqXclRRNFkVdrtiYWbwabw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=Th827p32;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8989606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8989606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=Th827p32
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c45551fa84eso850720266b.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794916938; x=1795521738; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SqFEWe0x1tzwyClz1tTRFPazaqExHTu4JKiosZvtC2E=;
        b=Th827p32i0l9D3dCfJvt6t8pdkgOWmCvul17AhFFjNuJukCtmYruARt4sMdL3QUntk
         /xQ0yKa8WdJnizBI8kqOWfBgMNq6peVRv+Xyu1951YpaUa3jZkxEew2xfVNuL/MfPQq6
         kRRmIVNCcxJzMVkB1BkWWZNvwVkCe6IJ8PsgAm2g54nH9NV60iMV4OcOzq9MZAwtncHP
         d0vXcrnAVqWEOqsmcrHftcwvPrz6P64ycSu9vSt1IWtiKjIMRDEcaHlSk9zfNQ4Rdyo5
         uRHppU4E6d3q2a2sG4Ggn+5uc/Ex9NqQld4G8hPB2xtYg+21jWoFWz3bMq/gLBal5A7I
         ZhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916938; x=1795521738;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqFEWe0x1tzwyClz1tTRFPazaqExHTu4JKiosZvtC2E=;
        b=IWH4c2J90/iqtZCx8+RbNAGCh7ZvbwPeKt6bq0FLvN0zQOkaelKYbGQj0wRnFT57au
         6GpSasVImZT64Gww5VEXaM6wkvXpg4qRC6YFN+dAdbq7g2aC0Hrxgy5qZVaMQDHfC4AO
         kyZF9TfKgeuLfB445E6HOeaj6TH9poXEKnm68bAJMMuyi+AUENe0sY8piW+WsTtuovTE
         Z1YsKN5JOZ7KKKt2151R83bo1UPKs46cx2L3Tma8pM2sF2N018NxCv0OMTjqNAmQj45X
         +4I6B7FQgXQxGbQrvzSkFQZrLAISrVqkvoOZ3U7TvMcykb8zO8BE2UMLzR5VIk1+hCeq
         i57Q==
X-Forwarded-Encrypted: i=1; AL+hErFXmHEuNtIVCjXv69SEihwiSuq/8GoPi51hORYOJuVFp/NT3QOvtR/dJRtVG0wzGjqe0M5XvH9UAWeK@vger.kernel.org
X-Gm-Message-State: APuU4Z9eUJMRR1jpzjFQvJ8qumhye5B7XZHmdEalMwfI+64hhB+jm3NT
	XVJlz1zoaIZ6g5rAtVZc0h12DT6PIn3v6Sc57nD/NIFuXcNqLXKfrPxBoxD0Gzd4zik=
X-Gm-Gg: AYBFou1pusx3P+1D+nT2V78g18EJWO189pfFRi3npc+qgF2p2fO3F3BQtk/fmSNnIDc
	E0M4/hb6J5qKWbxUEc09/ukJ4ZaKOX4a7MhKjtzmzp1R0MFA9otTj69j60aluR6/Xu8Y10NuumN
	9xVjOoj92JnhIdbk7Gc3Cq1+f3X+ClREgbvTBWonJyxp3dBnyNiW22+ZyPKuvmUkIUEDqCkoO4b
	9TO79TrA30cTLpqoY2IErHno4K5lT8Cb4hibfZBCyNXcERa5ASSq7Ct4RgfNc5RGfA9qHhExOrA
	kesUA54JLCkBhHfetKnSfLGo+CFJ2B1u4VtI4/poU+lsqno2VAQnALehaNYHHxs2d9fn4BJHc4E
	pFM/XL4chxqlWDAqxRy+J92MMpPECVjCyzFwDkU3WRLNFhwfB1svZcVKLzBGRbPn+vqJqH9BQF4
	+G9fo0x3SmjDVU3KtBZT/WBblX7PXkhY0gqKQxLxf3RHUlfZzgoERmAlXWkb/lKn3Ovjd25B5gw
	pyLH39ZWllVmPK2PCrAlEQQVHiNiZ3XSRfMtS6MJmYdwwpVnRHmgvlny/EVuhHxzBgyaeVpIeW1
	nl2Xj1I89bV+zT+wWFzjiic8ayGPEN2CQiNg++4AjbicOhDSJvmakE6CK66SvwlLKb1Fmrgkjw=
	=
X-Received: by 2002:a17:907:c06:b0:c50:8d2b:4392 with SMTP id a640c23a62f3a-c509674081amr1060134066b.49.1794916937935;
        Tue, 17 Nov 2026 04:02:17 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50efdb3471sm115816066b.87.2026.11.17.04.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:02:17 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 13:02:16 +0100
Message-Id: <DMXGY98BB06A.KWBSBPSFMXJ9@fairphone.com>
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
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v5 08/12] arm64: dts: qcom: sm6350-lena: Enable PMK8350
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-8-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-8-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Configure and enable nodes for PMK8350 on the Xperia 10 III.
>
> The phone has two PMICs which have a PON block, disable the PMK8350
>  PON and keep the PM6350 PON, as only one should be enabled.
>

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 34 ++++++++++++++++=
++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 697e1cfae72e0..50a235d6fb6df 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -8,7 +8,11 @@
>  #define PM7250B_SID 2
>  #define PM7250B_SID1 3
> =20
> +/* PMK8350 (in reality a PMK8003) is configured to use SID6 instead of 0=
 */
> +#define PMK8350_SID 6
> +
>  #include <dt-bindings/firmware/qcom,scm.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> @@ -16,6 +20,7 @@
>  #include "pm6150l.dtsi"
>  #include "pm6350.dtsi"
>  #include "pm7250b.dtsi"
> +#include "pmk8350.dtsi"
> =20
>  / {
>  	model =3D "Sony Xperia 10 III";
> @@ -420,6 +425,35 @@ &pm7250b_vbus {
>  	status =3D "okay";
>  };
> =20
> +&pmk8350_adc_tm {
> +	status =3D "okay";
> +
> +	xo-therm@0 {
> +		reg =3D <0>;
> +		io-channels =3D <&pmk8350_vadc PMK8350_ADC7_AMUX_THM1_100K_PU>;
> +		qcom,hw-settle-time-us =3D <200>;
> +		qcom,ratiometric;
> +	};
> +};
> +
> +&pmk8350_pon {
> +	status =3D "disabled";
> +};
> +
> +&pmk8350_rtc {
> +	status =3D "okay";
> +};
> +
> +&pmk8350_vadc {
> +	channel@644 {
> +		reg =3D <PMK8350_ADC7_AMUX_THM1_100K_PU>;
> +		label =3D "xo_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status =3D "okay";
>  };


