Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937330;
	b=0BHyieBo5Gw8qhBI5L657Kk9fWOAPVgdxlO8e0aA9+JzpoOiTl5TELGaLshRGRTYOEJC
	 rIqngH+GpFouKEH051SK1ZpyvrvJ3vH5nfUw3Z8um/mb7vAi7oUJVWXOOqXErK4ly/cRb
	 rm5SyzLB5Xrf5gSmu51OX46AuDX4MGh9yZuThi5xKcir7+pEMhps3erJUy74f6YOqjPRw
	 SmzxwCMuVWH8N2Q+B5p+ME3b7NkPKoH7UzeghSC5z7UVhmKfoJcZYII2OnRDwbL9070X4
	 Mi2g/LBoK181TOllaYhS7GVgAZa0ZT1eEZO1P0tCbapwIWoa3D1ZqINOIc3TsbaoK3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wTPPTTwSIsIlB2fjrb+WqTZ06tnehY/OHjYsvZRgHj8=;
	b=g8Hlbect4yRWojh4bXB3LK7ia5AbbjDAbH2KbqJnGKkup5kj0T6Xzgbzdfv0pvepPUbp
	 TnVbi/x8R3vt4+wwMo44R78pWIOvyBI+oGSEJoPPoo9dKJzIgbhgWfqmtBGSSJSMzakmX
	 cMEwlchKs2cOCvD7HCmkq2vSUstiqY7umgetUfPM0YIv73QHbXHt495wP+lkXdsWHCVmg
	 rmEgGKoQaMI6VA+L45OBHHt6Z2/5OPxWuNFykJ3+yJzgag2p/df0S8GAFmXzu10j4pM7E
	 Ish6pA2YVsiZvh9TrkZz0hKBsT3Nkxuztbi99pom3D1K/OQBxu8kRrvHBjIG3/DRt7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jpSp/odf";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F879606A884
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F879606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jpSp/odf
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e10a70540so1981f8f.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937329; x=1795542129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTPPTTwSIsIlB2fjrb+WqTZ06tnehY/OHjYsvZRgHj8=;
        b=jpSp/odfNg5lMN7KMmydns+yyMP7dF6B9SzvGkqhUF1wGakXbAWcroqVUnguNwnaw+
         NHXN2NLtjvsA3Y4UJn7lDJpc4fBva2/seT1tHcWZqODvF4iskxfa63HLkPBAGNYJzQFN
         d5nwsKPy7mqECAHUlejtXwvZIjULe9tm1SIt/CeLiMe47AJFLY2FgYKqtgUaOUA+hAoh
         Xt27nzD7E/KofDaPec7XDLzYS5rfkUvO3de2CjcePSFwv/C2yQqkETjr8hJforxPfTE6
         kO4W1EA7s233ZtdTxSdV5RNNSWg3DGYH3ay3Sm0qo0l7+uwTXJiQ6a0CmoyYfIN5M8LE
         ThIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937329; x=1795542129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wTPPTTwSIsIlB2fjrb+WqTZ06tnehY/OHjYsvZRgHj8=;
        b=IFp3EzuTwHYSOMMLEERR1+RWVquEGkySz0XjiEeWupIEvlGo0a96TY4uGqLG8YYXfK
         YklOq5VdYZoXmNNFvwJMBFwtNcIicnEqlLR73yfEmW6rZmD/C2Dq+TAHKBkCirVCaQ2y
         ZOqOGTU3RT0TkNKZxxIy3jlXQYfjo5jHBvsTZ83kPEveFJZshSSqIorDq7zQ+0ZEJyDx
         ke2/lcm2ivPRLBwbH0wOaWvaofqKUrE6ZHignuWCTXheGcnUrGyK9/bfwDdy1/6YhenC
         MvkiGisN027b6kQEFri327wmz+W7JhUV/JYfdfbuskRA2gak4BCrYEA5qxpcCOJTUaQY
         rthw==
