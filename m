Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1BE211A28
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 03:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777002962; cv=none; b=Z2FMNF5ihv0fcEdndJ+O2go1h9ZMIMCokqCYXmejXR4sgh9s6FvdD93ZHLqYW5YbSX+iC7e116WBArUXtaykbytNL7E8mYxxXek8m1Pak7xVUQgG1WD3O2ugvovmsbvex8RHS2AQeKTsCT4vnpk6WkNh4tTbRw9RzHub4vtIZ4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777002962; c=relaxed/simple;
	bh=uIcinqDTwAD+6bWlk8Jl9BxgCl399jpzEpwpaVxWOPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QSddCb+qLdflai9Ylg2sD75nHLxCZ0KxkHVBSKbATugZlGRg81jb/pXgqc1krAO0pcfOK4MxTQDTb0cZuetdDBeih1f86a2E00sPFaDj873DUqOYDB9qyP6K0sFNUq37kPTO63m0QTGGXuj0BQQAUZWEYOjexq413FCiRwYdM1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6nJDoXu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6nJDoXu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0373FC19425;
	Fri, 24 Apr 2026 03:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777002961;
	bh=uIcinqDTwAD+6bWlk8Jl9BxgCl399jpzEpwpaVxWOPs=;
	h=From:To:Cc:Subject:Date:From;
	b=B6nJDoXuWTic3+m8PGdXM0t1gY06eXRAmtn1RchNKF+ojjrWTOwm6+7aWF9aIh3PV
	 ifJ7L4e1dXNICRljIqfOGSPxpwW8BJ/N7Y0epMXPC32MpgI4n7wpoSTTm6tiuLMZzL
	 SBGmudNlTif5JrkU8HQ0i7B/VVuPGHfrHXuKtWhZGe3wIKhGm97tCvdH7tk2uK1qId
	 EEnVkmfzXWb03LJFQttcGP+oE6/YqkZXVpHF5kFDUYwumZB0zqyqmOd593X/je6L75
	 5msrKJ2u6Bc9/KwVNpkHb6r4dLjkQLLDbx96QWFUKvH+HJQY3GbNUy0J74OdH8occA
	 SUYXSvIO1rSlA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	michal.simek@amd.com
Subject: [PATCH 1/2] ARM: dts: socfpga: remove the reg property in the pmu
Date: Thu, 23 Apr 2026 22:55:45 -0500
Message-ID: <20260424035546.646650-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Cortex-A9 PMU accesses the hardware via system coprocessor registers,
not memory-mapped I/O. The driver does not parse or use a 'reg' property
from the device tree, so we can remove the reg from the DTS.

This change fixes this dtbs_check warning:

(arm,cortex-a9-pmu): 'reg' does not match any of the regexes

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi         | 4 +---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
index 5dc8d33e8ad7..98cb4cad2a10 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
@@ -37,13 +37,11 @@ cpu1: cpu@1 {
 		};
 	};
 
-	pmu: pmu@ff111000 {
+	pmu: pmu {
 		compatible = "arm,cortex-a9-pmu";
 		interrupt-parent = <&intc>;
 		interrupts = <0 176 4>, <0 177 4>;
 		interrupt-affinity = <&cpu0>, <&cpu1>;
-		reg = <0xff111000 0x1000>,
-		      <0xff113000 0x1000>;
 	};
 
 	intc: interrupt-controller@fffed000 {
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index a53a94678df2..ba4c0ca89788 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -29,13 +29,11 @@ cpu1: cpu@1 {
 		};
 	};
 
-	pmu: pmu@ff111000 {
+	pmu: pmu {
 		compatible = "arm,cortex-a9-pmu";
 		interrupt-parent = <&intc>;
 		interrupts = <0 124 4>, <0 125 4>;
 		interrupt-affinity = <&cpu0>, <&cpu1>;
-		reg = <0xff111000 0x1000>,
-		      <0xff113000 0x1000>;
 	};
 
 	intc: interrupt-controller@ffffd000 {
-- 
2.42.0.411.g813d9a9188

