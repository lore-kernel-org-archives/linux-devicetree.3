Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917221;
	b=LmCFpYMuOttgXTwcuYa5ngn1wG8OgodDuQaSIMsFzD4IuCuRuKV0PVEolbYYskK5LbXo
	 oUUZx8+9YMm/mMNI1uXC7YCKW9JG/O531LRN6oZpd/KG2/qU01r6mp/iuIN6y/tqF2jyn
	 i/xh8z2ZInsSqGxu9I83m4hZifZh5acbzSV7MPl8l3MptM+g4M56P0UBPp5mVRmWKglLm
	 8f4VSirTdij598jwUtX47kwb61aFXP112XJ88YqovYezHimAK1M8VgArvK/1HGMuMu7nU
	 5D2lIXlqCjygI3NuVsiZefey3HuQMLQwyiNuvCeisSUwzXI15TGjptLdkETA3J2KSvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=aDpnAdxCSfd2EKAnSTqMP2/M8c/xtUmhy65PUV7fU9E=;
	b=di64RVSIWZkY5s2aGm4XreMj8HTi89fTuOXBKPHCnN89wQQljMgTtSZl5J/0QDhqX5Kt
	 QWQR5mblokSbHnvC+bP/buYdNm2G2W65BX6W3GNDMrULJVt6BKJmmmdyfwPDKdCdTPro/
	 SzzJAETaVBKzZW8jubaO6IoV3Bma3b5oomDlHfPDlYznSYI4AtvqDmR3kdmguPkPF+SW1
	 YKV4apjcN8bKkHeWVRdHND6s/D8lE0obnOAsvlMRUN9tcGPwwsv6fymBAzQaca4Lj27q7
	 Zdc1PSNJF/M4WVKi1oF1/eIQ1HevVRgB/pZSKV/f/jUZbCrC7PjM9TPHktYcQ1Ghisg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b="0SXH/KI1";
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8EE606A32A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C8EE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=0SXH/KI1
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d30639709so628354266b.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794917220; x=1795522020; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aDpnAdxCSfd2EKAnSTqMP2/M8c/xtUmhy65PUV7fU9E=;
        b=0SXH/KI1Y3sFR/g1FdVD4aywE7M953r8hni0T/LCpli6q19nDR7TUQ75KMweJVehSF
         yYRb5xKjPO/vtngq8ekpj5yShHNAARPN/0knvtzfPG9NWvsGU/Ahi9kyXDncp1CxND1Y
         StsB9I/AvGZOe2+fcbvcC1F+NgWpJh1hJmTOc06lJWbwVwU4YZ9Egeygy6XF3qqtrpGV
         oSO66+YyHJkUTXaLwZCmT+VOfuFUHtnr4Lwq9U2KMY+L7s6djeKeBl5w1DLV0H1j1sw6
         5YuP0JUF/7bntcWL6f9C5SQPyxsXJ7bG0wPEdSROPVT2945ojgBEVS27n8Lsx62x9mpR
         VizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917220; x=1795522020;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDpnAdxCSfd2EKAnSTqMP2/M8c/xtUmhy65PUV7fU9E=;
        b=H0elmLQqAfx4x17Reeda40Aks4a02wytfo1EoQw6nI1s8uBz3l8S75ABA7g1vLCJum
         kBuUV3CZIKHyM3GiZd87lzdvZwBl+unMGyUSG2f/6VW6NoV4HO4rckChU+23sscysdbJ
         lVAEJ5+OUszumU+dWrUNNjkiDEA06i0u6jotoBo77puiCoQ4nOy+weKV8qzbVmkCvtNc
         Av5BUJVtw6yUw6L54QfW84H1Z6FvvjAt2rNLF0GmLw/uMZEBvvG2E+IsQcbi1Xx84Fn5
         A8skZBJRNd0XQYLWE2rKcpprifPW2MGEg7284X8p7QcP8DPQ2msV6Ib/cdExTmhc3/0d
         xHew==
X-Forwarded-Encrypted: i=1; AL+hErHIaNP+hQhaAX4zqT98Aw4K4EG53/NBL74o1rbA/3KHKD1v6+PnVMsBjCBXlNOR4K/BZhyFlDgYRCwe@vger.kernel.org
X-Gm-Message-State: APuU4Z+i7NXNCvW+1T1Tf5ftTbFhTlicBop2m/EkmWlUfQMxKJfBoT3r
	5RD55fKcE2mHlmxSrojYbHG5tZc74F91nTqJa4qdscM0qUdvz1i5WGu01SSlSoK2qgA=
X-Gm-Gg: AYBFou1Xh3SvotYipXWzSjUnqHCE4bA2lMOyWQ+B7VbAXWzkyGs59fwwuTDRxjn+I7b
	kLbyNA0hWv6XIcBFO/lXjTyAtevqbywwkaRiIaLDmpqf53Py+wezkfGSnz2Jw6rO1Rl3uI5yuCT
	ibje5v2jXGPGQI2eeH9KfoylS6zGPyyvq91+QYPbK1ojqz1hDePYiPO+KfeYfuZp4uNx0cju3Rp
	O0yibywqOtCxdIkGPp+yBxVRjukNmLCgolPAjH4ZoE1HO0c6lyt/JI1q24d4svqUB1AiobsZJuU
	q31XWs+S5xS0WCjHvUy2gdj+D0rGO7sXCxq7pGsDUpytq5kvdKX8EJDArl+wFmQMbEeHaXvH62/
	+pL2nc0+5pT4DbKy7OJUDNcyBDdCQj02aGprFUI8vLI81bhSEl3bICZ3VQPYNFm+nzZfGKzHFdK
	HO4fB0uksa1ojnu9I53teY5Q77lih2Ss8QSiv1BVIf1/v+sNwl5WP3f4mOtjGuU0p1eEE6IcC9n
	vTEibFh+KqjCmgvzfksr7maVparE1cL+yo/OdBIxvMbq6JpNKjlIS4sxKd2T4V/Twpnv5ilvhE0
	UOOhkOQron3QveAE98jJHrc0BhqSvtZosVquyGuUT64W/KF4OvJI5XCuY2arejToVfk6AsG3kA=
	=
X-Received: by 2002:a17:907:6d02:b0:c4d:4d5b:4bd6 with SMTP id a640c23a62f3a-c509654df6emr1125503166b.41.1794917220010;
        Tue, 17 Nov 2026 04:07:00 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b51bcbsm522082066b.44.2026.11.17.04.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:06:59 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:06:58 +0100
Message-Id: <DMXH1UYFI74N.FT441QG9ND7@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v5 09/12] arm64: dts: qcom: sm6350-lena: Add PM7250B
 thermals
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "erebion" <erebion@erebion.eu>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-9-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-9-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Configure the thermals for the chg-skin-thermal and conn-therm thermistor=
s connected to

This line is a bit long. If you re-send, please wrap it.

> PM7250B.
>
> The trip points can really only be considered as placeholders, more
> configuration with cooling etc. can be added later.

Could also be squashed into "Enable PM7250B" but also fine as a separate
patch imo.

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 26 ++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 50a235d6fb6df..0bb714eed13f4 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -80,6 +80,32 @@ memory@fe901000 {
>  			qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA>;
>  		};
>  	};
> +
> +	thermal-zones {
> +		chg-skin-thermal {
> +			thermal-sensors =3D <&pm7250b_adc_tm 0>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
> +
> +		conn-thermal {
> +			thermal-sensors =3D <&pm7250b_adc_tm 1>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
> +	};
>  };
> =20
>  &adsp {


