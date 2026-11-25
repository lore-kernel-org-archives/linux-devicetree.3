Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604752;
	b=waNhqlYOvAH6NyrnhTdeUh0l5EkJwZ/YBdG/OZjavWX7P9lPJggorIs5Q6T/xz+LR+Wi
	 eICy13uOQJWKSrIT0KeWB13kZfxigxg/z5u6TVhu3iZcJx/TkuPeZ/uEg5Bxc2Sfgpuxj
	 rJ4nmn8+s2A2+ZNLJGgueVR9pYGDDLI3Bgny//HS7cct38Be8D5VkfaREXC0EDvUZR/FT
	 G8EiC8hTogiDUHPa5dedmhSZwKIVUwIeMDs8cYJO3DEcLir/roJ0jUdGsaZSr7FtJnkGn
	 F0Vo0l/fkN/E1cUU6phwkvtcIZyNkUY44kIbh5EsE0uTnb5Cqm0viuDARRMpnno0QjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Ny0ODnWnV6171dn8DCwt5qzCHPJg4PZkZSQUcRv3Azw=;
	b=fPF80XL57V/NMT2aWgFoA5+oLBzylxmIVXkaPMR7JGt1s96GTRHc/yel3B4lNa4trW3S
	 Du3MRTPPZnfucwkKTrBCqImCg+NsWKnjLGkSfCrnzh0HJW4CPsecvQlrVxXdqESqDiP/o
	 UAv2vEKQGNEblTHxrhv2qAaAsQuIVn5ZGLc/fJNw0ytXIpvqzosJ/Y13qKtQePVHpIwdB
	 iyTkPe40eMGiylrd27bBCIh9t4WfQxsKzhWBJQI9czbUUP8S9g4+QhdUcCTAEzyZYSx5J
	 bBvfivwxjbZ5RIyOArFQgqt+KOcUWUrgKG026tzOF/ADjN/Da6daqXUAX+GZipNN4JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CEy37Vd8;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B4B606A68E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B4B606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CEy37Vd8
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492690dd5daso4257909f8f.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795604750; x=1796209550; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ny0ODnWnV6171dn8DCwt5qzCHPJg4PZkZSQUcRv3Azw=;
        b=CEy37Vd8zJASb+oDZFi+hiYjFEVNDIjOiGcpfpT3Bz+OWSOOq0UeZ+YVomAeulsXpW
         w83/oCdoKZo6KaEfFudC4PUWEtBL/bonDnXKMp7z/fcmQ0dq9Ico7a9MBKE18bJt6PMG
         PvIiyQ63vBQfNiAhjYmSnskO+4jgzH65nkzRFZ7I+4KfN2KYeLWTwyTkTwon84/16Ste
         2nXoaT4i8GIDAv3Up0tr08THHvgaOq+Sq4kYzUzs4svaPrclEGNIKGYgaBar8+Aa6ftm
         ClNI3LHGDMLVaEQhfF6jqxa1ma6Oga5UigM8TuOCl4VUlH9FwvWXhvn7osknppCiL8O5
         WOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604750; x=1796209550;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ny0ODnWnV6171dn8DCwt5qzCHPJg4PZkZSQUcRv3Azw=;
        b=u6mYwc4d7oNYu28p2QMAMM0dAFNZSZ6kC6PZ3isekpukaoDmhsZZ+j6KK62lxCOZaH
         E2rS/R2mXtHFQlcoE17BWTYAJuJXL/Jv794QoxYGXJDrFZJPWnCdZjNbjQuwv1w7dMRi
         rkhUwzuJI3AzY4BBwHmjiCl5bG80YMfFVgGpvtKe5y7TIfyDJbTqCe6vRjjdXfc/TINj
         4KK1JWcqzqiKeLQGbRqCCcZzOyJZ7YjegtYs/X1h2cqDiICR3A/KswLVVFoE5I5GsSU+
         XcBV8m737TVdyJyb3bwoSnDug/uq6Z5ezN7iN1syBLJr9oUDWmCg+CrdEa3GlBwMyBsF
         XNTw==
