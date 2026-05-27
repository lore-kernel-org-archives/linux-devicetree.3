Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986A93ECBF3
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875058; cv=none; b=r/FpBq8vSpeTqn529ClFOpMEIHDdWRreAqYGaRgbK4V07AHt/WOz6YELvh8W8YaWDE6Ve8ItElLbzJGay1uV3pWDZND8LKMrZq/7ASj8rYj47yDhVmNopG4bXIGN5h5pNJIyopn4FuEJrAX2epNkC4X/nzugRPH39WEkCJtOh28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875058; c=relaxed/simple;
	bh=VVY5VieCgAdglrKkHhxcnXupBX6/StQddkC0Al36AIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqichXmZ9F/R8hASqhRso9bZSxJb1rRok5OZQxylBuUH1OFX01y7LLJwpC/0eNJAAWrQyyYxakeK1QlgaMPAay3hoiTVV8JnMydy9U08YDQ+1X+89Ed8gbukOofPBnzBn9PNye5wWAbSfOtsi6VbZMABA0v6IfAyJbA9zIHdRBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZ4XzWRk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KefSwK5L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZ4XzWRk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KefSwK5L"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mbYx1041544
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IZ3h4isVDpZ
	t73CY1iR8eaBiYTa2WaLGDMJkevhiNDk=; b=XZ4XzWRkzRkvLoyNVExWiQAxMVZ
	bFpayEzz6BhJ0U4aOOzYW/T5HjoSiLQdpn5oHSYncjsX/HedogXaZVLQZpXSh7cU
	4+PKXAQE6EoAofA2Rnebcfl8JiibytQKlblA0uHJHXkm/MS1unv/4Q6gc9wSC6dP
	KJuNGqsoMo2cp0g7Iq/pOZNnpFODdQNyUB9w11oJFOH9Rvo2iTedBFe32iu7TigQ
	TQ02R1ZYXSuqOYCRLJurv30mVGiknZEmsJZi+bh39II1222qGwA8DH6ASs8qeAGH
	ZM2AZ+sJkKgQ5O2B/+sDmgpDiw6sZoCMJPV/3T9KYX6uaDBfQkT1hNj4b5g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edh17aqhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso130005705ad.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875054; x=1780479854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZ3h4isVDpZt73CY1iR8eaBiYTa2WaLGDMJkevhiNDk=;
        b=KefSwK5LOxqdZfagNueGT0fAERmod55796o7wVaDgGGi0B9tIXspCvserM90mCgwcG
         Wj52BeCIOcAz4R1+U+1YvJWXlrSFUrSxor+YDp+cpUnbLRbT1letK/QVfGjLLjmsUHrS
         H6xOWqkJNWHoO3Cu7USQBWvbU/Dd1+/vTqhpuTgn2iS5ne12e0T0z+J3D6PvMkyRkbOt
         T900e1MNWVTE55IHNbjwNgbWzgXy7goIZYg4glIlrITaVEnm67ymffWW1eD9+7R7IAAk
         k4Q9cPUAZD6n4VRjJyKiR0ogioVwBidk6Y8ktvunAGitkUnw//HF+JyqYZXeUJ+2diH7
         eZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875054; x=1780479854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IZ3h4isVDpZt73CY1iR8eaBiYTa2WaLGDMJkevhiNDk=;
        b=Pjlq6GI9BPUUB2zmQdbxaIm86jp1BXONaa2VGNWB/Yvn0qEh4qCFwZ8UQYv9Y+ssH5
         i8sAUwSdeo4NJVbZkirKhYLOmUtDd2QH7fH4pQTlHaLMLFBQ9I32rcZGBVTAvCJd4jzN
         2aC8Oswz+JuV69/22VNUOqJvgAVEIr+dtKSM7ZBV7FA7CFTLZw6GVRFzYcTOSPMrhdBd
         3+GwU20wrSaa8fkDjNDqtpGeaLBw6moisT9+LO/Ee1C3c7DeKJmMZKqUH+qGZNR0A5Hv
         mUcmpmzkQh+l15lIRhrvRqy2IswF7xoSKSzc0mmnDqDbk+G2F19DLz/ZgWvt0gK3ulkC
         x1Lg==
