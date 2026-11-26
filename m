Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795700397;
	b=w+ij+Ji9foYzppbf4QcPuGvA1xP3kKASRG/fKRdlkQe6buu8rrpq3c0mw+tNIX2iOWAG
	 IiT4oLMHios9oxg6qWpsgpCLuisrrpr4+PDtHjrsFqN1qf5UZNI+Uo/usX0lNJafQkE3h
	 gGf4Qgeb4Hn11sPvmpxiLi3m2jmlg1O+piP/k6N3nO0ofbDpmSn1lHFm3RhAM2g7tFq0N
	 hdM28bTpTK4eyUi4GZ/ODWQ5d5cZjFk+VKP2dJyBxhhGdOZ6s7eRAC9MOWXfGd5uI1i9B
	 vpIyuuvPUgt1cBmzNpQh0m/YMSPZ609kiCTLGAKZ8q6H6xSkTd8TfH0tjXia/A/nWwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700397;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wz+pTfxZrz3TC8Nx9nxJiZVFj7hIyiHVoMGn/8W8kRc=;
	b=rWdwaQKmaKw+37vdFTyWYRvPB6cvi7UW3VF/7ThOjZdT+0xMItms+JSIRSW4Fr9D3Ow/
	 iJ0KuPfxNw4/NryWNoOWXVm6AkYmoQKGsM+DCryI5gBBMmqeyuqNZHtH0VyYzuBXVQh2f
	 e00tHyvBU28JFsPmlf2+fQa0T7+wfLtM2jXHQn4ROuwEnHxIkHJn6uwwT/y7lPVeMeSJn
	 VeAQVPwYLWLdCgYKBNuZafTt7PYJOZa9j6keZvrvZHpvkOpQ0Xfol06hey/gdT5zZz95Q
	 tVCH3dk2wd2/hd4mTt3fkNeSN1MLrUs9hr8Ewq4DEhi9Ob82r+wmnKLo5s24iLkZitA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QyC6vyti;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3DD606A323;
	Thu, 26 Nov 2026 13:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QyC6vyti
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795700396;
	b=BAQ4bHVtFwi5Aauhfp0PRDEQ+Ul8N4HKeuIpYEmzXG6HUiMLu47y88CRCA8tp6q2woT6
	 Dy6Dh7MhuodM7hHeQifluL+9SEPj6/GDtQQ/+JBzaiu8C/fEQCff+ds9DYj7oVp57KzpO
	 au5mlUuU6ejof32aSRQGTb+S3ip0WP9phxxKlhmGWwHqyrdu9Krp9IQG3229Exqs05zul
	 9o+UL7fxyW5Ojqf0erg8NP/UgC+2Z8rrpNT1GLouql1j2U247tl1hrNqjxEjKcouREpTe
	 zHLTNyk6pLr8Y+QaDvQbPcAiKIo0BBFPQ0EqtCfCvGVP1b+eqZg03cb5c0E/uu74RAw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795700396;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wz+pTfxZrz3TC8Nx9nxJiZVFj7hIyiHVoMGn/8W8kRc=;
	b=MKKTFe00JetnnOwPiQ601YDTPabDfXp/Deyrp7Y5XUbUMeNGA79ToEH0Vo3YzdUrzCf0
	 wI8lJgAK1BJdYzDTz0dG5/dGe3Bu8iPQ3VHVHA9KN2GiSenHk9TaJEZiVnjc/VmeobQTt
	 pAolCNxrceApU7BY9x2b1PvWRkYznn/5usdCswERQANd8N0OBpUZYdJmQ9aROsPvNto2q
	 BlvZJAABbFv6QdZwpELvoZe3ywrOUU0uSvjiM0f72wjAZKyEQS5ClYvF0+hiIB6dSERdR
	 WapFB28xuxD8+/ScauDdPAORK255sX+zjcwPkDELhyxUtlUL+3hlLbStMTD9bR9wBWg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D1F91F000CA;
	Thu, 26 Nov 2026 13:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700396;
	bh=wz+pTfxZrz3TC8Nx9nxJiZVFj7hIyiHVoMGn/8W8kRc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QyC6vyti+j8WuOY3IXh/QGn2dPZ2gzvCTixEs28c9QMVTHyYcS0YKquOeUxYD8Ppw
	 UhMiFyuSCN3Me72CNl3R0IRP2KB7TckgdV3PY78hOBLq4pYdolg23rwcnanB9FfVBu
	 3+ti3VaUSE1b+M3eHCacvNBe80oakzAYPv1VWyq6o0rTv/4oQE921g6mMe4F3EE7X7
	 B0kEQadJNCc224npcOob5vHIT8uNKX05vtgSyj+4kbZy0tYqcOz+DKhc32MC5ZcWRX
	 LBGXGvIm0ypC31F0usdbOE3JQMAStLVsiJstx0p392OrpETlVfd90DZEDRlTr/k3Wn
	 IsO+uNpf845jg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C48DB4D543;
	Thu, 26 Nov 2026 13:39:45 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 14:39:44 +0100
