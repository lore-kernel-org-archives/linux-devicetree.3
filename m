Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C84F453A3A;
	Fri, 31 Jul 2026 17:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785520800; cv=none; b=bI/29OW18i2Qh71hgdGmA0RtpqZlOiwQw/tpLlR5KmdZFl/Pp2RHv/3Ih/ZnoxoLiHyLznkRa18io098WrffqSq6BJDrx3Pc4ZO0s96SVfzEeV7Fu+3obf4rFOGqlVN19zeSDZTAWldM68A5Cz4KQ4GT+9pLimMGeapmbtRSf1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785520800; c=relaxed/simple;
	bh=E4b4C0Q4DM9XoBABIs1JvRht4R4Ch1l48q0S6hTd+0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BfXswixYmFHxl50E3lPi9iWJmKQmf/l6dS/jHkuwTIBgiTIAKfwBdJ5cloCMdzoV+crtwOS9Bfh8NrKHiHcyjMz5SF7IWfAmHGiwXKGh36Iz2UMrSLLQTd7QPq7lm4K2QQ9PcSLcUGpdClvRpzPN4qrUkrGSah7EIOMi+8VmtAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvuCkXGW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvuCkXGW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA5F1F00ACA;
	Fri, 31 Jul 2026 17:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785520799;
	bh=KBmjqxroOngg6xzRzOESA93TgFI4YQ2mi9Xun2Eig0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FvuCkXGWp+e4U+VoZqiIpHZMvl2h6GGSw5sXFR8pvy+Yp+Kh9tomvy23ihc0NgcpJ
	 lA5iPFHFnHcFcZXxIWTpE/9THKDQbRdKMu1SYYlLWeegOFej19HRhmQMc+kUU3hnGL
	 gDeHjZHOFl6k3GIAveoZb4tM3rM0nlBDvMupLa0eAhiDxaCrQ2eKT4jv9qZrieFSpY
	 Me9BJCK+qDTNqF+hHgBp3VGnnj+W02Nb5Bfrd7+lSysgIQGWlsI9wpR3WnOJcYeZ3v
	 cfRIqmA82SFDTGdVePPhKMaxH5NzqS8GDI27gWfUrrMZ59AtYslwBCNzTkzLAJNX6T
	 n+TK8FAW4amfQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 31 Jul 2026 19:59:44 +0200
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x
 Gen11
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-topic-yoga_submission-v2-1-f1887031da4f@oss.qualcomm.com>
References: <20260731-topic-yoga_submission-v2-0-f1887031da4f@oss.qualcomm.com>
In-Reply-To: <20260731-topic-yoga_submission-v2-0-f1887031da4f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785520792; l=1052;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=aNkMK2KPxuP57VzOi9P/WLFeEzrA2MpWPSJTejQkKwY=;
 b=PPiK4iGk9KfUMyzG+qpBjix33uBUWSPG03srdibJ2sGz+yS0lEnSbn+27rNxvnGN/zQfMskJT
 2rHW5cZTdmOBVCtkTXvz9zY6/n5H0Q13rFUYfoiZ/7H7o7enlNMDyGp
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Yoga Slim 7x Gen11 is a Snapdragon X2 Elite-based 14" laptop from
Lenovo, featuring an OLED touch panel. Add a compatible for it.

According to the spec page [1], there  also exist other variations
(based on the Mahua SoC and/or with a different type of display panel),
but those are to be described separately

[1] https://psref.lenovo.com/Product/Yoga_Slim_7_14Q8Y11?tab=spec
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0204f80a9501..8d016ca7edeb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -87,6 +87,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a16-ux3607oa
+              - lenovo,yoga-slim7x-gen11
               - qcom,glymur-crd
           - const: qcom,glymur
 

-- 
2.55.0

