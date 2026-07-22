Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364A135CB81
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730247; cv=none; b=fn9/RejBTuQhHj5jZgnVB6C+ORlunJYJphBhE1wPMvBMHTby9BJw7acz/T2tAJFc/0nU2I9JPhuNpggdvWEYJOqqcRogUq5ZtbVx4WN3SYBEl39iNUDGlxTF98KdMWFfk7surA5XlNDRt4OaNY4NixPtjXLsj0VXKA6gq0pQnF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730247; c=relaxed/simple;
	bh=V52VMVTsICErjx52K6RCwTL/eZQ1Jb8+WCkmTN+Uii4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=La7Y5XtJB2B3sdPNIwmGbd2cOrfyHvvAynWgr8b0uojzKp+01JJrmQ0BiprY4nuEQ9orUZS72hHugsZOZnlcmrYq977uRn9daYxzozecYeg8m8bbYY08Z9U3dc31eub4V0EWJZ30zvqhzwihIUJsIu8FijVYQyi/ilfbGsvwVwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfwEt/Ra; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJMT2JDW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfwEt/Ra";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJMT2JDW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWM6m646338
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OQtiqSkO98b
	Kv5iFuaagymYn+xWLmyIxdl1cd4mGciQ=; b=WfwEt/Ra/IOMS7bq/5VtyEB+FIh
	iabCIlbO2OzY5mhZ4bvswjCqpD3xmQaLXSsgJp3SL8IcqwWTXEy2T1g0dFgGF3Nv
	mmHHBiCK0rAzWS9ZfuKqzmu2wuJnvUDJ/dxA2XAnR0ind51qXWisDx3SBue7Ogi8
	+2l4iQzgVPP+po6mAZX+IMuxGNXbjvbk7DtN+n1Q4OHeaBhPgj8HKeEXxRyqPP72
	43tJEtr+zCbK16+42qc0/DD74y03LNEIUFFXksjDrD+H+svxh73yNSDvmI/HXM1A
	9w+E0WAuUBNWv2ztAZw9g+vSmLygaPF7kvsr20t/ZarXwKRumN7rN7yatjw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju22998r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:24:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6ef846b33so3182073a12.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784730245; x=1785335045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OQtiqSkO98bKv5iFuaagymYn+xWLmyIxdl1cd4mGciQ=;
        b=iJMT2JDWUmSwx4tZjuxPgMZGzF5ImJyFQ0BUxieGv9CHxbpqr/XQv/IZuvWWUTbAoR
         1j683byso84IkfUMYRnWBOPw8+NciXTD1aIULc1WMp+K5U4Tatq05MmPr82gySN5VFpU
         SoNBsnZPc6oP06bXmAl35TyG2qmE3wuufTO3Yfd2jGGRtOxToKCo/75LyuKNzK4ZD0nf
         Yjqp5yFC1QdbIr3ERJn9ES0RkgfjvdNh9JbDrAu3OftQt2i5cE94AWS7WUrWrmGjrbFM
         PTdiOAKe5X7+GvUbB6uJ7POzjB5ceGgvFK5TPka3JMLUDRNC6sAR9Inux8OImrJ1iSQr
         x8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784730245; x=1785335045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OQtiqSkO98bKv5iFuaagymYn+xWLmyIxdl1cd4mGciQ=;
        b=UM7ICNIGLNPj5qpaZUlNT62blj2auzLhrGkxwfYqz4afT1AQkt+D48ZxJ+4mUXnUT3
         X4HP0/mZsNVyGdlngZU2fIerWkTelpPmrnlzWIEtmjO0bwokWgkuUprcCgPywRmAIPlk
         Xa59l3xPCaVAz5R32suMzvffUkEQTQVKwp/6O+5sfhqLdvY7JOKMRiaSFDIjLWFmPRmE
         cReilc3UInOoz4uX2LPVqaHqXz/qJxhfPR3FdcvQKKFChgvirbTAFS9vrstQdmD1KPR6
         bzdD79iYlb0gDmRI4ZZmAgXzph3k798S4Hr0Wf0rCxNzt8pr552+T0wwzgX2PMeGBp7j
         7s2A==
