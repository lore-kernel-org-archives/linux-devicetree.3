Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE8237DE99
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 08:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791187781; cv=none; b=ltLGKy55EEd/5vKdvKr77EGbUNEz6+dzE9+whzR6Om6QhN8Mf8ICt9O4ogMRiIpnw/LslrjQ/K2HM5rj8Ul40i9zphR16Q5bqvof5PWoMedBzqhVKb0cm2PUSRNPfGm6CwLGF2KEAiC4ZLQnlE3Zyaj6emVqBu3yxLzrO/3p33w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791187781; c=relaxed/simple;
	bh=sp7moOFoU87sCpnpLRLXygO7kV5Zv5K8JRGo+3bzcNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9WpaBj935lKzTFhH1AGTF53n2zNTKvfg5c0RX5O1sYoyfbs+Jk85RbPYEmXgXwS+lnCdkKmKx6lKZhd3dbSxCZ1sAiesHeCK3Nb7KvSSYjlTtOocw+7eeSGzzDiiRm3hf8CR8+4/2GNQBOg8uPQy1FKU8s8AVjGMSjuNMm2lmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WNwRMr65; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WNwRMr65"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso15501175e9.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 01:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791187777; x=1791792577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F0RLBXv8GCFvA3UGkYd6Vj6CuQ4sgMyjZDG6+lIJvG0=;
        b=WNwRMr65sSzCDbOqcWkfdFXNmq+KAQaiurLJU8dCNJJW7ct55202RdvRyzhpPKJig0
         JP/F6nzmlZF3HH38xvyF5YiCShvaqET4UqDTT77b0Zwd8MeMtkc9xvTgE83WQCKX7VVy
         NRlDK/CJsRnBqNyAKtXDTM7ExU56FFUvOQ2lw8C8k7FyiX5etn2v/hWfHBaPnM5sOyAy
         PBp+435F2cZqkTpOh2wGz1PabasnOUbblXGrp911qgsx06QSgIWgeyQX8dFLFG/paBQN
         cNgHCZ3KdnZ3yfRvWCqTJiBisa55/LQwD/TdDdsBQXfVHM/xe8nNOa3jTBoYP3oudA1J
         h4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791187777; x=1791792577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0RLBXv8GCFvA3UGkYd6Vj6CuQ4sgMyjZDG6+lIJvG0=;
        b=ZNfb0BgHBSOD0zoxFPuhBrtp0qQsnUV5XkBWtPn8kykPo641WT2IKVBVEhhLIcoNSo
         zOBQ0f4CMd5Wm/8Mm2ED+kmTlf2Dg2fy9BopMjPhpBLHkWbsXn81A+NoYgb68vAEck6a
         PDwLDm8D5DkoV5SgXArzhMCuehiCA/6g2aHLRZnlLO9/KTfLuYiTMTehDTSdwDCQsvXf
         QuhtmMkbFcvVP21fzMoT4x76HToyvavUGsKLXgjMB7c9ugvQvEkP61pbezJ/BvyovrV7
         t3tJQ3ae20LSK38JsSlor9SqxxHNnkgLfzfcEvHuEtEuJ/RuPyRW37v0rlnon4LRnP7C
         n4aw==
X-Forwarded-Encrypted: i=1; AKwUvBwliEcd0nFhNer0fCmRA7rj4CzLAXhQ1IR/4E4MQGnY7mwqth2tEVdUybNs5Vua70b8d4FhZjfO43CG@vger.kernel.org
X-Gm-Message-State: AFuF++mAqUTNSMTNu7yEDhS5L0ahIZfXmR4Iph3A+3OOZEudK3u8snkd
	fuTCHBWqI3Rl8xoEJ8OCFzCkLnJx6XcrmNeiZsrJUthFbc6WnlrQdoNxepXp9clFtDw=
X-Gm-Gg: AYBFou1JscAbjXU79zUK1CYY9C4xXId6x0ji90obMNKEbt+8ddAWaSXtv4QqGDJCIvc
	h/5iEVNCM9CXnKTXooudbs0B/8CLn5a+naQCY1vwiwyfJx40CKEamx900lo/fWzGRNs8qTaNnvH
	WNkrnxQOkMGGiDfh3ThHqW8tkI2TliAP8GVShhJn2W5lZMGFPhJcNBTzd/ZNgl/y9+DtDS6Ps4M
	0E7/BxTcIjB35+eEC/YLGyTrJ9cTuvKhcO5dk+9mlzoaTChZqRJYjskclDx12oEgbeTWY6tX6gF
	u8t3hm7OWaVu9zdWYaBTWz28PtW8GbFq0vCLNxMN5E3k7g739OPd8bL8qY/XlyVTJ+ZJ/XqHa7O
	8Co74WcgrRfZY1FIJzPjI/kmt8G8yLGQBf9cHHRlx9DyJGHzEN5MLFkqTviRiNujPWufNVSt3PZ
	U8jgSlYpABAGtlz6XCTaMgdxhydlvQRNAbPObb7/dWzR7kg0hEA939mVt1zJDA4UPq4qFdSR6uT
	9uCh9lZUQ65
X-Received: by 2002:a05:600c:4594:b0:4a0:22d5:908c with SMTP id 5b1f17b1804b1-4a1680eee54mr83735285e9.12.1791187777343;
        Mon, 05 Oct 2026 01:09:37 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:ec49:36a8:7075:6d05])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622ab326sm1850803f8f.35.2026.10.05.01.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:09:36 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:09:34 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Alex Robinson <alex@ironrobin.net>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Steev Klimaszewski <threeway@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Lenovo ThinkPad X13s embedded controller support
Message-ID: <asNbPjMB_Jf9PL5C@linaro.org>
References: <20261002154231.31376-1-alex@ironrobin.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002154231.31376-1-alex@ironrobin.net>

On Fri, Oct 02, 2026 at 03:42:48PM +0000, Alex Robinson wrote:
> Add Device Tree support for the ThinkPad X13s embedded controller,
> providing keyboard-backlight control and firmware-driven brightness
> notifications. Its event, backlight and power-management interfaces
> differ from the T14s EC and require a separate driver.
> 
> EC wakeup remains disabled by default because lid closure can trigger
> an unwanted wakeup and no selective event mask is known. Other EC event
> mappings remain outside the scope of this series.
> 
> This follows earlier X13s EC work by Konrad Dybcio and Steev Klimaszewski.
> Development was assisted by an LLM, including analysis of the X13s ACPI
> DSDT and review of the implementation.
> 
> [...]
> Testing:
> - Confirmed GPIO103's firmware-inherited pull-up on a ThinkPad X13s using
>   a vanilla kernel with temporary probe-time instrumentation.
> - Verified that all three v5 patches apply in order to Linux v7.3-rc4
>   without the separate PCI workaround and reproduce the current EC
>   source files byte-for-byte.
> - Earlier v2 hardware testing covered keyboard-backlight control,
>   firmware brightness changes, s2idle, lid-close/open brightness
>   restoration, and EC wake events. Those results are historical and do
>   not establish validation of the complete v5 series or its revised PM
>   handling. No v5 build or runtime validation was performed while
>   preparing this submission directory.
> 

Nitpick: I assume your LLM added this bullet point(?), but for
submitting a series upstream this is kind of like "shooting yourself in
the foot". You haven't tested this series for 3 revisions and your LLM
hasn't even build-tested it? Please make sure you test your submissions. :-)

Thanks,
Stephan
