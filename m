Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6E63DB334
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176039; cv=none; b=NxmRxfxOxGAM6Ao1Rx1gEnKyco5wHlIZuCUX/cYaunr0O/lFaJ+wklGAMINhXdI//yM3thwXzwtBMBFTVPB/TbGWO+8Hdij4gud8CI5zDY9CZTD3mF1lM+R3MMRwvq9nIwWzA1tDtcxH20TK/OwJ0GNv8NOwzVL3xlLrlfO6hFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176039; c=relaxed/simple;
	bh=ARLjwJgApzTkrcroRk9dcgpN0egJBD6E5kLjVaxLPFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=obs5l7mnq7DXegB/xiInB/AGfSP6LxAgZU3kynlo4dEu8ll8EmWQcOk/3abWV2XQVFuNia4YINQkd41ZKtwxHWZdrFkidzkNR43CRxAZmYH1UyGsP6DAkfDk++PCre2uaoJf+f40N2lAlZBKuWoZdXdNdBaiseRgJWxKSfPYKEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2cMN7hK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y/KtdwfL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2cMN7hK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y/KtdwfL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA1VrD168321
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kQTGZ1s5mAqlsYyB5U6ZEWJC+uc5J6VJYtO
	Jm8qQBWY=; b=X2cMN7hKRwmRhqDwelHBzcz7f3obeK9U2YilPd6PSg8LYLGdMMU
	hYOKaNzsmGRBG4eNaYVCI1H4MLgck13/En/NdZVmzrS4XJnmfhtzgi9AcU18JorT
	orDXcTYJJdf5kO28Zb4N//4ulySWYqcvlksJ4C7eDAbz4urNUkTQk1xH5fwzv4m9
	WrqIyvewTTTCnb1uA5sKErixboJaqtBkqeNvJKvHBkGQlU649KCjuARXsNHkttSY
	0dlTAaaO+WL2Rd0MviKcHVAtQsuyL/W0RRy6pd01aaZlv9Hc1cOvIxkj6VNfnRfp
	7pOPxk/dbs2ZKgTIgL5gQbS/+h+m488GYog==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6ub2u1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:07:16 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963b744b61cso7011591241.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781176036; x=1781780836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kQTGZ1s5mAqlsYyB5U6ZEWJC+uc5J6VJYtOJm8qQBWY=;
        b=Y/KtdwfLE5X0rsgo3EvWHDJ4iM3T1z5KxrIfU42smkitAjfM5IV3nu8dHzWCioNGkR
         Xkks4iqZfZg1x0QqAGdeBjBUtxZkBxb/MPoarmaWcqFysG3nx/Cb5RL1jUdK5lN6mplN
         vg7rIWirKshIM+Fz6yZdJeDNrAeIzBsXLI84kbGQbmfaMj8o9KaSZh+SgsctChldOXDz
         7voR8rPL5uyESjJ6OFphuU7vWMvlVillc/955o0P4BxD3ny225OTEuPlw5WaCDC9nHGp
         s0k820HYdYAb3gELRWlRjKm9MsS543cV7A3AmXq0WVhrHb0JOfniFk4mcV/0hPsCxIQE
         L6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176036; x=1781780836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQTGZ1s5mAqlsYyB5U6ZEWJC+uc5J6VJYtOJm8qQBWY=;
        b=Gqm4lvGTKttZIa4IaSGTWRGDrC2gNRfuIOHQrQT0ZYqfrEkOVTSwhPThFnfZw2DlSL
         2vg9c13Yzdh5zBndDdMuSTePMuSNQRRJlAHMEkZC2mKdHBw83Vh9JnMs9XJjFqkVFDtY
         31qVLFEmyd4NEhv9XF8XXpzzh0cQYwAC3MBSsRRBGdESG09/sW+K4OSWaHTgDCisPIUv
         4/CQ13fdg94GBelKtWUOrfGdzXIQ7OIudbR/ROiQQHZ3kSoqGQ8h1vEE7NenH5BAEu7z
         UkOd+AG1lo/m2BOZlCUJhQ5Vjv+NhbSiyEJWF/XRJusGFtfobfMig2+WvkjuqsoWyaki
         45YQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ql9Ao5XDD4q84AwyON5EhtQSePrQ3E4SRqBQlGQHbteLR8uCi9zO02rEo/oDrYAGbIDBhvPszzlDV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr+AvdohCTFBa+4xho87Ky7QGckKE3t7Nn2i5F9k3929mV+Bf8
	io5y9rIRLNSPdqo7ye7w4NBcGa85zDRDA39WmVEHICff6aIeWLhn+jjzpe9lEKbDW8lNHeSDE5x
	q8LiodGdU4rLaUJGXylcAU91I4ERAtdzaOiLmwSOnvLuJml6FJUBNbnPTWkhRv89J
