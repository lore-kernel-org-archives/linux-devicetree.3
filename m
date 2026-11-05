Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912870;
	b=U5GduG0FVGcfC0f6Xq8HV8gBhD3eeYzcOcVUqRNA5apKtwg5/DBWPJlNm4paauwuEQOM
	 rPe4E0j/Ovb5l+rFaFaesIkNYnZ4QEqkF93SU+MXQh4Hh0GW8czykHknQfnFjprXfcecv
	 yMCo0Iz8KVpU5IOkkXZgFSjYsZgOr/TBR83yp9/oaV1zlBfe366QUZUDKxdsx2oHSBsDj
	 5qElAXwXxntq7LATHSFJ+DMnxiq9dJNeuZTAXxtXwZ/tJOaCH5Elc9SJXDM/whnWqI/hS
	 CYq6OF8YIxeo2/tzltzqI7BI4ggF+L+LtXRxv9cYJ728MuGYNrCI0KKqG4i4ORkKeqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F+2LoF4byTV9cHv2bO2DvByyuIaiEa2hM25/syzMkH8=;
	b=apWo8t98+1ujNCYSjIamOCDfDElTKqeQxwtCjpUL2hjFPgENS01aPlYOQDkFbBspPmL3
	 CNe3kY/F7NefbYHdLzOY3uHz99qnIGFivkNNZaSxYk6bI9DzEy2AV9l+lAVUMJ7h8REf8
	 fBh3Na6NUfjnl2AQi88T2w7jICmdMK0M+XzUV5KToUHma3jiO8bW1GhZj357ex14LInKd
	 BEwyYrtiq2aCZ0KjiacWpL9sO6Gpi/PrDqXxsUoGJrLeiUkD5b0qfmy44hc0rOplYYrEV
	 44Ts+tEjmWshASaL/yyK43cISzjJfftCEQU1bes64TWOBjRLUpOB2gyawdcy2frmIdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ysvqhDLr;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0862606A339
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 21:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0862606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ysvqhDLr
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso3371286a12.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912868; x=1794517668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+2LoF4byTV9cHv2bO2DvByyuIaiEa2hM25/syzMkH8=;
        b=ysvqhDLrpkEyuw0OlwSn4TL0W+BJk2ZHzigMD7BauSI+EEs8SFETsqqNoRxCpG5Ms4
         QAeQI7boVB73A6wYqhRToXRPH7ckny82xmHt/e5+gEGUKz3aPY3bOUc4v7GwldiI/j8n
         QgSvqQYGC8KgAX7eyI1yl9iVrtDFX6CA2mJ5GKcz0YcHsSC7hLJUAqNAdTBGlPZdjr9l
         3cIjxCNQR7I6KPhck6H5J95NehRx9Qlz4XOm1+7v+/FQCL5WA0xGMwtVJFucBTX9eA63
         8WfQaa7wEcElmUtNMMZZY/Ic90sTVjIFct0Ii6oQjk/fVZ8FlimU0N9uL4x+4HXg09Ne
         m/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912868; x=1794517668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+2LoF4byTV9cHv2bO2DvByyuIaiEa2hM25/syzMkH8=;
        b=HamP9FvJmfPC4KzINtJvsNDWIiVPfb0xK+mfYHFgAeEDN8Pfy30iY9D2SzzqWUuRn+
         23hLfxrafBrYsVCp3wduYlktOfObDg4NV/S4YLkYLWFOygVS5FY55X7dyAj3uHD/fUfv
         42O30h0AHRd6AACXz33PoqevzCImSZ2gv1MLfk2yRXu2rHHkYLYZd+9Okis47psCo2Mn
         uQB7fGxBtTfaF74Ry/KjJFaD/edqZPEbpi+wat0CLqcVaioa0tYspaJ3EjIoELNnbxi9
         haPF3XN69On4R7ThDh+EMdHOWe7a1O6EHmdp4lH06PGFJBLiylvprlW48a+pXvPs1aDL
         q+vw==