Subject: [PATCH v2 2/2] arm64: dts: qcom: sc8180x: add IMEM and IPA nodes
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
Message-Id: <20261126-sc8180x-dts-ipa-v2-2-ad57b1be7c70@gmail.com>
References: <20261126-sc8180x-dts-ipa-v2-0-ad57b1be7c70@gmail.com>
In-Reply-To: <20261126-sc8180x-dts-ipa-v2-0-ad57b1be7c70@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Robert Ijtsma <robertijtsma@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795700384; l=2992;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=BnOyacuhbzcDt4clZZEwyrtjCfWK2nniZzvmzD0VMb8=;
 b=/7CX6GX1/hsUemErPlHdtYlhYC3EQyQd6z3vWI/vnEUv6tgXCPAU8VQI06CNo3n/rX4vUqqSV
 /WUvb2kCigoBjAyRF5BiL5fZXfNS0vJ/T/mfB4rLqke/vab7XKrxMtP
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

Add the on-chip SRAM (sram@14680000) node with the IPA modem-tables
region and the disabled IPA v4.1 (ipa@1e40000) node to sc8180x.dtsi
with its register regions, GIC and SMP2P interrupts, RPMh core clock,
interconnects, SMMU streams, AOSS QMP handle, SMP2P SMEM states, and
IMEM sram reference so board devicetrees can enable IPA with their
board-specific firmware and reserved memory region.

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 60 +++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index a85e321..5d83734 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2253,6 +2253,51 @@ ufs_mem_phy: phy-wrapper@1d87000 {
 			status = "disabled";
 		};
 
+		ipa: ipa@1e40000 {
+			compatible = "qcom,sc8180x-ipa";
+			reg = <0x0 0x01e40000 0x0 0x7000>,
+			      <0x0 0x01e47000 0x0 0x4000>,
+			      <0x0 0x01e04000 0x0 0x2c000>;
+			reg-names = "ipa-reg",
+				    "ipa-shared",
+				    "gsi";
+
+			interrupts-extended = <&intc GIC_SPI 311 IRQ_TYPE_EDGE_RISING>,
+					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
+					      <&modem_smp2p_ipa_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_ipa_in 1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ipa",
+					  "gsi",
+					  "ipa-clock-query",
+					  "ipa-setup-ready";
+
+			clocks = <&rpmhcc RPMH_IPA_CLK>;
+			clock-names = "core";
+
+			interconnects = <&aggre2_noc MASTER_IPA QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&aggre2_noc MASTER_IPA QCOM_ICC_TAG_ALWAYS
+					 &system_noc SLAVE_OCIMEM QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_IPA_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory",
+					     "imem",
+					     "config";
+
+			iommus = <&apps_smmu 0x520 0x0>,
+				 <&apps_smmu 0x522 0x0>;
+
+			qcom,qmp = <&aoss_qmp>;
+			qcom,smem-states = <&modem_smp2p_ipa_out 0>,
+					   <&modem_smp2p_ipa_out 1>;
+			qcom,smem-state-names = "ipa-clock-enabled-valid",
+						"ipa-clock-enabled";
+
+			sram = <&ipa_modem_tables>;
+
+			status = "disabled";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x40000>;
@@ -3615,6 +3660,21 @@ spmi_bus: spmi@c440000 {
 			#interrupt-cells = <4>;
 		};
 
+		sram@14680000 {
+			compatible = "qcom,sc8180x-imem", "mmio-sram";
+			reg = <0x0 0x14680000 0x0 0x40000>;
+			ranges = <0x0 0x0 0x14680000 0x40000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ipa_modem_tables: modem-tables-sram@3d000 {
+				reg = <0x3d000 0x2000>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sc8180x-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;

-- 
2.56.0


