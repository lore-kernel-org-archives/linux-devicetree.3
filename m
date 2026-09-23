Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681FC4825B9
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 22:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203498; cv=none; b=GjPCM7o+nHNNjYLQNTjf6MXhzQb2xX6g/FqCgrOzM4p0qFW/Obhk9kpWLWSDPB6+aI8zhxWJSDqUWcNK4YYTl3pq/2Hohyr2tUEVzk2nbNX2wuaKAafPMZO46JwkzspnUchDDNqwNz/9/MuNkCDlJiVBhlUtEd4bJScJXDgx+eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203498; c=relaxed/simple;
	bh=mE077adzSO60826bSPH8AmWIYay5TSVj9G861oBtwr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h6r1691x8Eafv4V54L2uSHGI/DNbQnE9IYagOrxgAU1R7fEifUH3KVeu12l3HRRFRkcFwO84nqoj+n1HCNvNhII1AnOSZeFN9tJqAu3raUbLdGidXC6l4R+o3XWD42gAw513edoQWB6VSJe2b1xZF/sjAPBCN0gPF8DjpyQ9yrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvhHG0l1; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvhHG0l1"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so5342435e9.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790203494; x=1790808294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQXtWNjNigWNQlYLBO5wxwxCg1hTWjPpuHjvfkhkF8E=;
        b=kvhHG0l11CbSMmLkesMZqC7nHoieLQCeADezEsr8yrPLdnUcmm6VD2gxnNUamGVxqJ
         yNkiGsow/oT8WVtFTz/GmN+r3rk8IvoX9ob5aM3h+mhtlZlryeVsj/GWgS1oiKsKS2ab
         8eWGIWszPCdCsnWK9SyHtqfx2xkB8tk9Bb/7oD0W1B9V4dKRgLFUFX3L0wWANAX8pgC+
         7+nLhg52dEyWIhUcaVuKFGwX80iwxf3kYq5GBywGTJrtS0QKFm0zVdmb9HxCEJ5Ifffg
         HNFry18gpRg1qKtOYiVhUFWr7b1vHAYk6kZDqc+82iAvh1HOnyihTq8nZeNdSN3Mbjug
         yrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790203494; x=1790808294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQXtWNjNigWNQlYLBO5wxwxCg1hTWjPpuHjvfkhkF8E=;
        b=lMgXeLMgI9DKIXUGLEPBOe/KPqDXmKRCXUn5BvuNCfcvAdhGAfC0FixqkLH0ayO8wX
         ks/ngR2cX0/nSGIDXUtBTkMvnY3J4SmMsE/Jy8AtmWW4RaO3y3Xpjm1/vwTsbo9yTXOq
         X09m/umyWhWovY5JiSsP54v847W0PoSkARe383MpPDAYc4EByp3VAyust+HFHXmdvMN0
         KCaxVL/22Tj/dUnw6BX5OQylB6vURstY4/TBpw/M0LgZRToF/y46EGWW9qdshrMcnI16
         d8/p6WS/lFatiQdF3zIf38mwiZ8YPziqOzFPTK/3bWxHN4Jo38NsAobjtsxWvILsSIM3
         WZag==
X-Forwarded-Encrypted: i=1; AKwUvBy9tLPgY15FgpXKYjpXTqk1YcHc02Zdr5dK2ajfZJmCKdq41QpG2PUCbz5JF6JJnxl1Ya1xvusezSn0@vger.kernel.org
X-Gm-Message-State: AFuF++mFzcXuFXwJ0OX/0x0tu7kpziaeJSTs6fajBtwOFMmxotHe9bqb
	+T/8vU6nCmoKdpNSx1zGla2X85/rk+rq+0UohU1qyjVYDIc7ghgDwRkh
