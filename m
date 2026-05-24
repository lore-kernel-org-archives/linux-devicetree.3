Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2B4204F93
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779626710; cv=none; b=qzzOud8Qo04y5z5AVHYnQ9XxIoprRKpBzsSuemdIV/Q6SClqcYsBfTjEKeUUSKwz3E7zJX3FyKpp5+HCu8G4+8PtafQihcPGNUEvPRPyuyHq3w8M8YTwfstseIde4etcYyamdOyNt9frFe/WfDCio7ITeJhEqg6577KrL+pzdMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779626710; c=relaxed/simple;
	bh=bVQYpTAyM56qnH7jLL3hJYgRlduEJJ/6ogDW0E+EtdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EgYOkSj4BDr9EC1zmNZ/ly/pXiKgjklxb/E0aidZyf+5U2eFU6NIiZFgU28Q5eeiV5JNkKMuPfWZG1veXqGLoU7zfpEAdEhdl5xxlieQUXgjnJgSIB0I3p3sDx/ZmV0KcB+hVTTtMr3hEnf6ESFNKesKCG4Bw+3OLI5Bt2X5Vxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=FeIfMi3P; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="FeIfMi3P"
Received: (wp-smtpd smtp.wp.pl 45103 invoked from network); 24 May 2026 14:44:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1779626698; bh=0iifLvTx2I1NvbTVPkxTfIoIccnSTeVcgYfAe87Lp9E=;
          h=From:To:Cc:Subject;
          b=FeIfMi3PI53+q04ACVXWYEVdeHMiTTAFgMOGjqkR9ZIXAxIP9c61E7znW9XbxB/TG
           uKR3ijiyJHxCDnPuT5ptDeHvdRBlusqrm55pZEoHnr7GTAIrqyhCSX3PCpF0bpMgFr
           CfMBRCjFFFaXM+7CbYcqh8NIE4W8gsWEh3jYxJ35XLCwtFODx7irQf1H44HfHIaAmN
           AXh1hPSrl/rUD7k3ZDDaaoZuURkK3AmZdYr8mjW8u1RMUIPg70lxcl3t0phBB0eunH
           IixxOqQuGIvffCIDeqF+Q1heK5KpsWD++92Rtd4kSR36NYgM3vE7f4k+nI170zSzcC
           vZD8zzPniwoyw==
Received: from 83.24.127.64.ipv4.supernova.orange.pl (HELO abajkowski.lan) (olek2@wp.pl@[83.24.127.64])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <andrew@lunn.ch>; 24 May 2026 14:44:57 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH] arm64: dts: marvell: armada-37xx: mark EIP97 as dma-coherent
Date: Sun, 24 May 2026 14:44:53 +0200
Message-ID: <20260524124456.350659-1-olek2@wp.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: b0c944afc73a131fdd57242ef64c7d1a
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [YRPE]                               

Armada 37xx has coherent bus, similar to Armada 7k/8k. Cache
synchronization consumes a lot of CPU cycles. Enabling coherent DMA
increases IOPS performance up to 4 times. Some numbers:
					Data length
Algo		MB	   16	  64	 128	 256	1024	1424	4096
DES-ECB		1	+21 %	+5 %	+5 %	+7 %	+7 %	+3 %	+20 %
AES-ECB-128	1	+21 %	+6 %	+6 %	+6 %	+9 %	+8 %	+22 %
AES-CBC-128	1	+21 %	+5 %	+5 %	+5 %	+6 %	+7 %	+23 %
AES-CBC-256	1	+23 %	+7 %	+8 %	+6 %	+11 %	+13 %	+20 %

					Data length
Algo		MB	    16	    64	   256	  512	  1024	 1420	 4096	 8192
AES-GCM-128	1	 +44 %	 +42 %	 +31 %	 +32 %	 +27 %	+30 %	+32 %	+30 %
AES-GCM-128	8	+319 %	+326 %	+163 %	+148 %	 +75 %	+72 %	+74 %	+41 %
AES-GCM-128	4096	+123 %	+128 %	 +90 %	 +83 %	+116 %	+59 %	+38 %	+28 %

					Data length
Algo		MB	   16	   64	  256	 1024	 2048	 4096	 8192
MD5		1	+21 %	+15 %	+29 %	+25 %	+50 %	+16 %	+20 %
SHA1		1	+24 %	+22 %	+27 %	+22 %	+18 %	+20 %	+20 %
SHA256		1	+30 %	+24 %	+25 %	+26 %	+21 %	+41 %	+19 %
SHA512		1	 +4 %	 +3 %	 +8 %	+10 %	+24 %	+10 %	+11 %

Tested on Armada 3720. Platform passes testmgr selftests.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index 360fc24fdde2..8418777042b8 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -437,6 +437,7 @@ crypto: crypto@90000 {
 				interrupt-names = "ring0", "ring1", "ring2",
 						  "ring3", "eip", "mem";
 				clocks = <&nb_periph_clk 15>;
+				dma-coherent;
 			};
 
 			rwtm: mailbox@b0000 {
-- 
2.53.0

