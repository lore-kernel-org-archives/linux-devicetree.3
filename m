Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586722;
	b=mMdMJUbHS1WquUx9xlj3sqqDY+egUxKek7UGpodBVEXg4FrLGGXwkldCptUTbC8q5Ef3
	 KgZ1X2iECmg0ZeUPu7yMGQ7KavWo/DkR63nr/QPbej+8kHG3kHopF1NDIWLo0ZN0jrgxt
	 Kgoer/8daHAO+MHn5QrX+1NdPB/MeAVw9JuVQc+cYQf4REpDinLq0rZCJYooN0Z50J/zN
	 O2lcO6ECVlrTn59+5VSBny7ndW/SN102xV0eELyaXTlpLw0wTuMg+VK9td2f1HpGtwTHv
	 ksDT4apf0IMisb3VWsz4Jz5+KNM5/BCP2r1C1NnvqSVMnTnNcwmgqdyezYSJJcSMnfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Eirh/4i1JKisBRrsumJjSRboncwjaisgQnevXkb1w8M=;
	b=qvMaVZ7Ch+vUKuptTZTcFV2a+ZIrH1I2sQG7y+LHh/z8xw3PLirDZMYCVXWFlOl/39Gi
	 wkmYFzLS18xUyWnC1GiJM29QZ5MFrzM3nJVl2Wo/hG4WHpXyxEXDDElnhhcxnqJrqsisJ
	 PkdXJ7Q0Njxc0G4O/sMVCfzAQ8bauR5CuVGOCFQ9ssUVb2V6DsBp1CoIZRT3/Z8xODEUY
	 AfuoPd9NKDPOXejn9xq5zgyozRET50uMrdDOTtz8ez7IKzzaQoQTiM5n+U8KSMGb2oblR
	 N1WDOaqZpcirjwomyfUsCCWTuT6MmxtWSNRAVFg/oGnUTE7M+c4qpmxhTKfDBFFUjkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yjhmdKVw;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E388606B5F1
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E388606B5F1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yjhmdKVw
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50a4a2132cso146438166b.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586721; x=1795191521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eirh/4i1JKisBRrsumJjSRboncwjaisgQnevXkb1w8M=;
        b=yjhmdKVwhgyn4D7EM0Gsu2vsr6fFRcxco+NGQ47gAxko/YtJCA04OisCQ1Iw2HvjIy
         4Fa5S30QLSpB1+kQYDitQqHVfSdPNm4cbDTjgG8gWuWUy+hX1yt1d5imYRhFJvN/sdSB
         Ny6KaoPZHQ+xAOYhc84a0XO1w/cOTIvW0It9Ezo/wDLAHWGbZmOYmmU65eeVWm0GGiv5
         gr0pxKUzo4gpnoL5bG+mMERL+JsWDVFB9XcdHC+7jd8nyvj5nexLWxCWwZhencyZnmNe
         D8xRPSEnyjmkVqbHCjW9wKg/U8Dy6WdE5CfjiiOH6RA6+DPCSYekgN4hGIwiOUqjNNLp
         hz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586721; x=1795191521;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eirh/4i1JKisBRrsumJjSRboncwjaisgQnevXkb1w8M=;
        b=XhdaYvyNBtvavp5Ww70reL+xg2dXtJEtuLr3b24Atpj7VFyMSSuaduJr0syIdVeSDZ
         OZF7wGOcrYKmsVTzkCSoqSnW3xkOH1FWE3zj8W7eNRZXJzXtW26Lz+iN0LiGNOuwrKtM
         4tEjiCXu1oZnrDQ7agzlHKecIDg08ER31Pk4D5tVxRMDUrcNKWN2lpMTUrtkbJTVhVCL
         md7/hz8fMeddyWLQQyxIbBHkzaxxiqi7/xKsJRtHPt/om8cQrUuCQ1+HzrmZ631fmtgp
         fALdgA4bn5Vv+/SuNoBLO+kFdhXuOhW8DJqmj2OHfXNRCB0HggvKE1nbwjZjYkteo6WH
         jscQ==
X-Forwarded-Encrypted: i=1; AL+hErFdYc4+k//HGN+gNZAp13D7ZzMu/oC9zkuZd+Qf7IXUThVFRx/ug3IyyFhkxJuKcTjnUp8EU4tGC1C1@vger.kernel.org
X-Gm-Message-State: APuU4Z/PhAgfPnCdwYCNYoPH6pPE73T2XQDHagAQT2bRRMEKdpdwgOPV
	Di4F2BOLYQEdwuruuWD1uI8PynMr2YrJ+9+kCUh5oRaDfT4L0tYerSQQ