X-Gm-Gg: AYBFou2FVH9d8EopW1QWukFOufIy92I2v00tMY/dJbbFZtgk84RHX6tmEh7OIucv/9d
	V/A+6triPkG8Ok99wK6fTNKfPySG7anJK7lbRVGqrK2sTJ6T3qfd774H7XW5awTIlJDB/WOM6v7
	+M8qmmcTTnyAqNXvwqJDyVf/Rj/zk7REVTOi6AUkMjvhqkg767skkbLTB71LIn592RjA2thdK+R
	ejifFD0sx2rVJYCUTtb4ckKW4VoEh6qs4fWs4LrCax0QfGopklFdiaXy+swkin0Scv7cCCxbxjv
	Ww3d74ywqt+wNnP/GGDqK+5hTyfyojOf4PC6YAZBdOdK78AFqEgmhZ3Lro6Xl3rJLkJHHW4hpWJ
	pXrVliG5vKSYxr6f2DP31gUVKL4XJ5aQl+xDbwMdO/8eCZNbATthVCbY1eKzV8A0ZhcU0qxO+xG
	HXk8Mw2w226i7NqoIDBevdR3RB/w/Jtsei+INRp5U+UN/CcWIhn9HR0hno0gASrOKaEaPa+C0dL
	FdSEtEe4s/K6Ra6RlJc8sRIHWpmfLa7qw==
X-Received: by 2002:a05:600c:6986:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-49fe66d05d7mr10255655e9.8.1790203494222;
        Wed, 23 Sep 2026 15:44:54 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5b9c16dsm31420695e9.3.2026.09.23.15.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:44:53 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: petr.vorel@gmail.com
Cc: abelvesa@kernel.org,
	airlied@gmail.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	david@ixit.cz,
	devicetree@vger.kernel.org,
	devnull+david.ixit.cz@kernel.org,
	dri-devel@lists.freedesktop.org,
	dsankouski@gmail.com,
	jesszhan0024@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	phone-devel@vger.kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 10/11] arm64: dts: qcom: sdm845-google: Move panel pins
Date: Thu, 24 Sep 2026 00:44:32 +0200
Message-ID: <20260923224432.190902-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920-crosshatch-panel-v1-10-de6e9512da96@ixit.cz>
References: <20260920-crosshatch-panel-v1-10-de6e9512da96@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Both devices share the pinctrl configuration.

LGTM.
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 18 ------------------
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi  | 16 ++++++++++++++++
>  2 files changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> index fa89be500fb85..a000c75494f1c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> @@ -61,29 +61,11 @@ &mdss_dsi0_out {
>  };
>  
>  &mdss_dsi0_phy {
>  	vdds-supply = <&vdda_mipi_dsi0_pll>;
>  
>  	status = "okay";
>  };
>  
> -&tlmm {
> -	panel_default: panel-default-state {
> -		reset-pins {
> -			pins = "gpio6";
> -			function = "gpio";
> -			drive-strength = <8>;
> -			bias-disable;
> -		};
> -
> -		te-pins {
> -			pins = "gpio12";
> -			function = "mdp_vsync";
> -			drive-strength = <2>;
> -			bias-pull-down;
> -		};
> -	};
> -};
> -
>  &wifi {
>  	qcom,calibration-variant = "Google_blueline";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> index f1379857e2742..d54cb47cdf95b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> @@ -473,16 +473,32 @@ &qup_uart9_tx {
>  	drive-strength = <2>;
>  	bias-disable;
>  };
>  
>  &tlmm {
>  	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */
>  			       <81 4>; /* SPI (most likely Fingerprint Cards FPC1075) */
>  
> +	panel_default: panel-default-state {
> +		reset-pins {
> +			pins = "gpio6";
> +			function = "gpio";
> +			drive-strength = <8>;
> +			bias-disable;
> +		};
> +
> +		te-pins {
> +			pins = "gpio12";
> +			function = "mdp_vsync";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +	};
> +
>  	nfc_default: nfc-default-state {
>  		enable-pins {
>  			pins = "gpio25";
>  			function = "gpio";
>  			drive-strength = <2>;
>  			bias-pull-down;
>  		};
>  
> 
