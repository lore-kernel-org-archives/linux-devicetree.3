Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F0E3CCA13;
	Tue,  7 Apr 2026 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775576825; cv=none; b=JD7Q8CqLbMMl0LkmaOVMKFc/6uYbx8WIb9Qva/CYxKwq6vwESXRL376M7C4/wQqJl5+Br5No3JEEFOG/YKUjJjfp2PBvkAbSV1tMLWPfxbIJ4tbsWG+YXw9PQ2Mi7nE6hREw7IFerObxSMiWydVNpA/ctEzYOHg14C13v9smmpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775576825; c=relaxed/simple;
	bh=LbKWOpmrQxNliq40Z0HcC0KO8h1bXqqLjDfW4UUO4cU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jk4EyBfqzia6TeXjbJbdG1iYNzQ8hcmFQ5hoZlS9VPtjeN+83zmc7PxsaKST03LmqaNno8ceEKHl7ff2j1Eo/9Fpl7NtHgiVsYYsETSAda3r1U5mSJ793YTzoulLhH2hqiwPkivf6SYKO4BfqcgzRtelzYTZcSqti1U0/4IST20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHBnQnpX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHBnQnpX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4656C2BCB1;
	Tue,  7 Apr 2026 15:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775576824;
	bh=LbKWOpmrQxNliq40Z0HcC0KO8h1bXqqLjDfW4UUO4cU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MHBnQnpXi23MNsUzrYXKMw1qfYE8xJIiZby5ov0LuMNjvoy7X1sUChi0u6FjZOY8r
	 9nhyM3I4E5sRqTI2jswTvgaZ2UlpLUTBem0xKYMIDk8Tki1vWL0nXaaeP58Btt4FKz
	 I0mX0I9wUEuo6QuOHkjI891R71f1u7FFm8erBjAoAqZdKHwghgej3ouWcOd3HbQj9U
	 UVTtlPmBiDA6bgLUmO1DffSRs2VXfhdyEMm/3BRdXyK+akzE9uiHWEbtDov9CfBi4N
	 p2J3tzSGI8KQScgYoUgqqabtLfzSSPbB6rDGho74ro+pBcKigs3WnczmQDgpDIykAx
	 j+vIMnwpWqkaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94998FF510B;
	Tue,  7 Apr 2026 15:47:04 +0000 (UTC)
From: Joe Sandom via B4 Relay <devnull+jsandom.axon.com@kernel.org>
Date: Tue, 07 Apr 2026 16:46:45 +0100
Subject: [PATCH v2 2/5] arm64: dts: qcom: sm8550: add PCIe port labels
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-rb5gen2-dts-v2-2-d0c7f447ee73@axon.com>
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
In-Reply-To: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joe Sandom <jsandom@axon.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775576820; l=2152;
 i=jsandom@axon.com; s=20260319; h=from:subject:message-id;
 bh=jkLgv44WVt5xY7Os1HSzwl0z3b1+dHIfisiR/utABq0=;
 b=iyoFVyqUbBQ0g04fqkaMqSHwMKalOWfd3e+h+QvRjYuUJyyIJipOJjSWOTCC3CO48n3rkd8Ml
 qBdI1lflL65Dg11xShQDV0JRIzoy4ut9wRhqbQPVm6pzeb8OMeW5tI0
X-Developer-Key: i=jsandom@axon.com; a=ed25519;
 pk=Q/yflwj2WhkgBVTskrS9Vl5oScD0Bp3vTzDi+OxskTo=
X-Endpoint-Received: by B4 Relay for jsandom@axon.com/20260319 with
 auth_id=687
X-Original-From: Joe Sandom <jsandom@axon.com>
Reply-To: jsandom@axon.com

From: Joe Sandom <jsandom@axon.com>

Add labels to the root port nodes (pcie0_port0, pcie1_port0) to
allow board DTS files to reference them for adding endpoint devices
to each pcie root port.

Update the pcieport0 reference to pcie0_port0 in sm8550-hdk.dts and
sm8550-qrd.dts to match the label rename in sm8550.dtsi.

Signed-off-by: Joe Sandom <jsandom@axon.com>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ee13e6136a8259d28540e718851e094f74ead278..e821b731bdc496c872703723df02ae9b9b0233b5 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1012,7 +1012,7 @@ &pcie0 {
 	status = "okay";
 };
 
-&pcieport0 {
+&pcie0_port0 {
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 2fb2e0be5e4c6b597f20f332cdf063daa2664205..cf63109ff7bf7b6fc827f108e22e82b8b04273c1 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -912,7 +912,7 @@ &pcie0 {
 	status = "okay";
 };
 
-&pcieport0 {
+&pcie0_port0 {
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 055ca931c04859f3a312eb9921aeb7a8cc676822..54308cbde40732da072177eab533582c155df590 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2098,7 +2098,7 @@ opp-16000000-3 {
 				};
 			};
 
-			pcieport0: pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2300,7 +2300,7 @@ opp-32000000-4 {
 				};
 			};
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1


