Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF268331A76
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 17:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781803295; cv=none; b=HdUx9CQu2vKx/LfQfG84cp969divOUiNSnFfPjdMLN/0xXAHIOtjpHZ+AqyOFeeFrtFEHLtnr4erSyYlgLsRSTkdTSSzlGh/dhxXKB7IqeDYDwuvNnhhX0E3OmbzYdL2K+QI4sl+guy4ChA1hQYwHDhIdyqzinAXRgx/uuOTujc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781803295; c=relaxed/simple;
	bh=YI/Mex0URwAgKluiKtf+SUQ9oQRwcIZMu9IZBJRRJdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IgJm8ZESMaA2c4MIOKiMO02CNi7E4uL/673rYAdlMOq3cilVaLRrmZUayE1QxkCPLwS6MjBDJ+p4jYz+derte3HGohlNzGQvrD9V6eFUQc64mimB0hF3A1a9YW3riMQy0BcaJRjw5Lx5fEsuQTQpBte+UYcA4VWmYjn9eIF6svI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BcAiT0Ss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=khiLVkNg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BcAiT0Ss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="khiLVkNg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IHK6WK2466217
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 17:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sgjqfnwWknIzSecqro1/qEn4Fj2XfAEkQHDgkyYnuEA=; b=BcAiT0Ssy1ECh7Il
	B8J8mEfxQrSOl9tk+XyhEEZn4K+k0nXzEGO8AAWID0HEOCiM0iEJjxjiGOt7BI92
	RDX7mqcF/U7GYw3S9uijXenRFgV9OAKVpM6SucyLCnWK1pP1RyS1xcJ1tgR294Dy
	fL9SEhfNtY/lo+JT8d2mvjfFtmZ6CCm/Sykvf+oHkwA0aZd70IY9hvgQdp53fKZE
	BvGEFDCRPakx5IOxks5z2GOBAr+G6SKpJKWLgymSlYYNlNEdYHJnnNWlgJ7PsST0
	NgvDMC3L9gyn3m+Oa3XKScD+dx5prwwpqfZV7nbD0nIPICeBVksoN7/KpH97yx2j
	XuSXZg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm228asx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 17:21:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3772b6b31b4so695571a91.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781803292; x=1782408092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgjqfnwWknIzSecqro1/qEn4Fj2XfAEkQHDgkyYnuEA=;
        b=khiLVkNgsw6H6SWbmkGxqtl+xqbax4tr+K+pWFOS2WzH2BaRm0X9Wf8bscKoUyETHc
         O6rx/gnyICFyuzV4xfQAXVebrXC2eam2tfVrpCRGGIQujYj9GsVQq/5jddsYu7kWah2l
         EDlgQCo9fxK1I+r9laEVh8oXMB865uUvDXgOc3bo3WOXKPxgYF3dr4BQE5lvpHnbdMFr
         bjqKp/UqssgvARA1Cuw0d6rByJXv7iay0VEr8vpjbcCe2p42LIimb081jzQ28/pwd/ts
         uZnbeD4W6/OR/daBQepCilKPfBoPD4++n9BV0P8GczQxiJctrMereh0imyuauyTbynSf
         yCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781803292; x=1782408092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sgjqfnwWknIzSecqro1/qEn4Fj2XfAEkQHDgkyYnuEA=;
        b=gDO84tPwK58vU3V0wICg6mKANuW6kce6WAkY+q+7OJZGBAjlURUQ5mEO/CIMOJ6w4M
         CnYzl8opkOHP3agc8UJCTbaxOcr7umTP+kt6frS1Fi2E1fNWQpm+L+hV/u+YD/zimDD7
         scLxeo1p2RNsjpKTKHBjakVnLb+DritFG4lwu0lNH6CcbU+r7wtGoU0jFWH8E5xvTLUa
         S2COkjUNQPCpoPkxjQxD4KiybxJGsenwRC7c+kF6DXux8QptDwWVhN2r3EsnrjzzdgH8
         mHqHw7khteRKp7MQXEDmGocNrBayd1XK6YFMfSJneQv+mY9KApKzm7I7pqgUQGPBFw5y
         Vu1g==
