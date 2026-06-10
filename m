Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE2D3DC4A4
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781085552; cv=none; b=Ra7HtJwOFuUHVTta//Yjujhj5L2/8n5MuZMRuTBs1F+wqStJGFxz1npcEQnAD3ftns6e0nXXqOgSN0qO8LVrHyfJiZguZcG+GEDNUoHS6Li6uY+LHg5t70FszCH6IFFK9kX2B+7FOtjNZ3DomN9sv/nHSGkEc1p1Cx1vnbIraSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781085552; c=relaxed/simple;
	bh=eKcLzyO67IVgXtwsIvJzg37AHzlW7FvLCJJ0XFLuVbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tg6J8BKiagGCDDs6olTj2q81lm90Bk3HRYSK27PRYLNFkS7wDngOXjvKHRQXOSba4eNrYilZXiWjGMo+qQZ1q8+PI82rHdwXLCA9FnhPJRJLb8KlBXzl+WkfARUEPOuUPO2b1i8xMTvlx81JPq3BLsGKmj8oUj3P/FQBUjADsww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=dR7GWIR1; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="dR7GWIR1"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68d233bf083so9353879a12.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 02:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1781085545; x=1781690345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qgos6DTNowDu7SOuV4RvbxhjW/qGH8PqNCsJnQH5GLc=;
        b=dR7GWIR1XDJRfwf0HP//FiGANrGEnpgwijSvSWCK7zJkIA4WdJk1aszO6tSbFsP6BW
         sEqoSJw/H6aQezynHHtX6foo7OehshfBydshjcokiUsZYXS8iNRP7+sDH8w2glis+iPa
         PAU2ICyjZTXanQaHPSOItEBwjU6lwtVj9D289xfAelku6YQ0U6rXt2uq/TdVMTZWVjW9
         D9rloq5yuAASgHP7ubTqL4hT8pvml+zvJevHC981vO0KhdYdQ3Gez1xj6YYo+zwgs7uK
         PF+8BJnQwVivMi3NneTTd7CyxmRnIx3PQPKjGq6dfKz0LRvmlAercvr/q5q7DVXcQ0tr
         Y5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781085545; x=1781690345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qgos6DTNowDu7SOuV4RvbxhjW/qGH8PqNCsJnQH5GLc=;
        b=X9qHYsJY9BXJ/54t//nbN4LBxhCAajXkIPkvFfuSjaObCgNIjCdDTl3f8IuTZEKj0r
         DE2l5dNYNVIARXld40xlFmrOl6IUWRGHHAgX5pUEPHmoR4t1LQ0HrTC3G69DKsvEa/U3
         aLdBf7JNzseg2vem9FCk4hpMIryiCYNL5qilQ1VPghzH3BkJTSuSkzQHHZ8Nhjth4WuA
         cql+7Am/7Hmgt0qxjjdFtYk+NiL1s+dMIiKx6T4MAh2DOtuuWXcf6aFfAvJ+50xnUbKk
         EOF4cjwNClwNQn3cysL2hwuFeyfykqdictlLfGi1TCD4v142wZw/csEWIwi/FoYWz6bX
         BSuw==
X-Forwarded-Encrypted: i=1; AFNElJ//RJqFG9AV6x/52chtID4S91aOSa4ixCa005AUpWG9lVIZmqda+aT3ShbJtTlHgiGRons0UzSNDBCz@vger.kernel.org
X-Gm-Message-State: AOJu0YzWKy1zmFC9xJjdEdjZ3Ygy2hK9Ay+mf4DuYyw9ag1YRaK5y+ma
	eNOrobhoTmFklnmXUQwy3iifmTP8mlgj9fLSeaBcjF3cvaZqnQ+HVMRD2JMRcFoTbUc=
