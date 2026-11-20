Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795150338;
	b=KxIO1fu8hYlPnAoGJjk9NYHE/1L1wkLVeERfS0xf85iushux/Jbunbk8FE6Tjx6SapOt
	 IO8Lk40kClVrWW5P1x008bmNybycBpbRJZUrNo7HWWxLYl99/aTO5k6ahsjr8euUJ9Sbj
	 S/i9eVYtLOGRl+LSG4kJu0QE9ZuImDx/rP2N1un9NNJbtU7LlHkBd4gFPHw65qY/mR0p/
	 60/9yghF6OHugTwMW+IPw+bGsTC9lnfm8BJiPNG12/vPfN1fYTAWFpgwK4f2zr0+VoWSH
	 46HBi0s5avfdWNK0Hu5Mmnn9zKozhIkwYjA1TElWSAMS/rCVx3OMVKV2WICXJ7ITexQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795150338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+rPTbtnQOxgg4ps2+oCkkvTGsh362mR1Rpl2s/oucf8=;
	b=DjdsQHXTbVg3r/8ia59uyuo5GJjmBamyvf/NOvcsMms0bb8yw1cavSX5nczdeOBWHWs9
	 vs+W/I6hxPCmwGVyZ4Fk3HMG0Eeyi3a3AhTrK14w8Cs5q63vwRL1eOKOp+VihyuNCChO2
	 OiC9oDxtecrqtv54/c8q64EUQuMSIaJT/kXtidqFkLADsAeWB7Iu1c5uZedBfi+OVTehN
	 nbeNk4f+L2lvz6vR8Zdl/j06XvVwJh5Pt1e3mPQjrUASXBW71WT9/iwVzuuUTb6gQv4Vb
	 a/20Gd9SZVA1ceAMv4+62lw8dXdQhB/YVSsMYq3j7q09Zw+IExVtdUJWCDuC5jH/a4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H98u83vO;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6630860A2603
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 04:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6630860A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H98u83vO
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-382ecd5cf2cso493093eec.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 20:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795150335; x=1795755135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+rPTbtnQOxgg4ps2+oCkkvTGsh362mR1Rpl2s/oucf8=;
        b=H98u83vOkfalU240xjpIMlt+5Ai3M+igDGGqnu2J4T3WCinYN4eU3bjbNo25Xqf3GF
         3WH6R0e3kVkH/lk5gSMI2AGxA91HKrwcHgfdDz0M8AulF6QLgCJyNwyfULF/lonPCDpV
         en9LyytncUYqyVy7+z6lg1edwwhc3OKhtX1T6vT/fsk371aXcWn1SiWTLkkjkslB0t39
         Whymd2zckO97J5hdawRoOrwlTTgz81tt6o0BL4C1S1I2A4+TM6Vu6i14lqtkEWeMwjJl
         41lcd87Q2w4LfGGWkMEG2SpWDV3jUynqkUnltR20y+2qZLAKvbW8T4UfoJrFfaLLJOFL
         CxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795150335; x=1795755135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+rPTbtnQOxgg4ps2+oCkkvTGsh362mR1Rpl2s/oucf8=;
        b=bTuQSAHBfNsnM3IQr7zmHFYtmt5CnElMDkj7iUH46uCPmFzmEZAZ/1GhIUwVdk2tL/
         A6EoweUG/oRqi5z4AoP+v/IirSxjw0PyGAr5yfoCFdxPX3gTr4QsKer7QSlDjdTuPma4
         8T+UhitAtyd7ruJmiESOPNlMSfyLrWGuKrLi0Y+LzA3Cig+6Oymaj8De3ImyhRC2uZNV
         9buyAMtT4rPciz7zCtZSMwQVRg3xcJC7TEUVbhqvsnJykD+0m+sJfmXtvSxKRBqrJ0PK
         3eBeiU44Rz/MY55JuTFhx9dVIRioZh4W37fBmgpbO8DyOpUmIgQyrBpbHIvW4uwtaRGy
         Sv9w==
X-Forwarded-Encrypted: i=1; AL+hErHyVg54wuusGsI7D/hBZjDopvkkonMnR+WmUyaGZ30ciFoZZAABkhVOtQNctOk80nPvO6LCnPwxUn2x@vger.kernel.org
X-Gm-Message-State: APuU4Z9EDCH1Y0TUXUH43GbQDDUUHTUixP39slzc1yRTrB0gja3/iUQr
	jrFsDmJmVjwjp3B6yh7DIUA+S6Di2qs6OUEXFun9qaOGNNHlOOI2Yd3aSWttTIf7COs=
X-Gm-Gg: AZFdTZdr4+hpAJzKkg2fwduySNxJrVJllZDMMpZtk9DNL+sys/sM6IeZQ40hSqiNagA
	kPGRLlf8ypJk34Bf6fiEFzmspESDYNcpa+I40Co+RGZPMWhAZSyDPGD01tLfNxUsR2z592x6ZFY
	7xmkzf9WQ1TET/3RYXWx/VgGcx0djmHj0fNPPH2+bRM4C7Qz/6pTrUMz5ONnUyMuUsSPEUKOLqC
	rl3Z+ZGl2xeY8qbfnDJeT0zPc4ELcGunG/z4w5fcksSjLFavKHTcDGPDHoDQTFRDzeA6IbrtcIb
	vLnhtaPY1maLKaT+Ji1A1g2iHbX+U+dpLUCoWU24k9WVwuyNMFatFeDBxSe+y07TryDndxQQ2Co
	wJcHtxRb0I1M0ev1InPEP9aQ5MjuBSeMX/jzG4OfBT5ie5lTyFtN72UU3o7z2zDbc5bKR9GD5Fp
	I+pWoLnFpTLrt6wQd9ieaoYDTKS+kMk7Fgej7GLmD1lI82fnlzDs007gYu22MRRx1Xc7lTeukIL
	RIIhZZwgLyqZh8fh/Ne72FoEAGRYO8hmOSEm9lhhwleg9zu93zY5OuBG/WrACT+TnMBLHIDqauF
	koD/Khw1RSqiG5SR5/AmQABoJQ+2W8zA9zXXWPnhHrsr6ei6axE=
X-Received: by 2002:a05:7300:51f8:b0:375:85ac:d14f with SMTP id 5a478bee46e88-384b3e786bdmr3144891eec.14.1795150335207;
        Thu, 19 Nov 2026 20:52:15 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm3768338eec.7.2026.11.19.20.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:52:14 -0800 (PST)
Date: Fri, 20 Nov 2026 10:22:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	zhongqiu.han@oss.qualcomm.com, conor+dt@kernel.org,
	treding@nvidia.com, jonathanh@nvidia.com, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, bbasu@nvidia.com
Subject: Re: [PATCH v3 0/9] cpufreq: tegra194: add Tegra264 support
Message-ID: <av_R-8aMX7lL83ln@vireshk-B250M-D3H>
References: <20261119111217.902071-1-sumitg@nvidia.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119111217.902071-1-sumitg@nvidia.com>

On 19-11-26, 16:42, Sumit Gupta wrote:
> This series adds cpufreq support for Tegra264, which joins the SoCs
> already supported by the tegra194-cpufreq driver.

Please rebase over

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/arm/linux-next

The current series doesn't apply cleanly anymore.

-- 
viresh
