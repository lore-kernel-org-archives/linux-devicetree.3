Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2F03BFE52
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 13:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295322; cv=none; b=q+NE8rL/qLg0QwYtGSv2Bk0t9PuHzQhaJ52esE5A0RV5yI4Q6xjyP94tVLTI7njgGyFNi2kjT6j/sG5/7a++EY4MoEGFy02mdKvSpY0i/ZHa8ZICUGteGzt6WHVFsVbCPEVi0QjY4GkwgOYZnyIPsOqCP29b3u2svkD1rdbjA/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295322; c=relaxed/simple;
	bh=bYEDqLi6qPW0dgbf/Y1FdsU8MdRIBIf36XdPshrzaJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SpZwkgVKA5AsvaKhdNERiNZTGUnXae5CxLmtqeINFx7FNI7iLcyWM5DDW4PaZgtnBoXKlhcMXyx4+SS6Qln/vwVLg4ZlSpvruKVQ0azNTqoAGE3yhQAFjomKiy+O8XaxqYUdvZAIsvXAHaRcDY7dvLiJY4pnOufojk6FpEkZyy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jvHzDYIL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IyXveINj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jvHzDYIL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IyXveINj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TBm73639698
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 13:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=H+Y5uAXV+tqyuH7W5XQAkDrFusw1OZRnWhK
	VyC8rdg4=; b=jvHzDYILERWjaQYbQJBs9K+DrPZIIKCT4KJjcZ0Zqy8h31AlvTm
	+BC62eAjwjY58qS0HCUAiHZFxWMWEAWnmA1IRExYvfXXvLVR+Hg9+xavNgxPqgqb
	oye5+kTbLm5P//CVBu/Rre2l8dbx6IzYfpvMv5CInURbyzL7UTq2v7DhMfSsxvVU
	0CNIckCullBflV8ngIhGZa9LubXBi9ieH1jY7/lg0bYSGI7sSNgXNPxpaR6rhA4X
	hHaTxtoA5NQj+5xfb8f+jhTFXb4hnJOkw4zh+5dyEZNdCKguw+6tWcDfdLIHsw4y
	bwzPlIHxpJyK11YjBpwDAh7fvFjGfNiNPqg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsya025rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 13:08:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2da19227bc1so24434247eec.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 06:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777295319; x=1777900119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H+Y5uAXV+tqyuH7W5XQAkDrFusw1OZRnWhKVyC8rdg4=;
        b=IyXveINjigLZlgFOMSu/tkWRT7nuD5khNlpDujbn7ithJfZU3KfvXQCJ9fmszbPTB7
         a7j35wKg56OMyYHbhVJYAs61t73eG6kvbQn0/9EIbaXrQsgX2zieWyM7kgAyqqOp9RhC
         EPcadfOcYYyiQIZgqvjMztMPiuGchWUMl8vvuTtJSBFIWg1HeXu4Fwe5zLx1HL8sdFsz
         8Kyi/DFVD3Xz5Lb2ZMXHkkJFcoaoVjiYFTkWfmXd8UYx8tZ0IJWFLGpwiwIaxX3ocPFu
         RDYjxR+zrXcxA2MHIbC2ztvmhWNKTpIeBahdppZzl5ofqH3s/wE+MmpsWQILpgccALp5
         TUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295319; x=1777900119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+Y5uAXV+tqyuH7W5XQAkDrFusw1OZRnWhKVyC8rdg4=;
        b=FqwLWWqAy2SfLXCiqAZEl/Xl3MfSsdgs6jsJa/A69zzWyk9F6Z6jhtjopuC5aUAcmm
         BgopJkJONmW2wbLxLWMo+dBfld88UAkwncWgKMX3PXQv47gBLnk68Ys6NxGlQamMdj70
         6CmXbc46b0uoIN4xqDrP5f0ryLYVfYz5aGu4yk/Qln4uYvhKrxPZwEZPFYd7ecUi9/Nt
         ZJnF5wj/jrc083ekMk2ODSAx8vwDi3HOzf3GzEm53ZB7qAMEeNc3cF56ZSPhlR3tYbqA
         ypGtqX3gkaZKM+0OovSSqgNSSPsvLvj8IqazaKKP+4Y9bf/jhATlvvhP/MssFdgHEAkt
         2miw==
