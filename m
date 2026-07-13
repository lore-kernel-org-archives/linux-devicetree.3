Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7004A3DE44D
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955223; cv=none; b=qVH34AYaoU0r+08BaSsBKIDRZqttAagZ/RoCERiwiZdpf73FrIQJQ2zgoDgFMNfIERcv+H6YxSdVCWNcMRAgoT/C037bhelJ5HbyveP0HkM93JyxmZyFsyQsfm2mTL+K7I0g5z+5k3pw5B2MIryTM01BX00t5bGYw7Oo+cD+gAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955223; c=relaxed/simple;
	bh=zDIgnleXp1YmaH4T0Fq8FlMbIWh+meVqwaZBR9ihc/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IUT3uk3W/B/bitjLv2XVxkS+rf59hHAVSfCjX68VhRgXtKDzE0OLps94DH3DmlzhxSv9OqidhJIlRkoMh/t/lpvCxWmP4OyH2N/oLybiI3NLwnlpFQeRrWRDP6uwFMdJ0IVAVShfCWl36v5gTqTnFrLqjJ7R2QDUoSGb3pZ218k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=He9yxZjF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="He9yxZjF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c733f15aso31163845e9.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955220; x=1784560020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cv3NCrUiZOIoCYhzhhtcYcbNv27YFjGW5WEfdPz9Guk=;
        b=He9yxZjFTV3HhrSiS9kV05VgW4iHGAb3c1K5/nLUzGyOIXkr0t1+wznoiHCHziFRTG
         f79CG99UOdDqhtdypqo/ZyCy8hKF/w0SrSKZUwh9csoeX96XI9scpsV5zTRDZbjbkebv
         B4BgOuWC0TRt5AKJX0jHaoebAKgc1Zic0kaOOHnQEqbBpuiPz8FOKka4j50nTYLEEDv9
         jxgy6xqugssnFkd3JzcG1o0Z+l8XYT1yu71UqmwbNMkE3fCctDBZl5D1wj7q/3H1SUDq
         4s8UexWDeJc3kVsLRgZFT/pDeMKOO3Ga8KmQ7040pwdN2J6K3t3LiKubNehEJ+b9qtLa
         0pnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955220; x=1784560020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cv3NCrUiZOIoCYhzhhtcYcbNv27YFjGW5WEfdPz9Guk=;
        b=P7oQfR4PHpIhU2ODA2606ZzbAT25RofXkYYBn83lCIkPjcR6yhQa6u+MxPJgKNIS5i
         J2d3SzMeZ8dSR6rHT6rWT1v9nCejNtmEySIlDVhtRoNntJy++t14CCj3g0kUlLS3L+Bu
         N6eUeO5a6opnc+nCr6fLGgUFO4B6oz4xH5L1IPJH6H9FzyyIIk/hHFJnKXMGx2g2EwCI
         OPaH0BMmTlOz6lVa/LsjSsPpTm0XuANNW2P7owAsEEpFpL8mOZXx8EilVnKL0Z7EBMqG
         +5qHIOrVqYtXxN0UhMfUICahmk4HmsSDn1usIa/2qKZqZ//XqFwLXwZfEy4cRgMgbR7r
         EC7A==
X-Forwarded-Encrypted: i=1; AHgh+RoRST3GrJT4qCbLeNM7vuCKIUeCBkXZTLIso1ZI6vyOQ91DmC3TuUUxDJ9TeFgK7BNKOWkkRS6Mhrev@vger.kernel.org
X-Gm-Message-State: AOJu0YyRxwo7Ek9eDBk3jCVaXdTYg/Q3eNX/zTuO7O7E0Xue+SUdRmkN
	utRDQo1rdIInD8XrD85BFjkJcmzH31BVpFEA2Ji+MI9iqTyxD9DkJCw5
X-Gm-Gg: AfdE7clWPIXsmIe+/ZuIFIzsUq0BH2eWpDOIv5rZ4gmmXeaQW8rFCCqdFbY1gf58tia
	JwLYVuDDe22o26gOZllmysWUX1vgPWxPKoISR9bGO6WErs/iEacsFw8ZWn1dLNcvrahwxZD2rSA
	QW9Ls4lxVlBJx6zP5npkzj6+iQ4iVz8IuJv4e4t8t1xV5ETepkwvX2UziUGdJSFt4zX1sTijvlk
	wdKQ84X530rP3hXh53R8zdP7bSbIkAQpe+Pzi1BDxx7t29HGILGrMVeLMNCrnpmAQ7X5atIIuna
	A16OXL0Ue9zKgsAIv+a0snnJkUAOYbYnFbegPjNOwsBb1a50yZ9ai2TuarBYVVSyI4DZSbgY8Gc
	OqE2uGMQ+BZ1ukWGXSbJp0J8i24aH6Ky2t7HZM2O+E8ATg/UcGowUnynznsp/Ucg8L+OjzKiUMq
	msxJXDwwzQnUroIAilxW0FLhBE66rlj6N+9WwgLWZidopsiuf4EOt1Q+W4jC0AeNdAakfsXJ5tD
	HFhdnOQlqzUfIRq
X-Received: by 2002:a05:600c:4e43:b0:495:69c:a262 with SMTP id 5b1f17b1804b1-495069ca31dmr2126545e9.13.1783955219713;
        Mon, 13 Jul 2026 08:06:59 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:58 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 13 Jul 2026 17:06:28 +0200
Subject: [PATCH 7/8] arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F
 remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-7-4acd63db4504@toradex.com>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
In-Reply-To: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M4F remote processor available on the Verdin iMX8M
Mini SoM.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 5fc177f589cb..ac450fc6cbfb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -52,6 +52,18 @@ hdmi_connector: hdmi-connector {
 		status = "disabled";
 	};
 
+	imx8mm-cm4 {
+		compatible = "fsl,imx8mm-cm4";
+		clocks = <&clk IMX8MM_CLK_M4_DIV>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&rsc_table>;
+		syscon = <&src>;
+	};
+
 	/* Carrier Board Supplies */
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
@@ -164,6 +176,27 @@ reserved-memory {
 
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

