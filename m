Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D22C3AE198;
	Mon, 20 Jul 2026 09:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784540018; cv=none; b=bZtg3FEii2b/UFmQD9CI3AlhdhO+njrY4w/ubngoc4viRmfZmiMk7c4iRsLBS8tdFL4l+33d57XfiW+sxWapQmms1gLQGw8RbovPcCMfw8FbwoSXS2l05q2jmwYOuoz995CuMEvL3tUKTQBOTRcB1Q8A0aiTtSZis0O2Tsm4f2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784540018; c=relaxed/simple;
	bh=iLMQNbL/pXZN1krLtPVgWe5sc0Hk0AR8/qNmIVBIrtc=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=X1+gB+YDpEl8mRN2+ZvJJ0iGNcF9GqrF5EmEETy3l9utNQdXmWJSMCLR7V0QwawvutcBISpl65yRkkAJO3u/vnW9YYd7W7/GwtpVwGsPWLPebZ9muodVato3HPRdwiNxzzU2yw8KJ6TxrIXbk5SiiVlxmJpkOInxFvR+yv7MpF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=PpAzXKMN; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="PpAzXKMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784540004; bh=phDpQIfxJgSnX+1nrUYRLq8eZfKGXu0i0BHTa1q+vEg=;
	h=From:To:Cc:Subject:Date;
	b=PpAzXKMNZwcKZzKPGH2DzbgFfa5PMuxxbZ4yqqWyJ/GLxqdXKG1qdrs9yOcgesKhV
	 4SLRXFGWMMXZd98Xtay9v/ideyzNg+n1eFLpEOS2Mhdou2se8VuqDPKy2yujoIqxZK
	 f0RPGPIvNgCMphvZoACmU1eMozcp4Zw+MgF5lFDU=
Received: from ThinkBook-14.localdomain ([120.229.142.9])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 8559CCA1; Mon, 20 Jul 2026 17:33:21 +0800
X-QQ-mid: xmsmtpt1784540001tov1ku4jv
Message-ID: <tencent_DF2E181B86AC588DD7B70DE904F6670BC207@qq.com>
X-QQ-XMAILINFO: NGbyafB8LluuID3NDY9apM9Xmh7VXPFzYeplr4eHwyA0kpMPAL/uJPeDqOQdck
	 s0Qtgrl1qOEgqcOPxg5GVjk3Y37peHjmhs9YZtlDn2l5p3+zPLRiPzhNueh7qE4DVeaYdb7kqkt1
	 5CGESWo3dEwFSg9CciyfrrXSQlA1cZx7a78njrER7cjSgXm4t/M+98hdqFPTLyrj18qY0HSy/MvY
	 xXgbajsB2vUZWFe6949DS8Wu7npxRTJuG1dMEkPa5RPdglAPrvqdxCdS77LYyaaZuxBe/56mxPVu
	 wAPWCbWO4LL0IpROJHpbDY+4tkzEFVfLBF+u7ZIfiU5zbSADoWJy0+Vfjf9wX9XDBc1hnPS6GUWX
	 K9TZ7aMJsm/M4TP0H0YRuGyUPCHit1kfG+fKMuQ2HHmLEgjA1K1yA54r/W7oDxZZn2BPB8x2BRoQ
	 8RYA7oXQqHvK2a35xtxlH6LKthW50YDH9RvLGiRpKriBSwIjSGQrW7GJmPujk5veXaysSDYbPPPM
	 Uyy9T/0yUw1c75bqJdOSXn3t20LilxV29TC2AeiKEQdpNW/nP7ZXk+Dv32XDtLTRZBcKThre5SjB
	 X5xef9wvQwuFoFXEguXt1OPg8UT6bHuvaa5WADdDunrlkaNf0OuMr/J5O+d/Aun6/s1J7THWrcNr
	 WuR0UdVOwdk+nVd2DTrU7SXm0ZuT+O5cGEpeUBarTlH6Tm8mVl/mw9KoymND3hQjAzjgtLIF5Gl7
	 mNz+328DceK6rvBwXoW3u7EcmH6Bzm1z6Sqk4EtvTPMci6jylucNVIyYRW0wF6mcuCkZjlH48BD7
	 OVLEvBbiqz4bgOuXIhnHCjCDnsumGtPBN9bJ1593IyDs4OFiEKtwxmmpNrJGEVeDAQFNr2dVaWyL
	 fdoaNJVyrEfjP/HcWsyCdm8OVrWNNIqIVIzOgg1bkN+l3cTfuFtBQ0O7HaH6GA+i6r3Eq9Kt2l0Z
	 jDFmhCSsnKxFMjreSBR6W8mfK9zwOt3fwVtdsuynPeUuYqDjT2V5Z3rPY1KHSroHxRv8AlLbQw5e
	 hu3AYysuj2nC89jQGY92Z4r2HfwsA91aAazlJBiPvsQO3EYbX56firUgeN/K11UlBjWi43cfun9v
	 NeT1uqLhZLGIr7EZDbLktcyZcnP0vjnawp3mjg
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: XiaoYeZi <qaz6750@qq.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	XiaoYeZi <qaz6750@qq.com>
Subject: [PATCH] arm64: dts: qcom: sm8150: Add slim nodes
Date: Mon, 20 Jul 2026 17:33:19 +0800
X-OQ-MSGID: <20260720093319.20349-1-qaz6750@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The slimbus node is an important node in audio.

Signed-off-by: XiaoYeZi <qaz6750@qq.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 661848ef5..2a83ba554 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -4410,6 +4410,18 @@ watchdog@17c10000 {
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 		};
 
+		slimbam: dma-controller@17184000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			qcom,controlled-remotely;
+			reg = <0 0x17184000 0 0x2c000>;
+			num-channels = <31>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <1>;
+			qcom,num-ees = <2>;
+			iommus = <&apps_smmu 0x1b46 0x0>;
+		};
+
 		timer@17c20000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -4577,6 +4589,20 @@ cpufreq_hw: cpufreq@18323000 {
 			#clock-cells = <1>;
 		};
 
+		slim: slim-ngd@171c0000 {
+			compatible = "qcom,slim-ngd-v2.1.0";
+			reg = <0 0x171c0000 0 0x2c000>;
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+
+			dmas = <&slimbam 3>, <&slimbam 4>;
+			dma-names = "rx", "tx";
+
+			iommus = <&apps_smmu 0x1b46 0x0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		lmh_cluster1: lmh@18350800 {
 			compatible = "qcom,sm8150-lmh";
 			reg = <0 0x18350800 0 0x400>;
-- 
2.43.0

