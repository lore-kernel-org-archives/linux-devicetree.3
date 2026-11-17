Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917473;
	b=WdtKjy9q225Dyzt+QyZStYbBO+u+jtd6a+f2iLEqdy83g7jULXFBwCbSBOczcR7rG908
	 uxOZa8LGmjGUIT2aJPBlXosej7pi3jMn9G5bTdWJrFQNq/mSJrsAvDwAlDOkXzxIa+qG+
	 tYnHacaUbYayMn2QRpY4eJmLtafzTDfZVvCFF5qCfvQHQlY9GFtEKvV3aWBGXc/Yl/J6f
	 MWehcUDXz1Z96jnoLR81Kh01BMOUSiirswQ/Jkxz1ssHK78wC9mEzByNBHCTza4dsTSHg
	 bssjHz/rCUD5gQwYgP5ipaDfyqWyI9bALshlpRXNvjUSd4DEASm0apUni+SpiHiaXNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=cWtgHE8VVeVY+BSW9SOQbCd+UmjyRbtL0IM9idnQATQ=;
	b=eI5w4n3IuGXsMrwcCXDDrEK1TTI/qW1SPz3wN9MbLnczp3eBAig+eXAxE7kSY162xlOG
	 Im7ZHt9J5T8ZHS04WV+D0n7D6yr2nWB8vrS85bucfoyvHNDM8g1EAqAuMPJ1dN4mf9sLy
	 fkN8bVsa5uPqzhhaRvGuFfqVGfKcdwPYLynOiZiIgD1i1luwh8ri2AjQU0WqHey9QF8Ds
	 SzA1RunpFB9MdMnq+xmLFXCRA5rYaExuMn5hlqbsZ7aVHUOHIvuT/f7gUYp4jtY5KdSCh
	 mgv/xVUCuP3VORJZOIrVrBys7u9+oqgeESey8nOM+fut5PQZ7c/ZxLDGqgtYsiMV5tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=03gGhD1o;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53519606A323
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53519606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=03gGhD1o
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50cc7540b7so368564166b.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794917472; x=1795522272; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cWtgHE8VVeVY+BSW9SOQbCd+UmjyRbtL0IM9idnQATQ=;
        b=03gGhD1oXvzdNQ6GMOGFyWvweh+BeNUIH1kjQoSj5t5WVt6fEShCorX5Ah2vxim8jl
         HZaxxotQyQi12H9UafUZsOniourPI+skSJUdnXsxuxLgXXTgKNDvqDylE6HEaWDIL6/L
         FYZ2ES5zcAVUbYujkR8v6B5sdVmJR7LNi+9jbHBYjytKkGzh2eVmTI2hmUlmXjMlN7aN
         4uVGgaJb0pn1E7+Kn//5pEJi3l1fvxcASfG87z7AjBqx2uiS2WbdDl/+d1o5mro4aMv7
         sOR9ro+k/qlVfbs9479IMojiXwNER+sdygJQwu8tMzKsAsNf231XkXmmq1u6qrDUGtgP
         f/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917472; x=1795522272;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWtgHE8VVeVY+BSW9SOQbCd+UmjyRbtL0IM9idnQATQ=;
        b=GJ9HIY6Jyjx3tK/Pmsm0j9+BN3fyuFEN8tRfSWqTrZLsqgYfQAd1iMb8NW707D9tXB
         HIENz8AMdVfQRhEs4N7rQq+Ix1lwS6SnBBwdnNVg9ja4f8yS4y3MZSl91HaDdE9aEQz3
         6SN7PeYKfqwlNRJE0mahVXzsNeKB2Hj4yTEVWAOj2NbVz3oS/BWBuZAVmt+8v7x/pqJl
         Bl71BgsKYPSKWwePm4HvmulBfQ9P5Ct+S/J6zRm25kCfyoCatd5O873Kr6dw9pIav4UQ
         1KKR1i6T54NuJvBjiNnnAS9fSA1c5VmHVVluJ1O9HXpCRzXKw1ZZAoifvSVbN6/Ws3Vj
         Ztkg==
