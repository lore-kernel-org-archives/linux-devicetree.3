Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DE03EC6BF
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143811; cv=none; b=AS2G1GHF9TdXyOHhs4FVOffw6PmMgzE3vNAxcOuvVzAFy+srYgkMuS/IcVQd4tvWlinCc4fs7Nq36rjNRgmuumpPCx8SKrgK/2tZXE1w+Ei7pP7pyuXixgYl1VIWsrHsg1q3F/GcKGrD7iv9dcNVX204PJvPDrkmjlIIB0vZ1MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143811; c=relaxed/simple;
	bh=9Pf42jTYd4BOZWSzwEb2fi7Fbo1AsB7wRyp4TwTJs3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pE/EEKAhAz8MeqQi8ZdYmFXgCLopt8HqB2uKMR3JhmKIMNZEUBkljLzI8ecD+ygb74IAtbaax7q6a4pO8B1LlS2APnT/DBW3gKyndtpnsOkFHzezGGdsHarHYw0uN+dXvkLwl0oH0q4nxF4YrFlvXrsKwDrMVYV3oC7Jbrc7xtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M5biXNmu; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M5biXNmu"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so2395991a12.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785143809; x=1785748609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AETGy+ANMs/4mEVJOXJB8nyO+6HDkmoHxo4KA1OMiIw=;
        b=M5biXNmu2s++HrtzjMCm9mvwZtBU8t9NVRDDcJio9vSsltp87wBU3oB8y9icut2hra
         uuskVKoXUUI9YaCPNn3B8TvKPoUIRTJ30NMiMm0uiep+58Q+CklzvN/vhb9kExVYxY+q
         7l6Dn0OenS4AYEAJeiLeM/OwxoRkBMvxicq94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785143809; x=1785748609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AETGy+ANMs/4mEVJOXJB8nyO+6HDkmoHxo4KA1OMiIw=;
        b=lFoj/DKnp1PdxCyxNsgpU6IHRYxl2lwh41wGwU8zKaTAOFBHDMPJj5SCRkLLMopUdd
         stZLTb5REVN6wgJ7EOZTz9IHFdDXIasGdK/FTloq+Qr0ZrBG+AVSYUM7f0jfll6/bk9u
         llhlyFfjqud0wdwFvvyQIyX+E0r33H0Bo517woPWRYuARQVb5fH+GFsX16cRjyX8uHd8
         zTiUWE6+091twC70DyuEMcRH1xBJMiZ6r9nHpqJgatyiG1NgE51AfjIQcw/3xWym1Ek3
         qN/6HBaWqPSg1gWRxG8+zLXv2orQBWezsOOpsgpF8G0TAi8DfJfv/J+m7pNqwxcNXhjM
         Q4QA==
X-Forwarded-Encrypted: i=1; AHgh+RowVq8AaEj/jvNsD7o0zJuBVxr5m3aDpegpLXa7uH+KlU/q+6B0XNDkmJqRbBSvEq64+MDlwryFuMWT@vger.kernel.org
X-Gm-Message-State: AOJu0YwK2NS5PS03Dyu/YDmLIHiI3yb+OEjr1JVzDJMzL7/ZjbOOS5Z0
	PPwjMoVo4nggNUYq5saCJ+uMwh6n1CvYH8Ina7do24j+6rwbKxDLDFKQaXkpjyUaxg==
X-Gm-Gg: AR+sD13IsKGovYmNVrhGWUeGtkz2K6o/HzUuZYJ/5/T3DqCSR0wnCjlDSI/bgh36aEM
	mA+oeOCuMuYwFXUn+5Bl0SEnCNoFbXcEQFoiJj6b8GPN6MdlHJ717Wnd/Yvqt0/Y5u6423i///d
	gD3blx7ry8yOIeJJClCHDPX5GfqeYgWzyBJIwK9/Pc8RYGfuuqyrUwDcw28WNzJ1uQ1wW8WDSIP
	fEVsNPSrzExBMowLO7RGe+gKXk++IwtVTL6dLdZjnawP9OeUdavoF7u5zgRTIkOCXYuTsCMR0j9
	a5AwMSETLNZRSrEAjI+7urlA7vuVjgwn+xJUNsnrbxS1YwvjDcHxzMzo20WK8ErY2S+nKGLo02I
	jlFUcKE2AHnNFKfc+DftyUb/fGTwiyLwpEoPYBAyiLRhR3LT23JOFSx2bL40DHvcJUcCvtsDWQc
	NcuXctFzDLRfs3+aK//jBZun+NLiYt5V9fFw60H+v0SKH6+Zn7gJrc3OxHtYwV/VzlnJ9j
X-Received: by 2002:a05:6a21:6f8b:b0:3c3:7cfe:b32a with SMTP id adf61e73a8af0-3c67dd65e16mr7098317637.27.1785143808982;
        Mon, 27 Jul 2026 02:16:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:440:c713:a2b0:6f14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb662329fsm2870049a12.9.2026.07.27.02.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:16:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH v3 5/5] arm64: dts: mediatek: mt8173: Add GPU device nodes
Date: Mon, 27 Jul 2026 17:15:54 +0800
Message-ID: <20260727091555.1023910-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260727091555.1023910-1-wenst@chromium.org>
References: <20260727091555.1023910-1-wenst@chromium.org>
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
index 556e806b7787..169ba4fd183e 100644
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
2.55.0.229.g6434b31f56-goog

