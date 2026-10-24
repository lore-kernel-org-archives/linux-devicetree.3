Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792852128;
	b=ML9Y1XstebNiR2pYhRAu/1btDCYn39yMvmlVkAZAOaJ+ty2ChzE2xaVzmyaGwRPpSqGl
	 TjLLvhJb4TbEGi0HcjbznYmaf8m8/Nl1kR910bYr5vjcktNzTjed/Hcm9w7cKkAT4tzYH
	 eMeLVJnFtkmxK2D34ezZmzWoRTkM+yHsHQVbyYKoqwUM9cwu+6QktxLFEV9kafhgw/Qbx
	 0Lx6lhUKhS0DBWL2OO51pYsTxfSvyDlbCUxcwe3wcN9St+b1ZBfiMPc0gBmKka5dORXEl
	 P9lEMIlh+X5F8lLzbl1/suJjTQdstnuJp+FqYdQ82DyVHRFcpNJtxOD+aQgn3g7nCXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792852128;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=zh9RMhEB4nxkzrKhtN4Kf6FgQMlP7iI79irVGvGVleY=;
	b=pvQIFe7StYk+bz3nr3gX1/ewYOYCEczsuXs3gLqVNXf7/rn8AAvEjtWtNCCiZWYlmQ/c
	 Si7wkQCQxLyc9LtRLlBNNPlapr/fRdZg+UfRrnb4H7VrVXb/Sh2U3BEpHNFXz5y4q2t5D
	 pCP4EdUEZw0nYODMMWa0coxUSAegWvt8o9sUMo8goSwUiXCe/De+byF+WAGj0bCpOrlvk
	 ttEpZOWbMoXZPAlYpFkMEKPyGaf+3LkGBN4TNGYjNeJ4hFWCeKQFbW3nEbHHl/Ybq1eKF
	 FhHbNlBrSiInQ5JuYxk6EFgmmR89PJ81bSE4CXj/dnLCphbSxhl26hGWJCmMRmbsVNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=aeDj+9yR;
	arc=none smtp.remote-ip=79.135.106.112
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348CE606A31F
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 14:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 348CE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=aeDj+9yR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1792852125; x=1793111325;
	bh=zh9RMhEB4nxkzrKhtN4Kf6FgQMlP7iI79irVGvGVleY=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aeDj+9yR9fw1b2/ES2myr5vsyqdBEy7wvcystlGt2MW1yBKufj6Ubtrw/1JzuatyM
	 M9iNy09iuy6G7aUM8/vn7dkwhbXE/b2Gss8d962+nCZrnJQUrj9p/TcqUENfLZpavc
	 IyHA0qi8bgdVVer4cCJ8WdMtKTjSIvKcyj1uqV+w1GRVe3U/stI06adYN060HedwHJ
	 Yje1p9vhf7tv1pJtE7NMPAlCkQkDR0kZRDpXLoI5m+WPm88Bns3Ef4eZvazLMSar1y
	 v1+j4XdCyaXlDKwhoPQDeowkHrKaN4FxdjzHe90nOKZma9E+mbVRNORB1Q8v1gk+SS
	 Ku0ItHe37Qvyw==
X-Pm-Submission-Id: 4jBj1P5CVNz1DDnZ
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 24 Oct 2026 15:27:59 +0100
Subject:
 [PATCH 1/2] dt-bindings: display: msm: sm6115-mdss: Add missing AHB clock
Message-ID: <5326d23102e89b492767862fc7ae027f3eec2205.1792852079.git.me@michaelmcallister.org>
In-Reply-To: <cover.1792852079.git.me@michaelmcallister.org>
References: <cover.1792852079.git.me@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

MDSS register access requires the AHB clock supplied by DISPCC, in
addition to the GCC bus clocks and the MDP core clock already listed.
The DPU child also uses this clock, but MDSS needs it before the child
resumes so that it can access its own registers.

Add the missing clock to the end of the list and update the example.
Keep the existing three-clock descriptions valid for compatibility with
older device trees.

Fixes: b93bdff44a85 ("dt-bindings: display/msm: add support for SM6115")

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index 309de1953..d4fac93d9 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -21,10 +21,12 @@ properties:
     const: qcom,sm6115-mdss
 
   clocks:
+    minItems: 3
     items:
       - description: Display AHB clock from gcc
       - description: Display AXI clock
       - description: Display core clock
+      - description: Display AHB clock from dispcc
 
   iommus:
     maxItems: 2
@@ -92,7 +94,8 @@ examples:
         power-domains = <&dispcc MDSS_GDSC>;
         clocks = <&gcc GCC_DISP_AHB_CLK>,
                  <&gcc GCC_DISP_HF_AXI_CLK>,
-                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_AHB_CLK>;
 
         interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-controller;
