Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032BF3CCFBD
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534669; cv=none; b=L5mG0fSKW/G9cq1TU7zsM3TxN8BtgIDty6OHe2unLXEk+Sxc26URVlTwJv3WDd3rnC+xX1HxZf3DfDL2LUtRxqpcZJlOrxv0+oNbdFC9Lr0Td6S0Mw3d5Fb00vm9HKPLwkEKfEM0gD5PVUkOS9pwhLqyFi6FAv3RHxyX+PZkako=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534669; c=relaxed/simple;
	bh=xbR26F+2IK0SwAaQUmAO2+Xe1VwKVtt+NKXks4bobiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lepohuqnrlA4VdnEQWNbRwxDNcOTE8X2jpKKHLz6IPO1+UVeADmxwotAzo73JO/FNLKKC4iD9yKL0GEecmc3YwziT8Ysaraf/5bbl8vigLuuWfrSLEnUb8y43PdalUcEbWWzSYAWPp9S85vXsZ6swxGnot3U2cNJzGJU8iqqtJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zzb3Uuxb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=My88WpM2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zzb3Uuxb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="My88WpM2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6Rj7J1713672
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=; b=Zzb3UuxbLePsf19z
	VswifbdogvpjyA5p1PavnkbKMv0olLZEgWqdiK+G9OQgGtvnnjfeLWtOCPPveOv0
	5n6sZeUQzDULQK+9/Xe+b216bmSzI2a2Cptuab1M7QgBLYGs1RVivj5Nzcbkww13
	yJH05x2VQJ327Fdx9k1EeZ0pxQDB7J2/nhXJ4wUeHLYaZbkyqVARlvipZif19H+5
	aMjIPznq3xl7JnKyH+ALRWFjchDANKMT+wllLoJ20Eg0EsBo5pxV8nnvjPoMpF+u
	a2L2Ccz5aq7GoXdIUDghFrtaILLXaGsTxg0wQ+d0I3IsG+tysUH+uPKnTWF8uBWZ
	EHDVjA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2dc549h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:04:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-520a00c7a03so95470621cf.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784534666; x=1785139466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
        b=My88WpM2gr1AKY9vCuENEKESZBIi0XiDf/Sg15JkBKm34RNH/j38nsOul0MPreU/SH
         OVsEF8kmB7kXjpaqnesKjQSXzXdiQBHVDzT/ibIbMLUS6dRU/L1+y3YjxjgEllM2QvVQ
         fGdB/B3ApquHMkPj2qZ2Qv3kzgh6689fl6jdRucaLNBmNPzzw7MKu007nN3k8LEC+BuA
         neKKXcWIPNpC0sTgtEk7k50QYvNevwGLCY+sgWhKANjfmIWBbalkWbi2G0j18l94Ui6+
         KYqYe5iUv3MZSv8Anf9GHFfETe/0AKoVbUFvumdjqEaN6gU+Npn2P2jrYAuNQZWHMXIm
         rUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534666; x=1785139466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
        b=OkoMk/fbYtHimDnWfAkfbCPd/AIG1t04QBfozN3y8FL+WzyQNxnecQphEXuXSPGf4c
         O151bqdb7Htygxnbh8uzVMhoxjIbI7hvPSbnIKS/HWp3OnfmdEsl4RywS4Mwm9Xdbps3
         GlktfDZ/OZlP/8TdFQk/ZLyGkS43YZfhEFKOYXVs8YZQNLv2zfalzTNadyw1jajbxzgv
         +Un+nRI20m6B36wR4Qe72Vh2Bn7hz2Xll3P+NBW6I3Kmk72CaW1G1ZLutkCcZ2E14nXR
         3WC3vxF2jPD+yB4WeyHFK22yUWoceBQQpnH/zwrlW/wEktLjw/yst0cgeVp90ney8w5D
         00Hg==
X-Forwarded-Encrypted: i=1; AHgh+RqwcHcN8AFsqSaUtswlldiID9fG5nodepLKpxLOj5yDXQ9Ax3MMPu5jCGH2DMRebu1efG+JfHb688bP@vger.kernel.org
X-Gm-Message-State: AOJu0YxhcSkVThZVvNMgPp9g6vJPGFPmJdvKfr3wnf9zHfhgMqEUodIL
	6pkzInbsytOOLeq30BrlzQlu5oZZxFy2oBLeOq4pKaGWNnzZc5dscDha1q4+x9eiuoqq+8QAylA
	PycB+Iw1DOdrvjZGXI71v24jl58AZymXsd0NcZcvf8kZQPALFouMfyduQ0eEAZgifnqqrNwSpSv
	k=
