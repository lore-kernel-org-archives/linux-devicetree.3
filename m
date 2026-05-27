Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2964534A5
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 17:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779903867; cv=none; b=d9MxexQqZOV9YE3/nPl/iPWcFOQebdvCCzma+ORYRnMZcfCEvcGGlgGazC0IpJWhIMSG9LYu0h4NHrOTssb4dNxKmjVgF05iA+y1Y8xAfsURazi13GCZjYZP2zhP2cuxIGVU2wO92FjoGUSBsJ/Wf1NNyYvZM5Droa6SLPKgqr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779903867; c=relaxed/simple;
	bh=qAq2uwCZQf2I8spaGkw5idG+JyjTyB6C/je3+h2p1l8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGUoQ/w5mBHo44Kl3wp3FvuMNfdf/fPwmiW7eLyoKxgdGLfsb9IHyp4HHsnPnsPciNt9M5hhKq1eo0Si6uTfPzeaSW/KyOSEYEFla+rehxK76KchXv73rqhaiTZ2PKWUvpvpwicz3d82Y86GDgDrJiPGbyRhVwT0MaRf0UMwfAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4tB+N6I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4tB+N6I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA8A1F00A3E;
	Wed, 27 May 2026 17:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779903863;
	bh=6B9xzgU2pTy5d7erAUiU8+jBUfUEPQfIsmj5Loun5dY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U4tB+N6IxaYs1P8N5bKQRrJvB/5E9gcFnRBWqVzXhjt4L1m7ohJvZpv6z+buEEqBa
	 RLnlWOGltZ3/oJI/y2kjToNrUWSq418Duz5mNs2WO+B/fSuj8IN596xHQnDS8Zh6GU
	 CZ+XeZ4ze8ZI2zUDMNt+m6n7OHIbq+k7w7yXjDBNdW2NEg/9D0uIABv7uc6vHKXWJD
	 XAh2sgP4YRPYzi/8sNsqCzIX0mZ1mt/hXtht/9/eB1r9IYGgmuQYcggAfd/CE21w71
	 ORLd9ftXtN1VM/xIXijVPwWG+h5TKZ9DParB4uF9BNJPcgINZqAdE3fRm4mMYfqY99
	 WUHzsy3/3cH/g==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-i3c@lists.infradead.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	adrian.ho.yin.ng@altera.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com
Subject: [PATCHv2 2/2] arm64: dts: socfpga: agilex5: popuplate reset properties for I3C
Date: Wed, 27 May 2026 12:42:20 -0500
Message-ID: <20260527174221.79259-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20260527174221.79259-1-dinguyen@kernel.org>
References: <20260527174221.79259-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I3C nodes are missing the resets and reset-name properties that are
needed to bring the IP out of reset.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2: add reset-names, remove reset property for NAND
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index b06c6d5d60eed..fc169b869443b 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -244,6 +244,8 @@ i3c0: i3c@10da0000 {
 			reg = <0x10da0000 0x1000>;
 			#address-cells = <3>;
 			#size-cells = <0>;
+			resets = <&rst I3C0_RESET>;
+			reset-names = "core_rst";
 			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clkmgr AGILEX5_L4_MP_CLK>;
 			status = "disabled";
@@ -255,6 +257,8 @@ i3c1: i3c@10da1000 {
 			reg = <0x10da1000 0x1000>;
 			#address-cells = <3>;
 			#size-cells = <0>;
+			resets = <&rst I3C1_RESET>;
+			reset-names = "core_rst";
 			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clkmgr AGILEX5_L4_MP_CLK>;
 			status = "disabled";
-- 
2.42.0.411.g813d9a9188