X-Gm-Gg: AYBFou3AwCcDtHiCqsfU5II2vUjdBR4QDaINGgIzSbdxymIXkjIvTcatkr+NUCn1lg0
	lzwoSLNX3REx0t6PPv/JHOJ0Isfs/ECwEWwnERqmNPteEdLHgjzrf+VNZTtezUsfkmxEcs+yqT6
	xXvLOBNDEkWjYmSCP72unvTjyOsq4xULIMQQkAL3cAjMgbKFI/nwxPU0ad8iDoBDFVnN+Y81XrH
	bEDlAwZazRZzNN+XV4ch8Xvj6KGAsN4WFBwIP6g5ltoujXb2yDGFKFocdyFVG8p0UK+fAbE/ty9
	4gj7cxZ0CL6oAZy0WeNu3fOdlgZUH0EhUjSqfRm1V9WTZxVOpGek9VjE3b76UFoauHsWa4Jrna+
	JKBC+VWF4eiY4dfn6XwKNpUdkITt4aZweFHAKaeXG2+5p/l+Q6kkBfCRUh54UWW8hxI0EePPp7L
	HxldqVlaLd91WIzLHIWeue4qx+tBVNJ9qrt5glnOb1lBzdzSjPhrX0Gob4w06/IUlmY72o4JMZZ
	T2Etr2siSmp+i7DFGyHxlEBMOe+W6U/aIj4Pz22b78GDMtCird5SGawgfJef8Zqa6AP4xxZXs0F
	t3uDLbibfagSVrwRzNbap7MwatmB1V1MsCjvYo+PTzWEhzU26I/GtBJxtObhSCTknZaxZtLUJ9Z
	mUhH1YDWOWg==
X-Received: by 2002:a17:907:930a:b0:c40:19dc:a24d with SMTP id a640c23a62f3a-c5096344fa5mr275778966b.9.1794586720616;
        Fri, 13 Nov 2026 08:18:40 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:39 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 00/10] Tegra Video Input updates
Date: Fri, 13 Nov 2026 18:18:09 +0200
Message-ID: <20261113161819.36847-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset contains various updates for Tegra Video Input driver:

1. Tegra Video Input driver is moved from staging to media since
   the driver is quite developed by now.
2. Fixes for Tegra20 and Tegra30 VI configuration (clock adjustments)
3. Updates and optimizations of VI implementation itself for complex
   media devices attached
4. Addition of Tegra114 CSI support

All changes were tested on:

LG Optimus Vu (P895) Tegra30 device:
 - MT9M114 front sensor with complex topology and irregular pad mapping
 - IMX111 rear sensor which has simple pixel array and a single pad

ASUS Transformer TF701T Tegra114 device:
 - same MT9M114 front sensor
 - OV5693 rear sensor which has simple pixel array and a single pad

Nvidia Tegra Note 7 (P1988) Tegra114 device:
 - OV5693 rear sensor

They all work and produce images.

Requires this patchset: https://lore.kernel.org/lkml/20261113145708.261530-1-clamor95@gmail.com/
("clk: tegra114: Add CSI pad clock gates")

Svyatoslav Ryhel (10):
  staging: media: tegra-video: Move driver to media/platform/nvidia
  dt-bindings: display: tegra: Remove Tegra30 fallback
  media: tegra-video: vi: Diverge Tegra20 and Tegra30 VI SoC
    descriptions
  media: tegra-video: vi: Switch to
    media_entity_remote_source_pad_unique() helper
  media: tegra-video: vi: Use entity function to check subdev type
  media: tegra-video: vi: Adjust pad assignment logic
  dt-bindings: display: tegra: Document Tegra114 CSI
  media: tegra-video: Add CSI support for Tegra114
  ARM: tegra: Remove fallback compatible from Tegra30 VI node
  ARM: tegra: Add CSI node for Tegra114

 .../display/tegra/nvidia,tegra20-csi.yaml     |  23 +++
 .../display/tegra/nvidia,tegra20-vi.yaml      |   5 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |  34 +++-
 arch/arm/boot/dts/nvidia/tegra30.dtsi         |   2 +-
 drivers/media/platform/nvidia/Kconfig         |   2 +
 drivers/media/platform/nvidia/Makefile        |   1 +
 .../platform/nvidia}/tegra-video/Kconfig      |   0
 .../platform/nvidia}/tegra-video/Makefile     |   1 +
 .../platform/nvidia}/tegra-video/TODO         |   0
 .../platform/nvidia}/tegra-video/csi.c        |   3 +
 .../platform/nvidia}/tegra-video/csi.h        |   6 +
 .../platform/nvidia}/tegra-video/tegra20.c    | 171 ++++++++++++++++--
 .../platform/nvidia}/tegra-video/tegra210.c   |   1 +
 .../platform/nvidia}/tegra-video/vi.c         |  47 ++++-
 .../platform/nvidia}/tegra-video/vi.h         |   8 +-
 .../platform/nvidia}/tegra-video/video.c      |   7 +-
 .../platform/nvidia}/tegra-video/video.h      |   0
 .../platform/nvidia}/tegra-video/vip.c        |   0
 .../platform/nvidia}/tegra-video/vip.h        |   0
 drivers/staging/media/Kconfig                 |   2 -
 drivers/staging/media/Makefile                |   1 -
 21 files changed, 281 insertions(+), 33 deletions(-)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Kconfig (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Makefile (84%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/TODO (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.c (99%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.h (95%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra20.c (88%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra210.c (99%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.c (97%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.h (97%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.c (96%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.h (100%)

-- 
2.53.0

