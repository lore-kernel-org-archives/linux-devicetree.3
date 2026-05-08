Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6555637C0FB
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 07:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224836; cv=none; b=PgbLIQaJFfUrLyGdtB1S/Hf1TwY2OcKEXXuOUaCQrdOSECsw0tniy0cMkmpqycu263IgpNDKOLnHMxTnvu4Of8hXv0OMnWWJFQRx6aOYF/Zsmdp6BL5R+wsr5n+xJWSUH7TJXUkrKwGQAwcQs4TlhvUObumSuJ42HcGCyLG+DVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224836; c=relaxed/simple;
	bh=vcmzycQO+v5rtn0fILDKSKDqMmq9F3JiK93nKYTWSPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LNL2LRYyoSfydmMDI194od1Dyi714l4aRpTHeLU/gWRf1TtS0o1Sr9f88HZiWMEADbHS4GW0RBBRvvDi44ziktlASaTv9CfCaq0QLFXwDMzyHM/7Ad+DcjWbd33peYzp/tnUe/fr4VHHoGT5y1fseBff+0pAMa56I/DKzWkOKcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QxB9+MJl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YOasgvkg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QxB9+MJl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YOasgvkg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485ZsJQ2198887
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 07:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=; b=QxB9+MJljPVnawdG
	M/+h4hAmLTG4cOd9pwv4H+jiRNAQsDgZpMctJ/KAp3wcFmpPZp6QZTCfWBP3KM1C
	2E6Fkz6Uiyc+lVz7veLs9lYp/kDnC6XEIBvK55eCulVfSGG5oY+aEgTVsqyhBv7e
	Gx7spt8ehYmWnP/rpRiJSLP3nstDTCn2wqGYyvCBN+9eO7uCbdFG8xO4OEstb60X
	54QV2d7ThLR3tv9S335XoTYcyqLgmtp91C3yo15CyZ7ykpRejbQf2sAdvSxdA0aa
	yd9CQcYlCH9Q5Lnil95GmQ5oL4caF1MrF5u/fAaeW1sErwWUqLfSfKyH7n0X100b
	hgCL0g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sj3tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 07:20:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f7bec24fdso1109034b3a.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 00:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778224830; x=1778829630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=;
        b=YOasgvkg16y2VI0K9uZW7EAtZIgL3r7S68xHP2QPLMLVBCIk6fuoymSgChXc3q4VZB
         N+k4jYGVFPgjOk2h7ABSseB1jZsc3QzN8fK8sLEc+VS/gJuFaK1iixdzYSvjP/tgHXYt
         HKt/aTHo51pGdJ7T/yXjGmt8ukm3QQcRuIDlM4FjeQSHb65uXJBZfPVlaXC09jCF1Hcg
         c1tsLQ+Uu2bMFkaavZDXZIWd5x2n9yCzO4zo2Ryam6U52Zs/AKdahzX55lziyVgSd/12
         YWXU/YzO/jDl22N0jxpHyJpG2fW+9am/DDxvrd69VLRfluiyCdiwLRn4CSoTUv4FSMIQ
         xdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224830; x=1778829630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=;
        b=ga+s7uWcFy8oPao+DgiULnVeWaWYChrvWxRWOoO+9h2/r83ienc8YF0rX5z+jjaS8D
         TYA5ZKo13Ci+Xw7x/Ee5JMDo7EhaXStJdxYytyJQDPeJbWLvWcBlYsBlBfC0XzLgFuq8
         Myyy5wd6gvBzuTXRleVpDJ0wo+DMNd0yBlzKj7U4/GgymrxfPYsKicDajcducqlulmpC
         kBTnlqJJXJPPPf85W5W7H/Y5+E9LmJLN5lcoyHhkkSr1v93VAp9+bxjm1JQQmEkQng8k
         J2zWeXk+5S9K6F3qbHeeEhlczVI14/H5PA/7+E2xBK+gc4yySonv7WHxgoI4frXQTQ+q
         TNKA==
X-Forwarded-Encrypted: i=1; AFNElJ9/vRRYyDpYEpm5A/qzR+3hAyBo6jZkjKY8oaibv1on4+gZXfvZ8ovDwa1DhblZVOIN6e07UJqev67t@vger.kernel.org
X-Gm-Message-State: AOJu0YyUjwBuRBsEaCaTwlif8ZswkifHkVadth109rWD8HKar/oSxcvB
	tV4z93aSauNac1pcjpRf6il4Ssyxn+Z4hxl0abf7Dbyx5vK7+NS2mH+wvHyspabVc++TWJK4izd
	XTM41ljM+QGr15Gxn1/7LUrDVQan62rkTroljcoRYAKCICDjNWF/qVsPHPF2MIYtS