X-Gm-Gg: AfdE7ckxvVgb2xCKWLgHdXt+MbWSPgYD7KIlIdJAEbRSM8/4zeW5D0vL4HyMXvo50n1
	/77+bFiwYOmTDsOT1myR6hKw8WjdSzXahC6hxXewbNQGhGbiE2bBzqS59PvXuyVkwVtJK1lwGMs
	nSTi0HUj6wEzCMbPZePJ4NFt6cbwJIsQB0BmTIp+WDEmW/l3qQAaDA8xhUiW3mx1UV0vHuA06eI
	CZFGR53DoBm+OGMQSSrFS2BaFAQMH38TF9RmQZ23rt2BKn8CskCNqS6nOp/Cv70V2aXg+FPemtK
	QV3+t19VtrN0FCYSxIH4Bb2lO8TTjQivuMmOdDr1ySGijnWi5giK3T1XLAxkZcARKydMtjyR6SY
	leXCvoDMAofiRrRCPp5tdT0i5dfZvmgQRHuhcVpo2cVdYtUw967eGNa0YiLZQ5RxMWtzBlxeTVV
	EEKqQrkKNOwJHG8QfbZ0uCJB/E5jOOE/8MMxv2hBDHwvjVurRjIhU=
X-Received: by 2002:a05:622a:1b88:b0:51c:1027:34d4 with SMTP id d75a77b69052e-5213c8e37a7mr124754471cf.11.1784534666058;
        Mon, 20 Jul 2026 01:04:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1b88:b0:51c:1027:34d4 with SMTP id d75a77b69052e-5213c8e37a7mr124753971cf.11.1784534665522;
        Mon, 20 Jul 2026 01:04:25 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000c3e2sm4256542a12.30.2026.07.20.01.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:04:24 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:04:11 +0200
Subject: [PATCH v5 09/11] dt-bindings: connector: pcie-m2-e: Add vendor LGA
 connector compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-monza-wireless-v5-9-69ec6743543c@oss.qualcomm.com>
References: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
In-Reply-To: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA4OCBTYWx0ZWRfX7NHm/zUk4UXO
 UY/JgODtyTnqfbUG8d3iJiqogIZKlqsF0EtQUn3XbiLvGDSQsI5XKBn+boR/2NbNso1cZbQLWFD
 6JAgkcZJjfXaI/py02pvM7p2E6bq/ZQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA4OCBTYWx0ZWRfX+I1yHfZbpu2B
 CMunvCxXIJkt6Hp8dexuwFMjJ8r8vm7AdfUlMchU7fXW6Dehugrv1dJn0+bnaAp9Ci/MJAUz4Ir
 av8Ph2cBPhWxzLQxqNJiHllAVOlw3ZxupUMyJ1Qf9urbaa7aTElCjoydazudck5WwJ+G2kG0EzJ
 JnuSS3mYj9i22C4zTrydMliypMrcfIIlgcujF4SJqOLvabTd+RgnJnDJR5/1OS5QvEje+ZWcK25
 ablgPhwn0y2B6vjfR/qsfqHv7QKUjkpWO3nhDkSzSL4anPWjum5G7qRvjclsev5vyVzHWQS7a8U
 UHKYOb3pPxZjua++hJScMPyQM1JLLJ2OtyRm7NmSkBztiw+KXMhnAL/BVuNzgekpQXXnfNc0wCA
 TZIsj7Qmi4016n/oTrR5YNR6fjLablpjLml6WYx7cml3GGrWNln5VLxnjId2ps53Ij4rOrt1jfN
 tbiwqURlTfJkH1vpkHg==
X-Proofpoint-ORIG-GUID: YEv7N6jOzqeKa5opNP0sO9V-KDeWCsyN
X-Proofpoint-GUID: YEv7N6jOzqeKa5opNP0sO9V-KDeWCsyN
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a5dd68a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200088

Some modules (e.g. the Qualcomm QCA2066/QCNFA765) expose the same M.2
Key E interface signals but are physically soldered as an LGA package
rather than plugged into a real M.2 Key E connector socket. Such designs
are not actual M.2 Key E connectors, so describe them with a dedicated
vendor-specific compatible while keeping "pcie-m2-e-connector" as a
fallback for the shared signal semantics.

Add "qcom,pcie-m2-1418-lga-connector" for the M.2 LGA 1418 found on
Arduino Ventuno Q (Monaco Monza).

Add "qcom,pcie-m2-1620-lga-connector" for the M.2 LGA 1620 found on
The Lenovo Thinkpad T14s.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/connector/pcie-m2-e-connector.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
index f7859aa9b63469cb43919c0b5719c18694c5364d..ce6173a0ec41cfe8ab4a5780940999c18674ab7e 100644
--- a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
@@ -17,7 +17,13 @@ description:
 
 properties:
   compatible:
-    const: pcie-m2-e-connector
+    oneOf:
+      - const: pcie-m2-e-connector
+      - items:
+          - enum:
+              - qcom,pcie-m2-1418-lga-connector
+              - qcom,pcie-m2-1620-lga-connector
+          - const: pcie-m2-e-connector
 
   vpcie3v3-supply:
     description: A phandle to the regulator for 3.3v supply.

-- 
2.34.1

