Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B464519A6;
	Fri, 31 Jul 2026 18:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785520807; cv=none; b=OllqT7xUfi9DTvMVa+M2Y0LxHcrgBckuk2FNXr7O+l0BvZ7MR/BEAxhxPGtrDWgO7ocLZ5R8IYpHv2ZReNQLAxzmz3PhjFlau2wE8fKd+DGQswbuhXJ4QaAB6Z/YFRPyyd8foLNb9uqtuS1PvPHWFVJYeuf9WndgC/shg0AFKHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785520807; c=relaxed/simple;
	bh=1eXgJ9UbqLNoO/osJEGefqKfTnaJSAQv5E+oi8NKfIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tTx7+VHKOUv6XjA6LArFx0wLJ1sw4/VVgqurU7AG/US6BhDskMENmyVPdIVS9yckCAQSLfFcQM1EzvD6gsOdMqb0l/FOzZGSuma4M6ivkBG/TlKTackIj9ZLvoYfmqsfr4WXzYWlVscCBb/TPhOheR0N5gcfVdKzMkhQ/fchjzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RmpwgbWu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmpwgbWu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0BF71F00ACA;
	Fri, 31 Jul 2026 18:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785520805;
	bh=fheeJGS0UFuo1u+U4RLb3rFd0vVGZyP+23234Wi76sc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RmpwgbWuDk2HMwLBD1jMnWxHdIyMzWWqihu5apeIDlDFlwOQBUMa+BwpsCE0X5M0p
	 Z8SDr69mVI5HIj94/W8FJIlBsZCO+XOSNKYBSDJ7FdrVLUu2s6ob8cmd7kGL8JkM0I
	 BPhQMEtgDsideM9o/BkP8vXO77z9hsRA5JkOOYhQ7/ikAlZFOYP8LMEVq5485kJypz
	 8Kui7AqJYLzjUEwsVby2C67hGFgzmZiY0n5FeHwWR/q56H50hDTKIzRxBg203S0lNo
	 NKRIUzznfCiwd+Hev886Lb89B4DrI4CnXlRXRUdCPChlmp+KgsATPm7i37z4d+6Q8z
	 aFClImukflYnA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 31 Jul 2026 19:59:46 +0200
Subject: [PATCH v2 3/3] firmware: qcom: scm: Allow QSEECOM on Yoga Slim 7x
 Gen11
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-topic-yoga_submission-v2-3-f1887031da4f@oss.qualcomm.com>
References: <20260731-topic-yoga_submission-v2-0-f1887031da4f@oss.qualcomm.com>
In-Reply-To: <20260731-topic-yoga_submission-v2-0-f1887031da4f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785520792; l=1065;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=S5U7t3G3G17fLm+QsTw3NZgaXGy4osnu4qp3CpafflQ=;
 b=J73Xo1fdVcpOFXHCIMgYJsOmp+KAZC3OGx3JnnsaCHYuuJNHg9kpIDG9jsw3Yr7CzJlWZ22b7
 EactsgER9JuCbBOpqof92G9to+3c1/SdyYYslaM/EXXNOr6aFFTH7+s
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Allow the use of QSEECOM on the Glymur-based Lenovo Yoga Slim 7x Gen11,
as there seem to be no issues with the firmware that would mandate
disabling it.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3c..85614a1fa1f6 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2319,6 +2319,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },
+	{ .compatible = "lenovo,yoga-slim7x-gen11" },
 	{ .compatible = "medion,sprchrgd14s1" },
 	{ .compatible = "microsoft,arcata", },
 	{ .compatible = "microsoft,surface-pro-12in", },

-- 
2.55.0