X-Gm-Gg: AeBDieuEcBdS87Q670+SgrVm4vYXJI5u5c8zYJrY1AWTv4m0OIPp+pO8eo7BOei6Yj+
	kQruT5z8c/4kOCyiYVVD2pFffZT/H9oammOwI2oV62xftWHt1hKQCeHjAcAAunxRpxowhky+E7W
	Yvf+qIAKYua3g1zrzwRPw8vSH64bpUcK2HPpODyAEd353SmdGf495YUC/d5ykceGYOI7AFIg7MA
	x8fi22i8DMLojNe5H1jOmJNW5fZieYAMMQdHTDwAHzNvlUMiPGJFG+/AgITXWjx10AVGueUmIOP
	xFPTQQe0uq6/Fuo5C1uOt7Ik+jD4e/qFbXJKCJujU7Ki6i1yPTLdh5jknXd7oNeUWHpefhlQKnR
	FGln3CqiiJ10VkzItFSeMu+ypaFEI+P+MN4B4YiNGTJXnscRKVdg=
X-Received: by 2002:aa7:88d6:0:b0:835:3f51:730e with SMTP id d2e1a72fcca58-83a5b8d9aa3mr10154891b3a.13.1778224830492;
        Fri, 08 May 2026 00:20:30 -0700 (PDT)
X-Received: by 2002:aa7:88d6:0:b0:835:3f51:730e with SMTP id d2e1a72fcca58-83a5b8d9aa3mr10154858b3a.13.1778224830011;
        Fri, 08 May 2026 00:20:30 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659498f1sm14566685b3a.17.2026.05.08.00.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:20:29 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 08 May 2026 12:49:48 +0530
Subject: [PATCH v2 2/4] dt-bindings: remoteproc: Add Shikra RPM processor
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v2-2-ab76fd9e71de@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778224815; l=962;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=8hvVNB5nM53jnXbcU14D0R9X7GK1i2upQQ1liBM2/Vw=;
 b=SY7al+FzmbPqgtxIw2UZvFg+y6TYh8haznJV5nPQYrC/lu9u+AiqG1GcsIUfdIc344Ccg/C6Z
 pk0q7bV+pkACvQuykoOcx0Oc7FOR7nb3du/r/S0/p20QmB/EPOVCefb
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA3MSBTYWx0ZWRfX3jsRD0UX8g89
 XAfNPJAe8poGb1x19Dc09ocz6TPjV8P88Y5KB5VfDFzLN/8KRtPi88GRtUgR2Z4IvhCCj82mB73
 DKlEfkgA0qnXEPZ/b85soYvv1oMSwKwmKbNDFQrVtIq51sfyvS/JhDgrprq+QsC2crpDMQwdbf9
 peDGsPOH2HQVjZ8ehrzbSKLwr5bcew7RzdE3V/uAn6qUQ69KY7C7SvSeEdSOhmZM5hkykqARPtp
 Qmsfgty99ZOiFv3GGN86RabVM08k9ndDpBGW4bIHVx+/h/P86xaBhdPGKOVQgLHh1bm6X0aaId/
 A6A+Td7EGedGpM6UayPyXkGup96m8aKQ41tP9V/Y3/fit00NvUpg0Y0/tL5GuwoetoJHNNNXpWM
 R6Gng3QinAR0HC3j3Q99Pe76WnsbbIhwGG/7X9bvbryUHOAdJ4VaeQQO33BBALCBHI2jbpTp4ZO
 hNQ7mrCLihCnljuzNqg==
X-Proofpoint-ORIG-GUID: Lv4Kb3GD_si6oOX8ZSctDlI1X6herR6q
X-Proofpoint-GUID: Lv4Kb3GD_si6oOX8ZSctDlI1X6herR6q
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fd8ebf cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zr5sphF6OBxrw6KR-80A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080071

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra RPM processor.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
index 540bdfca53d97d9c18fefeb50fa68fe704b2008c..823304afaa98f8acd67667c6aa3e36ed743ef554 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
@@ -87,6 +87,7 @@ properties:
           - qcom,qcm2290-rpm-proc
           - qcom,qcs404-rpm-proc
           - qcom,sdm660-rpm-proc
+          - qcom,shikra-rpm-proc
           - qcom,sm6115-rpm-proc
           - qcom,sm6125-rpm-proc
           - qcom,sm6375-rpm-proc

-- 
2.34.1

