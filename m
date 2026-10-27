Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086960;
	b=K0s8FIOspQfR7Nn2Ij+NaA9jNubAytQQFlg+hD/17TjjT+4zZAnb27CVe+UFRVPUkIcV
	 3a83ufknwl/rLDTbGnK8zOPxLNur6yu5xsOs/vaerP2wtFHj2zttgfp86y/L0kGKr7gjD
	 abNpmM1RFGEJ6LBV5fxr1x00GPRaA/17ps4OLgQB+1V+RgF7D983fy/H/T2jmNGGn/iH/
	 yecoUGN8wracr6NLuo4TC8Ba4+oQ1Q9X05Cacj9UWMEZQKDiGG6gUAwxpEVtCwdXVLhwV
	 N5z4MtiweBRLqkEo/W7wA7RdWnrZz/61E/0G8xmcnpYvMJ5bKFNfWgjUi1sZhADzLUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m157EeAc5sLNKhs4hlgrRGXu0UKUNCa1GXuB3p4hzOY=;
	b=XjHeJ23IbC38fX5urRHOlZRYIO4vKWjhqz20aOM2e3l3uBnZLY0umz1plYoWEeWtWPVG
	 tH+a+Y17rgNmSJVH4TgjBRpPc2MXWmBQVGnPkCsvRmNenszbRznDgevAhjNSNtRCtYcTm
	 p5Vn8+5KcULqRfUtHNbxBwt+u9VO/kMnMzsWUS2MTZZ0ahpcENrTaSen7jBid+t0rsAc6
	 /KC3tAe6RxwOik+4ym3VUzijBWK0Xfe0aeygCnEt9MCEI3mRBD7VQqHenKBwHWDNyx1Z2
	 MIgJCOXsrYJUTmJ6pwjxozY4GkjrrCyFbfZSeGNpjAjbdP89SEanjwkCfpmWDYfnD7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bg0ZV5ty;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEBA606A321
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 07:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FEBA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bg0ZV5ty
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc502d509c0so1150022a12.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 00:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793086959; x=1793691759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m157EeAc5sLNKhs4hlgrRGXu0UKUNCa1GXuB3p4hzOY=;
        b=bg0ZV5tyvKeUdgxNvo06M65SzckWh6FJ5biqZI3EyhgQPXrgz067S6DVryf/CgbT/X
         Udq/oc1QO3G3n761M/eEQqtYlzWia5ls5dhvxtELQNkwCq5BIevV1DpDclRneTghEHKK
         mC35/sUop7jSxGcZR4Z3oe4x6YhE3KiaRJfkqLBrdQpWASjO/pzMCUz0y6QM9W02cF19
         pgEjTon3KVrB3JHUgEMHZd9VL+Opek5AhSS2pQQEw+3qy9Lo1/J3aFi5dTKdwoVnQoEp
         pP82kTEotOUlzys239CkugFBuLaEG6Nr3TGzlzv9rodTzy21tmwVTZElMVzVU5HHgMfA
         vQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086959; x=1793691759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m157EeAc5sLNKhs4hlgrRGXu0UKUNCa1GXuB3p4hzOY=;
        b=f67msaCdJKMs9Mhn5rQKScFqaoMMxndVRJfXy2ePXr1pcnv7eFZZP5ai9MB01yLKJ7
         JoCTWaRx0+/w1CW0dBJ3EIW1IQx+XFQNA2eJkI52fQQxDMsiqYEQHke8naBFeFPPQvnY
         r/3dPb2DjfBQQ8nT9UiZm2Y5Qo1NdaVqhxM84MUCUeLf2m0xzEagHn4Bo5tT/jiYkuJU
         2DNkwCLTbM6hbP5HfSQHiA/KIEG7BE1Vd+rDZ60ZcesuWOo9mEhhC8viJ9Hdc8/ZBJAT
         B7t9H/Ze70ijMVr6gTl96MjvCnmDfK720HwFE9g1Ku5EKEFoqxEstj5Bmxe6JEhrg1Y3
         rf6g==