X-Forwarded-Encrypted: i=1; AFNElJ+hMMjZ8FUqxmLV7vIRKGizzKLLv4KUvMbJ9PL3j4NGN4iZHOqG5HNTpr6JT4noK82VDkPOWnGdP0Fj@vger.kernel.org
X-Gm-Message-State: AOJu0YzZRKAcHr0ihy/mxPeHIKvv6fzPPa9OxSDK2XgD0EfAEboY6hiH
	9vOq1YAyRCOhEKuoTpFvSH9nkTOSdnz9NEkWSSDSMhta9LiZHWjej/vzYZgysfQz/MsloRsYvhM
	N5B+YApcWLS1iXNDedkxt/hEwZVTM9YkLNzrNuvG5RlJOR/mQv1y19F7g4CbGhvTJ
X-Gm-Gg: AfdE7cmC7aCU7VQNfIPpK8TnJE8ddz4fkyZHelCVIGHr8VdY3mEQEAJ/BciyyoRIZn9
	VUN8FWIoQLHQCPbdzWJWjvj5oWZgZ50USeuzi5uBucamlQYcAQsB9AMEfAN7qiecqC3wdflpNx9
	BJG9/+oWfh+41wj3HYIqJl4dNTn2+m00x6QcGvsYz4keyXCJ8PG6FHpKb1Wj+fow/F8gxW3Dj/Y
	HvjCcZDL+JBxbBK1FqQ0I9XE4fb1uF0nyz6Zyd68XLP7AkWh6qpGV6b5Mu4tw1yHRBfrEY2RvIo
	emxvdtBhM6wTeP+6DTYB58CitoTaI8Abpkz2asB4/vV0jHh02WsJcnSAUGIDcl9tFneYTnqLKhO
	FTRbW7SAT5iYldwZrguQSnV61qPEPYwniAm4=
X-Received: by 2002:a17:90a:f94f:b0:37c:543f:b83 with SMTP id 98e67ed59e1d1-37d15dbec64mr385956a91.4.1781803291774;
        Thu, 18 Jun 2026 10:21:31 -0700 (PDT)
X-Received: by 2002:a17:90a:f94f:b0:37c:543f:b83 with SMTP id 98e67ed59e1d1-37d15dbec64mr385902a91.4.1781803291241;
        Thu, 18 Jun 2026 10:21:31 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df8b8esm187129a91.16.2026.06.18.10.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:21:30 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:51:16 +0530
Subject: [PATCH 1/5] dt-bindings: clock: qcom-rpmhcc: Add RPMH clock
 controller for Maili
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-maili_initial_clock-v1-1-d6ede0352113@oss.qualcomm.com>
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
In-Reply-To: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=YN+vDxGx c=1 sm=1 tr=0 ts=6a34291c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OozyDhJeiyY2DhU_uTUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: nVffYiJx5yB7DmaOT6O9wQZDh430TWBu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfX+00wktwVj2bN
 mBFWTO6v3uOpv1cmM1QYEmGczq15rzI85xv30HXK5PSFBKUs5jHiDZ2D1tsRDWvcuDTSSVJ6QBd
 pD1YM0Niq5yGEAB4SEF4hikTWyw25vM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfX23AZ1MdKwrMx
 C7aFI9NyNwXzVUrxbd1UqV6+6WEuMCkSAeCwGRWWTUKP8woPMoom/r0aW+WikOnFQo5XqkL+FXq
 5+SPMbrjK70p07oMunc5HNdLxdptBPI7SdDNqq9cDdA0t6JZVnFZXcZXBbFE9PJZn/etwjmfP8M
 t7CgruDgzpER905IFCzah/TfIgJismbEW84152r2XjJD76gFy3o6nszB/SllfJkVdlMs2nfxZjQ
 PXKvJaVN3dxtIapsOAHkSjbUJf8XfKxxv+E/BM5+peb9ktTKLBkO2FL/1kt0a5dwdkSKGi/vr7G
 S8alXQNawO3Mf8uQ10Il/nrGgDF15tW0HoNldkhUGDMoIKPVDCIKOxgMNb1LA6aW2UEx0pPzlj5
 WxkTY0jIFNvqDMoB2H4UYlBE0E27rHomO3h0DHswvQTvxZIX5ZuqPBRZATj1H8MPSkeorg2ENhP
 iBvuuxfNbvveOUp/kcA==
