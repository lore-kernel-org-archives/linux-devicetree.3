Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FA74BC02C;
	Wed, 29 Jul 2026 14:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334168; cv=none; b=AKWrvM8ABLZubGNtyFVI3aglioWLLA7j2SWgKTAERtbT+u6/jXA7PZuJUSpQC1P8RIdmKwp9B5CUpan7nqF1hlc4N5AUgRuIRMWOgV2kkSrJBWmCKldB4VFh3d55181u9hs+1hnuliYQCOZM72WO+xo8CeDF0yyKOFKXp7siT48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334168; c=relaxed/simple;
	bh=sDkksDerCuUfXalHIpMBHKeDUZOc/Fun258gI07fgg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qrDV2TllfL4t1ae4MxQ+AoDMKMYaGyBAgHe2MpE5XvcRBEh3qB6B0tENwz1lnChEGGqX/qNUVzIx4ZI2U0DMuB6CIk/5GH1xpoW2e6mmxof+PhzjPe+w4DW6vPVKSQKKXEL0IARmyR9KMzfkzAbtmGtWiEKYVDqJkBE9+GrbNpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WuclSPhW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WuclSPhW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90741F00A3A;
	Wed, 29 Jul 2026 14:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785334167;
	bh=MyxCcsHe5I1W8NGOsmlYwgzsBcZCZE11lAyqJo9+vTE=;
	h=From:Date:Subject:To:Cc;
	b=WuclSPhWzcDKIGi95bpVQKQT826LBgGve1SHwo3IS5LA0V89TdDnaT7e0LXaNdRjd
	 q5RAqJRPXIMtaoIj/amMJvgbIoadtRJMwKtsUvefOqWcnkPhRfI5yALQgxSYDHAxYc
	 DFjCmgHn5h/GT7PlCGCIocPGIhFQnTNiofhTVm4tN+UIrF1RnjVvNkFy/7mE+yK7Rq
	 yubxgDoXdVNqZYsyQ4vjlilqIUo8g3kQqt0eyzuk5KiItKilrWVH08wi9DWdWrEfE7
	 49JMVM5QHCxVB4PuaKFBMHuyz5r5ToxUCgwiv9baakdL14prRXk6JxI9dr8FSuSmOg
	 miOMN3JGFm62A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 29 Jul 2026 16:08:32 +0200
Subject: [PATCH] arm64: dts: qcom: glymur: Fix PDC IRQ mapping
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-topic-glymur_pdc-v1-1-8747789e35aa@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6DIBBA0auYWZcEWaj0KsY0Mgx0mqoE1GiMd
 y/W5Vv8f0CiyJTgWRwQaeXE05hRPgrAdz96EmyzQUlVyVppMU+BUfjvPizxFSwKp0laNH3pTAM
 5C5Ecb/9l291Oi/kQztcHzvMHIuT4anQAAAA=
X-Change-ID: 20260729-topic-glymur_pdc-f9e0dcba1fb8
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>, 
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
 Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785334163; l=1260;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=LX11BRXIL5DA1BxMWYN/g+cpwvJo8JGqfUsAq5KnWxo=;
 b=ygJvV9cPm9RbjEQN4AkmFILVNGJCkthZQvkl79jFyUDfbn6kcfFUp9ex18LH5whL4xt8cWHzY
 En/yZWymB5nC1gun73taWI4mcOu8XpKQNDh754UadjnBQsWDSRI05vs
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some of the sub-ranges are inconsistent with HW docs. Fix them.
They are valid for both Glymur and Mahua.

Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f32af66a3f1c..aab6b73dbc41 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5378,9 +5378,13 @@ dispcc: clock-controller@af00000 {
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,glymur-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>;
-			qcom,pdc-ranges = <0 745 51>,
-					  <51 527 47>,
-					  <98 609 32>,
+			qcom,pdc-ranges = <0 745 38>,
+					  <40 785 11>,
+					  <51 527 4>,
+					  <57 533 10>,
+					  <70 546 4>,
+					  <75 551 18>,
+					  <108 619 22>,
 					  <130 717 12>,
 					  <142 251 5>,
 					  <147 796 16>,

---
base-commit: 3652b49adac266a3d27cb41cdfdb7d8790fc3633
change-id: 20260729-topic-glymur_pdc-f9e0dcba1fb8

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

