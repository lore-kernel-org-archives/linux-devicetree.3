Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C1632142B
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006583; cv=none; b=VwtPYjpbpUh9hEjCnXFWQXnhM5ir39a0bkdLqgq8+RvdNXyWdVvRdx+lICWvE5na4pyLABMb7pPovg8CRgwAmnQT0TYQXuawRKh2lqGq95CxgdrmAQxSUjses4X1AdNrMkggRSu2eSCC3s96pVwKQ7zHNMD8si2xUJGSeTpZ13I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006583; c=relaxed/simple;
	bh=TwIeX7dWxmVsmvw4YK0bm5xz6TMcOrj4WJjtApbR6H4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8jMwptIw/FzJqbmiy/+5VgH5FaI5F840UjJBlA4T/Mq5iBcMM9T7G2pp+SjBqzJ7IOYLTXMpgoJ0FYrKxSaC4xJ7/P4X4O/XxzxQes20bHiBl+DfQzMsdbB2pvP9HnFv2eusWzLhEPDM3ohSo7OuUjiTCL8HerDDrll/tOi6co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKH/9fon; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTGcA01h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKH/9fon";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTGcA01h"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38QGF3303167
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ze57ivEQaVhQmk2GKsdaZS8G8SlBGCxdyc/OInFHA+k=; b=KKH/9fonkBNOVpR1
	rVxgofexQH9l47h7TFO31yeECJe7CMzRyK1uLHjyFsJfcEmv+Cp26pbH/gavqEQS
	67ldic5ysX4YDKZEdhkQBSI53kjdvVf6dyHyeeEF9e6RkoVqFxvv8HYpiPC8QfA0
	K7tbTRl7T6TxkrCoG6nChRoLWZM+dQ2CI3zZ8Ze/vUffDQ7cPEAZQ+wCsg8HRsB0
	88iZQ+hCgl45a5WDa3v5zZjsvjDb9bm4wszCHDUeMLkk4vMzIueN9+DLySpqh/dP
	UvMu6+x6YAOaxIkcUULZhfRGKFGSONnEf7TRCfwoNEnVoiPq8mVwtjxVdD+ad0C3
	uTGdCg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p21nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:23:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c856470fe9fso550915a12.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784006581; x=1784611381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ze57ivEQaVhQmk2GKsdaZS8G8SlBGCxdyc/OInFHA+k=;
        b=PTGcA01hXiHuKtntGxGSWVIXdR8iriuyiRzZTMEkMidTrmgwyhfVzo92QHqKeToUfC
         3RiPJktnMTeSPYm5uK9unU1cXVLVKm8N3rxuv+8NSza5PSscEr6JjkemF2vnLCROr8m3
         6xF4eC4/dlulkYNoT8IgM2mejvWjKfhF6ZWMP8FW7X46diKDLP3yu0kZ79RgZnt5wYs4
         YzT+qcwO0ALiJAZJlRaeSUNkGxCQMjf/8gQJ4GuQWorixNsyUBtLHyWOoJqMbXk84LNZ
         csoIuSAqjOTLVM7KQSCYIiF50mw9EcCOmjYnuj2WmERimKR/JHDhAx0caBw+Tn6sxxp9
         IC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784006581; x=1784611381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ze57ivEQaVhQmk2GKsdaZS8G8SlBGCxdyc/OInFHA+k=;
        b=cvxsak4jOK+dpPUWXR7OlSSYyMNuorZBqvYPS7MgBupQmQOkEMJ2bB3oCQovIQed7i
         oRoPyE1AEM8a+qFodFzY82PMp6T6jFjqjDV+yNdaqY0fI2mh3z6X7w7ZMyizyrLQecwh
         LhZvQ4N2YBcYUlKhLCtM+OfMvx5RNWzf3C29fnuxEiMYk9gY8u0SPILrFbPtiI1xJ6eV
         Pjcvuaf+g/FOMiJocYztUTIVEQ2BVOt31+S9spvHBX1HWqKSzc/jouHniudDdarbYlFq
         +zQldmY3pyZIhmGREOkbyq+yKgesGqM5Jd5Ow6eSqGSR9wwXeelEojLut+oWtjnlnG+q
         tsQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqd6C4+pAzE8Sv9TjjoRO5oSez1/dKwRvI0VSy5sShO8WQxn/1EPo1ddL6p7VFpRP29M5AfVafLmaKo@vger.kernel.org
X-Gm-Message-State: AOJu0YyA34EnSBYFVWWhLfkhDkdQjQ9Twb+blxQWBOjTDfEURcgrma1R
	EDKarEkvVfAze1SP2jqWglUggmNj76ynXrDNFp2ArADRPB+LyDROsiMK1KNQuC7d9HG/ZM9QK5D
	4LkTMk5/i+q3m/FGyCj8CkWZRB2IBAsunTguGDHr2H8Qq9QjzCkUTe24t0BEW+BAK