X-Gm-Message-State: APuU4Z+e63QHDjsnMYIfwSS85SVm67KeeXKXQeUW5xX5G2YljQmTP/AG
	ac6dIFoCE9LrYPQ3xpCa4y4LjTLCLqBw8834zCZsfVyCzHLXEsQgGca5kU29sRqoQUfKRJH1
X-Gm-Gg: AYBFou1KsIXAnEPhDThGlYmH3pZuYNWeZtbcFTSfeFa63FeRoy8aKRi+vz+TBC7A4V5
	Xm4hSZugitSo8WToX4VcwGFhoJ+Z0twDHa/Yi0wbmmJ10s/NhUST3A5UFz8EZOBG9tkUH97sXgh
	9TSZE+zchTvrIgliUT2Nr00tOr2I92pGtYcYjCzKw3Acntf+fnSDkF9b69+9I4IMEG0WnDxkXUt
	/kuEDBzhraP4RsRmH+SxJ1b/h6cSIyfRRlOcXtSetbGH8dRJ8RzYKr4Ffdb7JDbXzECpEZI00ak
	12DZjOff4MFk4CysGtacoaZUNnutoiMmM9hs6ZrTQDeT8N2DibnPknjAWKkqb9Jw109wTrUNDDL
	gbwnb0thZs1gCX1fsqnmLgR32OpwxNZa+6vd7vlAR4NNXbBcQ7uV/ihTczBkhemsyAd9DogUnM7
	rsm5Y9FzTNCYy1tV8gj3MzJMMG1oMw42Xcc5WrzbVTYtLKBjmTIDVnw6p6VqEfG2iweEiUt/vE2
	QKlkH4iCavL3dTWmTvzbnHyDLe6Xqk1YojKkFUGoBrewhcflAY8w470zMOUGJXsSm10TLC4uVkp
	hjt78cK2LfKvslLTn40AYepjUIS+M8Pxrc6Q1R/n0UNLFrmo1Q==
X-Received: by 2002:a05:6402:3808:b0:6b5:8758:c1ad with SMTP id 4fb4d7f45d1cf-6b5975341b5mr367900a12.3.1793912867890;
        Thu, 05 Nov 2026 13:07:47 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:46 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: mediatek: Add Xiaomi Poco X4 GT
Date: Fri,  6 Nov 2026 00:06:03 +0300
Message-ID: <20261105210622.523747-6-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105210622.523747-1-asalde.le1@gmail.com>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
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

Add a device tree for the Xiaomi xaga board, which is sold as Xiaomi
Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i. It enables a serial
console on UART0.

The DT only describes the memory that Linux itself uses, which is the
ramoops region. The bootloader updates the /memory node and adds the
firmware carveouts to /reserved-memory, so their addresses are not
hardcoded here. This DT must not be booted with a bootloader that does
not do this, as Linux would then use memory owned by the firmware.

The ramoops zone sizes place the console zone at the offset where the
bootloader expects to find it.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../boot/dts/mediatek/mt6895-xiaomi-xaga.dts  | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a86fb313b1a9..d73489149ab5 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-sony-xperia-m5.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt6895-xiaomi-xaga.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-cudy-wr3000-v1.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
new file mode 100644
index 000000000000..f53425c536c3
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+#include "mt6895.dtsi"
+
+/ {
+	model = "Xiaomi Poco X4 GT";
+	compatible = "xiaomi,xaga", "mediatek,mt6895";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		/* The size is updated by the bootloader. */
+		reg = <0x0 0x40000000 0x2 0x0>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* The firmware carveouts are added by the bootloader. */
+
+		ramoops@48090000 {
+			compatible = "ramoops";
+			reg = <0 0x48090000 0 0xe0000>;
+			no-map;
+			record-size = <0x10000>;
+			console-size = <0x40000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x10000>;
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.56.0

