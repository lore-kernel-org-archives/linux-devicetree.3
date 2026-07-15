Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D0745BD78
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124706; cv=none; b=IS2u+YhLSAFU9QYb0QDSQTo7j9w5aiNeulc2g52wQ/oYCeL3vHJbQxjvprIoi+NwoinD1HfFU8Lc6ZmKcVAbqrMuDbluATHIp/Ku6ez5WzXcJdtpOe8SnGlpFFGns9qBxWHwCEh/7Dtqw0fGrzIYjwWaXRLoKsqXq4J6R/tix70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124706; c=relaxed/simple;
	bh=HKovxLVfXVSwQAXngyNlJki7rLoRBolhkZVsnfCS6gI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L+AvhPqDFSp65pw7IMGd2arGrI1kUzfv9h8ci1K5DIFmq7bXK7pz4a/TEXOP0vGb5TZ/a4Ur5g5Q2bnceR1h2XQKvBr3H3NGi+Ap+y+9K0KKHJ5KStFHxjMd+gj/VT/GKguiUYA1nVXi4VdHcKhFafurWjHVlgXXZup5BB9DlD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCXW4hbx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b0kopuXM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCXW4hbx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b0kopuXM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3WKq4097303
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQ47DDAfNPWgexHv1Ma19CgalnyaHgiZ1WcVnWQbsZw=; b=dCXW4hbxx4hC4ym3
	o2dppgNycVguLGhSpLiu8d4Th1o8MDTqko7B46IsiaQ2v3VxJj6p0Otj2oRbOZdt
	rYTKS0ZlbU9hOebV5QF49IlVgQBqKFIwio4vEgd7bg+QdkyvUBw51RlL83jAHfVC
	l6lOUhrivXTA2aqv2Nh2gj1B8/Jthmfk1w5lw/++zRwQtuZZsYioITf1piBBhKhN
	Op8sMZOrT2UfJwDD/82VMT/kYTSfFu5TnNihEGK6fQZmB6ATqPcZDjzdXRzJTv86
	InRyoyKnrkDE/cxtXd4SShaUqk2Ykae9LCwZmc8RYfoYXW0XX6KQ72XLgCq+1f3i
	sm6Dvg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe8558ym8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:11:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccd1958e8fso30542875ad.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124704; x=1784729504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQ47DDAfNPWgexHv1Ma19CgalnyaHgiZ1WcVnWQbsZw=;
        b=b0kopuXMWh/qqcvsBMjkB94x4dGvZn8lYLxeT1Hqp/QeO+exz2K/Oczps2KwyE+C9v
         42Ert5wk9ZHDsYhr6bbZXfwGGtDlNgC1XiC0pzQyz56MokYgrZP9ucNQ1T5V41rNLIxL
         IQ82uVWXATwkcI9EZHs6gudxJdwHBjwniDf273J7tHdGLWqWiDKBafppovjh9Lj/W+4m
         uEMTT5TShkTEXtsDbhV2oVnMuDzHuvqhrXntpI0qf3jDKHKFtcXFZDSZ7RBuJt8dEzUB
         Iou5S9BFAjD9t0I+fYnHFz7GpXfTOqSLBeSMPNMa0vnsNJmkOHRGNU6I+rPoajylleCC
         1xPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124704; x=1784729504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQ47DDAfNPWgexHv1Ma19CgalnyaHgiZ1WcVnWQbsZw=;
        b=b8qduegAMfp9+q464r6ogMFsxKp9GR6Hexzsu+U6o+B25TgDt5lw7et2zy4O9UrURb
         4LioTWkcvmKsAQW+no5oJiWjFDka05QmaL3AIu0763ozFyV2N7NlbKspTH/hCjOBQV1t
         Q3j1lA4dXfQDjKcCBJwHUXOsm3c6hFYfQAXGfITgHjctPCQ6tDxKLXGjLb09Pnpiz64c
         VsRworVixKvWm4KRlcPN2J0RIiuwvBngyeVthGIjcWaeg2WDiOyB0hn1QnciXneFAoz2
         uOZoQCzHMkzL1nv4Ddozs7Z0AIkiW3JxMK9kGRXWqAzMq3Rjg50I1A05Xa78ypxI//DQ
         OSNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpq+xTADcOCEAhaRLyBH2g8kbOwzZnxB0S1jUNOvS8b1FsdhSjwFY/OKzbiT2Mlngl5adQTahZlKT7Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzFtU1onYPbDvDFpMA+VmDYhf0Eq+S3hbUKLksQSgYTAlJ5FqGe
	rwtvsRMHrj9djzdJXiqWwo5kEt0mfl8bl4IyNZqEii5Zv2IJGarJivZRH2bkHnhYjGdDD7/dRk1
	9Bs7c6LTNZ8lYGMkahx0Mama3Nz1qaLxSI/FF6oRfgaIb0rwPQsXIJKZ4/7SZwwyI
