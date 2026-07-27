Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976163DDDC1
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141864; cv=none; b=KdfU2AGIEJAM7CxVUMdt5tMWcWjLYbScb2+abZw62OfF1EwFo/nGsQI9MuUqTx/qg8L3sRsSIYr5taIuWZo7OMeswwSCTCzlsGZHHx7gqG/PVgu2cJYbnwtwUKuVwyS0Bmv7PU7aDp3NQ3GrHzGpEpDm7oQN4YUUPGqfOE6QtjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141864; c=relaxed/simple;
	bh=i7BTahcjkzfQmr5e1JVqSXz+53oeEoy0G0dcvxeMRtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Xr+w1eB/xcnI3QU7FRYq9qjE45g5cR/3rw/fNTI1A8abcMQs7S1esQXDBIFo0uIyh0LyN9Ni7TpqZ1ppoSoaOFWjEBuISrXAwIHfBY5j1xv/QxSQ/AppEdCiUdAyUKywJ8Ll5FQj6LnL4u/g2i6qdXt3Li4icZkM0T0cZYuDUls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZtURrkS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ur++1pVW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZtURrkS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ur++1pVW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R8gWWh2721611
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a4tQ7E1TjGuE566ghgtKg/
	TnpDcVjNblZGoADuY3Bls=; b=WZtURrkSxXgdLS+JrToE0pnHYAJifIlgcgSd96
	ZsKEwOPms8BCYcejZEi1DMic7BECeUlvtVOXABim2mjwFhW4UzcgVaKZm0P+UU6R
	Ytt4rvFSV2I3PE0Zt/hYElMw0bUwsNOS5/p73W57eOmwXEu2x7rCemBiLpcADIdq
	vcHmRIi4s/2ivy2WXaK2EVlR3BILYL0Yi+uBPXpKi0bEiQh+yqkZ768/ACWCV0GW
	rEuP9kWx4oZv3HCT0TxxskqFv/mU256Rwhhiub2X3hsAXP4xefVvGx1maY+vrthw
	HG6F2eSUoAiDUHm/munMZphoW1KxWs68IQmr6nI37ujzuvZA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajn63f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:44:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso36086435ad.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785141862; x=1785746662; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a4tQ7E1TjGuE566ghgtKg/TnpDcVjNblZGoADuY3Bls=;
        b=Ur++1pVWRJqBJdyrs+J3EHfDPOXQx9kszHGKDMMOR49kATmxthWlgbvNVJDLH309gI
         OY+51N9ooLIS4r9wuWMWKDECe9CKdc5HABQ1g/e8jrpxp8Cn1Z6Z6pxbRoVfKjRPtFS1
         aSQAFNQYzRTdIhLVhrDXwO+3g91pYk69nqAMjYHBk1C4ZnS9jzYaVIpUv2NtuNM3xkWd
         iUq84VGvvx3d9ds/zZSItVhLshMGnFVyLPTGzjxnk2QpmqrkR1ciXJtrpJPwxdoyffmn
         1lHXxz9yBUFLbep5i8XRcMJO0N8RTrGEy8k20EwTJxmaWp4JKJN+9np+5fcJL6OOZQ7r
         9bcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785141862; x=1785746662;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=a4tQ7E1TjGuE566ghgtKg/TnpDcVjNblZGoADuY3Bls=;
        b=S2IrigCDJcNnVPNbPf8Ktzml3PnXJW5NDpr5IyeEp/5I/dmHEe3WG/N/V7yul1+lAi
         PP5SbQ9+u9ouw9j6rypwVRWVA87qa4LpfmBQKmZpAJewA9Tnlg+NkIVDbi6MOHPkhqMj
         4oiLjRT53l9oNo/mgphGve1kaH/qJTUZv0Cmb0PnPW5m8YHPT1gehUDvdn3lLrv6/8qz
         /CzDNg7vDdk7DjN4aSDdZZMGq6qwwoXtn+oIp4ezlBqa/6otqfHScFiQjD/QdnHYsugN
         672CgGW8LHGZ5UvApVrcxDQIKBCH6rJahmhkTBu2Qko7pjtugvHWCTZgAEJ329kquq1I
         Qqhw==
X-Forwarded-Encrypted: i=1; AHgh+RrFRFC5K2ETRcMBIGmXx/5pNGBCpqYKnQucEPbpbDWnBf0F5MyLcnLwejRPEDReYs4eUNKICGO2LcNU@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj6IP1Cb/iw8ylR5j+mnzJ4ZrWtyk4h8jWFaeuTd4CXeD8NtTV
	pWGUDL+Voz2KyDM61K/5hXcOcX79+y0rK/lGm+PwdLxobW/OvYg3tfliKckdBerhCV1KQiKW87M
	mpFU+4xprGR8SsTHbVhl1Y0TV3ETwt2tLOJ7iMi/DgrHLq0sIjnErTN7Ji1JJT9y6
