Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795605228;
	b=KkOUB+ulGI/KCA9mDlH3pxw52wdUQFCrvRx3ON2ROmTuSjVGsTKz38wiVt9Xmq77Cy8J
	 Q1ufdr3pxlEU2/KzkV4shjL/wtvhxvnwI34VyK1tzFjX+MLjYsLmexiYrM16k2R0pMC2K
	 TSQYaP5oBG03l7D/cCbbZ8iP3/l6H1NVEU1xuvB6urtdq2ruCkNp5OM//31ew1PRs9TC7
	 NOh3xyk5QURS6IYK4GNy0zqNp4rR/0BUudYP7NEGpn5SG57bxXqWwCiy0osP7dBRDvJXi
	 6O7lt7N4O5Ic+TK5nXWf61JuVTMAoluWasJs2IIcvzLzer3x9vPMDhIuRhTEWcGWxEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605228;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=547UdIcXAilvDUUpZCT02Dp0UGg9vtjLFt9lDXGcLiY=;
	b=KBh8o3LWrf1ep9kOz5q+K9XRg/Ly6v4RnZhWTvGdcRKuxMLlkvFKbhYVzFRQZQwCEvg7
	 1vjvMXLZ3++hOCHLQNA6cIeNjKzTJFk6wHKS7YBpiYIjL0v+WzPLXx3g3tESFN0zj5CnL
	 QorcedfE994kcg5ZqrV/phfKw0QmQUk47q/zsQ7A8Eo3rAMK05CI8QY06f5LRYaaVI0H6
	 RikJ8JLaDGVM1XH5++INP21fvMvfn4sp/DToS/CHGDUxURKrDt8DKT98XKRYaFJRbfrpU
	 MVDQgA9hK0cjk5oeMmq+qZvbGxGqBDTIypiZCJiwqlC6P9kvOytETyswY+243qUcQfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kht10iY1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8BA606A333;
	Wed, 25 Nov 2026 11:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kht10iY1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795605228;
	b=LuPwyU1iJl4WMPxiTWJvV+F2e2INXV5aLkNieEt8kD/ty0v8T0J9Hx3MtdhrdVHw6kXq
	 H8Ftdc0HAZMe7pCkEpWt8uFc6btR2/DI5aFHem13FkB/xfgEt10KeEbMRwdnfvWuDLmrs
	 yyPxDbxGGoU9SABvFVSUDk9bTnvubuhy5uoSWAZvtmM/EdOX6rPsjfzlftdZqrGe+ghEV
	 wkqkcidkDmzf5LhlUQD1VNUnP1FQapZR6qXlmJV/9jVH5FVdBfuFRsE+F2YpO5fdV3Jv9
	 D2MsucFrAjT42WdnbYRVsxN/WnzjYUe7hxz9F6bL0SJTU0oe8vPUYOT5OyzNXIdOBNg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795605228;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=547UdIcXAilvDUUpZCT02Dp0UGg9vtjLFt9lDXGcLiY=;
	b=x5j0ThSr6lw+FY0iYrgsurqZ2G0bdvFAiiots9rMky0Cdp8Whd9kK552krsd/06wlgjB
	 7EqgKPOyr/FpXpilcFhX3v/+2bGM321heSZnOH7vYiRtdugAawjdWnoXwXe7ZGsfzudM1
	 GLPfDyZ+PNgvZsJhPEsy/u7Fz2y4BFSDiIF50JOUt8VZTHosm0a8JLBCkEXC7QDxp+zuS
	 u0M+t0mLNJCqCttws+y5tJUIxcOUBtkZI2ckSrgNoE/WgFRaWk6FB/6mgSV6juM2ag9k4
	 6bKZUC9u3Q+pX7h5JZmZ7txfkG5czWWXqPgOSFl/+JdZxsvYNPHk+9el4NCzyl/xGcA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 024251F0089F;
	Wed, 25 Nov 2026 11:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795605228;
	bh=547UdIcXAilvDUUpZCT02Dp0UGg9vtjLFt9lDXGcLiY=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Kht10iY12lVOGgYiQuRTRVM7dGCuNljwx0Lb1tFxDBvjAOPf7EDDtifcPHTvyGrOY
	 jPFhjveX0hhtTVSCWSHSdoWWiwFAkBCkxA32TFB5lx7KvsUaZJPz2z5/IrCmTRZkhp
	 NjFkfb9ATQ6fyDghWjZAmaTFIvE+2L/bdGsj9qBDqFtJqA1vCHgh+wcS/uvBn2Gkho
	 6JxKMPGZy4VL5aDq1bpPrvvwgLWhwbMaxwhX+yO9tzDRUYkQuHOK0poCrPaMYQOv8g
	 qhJzxi7Luf8fs71MHRqH9RXtL5Ayi0MYrFEidEpdRgcVJj5rMcLO1LpArXDRpPjCma
	 ZJFN94Mzij0OQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5216A4CE7E;
	Wed, 25 Nov 2026 11:13:37 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 12:13:37 +0100
Subject: [PATCH] arm64: dts: qcom: sc8180x: add IPA node
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
Message-Id: <20261125-sc8180x-dts-ipa-v1-1-12e54c7e13b5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAODCBmsC/x3MQQqAIBBA0avErBtQwdCuEi1Mp5qNhRMhRHdPW
 r7F/w8IFSaBsXug0M3CR27QfQdxD3kj5NQMRplBa2NRotNOVUyXIJ8BlXLkydrolwStOgutXP/
 jNL/vB4SIn6NhAAAA
X-Change-ID: 20261125-sc8180x-dts-ipa-008e9e55c9bd
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795605216; l=2739;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=d35IiIlbv8warTqyu0RnwigzG9v3xGp9TFd/CxAMx0o=;
 b=r3R/YJo7unyUuYBFlfVlfHvo5PmYAcWld7tzWbd+eoQ1+FgYf9la5tgdwbfo/sxZStQG415As
 fdhBHN8V393ANmGOkKq4ScsBtnFRrHRXN3nUi64DOZsjGb3Yx7T//KE
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

Add the disabled IPA v4.1 (ipa@1e40000) SoC node to sc8180x.dtsi with
its register regions, GIC and SMP2P interrupts, RPMh core clock,
interconnects, SMMU streams, AOSS QMP handle, and SMP2P SMEM states so
board devicetrees can enable IPA with their board-specific firmware and
reserved memory region.

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
Depends-on: https://lore.kernel.org/r/20261125-qcom-ipa-sc8180x-v1-0-48a889acbe6b@gmail.com
The "qcom,sc8180x-ipa" binding patch in that series carries a
Reviewed-by from Krzysztof Kozlowski.
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index be79608b7161a0786463fe93e22798080ebba93c..d30e56fec6303ca0043b68c6c0f739c9614aa5fc 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2261,6 +2261,49 @@ ufs_mem_phy: phy-wrapper@1d87000 {
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
+			status = "disabled";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x40000>;

---
base-commit: ef922b721a5e99348fc1f5801fdeb427ee14ee9f
change-id: 20261125-sc8180x-dts-ipa-008e9e55c9bd

Best regards,
-- 
Robert Ijtsma <robertijtsma@gmail.com>