X-Proofpoint-ORIG-GUID: nVffYiJx5yB7DmaOT6O9wQZDh430TWBu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180161

Document the RPMH clock controller for the Qualcomm Maili SoC.

Maili SoC is a derivative of the Hawi SoC and the rpmh clock controller
is identical to that of Hawi. Therefore Maili uses the fallback
compatible to reuse the Hawi rpmhcc driver.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     | 65 ++++++++++++----------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b33860429527246484560823074f52a9159d..2b446aca5207c9cc2922635b0539f2d2f926ea0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -16,36 +16,41 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,eliza-rpmh-clk
-      - qcom,glymur-rpmh-clk
-      - qcom,hawi-rpmh-clk
-      - qcom,kaanapali-rpmh-clk
-      - qcom,milos-rpmh-clk
-      - qcom,nord-rpmh-clk
-      - qcom,qcs615-rpmh-clk
-      - qcom,qdu1000-rpmh-clk
-      - qcom,sa8775p-rpmh-clk
-      - qcom,sar2130p-rpmh-clk
-      - qcom,sc7180-rpmh-clk
-      - qcom,sc7280-rpmh-clk
-      - qcom,sc8180x-rpmh-clk
-      - qcom,sc8280xp-rpmh-clk
-      - qcom,sdm670-rpmh-clk
-      - qcom,sdm845-rpmh-clk
-      - qcom,sdx55-rpmh-clk
-      - qcom,sdx65-rpmh-clk
-      - qcom,sdx75-rpmh-clk
-      - qcom,sm4450-rpmh-clk
-      - qcom,sm6350-rpmh-clk
-      - qcom,sm8150-rpmh-clk
-      - qcom,sm8250-rpmh-clk
-      - qcom,sm8350-rpmh-clk
-      - qcom,sm8450-rpmh-clk
-      - qcom,sm8550-rpmh-clk
-      - qcom,sm8650-rpmh-clk
-      - qcom,sm8750-rpmh-clk
-      - qcom,x1e80100-rpmh-clk
+    oneOf:
+      - enum:
+          - qcom,eliza-rpmh-clk
+          - qcom,glymur-rpmh-clk
+          - qcom,hawi-rpmh-clk
+          - qcom,kaanapali-rpmh-clk
+          - qcom,milos-rpmh-clk
+          - qcom,nord-rpmh-clk
+          - qcom,qcs615-rpmh-clk
+          - qcom,qdu1000-rpmh-clk
+          - qcom,sa8775p-rpmh-clk
+          - qcom,sar2130p-rpmh-clk
+          - qcom,sc7180-rpmh-clk
+          - qcom,sc7280-rpmh-clk
+          - qcom,sc8180x-rpmh-clk
+          - qcom,sc8280xp-rpmh-clk
+          - qcom,sdm670-rpmh-clk
+          - qcom,sdm845-rpmh-clk
+          - qcom,sdx55-rpmh-clk
+          - qcom,sdx65-rpmh-clk
+          - qcom,sdx75-rpmh-clk
+          - qcom,sm4450-rpmh-clk
+          - qcom,sm6350-rpmh-clk
+          - qcom,sm8150-rpmh-clk
+          - qcom,sm8250-rpmh-clk
+          - qcom,sm8350-rpmh-clk
+          - qcom,sm8450-rpmh-clk
+          - qcom,sm8550-rpmh-clk
+          - qcom,sm8650-rpmh-clk
+          - qcom,sm8750-rpmh-clk
+          - qcom,x1e80100-rpmh-clk
+      - items:
+          - enum:
+              - qcom,maili-rpmh-clk
+          - const: qcom,hawi-rpmh-clk
 
   clocks:
     maxItems: 1

-- 
2.34.1

