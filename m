Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0BF3C1998;
	Fri, 17 Jul 2026 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286027; cv=none; b=tnezvuLVyymAiUULRN51VBD+OtSz02qIOxCS6pqnTqo7y7vVhI5EwIpeP0G13Bzdb5nfpI19LzLsRsHYPtnMgvM9x6g5aQUEbefex1x6AHwnIJROedmZzdTY0zRDO7je7xhx/r9c4Nvi4HkWRIjE524kN1QMi9IvCgDVPVWHBSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286027; c=relaxed/simple;
	bh=qgNEoNp2CCOxmbE8RsOglMAuB6Q/zj5b4TZXxiZs2WY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sHk/scvg7PjU37EBfukhg6IiF/G9IIAUb+3+l3U6GiZ3qWtzn39jioz+HbkRUS6Ur/gjWr/qeTCpIOTXqQN4SdxTsAwebcq1GPyQTQ/I89n/LpUAiH4wd2aySr7qIzWtZonb70Tu6a8Xq8PaVOM15ijZM8V2EOG8lXPCevraT+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CovGKNKG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CovGKNKG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5461F00A3F;
	Fri, 17 Jul 2026 11:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784286017;
	bh=7p0OeDGXA32PwnwFx40OOdSvwxgtdWLhBEnKT5RnE6o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CovGKNKGqL3v3T3PjQYZUl7v/xVQ9Um+IGGq5mmYmhOibGLopdHisxv3nWTnZoFZj
	 muJUyEM0AWtCtpXCcgppmy8lu1jqiq2BDpRRzBYxlXvd12HTmDyyRxZ3uqB+LNH7uD
	 pAWTPNHNT+dhxuG70oTBcXTtRH3Ez7vR0udQ+senEb52KHJqyHd9MSKY2uzHC/8oTo
	 k/2v9yTEhC+FpViL481tVLNKiprdkM4EeT17vMVNxbPWenFvxuYI+XcfiIYNyewmwa
	 bi3DgV3QjASgTxzUEKueT++hMmmomPJk88MCLJqPz5KB8QHOsjcIFQ470R/fY7LjtI
	 liVsMiP+eRtVw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 17 Jul 2026 13:00:00 +0200
Subject: [PATCH v2 3/5] arm64: dts: qcom: sdm632-motorola-ocean: Fix LED
 default trigger property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-topic-june26_dts_fixes-v2-3-797cd46e5d9f@oss.qualcomm.com>
References: <20260717-topic-june26_dts_fixes-v2-0-797cd46e5d9f@oss.qualcomm.com>
In-Reply-To: <20260717-topic-june26_dts_fixes-v2-0-797cd46e5d9f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca@lucaweiss.eu>, Gabriela David <ultracoolguy@disroot.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784286000; l=1029;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=GbdG6sytZxb0OakkhSoPJrvqVBY2YIq2i4l7vMQxZa0=;
 b=Utn+cotJ55B+5Ym3I0eY2rJLkMnIFOxT+IgpBD/yRNNKLWBwB1Hxx/V3C2opR8/UIzESTHTz+
 Xq7Enji8k1ODB9spksOTIMIh2jdQtEgeI1/gzqATqOWyfaRJpsKSb+8
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The correct property name is "linux,default-trigger", not
"default-trigger". Fix it to avoid DT checker warnings and let the OSes
consume the intended information.

Fixes: 3176c4d6b9be ("arm64: dts: qcom: sdm632: Add device tree for Motorola G7 Power")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts b/arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts
index 2f55db0c8ce3..9ea3e5e76bf9 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts
@@ -130,7 +130,7 @@ led-controller@36 {
 
 		led: led@1 {
 			reg = <1>;
-			default-trigger = "backlight";
+			linux,default-trigger = "backlight";
 			function = LED_FUNCTION_BACKLIGHT;
 			led-sources = <0 1 2>;
 		};

-- 
2.55.0

