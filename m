Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66623400DE2
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 06:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780639591; cv=none; b=qla3LJTRlx8FzkaGkmeZIyXuQrrqvBsDjoSKYLe3WP5dJ+UemdZikAyM6HEizPDXgAiCqMbJLIADp4sVX+9bO6JyfAvzfRhw33A2ABUGQXbvddBPfywdL60V4BVdE4oqfG04f8WFysn3TiuPGxAdR9/ZSdF8kd6m93YF2tRFRhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780639591; c=relaxed/simple;
	bh=MHuJ4fKzG83WmGcGTNoZ3KKqRrE2qcs/Zon327BW3+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JlDqNlsscPgXdci4gXCg/kS4E5itQ1ReJjpsSBk2tM9mwPcYUKo+zIqEzxz5eu43kHakvee4r2rkt38onDwGTixzfy2xAL77xT2pvDig3Wu0FqTT/7csTHdo74KPc0nGhiFVPBcXZfE9Vq79NOsPW83OeJ11Aq0YExHGvuJ6g5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7EUSxD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPmML3gH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7EUSxD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPmML3gH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6551LJPS1957400
	for <devicetree@vger.kernel.org>; Fri, 5 Jun 2026 06:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qpmv6sPKR7DMIDOOIMilBz
	T8udCzHjrwL2Hfz/sedlM=; b=L7EUSxD2NN+HUnUqvlKZbw75Gz2bb8OvcgWuxM
	y0Uubhu6WtWWc5TZkZThtyhH1LaHM/Klhp7bg+NFm8cTrWrrJG7/oF4GKhVYQcLn
	nxVKeTnfI/qMSvgq4LFKy19jjMRYk3EopZiMPUGY5FB0rvU7bib2seRN6QtDN456
	+N7EUz5MvRSW58r3iKuDX5WpjRKJKgD3d0JyaJ+hFLwC9p92lzZHxDChq+IJ80Wl
	2nJrpA/1GwANLxMgYV8qr+Bq5YzdPWCWsQ+rNH2KkaFT3wJ/+Z5j5FMqcEUayN4p
	12hpkAeomeL1r7RAekVVFx95zTGagd5alWXQPXt5LByJ8Bvg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekckpu4de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 06:06:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304b8d0ee63so1941312eec.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 23:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780639586; x=1781244386; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qpmv6sPKR7DMIDOOIMilBzT8udCzHjrwL2Hfz/sedlM=;
        b=BPmML3gHEmcBu8cnbcBHjRAGoEyXaMdArH0cKIcs0jWS6SL8cWrQ4q9ny15s0Fi+cj
         udljWhDOi079MPuxdy4hD5e309JGLOJpb/PYqG3a8ZXmErKhl1J1Wf5F+WEgtd+eV3MS
         HmHEPZVWIi475h9oIq09CLgqWeHFGUS3OPZa+gO6qgYfJUJVcXqKPm242p0RBsT4nmXB
         Y1f40CP8qoPRgSkRcW8EKyOkcDct8MR0x26Jx+nML9b9uWf0RaoC0jhuRr3gm0iOpNkk
         jjhsbrIM9er4tSLnG+dlqMwrTsAqb7ABQMx7Fn2G55hGn+8qMH6pnhMsvTsyakngBoFz
         SiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780639586; x=1781244386;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpmv6sPKR7DMIDOOIMilBzT8udCzHjrwL2Hfz/sedlM=;
        b=HIIDYKEnJIX6btYhKAvM/1SJdMGvxwWUGClWNk+1RsqfKulDqyhIme9zqqx55cN8u3
         r+7xFA5y/lH7q692eg7sstX+rsFx9c0zlNj8dtGzt6Qa3X+R2SOGeyNNRt4rQ2d/1ecf
         vgIyVoiQUw1B6c29VyuoNIRJWm5bMdKs5jJOjXwjuQKff323hnvvyvEzLL8nEuiNQOY/
         styFtkNfzViHSNuKpmI65uRM0YKBjRRACgU+zgLATdhj/Q38Tq5V4qGuezFg4hBRo0mw
         p0KXq0fKM0ZDNXcUZVFYovgOIXypLWo73tYJ+dEJv5L53NLMkl8ywpmxjL0mei8IO8Ga
         jDNg==