X-Gm-Gg: AfdE7cn/Y4M0roR8UfuE61iaTjbH0nCOB6lcDQXG6ca/238wTD532yCeaAy75gv+PfQ
	LULOy8fNbZHDPed+RHXdbYuGSDgGxVWeK7mwI5FJuE0Y3JRl9xO6zNSgwfyZZhiNxLV/PUjjP8W
	Tzc7t2HXVmy9+2Mr5z89V3Xp3XQq5AsbIL0vkTy+mT5yWCIG1FQRVCjJJS3qy29r+bDSDqyHKsL
	FTwlFN5OmQA2G4V6UVm54mhs9yd3MVFQ/PO8pU+Kp7eYuTK1TkVYLidRZKdb0hzUOOTD58NyZor
	Po0b35lQt89Q1ImYnLrNmW9p9Xpg8Rhj7I7SiLDR3xIbtjQ3OmxLgf/EywPoK1/qg2uYjZmx7kd
	2d07KmR7CrY06akPsfKjYI2SfkUbcAYaRWUbD0pdQHAqBt0LZ7cME4mb9tiGdcXM=
X-Received: by 2002:a17:90b:224a:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38dc782c68emr10333558a91.7.1784006581018;
        Mon, 13 Jul 2026 22:23:01 -0700 (PDT)
X-Received: by 2002:a17:90b:224a:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38dc782c68emr10333515a91.7.1784006580441;
        Mon, 13 Jul 2026 22:23:00 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm78609864eec.30.2026.07.13.22.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:22:59 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 22:22:55 -0700
Subject: [PATCH v3 2/3] dt-bindings: mfd: qcom,spmi-pmic: Document haptics
 device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-spmi-haptics-v3-2-c931bb7cb94f@oss.qualcomm.com>
References: <20260713-qcom-spmi-haptics-v3-0-c931bb7cb94f@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-spmi-haptics-v3-0-c931bb7cb94f@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784006577; l=891;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=TwIeX7dWxmVsmvw4YK0bm5xz6TMcOrj4WJjtApbR6H4=;
 b=VT59IsmSkwi/GREk6YS6SX2prtA69LcG7Wi16Kl5Nz/EXdWB0alyF11HCyrNxaJ2xAxBj0e3c
 WBvKb6enjz4DUycA1Uw5oKGokzg62MzZFziM5BXM6YGasVjT+JA6JhS
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1MyBTYWx0ZWRfXxHxpXDfpSSc9
 KprTM+K2xkN2cEWbXj8BjkUBdNpsEbItGotK9y21dDu6r/3qOYtj6I/3dOpoUJTH4P0/u4Nf7XA
 NISDnI5xcgrr6Iw+0+5/B4Cqr7IQkPo=
X-Proofpoint-GUID: ozfSiDxFDcqfIINsba0eZasdIiKUVXmG
X-Proofpoint-ORIG-GUID: ozfSiDxFDcqfIINsba0eZasdIiKUVXmG
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55c7b5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=aKV5VrVIVVfq6qmweGsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1MyBTYWx0ZWRfX8Aou+Kmbz70G
 n4k8pq9brrKA2OsPPqtISsTIp+ueLHiPFG/8NF4v9x9Ubt55gifTJChKHVJov8ELc+fQL3pVmZh
 elxPpbiMtnQVRoULLgjOxF9g/Sgs6j2+fWxdR/rRJCmVFc0lPiuAXKibl/nFpcm7vHkJSlkCkqx
 59emSmh8i6qDpPZE/9jgwmKndh8g6tjthWYZJZQ+8YQB7l6j6mhhhznDqw03y3wOX0g90aQVfHw
 SClsZU9JREllGwprgWo5kLgkjauZknlZSEAPjTEjea49xjg2XmpBGzQGUUHtDLF23Hq+HZnRYek
 Zhu43veez4iAl4BWrJLmLdiAJnwEVhI2weXS67SOXWF3wdpiwFOk2D26eznDvtZVm9D9zzr+VpB
 1EjC+uZIHnk5j4cWT5EuumUcFRoHs5uPhvYCfkHKME4cITLQT7HIfiV7pjk7qpJTW3UivD7CSw3
 Ggfd13zV4tfhVsXr9dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140053

Some of the Qualcomm SPMI PMIC has haptics device in it, add it in the
device list.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 644c42b5e2e5..773f4cba5935 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -165,6 +165,10 @@ patternProperties:
     type: object
     $ref: /schemas/pinctrl/qcom,pmic-gpio.yaml#
 
+  "^haptics@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/input/qcom,spmi-haptics.yaml#
+
   "^led-controller@[0-9a-f]+$":
     type: object
     $ref: /schemas/leds/qcom,spmi-flash-led.yaml#

-- 
2.43.0

