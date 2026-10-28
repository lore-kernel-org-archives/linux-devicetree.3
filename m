Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187318;
	b=jlPsxwYohzETMw47mhs5IscVCMobe8npfg7q19emOtkAh0rv56szG6ub4HR9RBwNlyCb
	 2XeWHI320gtzL8qjOQTtQV3pPszAcBqeT0ARmQpPkj6fHBvMM+Gq6+naG5fPFAgO8M4ke
	 mj4yqYZTAIQkoAWlKULJ5vzW4xjNecBFc/P7j4DGMVbSVua5WOS9N99ASKInh6Vcy2S7x
	 +1v9z0lnvgJ/m4vCEc4i4uX/C+GPkLBnmOY8YmlsbI+iZZSqlaHi8DykCGTKOjDZdZPdE
	 rre6xs7jQ9r+YZukk+ytZNEXKZ7MCiOb35kp2iiasanNDOjpPQLw2JHLmDjxPsBy1gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=kzgvlmTIhVHGThdIV5sswGrWTSAc2jljnSQn/BZ1riE=;
	b=JzbCC3TiWsHFakl9xz7dnZ1xPconITHC+ZuHXDmHxpfn00o8eIibd1RtPqv9Mpvqhsye
	 HpqXscdBkBLHVE0TrIoBKZfdlvrSK59/D8BnSNKxjxv+uEpPVnxEQ0c/nbOJ3ias+bL8P
	 xJU6R0Y2jDGkLaduWd2L8nWe23iLxHc8p/Y+/kjP6xIkUEfTkyVjp9BxEahU/kpSe6UUs
	 7zun+0swHQM7JqRap8pkXPTFBAVNVB6SpKPhaf4X2sf/WRt9hHa0eGEBzkibNSvmA8n5O
	 Nhyq4iknD+U5ytffwJSgjR1G9jWx9T1BGu26GQXSAAt2s6XcbE4d+M3gLTZBMrY2eXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tsLTzI9V;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE73606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEE73606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tsLTzI9V
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afbd2c386so499918f8f.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793187316; x=1793792116; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kzgvlmTIhVHGThdIV5sswGrWTSAc2jljnSQn/BZ1riE=;
        b=tsLTzI9VZoKRk/q51Pu4eLBuLONVghSXvcYs1G8s2KfnLdohPn3EVuLGIBS7DZ3GNZ
         YiUkN+F+B0ViKPvNF6pq4YG0deuHd16A3W98OzWCeuA1dEu4G14Zk595Gz/I0UEFavoj
         rHs9Eft/lzswG4QoiO3hhHZlgL60ar7rjvWOeMn0kKPXwY3l8RS5xLOVa6Bx3bzBfinM
         JkPqJ9DQr/paZOzIFR5XleJ7bDbTzw5If/lKKQHlZcAotRx3bRuvnN9NSGhOXhUS5FfZ
         F2C7GjJv+pSQwII+k95KachwRtC24m9sujkGiM4uXi6o1Bm49d41r2fxseauI4c0gRDM
         dyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793187316; x=1793792116;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kzgvlmTIhVHGThdIV5sswGrWTSAc2jljnSQn/BZ1riE=;
        b=f5KyJQMCGN87AZrfLRxBNAzH2nLxCBAYoC6/Xi12GpSwShIf7wpcEnlGSTAk2KT4gx
         c7w3XrSkxxgHmv50ofOH2W2y+qKGQASwDpvNs6igSi6HPV5B97ZeF8uIwuFhKXJCMt95
         vtZpM/JkWgfT4p6/20qLYJRKQu+K1CMVzR5u1xeCY0kYb/z4mHiyA0YKmk5/4ewm3jKw
         VKf7A7jLOaiDCQE8tGP1eK3YMAs6JL1a7mzouok0/sRIIL/2vokZMDg53UYyw+Ods9CV
         psLqreD6+qk3lY2Ez48gptS4yiwFxqCych2Qmpv+kfzdzsFgMYXW9DTznDwdGpvQ1Gmm
         osQQ==
X-Gm-Message-State: AFq9FYIm7qHEjJ1O0swMlI1aeguhCUWy17FucJI5evSZEX3sbHJQYcQ7
	z/Oxuu32Ecbkn86Y6Aq5rRI1LpreV1AXBZF31OePjEKDjRcdadPJeHnM
