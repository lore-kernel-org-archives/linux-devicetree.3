Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D6D3E8C50
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846625; cv=none; b=t4ku33hR1K5/K7cP77z1zeyuMXqq04kRTSvOZte+FVIMW2ffIwlsZ0zVobZ0rThr6H7QKarlP9S3NMQIrNamZ4XKOxG8XOJd7KKeAduMDrLE14cxzspthC7k1kTj8CxTfllnx2QPjTy4mru4yQbDGeyi+fnkTK0eri+pKcEqJpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846625; c=relaxed/simple;
	bh=LrYOtEt9rcxFuphJeoWaWvSb9zymc3pCwefaSTSXMIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AFp26LPQUZEnSoqQqGbVB5YRDxwWk/aUBwYgjIyboe26Ww91rHZkEuIkHuE5soicKRiEtRNaepzTEivtKbnx5XoXCQTD/qFD/j908vUEboBcKscde7OG9ADWFSv142d83powzCvnMyX7L3ns+1nIJ9xIr84Z9qJk8HO1bJaWE3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7N6Zr7j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQnvTj84; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7N6Zr7j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQnvTj84"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AGLm0p017418
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K3tWCRjsFgY
	Zdzb/qQI2S1C4x0elOOqx2eWEbdq5p98=; b=o7N6Zr7jzAlf4MIiXP532/xIEpJ
	ffaJjvUzbmYQmFXOIiaP1kbksO5UV1E6XSq6lGsyvL1szisa19G52ahmPy/Dq/4+
	LplnJcWzkSVX0NBPOZ2/AjcsdkrOMK2XG7alQMAahMUW3v1imY/TEofyXyB1FZ9m
	TYvr1Xk7o567Mdiz/wR/VnBPiXyetzbS5ZLcpzDu+93dL1aq5dlOR69tUddI1jlY
	PH4cAH09yn0ajYevymB3onr7zPUP0Ijy8WPFhTfNnHdMTEKIoq7wr7Fysfc9QJvY
	keNWEQIvsS101lIcpwNN9AoueNrN46vnl1XmgsgFPG8aNpQVOhcXJh5uBnQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5j1m8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630753cc38so3639972a12.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846622; x=1776451422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3tWCRjsFgYZdzb/qQI2S1C4x0elOOqx2eWEbdq5p98=;
        b=dQnvTj84rfQQEntYqWq5RWR28zdN7NATXtwSzfxg/oksA7GHBCRKEqIc9AzRrW8Z0w
         xR5IzdUXWy2IzpalVcf3Ngj8cGmRLQVvYBdtQzWVka8H9I9jgxsFv2bZPVi7pL5AFLFX
         FmChcORdoU6z+MKDLpWizx7UEZst5gdQw0gl3UJ3AkmAv+8uQRccpxA0FspBpL/g/Wv8
         xEJ4vckZcYhhgveP+/PvEPKVjm8VAc9Dj1Ocza0rgz84xPDGY6PHEI/FeSj78drxJD+9
         RK8zN1IbbSnt8hXhqGYdEIid+DhPZW71IjrPI5lGoriMd/aXy9Z2sAzsymPtqzWTV5l9
         9c+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846622; x=1776451422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K3tWCRjsFgYZdzb/qQI2S1C4x0elOOqx2eWEbdq5p98=;
        b=hxwE7oRGcPvdr0EdloExtj05YgEozODWfFDhSeaq8PVwYEgiUPhEFPY+CSyp0KqGqP
         wPwAdJ6zvDZ5mkYvrz/jbshbDXLIjIn1mwlRf8NcGx7m3+mpMQtkmNfYLXo77gwHA5I4
         mmd6QBiOxCk4vNdkiglTIQE5GCerxEF1Gbp/Z8/5+j5YneSoH7X7kawsx4UcLAFUw6iw
         lRi3atR2F8ImjDBmSqEgHkRSN3m9XRbw3Dax6pgUdHIn9K6mp/7iMPOuQw628n4Kk4qv
         mq5TWSpxACYRbemhi3LnusSqnbHxmQLBUY42DQzuWs395TUzUOJTE5cfXv8lH6J08fuE
         x3Xg==