X-Gm-Gg: Acq92OFC+/7C47vJNY5Oh7aENGKIjQNMfpJ0IloQ0GHBRcE5FqC2r+EYiqsqNbHQMit
	LVC85ijDvBf/Z4UPNqmBfyGMKHziWf4+307q+zh5+3LV8UlSs8VW2C8bNhimQr8bGN4I+baM/zE
	WqrGW/iNB1dG16034IvtePfiHfkTt5JfCfOXwb5/XeX/voPX/iaSYiutvcMe8FL8TgRdAEJVXEv
	rIISkNYrlVCNZRa/NqWDcDoKFOKsAiPNe++WscI4ZcgnKqAqNlE+clZP0BRRqej4DnWNSOpxE5M
	7GKO5EhYFZY9T+LmWScXDgMGdx2nO/U2RtoXro+yMpy0HZoYobOXYC0Fr8aZhgvW6ZGgu3OvBoX
	A0xetF0++0Ywsf5vUAl3o9DeGBuzbOyZjTZCKBV2gmQw0dryb
X-Received: by 2002:a05:6102:5112:b0:633:d7ec:153e with SMTP id ada2fe7eead31-71d5c2715bdmr783698137.28.1781176036250;
        Thu, 11 Jun 2026 04:07:16 -0700 (PDT)
X-Received: by 2002:a05:6102:5112:b0:633:d7ec:153e with SMTP id ada2fe7eead31-71d5c2715bdmr783680137.28.1781176035827;
        Thu, 11 Jun 2026 04:07:15 -0700 (PDT)
Received: from quoll ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda363bsm67981125f8f.31.2026.06.11.04.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:07:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm PMK7750
Date: Thu, 11 Jun 2026 13:07:09 +0200
Message-ID: <20260611110708.69234-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5784; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ARLjwJgApzTkrcroRk9dcgpN0egJBD6E5kLjVaxLPFU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKpbcnA0AqFJx+QLyAHylek/lzi9io8jYEiwvU
 VMGTe5hktCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaiqW3AAKCRDBN2bmhouD
 1+CiD/0Zq/HQVz4zuW7AtYLiN81z5omYFZDAeoiLHkdE4b6WqcpxHw9zbA8pkVqlYczNpYf7UyC
 YU+kuca6mCN6T5qT7nt2D6BCu0AhkNieX7jGfTa3kCO4AWPacSBeUNKQLcbRdyAaeLTmc+Km4Qt
 gvyUhTb3dEeO6HU1N1evcQPg1EVA730NMefr6jyhOsFatHU3VreoZ3ZNXeLvLZZIDBL0KWV4lHZ
 shpF2G0wW6eggcw10a+i982RdQJ+IO8MI8RaEd1/XPv7opLfXy7odx7JfHEehSX6dwVpkrsUeO2
 wnRXB8oTlq/sNh0CLRSIXjWRm6OkeFe6cnBPnj5YPo22nNouWSUepyi/KeNantH55LD9oxsbXXH
 ky2aTKBgCraOg6MHLKXCCASyd+r/z3gDWjg2eswL3E2kTzUGbRzlkPqVYsf3TlufhnhpKo9RocU
 H6ts84xJqmGlkyb8Wf7s1REJysBd1/FZYifE2vjmKY+zpE1nGcsX60cEg6jih/r/Mxud/FNgHu2
 PjAn3IO6Qn89CHDSU7vH5nwLqqJcpK5JD1nsKczJNJ6t84U6qobSumfykdkEAoo8NR05AyqQPPp
 dIP81/ouAEnEsPxCJ45pQ+rwfsmo9MxoBYkTcwFRXqnTRBHha4mhinqN7jZwLGk2WGzKS0PxlkH 2d07uEVSq7l6c9g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMSBTYWx0ZWRfX46fUVDZLzbmA
 BsUNX5s0s2ASFzTS7xXDCVTfUcCs4sRCYH2uDuNR333K6CpkARK6W90ADqqWO+Y+uU3MZ5Oy4bd
 5a1xt140wApGcXpqoPS2BW5sLZL0cdo=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a96e4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Bpo9OX9RG45pMRazLfIA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMSBTYWx0ZWRfXz7DXVm/WMs3i
 9pBY5DhN2bQ+h4AIh7orGEuntNXM7NaB7dV6rXICOWHlE3nMCW5hcPI1p7WG+Tro6j0PsK7yg0k
 wLCl8bY28kpnJ+0rsHwGV0xBinFrYEJTbjf+/N0CJ/F4dZqr1KXiQK6yHh4U29GcynXUDfk5ebr
 1cw2+lA2hKopqEhkG9I+Z8qFds5rIZZ/rLRu3uLr9KA8QyLgxyOWSmeilbjVkWuQ2ofGz6t6R4E
 gCb6g3OfXWHkBWrLG2MQSv9sN5vbS3nR5hCNMy4YVyDgjIr/ODFa3Rgmemn8vLVM7oTRaUqhYac
 1da6VCOxh924LOkgs3FmYQ3VvVzAMGMow1ydgpM0WK4X50Dv8oFmzWCXQEEk7zi3Jd+qpXeBR84
 TjHiXkrGltrjt/BCngIi7rIuZAr/tLUIaWp2SWkXYPzOyqBJFnYmyk2Jhizh18B33sPnoSx0KKl
 R4pGWlC6Rn1H+2JKztQ==
