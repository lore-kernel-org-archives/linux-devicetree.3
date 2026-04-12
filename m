Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4834320CCC;
	Sun, 12 Apr 2026 17:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776013541; cv=none; b=PRZoZ0pWFAsD8LnHZ653yizaMoCzqMkTv8mtNkoKl6F2U5ZOY/LC3ZJn1J5hmalDiXPUoL7jSPotSzNXJ/cNH5eUQmaRfuQnSN3EGCpHkqelr+e4yxp/dvWveSREOCHSyMeorFPyk55oeC0+0RbFzOOLdVu5aZJ7WBO1GcZS29s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776013541; c=relaxed/simple;
	bh=DtIrfIMocwcapZAI/AWz4r5V3avBcvVN6k54z3J7SWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=pt6C2VUTiGiH03F+8Ps9UitkyURoZQwFeVXkwq7i1JBtRJqeijnjeqbpuERmPvqiEXWC0WvNPZ3UhbxVvdG++IYCg38X13pkUP56OdRPSKEENpLd467fPV53WYvXzrl+OrSZJXU6ROTVakh2rRRH6Hqt12zO39/RQ5tDc/dhHhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+kDmRpY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+kDmRpY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2182C19425;
	Sun, 12 Apr 2026 17:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776013541;
	bh=DtIrfIMocwcapZAI/AWz4r5V3avBcvVN6k54z3J7SWU=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=o+kDmRpY28se8m1ww+4QJs9bc25MHtaT/esELG36kxTTlbpU2gWqVYuZHqzDaL9YJ
	 AZA4pk0SdA+8pL4SLH1hRyg3E/cSCRM01QJxgdivP6YePbeUD3vRCypVh9ETUVmoc2
	 IyvV6+2LTN5tWAJaR2pE/Bh0xg+cz84Y+AU8eYhrfEc7pVe3bzjBZdem48WtjPsO2S
	 T7AzUIZvgxCtekAn7b7soIlSZIOmTpd3xcpAJvBaMyc3VSlIhhdSU/gwGaqM9VT0gr
	 HdPVJxyaJd70ysnzmaghK9pHjzH2UKMhoy9pIjMue7unQYr/8DI2gBJM050LPfmixx
	 l+AEW5TGFcVLQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Sun, 12 Apr 2026 18:04:41 +0100
Subject: [PATCH 5/5] arm64: dts: arm: fvp-base-revc: Add FF-A notification
 interrupt
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-b4-ffa_ns_sgi_gicv3-v1-5-af61243eb405@kernel.org>
References: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
In-Reply-To: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.0

Add an arm,ffa firmware node describing the FF-A notification
interrupt on SGI 8.

Also mark SGI 8 as donated to the non-secure world in the GICv3
node so the interrupt specifier is accepted by the donated-SGI DT
support.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index 68a69f17e93d..87189b32e38d 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -40,6 +40,11 @@ psci {
 		method = "smc";
 	};
 
+	ffa {
+		compatible = "arm,ffa";
+		interrupts = <GIC_SGI 8 IRQ_TYPE_EDGE_RISING>;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -224,6 +229,7 @@ gic: interrupt-controller@2f000000 {
 		#interrupt-cells = <3>;
 		#address-cells = <2>;
 		#size-cells = <2>;
+		arm,secure-donated-ns-sgi-ranges = <8 1>;
 		ranges;
 		interrupt-controller;
 		reg = <0x0 0x2f000000 0 0x10000>,	// GICD

-- 
2.43.0