X-Forwarded-Encrypted: i=1; AJvYcCV6lAv5QtvZ95yoEdFyrb3Y+ziJbGgbZcOer3f6l4KS7kLGPh2mTEBQCTr4eoc+ISZcILPRse3I0yr+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ENUcNO6DgeLFFYPniaRT0CXDdHXEU6xdDEAnUWD8huMx+K31
	4MLhpcAFA3Lqkk+uMY5T6JJ7PWkJNkY5g4nVn5VEXoAQXeAlnwQicw07oD3ugv27op7KmlaAaRu
	zfB8UkGi21WIerJ3wgdFiMg8JGlKSqgMxY69J4agQXv04IDG9ZUBCcbOUGFHyCfVX
X-Gm-Gg: AeBDietR00sMEk+krORBALV50LbrPzCS6oUpqTxqTzjQJfuv3BFA4V9MJqdpotE6ifw
	LGdEG7neEZAj9N+MmvZBVjm3DsK08xd7BoNRKTQID4F+b7gIL86i7LbPU2mudd+2Dt44oHlJSox
	InPUeisLAJwmU8gGnmOJS6wVpsKEfeNsJAaj2bADiXV08CGIB4lREZTAKmD+RbfaCJGo6v71Yy2
	nSpz2fuA+RBEUvmGKIOzBM4DkQs1BUUozQ41cH2NtTW9QZaPL1mCbvGIkBSUQMDxtx0491HYxFJ
	ufK1rezc/xemD+/lBKyhU08C1x8aKeWNOBXO59w2Cf3cUADYAgCm85/eDShyNhiBDdBJL/LVD7P
	f9mwSLLo4d3w0x/tZzHmg16nqmlFTR5xgl2uiOwiVSk8BDimK
X-Received: by 2002:a05:6a20:9389:b0:398:7a23:2779 with SMTP id adf61e73a8af0-39fe408bfa5mr5121084637.52.1775846622233;
        Fri, 10 Apr 2026 11:43:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:9389:b0:398:7a23:2779 with SMTP id adf61e73a8af0-39fe408bfa5mr5121039637.52.1775846621650;
        Fri, 10 Apr 2026 11:43:41 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 25/35] arm64: dts: qcom: sa8775p: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:11:02 +0530
Message-ID: <20260410184124.1068210-26-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: z0DFO63VpfwUtoTPTAhcdhP2wLr8qXYm
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=69d944df cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=4r5VZk7rGim1V93hxqYA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: z0DFO63VpfwUtoTPTAhcdhP2wLr8qXYm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX20lQqa728WUJ
 aHPl/4izmU5P0zng+XwpDF32jz4M8VQh3jHn+qvJA9Q8hKZ6yeo1+7+05nENVBE5chqyNqtYFIB
 yCZSiOCZqFXU0WW3wDxNH70QVPpqMGXjAc452mUsjWlkVJTIY+0jK+HyMbcGgV79xRgq4+yo/po
 +ItllbWl2E5HmRZ5e4v5e//GxhevoANvAGJPsvJNJ6Tdzi5kL1KI1zNZhq+CY1GCUc742Hq2MBJ
 Du/DN/uqKEHqbOULpfue0k/JlKY8nm9V5+dR0zGPzRQExkH1MmRGIT8nj+MY4vs/rLZog+B2aIl
 1TpXc9HX9fvgmjdoSB9nI9APa6viSQsTzBoPAiEOKles5ftfjOmqHA3TpCrOEUhc2lGxqHpXMp1
 lUp4+sF/EVDJlBc2Pq9LKXsu70OOv3eBNW2sN1oG26r5UspGn9efa7eDrof1QFjSlC2HFdfvNjq
 sqUKCWzgPtNV3yBEDJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553..1724df115873 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5536,7 +5536,7 @@ dispcc0: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>,
+			reg = <0x0 0x0b220000 0x0 0x10000>,
 			      <0x0 0x17c000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 40>,
 					  <40 140 14>,
-- 
2.53.0

