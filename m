Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642E73AFAF9
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781095259; cv=none; b=S4W2nZhURWS1TwQpFZoY7Lx7NyLlJx/EXUUIXEPEWktGmzC/XvNtc68egQ/nqTDpjWdeH2DJLe4Lx6SKIP3d0/fOrEfImYYwR0e8/fkcGw5G2pExiPrd8xDwnzXwMZjUsAIgeYzJphMFMAzLLPrVz+ov5zYXcxRBKeVCT2QrqU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781095259; c=relaxed/simple;
	bh=aPWVfAnpsa1PzlO+27ezh/vSR+IwDjLwuVaE82fElVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nt8KFnKtPS5xL2GDIz9Px0XYNj+sN8o0f/S7g21aOVwAk/UrPvHOwm4P2dRQJriJFKakXMaZN1b1eInkEgIZLR2xfWgjN8AcArnwjv8vxozxteIWWrR4UftjytPz51+lX/zp4wMhPt5X9DHzQ6NKbtirN/x0tqghnFYIRqUu9aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myxuQVSo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hIksXlts; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="myxuQVSo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hIksXlts"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACC5pI1600507
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+VGykQtzN2390G8YWsdFS4aw1NuPSxIeYSe
	zbVc/54w=; b=myxuQVSoFBqe9PqeFUhG4uUZcrOcuWZHt6n0iIXBECzKQIBwXTf
	SuUeVSCJLRvjwJItwfkn1oS2hNJGx+esp/ArJYsgqE7GI4BaNHh3IpCHMuqJ4WZs
	jEBvLxwwLkLqYbYU7YPeC/zWY3KKNyRTyXEGp6OE8B3E6OjDoTjWysiOaMWcbG9w
	sZdn9udtCCHL+WYOq9Ck+yHGrnIIvXu+l2xj5A9ThKssfJr+Xc5Zit5/UNVSxrLN
	27t2unWtKE7kLyyhTJNCz0HMLQ8qfRZtTkD+xklykjekVpcwBe61YbtomxckUfMV
	JoW5XePHfTOfroLTd8wUTc4btNsk4ckogJg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg1kwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:40:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517a00fbac6so16532971cf.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781095257; x=1781700057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+VGykQtzN2390G8YWsdFS4aw1NuPSxIeYSezbVc/54w=;
        b=hIksXlts4muFcUz3sUl2Rw9yW0zCc08e9l+Kcx/qllmEwXw7UqUeCMDZ6dqq3i1doJ
         cC2wGrrHVJ5YxdPFxOz85b/MBpUXGLxlOsBPFI/BWvNkkTcr8LQBqmr9tYx+tRHiWAN8
         rsMyffNAEKya4+S1/crSKpHebQbOIt0JVUyTdh64qKRhWjJPMMyFFPKOW4DgkjXD5U1V
         1T9PS+WTfL51XvOCl3lLwnf2EKvn5tsusGYKEHlY4+v6ijduSLpXAA728XjtDp94Brif
         SzlcMLV4Wq7HesDA9/uiheq8gzosfGC9EUpN3++Ga9kWfwhSyPV4bqbS73lBSDxaoAMD
         N9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781095257; x=1781700057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VGykQtzN2390G8YWsdFS4aw1NuPSxIeYSezbVc/54w=;
        b=OxYJG3w40k5MzTlUunjR1CHOlhIRUaIdBneGUPqQyWBu2U7pN4fGEasU9DZBwSTlw4
         RW4hvHugo114HCXgh8iYcILX9xdxTm4STlPmVkZQ4MXXWb7H1nRx7m5wr2EZuTrhKQAK
         obkhtEx238uq2/LlweiRctm/qxKx29NpSoJ0EOM/iCSdawkvyI5uVpDDpx5diM6Vz53c
         Qp7GFp77Ae7e3kz77VIi9TMUYPwEOOk0L6x6uCDK3ACZ9+zOQQP9TAm7jbzQViyFiSfw
         O/1VlIqWfuluS4XNqfVMKGdPPY5n+7HUuF7dgifgr05JiUakral5So/pL2v7vZii3vKZ
         OuIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gg+krOQpnJp+2QMnXHY4LHWUWdn/r5LBL+1b37k/kETOSxnzBrfQJosqGjXVepUItA2gWqp0Lqxmt@vger.kernel.org
X-Gm-Message-State: AOJu0YyiKXRp3VkcjTpBuTSNsG48afBDQIkrw0GYG/BaBhouJwMtRmVm
	JpYQhVP+wcVZ7IZju5Ha13wRPnWn+dDuquOTD/OBfJDUvEx6xGhRGVvYNKIZYHk0O7aZZVK0IR4
	jIHuUAwfwgNSDurN0QII2JuJhvVMrsWTZzyaETyOZUg/oUn4xLb0K1wm6gk7eiJPM
X-Gm-Gg: Acq92OFVYS0VX9qHpPD8q9rk/WIxtE67e35sv0CyokPYPhLlPueyfp/klxIStf/rK1j
	cdg57smRcTh4rM4mXnccP1kNcJvsLHevxeEAiMeLoUeLZXy7yYwRxGhUmikfWyF7jgE0Skg1bcU
	HeQ+f9EtBEKzUqjofvfZQLtq2b00lQjOEwfoAggOwnf5pnh8E3scMoJCoUCSYfl560L6NBLQ/pE
	M7MmDSzpp/NBQKXDgsuy/UWlrxc3dhdarr4toI2sKpjnFz+T22xcNg7QBQMbEqSv6vmlinpkk5r
	4xJKWbGgvU8CELBAXtuNBhnHlzEhs4PORgO43fLnOW9xcLKtsMvmZnSem66GeJxxU/S1DpLnQ+P
	ythmEQ/CFCoSOUMsukOKwqPyZlprilpCJf/I85z0ZuImWwfBs