X-Gm-Gg: AfdE7ckYxzPojoCY5Bd4wtSGNWrVpJWIx6CByA4HV5FNGNfUzIFYUid1T9gLhkr9utr
	fG6To7GqtoQCuHvGA7++Hv+dT+ZY0hutC+M+UCqgTLtLYnALu8xXh1XRYXR7lmqZcHOn2q4MHDY
	r/dMznyQSi+9OYL/p5uVhPESOyagIlqZ/2kRGyO0pqkvtdXBRZNV3qShJ5ig5OY13ukaky4zJUh
	2oieZjqsOEJOIb1sapi8YvnXYjjpw6x3NfR+Z4zEgGyl+kSG/IIJBDMkPoD0zF/XSDDUnxZitrC
	x5LMckOHOORsKcX76EjK/FxQsMLuwqJRgsjiZGttLg9fvdaL/hRSUGA9pIjo7afSS8Fbn1xtweB
	x5ChbMwePdhUo06vJ3a3gb6ktmtjBOlJ1Xn1rpHJcWirJ
X-Received: by 2002:a17:902:db0b:b0:2cc:6b7a:dfcb with SMTP id d9443c01a7336-2ce9f028b80mr162598805ad.33.1784124703941;
        Wed, 15 Jul 2026 07:11:43 -0700 (PDT)
X-Received: by 2002:a17:902:db0b:b0:2cc:6b7a:dfcb with SMTP id d9443c01a7336-2ce9f028b80mr162598645ad.33.1784124703496;
        Wed, 15 Jul 2026 07:11:43 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:11:43 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:40:08 +0530
Subject: [PATCH v9 14/14] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-14-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=1011;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=HKovxLVfXVSwQAXngyNlJki7rLoRBolhkZVsnfCS6gI=;
 b=Yj06tNo9W4Sz5F9Y8NffrAmj+GAbIKN79t2NNC+0Y4uOLP55xyUcSy6bwfJTvc7P1yLclr8us
 u1O80vjjnzBAU1bFxQc8ueCpHZwWR0/+xWybbd3MF9B/1V6E7Pb58UY
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: vDHr54t_IFL1TiI45ne3VeFC8Zu8u0Wf
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a579520 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Dn0IJEph4XI5J7oltBAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfXy1eQcupC1hXG
 WpuNBiUp91ZiPtikSb1eP3f/jMAqeFKzwXBHpqtNUgKIpfOUxv6IXnHdvd9Y68ltbLxgqb7Knll
 65HupjmcLiY+m01+MgHSQ85S/eQQYYeD/yrcbQnFJdzESyHcNEIlDtYfJETSnZGHC+0D5ujY50f
 2YlXi3a8oZTthqnpgA2cMVjGSesPxLR3aCev/Bq42bA5CHWt3CBFeIYUb/CUORbcTzi3D8c4uXW
 CLGOQiz74llVRxE6nXiwkP7Upqvzs4nPe/hv2AU2FfDPrHiljHVrEZuTOJpgctOUZ50j5CW5ax+
 84QX53Qry5TJnWdFg1Obfi48PlYY1uW6qGewxq8J92968JdedtmCbmKdQWYiRQKwTJlyp9w2l2l
 gpZjwK9BHE6FKTAgyhhpcNupz9pxT83qVH9sztB0aaOnZDy34Xy/ouhmdOf1dF3tokG4qkWpd5H
 IQBffd+bubGataRyXBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX3258peBrpfVF
 0NRiOkLhxWOR6sMXLzuw8m3O35fm8td/wtafFA6rSRP4WAwy3PciefCFVtejuXXqnCe87Wfsq8s
 DlIV2zW2LiKc+wVvcYPaWiJDqmb5nwc=
X-Proofpoint-ORIG-GUID: vDHr54t_IFL1TiI45ne3VeFC8Zu8u0Wf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150141

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index b314c6dd423c..3ade94220667 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -695,6 +695,16 @@ touchscreen@38 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+
+	firmware {
+		iommus = <&apps_smmu 0x19e2 0x0>;
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.34.1

