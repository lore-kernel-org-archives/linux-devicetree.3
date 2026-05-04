Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACB43DA7D1
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906641; cv=none; b=utdGMVEDV5YprrgEk+j5qy+uzIUZ38mCoiT1gMKSgxdwfBMna6/SHk2U3zIR2vo7BEq7w5ti9vjKN3Ju7Fa9Bxtf78Kfa0IEna0MkEPcI5KP/0XjOPyHXQ+qrMeDh6/AkHLiNwMiErOU02R3gKhAgSgjC7cJysnJX9YgVBLcUVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906641; c=relaxed/simple;
	bh=t8CHaF375ZqJzhYzOnhS2X05bGUB34JV6zSqsa5XjfU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b9oNq3TOJ62Qp4x0wUQ0Q2uoYUimd1QrQs8c5i+ZPfG0C8tCnJHLK2We+fjE1g/4yYNY0eCA1R24XgMpZECs5nPlfBLaNupApWtnS4WgidTd2q5ZGWeafOQyLb/ggWuQ/yupEUVaI7mIZapTZDpoRtyEv6d/lC3KW5hbleI75mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEMKsAgw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GlXdY5w5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEMKsAgw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GlXdY5w5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B46qb636001
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 14:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9Ea0e9ZD9RnZuTqbEH/FSIarRYUkOP881sI
	vSBU+P4c=; b=IEMKsAgwL0AAG1YUYvdvbpSd/gbQPLRgbqupujlQYVpAR20q/ec
	YkXRzbCtilf5koEZIOm7Q2nLEsLuil7JSoGwZ0MkuPicGAq1ZazS84blLNAw9llG
	u+0XIN3PfjCxEYw3ih8D05WRTzsd6MvZt/MUegvNVS9RyDTlgSCuW020AZvXfnd/
	WT83q4EivwcGknwC0OdUNMrqUejX3vSiQIT0pz6JakpB3nFI8rO3+hghp4d1uywj
	0VIOjmQU1g3C/PzZHpEfAZT+X6N9jKgcDVOqdWE8PYX2/YkiKHdfYAjdtNpJ2TMN
	bYk9LAFYKKURM3sNRW3TCIUuISIyhALQ7VQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsx48sw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 14:57:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2e6ee9444so37465715ad.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 07:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777906638; x=1778511438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ea0e9ZD9RnZuTqbEH/FSIarRYUkOP881sIvSBU+P4c=;
        b=GlXdY5w5yRgq2JaMNghV610rqcFCMubzG03z/y7aRkCYLWBmIJpcytTaLRdwEfB1yr
         uxjPNXp5z/D+tHW1mMmyIzuJhX85MHAVsUIDR/YjLAzWflFRi317aCBigGxgvPuoPB4X
         tJS6MMEQJHDyu6ADIOyZ8PQ/3ure0aWCpXDxSW/vBFaS0NE3A/E69QyoAEvYNbuS8qRZ
         lOsx0ZQciaWRqeAaF03ckWlAbsMI4Y7YvFLExlvDLXj/Ww/xhYIPc4GP8GR5AKnYJIAT
         g+lk1tXpo9OL9GESOK+zdYOqvon3F59VNSTAxhIcBX0SWvjllirEIRQMfNKykum2Svkq
         QfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906638; x=1778511438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ea0e9ZD9RnZuTqbEH/FSIarRYUkOP881sIvSBU+P4c=;
        b=RgTwSWhCNVR+mbf+tqIBr8UpD3KMRt1LANn4iAhjmVaEUTrDeUny8vflau1ZouGxTx
         RB1sJLaavgPoT0Uq+qe5IKrvzqburmZe0ODip0x11TCntovXp5s991JgujNrw80BXnW1
         Df7mXijzj2dbyEaCKBmtyve+UIbMavJM7Z3pyQVW5KyEBdloZ/CclO1lXsrGdA1/TfZN
         l+fIyuFy9zWQreJsIl/yzYtLg0iwT6dbbA6nym0mJUIpvAmK+S5OhN3hdSnwrS1vgOj+
         7jbpLdFx0t2bn+e2w48tW8nGiNU8UezsNtjorW7pWLsteRiksleif9b/TKwG025mXBf/
         XKDw==
X-Forwarded-Encrypted: i=1; AFNElJ+X6ec5xjsqyMc9a/LuViPQQ4/bs3B2CmNYVClXwU6vFVB6u/atRWiMf+gQTNuEGWKgU9eUP0nvVHFH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7EvRXbHaV9H6heqavup8uwFzW/qzeQcBYIEwu/5fMiCo6uGAf
	0DwPKwy4ucUbcWlBBnrS9BtcAuK8DQ1ggEuyyR+pOGAIBQnvC0nS0G0aEU4sexH6k2PENWAAX7O
	7r/MomTPRXeTvELVhC7l2BEbyshlxN5VGXf/i5vMeeDFX132zqxl4Niv9ZWpsCAof