X-Received: by 2002:a05:622a:17cc:b0:517:5e32:f3bf with SMTP id d75a77b69052e-51795b9e179mr371949011cf.20.1781095256724;
        Wed, 10 Jun 2026 05:40:56 -0700 (PDT)
X-Received: by 2002:a05:622a:17cc:b0:517:5e32:f3bf with SMTP id d75a77b69052e-51795b9e179mr371948311cf.20.1781095256104;
        Wed, 10 Jun 2026 05:40:56 -0700 (PDT)
Received: from quoll ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc472f13sm27731015e9.0.2026.06.10.05.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:40:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm PMK7750
Date: Wed, 10 Jun 2026 14:40:49 +0200
Message-ID: <20260610124048.253162-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=aPWVfAnpsa1PzlO+27ezh/vSR+IwDjLwuVaE82fElVc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKVtQmvY4RYXSxcYcCWaPp6RJs4PdEHTLYnk0p
 cXz8gUkuUGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCailbUAAKCRDBN2bmhouD
 101FD/9HTHvUOAP3X+3zXSTgPAopPiKuc3qZ5vogOYJiDG7swdGcMLhnB2alvLjVR//aYlPhQ63
 DrtxkinXKX+PQFl3U1TZWcADWIUKw8iNspLELzOv2S0k4KmKsAxyTuDNMdnM4d8Jt5E7pCMrwWm
 0FwckD+sluG+8HnfWsJWttc8LC3lKad34hugxMMaRgMoEICUX+I6qYod8mqEDHgumRdvlGIs0if
 kDohtPnGw30b7mpyx1uQofK340+WQ0I+/OqHFuZg/zg7GCw582/mNzlZCzNDKg7vBW0BMpHJg4W
 dnbvp33YfVHYnQC/Iyzi6bThp6b/vFle+MJ8J2cTn4dh/2NXK16mpt67RHMugCtpUyYkM1UZf3o
 5+8UTA9w+RajpvcYfv0M5EuXWsM9Q7NhMA8biXUl5HFc2yCEFKw9/l9ftoEuqaf6FejeYbCSe8F
 AWqSkl8wydipkWoWy46X/FpzlpE0EOy1uPadSeOTrkgijl7mU63AB8Nj6nf6ic2nONWD7P50nQa
 fEE+knNf2KQPsLPTDXEqL6QVBcELs0tIaxaghvhcv4pSWJZ+ueQvwCEX8ySEy1tagAxizE3CzwO
 5EY8cLvesZINbo3+GcUn63PnJtd+X8fmDBV14ZYj9Br4JayZHkddi/hczy4B7lcf/WQemhA6M3E 2Cbl5qH3p3N0E3w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0cc_B4aIsDkaJr8FshTSU77YvlSDmcIQ
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a295b59 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=jHtBG9Y8VJBRIzbNs_wA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyMSBTYWx0ZWRfX+5tTcQPZVx98
 xjSxxa7NCjkN1RAmNBgyJcmULpdOBtGLC6xvyYlfZIziw8l4RVjCbdinoscfw4ZzSY6OpbcjOQC
 tXoZT5oapljiXFNiv8MDBL+Mw8Rx4O7z+H25hmSETLpIuO5IB5Yj2QX+Crk/vGdwBGvfWqJl6dv
 UUen0TZW3atBDpSsAAdJJ+jwCknFWGY59aJltuME3Cm2Gb18chdnzJkRZgsKQb52jzOcRfxIMzC
 iCKssYDXGWc5O8KNjpqLgIlaVdROIZq76eNKK5LTzP0wgUMTzxNlnmx4t7kynJE2TOULqv1ovac
 YXxFOM081vUD1OstLQOVvj3d4aX87EdIpplwDiPw3x4LQpxNVxiiaNbfA5nNysDOAFfyi/u9Dgx
 BxLwsGcrID7gF3q0vAA7RV9gZk8Qu+EvUfEKtN1MuwoLDggnp86IRbLnGSqtLbNjjcwPUlTywN9
 M866aoK39O5UY+gUMGA==
X-Proofpoint-ORIG-GUID: 0cc_B4aIsDkaJr8FshTSU77YvlSDmcIQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100121

Document Qualcomm PMK7750 used with Eliza SoC.  PMIC is almost the same
as (and compatible with) PMK8550.

Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 386c31e9c52b..cd4593512f81 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -71,6 +71,7 @@ properties:
           - qcom,pmih0108-gpio
           - qcom,pmiv0104-gpio
           - qcom,pmk8350-gpio
+          - qcom,pmk7750-gpio
           - qcom,pmk8550-gpio
           - qcom,pmk8850-gpio
           - qcom,pmm8155au-gpio
@@ -173,6 +174,7 @@ allOf:
               - qcom,pm8018-gpio
               - qcom,pm8019-gpio
               - qcom,pm8550vs-gpio
+              - qcom,pmk7750-gpio
               - qcom,pmk8550-gpio
     then:
       properties:
@@ -501,6 +503,7 @@ $defs:
                  - gpio1-gpio10 for pmi8994
                  - gpio1-gpio18 for pmih0108
                  - gpio1-gpio4 for pmk8350
+                 - gpio1-gpio6 for pmk7750
                  - gpio1-gpio6 for pmk8550
                  - gpio1-gpio8 for pmk8850
                  - gpio1-gpio10 for pmm8155au
-- 
2.53.0

