Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810940;
	b=5MV4gPKRJLvpiEZ9PGbLbc/KmPcmDHS8uFp/AbYkx5jEWdDepnbYnsWr3BxF6nqZjySC
	 0bZcrJvVxHTPelO/+VtY0gPxld7t9FGrKy2nz2Cb2B6V5r0v1Hb7WLNrtoAuGeTPYXgb2
	 ZAjZ8YhqDrrQPmpXxZX9XJBZt4NjF7MNMS2IU48ksT8S8np4T7d9BscrUQvumb4WD2qTU
	 0krXX9bk3I5LOCN9eex56+VKGlQZB8o/xC7N27FQBRs1/GTmhjH/zunJiMD25Zwda4Id+
	 H470A1y9QnVFG7G5PmNDBOMcotIc5Ht9VYR6/mlTa0uqIP8PqDdRAyh3wq1JZhPlXZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d42c0lsKAH/3dqQCFaUwqRJoKAQ44ktKOlAIQMH1hCY=;
	b=XG43hMNjACRLFWrqcNHaTSs5mhIvgIiVbo5vw+K50R4/EEkjg0cAR+bu7rtA4W8G/ag2
	 gEJ3xmnuRmWuU3U7qx3/CutZoE2jdhZwW3Zp2UVDA8ik5I2ZEDDdrBEM2HkVnFAmCLxFv
	 O1EyaDbgMVqU4anZB3G9pF/J6uc0pkR15Ps/DbFDHek3l2jri5Lkxa8aXIIxlBdGzcoFe
	 X1EKsQienEH1ibAtFIm39RrM9Y53WQCJ+J2+G/J1CkUgfQrh/VOEmJmm/x5MCcBN2nB5m
	 9Kl16hocshpW1JRE9DghHeNGY0VPKT91r+Fp/q5E5fUpYGWH1xEo8xT6BhZM1HtVUrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OzxlIDvH;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A64606A31B
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 03:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2A64606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OzxlIDvH
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-70b875f6f1fso841276eaf.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 20:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810939; x=1793415739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d42c0lsKAH/3dqQCFaUwqRJoKAQ44ktKOlAIQMH1hCY=;
        b=OzxlIDvHsBuVBGUMT+8hhDmDm2eraWK4nTBCUKtlXeqdjCWhOVVKs0LEyTlgA4CakO
         hOKTMvk2s5xQ2y7oiVo8Ei/AL/PfDavAKCBaVNpItzfDKRkzgUD7Twkq0cvqIviMydD7
         zuC25cLkocAPUh0ikOsEUtnfkVBmqgPb2+l28VMJp92uiWHwteFwFEGY6TWTRc4tgHWB
         FeJVCGiXbSScFv9BuFW6Vip5MK4mRbIjVaqDILDiX1HgF3TS/xxaB8AMt6j7NAK9PPcK
         NQW5rwFHVWiVdtnAoDsBwWw72WsW23ZWXTl87S5F71ZAwgGLyBQ9+5K9O9Q/2gfvolMj
         2Iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810939; x=1793415739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d42c0lsKAH/3dqQCFaUwqRJoKAQ44ktKOlAIQMH1hCY=;
        b=AwqzVM3a6NHJV6jJUGccuwG3jJJf39+h+BjXXl3+bbi8xd56m96wgcopV7k/blTbJW
         raaBqOFiSToR1j1M6/iqjs2y3IyXURw344Ai37Wz5q/gQjhqOEfxyu50OyZrWB6hU9gm
         XG2d+nfgNEGu4VhIUZBI+kftWQWIEqjdIzDAiaeUCZ3HD2XOfEbsrHwhYwzaQP+SMQEc
         Vu63Us/5ZQoPFT75veArZRT8PtZiemcMnU9Z3DGDJBbjxfkPES1JDYDtg6N0IcoxvYPi
         qSy9inXY+vA6vNFhQVM+bSahfDM16UC9oftFDjWGPsCp8oDSIb1XvQ7CahF05UVmRBPt
         X0lA==
X-Forwarded-Encrypted: i=1; AKwUvBxzpLQT97+FXmXDCs9Y+jG65C/F1qSVuMXZDuBK1aIJ9iF7EiOfAqkH344VK1wmYFcXGreUdodK3HGh@vger.kernel.org
X-Gm-Message-State: AFq9FYLH3Zlov2MwecWAGzdryQnmJzYEPn59VtmICXx7R/UkdTWEvCLF
	/HuUl2532P5vQ+yc03riubtDY+i2dQZadnwzNORdKFkxcv96r/0DD3OKWybndtuMako=
X-Gm-Gg: AYBFou11eOosYShlXODuFY+tZDCU7diMnVCGX+fxryLiPSUjJ918tLpgilU3BM/FAHS
	FtQxS3PmmxipIofj9cWqaWGfaK/3TicKIvV0ZyK1++uPFiD+d9yktXA/RPojoa2S2puJvXEvmKh
	vfOa8e8gnQI/SuMOflNd7hwceQ+XYO+/T8/i/yZzj3Bo+oSSPz8sLI5lB4bJRtTk5C8MHHplMWX
	2D7D2bMSFGGrBBJo9SbFl2YX30by7b+SF2WY9Gees51kQRGRoTCTe9AtC23lXYjICzD03p+tyxE
	UKhRHEy2nQzbB9F3C6mQplIwKnuxPJW4kl5n0B6cPIQdnrgSbIJ862Mut/ADGpVLkcqDXOTVu0/
	UMbZoOwPTSKSMNfMo7Hyte0+THis13gWiS/rMrmssPz1TAebCFqKhJCxcliUtO5L5B936XhaNEX
	NGkMrJFmiqu6BCjpGO2sTcRKvaWpDc/vRfJer0Hh+v6WFy+4WxbixCxunwuBaDLgQ/XK3OXhabQ
	EGkXqaSQic/BrTYV2fGaKmrOFtlLAIVQB6lfNcXJfBhIj5JwnOcm1DR8U6hGBBjNFshq2Tzm8oo
	x6sy
X-Received: by 2002:a05:6820:a514:10b0:708:c97f:5542 with SMTP id 006d021491bc7-70ba0f72e95mr238732eaf.76.1792810938704;
        Fri, 23 Oct 2026 20:02:18 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:18 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] drm/msm/a8xx: Add Mahua GPU support
Date: Fri, 23 Oct 2026 22:01:24 -0500
Message-ID: <20261024030142.13643-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 25 Sep 2026 02:44:34 +0530, Akhil P Oommen wrote:
> Add support for Adreno X2-85 GPU present in Mahua SoC. This GPU is a
> smaller version of Glymur GPU with fewer slices and smaller internal
> memories, but shares the same register layout. Also, the GMU chipid is
> different when compared to Glymur's GPU. Add a new catalog entry to
> support this GPU.
> [...]

This fixes the rendering corruption on the HP OmniBook X 16 (X2 Elite,
Mahua): GMEM is now reported as 15.75 MiB, and GL, Vulkan and WebKit
render cleanly without the sysmem workaround.

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