X-Forwarded-Encrypted: i=1; AFNElJ+APvmvJcTu6cGPJGFiP3Oppf/VQpn2VmAXKM+q4z3sPpGAMwRSB9fuPBJH61v/wrBRwZU1EjVETfEk@vger.kernel.org
X-Gm-Message-State: AOJu0YwtnEbOqI1Oa2E26a9BaEHMh1hPxlfLPdESnVOBezJb1l4UFMnX
	Mi7hY1hbTP8Z95TcDhK0FewBGgsa00KbezSVngwp7YXYWoV75Q8NroBzyHmYv6hqO6WHDDpcJd5
	pAk3fxzrUSZ5yMVOBdlIoaiIhTHgdgeobJMzgKgDXep/CHnZ4quHXAGh7OQzTOSZ/
X-Gm-Gg: Acq92OFn0W61Tj+wrIWjMIVdgWa/0y+VwoXWKcuGpwdN84eBt+kOc4Tvj8pwMHcd+8r
	gcJ3vRckHPytlwM1C8yiDN3/Gyl13e2FW878AdTG+3mZITW+vIxv5r48q+xG4o+mchLWmgN5OaP
	ZZ52C9eu2+RAcKqejoPqidliNeugTv6HMAVy/uslGemNo/IVuiQp7nI/o8QOp5/UBR3JYcZ7JQh
	qRmgChgOxFigR3XVcQYkWLzaBduAmpGTAKqOcok/djQW0/TKYKtbmtjd0GmKyy6wC+W5I+KK+Kd
	yZ0LEsCvbJsz6TRDxI9lD2sGqONvVb/hAG3SpCDwdnJluQ0XN+2ZGPxMMB5H9HySMTHeKnpYLLv
	MC3sZDSUwgrSJK+7kYL68udawA3bRFXPrIYf3cBcDOKBZ0XQrq7YmzWm3KeWAp2zhJ87UWwv91r
	+nruaMnIw=
X-Received: by 2002:a05:693c:2288:b0:304:df8b:71ee with SMTP id 5a478bee46e88-3077af31664mr1005522eec.7.1780639586070;
        Thu, 04 Jun 2026 23:06:26 -0700 (PDT)
X-Received: by 2002:a05:693c:2288:b0:304:df8b:71ee with SMTP id 5a478bee46e88-3077af31664mr1005489eec.7.1780639585486;
        Thu, 04 Jun 2026 23:06:25 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea8e8csm6933488eec.16.2026.06.04.23.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:06:24 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 23:06:16 -0700
Subject: [PATCH v2] dt-bindings: cache: qcom,llcc: Document Maili SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-maili-llcc-v2-1-dd24f05bc197@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFdnImoC/02NzQ6CMBCEX4X0bAld5EdPvofh0C6rbFKodpVoC
 O9u0YuXSb5k5ptFCUUmUcdsUZFmFg5TAthlCgc7XUlzn1hBAXVRF3s9WvasvUfUTVkaSwagalG
 lwS3ShV9f2blL7KyQdtFOOGyKNIetNrA8Qnx/L2ezlX/2Cqp/+2y00dhjA+7QuroxpyCS35/WY
 xjHPIXq1nX9AMVtMwLCAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780639584; l=2871;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=MHuJ4fKzG83WmGcGTNoZ3KKqRrE2qcs/Zon327BW3+8=;
 b=NTG/Zg+WFG7IbGPzAHS67W1p3xcLprPwwoyVUATyFwKuXh2NihStyq2cnAaYxWhHY2pb+onH2
 clcIxSQUScrA5XZKo/c7p9jdUbGO08DJXSksknLaqz3Y9zWFtF1se4R
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: 83c1qMY-zbfpQ9LayXN48V_0P3KMPLhe
X-Proofpoint-ORIG-GUID: 83c1qMY-zbfpQ9LayXN48V_0P3KMPLhe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA1NSBTYWx0ZWRfX/GaihHU9RYUO
 qS7P84FIhHlOhrpXljZtyYvs88oP/R/n1N8Ri9+vzZ9oSmtJo5JSleYhl9Y+HOGHL1lGGGHNXeV
 U2JGeeUGpa2hWmoYRECErep1CWEKoscO8sclwjeF3STWVi5b/JRHkJX93qCtPJMI5vLF/ZomEFf
 akHCfONfoHy6slx2Zg+7rvXo4VAvSVL5JIGZPihsgfXvXU7mDGF5C0M7dlbUPj13c8vntxP/yRb
 MXkpzf3LzWhPG5Y1xzEaKiXdnoZV3IeYCgohvu4jAElUkpO+btOw7if9EUyuFd8Rz+3gBmQ7GGc
 gX5nWuK9zqJwGPsC/XZ+1PA//GgrqFhKmh4e9bMNnVRONzCEgFfsaXdldYaOIij5t6wFDxXFBTC
 auRKD8ah2HPKaMetzJycaKKahCHks76w7chk47c6UiV5r9SLhOK/qWNUeOd28x/iGDAak+U1bpk
 WUk+xwZyMU2OEC+yQ8Q==