X-Gm-Gg: Acq92OGqVoP8y/JdpuJjBB++KExKIRDc9ciAZ/tXPlO+FjX0BoUroR6RJrVoi78dsmR
	YOWgE6McT0GfLm7Xe+/4Ukr1tv/bZPOGtJeJrfaIaNNozTs+J3uO++tK37Rf9LIr+xrUMl0/q1h
	EiMATf/TNwWIq9BF3MceYshx6Y0FvCKSALLqYSp01L0e720iONJ/h8TiGharvIleS3HDaSGHwPZ
	G56ua/nVGSDgKeyDpA5VT8tBt4vj22GdZKHf4bXK3MB0wDggOevQ3YExGS1iu8u3uw3Wn0KYAcy
	YnxWT4yDyYgz2vEyPhPbf8iiTS5wKRnIgnw6Knut0HW7ocNam3NVh++7FFMCwNwtTmOY8nhSK9o
	Vi9pu2wlyPPuyltECf6QQ91YciT99+WublZUaoyFpLvz2PvfTJYOfqXQL01NS1GDza1ZNP3VNva
	qM6g6ygdjcOTCOlEiX/jEfaND6ucKkDw9+kJWMMJ6p8PtAip8bhHTiwQ1KFYJ/jKhFXzJHLyuIq
	IF03XRPVegrm0kwBRh/ZKhgaoJx2X5brDs1xHJJ6S+i8egm1MK2
X-Received: by 2002:a05:6402:3881:b0:691:6fca:c1a6 with SMTP id 4fb4d7f45d1cf-6916fcac341mr8225521a12.26.1781085545076;
        Wed, 10 Jun 2026 02:59:05 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([2a00:23c6:2736:8e01:fc17:adf2:34ee:6df])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6595c72esm9362431a12.23.2026.06.10.02.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 02:59:04 -0700 (PDT)
Date: Wed, 10 Jun 2026 10:59:01 +0100
From: William Bright <william.bright@imd-tec.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ram Boukobza <ram@imd-tec.com>,
	Tendai Makumire <tendai.makumire@imd-tec.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
Message-ID: <aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8>
References: <20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com>
 <e0731edc-81da-429a-a12e-a1d1b75f9544@linaro.org>
 <aig9licCxhtZbHMq@will-Legion-Slim-5-16APH8>
 <5a5cbf8f-07ef-419a-8d30-c1b0b2786312@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a5cbf8f-07ef-419a-8d30-c1b0b2786312@linaro.org>

On Wed, Jun 10, 2026 at 11:21:53AM +0300, Vladimir Zapolskiy wrote:
> FWIW due to https://www.nxp.com/docs/en/data-sheet/IW416.pdf "10.7.1 VIO_SD
> DC characteristics" SDR104 speed mode is not supported by the module, thus
> the selection of the SDR50 speed mode on the host side sounds to be correct
> in your case.
> 
> In SDR50 speed mode gcc_sdcc4_apps_clk clock frequency should be exactly
> 100MHz, and since it differs, it has an impact during the tuning phase.
> 
> Definitely clk/qcom/gcc-sm8550.c says that the maximum supported frequency
> is 75MHz, the same is found in the downstream v5.15 kernel:
> 
> static const struct freq_tbl ftbl_gcc_sdcc4_apps_clk_src[] = {
>         F(400000, P_BI_TCXO, 12, 1, 4),
>         F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
>         F(37500000, P_GCC_GPLL0_OUT_EVEN, 8, 0, 0),
>         F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
>         { }
> };
> 
> Can you dump CAPS1 register value of SM8550 SDHC4? What does it say about
> SDR50 mode support and need for SDR50 mode tuning?
> 
> -- 
> Best wishes,
> Vladimir
CAPS0 and CAPS1 are below:
  sdhci_msm 8844000.mmc: CAPS0: 0x3029c8b2 CAPS1: 0x0000a08b
For CAPS1: 
  Bit 0 (SDR50 support) = 1
  Bit 13 (Use Tuning for SDR50) = 1
It looks to report that SDR50 is supported with tuning required.

Best regards,
Will