X-Gm-Gg: AR+sD12+kbxCaw81P4c0zKzsAKUc888hlkGeiDQX+coyYvONlfm09KumsQeYYdhr1H/
	iokKpMh90MLrzap00DJR6u36a3hmvnh4B9oO0LdCdz6/CofPS1O3E5w4uc2oUypl8zoxAhPu9o9
	mOWONiJLHKWNzYEO7mpr5Ry/RgCFXczo7E3QrlX1EHVzJs8Y9PGJS6CcE7n9n9R2Qd+ngwCNGN5
	oRUczmXXY0tztnpfN3NnQ7wDdzp8Fc+BV+xLHQsE3sIy03rRuxA8mWQfa5/Bd6AjUp9sdEqgsAs
	P1DEn/SpkHpcAEKDNIViYkir/VjFIH4FaF5jkTS/KJiGBVqhCBRtkU1R1TeDq8KZbAU+h6Tsjgh
	XRlaUfPPwctWr5kjmrZrgEVOGZH3f79MTDoRgJSwXu/MyNqyES8tnDJdcF3HDDJgm2HiU7cUezM
	rCu6mmUTcsLMX6fKN3MqCthE0QR9yl3mU9nts=
X-Received: by 2002:a17:902:c401:b0:2cf:b066:7de2 with SMTP id d9443c01a7336-2cfde865c3emr71882555ad.22.1785141862229;
        Mon, 27 Jul 2026 01:44:22 -0700 (PDT)
X-Received: by 2002:a17:902:c401:b0:2cf:b066:7de2 with SMTP id d9443c01a7336-2cfde865c3emr71882295ad.22.1785141861788;
        Mon, 27 Jul 2026 01:44:21 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548efesm30779643eec.14.2026.07.27.01.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:44:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 14:14:12 +0530
Subject: [PATCH RESEND] dt-bindings: mfd: qcom,tcsr: Document the IPQ9650
 TCSR block
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-ipq9650_tcsr_binding-v1-1-931ac0e056d0@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: sYhlsJsL8rDjQFzOga2n0hFXFjDO2Tj_
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a671a66 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ifDjX6ND25ec3OlZEW0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: sYhlsJsL8rDjQFzOga2n0hFXFjDO2Tj_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA4NSBTYWx0ZWRfX9aVNjBnZC9/O
 4TaOCuqMfbFczJ/rPronPnXvyTbw84MCUjKDAzh3Cd4EXr+H1m6858KiHApe3rAYmFAtaadsVL4
 QN5FbKXIOfCODj6s17ugPMgSDwl1VQd6VxkWAXJSGt5Adt9usIvnZ53Uk+f21Iq+jcoB0GBYdt0
 8TD19E16fexXBhGqkLdlHPWSEsY7fQ/473MbRl6PQGYKid6agCZV0DGGijZxudfCYHKd/T4yZTP
 4K2+dJOv/xK0NB4DE8LhffuJbm26XR5WC1Dv9TGjROk5TvoibhIU85JqDLG/gPirOiLZ0TWthzc
 fbiHMDEav0IwPrk4vq39QS+m1FUsdUmflf+7bUw9UZWo8pd0DUX0PbpfoucYklG406oTMBdDIkN
 5UUJ0+i58Zvk54hoS5OFojGw9gqIwjHdJ45LTB1x/ZP5Qv0/Wf+FPmzeFbhHXUBsHaIAQkV6JHP
 mPpfjSr0fbbjwk1HK5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA4NSBTYWx0ZWRfX5JZqrg8WtNN6
 mFNQaIsQ9gPclZGjEPmR1MKtDR2sirHjhYr+Lb09TxPNNnFuCATzPwIrh/B26Y7Fsw2DDVXzMq+
 3l1er2JylcrZFfYyk6gwzWqaVQnH0+g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270085

Document the TCSR block found on the Qualcomm's IPQ9650 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 14ae3f00ef7e..8914c882fc35 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -48,6 +48,7 @@ properties:
           - qcom,tcsr-ipq8064
           - qcom,tcsr-ipq8074
           - qcom,tcsr-ipq9574
+          - qcom,tcsr-ipq9650
           - qcom,tcsr-mdm9615
           - qcom,tcsr-msm8226
           - qcom,tcsr-msm8660

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-ipq9650_tcsr_binding-70d665950fdf

Best regards,
--
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

