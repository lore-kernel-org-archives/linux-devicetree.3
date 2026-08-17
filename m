Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10E4340280;
	Mon, 17 Aug 2026 18:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786992973; cv=none; b=U7wJuahwRZnNf9cskEBxa+hZB3qN4PrhzXWUwUH66HevK5ZXqUgMWXa6Ol7aR5dZUj6eM+0+WzO9W/gcOwhBgkjUxL4+4/2ac8hECVOIbHlr5E6BBfLJ22zGZ7JmCUGyW9VpX3iWYDo+vqvWaZV8JbK/rF4enM3ObKKiiL0rabE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786992973; c=relaxed/simple;
	bh=anVpOU2ZYu2oUGf1o4Lw9ZA/Lzz530/fKXyaqCUHi4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r0HO1kBN7VFNTKHpJS4Or+K4+31z3hmXtGIaEG7l0exqdB8fgP+IeCSUL1DW7UBnhxl/tAqmJVJfvSL9ytU99hI02eUhjsa/tThofMnQsdKXUOKpiDmrUJLLgVuvB9rBMuDVNt0FVD06/x0EJd7/VTwt+qdzRVLyAKe/AnFoq0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/NpkALV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/NpkALV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C37F1F00A3A;
	Mon, 17 Aug 2026 18:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786992972;
	bh=T33qGfs/0g0LtIrSUJXt4Q6Ekpi06sGsGWylhaYJd90=;
	h=From:To:Cc:Subject:Date;
	b=H/NpkALVtexLsn2fi4vjzvjSHCYJdXeTn7Jlgk51uq3IJV2bign4+t7t2bihbo+f3
	 66G97/fTLRyfMkU/GHIxprq1o74nkEDWJCm14cCx6ZshFkLM86/95kQm3tltyq9oL0
	 rqqbUyMnxJ3rpD7HFlNE/VupoZetJd6gcIA25u98YgGf1uMXV3cGeKFEBPD62AoS1L
	 JgdKbVIEnfgBu2lIk57vfMUVD2BIzGWz2rqvfQiQ32RrUhaoZ0Mr7AuMm31bZIzApQ
	 sZDs+EEpAdHbDiyZuPsOOApDXbzZWgtWmiM1w6xsea7EAD9I86a460xPMh4mApmn7J
	 7wocNBaFsTnHw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: arm: corstone1000-a320: Fix GIC redistributor region size
Date: Mon, 17 Aug 2026 13:56:07 -0500
Message-ID: <20260817185607.1756124-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Arm Corstone1000-A320 has a GICv4 which means the redistributor
region should be 4x256KB rather than 512KB. This issue didn't become
apparent as SMP was disabled as a work-around in early versions of the
FVP.

Fixes: 87599f1843d3 ("arm64: dts: arm/corstone1000: Add corstone-1000-a320")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/arm/corstone1000-a320.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi b/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
index f0937914350c..f895a024fc92 100644
--- a/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
+++ b/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
@@ -73,7 +73,7 @@ gic: interrupt-controller@1c000000 {
 		#size-cells = <1>;
 		interrupt-controller;
 		reg = <0x1c000000 0x10000>,
-		      <0x1c040000 0x80000>;
+		      <0x1c040000 0x100000>;
 		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-- 
2.53.0

