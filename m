Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B764BEE43
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 04:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789531215; cv=none; b=OXR6JL3JsjM+gw/d5mdK2kJF6w3SnyddU8w83R4f12NZ/loH/JuXz2pB5FvIS1Kvwo3dLuoCtSj9vYL77vNpaenB5bvdKLh9fQqaomUHuoqD/w+J+ed5K9KdejCA6E0CQQwCR5DQOhoBEZiilcA6PU/MFFbSYHPHsLDB23iqjII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789531215; c=relaxed/simple;
	bh=28okvpt32WquODHjWmwPt1upRkKg+qyiv+SmjbLEKDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1zRbvRcK3E0j6Xc+Gfcc830GR5BO6g8PC5Lhh9kZngAeF+Xq+HqUb1ZYn/qfE4ytcEVPuH7v5tSDUFDaNR8Sh5oiq3djJiSnpJsiPjzhYxMqrKccaXEQx3l/w/FtTipGLomb7veZlSIEuzbjWDMX+BBr9JxL26imxl4+z/W2qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LaXSdoVX; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LaXSdoVX"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so338485a91.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 21:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789531213; x=1790136013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPjvgmHurA9QB7uZXjAStLUtqAnkSK96qD/+I6+APD0=;
        b=LaXSdoVXg9LAu8QV8l2lgOJofffknx1JEKWVd2QcWiM0fIX4U28T6eegY3O6IXfimW
         BO4P9BgCZzejdZoRzQgjmb8nJGJDzR7HQC+gRLMWJ7pL39ZzEtMjiYEk763Zfibdigor
         ueb3qOjUNZ3NGXeOM7C+eFofnap1A4qXbu5Xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789531213; x=1790136013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BPjvgmHurA9QB7uZXjAStLUtqAnkSK96qD/+I6+APD0=;
        b=HiOdsIf3xTNWvKoolaVMIdnO4pDAFwjmiUf1n4DEEFzsJGPD1S61KlSkjuZTzqul5c
         QxdeBZmcchsW5Z9BJ2IEwB/XPBCVP6CdwzR7DEBWBhj5XT3QoOSdQzUvhRU09CS/feiZ
         cs3yMBCDOqt+AzV/D6djTgqUg5mAEvqqVSN5aOkIGbZiQfchVAEfpvx6K7ZaBs0qEa/T
         Egj8ZO8k47Voh/G4j3x0ewR5s47rlu2L+7hwVKgiGxYuQzp/h4Xf4gZOCoS9A5upYRuC
         WAbOL1MhDAmYc0/Jr9oKJ/6J22eqTuIk0+lTsX5Mm9YpVyleYgJyrJfhcSaMtjgdwhuM
         faoA==
X-Forwarded-Encrypted: i=1; AKwUvBz7MGV1NzvTd1fartmik6Ff1PYdPc7KNe9R1IV+OlrSnQUpXHBQjXRF5E3dTM2Yom56Grv7syyZGYuH@vger.kernel.org
X-Gm-Message-State: AFuF++kmNuelpOLEkBD80xqvoaaZHqf9AZUMdCIce7BixmYiHvD5R3gp
	BmbrptdDd8llwkVSdtXwqXna3Mzg/2zBt/YKp9d8HDhFyfBiVtZEWNK9QZ08JziL0FZsli2mQsq
	15sY=
X-Gm-Gg: AYBFou13MmcjZ33gs0H5CWuG4yQqY60UV0uq+4UVX3M13jyilWsqov1nN9ZxUfQq5DJ
	rL5KBm0NcDvD2xiB60HKXMMxikIGvgKgTqXAPLtgmJvDN5wg63B93addQgAvlZ15lta2oJoYH8d
	VKblo13c9IJz6LYtmn7CzDeSak4+vmttW/8ZwBcZO4hJOhfligi2rb5r3K1FcnVyzu8CITSKTQI
	fKfwNtTByESwmGvYLZI7OQTVRpskCFA2v4yPnfviJXcBTLLAdAHeMfC21AounoqEPerlPa31t9x
	bUdjjkpZJldGRwBOw8uWJAQmQCKHrZYEdI34s51e6HoRk4vRarNFZjEHlOJyjLxdsfEPuGOZ3bi
	t7LuKMvBr8W07KPCQ260ohF9zp8XdXWowznunYXOw/cEa98KwBT24cGmJ1FR4YJ0w4WvY0p/D83
	Lsvm3/+k7vSHOHZFyqlGOjbuC8WaADEzYHv94l1WPf/CUkbP4aQlAI93XLG2dP0oP28Ouzd2OZI
	xRCbSM7PwyGiGLv1nodlbhsU3/oNvMRybVwZCNH4mMaQnk1nh09rw1erg==
X-Received: by 2002:a17:90b:390e:b0:39e:1c03:14c2 with SMTP id 98e67ed59e1d1-39e1e3898f0mr2478995a91.11.1789531212760;
        Tue, 15 Sep 2026 21:00:12 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7a3cc9sm2030139a91.14.2026.09.15.21.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:00:12 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH RESEND v4 2/2] arm64: dts: mediatek: mt8173: Add GPU device nodes
Date: Wed, 16 Sep 2026 11:59:52 +0800
Message-ID: <20260916035953.3111607-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916035953.3111607-1-wenst@chromium.org>
References: <20260916035953.3111607-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
of the Series6XT, another variation of the Rogue family of GPUs.

On top of the GPU is a glue layer that handles some clock and power
signals.

Add device nodes for both. While there is supposed to be two different
power domains to the GPU, MediaTek does not have any information on how
this is integrated internally. Assign the same GPU power domain to both.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index e75ed4bd458f..66e68702732d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1002,6 +1002,37 @@ u2port1: usb-phy@11291000 {
 			};
 		};
 
+		gpu: gpu@13000000 {
+			compatible = "mediatek,mt8173-gpu", "img,img-gx6250",
+				     "img,img-rogue";
+			reg = <0 0x13000000 0 0x10000>;
+			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&mfgtop CLK_MFG_G3D>,
+				 <&mfgtop CLK_MFG_MEM>,
+				 <&mfgtop CLK_MFG_AXI>;
+			clock-names = "core", "mem", "sys";
+			/*
+			 * Binding and GPU core HW have two power domain
+			 * inputs, but MediaTek does not have information
+			 * on how this is done internally.
+			 */
+			power-domains = <&mfgtop>, <&mfgtop>;
+			power-domain-names = "a", "b";
+		};
+
+		mfgtop: clock-controller@13fff000 {
+			compatible = "mediatek,mt8173-mfgtop";
+			reg = <0 0x13fff000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MEM_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MFG_SEL>,
+				 <&clk26m>;
+			clock-names = "sys", "mem", "core", "clk26m";
+			power-domains = <&spm MT8173_POWER_DOMAIN_MFG>;
+			#clock-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8173-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.55.0.1032.g73a4cd73de-goog