X-Forwarded-Encrypted: i=1; AL+hErE/OD1lQGL5YOIx0cUrsJ/uyP9WSzt/zzz/gYeggFo6g2NwUjS51RKF5p8fcWdfI17uYq+YC6FBnKJO@vger.kernel.org
X-Gm-Message-State: APuU4Z+QdjMYIp+rLUMjW55pLFq3DltgwakMsVfkpgCF/Yz+Zn9v3+4W
	bGz6lOqAJeO5IxSa0tNaeltDE6kBBwG3oK5pCj+GD0pJRXn3r2B6tkEH
X-Gm-Gg: AZFdTZdX7DpjGA22uPbswS5GCy37zJLXaVYpTBUGareTWfSgOnYmZ/RMXWxRBLuCaAX
	Yc7ZC0pa2+oOCGst/JTi65DE6sLTLBlvduCSW4eg87Wd7aQiwFBLM0LmyocC7pAX20h2tIujRQM
	ZcO2KilnTOaSAx6dCQjKerAVpxegJT5aieXRg2YLo571bZ0lnuohyKgjJd2DX8QIy91d+l5QZII
	RSY02+M1ROw7pqidnQ/JBDBDNfvdDwrIjsbwUqu6V2U1QwkLYmDhEaxOwcD6q4Pc9/PNQpUwP5D
	ntW3JvaIDTSUDpkrV1BL+nem/yYPUuDFBLOqYoPb9+Co9G3iY+TPTSowtVRDDt+B4T6hAWE3Y8S
	f9cRWOWp0KtpSh11IwiurzbBmMv1J/km1LO5Ft/O8sivV4LrrQRYP0inuKHTN0N6DwmFTLjDSFi
	YVMXGW05QZqANeOf9NCenOJ76JdnOsy7lrVtKoo9K8qCE3tnApozsFg7f7DbY+u9Z007+xutCGN
	RJ0OCDBpxELtvwX5GyfrE68dDqQlE1lPoLX9Velpq8AhD/l3Mab/qFFA5uM1S9vA7AVzVC37RPr
	MSn+iJOHe442XFB2AKaNHvtTRkbMA9H0NcJfuKuhOoep7jCAvWM7MuCphQ==
X-Received: by 2002:a05:6000:26c2:b0:48e:3fc:e393 with SMTP id ffacd0b85a97d-4a6332bc6c6mr464449f8f.6.1794937328672;
        Tue, 17 Nov 2026 09:42:08 -0800 (PST)
Received: from vitor-21h1cto1ww (dsl-30-199.bl27.telepac.pt. [176.79.30.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7390fe82sm30962552f8f.17.2026.11.17.09.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:42:08 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: ti: k3-am69-aquila: Add ath12k calibration variant
Date: Tue, 17 Nov 2026 17:41:56 +0000
Message-ID: <20261117174154.549590-6-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117174154.549590-4-ivitro@gmail.com>
References: <20261117174154.549590-4-ivitro@gmail.com>
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

From: Vitor Soares <vitor.soares@toradex.com>

The Aquila AM69 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The
module reports the same PCI and QMI IDs as other WCN7850 designs,
and its board data also comes in variants for different regulatory
domains (US/EU/JP, UK/CA low and high). The IDs alone therefore
cannot identify the right board data.

Describe the Wi-Fi device behind the PCIE3 root port and set
qcom,calibration-variant to the US/EU/JP board data.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
index b6854acee8fe..62904e9bcc71 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
@@ -1393,6 +1393,21 @@ &pcie3_rc {
 	reset-gpios = <&som_gpio_expander 4 GPIO_ACTIVE_HIGH>;
 	ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
 	status = "okay";
+
+	pci@0,0 {
+		device_type = "pci";
+		compatible = "pciclass,0604";
+		reg = <0x0 0x0 0x0 0x0 0x0>;
+		ranges;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		wifi@0 {
+			compatible = "pci17cb,1107";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+			qcom,calibration-variant = "Silex_SX-PCEBE_US_EU_JP";
+		};
+	};
 };
 
 &serdes0 {
-- 
2.53.0

