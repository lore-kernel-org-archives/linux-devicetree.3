Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106638;
	b=lhLsAbk/s3FsOg4+3DA6CX2pyTbl83ZeuCDlhcFrK3XCU/GpYp5mIbPf6YK3oN+bATBk
	 bo/Qbr3LlnZBobSRqeJN5ByQbV+O9QHNzIW9bzNbzZRlaWdkcdoHH1qxgMv2PvMl/Ey9Q
	 Dld3DWfmhz9ayOuxTyB/r+wzKoyU61WbOc3RyDTfuth2ZR7ofmi38KnmNL/t3QuW+Xfz2
	 NWsH1QRd/2hpSmWSbJAiXnB/t71uaWzZ0woXOEqY/ZLeUiuIzYbYFAIPzZgJeYpoNjrw4
	 48kUbNT6XK7HJgjoC9o5ManTT2JPEx7SniRqGvwYhCDrQQPOhh46sXadPJ+2ANMRCnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106638;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=iRVRBbw1AScz1EIRDRXx4WsoEPpoVqurFEyEK3a1RQE=;
	b=IfXn4aanr0KCm6L4Mxsv8sSiRYzQS5lzmvy2aofOCIipla2KPgCpFClD6T9djezsSZ/W
	 d1W9biSZsiCs6jgcfQqhLrL7WRAL7iNzzmBPWHUg7TlvLN/1PqKFnjEGLvtoq8feLQpbc
	 /HYsdnMNaCUoqLDQtU7VQDl+ABueoeVN1n8lG6d0syrkKoNAmuUntWzfD5o9fj2+rOJ3p
	 WAHjeKKjm6Je/CNFXwikHytRdioZNDRu3sau3SeS0RcU4VzRo4muNnZnEtAlH6OUNJTSH
	 D8HV1MN/0iGV/tyvu78jbNMnQPVcvdGiBQJAI94CLgXaHH64zG3bCAreMnZndVuudmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=SP6+KHpd;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8B1606A325;
	Thu, 19 Nov 2026 16:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C8B1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=SP6+KHpd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795106636;
	bh=6i3O8CjIo+HxwDHwcy0vpOyveDvDxBqGr9BQdGbXOqM=;
	h=From:Date:Subject:To:Cc:From;
	b=SP6+KHpdddpuDvZwH1ozd7vGx+cCdOh3bHsLxAPJZIl5QFImPl50zjnkFDktoY727
	 rHXlhVIBTUwxZvuAPzt6/lOslRDqaJtBiD6YMR/Pjt1VqvuEeEw8ILPtYXeTU4kyS6
	 BeEgqQVgGXN7VPgL8/fC8c3qKq/N3KfWq6P7EbGP5WaNL15+2Z/O2ELZvqat11UwMh
	 pS90sAEfysCah6KTIoDfOtMQIQaWt6i45FIBHIP2I5viNE2QPF6n2d2A5Q/k2hr/hV
	 I8cl+tiGwH9xOpaPN2bQhNShLaAvIt6z3Rau1Va+MZhNqBnFQ5Fo481a0rtB10vKxB
	 0pYbdXVqaE+FA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 07D5D17E07F6;
	Thu, 19 Nov 2026 17:43:55 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 19 Nov 2026 17:42:51 +0100
Subject: [PATCH] arm64: dts: mediatek: Move watchdog disable external reset
 to chromebooks
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-mtk-genio-boards-wdg-fix-v1-1-a2d23746a07a@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ7CIBBFr0Jm7SRCYq29iumCwoATAyhQ26Tp3
 SXW5XvJ/2+DQpmpwCA2yPThwik2kCcB5qGjJ2TbGNRZdVLKG4b6RE+RE05JZ1twsR4dr6ipl+Z
 60co6B23+ytT07/o+HpzpPbdCPSRMuhCaFALXQURaK/4rPYz7/gW02dPNmwAAAA==
X-Change-ID: 20261119-mtk-genio-boards-wdg-fix-ae81c75a2dff
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795106635; l=3527;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=F/Im64Ni1uwsJGaafftFl+c9JiV9JcuUMsycZhGbKqY=;
 b=7x+/tFXqwjtHaZgkf3SYI6Ef5O3nmvk2xcMmDqFrOUODC/cmdDy1UkzI4uxplB/oqgOr97jGT
 IBBzQ9nctgZAnNjAUrSTgfralypYRCQC+lnB24O+SvXoUxAD+rZ77Cc
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

On Genio platforms, the external reset (PMIC_WATCHDOG pin) is routed to
the PMIC, so that once the watchdog is triggered, the PMIC also gets
reset. Meanwhile, on Chromebooks, the PMIC is reset by the Embedded
Controller (EC), so no external reset signal is needed.

For this reason, Genio platforms need the external reset to be triggered
in order to be able to properly boot, but the current DTs disable the
external reset at the common SoC dtsi. Move this property to the
Chromebook base board dtsi instead.

With this change, Genio 510, 700 and 1200 EVK boards are able to
successfully boot after being reset by the watchdog.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
[Louis-Alexis Eyraud: title and description rewording]
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
This patch has tested with a kernel based on linux-next tree
(tag: next-20261118) with the following boards:
 - Mediatek Genio 510-EVK (MT8370, variant of MT8188)
 - Mediatek Genio 700-EVK (MT8390, variant of MT8188) (via collabora CI)
 - Mediatek Genio 1200-EVK (MT8395, variant of MT8195)
---
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi        | 1 -
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi        | 1 -
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 801eee735afe..7da55434ff41 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -1347,6 +1347,10 @@ vdosys1_ep_ext: endpoint@1 {
 	};
 };
 
+&watchdog {
+	mediatek,disable-extrst;
+};
+
 &xhci2 {
 	/* no power supply since MT7921's power is controlled by PCIe */
 	/* MT7921's USB BT has issues with USB2 LPM */
diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 7442e6f160df..d7ab1ab56286 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1322,7 +1322,6 @@ power-domain@MT8188_POWER_DOMAIN_ETHER {
 		watchdog: watchdog@10007000 {
 			compatible = "mediatek,mt8188-wdt";
 			reg = <0 0x10007000 0 0x100>;
-			mediatek,disable-extrst;
 			#reset-cells = <1>;
 		};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 6ffa168dae10..a547b4635e54 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1626,6 +1626,10 @@ vdosys1_ep_ext: endpoint@1 {
 	};
 };
 
+&watchdog {
+	mediatek,disable-extrst;
+};
+
 &xhci0 {
 	rx-fifo-depth = <3072>;
 	vbus-supply = <&usb_vbus>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 446cacb991ed..59fca2fc6920 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -859,7 +859,6 @@ power-domain@MT8195_POWER_DOMAIN_AUDIO {
 
 		watchdog: watchdog@10007000 {
 			compatible = "mediatek,mt8195-wdt";
-			mediatek,disable-extrst;
 			reg = <0 0x10007000 0 0x100>;
 			#reset-cells = <1>;
 		};

---
base-commit: 66d427575d0a859e9484f76b5d9fb05989dbbdb8
change-id: 20261119-mtk-genio-boards-wdg-fix-ae81c75a2dff

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