X-Proofpoint-GUID: qCv6Q1LVMiGDJbAUn2amHVYN0qua4akP
X-Proofpoint-ORIG-GUID: qCv6Q1LVMiGDJbAUn2amHVYN0qua4akP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110111

Document Qualcomm PMK7750 GPIO used with Eliza SoC.  PMIC is almost the
same as PMK8550, thus compatible with it.

Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add fallback compatible.
---
 .../bindings/pinctrl/qcom,pmic-gpio.yaml      | 152 +++++++++---------
 1 file changed, 79 insertions(+), 73 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 386c31e9c52b..f656c836896f 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -15,79 +15,85 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,pm2250-gpio
-          - qcom,pm660-gpio
-          - qcom,pm660l-gpio
-          - qcom,pm6125-gpio
-          - qcom,pm6150-gpio
-          - qcom,pm6150l-gpio
-          - qcom,pm6350-gpio
-          - qcom,pm6450-gpio
-          - qcom,pm7250b-gpio
-          - qcom,pm7325-gpio
-          - qcom,pm7550-gpio
-          - qcom,pm7550ba-gpio
-          - qcom,pm8005-gpio
-          - qcom,pm8018-gpio
-          - qcom,pm8019-gpio
-          - qcom,pm8038-gpio
-          - qcom,pm8058-gpio
-          - qcom,pm8150-gpio
-          - qcom,pm8150b-gpio
-          - qcom,pm8150l-gpio
-          - qcom,pm8226-gpio
-          - qcom,pm8350-gpio
-          - qcom,pm8350b-gpio
-          - qcom,pm8350c-gpio
-          - qcom,pm8450-gpio
-          - qcom,pm8550-gpio
-          - qcom,pm8550b-gpio
-          - qcom,pm8550ve-gpio
-          - qcom,pm8550vs-gpio
-          - qcom,pm8916-gpio
-          - qcom,pm8917-gpio
-          - qcom,pm8921-gpio
-          - qcom,pm8937-gpio
-          - qcom,pm8941-gpio
-          - qcom,pm8950-gpio
-          - qcom,pm8953-gpio
-          - qcom,pm8994-gpio
-          - qcom,pm8998-gpio
-          - qcom,pma8084-gpio
-          - qcom,pmc8180-gpio
-          - qcom,pmc8180c-gpio
-          - qcom,pmc8380-gpio
-          - qcom,pmcx0102-gpio
-          - qcom,pmd8028-gpio
-          - qcom,pmh0101-gpio
-          - qcom,pmh0104-gpio
-          - qcom,pmh0110-gpio
-          - qcom,pmi632-gpio
-          - qcom,pmi8950-gpio
-          - qcom,pmi8994-gpio
-          - qcom,pmi8998-gpio
-          - qcom,pmih0108-gpio
-          - qcom,pmiv0104-gpio
-          - qcom,pmk8350-gpio
-          - qcom,pmk8550-gpio
-          - qcom,pmk8850-gpio
-          - qcom,pmm8155au-gpio
-          - qcom,pmm8654au-gpio
-          - qcom,pmp8074-gpio
-          - qcom,pmr735a-gpio
-          - qcom,pmr735b-gpio
-          - qcom,pmr735d-gpio
-          - qcom,pms405-gpio
-          - qcom,pmx55-gpio
-          - qcom,pmx65-gpio
-          - qcom,pmx75-gpio
-          - qcom,pmxr2230-gpio
-
-      - enum:
-          - qcom,spmi-gpio
-          - qcom,ssbi-gpio
+    oneOf:
+      - items:
+          - enum:
+              - qcom,pm2250-gpio
+              - qcom,pm660-gpio
+              - qcom,pm660l-gpio
+              - qcom,pm6125-gpio
+              - qcom,pm6150-gpio
+              - qcom,pm6150l-gpio
+              - qcom,pm6350-gpio
+              - qcom,pm6450-gpio
+              - qcom,pm7250b-gpio
+              - qcom,pm7325-gpio
+              - qcom,pm7550-gpio
+              - qcom,pm7550ba-gpio
+              - qcom,pm8005-gpio
+              - qcom,pm8018-gpio
+              - qcom,pm8019-gpio
+              - qcom,pm8038-gpio
+              - qcom,pm8058-gpio
+              - qcom,pm8150-gpio
+              - qcom,pm8150b-gpio
+              - qcom,pm8150l-gpio
+              - qcom,pm8226-gpio
+              - qcom,pm8350-gpio
+              - qcom,pm8350b-gpio
+              - qcom,pm8350c-gpio
+              - qcom,pm8450-gpio
+              - qcom,pm8550-gpio
+              - qcom,pm8550b-gpio
+              - qcom,pm8550ve-gpio
+              - qcom,pm8550vs-gpio
+              - qcom,pm8916-gpio
+              - qcom,pm8917-gpio
+              - qcom,pm8921-gpio
+              - qcom,pm8937-gpio
+              - qcom,pm8941-gpio
+              - qcom,pm8950-gpio
+              - qcom,pm8953-gpio
+              - qcom,pm8994-gpio
+              - qcom,pm8998-gpio
+              - qcom,pma8084-gpio
+              - qcom,pmc8180-gpio
+              - qcom,pmc8180c-gpio
+              - qcom,pmc8380-gpio
+              - qcom,pmcx0102-gpio
+              - qcom,pmd8028-gpio
+              - qcom,pmh0101-gpio
+              - qcom,pmh0104-gpio
+              - qcom,pmh0110-gpio
+              - qcom,pmi632-gpio
+              - qcom,pmi8950-gpio
+              - qcom,pmi8994-gpio
+              - qcom,pmi8998-gpio
+              - qcom,pmih0108-gpio
+              - qcom,pmiv0104-gpio
+              - qcom,pmk8350-gpio
+              - qcom,pmk7750-gpio
+              - qcom,pmk8550-gpio
+              - qcom,pmk8850-gpio
+              - qcom,pmm8155au-gpio
+              - qcom,pmm8654au-gpio
+              - qcom,pmp8074-gpio
+              - qcom,pmr735a-gpio
+              - qcom,pmr735b-gpio
+              - qcom,pmr735d-gpio
+              - qcom,pms405-gpio
+              - qcom,pmx55-gpio
+              - qcom,pmx65-gpio
+              - qcom,pmx75-gpio
+              - qcom,pmxr2230-gpio
+          - enum:
+              - qcom,spmi-gpio
+              - qcom,ssbi-gpio
+      - items:
+          - enum:
+              - qcom,pmk7750-gpio
+          - const: qcom,pmk8550-gpio
+          - const: qcom,spmi-gpio
 
   reg:
     maxItems: 1
-- 
2.53.0

