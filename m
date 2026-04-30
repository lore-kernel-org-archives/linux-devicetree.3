Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C5D47A0CD
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 18:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777572558; cv=none; b=OUDQcnMVKlapZpQxiUhD4xU+fjoh0vIUJd3xAHxB6Dmd0RrVpZAPkepFogP121ag7MXITAHqoi3KSOuBAcUH+Lh0j7J4nd5K6TpkhXb2eR1Cj74R1KDJH2OKCfZgU/k5PvOgDryJ1Zv8ZiuFLCH0V9Wqr5Ix758J0rE4otS+bD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777572558; c=relaxed/simple;
	bh=JAhrZ/4Mn+RhFswy5xhoyabVuyMKqw6bv0r4qG4kack=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evgCQY2iRwPd2r2rYuNi+Ml8WjsCImGERUxDa5QNOy5Jwlf5PXUXiWfLbXJstUl/lz8QP7D0JqQRRFnfsv4pdCWk3by9NzG60rRNxuh4w4HfneDm2+gn/JoK4LF9+BUYoXgJlnz3XSjTBCQpDk8o7/UCk5HlWF51QRYUtDy8V9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJBn0IzE; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJBn0IzE"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8eea23d01f7so148217885a.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777572556; x=1778177356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bai4xpOLUuwZmx3Zo15EDRauBF5sX3Irxv97VKKrfgI=;
        b=HJBn0IzEZHd9cdIcNCtdmUH6yRRUqj1C1Nj8mVLYsL80g2Oo9GMuRWxmt6TvY83J5c
         z4gmu60kEtGn9NA5zugAeVS2vz8v3UYLxM2laM0kud61QtaVuqs37hiDkAjxxTUk7j9d
         s+1w5ZPHwuIgGwrNcpEc1/C+bTxYttThXKXTir9hWCYemYDJU8jsJcMdn+85WNhleaWY
         h1Sgpg9q+Wn2SHecxWlnm8VecpIMF8Le7zST8Ezniu34ofMIsRZw2bz8jpT6loXiV7fM
         2tOmk+H/7n5LtUUr3yublvdlI/0wWjvO8Uwy177MjbYSXeki1QLsS/YqB/pXPyv6bquE
         9+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777572556; x=1778177356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bai4xpOLUuwZmx3Zo15EDRauBF5sX3Irxv97VKKrfgI=;
        b=K4q9861lgEsjbRvn7nc3DPUDZMQVh/GBkTVuW3i7LMMwg1JerAr+CeyWqfA1GL17jO
         +BmkL6EfNYLvI+mmlcfwz7wem0AzhcCb/NZ37t1xoOwSca8VhIOKuL1bIx/E8oPo2CMe
         qmPxxtPYL1tUb0pDFKYMPztut8qCv83RXmc79tFU6nqH2ssZTYoCBJG4cJddNhAxB2Ui
         EuN5IssH5ZSbzLfb12DM7B1VaGWMmN05lpaoJd2BPA5fYircQhpMHRdw5+5yasGhrU2/
         GB4h3W8IVLcOsE2/6AiHIsBJ42GA5QX/1umgKLvsJVgSnlHAwkGPOJQiTbwkLP6ZRxNF
         44uQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/vpKpVY1T4M49DeUdRYY76yKEs0S636y3EvvDMBnGyTvkpKBn4spYFdT59Xt4OQ5qjm1VYU/83BQx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9C0ADa5baXrzOd6TwMT+48PWi/LWO/sGxZnQVExKtczFKPxXf
	xcrq+Xktxzc2/Lo/wSD0/MKHgVgdc1e1IqDqCKyw+aDCE8nFMr6m9DjO
X-Gm-Gg: AeBDiets4bk/nYKIoDJUoa+Cm161tS/XiYnxrX2WUE7LWM4RvSyH1qt217/dlHAsFll
	cV85gTya73J1WRaCe0uHwizgn/R5eIm1iBUNJ1QUYNao3/kkMpeOG3Ivuee+ENcCSpTow+JNK/p
	fSH+Q5W7+d5wiw9OqVoaq+8FMbEYBh117+IPb+BH1l8nunoHSO8dvxU42kCGkJG6qQ54CLnaHOy
	VyZ+nXLhK8T/hNiE2NA92ZONYWGMyn2uE6Itt2OQGool2Fdi+LebtYIJUx6aoFOcJNPpjyp18Km
	jSLtFNru0psHDOs3vIk8py8e0DZ1mX7vk4DEyHj7usnXO2NZ9kh6L+8QKlF0QsfQzuXs5OUSnK/
	RCdkvQ4tTdjZkCWPLfS0KPRRlnKmORgJcltrwfxtSFzDCx3QvgljQi/oQZF59g7QXTe7pPhPcOw
	nTVlV9S/stkz+Hg8WiQl4xgknn5C9gbqGf9XEYmkwgYTBFOcQfBXy9Ta4ZFqG6+u8uHuHQ21E0V
	job5NmoV2oRXxba4/VQFg0GnA==
X-Received: by 2002:a05:620a:bc7:b0:8e8:93a2:217e with SMTP id af79cd13be357-8fa889439c1mr609409685a.34.1777572555920;
        Thu, 30 Apr 2026 11:09:15 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fbb3e2b668sm31637385a.35.2026.04.30.11.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:09:15 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v13 1/3] arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
Date: Thu, 30 Apr 2026 14:09:59 -0400
Message-ID: <20260430181001.9256-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430181001.9256-1-mailingradian@gmail.com>
References: <20260430181001.9256-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Endpoints cannot be pre-defined since commit dcf6fb89e6f7 ("media: qcom:
camss: remove a check for unavailable CAMSS endpoint") was applied,
probing all endpoint nodes and requiring them to have a remote. There is
no sensible remote in the SoC devicetree because camera sensors are
board-specific.

The ports are meant to be extended by a board devicetree in order to
define fully configured endpoints and connect the ports to camera
sensors. For nodes that are only meaningful if extended, labels are
usually assigned. Label these ports so they can be extended directly.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index c195c79c1c85..1613c66f92b3 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1787,28 +1787,16 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
+				camss_port0: port@0 {
 					reg = <0>;
-
-					camss_endpoint0: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@1 {
+				camss_port1: port@1 {
 					reg = <1>;
-
-					camss_endpoint1: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@2 {
+				camss_port2: port@2 {
 					reg = <2>;
-
-					camss_endpoint2: endpoint {
-						status = "disabled";
-					};
 				};
 			};
 		};
-- 
2.54.0