X-Forwarded-Encrypted: i=1; AFNElJ+BvX6QEb2KHb0tv7o4fKrmZm8EaidtUJtebiDmzDTX2X5rBeiC+1qruxzrGKbFvCOCbEszCwRuX+ZS@vger.kernel.org
X-Gm-Message-State: AOJu0YxYVqhT3ckAZJEkTsxtUhaEBiL7JPZ1WhVjCN+eVMQn1HHYhiVd
	Uq/QDZwcOaOUOcrpll70Gbavv1aKYxuMF3mVd7kfO9m/TP2NZq6LeS4eCQKPdX24DgquP3aeMtW
	hNNSAJounW9ceaMtEP2Xbr7zrQlVAA0RJeS7BrL9CVzgf/wuTplMpSVvLeBgfilln
X-Gm-Gg: Acq92OEDLkOeSifRDD0+EkK0cMMeJ0YduW8t+lEpjb1IHfQsg5vYXrV1965YB93E8O+
	ifMMG01eCd0+mzdlnvzoFLCn6nitIMnvnGxC6fljAuS6hH4LLr51GmneQovklqI///PY/NjBhoL
	ILcQe+TTr+dfWUtsjlid2AuzgqWibuxJlT7DLxGcTCLzlLcc2sw11F1K66N4zA8efQBasDVjGCf
	4i+dIjVa7xcZ2gdlJQ1cQLJHOlR70jgag7kAQUWY3w+ZIdO0IPbXoSkjQsQ2VM68pkKqNCBxBAu
	MPuXHGEwVu/RBb7Lxr6I6Td5vlKV8/2o/RIe1yu37a/8zaFjZ5j58P0w0gzEoVYydpKJEKqu36U
	SQa9d6hqr5O8mCuA7UNsSj/T5mAcKHoZthd3Dt36j0sArINsZ
X-Received: by 2002:a17:902:cf4b:b0:2bd:ba44:6c07 with SMTP id d9443c01a7336-2beb0702610mr249522475ad.16.1779875054496;
        Wed, 27 May 2026 02:44:14 -0700 (PDT)
X-Received: by 2002:a17:902:cf4b:b0:2bd:ba44:6c07 with SMTP id d9443c01a7336-2beb0702610mr249522255ad.16.1779875054027;
        Wed, 27 May 2026 02:44:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 08/24] arm64: dts: qcom: sc8280xp: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:13 +0530
Message-ID: <20260527094333.2311731-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rOJd66v0SEVPeVwk-8N_KnPasK32Ut3o
X-Proofpoint-GUID: rOJd66v0SEVPeVwk-8N_KnPasK32Ut3o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX/z8Q07hCtFw/
 v8ytayt3dPBIT3qTe1C4TKqwqIiOSMjaVXWPkpcAr8TaB4qOyItzmRB93mwsbmMk4xEksc6QCmN
 C3IQRTndySOQ9CuRl1E++uvqyUzjVvmxrBYhCZqNaCQA302eLFVURc+ou/67eR1eSrPXiaaLMfU
 9Yy9oIbhmOlcVFo29kZ/OI2N9UeMvp3JIgbcVc7aLkXtv4OQtPEU6WpXHhPcp55uFT8RrFuxTtS
 hecYxuseT94aEdU+7Cu9LCns1Nu81tt2Qo09DBBi6MnsW1dfj4NB6W9XLAOpBU/e8QAtpvhmKGT
 GsdFteubU6re91nFWb/1JQbuoJXOYmjctDx/e7Xn9lcJlDB3r/BipwsIRzc67tZ5L/tzaiqfBnC
 ORXFxIJhQEb2kQyGcixt+0ez2pISZgdEK5aPxD7OK8cXQrIV7+2yoXJbRd3VkrTiNDP5UFGw5gW
 2ZOFNY5x7o9FpjVmxUw==
X-Authority-Analysis: v=2.4 cv=Gc0nWwXL c=1 sm=1 tr=0 ts=6a16bcef cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=5VQtlk3mkWvnAHmEXu0A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on sc8280xp spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index ee02acd18856..9dad61ab5dbf 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5326,7 +5326,7 @@ dispcc0: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc8280xp-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x17c000f0 0 0x60>;
 			qcom,pdc-ranges = <0 480 40>,
 					  <40 140 14>,
 					  <54 263 1>,
-- 
2.53.0

