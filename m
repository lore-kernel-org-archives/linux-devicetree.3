Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204A2175A6C;
	Tue, 18 Aug 2026 14:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787062697; cv=none; b=k2Ord1pCR2A61tVFoWYl3nZN8CvY0pfCifBXnK/yyCyC68EQWHj4mpbWFcuky0sXqx6kunY6ROCjEXwwnLD3ZIMPVoAeigD8I/JL9YVCZpgCXp+Di/e/te6y7g6cUQlltgQPWPD7jKToigzyNnGqiDzYbDJxqQQetrFqXsqQ1O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787062697; c=relaxed/simple;
	bh=hn9aaL5Np2ACP5XCRxe2C3j1w0sc3rI8cw0YAsemNrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MsvMgdrMFaKEGWPzKjN0D9Yg/Egk70DiBTyrkUxPnaFWuMkoJcvYt7u1a6aS92d+AlnyiB6TfQznrt7Feec6hE4dHmyM0DocbIdDNN6Zn0hZQU5FATajrgALC0Ierr+9CFHAdDkVVx2NAtkadVdxeJDFRMm6TLhm/MhbHRmfT10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PXaTOLs4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PXaTOLs4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFDC1F000E9;
	Tue, 18 Aug 2026 14:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787062695;
	bh=lQ6MrCiZZT+mrxVJ80G2HBuj1g1N4krSlsCJ3uFi1lU=;
	h=From:Date:Subject:To:Cc;
	b=PXaTOLs4QP1ETyrbCkYkAqwieCM8YPMFNlGLPwEcBl7Xrr1lMw19LbgeqjzSomGiJ
	 QWT5b67+V4Y9ADg+HRdHhja6RhW9HTkJzqVswxiMx1o83XatOExC8TvKIo8X2VgZeG
	 SKViHWCTPZawQFf/CGyNQhtQu4GTGV46MPkjo81E7dL+VJHdIcFsiEqOWQRCwIvL0I
	 F45EDhyi+pa76mpQdvzWwyhBFDaZij1bmUIxPozq08un9KWuMQlrUAWnWvSj9jcf1m
	 JF/DLQ4a2a/NfL3wimKzWXt7D1z7d0As92I0ua1oTpXsC54PGCYuAqg8KVlSD0YiVM
	 dO6bpaMRMt2UA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 18 Aug 2026 16:18:10 +0200
Subject: [PATCH] arm64: dts: qcom: msm8953-flipkart-rimob: Fix panel
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-topic-more_dt_warn_fixes-v1-1-609d283502cb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMWwqDMBCF4a3IPBvQUELsVoqEOI52Ck1kJr2Au
 Pem7ePH4T87KAmTwrnZQejJyjlV9G0DeI1pJcNzNdjOus733pS8MZp7FgpzCa8oKSz8JjUWMXo
 3uNNEA9R8E/oNtb6Mf+tjuhGW7x8cxwfkLNCxfAAAAA==
X-Change-ID: 20260818-topic-more_dt_warn_fixes-2cca86964be9
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787062692; l=1159;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=QQP5idsajnfjQE8/05vaaEFp4cxcOh8wYTXgUqm17G4=;
 b=GK7A1UAaqYTWosQfxbI0q/Qjlq+GOWSfVu5w/NqZjo33j7Oqp46P2HOPPkO8i3Xjk/X7hLKDf
 J2VdWyGIDyoAQJLGF2NdxLuQKmyCQY056LbzLsZJlWLBke3RiVxIIus
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

During the review process, the bindings have changed, but the DT has
not been updated to match. Fix it to prevent a "compatible too short"
DT warning.

Fixes: a8c0bd4233a9 ("arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
index 978820348fa5..07f9ee868105 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
@@ -147,7 +147,8 @@ &mdss_dsi0 {
 	status = "okay";
 
 	panel: panel@0 {
-		compatible = "flipkart,rimob-panel-nt35532-cs";
+		compatible = "flipkart,rimob-panel-nt35532-cs",
+			     "novatek,nt35532";
 		reg = <0>;
 
 		backlight = <&pmi8950_wled>;

---
base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
change-id: 20260818-topic-more_dt_warn_fixes-2cca86964be9

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