X-Gm-Gg: AYBFou2cB2hzC8eHl3vc1aSdDnijMCHgL8wK6TS0EgO0IBtbpuA1Jgg+ZHrNZy1RPqB
	S4NTpT6D4r+VrkPV9vQsvq5FREnAZWJI9TEllkxYPGIKZuxhQXLDpiKvliNSWwY0JEPGR/EzSSq
	BvnkWU1SI4LkMpOND87HRwhjI0Qx3JQ48tKvJ5MHmjNI/hV59tSsvM7jURv+gQQh8EH2OY3U3j3
	uPxMWdZVZWj8OfcuFQpX6s3/KiONdXjaP2TI0GPYwsNZS8DFk38BPDsHo/EsAXmn8/fV+x61gFI
	c+WyXPyeoL10wSsLAT2aZxNmcyUBNA0h+RjQvxTXFcD05eawQgunkKxEcl4j8S7zCWrTxVRrFCk
	+89uAN8C8cnCGjNwxgkMpFb8Mw0eULVv73pG6IcirwVKiasbEQOUdVcAt/Zbdm9yN4Ta+yg7LBG
	LX/AjVBE8VIcGwp3QKdKFeXgGil4tueYm62/dzkSIMLSYmi2Z8CZNOt5zIM17q4QppbvP3DRmIX
	mcvUO5YBfcxgB/MDc34hatUZX94sAGUHwZYZae9Pdxc2KF0G16aj8aOPkoXsymOc3ke0HpxPrJ9
	VN9t12OQeZTFrWglXseZpW9AnrfdU8QtPL0LbY9gv0Qc0k71Cr7uleyUf/pVzZu9TdJzKc4DxX7
	Hu2Az1hI78gPbCymlbPe2oEeO8paB1g==
X-Received: by 2002:a05:6000:2207:b0:48e:5df2:fd24 with SMTP id ffacd0b85a97d-48e5df2feb5mr4476377f8f.32.1793187315926;
        Wed, 28 Oct 2026 04:35:15 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f36asm28144706f8f.1.2026.10.28.04.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:35:15 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Wed, 28 Oct 2026 12:35:09 +0100
Subject: [PATCH v4] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 remoteproc
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-verdin-imx8mp-m7-v4-1-d4e23e62ebea@toradex.com>
X-B4-Tracking: v=1; b=H4sIAOzd4WoC/4XPMW7DMAwF0KsEmstApBRb6tR7FB1Uia41yA7kQ
 nAQ+O5lPBRtMmT4wyfAR/CqFq6ZF/V6uKrKLS95nqTYl4OKY5i+GHKSrkhTh5o0NK4pT5DL6so
 ZSg+h80yd61xvUcnaufKQ1518/5A+5uV7rpf9QsPbdMe0x3tslMRQuAaoHNIFGoIGE72xnmP69
 MObSCHxeoxzUTe80S+IWuNTkATsExprBJQ8guYPSPT4bjOAEAZylsmdDKb/xLZtP0UfMshUAQA
 A
X-Change-ID: 20261020-verdin-imx8mp-m7-a69e26868741
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.16.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M7 remote processor available on the Verdin iMX8M
Plus SoM.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
This patch was previously part of the Verdin iMX8M OV5640 series and is
now sent separately, as requested on v2.

I am away in November, replies may be delayed until December.
---
Changes in v4:
- Use IMX8MP_CLK_M7_CORE: IMX8MP_CLK_M7_DIV is not registered by the
  i.MX8MP clock driver, so the remote processor got no clock (Sashiko, Frank)
- Link to v3: https://lore.kernel.org/r/20261022-verdin-imx8mp-m7-v3-1-af284e28531d@toradex.com

Changes in v3:
- Split out of the Verdin iMX8M OV5640 series (Frank)
- Move the UART_4 overlay to the shared Toradex Cortex-M UART series:
  https://lore.kernel.org/r/20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com
- Link to v2: https://lore.kernel.org/r/20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com

Changes in v2:
- Rebase
- Link to v1: https://lore.kernel.org/r/20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 9fee2cf9ef54..8bffa4a27776 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -77,6 +77,18 @@ key-wakeup {
 		};
 	};
 
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+		clocks = <&clk IMX8MP_CLK_M7_CORE>;
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
 

---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20261020-verdin-imx8mp-m7-a69e26868741

Best regards,
--  
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

