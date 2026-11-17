Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917284;
	b=e4tLUkiY7O5D4np8fYLhMa+0li0Jy4/zv7Skjjy4mxcws5Hc0d6cnRSaDYtm/E4vXsRZ
	 2dziYGBXAOMuDnOuDZeGVw7C+vDYpYL6UdKDHd/eiRtKx5H9K2exVXoCf8kRft0FzoTuT
	 5MBeddPIWZaOJI2A2MO9WzP097QaSxt0qcVVE8dESHHhexpElCFPJIXlBsLES9pBcGPAl
	 7ZlvBtK+at8tP34tDkBzcaiXWclKtqQuBhsEZPbWq4+KAxrcV6YEGke7Vs0iHWJHLO3su
	 smFlqxnsYai0l+m70wAW+Z9xsnI6k0ZdKpWgjyZP25T4JtYvsIRjV0ed0CIwMWBXffw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=kPzdzQ6tHDCIxM8wFKMRfpcZWRkcCcNtEPZkCPlC0Rs=;
	b=uwOrsJwnDYX4/QrzvZPU7oNA/bTG+lX4gx0ql5YRfjmZwuChbJpTz1JIaJxpRcnLoOIJ
	 HCe8x4hChkHdg3k4Z/44drN8LKzqPMBW44jteLrlzy7vYMruqFyng7QibDgFeLBw0HRdH
	 i5KmK/q3Kc/adzkh+4cXOoWXlMvEh1l8FF2uHrXbRV2vR6U8aa6qKKIbeu0jL9ennSow+
	 0dUQplJoGJ7N/z6cMr5V4B4tc/ABGVY3Ia58IHtjXnRT7KpHVgR8FyOtig8aEwy8Hkn/U
	 AXgUSq2Li7JJN6+Vvlk6CjJL5vgLejXgp43qNS95u7pguyO9TR5t9v5Wg7C5tBR/QXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=dt0iCOV8;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E60606A32C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8E60606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=dt0iCOV8
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so735557366b.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794917282; x=1795522082; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kPzdzQ6tHDCIxM8wFKMRfpcZWRkcCcNtEPZkCPlC0Rs=;
        b=dt0iCOV8v9GvAZFTt50yVBbkG2wg4ZbVorZMsiO2KekaDCip1lwFjGMCgnT+pTmn1s
         PyD96HT/urX1171AawiamygQPsZM0QOxGRVjmbzF2ZVvR26mtxc4OFKszLYGJMhPUlBF
         fLbReExtNhC7bOHj3TDuqeIN/ptRUbNXFQG6hqNZiaaiYL0CVQ8/YYUxaWnje3peW4do
         8BD3nCUiO748ANhh9WzZFJi9cmyAbWbmeVxJzA5swoFc5cxLnTSZ8oaMsJsoMcMivURr
         klv6TPVEXsjCMpxns4NpXPrBxieCaZrTg9xJjRaybRUunhjrdWpTjo3OcPmHfRtt/i4O
         PvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917282; x=1795522082;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPzdzQ6tHDCIxM8wFKMRfpcZWRkcCcNtEPZkCPlC0Rs=;
        b=0G/mFSkFpAx5CnRVZaesab2Q741trYv/5zfGeL0DDiHE/v3WEX8PGYY4zSyXU2mZVR
         8zW5lAjaTvD7Cdu0yWTiaP/waAPozpY3V8FJZRR6gcLc1Dlp8iT+gCVlFMVWLArx9Gh/
         l4qCgjmpKvH8Azx90pJ/oARS5Iae4e2VawN+DqhxDnZg3fHbZ9xGh2r56MX1AOGmI/Bw
         BN0GHbRZKgX8QgBcWChFFEzjnwuMjNiFk+n3S4pd1UenPPISBVOZPpT8+OWcjJLqIIjJ
         LVapEn1TIOR0QQEmteioQw1J91UqOV3Rs+oj2pZEcLqU3uUmu6O4+t9zjxor9iEj/nFi
         4TXQ==
X-Forwarded-Encrypted: i=1; AL+hErFZMhaxe5GMcaGct4ZGwl/TAXWjeBa4DIDxIRZG0OSfTN73g3JoIov2STfmiONofkM632xNZSi069bI@vger.kernel.org
X-Gm-Message-State: APuU4Z+4zdWnl8nsazAXKvathAmbGkYCwZEopj1p87Fnp8xFpaU1FMUo
	uXnnbXPOzKA/mss0N+sG3ZMM0XR8+LoXwd4bOzAeI47LHUoHFxpclPDVG/D301RrGKY=
X-Gm-Gg: AYBFou0e9csIGS5weCmJIhQMmCz9EdrZv/kfIpBOXV5AvhxjoKEp/fukIPVYlm2GMEK
	5voINNZ0yy1EzfAyDe+At8x5V/r0MDUhkv5NFP+fd25xbwXH5rhigrm1nnCW8zoW3667u35LuKD
	0+9pd9mUDnh2hxiVZU1RXOL9u+FJ6WyaDYZxWcRF59WWtTNPdCejRAVWKAH0H+hEjZZARwsFdVk
	WPHhRrZrVxCYCg87eMg4lphO9TW94kXjGuSNT/o9f2sbEJppaJFSv5WQISgZZuyCIien7MtxjIG
	65SI2wZkOza/QkebKeB4f1vX1SgMlhUniUVgKe86AHx/G5vMFUpeeCulhWp3ONxKpqvXmnOD/lc
	/FgFeyq9n8f94rlgOfUX/rvhkFudCo2K2c+C1ZX713BBjZz+WkJyktKs7E5s2KptN3Dsz5hzvr2
	L0Tua9q3FlkZQ3raOsYuUXkSNGruiiqJrEXtMAiFcmIXIxT1/e2gtzROk/OF9vcujG7gxBBUuOZ
	DsUMI9Kj/8jnJNq+xdT+AmVjUPXC/SrFqGaLIuRtTfzCiD15YLF5pDNywE4rrGaFFmjr09MMkFO
	o1umsYqpmrVUuhhUm5/PdhNks0C/Jo97ttiROYiy47RxRZ5Eu8153cnyanCtlG38EzuINzNaXg=
	=
X-Received: by 2002:a17:906:1f4a:b0:c50:aa10:d898 with SMTP id a640c23a62f3a-c50aa10db4bmr727613766b.26.1794917282269;
        Tue, 17 Nov 2026 04:08:02 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8650fsm525227166b.77.2026.11.17.04.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:08:02 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:08:01 +0100
Message-Id: <DMXH2NN4W05P.20N2ROUFAX0WZ@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v5 10/12] arm64: dts: qcom: sm6350-lena: Add PMK8350
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
 <20261116-pdx213-upstream-3-v5-10-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-10-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Configure the thermals for the xo-thermal thermistor connected to
> PMK8350.
>
> The trip points can really only be considered as placeholders, more
> configuration with cooling etc. can be added later.

Same as pm7250b thermal patch, could be squashed into "Enable PMK8350"

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 12 +++++++=
+++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 0bb714eed13f4..b86fe11fd5296 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -105,6 +105,18 @@ active-config0 {
>  				};
>  			};
>  		};
> +
> +		xo-thermal {
> +			thermal-sensors =3D <&pmk8350_adc_tm 0>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
>  	};
>  };
> =20


