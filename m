Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90420396B8D
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613638; cv=none; b=NJT/4qCxkMpjvnanuWHit100Pa07Cx9VarE242Fnh7oiAdmugrZxM71qHk6pdgUENobIPbfY2g8fLsHtCJ/XTAn8WfMCiB4+MhhIKLZD8RkrUVVf6zxy+ZoSzcWhJ2vR2YHVFRLyLZORAVPAnIbQlj3CaqX3mAf3UlA4uXD+mYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613638; c=relaxed/simple;
	bh=OYhouiq3q0ZDatpkP0Jk+C4Du/ssLvYTFdzjmmNjzZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZAB4YVyigB8Seew4xQBZCy3MNyLIWJfnQ28FLZqLyUtyz5JNq+0nfIkTtEAGqpHzk/7wqC5Fw3I3cqP6FMe6QjABxQv46KikX1KVwqWBTopftlrnGjhiZG9eDUJGULmmlYaFE+XQ0QXtohmapzVG9X5VltzP4MWShb7DhcTvTB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bz/IKWRf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kHAOcawe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bz/IKWRf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kHAOcawe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wsHZ2845988
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCyZJYSNUFNBG4vYgpcbj48rTe3RgrEG+krWZIRlkrc=; b=Bz/IKWRf300lTy2t
	4FYH33FDDGHcmTKXcCLsqG+BYP5H4rnawdm0Abu5sEdUOSZAvflb5ZOozYXNugLC
	b9gSCLTpq5AXA7z22/AdgOXxb0Cd4Rxw2J2fMp+Zah9PkkmVS8eaWBsK09vGW0FG
	+K1UnIgzDksR9cviRDwi2qmukpBPq87GyxjjdHtKfG5hc81Dn/s3iM4l5oGB4lH7
	/orayNsWOzTzGaxQ62kMiWu3dM+Htq6pKNwSgNndhwsjCn5BTgZG4NmmtdQ1tCqQ
	vtaDvEahBz/W4YGZHMimEZMRQt2TATH+Tk+IVhUXNVERvmMPKIC0aWgMGP7UngYb
	ESiNHQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqmxrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:13:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090cc6a7d2so61777631cf.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 05:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774613636; x=1775218436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCyZJYSNUFNBG4vYgpcbj48rTe3RgrEG+krWZIRlkrc=;
        b=kHAOcawekCCIoH80pKGfZtkOJytBMZXuS4iZw5/7DA42UXUkfpKE7mP0LqnE2FUO7j
         ZJuLrKMELFoZK6bRx9ENk+FZMVu8oblypwvu3NlRHI8kN7FycdaecCPRo+F8ueYFBs6Z
         UTns5hafbWlsHuSeK9dMRgpOeY3lfy3w8Si0qmXpogFZsiU5YZ2EgcSNzDfokb4Jhbce
         Zyik5fj8gzbw31y0ePL0T8Jz8OYu3dDY+ITn4uZJ2/RCp99NDAoZ48JRrtQ4nazdmeS6
         SZptiZv5I5nLWfHB9u11ForCfa3p3scxMcrlP2VqAYxGZcRRzvq9T0dQ4U6AQxQwfgcu
         ljJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774613636; x=1775218436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nCyZJYSNUFNBG4vYgpcbj48rTe3RgrEG+krWZIRlkrc=;
        b=jT1E2noFviQbGUQjOaByedwjQl1C9FT4uHgwNeXhDSy6LBMgAQMeUdy9FKj0PFXJ6F
         3e+XiMeh+jxIOap8QiXRukRvz76CXKXZtHhwenCcmjv5C2aDJCIcirFu3tJ85s1wjOzE
         TZ6Vr3wbRS1IcBDXYDRttHBTYv4iP3+vxk/Sy/ww4mKemrCtong+QSEwS7aa9Z/epzpZ
         w1rV01aiWnH4M8B9e2To/rGSrL4Xja78J8o8+SysCWtH7l4IjCKOj9aX+bw2L0AySHiM
         /PXmXJtWywTA1OC4hVekI64mnbQbaFoDcn4Rvwsda3yo4ieZLzjyfDXvedxNuWjdCPSR
         GX1g==
X-Forwarded-Encrypted: i=1; AJvYcCWC+HJMFEwcl+apW/MvPtD6gA/J9WxIw3jqUuW/E2Z2zIX/tDpyxYCnkTDRuraki3/OxGwmNEmPGklp@vger.kernel.org
X-Gm-Message-State: AOJu0YzdhpuritWQUi5C4xkiW4qLeGmeGOHRFDnG17yN4CZoKsSVUmaa
	6EfCpwH7d9TpKxvaopQ321gMq1ugpzC0Nmp2/iAo7l8IvtXWZN6KlKqhuOKA/13M3qbArtNJAsB
	hJpMAVfsqC7D+wDuXaDT3GPyRX6IkAeoxlpQAymHvZFL0prvZVbGzMat8kxKQ2tAj
