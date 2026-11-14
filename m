Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690759;
	b=XaUZ0BbI9dn5YQA4BfEk+X4dCRPoJKi42SksspZTqSl3/jOI3Nd96HFHtzfHHw6DyLci
	 cfPrr5zEVi4GJD0QxZ+yEubhApS1Oor05sHqSOL8+C3GgnW/tXPvSwYKhrtihKJ/PV8Kp
	 MwJLYHyV2ouwp5tyjrJtserlp1hX1AojUwsVf5jD9e/YCzhyqCL2zzRO+oajkWoc2qH5d
	 F+EP8DiVBZQ5BuKBKOUWfuIg8vIaL+gMZxfgCmVwnxxnzPNDGRH1hgT0wxBCPUKo7F87K
	 NRgidhEnyuECL+RN3jVoWDVSJgzSbY0oxcj4bOepex688HTS4IoTVRGDuvwvohbYTxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fYKKHnF9THpqWFzZUjRJH65VqrOR/R487VmPofFOtpQ=;
	b=xrb9St1VJWqxY+uMI4XVrhV8giCMffRUQl/MH4kSlj7NnrCFbB+ZmC2HwpnH/ppzfX+p
	 T9kwRE9aNlB0Bg0dUp8Ggblr0NSJ2ZhLm9EsgzTjbMqfnFH1V5LYgrZpyEFABcaVuNEDQ
	 akNpagRwsot0Q2vmlEeVbp64/r4tlHdaT6kkgtN175Kh4XzNsEX8ORkG2aZuYs7kpn6Gt
	 egKFHsSBU/MUYD5OZPiQGAAwKLYRzP+IIPwtDr7qXZWv7VXWLs0iZ7suyO8Jne5yEoj1j
	 lKDUnbslqlDO72eajuWP+UzW83PXBA85hwIQC2rVH+VkgvoAFHvdT10Lzzv47ArX5TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NyFD5umR;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680D1606A327
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 21:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 680D1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NyFD5umR
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6754bf2dso2547085e9.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794690758; x=1795295558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fYKKHnF9THpqWFzZUjRJH65VqrOR/R487VmPofFOtpQ=;
        b=NyFD5umRBWuWzXRNHhhTax4Br1mnDerRXAyYQRqz/o8qiZj8KHC/Tp2JZg61hJWeZD
         c8EKK7CxhwCH3BkUdQk3CuYhPMeeGeuyy7RPLATQxOFOTuVmdu1Fzw4pCjVzM71OKepP
         dkY1LIW5hV4G8uVGdCJfLvwnvLZfk2ZpdzJHZsAbLsxgebNvdh9wBmpyQ7e+VRNgsDF2
         7fWJjnv/jyW209F2rSZ369d8XNIyGTqRbjesvAMJ7c3Uo2gt5kEyxUgVxVv+YH1NZNcG
         H5o41mmOUdkevFgYBvMPeo+M5b9Bu/MXZDvto0zw53ZYfHMvfiAS0DpeeYGPSu79zEfD
         4f4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794690758; x=1795295558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fYKKHnF9THpqWFzZUjRJH65VqrOR/R487VmPofFOtpQ=;
        b=v6NAXW7XS7j2fGjykenUrdggi5WuiS7P8bY8cHudlun5QC3Yg1bKslbgFlIilM0YAB
         NDfGJIfx5wZ7YS120Jjlyf7dkxuKQFH4BIZZcQzrKpyS67IJ+r+ozSJoGiAG26qmk9Le
         eKDKcSwGQPl0SrP1XIilIXurSojlJGwzocVMIpvooHrMtGxAuS3pB3Q/sZc/01qA+z8t
         nvGfiiSPmnA6y4mEvXobl8G7pFPnfYCCdafO6oAhJdq3jm42D2JOxMka2/2xq9bI5PcY
         s0dWkUnH/rlb9GdokqZR9zI+/bg4DNVhJ4Zmr2b/Zc1J6XBK3RITK0ZbjDaijVQ1Tof7
         e0xw==
X-Forwarded-Encrypted: i=1; AL+hErFr1ojPv7QedSDGQIbaFzVVVCTAw4apYYPLzp/tdb96f/yh+7W13a41IMucIqZIqUIZgjWjaevEmVXA@vger.kernel.org
X-Gm-Message-State: APuU4Z/8i7ZB+SW5duspgkB3KcrFb21foSFoMRyj60ts9Ci4xBMqHWBh
	+1Ioe04w9S45IvVqLbArLpUeM2N4ppNVA9VpsHzXXwJLw0QwIKC1wzdb
X-Gm-Gg: AYBFou2t5ht6g9cbA2XMJbdX6BMNzxYbCPqPst+rR2UFGRGpVNhKtrkd07bImbPYkKw
	ylIqOOFh1VmVdmZJfZQ/2VcXKHoQ+7n3Capa3yhLdmilw0NXM+mlKxZ6WzpxmXr3CRdQxco0xBz
	afZhNe3JTlGCDFKUm1sFLipasv7shc/sRSRcx7a0SNsZpfW6JNO3w9vrE9hGVSHJPNADBuPVlqZ
	vyUOle+SOvz8jIJpiRbegy9TNvcbNA9Db+lxT+mKU1r1fbKEEUkSYN6j/gZG3O2E/YyTAysTQCO
	fA7o3EBVqewafjjx1KUUvf1ZZbxeLYDpAeFJmqTe3y/BILkiAXEsg7UhXCPF2uhSQxb/2DGquCw
	MxjDSB4vKVRXzkhMgJ5DTfnvJKNEnjje/UtgIJ4btikjMjeHUNocYfnnrgVH+0eVdZOMEdZTw9K
	t/0wNgit+wq1gbZ215lur178M9Ckuq1tOBEpKIF1NG/Ci/jESkxTqBUc5qzqcwXIoNdJ2RSzlQG
	hndx2jSrI4nDykT5TQJGNQUnshPD3xzxWXT6n5NglQSI4/Znz2hXWOc677aaf3Q/mulnxJDc6zs
	E2klJzJzZT/MuSr/OzUJ6r3JOKw=
X-Received: by 2002:a05:600c:e557:20b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4bb55a583bbmr84669175e9.11.1794690757810;
        Sat, 14 Nov 2026 13:12:37 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm267895855e9.4.2026.11.14.13.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:12:37 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Halliday SoC
Date: Sat, 14 Nov 2026 21:12:14 +0000
Message-ID: <20261114211214.1928927-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113-doberman-of-unusual-beauty-ce6a57@quoll>
References: <20261109-halliday-icc-v1-0-def7cf786f75@gmail.com> <20261109-halliday-icc-v1-1-def7cf786f75@gmail.com> <20261113-doberman-of-unusual-beauty-ce6a57@quoll>
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

On 13/11/2026 11:31, Krzysztof Kozlowski wrote:
> Why isn't the rest of interconnect patches (bindings) in this patchset?
> You sent it the same time just split. Please organize your work
> properly, so subsystems receive all patches, not pieces.

Thanks for the review. I'll move the OSM L3 binding (14/17 of the DT
series) into this series in v2.

Best regards,
Stanislav
