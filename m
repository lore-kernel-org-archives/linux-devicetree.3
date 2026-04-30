Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6332A22F74A;
	Thu, 30 Apr 2026 05:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777527949; cv=none; b=gOOkpEHEikSnQ0/OAiuKd7ginUF5Q8dBo4jTR7uMoEoKOasXuvdbsaqSvB6N6dMFuxNtUTx5Umdou6Fs8kbxMc8pRu2r2Tqs4tBthvxGP+7EZw+f8lFU692nLYQYFzCvL8EexhWyANMDOO6CPoJcrpSMD65BxuNBF0HXEMwPNmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777527949; c=relaxed/simple;
	bh=/tkgJeqOmmrJzR3XxdwYwLro87tsKaNd19RouarTTO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WYjMca3rEI18xTRaZiF6A/hMTAjC864kiYpKt/J3jerONRpzfxyv1kpSUFZrS3szxDz80v8b22etDS+ixVakb5RLkdgyAXXw0Po6UyHR2eIhTS5p//hHjjigLgCDefsOrWDyATg/x3jQepqD2BII5jItxeMUOhXcIgQBpYLps0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r3ViC7bH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r3ViC7bH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59C40C2BCB8;
	Thu, 30 Apr 2026 05:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777527948;
	bh=/tkgJeqOmmrJzR3XxdwYwLro87tsKaNd19RouarTTO8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=r3ViC7bHBo9vMLgWRlcm7dJWyLccD4DRD5a+PsvyS4nO3o0FiaJZix6dZ/FOPw8ho
	 tUxT3Hxfv0YgQa8Jt19t5Tn2eBX4DbYCkon7RXKwbE6j1+pX0Udf6eh2UHBWJJZ8wt
	 b5Z/IztnygykkV3Usd6898AC8PzhXYaUZCR24RRDiwcE3+afSlNq+xeTbqgjdJlMJG
	 iiTuYOTLLF1S1cv74OvpDdn2SqsodGr8oqPADn/fgb35wbFx1Ya/MKSmWBx31FgNE4
	 LSdEWZH9FHyysPBKdhwONZByHWLFO2zfvN3BxM1mKDDNQsuDf5XKzeNcQTGzVgXNRJ
	 Qw9GS0ZJb54uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47279CD1297;
	Thu, 30 Apr 2026 05:45:48 +0000 (UTC)
From: Rex Fu via B4 Relay <devnull+Rex.Fu.amd.com@kernel.org>
Date: Thu, 30 Apr 2026 13:44:28 +0800
Subject: [PATCH] ARM: dts: aspeed: anacapa: name EDSFF and thermtrip SGPIO
 lines
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-anacapa-sgpio-edsff-thermtrip-v1-1-2fd5e72435d0@amd.com>
X-B4-Tracking: v=1; b=H4sIADvs8mkC/yXMwQrCMAwA0F8ZORvoqgzxV8RD2qVbBLuSVBHG/
 n2dHt/lrWCswga3bgXlj5gsuaE/dRBnyhOjjM3gnR/c5eyQMkUqhDYVWZBHSwnrzPqqKgUpBu+
 vIQ19YGhHUU7y/f33x9/2Dk+O9Uhh23ZG96kXgQAAAA==
X-Change-ID: 20260430-anacapa-sgpio-edsff-thermtrip-acb228bf61be
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Rex Fu <Rex.Fu@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777527924; l=1868;
 i=Rex.Fu@amd.com; s=20260417; h=from:subject:message-id;
 bh=FKvzsI9xHFmGcGo9UHVCAjhAhv7ytsitasP4Y5ub01A=;
 b=GPiFDR+/ibGE0NwGTxGFGmQdcKyr+YrgZyfg43LrcwIi2ZH7TGSoZmO77kXGMks/g4aHs7xEr
 73Dk+5T4CraD5T71ecP2h9D4jP6C68jM1Nj8r/ozRB7Hvh1j+k7MeL/
X-Developer-Key: i=Rex.Fu@amd.com; a=ed25519;
 pk=26ECoh24fxrbXDKgA4hCmgg0xjQ+IxU97kXb46ovwgc=
X-Endpoint-Received: by B4 Relay for Rex.Fu@amd.com/20260417 with
 auth_id=738
X-Original-From: Rex Fu <Rex.Fu@amd.com>
Reply-To: Rex.Fu@amd.com

From: Rex Fu <Rex.Fu@amd.com>

Name the Anacapa SGPIO lines used for EDSFF power-good and thermtrip
assertion signals.

The affected lines replace legacy or unused CPU-related names with the
platform signal names used by userspace monitoring.

Signed-off-by: Rex Fu <Rex.Fu@amd.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 2cb7bd128d24..fe960bb7bc27 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -912,7 +912,7 @@ &sgpiom0 {
 	"PWRGD_PVDDIO_P0", "",
 	"PWRGD_PVDDIO_MEM_S3_P0", "",
 	"PWRGD_CHMP_CPU0_FPGA", "",
-	"PWRGD_CHIL_CPU0_FPGA", "",
+	"HPM_EDSFF_PG", "",
 	"PWRGD_CHEH_CPU0_FPGA", "",
 	"PWRGD_CHAD_CPU0_FPGA", "FM_BMC_READY_PLD",
 	"", "",
@@ -957,8 +957,8 @@ &sgpiom0 {
 	"PDB_ALERT_R_N", "",
 
 	/* L0-L7 line 176-191 */
-	"CPU0_SP7R1", "", "CPU0_SP7R2", "",
-	"CPU0_SP7R3", "", "CPU0_SP7R4", "",
+	"L_EDSFF2_PG", "", "L_EDSFF3_PG", "",
+	"R_EDSFF2_PG", "", "R_EDSFF3_PG", "",
 	"CPU0_CORETYPE0", "", "CPU0_CORETYPE1", "",
 	"CPU0_CORETYPE2", "", "FM_BIOS_POST_CMPLT_R_N", "",
 
@@ -984,8 +984,8 @@ &sgpiom0 {
 	"HPM_PWR_FAIL", "Port80_b0",
 	"FM_DIMM_IP_FAIL", "Port80_b1",
 	"FM_DIMM_AH_FAIL", "Port80_b2",
-	"HPM_AMC_THERMTRIP_R_L", "Port80_b3",
-	"FM_CPU0_THERMTRIP_N", "Port80_b4",
+	"AMC_THERMTRIP_ASSERT", "Port80_b3",
+	"CPU_THERMTRIP_ASSERT", "Port80_b4",
 	"PVDDCR_SOC_P0_OCP_L", "Port80_b5",
 	"CPLD_SGPIO_RDY", "Port80_b6",
 	"", "Port80_b7",

---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260430-anacapa-sgpio-edsff-thermtrip-acb228bf61be

Best regards,
--  
Rex Fu <Rex.Fu@amd.com>


