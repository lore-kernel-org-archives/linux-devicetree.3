Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED317364EB2
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 16:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910292; cv=none; b=cL8Tu3YwaGL/AG6Svo1of9iMCzfqo2P4NOnoJ3Gqs/Cl7D48aqcZxd0IphiLkBt8kTtAiHVViWvrC6qGpHEutq77mRahZHO/6ghZ+xoCfGCaRFrt/LM5SgO36xx9YP6sYSAydnSdiky/+Xq3Japuu15Z1I0Xnvmtp21/tdFThcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910292; c=relaxed/simple;
	bh=zDIgnleXp1YmaH4T0Fq8FlMbIWh+meVqwaZBR9ihc/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V8Z+97iRqWpaHEs+iPsD0MAA1kK1YeE7aJPPjde89aXd+xhJsQGn6VPedG0s40Snej8tGZq38GtygUJ40jVvnAzd3HXdzhoLxomO3oRYN2PHJwDZhF9ECYG8QUVyr81KXbvF32dLtyr1NkRVqtO2MZXNVcbw9MJPYZwwd1X7zTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nd7loCWA; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nd7loCWA"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so456526f8f.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910288; x=1785515088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cv3NCrUiZOIoCYhzhhtcYcbNv27YFjGW5WEfdPz9Guk=;
        b=nd7loCWACqTA4lKyi64OEpReie/WtXS90emk+dIFVBqjChX8gBKluF/N5cTcNIrd0k
         uDaUHyLc1NjTmGjH6+pcselYFlnV30ddySL+n6lIIY7hgEQPLfcfcsXHIJ5DKnpy/yms
         NJy1KTEnsy1kbBGvJyzb0/LbNv7g8pqla9EGUsG5GBLu6Obel7za4RKXSYnZnqY4VIr+
         M4YBAqDEkAcJyAn9juX6z8StEhIgDnWhRW6snkfNc7CJ2eQPH7PYOANImf/CJ4mGZ+RE
         nfgnyA9IFYLq1qooLFdE7b5vpYPb+GlmUaRuYQ2niIvE1V5JL4MgiDDu4IlXicAtgglS
         a6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910288; x=1785515088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cv3NCrUiZOIoCYhzhhtcYcbNv27YFjGW5WEfdPz9Guk=;
        b=W1+Scpi3KLRXpzLS3/nL/3NR6gye1ca9kxKOjzzy7CsgrjZjmNZGXP1cl/F60pFIDE
         UlAuDOOyd7UjQLRjMbKeEvSOu3y9u6fFeuD/GaOAU7JS5vK7aW9p90z4tds8euDwsXCR
         mJHyBg5i/9NLpxCAXLsUvsnYOGpqY/RIdkTJq0C3rJ5qLCyItvSITF0R0L6+Uq7SvgTA
         qZPr9ITtoKhzcy38QrVBg8Aj0M4OYPM0a0muzfyfahKICsPzV5t0iPby9PLK5D1XV7fx
         7Y0QbJ1I8565OXv9lh1OfyweIcSTCoCvHh2f9GUYU6uECGh9piA9eUI9b/gdg0/Bhrfn
         7T4A==
X-Forwarded-Encrypted: i=1; AHgh+Rq8gW9hrOvpzqS9l9IEmqzSJSoSfu9tUB9XjrvlqxRCAVsKG7NDjhjYo5/03WNSzRjubktC8JMaiF4y@vger.kernel.org
X-Gm-Message-State: AOJu0YwRmzmRKhDhTBkkaGmlQ4GeqQ31YycVTXqGTHIusM5rn+NvTzS8
	G6JKpvxWFjcZG7YFvYoDgOCke+WT/8jthEDHwZaMfn4w8uw5Ufm8fofT
X-Gm-Gg: AR+sD12hejTGx1zkGVOZJ3HWNXxx5VlVvEyotiMJRJDO9f5pJUaZQGVkEZWRjJpyD/U
	07w5tAbjXsgcG2r2b3ZXyxqBAWwUdpI2I78hdTyZJ9FJYvLF4kwWyzkm+li8eb96hc5et57eKtr
	RiCOXTplZcK7jJXwpDHATk+9oAu30zIYkdd+8JmC/vPLibpREDRM7GVhLSuHKYPfUdB6ToR9sQu
	0glbVcE6PCSy0fyV9RxrHKopVHuRqAuvar+bWtEvh4zp88rQ5i0r8UIdBQe/JhP9vbzxW3J+g9A
	OlGdnKLntlcyDmGtYgrCFgotd4Y19dxg+OYC2p2fQ3YtIBmpGNChnrKz6aPP9MuBrJw9inJ+QW/
	SDpX8VahjFWBfvszHX88k7i/MNYELBPDmjlUc0TK63Hc/qMcdIH98i2xmHaH9GVGmoeNyWlgDxD
	2Dl34V2wjU66SOE5D6XVsrAuE/OmdnrHsDhGbYgwKNP0LcsECCBmU+daA1LsmsX1j3b/H/HVX9f
	ajgWw==
X-Received: by 2002:a05:6000:4287:b0:47f:8192:b451 with SMTP id ffacd0b85a97d-47f8d770474mr10555881f8f.55.1784910288031;
        Fri, 24 Jul 2026 09:24:48 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:47 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 24 Jul 2026 18:24:32 +0200
Subject: [PATCH v2 6/7] arm64: dts: freescale: imx8mm-verdin: Add
 Cortex-M4F remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-6-9d7988bd76f6@toradex.com>
References: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
In-Reply-To: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
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