X-Forwarded-Encrypted: i=1; AFNElJ+1KfSdUH6GJLUOcvJcNebk2rAws590YJanS2b5mrQEp1yZo/DMIrI/q3VXcMKVhusD6MP1iYH4x9yy@vger.kernel.org
X-Gm-Message-State: AOJu0YwUmHMELeMkBdfnv+fsnzl5wSdKPG+RQS1fGAp0Pk4ia5NcmiSp
	Gn0iPvPXO6lVzhISsx82KC1ka6sQPhv32i8++cHCNLZaqBY2hBXWu344CiF6LztswRPOVqRptMI
	nGdseRfiNvUJVJfQmnhaKiklodOQFHHl3xGUZjchK8akKLcThBXZV3NhdlD4A6alT
X-Gm-Gg: AeBDiet2XMniaFPMKvVBBdRKTEvS2ISfcX4d3ECsWj2if/D9oReuGDpnliLlFPBcRVR
	GroDv4Vgnd9m0++wZoPmV1eZMskUtzyQM5/Now7Atz/hST7+PaBzaLI3rEfQDWJLL8ri3EBDXXV
	mcFAB3zrSud1Q+WTLG0DPCDhkaW4o9KaEVEnnX5sz+OuDpw4Obwa6vv+TgPvKM2I2Z94O0MLawS
	NcCcffQy08AzyH4OoHMUT2ne04VzOvw30JbLMXdbQshkIoGXPqomdumr3TcAo3uPVvBSe6GEI6S
	H2L6VjQtmfghnSRDqiDgH/f8jGN6L2p1SePUUEIAJ1rGGE1mShtw7qH/gSg1NL9kfD0VmWussC9
	SS9BMrbGWHvL5SDdEHDDuirr/c08LGnrD87+uJoMWymZiz2zbr4wj1/dHnDcAJVs0mdOYOdMsBf
	jYi7og1ahpG+SGf4A3
X-Received: by 2002:a05:693c:2c10:b0:2c0:e404:8b08 with SMTP id 5a478bee46e88-2e479418ac1mr24440311eec.29.1777295318476;
        Mon, 27 Apr 2026 06:08:38 -0700 (PDT)
X-Received: by 2002:a05:693c:2c10:b0:2c0:e404:8b08 with SMTP id 5a478bee46e88-2e479418ac1mr24440283eec.29.1777295317797;
        Mon, 27 Apr 2026 06:08:37 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e79c2954f6sm49584851eec.30.2026.04.27.06.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 06:08:37 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 RESEND] dt-bindings: firmware: qcom,scm: Document SCM for Nord SoC
Date: Mon, 27 Apr 2026 21:08:00 +0800
Message-ID: <20260427130800.271146-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: M4IKXJF3ftqZG3fkspB5Kzb61EnMvz1q
X-Proofpoint-ORIG-GUID: M4IKXJF3ftqZG3fkspB5Kzb61EnMvz1q
X-Authority-Analysis: v=2.4 cv=DZEnbPtW c=1 sm=1 tr=0 ts=69ef5fd7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FSRre-L6ib6GMKEivIYA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzOSBTYWx0ZWRfX1nQ1Dyr8pUdV
 MTH4q3lL8PqLIT2k19MBoojXfHCs6qOrUdpl8VMLeQSBLGuYI7SYYIiVSlBt8sKqsGCKO1XGRdL
 B3Es3pHWkcE0pSLoXeDcgoy+ikmjvwvQcK0XjHAKHTN77jLLQ8VYZurPOlKsXKCkhFXe/hcB2W3
 pgVgt+a9AC0Q+tZjrMiVHwuJ0yj5c9CPrWOfFki0jAAsYChaXuO+CNW3ee8Cd6RVb5Bh70sPqy4
 HfRkhf56fwrxwwVYj8ZQMDuOwaaAaqqJCnTw1Y7upAXh4rIjRTJ9y0RQX5CWEJaDwnZHY+jz/R3
 QO5yuWZsg6+97eB4ewBEHHnJLrvNgRIwDeBckFcIDjL6jz6NU12+FX5G38dj5OOZc/DQK45SsZ1
 V5T7ebQc4g2q/aG6BN2EHvtBAtxsbTXB5yurB4jltiCVVlRrdlYEbu3aKQ2e0s1IIews6SeF/qE
 c0VgkpCphLdCchVsSDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270139

Document SCM on Qualcomm Nord SoC which is compatible with 'qcom,scm'.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Resend to add missing lists (Thanks Rob!)

Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420023243.1239927-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 7918d31f58b4..c9590ecbcd2d 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -49,6 +49,7 @@ properties:
           - qcom,scm-msm8994
           - qcom,scm-msm8996
           - qcom,scm-msm8998
+          - qcom,scm-nord
           - qcom,scm-qcm2290
           - qcom,scm-qcs615
           - qcom,scm-qcs8300
-- 
2.43.0