X-Forwarded-Encrypted: i=1; AHgh+RrrC8GORf+13wxqnC0IOTRD7bvHLtzD1aiPzNPt7Y+zStIDzS0MGO7xw9YOnLvBQiIMz9fqkb3ZTBA4@vger.kernel.org
X-Gm-Message-State: AOJu0YzQejGDLXhoZygAoeF4oZIBEKjtmiyqp0sGj1kor/txN2xNQ46o
	0YRwVf3rggu/CTsW8z4xrvMF+M5klK/GSffnSktqeekplb1Cx0EX0SiDZYYfxKWX4jzGl8EzAS3
	HmeIY/4RTPe5pOEN+ryN2GYOkau1p8li7IfZ5tOulXd99CGXJruPyQDHc2I+LliDz
X-Gm-Gg: AR+sD13O1NZU6qfd5ybeSql59/SYgQYxPLND/nCHFjVP8Jl1iUvaWVIQ0ljYc5c1WZn
	8TySB073c0ne081IljO6IB4y0kJ5pxf53NGDy06/NKqS+hm0iQecNVrCx5UFAO3nWtaBRTh5hwp
	HAI1BtvjJwLdECrfcx1bpivWo87t5rFxdOUbadzn6bUW3pdwfR9chjCZb4okuiuao+wqIKRDr5M
	+9j+bfnpgfVz+WrXIYlyLU+TBhA2bgQbsefCo8z/Bk738pVB+BR1Ks61Fi5G7bafvwt2ZC5JiSl
	YBCiv3vTWiJ3Nh6DsC7LdS0XcJ3S0MVPotERwxV2gQMA1fNwXPMYuRrFCnse9D6fsOOV7whl/j3
	O2Rt1nCNr9M/V3DjQj83Wjg4PhU8=
X-Received: by 2002:a05:6a21:4782:b0:3c3:75c5:48d5 with SMTP id adf61e73a8af0-3c42921e17amr4273349637.4.1784730244740;
        Wed, 22 Jul 2026 07:24:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:4782:b0:3c3:75c5:48d5 with SMTP id adf61e73a8af0-3c42921e17amr4273315637.4.1784730244251;
        Wed, 22 Jul 2026 07:24:04 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc7d8fbsm11231211eec.10.2026.07.22.07.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:24:03 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V4 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur compatible
Date: Wed, 22 Jul 2026 19:53:40 +0530
Message-Id: <20260722142342.990384-3-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a60d285 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=4B918gerxBs5-tgjyCMA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: dBNYe9i_kgQ4GZSnhBjymwjlu0ZWvX_w
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MSBTYWx0ZWRfX7zoacOn5SmzG
 7juWYEiWjjttxfDg6E+Tdr+/VEM6/c9qR/e9JjSCyxonVXv/2frHvb9xmElpDkbV8K9DQC+HFSA
 AdVsNZhuyfzc0mylG2+e/tWx3451XSA=
X-Proofpoint-ORIG-GUID: dBNYe9i_kgQ4GZSnhBjymwjlu0ZWvX_w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MSBTYWx0ZWRfXxGq/OKH/6DvK
 7E1stvOwIn2F69VGrNwBbQ8vKlH8Rf5N5E9yxL7GSnwDjS6nKnzpMf8gfDCmqokpqlXRIpkj4BN
 dyUi+O0Pqo9Uj+FUy8m3c/1zaBfljH0Y0Pk0NTcxlnG0gfBszboCryvvCyZEbGlr5JH3RSMKeew
 wwHARmwHWqgv4FKvuc7Rli4yKEmlchQJux3ltRNNiLOe9PVX349YP/dy7vrdZmFF52B8Aq7wnyh
 jJsi+9BKT1DFs3Q+FyC1XyhfuPr7nn75ZNIVA73FmRbDh5Y3TEkAYDIQ7/qHKvxPhk6jD5aCXeJ
 13FwBLeA071GOycZlT5ccC0tX4iOymMamtey9LRFv5XsOQ0+AETV7qSp464eHndLYk2FF6DiyAQ
 N4XZV4p6w5l9AWdK1M4G5m3vOswcC7eWCLrKV6VUAgKB3bYaQPI7AuOD0QPQnlSJC37zepdmG98
 rZDKTN7Ra70Wk5+/YWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220141

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Document the SDHCI controller on Qualcomm Glymur SoC, fully compatible
with existing MSM SDHCI v5.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
index b3fcc1673c10..5aa6b3a29ece 100644
--- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
@@ -38,6 +38,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-sdhci
+              - qcom,glymur-sdhci
               - qcom,hawi-sdhci
               - qcom,ipq5018-sdhci
               - qcom,ipq5210-sdhci
-- 
2.34.1