X-Forwarded-Encrypted: i=1; AL+hErH2Kv4CM9U/8wxNVWqt6yxGyEyMkmUn08gvpRGaz4GBRBaAvGkVsk4aC7eetxC18YNC7KuYJ1XyP+Ix@vger.kernel.org
X-Gm-Message-State: APuU4Z+eiXqt98od+ttkYTDPRfM/1G8uI5CZ+CcZsTq6BLzMtG1jIFvr
	AdpJKa8i2f6Mj3AgxS59x4LI2pPt2k0yn025xBgn7BXHG4i/Zk9wjZKup36WNeSVJj8=
X-Gm-Gg: AYBFou28w9VgAJYE+bvn+xupw9ntCuihvR95e7U4N0Bsh/J435Gva6z1zv5qkS21Lfz
	9HuanvLIHqTzcpJbArkcFeLevNfpb8Pj35vd9pUL+R57h8l9WAR6DaG93J3bzws1mdesWm3gWu2
	Qk27CtdC+3Y21kAw4Ml+t6iz36ghs88pIHGYViVNK7mfVuFs0XG5GZE+qgJdMLRqi3hxX/wi4yp
	BI0DB/xqdCM0qmzTKfY0CS9V2kxawJhIg9hbbt4GVlgvyVWZ0qWbm3XhG7jXnPfCzS2F7uGYBet
	7UArFYmmOPefhoZZoniJP1voRWQEteYejB1CuZa3kmArVlAG+np5a+u/1sdH9BwPcupKDVIdQbk
	HgpPRihV1gOfr9wEi3qtvOHNKczRGmqe/qYalVRhK5DIDVTK2yQEqLEu7CKb8BRHOGNClkL7nCF
	vBbS5Tp6Jb3nmlyFABDJn+dPUQL5tH2/N7u72iCTMWWRbVQ8ytHY5QyP9x7BxjSVm7G0+I5nlvM
	1JcBv9yt2v6YOqBYnuErW0K4XaOEXK0mTkkcAImVkaY+y7ekLsOi1iTejaK6MZof1Lxj602yEkU
	X+Du9YjBp6m+uZGlei/PBcQHdTFxuOMxc689b4QHK3jY9oGLzagOwqa/3PkTa9+payr6Q4tQF+1
	0XOF2cSwdsurWnEkkB/I=
X-Received: by 2002:a17:907:1b06:b0:c48:1977:e1c3 with SMTP id a640c23a62f3a-c509633f436mr1276035066b.21.1794917471802;
        Tue, 17 Nov 2026 04:11:11 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c00fsm532002066b.3.2026.11.17.04.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:11:11 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:11:10 +0100
Message-Id: <DMXH52GLPXUT.236KX5W7LSRY7@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 12/12] arm64: dts: qcom: sm6350-lena: enable
 remaining i2c busses
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
 <20261116-pdx213-upstream-3-v5-12-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-12-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Enable all i2c busses where something is connected on this phone. Add
> comments as placeholders for which components are still missing.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts   | 18 ++++++++++++=
++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index b19e76b3c1a75..08647584af0ce 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -438,6 +438,13 @@ &gpi_dma1 {
>  	status =3D "okay";
>  };
> =20
> +&i2c0 {
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";

If you resend, add a newline before 'status', also with i2c10

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> +
> +	/* PN553 NFC @ 28 */
> +};
> +
>  &i2c8 {
>  	clock-frequency =3D <400000>;
>  	status =3D "okay";
> @@ -455,6 +462,17 @@ touchscreen@48 {
>  	};
>  };
> =20
> +&i2c10 {
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";
> +
> +	/* PM8008 PMIC @ 8 and 9 */
> +	/* SMB1395 PMIC @ 34 and 35 */
> +	/* AW882xx amplifier @ 34 */
> +	/* Foursemi FS16xx amplifier @ 35 */
> +	/* FSA4480 Analog Audio Switch @ 42 */
> +};
> +
>  &ipa {
>  	firmware-name =3D "qcom/sm6350/Sony/lena/ipa_fws.mbn";
> =20


