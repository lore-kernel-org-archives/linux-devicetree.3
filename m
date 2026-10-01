Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51BA2E5B02
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 11:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855063; cv=none; b=RxAaBZh7H2GDO+9EwpneMLxWLAK52Lc/3764FWkNyXvyPqX81APKq8WdGBFPtMw3vQHAIgFUsgojGCpjutAYLjbWGzFDkKbtdkhIIhRE3rQXekK5SxI9fhH4TXvvBAmGrWS+02lkVGeQZ3VhYnlbdwoY7MVDgLf6tvGuPXkrAHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855063; c=relaxed/simple;
	bh=TrTvDfFn/k4uiEHyffaC4IKdjtst9K0k0gvyN6WQHvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qoB/iLO6wc3T3/LMwJswdzY+rbkHYsI8NJ+IAkzHdJStvmjYRzUn6U19S0k0tZpLOrBKTi/ItDW3u8HOn8GSzr0dJKUlso/9oI0mfokY16gCWG6WaGHC7OU62yspCCNBPf+n95JhURGOuiezmkVGwdiTYOtszgfYMHA+20ZKeI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLgfOlJe; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLgfOlJe"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48affb828f1so1764534f8f.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 04:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855056; x=1791459856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHoaVug1Lx4d7NCtEru06mZWP8AQ/VN7bfbLwwo+zA8=;
        b=XLgfOlJeGr0cYV1OULxE3UdFb70m+d3T4FjQcs0cW9Hk+GNhzNwfZ4AmLtFumheUoJ
         z7cfk7NVEvKm0Yyt9ZWjqFb49OPIo5eHFjRS6HVvbazV7X61dfEoGPrmzwRU6T40utFF
         ZcO8tqux7Ck8Yo0ZL3eN86ZGvD+BmY5JeKCv89K/l0GajlnGyTThvNMb5cWknauJXTkb
         JiEl2U8cvy7+Sx9iYC70BpnneNx2KYW0hIYmCENZbke908lODGAE1+PZ8hyWzmu/5ic3
         twYFi3AbchK+Srhv+/+x0qnfo6NpfiWBKDJBKHQY/H4Ixn1qAvQy/mJ4BHvg0VLnhN4L
         AAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855056; x=1791459856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHoaVug1Lx4d7NCtEru06mZWP8AQ/VN7bfbLwwo+zA8=;
        b=2WgByUlxFmSJiT9fkkmXTcCl6uYXhUeYQZBLy1zEnUDnZ3RWLM557k8vJb5GX5ZJuD
         ovZwms4oTjjziZtxQy5Gjra+AZ/4xsPeFI8N456jcxO6ecVAaWZIib749FDYCGLK0uKc
         go6gvWXqk6wFyHVzysUkBr/F8zcvuAoljsxydlRWoXWNKuFf0UbRbQa9knGh6ERT6NmT
         7KNFfV1r5iyGf2eHzI3F+OktpiUlzqez6DLwL5UxtLVC1U5Vx1W2PcMSAHU0FLUuRnmT
         vZd3IaqewnUqhayOVlf4tkiY6gzDeD2tpv6loefVGLXcqJ7Er8cwQcyTzCuhiddxEM8l
         SgIg==
X-Forwarded-Encrypted: i=1; AKwUvBw6ZzLZ1yWtCB8T/vhfcY2fqq63c51Nyz+TzqbbxHp8oreU8TIhZWm6wfrTxjlVnGRIc4ss2AVlQ+cL@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9oV2JeqfF6qaWA6n+JyFimAEXzO6sm0IXgET2crPtQf6DjwqH
	KgK0jjv4UAOSjye67tLf5ucyT+NGkBcNQGW5eC6hyuA9yz03/LXjmx97
X-Gm-Gg: AYBFou2oAEWn2VkKuASuztDXgHHYPEG9a46Eo6FJFDDybRsjkmevPJGCiTv+HwKKIHZ
	eXzYUZJYYERVuvLR9UnCrziH6hV72LETSj4cld3soVVIsQ0+HzHCW/JFHQo4fHSZNN0Lwl4p85d
	KGSzUxcYLaGqb63uDSeYTBVp7Jsggo6yAUzzOU4AkkynRuUKJnDcRJuSHXZto4x8Nx+whs4eIzY
	culzUp7if2KZn0zYsYeKlZ+WIhVwPu7eqlfQ4p3Z6NC1FOy/4mWkZofTXutKmTjI9cGM2sqIyi4
	4VSrxgaT1kLRVkH7tTrREIh2lbbI1p1A2mTZD0nSO1sidK3OdQHAG+ZAMpD8ewwsZfv85OP35jt
	IZnf0w4IPwSKkc/miPJ0WErW3QrWJP/cXSFqig58/2TIuoWlpfFRcpCoVG3bSsZST2NXgqQ9GHi
	8J1s/a6R9hbRAPYOVAnHwFv6Gg7W05rloXWOnwUbrnmGUh9+ul63uia8MYYxlyxrwIm8kvhfZvN
	/fM+THXSrqkV0gPWH2WbUoURgRdENYPcXxbpRPiRxfEFkztmn5NykZcHCpsqXcHoNXcRju7nSs=
X-Received: by 2002:a05:6000:4b18:b0:487:14b6:b1be with SMTP id ffacd0b85a97d-48b024d523amr7320787f8f.25.1790855056060;
        Thu, 01 Oct 2026 04:44:16 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b1035eff8sm1243705f8f.7.2026.10.01.04.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:44:15 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 13:44:09 +0200
Subject: [PATCH v2 1/6] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-verdin-imx8mp-hmp-camera-ready-v2-1-7d1343ecd3ec@toradex.com>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M7 remote processor available on the Verdin iMX8M
Plus SoM.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 9fee2cf9ef54..45a4713c260f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -77,6 +77,18 @@ key-wakeup {
 		};
 	};
 
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+		clocks = <&clk IMX8MP_CLK_M7_DIV>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&rsc_table>;
+		syscon = <&src>;
+	};
+
 	sound_hdmi: sound-hdmi {
 		compatible = "fsl,imx-audio-hdmi";
 		model = "audio-hdmi";
@@ -185,6 +197,27 @@ reserved-memory {
 
 		/* Use the kernel configuration settings instead */
 		/delete-node/ linux,cma;
+
+		vdev0vring0: vdev0vring0@55000000 {
+			reg = <0 0x55000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@55008000 {
+			reg = <0 0x55008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@550ff000 {
+			reg = <0 0x550ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@55400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x55400000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 

-- 
2.43.0

