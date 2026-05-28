Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DF13E3DA5;
	Thu, 28 May 2026 12:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779972855; cv=none; b=grImpByKNVhX/mFbdpKKaiBoyizS31QBjB1iRgAXfsGqqOcHngviEMGcAR7kt+rBmvk+TwzUgitmYdosOVWdshboLQOuRmxX1NwR26kftK1WLTw9dLvc4gJtIUPZ/pURc2W302gwqjIBKGbwQmG1f4knLhsEBiMMZ7DlTTZsazM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779972855; c=relaxed/simple;
	bh=1TCwjAjAkJY79phktGDqLGQ7n0NM7vNYxsbdOtcnWuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tXVad1aVJ188/+lmtcrof7gVzWa+BQewbpPLkTcPdCvzs0ZW5mZHOR5F5LkV5W3rL+i/IRH1l1GpBB1LQQUWEIMw9lzgfyIfDn5NJ77hZOhj3K6OPhOaLHkFaMp91sr8U9WIevwpirHMgM3ssa8uyzK9xB8s4kEUwVagyKlPFAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Zq2f1oe1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Zq2f1oe1"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 998A682A;
	Thu, 28 May 2026 14:53:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779972833;
	bh=1TCwjAjAkJY79phktGDqLGQ7n0NM7vNYxsbdOtcnWuU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zq2f1oe1/UGa91tHaLMmHjANuCTDa8RXL62WXWzXCPIpEWjjE2iNjABvOufaj2jhF
	 4AOSIQQXHeQE+hkB/ADNtEOaQI05AIcXcecVtc5kSk9JUqLS7vD9ANqjT9Od6HZXdz
	 jDKRS6UBXKCliAHV3J4nQ+FVnmV/9P1fpHU9+Cxs=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 28 May 2026 15:53:42 +0300
Subject: [PATCH 1/6] arm64: dts: ti: j784s4/j742s2: Rename pcieN-ctrl nodes
 to pcie-ctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-ti-main-conf-v1-1-a54ac5c8d081@ideasonboard.com>
References: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
In-Reply-To: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>, 
 Roger Quadros <rogerq@kernel.org>, Devarsh Thakkar <devarsht@ti.com>, 
 Swamil Jain <s-jain1@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=1TCwjAjAkJY79phktGDqLGQ7n0NM7vNYxsbdOtcnWuU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGDrwNKdZgwSHzDNuA+pBv16YHNJjhN7nG4FoG
 i3jbhjgasyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahg68AAKCRD6PaqMvJYe
 9YXMD/0enQlx2L1983874U0NfvmdgZWcYoaifqJmRH79rqSuqn+jIQj7fjbxzPYjtpvOgq2/Zgy
 atfsnoH47LdOXOgE13QGv6by+Y6hJYsle6EpGp4H/OktyWZfdbh+xvQxpaOe150GntXwsJkjnhp
 nSPideEVFAnvYk9i//iWjc5P3CFI6osKJzMdHSC2XHG0EOFHL/qEY6x4K97wX8yDHs9RxBilWt/
 e4ZodOOph45Pn5xksiyHGlYiRbx3tn558DvOqIuVE7VVNeI4tCq1yujOALwn5B55QhHZIkpG0TS
 7+LALtT0vfEKlGkPgnUnrxzcJX75gDUeJ2tAsZWpOUQvqurVS3yLUMnJbqVfemS1ZyZhxT4nNoT
 yUcJW10vQYG+4Le3ds3JH1NCxYsuowEKzYxnCF6kVOgALLaSmFGol4gITZlVNvxdq/IQxp3LucN
 gyq8uAtsXFiGMQj4ynTPrA5zZnUfsim5mjvC5nHmWTWyzNUE2aVoAH3wmallCKJFlnRo3q5L8fp
 cVg8U2kWYuXCNfGz+TKgTnmzys5l2xebZXfNXuLFH2A/fnvZckIbW5cgfoBgvJ8GBxzyqcQd0t5
 CIyK58+nZz7EHUal3u8/Q8pEBDWoSANpIc+K2BfrdEu8LA4qSLCSlH/ZSaQk1/CYIq3IOB2LMOY
 Rkuw1Qq3SJdJX/Q==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

For some reason the pcie control node names were numbered
(e.g. 'pcie1-ctrl'). Fix the names to 'pcie-ctrl' so that we can, in a
later patch, more easily use a common system controller binding.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 4 ++--
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi               | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index c2636e624f18..2570723efa4f 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -65,12 +65,12 @@ cpsw0_phy_gmii_sel: phy@4044 {
 			ti,qsgmii-main-ports = <7>, <7>;
 		};
 
-		pcie0_ctrl: pcie0-ctrl@4070 {
+		pcie0_ctrl: pcie-ctrl@4070 {
 			compatible = "ti,j784s4-pcie-ctrl", "syscon";
 			reg = <0x4070 0x4>;
 		};
 
-		pcie1_ctrl: pcie1-ctrl@4074 {
+		pcie1_ctrl: pcie-ctrl@4074 {
 			compatible = "ti,j784s4-pcie-ctrl", "syscon";
 			reg = <0x4074 0x4>;
 		};
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index 78fcd0c40abc..336bb9b99201 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -152,12 +152,12 @@ c71_3: dsp@67800000 {
 };
 
 &scm_conf {
-	pcie2_ctrl: pcie2-ctrl@4078 {
+	pcie2_ctrl: pcie-ctrl@4078 {
 		compatible = "ti,j784s4-pcie-ctrl", "syscon";
 		reg = <0x4078 0x4>;
 	};
 
-	pcie3_ctrl: pcie3-ctrl@407c {
+	pcie3_ctrl: pcie-ctrl@407c {
 		compatible = "ti,j784s4-pcie-ctrl", "syscon";
 		reg = <0x407c 0x4>;
 	};

-- 
2.43.0

