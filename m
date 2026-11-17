Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915084;
	b=q0f/wdtc+ylH/L4wX4PkdAjV1/IDcyLu5IlN4jGNTUA0TzHrloXomZRxuuvgzr0gFhmy
	 G8RrfhnPJfLyfRSDR2I4brIe/lSAHq3DtyZobI3KbyyW5SPsBlfmNp67i9GVWvj1Qf+4M
	 x+Ix/S62NymUl4p+hPC5OBxc/PPkgCXyGOyfql5L7C32mNFDc5WQd0cN2n+5lDdP+z546
	 x8tC30s7yXEA47/zdbLsagsNOww5celAvmqMOUx8+HZ9K/F9uWTJUB6Ic2uUTu0LVtQ4q
	 C12wXiviUnjr2NmBdEoafBGEBqDCyjAC9KCKgvWqcDmM2QIYXp/ikgY/EhUk0TcAU8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=37F/rQXOY5cbeWkahN1eco01zCL7u1ct5LuaDA+efic=;
	b=TNPFNNYA39YMo5qbNNDRyNY2tiUqstAn6uM7CtvNbo1eobVEEjfVqRLpPtdx7YhKl3px
	 ogR4LTUvzz9FwqQKFegpw8xFEunpbr5Z1xXf+EIjsMhlGI/ODl1HQzNDXBBBhpnfINvIm
	 8H+U6jZGmNCSjClcsX86LYCHluUoHnFyBxXYXwWJxIMgRzgYrQ4TGA/K4D4t0X0w+k8MP
	 BdbUGrIKC+f0MUzeirwqOpDcX6wtohWc10Dh56Gf2wQByxnXRJbGkroVb2aJLwhdXcySN
	 J7T+Q62fgKPYHxy66GPu//Z9CyIQ2+254Eg3T6y1fJcD+weNAkDHolEXwRD4P7EkeXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=m8IY2Woy;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335B3606A32A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 335B3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=m8IY2Woy
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c40f29667e6so795861466b.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794915081; x=1795519881; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=37F/rQXOY5cbeWkahN1eco01zCL7u1ct5LuaDA+efic=;
        b=m8IY2WoyLPfitWWglS6wqI0ATW3+TpbTj9ibHg8nvn1/DrViKj9QNxHqEYqIRERZ6F
         Na+e3jdV/rVSS7ALdanwyCzuGzZMhejKsuMydwP3XJOnpEbcc+xXa3/9+apBe6B1fg5h
         2iQKAF0w4njd1P7NsCgck4NNFKfkXExe6AZDyOVw1TUYD2WyHFbAPW3+D4/kMjokiOT7
         dxU3ryPxLIHk4mx7uofmiAXMiGS+qWMD29OWpTpQ5WOWCCX8Op/qJbTPkfTkC1kkgTmX
         RfVSoXsgINXsUIVSdH0RXqA6RxIHK/tWBUitp0NFP+nnnn1+OPuPqeuomXE8YN2MV1/R
         GFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915081; x=1795519881;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37F/rQXOY5cbeWkahN1eco01zCL7u1ct5LuaDA+efic=;
        b=lsg16MCN7XoJzZGZT0yzhSKkXmMJ6q1675aYU3PMisVhCvoloCDO6zicW+QiHFy/6d
         DVC6KvaaqnYdNkVlVjCGOECLa90W1yJtE+ZQc4/1B8BZv+j5r4eP+y2bUzbo798QOOV2
         7st4l2141Ixm7EVYeEkO5GK7FhpMe1mjVj5RXCdfuiKPqCspRI1OMlVmOdQcpr2DNSqb
         pQRG+i+AjVpLHkEeI5VwIb2wc3DYHwFxyYCez8/1C1ARPDGLpp6/uHmHVdl2YSdWqdhQ
         Ldl6I3yhHUBuSi45OXoZpErPSu3+j/KoW7AXpMpYunTEU3qSvScYLLw7SRE0ut4Ag3f6
         gdjg==