X-Gm-Gg: ATEYQzxrP3yj+eFGOJ41ghL/kUdVwecVzVpC0oSh/GyK/YVB3SVH5zD7Vp7UdPuUU/k
	WJDu21fVlo4q3gB2P+UuO2NmGeB8mwCKF0rZmI0FbkKeB70tNJqwkgDa3j3tmReQmHvP1kcBfbz
	f3fCicb7gkmlAY6EVLPc5iClJZWjp+ZrKb+tg7ZmccnmB0AuTnlKCBtYcl5XH49DKpJ0lURbpOG
	wB8GRS1OKoygoyLh2xp7BCRQkidZgVJY+r83u4p+X9z9Wt7zF7zpFABL5VcpmAs+25khGqlrDbj
	ywMe45hvyHAHJJx/pGFg5CCT3GIHG6ki9iTalYwuoTTFcEpNg/DxKYEdd1HYxSA2bHT0sVcSWgM
	LNPFZwfYZpZaBOzvMbJ1q9Rx0KYY=
X-Received: by 2002:a05:622a:1aa1:b0:509:13a9:552f with SMTP id d75a77b69052e-50ba37f68b6mr31657781cf.18.1774613635531;
        Fri, 27 Mar 2026 05:13:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa1:b0:509:13a9:552f with SMTP id d75a77b69052e-50ba37f68b6mr31657141cf.18.1774613634939;
        Fri, 27 Mar 2026 05:13:54 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919dfb54sm14647927f8f.31.2026.03.27.05.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:13:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 14:13:40 +0200
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add missing power-domains
 property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-1-f14a22c73fe9@oss.qualcomm.com>
References: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
In-Reply-To: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=OYhouiq3q0ZDatpkP0Jk+C4Du/ssLvYTFdzjmmNjzZk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxnR8x1193sU8zac0btSsLrcziiHBxywYAio3H
 yRvs7NAfWaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacZ0fAAKCRAbX0TJAJUV
 Vo8READFsryJswnsDm0PlANo3n4UaqFu16h59gBNGshdYL6Z2/9dqsmnIDRCH8ih+s5DATAmX3s
 3u6GfXnHKX2CIwlmuThO2454vSlkDr4T50cBiJnL3rSAiKlmp64xxyjk/kVbcZy9EjX1Xee1tNk
 ixK1bqr8XTsvnS9J+yvDYN+2FnkHUlzxbKCSfDTC1or2JWXTiAzXVkuINGOQhudSjx1a1vkzjNC
 A0pgyGhpRizKFac3HnVGFly126JNr7EzFZHJS9KUxBKL25fyiNe724WivjdG7SfMRfqkHBdmoa7
 VXH2hitIYW0z2uBBKneTPUoSRmo2u8ahrSeyIf0tgKtTpIKi/ofvhxbJ/4jLVfBZuwdkXiLgWZf
 rcDxmvKSm+94fw3J672FNdbbplRlvtIR60ME2SwFg08gC/o6L76T9Asy7f1m13w3Ae4sRviBgkm
 YPjg+LhYq2vF1wqifqFQcRZc0sCN6LfCT6UYPtWno19xZvb01EogYBmK9RddTztYvuv+sqprQLh
 7JZK9giBjgzdbrzs7gQHrWn4jzQos2ZZyoosBbyrJ8g03ulfjfKODzmN4Uh13XT5WYAUGLEaXmF
 e0dF9v3WiJr9K1WF+Rk/h0tIdp0a1t6Etblm3QlHMzuGpiZOjCrLh9KQ4kICq0zFBMurbkAUvy1
 Vfv389wdsGdXm9g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4MyBTYWx0ZWRfX/THJ1bPsTekY
 ps5hNw21Qugi0bYZnvoR1Xs1iquasG86z8YGvpUT5/6UUbj0IuQ3Ita//4lMj5YnkJkdMVLCGQ2
 SnAUxHs/wadVkp12p0WS0SlJnZj5z4BfVirnAowGk5R3nqQM+rU51paK04xE0frpzZvQm+6Ehsv
 bmHk9virsly5xvMZhc++1BZpNA2SjYue1GAg+nSABXtI+9q1Ysp/n94VQYgfHrPnegEK0P/p7K9
 yzg0HPmcwUmDP7lMChFEjpWYlK/MHVTY2RVXRjy9/i6vJVm8bSWZASRcSSl9Kquz4JIG+f73vVo
 YJ2iI2BvNdXCIBfOYdg+eWEC48m6guDEIP7CCiGVcwQKIUCQS7cqWkgQcZCG/pmUIrI+cUnXKzq
 4EDhmTgqHyZk15xeAHMbNF6F1Zv8G74v7sCLo8moWuoeUmVtwWOzpIFKi2Ron/PhHpL9Vbun2G/
 9QVXa9mIVMsNj2Q+6gg==
X-Proofpoint-GUID: pXgfnScm7t3X-QXo8SX8sGsQwqk1ZxDJ
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c67484 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jcP1HsbDA0ark0d7qT8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: pXgfnScm7t3X-QXo8SX8sGsQwqk1ZxDJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270083

In order for the GCC votes on the GDSCs it provides to be propagated
to CX, CX needs to be declared as power domain of the GCC.

Document the missing power-domains property to that purpose.

Fixes: 95ba6820a665 ("dt-bindings: clock: qcom: document the Milos Global Clock Controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
index 60f1c8ca2c13..c65a6ad893d2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
@@ -35,9 +35,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -48,6 +53,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
         compatible = "qcom,milos-gcc";
         reg = <0x00100000 0x1f4200>;
@@ -59,6 +65,7 @@ examples:
                  <&ufs_mem_phy 1>,
                  <&ufs_mem_phy 2>,
                  <&usb_1_qmpphy>;
+        power-domains = <&rpmhpd RPMHPD_CX>;
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.48.1