X-Forwarded-Encrypted: i=1; AL+hErFU67BccHZD1uJWh1yZ/tQlfkmni+M8XsTcS/k8qf91dSQN6SRoat2hzmjhC+wnBQNSXoIrmfcpo5/9@vger.kernel.org
X-Gm-Message-State: APuU4Z99iWnViUuNGkZFbgZWK7R+ahP/rx8oosJNHRTxxxAE1HyQwuhZ
	0w6SeaDlgXhgJdQUsNJSRtaYzG/HpCLAGehP48p2qcTpTB4r0ZgFoC7YIOMOKS5YhhE=
X-Gm-Gg: AZFdTZeWkS8qQ8wR2TFgiIoVPE6gV+qP6eGEmoaP4Dp3U7dctRILYNkKaaEe0wne7Yc
	bD3aofrNNYb9aYtRB21IDsFpX8TAG87Wukl8LzLffy/MAfItCtsXE2DdeQ/4J/UElQg/zhVon7d
	AeFkHNDZs4Gm2dOIS32lLbKymE1lbVORCX3Z+sgQtmk2zBvAfTHTYynmYH04l+UABtTuw/i+MYi
	t52KoQKmc1HxibJs4V9eNmlpECETRKlEdBm4APl93UD4n+Qvd+nto2PgVSIZ5oquPsv5UYg3wBv
	O9+286nY9Yv+L2CoJtlOMrv4pjmInX5vc925w7Z22M0ghEPD4wcLBZNOc0+k4Rp4BkfBuJQ8joQ
	3OVLK/mnBAXevEbyilXj3t81kragTMr4KHOBX5fFhyFL1nKMdAyFGUlSCjvP43kCkTQ2NsMmfQD
	z9FazlsYpnKUFHtqkV+6fnPwKyOfx2tSb1B3m7d2IyoLSfd3izA3PH885Wj6K5WmxgZkNn6bDEU
	ste+0OmFwuGpw6Ju/290XDg0+NbK80UpbmQXtx3TJO16HIhsq/EdomUdvJ8EgUaVhAGhZOyGBdz
	KjztosrDdC05XmlhIPk3K0Q/Lg==
X-Received: by 2002:adf:e011:0:10b0:48d:f99d:a0d2 with SMTP id ffacd0b85a97d-4abb2168f53mr24522718f8f.15.1795604749846;
        Wed, 25 Nov 2026 03:05:49 -0800 (PST)
Received: from [127.0.1.1] ([151.42.79.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm33775330f8f.50.2026.11.25.03.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:05:49 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] arm64: dts: amlogic: meson-g12b-odroid-n2-plus: enable
 SD UHS modes
From: Valerio Setti <vsetti@baylibre.com>
To: Igor Velkov <iav@iav.lv>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>, Dongjin Kim <tobetter@gmail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20261125-n2plus-sd-uhs-v1-1-cc2019e68da8@iav.lv>
References: <20261125-n2plus-sd-uhs-v1-1-cc2019e68da8@iav.lv>
Date: Wed, 25 Nov 2026 12:05:43 +0100
Message-Id: <179560474311.1313389.4488537313012289406.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=802; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=oyMGF25BX72C/uylXywl0ei07ucGN60OTc56dWF+k0M=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDNlsB7kc8j+cLuUtWbOaY5GFsNB1qWc+f+zsz+ul5Vdq8
 bZOSP7ZUcrCIMbFICumyMIy/d7vglK1h8YJJwtg5rAygQxh4OIUgInsl2RkuCC+9l3Ms6QtP1QS
 1nHvmyl56cTF9jlrDk78WFz/eeEXnqmMDJ32r76cinf+P/uZUv7zVRJx74WKqz7xPOCOMlt1/Vv
 pf14A
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> index ce1198ad34e4..1f49686f359d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> @@ -15,6 +15,14 @@ / {
>  	model = "Hardkernel ODROID-N2Plus";
>  };
>  
> +&sd_emmc_b {
> +	max-frequency = <200000000>;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +};
> +
>  &vddcpu_a {
>  	regulator-min-microvolt = <680000>;
>  	regulator-max-microvolt = <1040000>;

After checking the schematics and the devicetree I think this is correct.

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>