X-Gm-Gg: AeBDieueU96+/ZtXFg9QEcEEQTx2nzRuz3Bz4IVr1dFz3nvLu6levcaIEBg9B9RyujJ
	5awky8lKwKukYt6gBBz1PwNR9WcOri7OoaodVGiDNFwURwOLzj9MRBXmiq9MZ7UFq6JE4chiRRP
	6mO94EuO9Ee2Ouq6mV8BmrbF14MdZrdyUQHrZfc/JM16CxW5iKmMSbD6Vv71iGA60ydNNuq9iyR
	woYX1UeYQ2gKpSjVn6CvMJPn3BXDvlmeVjcSvG9XmT2L37fiFxRSQjEprqQdkUG+Y9sZ7rtkMHD
	bQm1BN9eRMLVwQ0ugizGmNzLSE3rGQZ4+cy8WoEsHT4VxDfRVTBuFyJ6B1PT0E87JdLk32C3Aq3
	aZmybKrnN3cidhBpejcGEgmPWgdGt11E1FAVsj0Ig4zADxr/hzQE0U6eRjcJOdGR7+nm7xxhKaf
	BvvqN7OYk/bceJU2Vg0BeQSYX+TQ==
X-Received: by 2002:a17:902:9683:b0:2b9:cabe:ce37 with SMTP id d9443c01a7336-2b9cabecf0emr73830005ad.1.1777906638275;
        Mon, 04 May 2026 07:57:18 -0700 (PDT)
X-Received: by 2002:a17:902:9683:b0:2b9:cabe:ce37 with SMTP id d9443c01a7336-2b9cabecf0emr73829755ad.1.1777906637711;
        Mon, 04 May 2026 07:57:17 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae11fc3sm128863145ad.47.2026.05.04.07.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:57:17 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Add Shikra compatible
Date: Mon,  4 May 2026 20:27:10 +0530
Message-Id: <20260504145710.257211-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfXwIcS6cWcje06
 RiOuLpq1EKbEy3tdSUWEnfyDQY416XEvSO2FYbkMBkUTgoTGDnOQjxpMK1WEYTUBq3+C+gwTsRk
 JpKHlCV3v08hx6igZL7qy03R5IjXcLlH4oqNPUweg9JjDF9xE2KB2E4ciPyKW6Dp0wm6hvWvR9N
 hKvHpDi2NNPYdPiy3yZhnm8Xjh/AzCztJ8iF3dhtc96JDMMCpvjE+YqDcYziVVnpIypXgWG8Jmd
 ZVtlTRdAL+Ab4VP33iuJ954kDhpy7U2fn+3wm/lBAQonS+A+84R/CFdgB98HAnWo1snP9d3xfr4
 psZM8QcI2DSB4T/xdwdXzfgMv+GYZR9rcU3/XNkvyJQi6ElOKub4euSH3/V2ml3/6DibAomFH/W
 s9ogXEWT4XGPKhxCZ+wmob74wHlobZYa86Dcl8WDcZ+44KjyiVfVbTVsCa+sxGMFtHOXHGzKfMo
 l9CtorK5IgVW/Fq5ORg==
X-Proofpoint-ORIG-GUID: vtEF-vs56FaQXHN0I8iuqRkENvpuwkmk
X-Proofpoint-GUID: vtEF-vs56FaQXHN0I8iuqRkENvpuwkmk
X-Authority-Analysis: v=2.4 cv=LdIMLDfi c=1 sm=1 tr=0 ts=69f8b3cf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mkQ1ARZptfdP9UuQ85IA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040151

Introduce the compatible definition for Shikra QCOM SNPS DWC3. Shikra SoC
has two usb controllers and the secondary controller is high-speed only
capable.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Link to v1:
https://lore.kernel.org/all/20260430-shikra-usb-v1-1-c9c108536fdc@oss.qualcomm.com/

Changes in v2:
- Updated commit text.
- Separated this patch out from phy patches.

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..68d0491dc653 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -60,6 +60,7 @@ properties:
           - qcom,sdx55-dwc3
           - qcom,sdx65-dwc3
           - qcom,sdx75-dwc3
+          - qcom,shikra-dwc3
           - qcom,sm4250-dwc3
           - qcom,sm6115-dwc3
           - qcom,sm6125-dwc3
@@ -386,6 +387,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,shikra-dwc3
               - qcom,sm8350-dwc3
     then:
       properties:
@@ -456,6 +458,7 @@ allOf:
               - qcom,msm8996-dwc3
               - qcom,qcs404-dwc3
               - qcom,sdm660-dwc3
+              - qcom,shikra-dwc3
               - qcom,sm4250-dwc3
               - qcom,sm6115-dwc3
               - qcom,sm6125-dwc3
-- 
2.34.1