X-Forwarded-Encrypted: i=1; AKwUvBwFCp/WKCjMWdGkovbpMhcM9ErDohH1LdmPnphCEQCEE5zXVltGcrBobBXf/f2x39Auy/1T/h24M2ES@vger.kernel.org
X-Gm-Message-State: AFq9FYLK5Oj7UCaOL091FXjMFx5rcjLpKBJwVo3XrmFtRZ3i9TpEDh2e
	UPx/uaTR8CbsVFQVXf9rHyCYdNPXO3ij33XRclb87BW4Rmqm9SXXED8D
X-Gm-Gg: AYBFou08snYqCjO8LcHOKxBHfQUzCJ3+GEBw7Baw6A0gTFPnS1huNXzY/sn8NjkSchi
	K/LQamR4Rw2/ZduyPNEOOzIdbl44Fr+C4VTitm61d2C2u9zcdWd1oTE+NLwGtIFCicjJqbPGDgA
	yGDRsaodcwTQ9BKVeMv4af0+QlUqv9xhQDS4H8tFUvrOk3uhbpdMobV3olGBgiRK9XRctkHiif+
	+Y0YJcB1ZSAikpLoOwwx9r7Uiqoug8QWrsodPVi+DIpds7CMpoU80zyMQF6YxDwh3QqmfguR315
	PwfxwsRcOdQxtReATaCr8liVTgCKMwd1YTxTU5xamvCabV4DcuMipSIvW7YrpMn9fpNmcE+scLV
	lO6ZsbuYBgXf1rO30hqx+/6OvhMyiteJVeosALzMke1uQmLZRxtLO4r9/g+cSR4xFlYLD6hMSwg
	1ryySp+sIJsCZ8fhpSt4Z+PxziKdTmJapGNoO5ZNqNukASVGFT6v24pYCF5K9LZdd4yWpSqWHUv
	7I1SePtKC9CYejEbBcV2x69Ox4YwCs9QvAIUtl63DZHJfdc3a445MWTrxKENWPM88M9v2ym3vce
	U5A5QRbUYwbcTMzrPXn7HIFJSIsjQu90NHWEfLs3dhvpn69PWI1kBXnZd6vH9Qvm7FHt/w==
X-Received: by 2002:a17:90b:17c1:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3adea8952f8mr7118560a91.10.1793086958931;
        Tue, 27 Oct 2026 00:42:38 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4064f4bdsm2504189a91.11.2026.10.27.00.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:42:38 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH v2 0/6] arm64: dts: qcom: sm8250-hdk: Enable additional peripherals
Date: Tue, 27 Oct 2026 15:41:40 +0800
Message-ID: <20261027074146.3911012-1-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
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

This series enables additional peripherals on the Qualcomm SM8250 HDK.

It wires up the SDHC2 controller, the LT9611UXC HDMI bridge, the FSA4480
USB-C protocol chip, the PCIe ports, QCA6390 Wi-Fi/BT support, and the
PM8150B LEDs in the SM8250 HDK device tree.

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
Changes in v2:
- Add a cover letter to the patch series.
- Reordered nodes alphabetically
- Drop `output-low` and `output-high` properties of the pinctrl nodes.
- Move the `status` properties to the end of the nodes.

Link to v1: https://lore.kernel.org/all/20261023072832.2642647-6-dc_redstone@outlook.com/
---

ShiTou Hong (6):
  arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port
  arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI bridge
  arm64: dts: qcom: sm8250-hdk: Add FSA4480 USB-C protocol chip
  arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports
  arm64: dts: qcom: sm8250-hdk: Add support of QCA6390
  arm64: dts: qcom: sm8250-hdk: Add PM8150b LEDs

 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 454 +++++++++++++++++++++++-
 1 file changed, 438 insertions(+), 16 deletions(-)

-- 

2.47.3