X-Forwarded-Encrypted: i=1; AL+hErHrTvfiSRPokKU8OsI+f6+7PbXsV8yqETIXoyhidg0Pm8Ysx6qj07TmoESi84av1OMAukwE0ctBIOoQ@vger.kernel.org
X-Gm-Message-State: APuU4Z+fMNVFU3NEBDyMjycNagvUESkpATiRy2nXFxd3nA6mu6MnxEDq
	Q8dF8Mgpom3v8RtufjU2tDwx5ouX2yYCXmLl6MxOFHug+3xfDscQxMvbGfShmM5OKBc=
X-Gm-Gg: AYBFou2w0bQTBG8JaywjMPbndywZlz4eVhdJkWd9ICIfW3jTUBxhPmh3sZjwjByxsiY
	o/WU451K8MVrZhOxN9Au8ybcNuTxiFprqvbQcDlXWrp+jEBBonzznsig6IyOUuDAQIElfayUEZQ
	wnLt3tDUureNIzTBQZuD2pIRzDuw49q0ab/f1tTxPWCZ4CQYic7ByztzzDEWPcIvunBuP7pKKTI
	QScTP8vc2cdg1VoxsjUJjp1xV/NJn5eRARPGqh8bd/pxKY+ts4ZAZ/OhOb84A2tEtcHsfwAT3qY
	xq0g3RPBH3Ehh5VCgZIiqmlWCNAjhas9edzwjqBOu4o/cBa7w/U9hp9SGcZpAjY1qcMu4MhCsxR
	WoyGTFIsJnOKVeu4XU2fAZuLcIDbOuzuISu2L25PKRIxtP856MS7neWxHBdYvWSMgcz/fQ/yepr
	0vxVJ+e+iQzDQcateJOV6c1wjBp3RwQSxbxWs52T/hwOnJBZmMmbehkJzrs9PdE5xQz5Pro1+LI
	TZf6EfAJVXK0EcSLJQFfKV4FYS/VYJnJYd/tUJWabHByCbBbPII8TYHDCvb8wNkOmpPjkakdp87
	t+J2kp+q/L4h3H0WnQcs3KOf9c9UNH/DUYciePvqSxchfCamujxoPeg+w3v9VBWDkgRoGmiGDw=
	=
X-Received: by 2002:a17:906:dc89:b0:c26:1648:a06b with SMTP id a640c23a62f3a-c509642fa78mr1153445566b.38.1794915081033;
        Tue, 17 Nov 2026 03:31:21 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b79146sm519632666b.68.2026.11.17.03.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 03:31:20 -0800 (PST)
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
Date: Tue, 17 Nov 2026 12:31:19 +0100
Message-Id: <DMXGAKCZ1Y9L.3IO6O895BMH6@fairphone.com>
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
Subject: Re: [PATCH v5 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP,
 CDSP, IPA & MPSS
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-4-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-4-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Enable the ADSP, CDSP, IPA and MPSS (Modem) nodes for the Xperia 10 III.
>

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 24 ++++++++++++++++=
++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index a393b7533ccbf..e8808865bf6fa 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -68,6 +68,12 @@ memory@fe901000 {
>  	};
>  };
> =20
> +&adsp {
> +	firmware-name =3D "qcom/sm6350/Sony/lena/adsp.mbn";
> +
> +	status =3D "okay";
> +};
> +
>  &apps_rsc {
>  	regulators-0 {
>  		compatible =3D "qcom,pm6350-rpmh-regulators";
> @@ -291,6 +297,12 @@ pm6150l_bob: bob {
>  	};
>  };
> =20
> +&cdsp {
> +	firmware-name =3D "qcom/sm6350/Sony/lena/cdsp.mbn";
> +
> +	status =3D "okay";
> +};
> +
>  &gpi_dma0 {
>  	status =3D "okay";
>  };
> @@ -316,6 +328,18 @@ touchscreen@48 {
>  	};
>  };
> =20
> +&ipa {
> +	firmware-name =3D "qcom/sm6350/Sony/lena/ipa_fws.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&mpss {
> +	firmware-name =3D "qcom/sm6350/Sony/lena/modem.mbn";
> +
> +	status =3D "okay";
> +};
> +
>  &pm6150l_flash {
>  	status =3D "okay";
> =20