X-Authority-Analysis: v=2.4 cv=H9jrBeYi c=1 sm=1 tr=0 ts=6a226763 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cvMXTzhbIQYqWXFn2VAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050055

Add documentation for the Last Level Cache Controller (LLCC) bindings
for Qualcomm Maili SoC which is fully compatible with the one found on
Qualcomm Hawi.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- Update commit msg - Krzysztof
- Link to v1: https://lore.kernel.org/r/20260525-maili-llcc-v1-1-cdc72b98b671@oss.qualcomm.com
---
 .../devicetree/bindings/cache/qcom,llcc.yaml       | 63 ++++++++++++----------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 34e3a2d78592..a1340226a0d0 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -19,35 +19,40 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,eliza-llcc
-      - qcom,glymur-llcc
-      - qcom,hawi-llcc
-      - qcom,ipq5424-llcc
-      - qcom,kaanapali-llcc
-      - qcom,qcs615-llcc
-      - qcom,qcs8300-llcc
-      - qcom,qdu1000-llcc
-      - qcom,sa8775p-llcc
-      - qcom,sar1130p-llcc
-      - qcom,sar2130p-llcc
-      - qcom,sc7180-llcc
-      - qcom,sc7280-llcc
-      - qcom,sc8180x-llcc
-      - qcom,sc8280xp-llcc
-      - qcom,sdm670-llcc
-      - qcom,sdm845-llcc
-      - qcom,shikra-llcc
-      - qcom,sm6350-llcc
-      - qcom,sm7150-llcc
-      - qcom,sm8150-llcc
-      - qcom,sm8250-llcc
-      - qcom,sm8350-llcc
-      - qcom,sm8450-llcc
-      - qcom,sm8550-llcc
-      - qcom,sm8650-llcc
-      - qcom,sm8750-llcc
-      - qcom,x1e80100-llcc
+    oneOf:
+      - enum:
+          - qcom,eliza-llcc
+          - qcom,glymur-llcc
+          - qcom,hawi-llcc
+          - qcom,ipq5424-llcc
+          - qcom,kaanapali-llcc
+          - qcom,qcs615-llcc
+          - qcom,qcs8300-llcc
+          - qcom,qdu1000-llcc
+          - qcom,sa8775p-llcc
+          - qcom,sar1130p-llcc
+          - qcom,sar2130p-llcc
+          - qcom,sc7180-llcc
+          - qcom,sc7280-llcc
+          - qcom,sc8180x-llcc
+          - qcom,sc8280xp-llcc
+          - qcom,sdm670-llcc
+          - qcom,sdm845-llcc
+          - qcom,shikra-llcc
+          - qcom,sm6350-llcc
+          - qcom,sm7150-llcc
+          - qcom,sm8150-llcc
+          - qcom,sm8250-llcc
+          - qcom,sm8350-llcc
+          - qcom,sm8450-llcc
+          - qcom,sm8550-llcc
+          - qcom,sm8650-llcc
+          - qcom,sm8750-llcc
+          - qcom,x1e80100-llcc
+      - items:
+          - enum:
+              - qcom,maili-llcc
+          - const: qcom,hawi-llcc
 
   reg:
     minItems: 1

---
base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
change-id: 20260604-maili-llcc-7331ae12258c

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

