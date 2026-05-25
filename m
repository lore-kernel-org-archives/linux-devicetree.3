Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B4F39AD39
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690377; cv=none; b=kk2Ss/HmtzrzsBf9OPjNiKiFhEIfeCZwu6mH91VCAGwW+hz2R1FEtT9zMw5R75M0WpZn1v+ICMG5w5Fv5uTyT2W/5D4LrwDfMtI6TUMNrF0JRLYTDN7l6FJlNF9Y3U3LKHHuzdFHFvZR2h8v0wrWPr7Eyc/ViOuW0Jg5SASwqtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690377; c=relaxed/simple;
	bh=L00mK2raJrV6y81+9ruSkaadJuU9lHh8SwKx0G1dYEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FBGeIGtDyKlERHE9U29QUtKsFjrF3dlz4kDy5yoFEdkAUB5R3AeyY2kN6Fj67T3bJqqjfdNzxg8+oK6wk9+Ss4ETPBlFq8Yygbh5fyWnDUXbxx4lO4f1zsyvuCxAb9mg5ycBEcygLRnZKQnXxhLNUeccAFschd0jWkxHG5iIQsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g8KP7vKK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QP5dmy4x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8KP7vKK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QP5dmy4x"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OMBTBZ1871835
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eYhzqpB2/DI6hoFeRTv2jv
	ZcHqK4Bvk2u8nJ1PNwcWg=; b=g8KP7vKK9EyV7fdtXf69d7mxSvB5K2JI8itChI
	NDy7G5M+Hc4vFgMuZD+biwSRWV0yBn3kxkH90zR8gtI0QOn4DmDV6OYyDkwXTgrI
	MnhEfpYxBXIAmSlhSxcLYlRHPIsPKvtUSe8NcED5uqge547Ri7YJPeMFm40AbSBx
	ETvJGAVHff4DDelTz/IxR8t66SuNxQg/ETLAXpIIYER/w4czvRqbeepUCRKJsL32
	ydQgXEdNstTtGD/uQCz+zrZLVhWsc5S4btob8L7/jLc11mFKl45SGAh4GMgK6usX
	dQ8PW/BWw0fVyyUnn5J9ZYuYarkCwi4gInk3GhQQYcXt5Rmg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0vfw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:26:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc763c7256so206034875ad.3
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 23:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779690374; x=1780295174; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eYhzqpB2/DI6hoFeRTv2jvZcHqK4Bvk2u8nJ1PNwcWg=;
        b=QP5dmy4x3MptFmixhielpmxEHmWup9TCLxqhBV/Yc6v/l/oVOoXsHBmz3tB+wCPc19
         mTIk3WyrqVd5xfBBDFOLFWGTlKCSNGTMY6KrawixlfRyd+XDVymkhp2EXsPag6hXSLy5
         TzEy40DHiBiY8v6mwg3x8tL75ymCJzVqgWNd/26MQmcA4kYq+zZoQmYgEIdruvkQLaGh
         Jey2exA55qBJ+DPX6UZX/+iWD56jwTId+1CMS1Zlasn9famLPFHWmz8TtG3o9JktxNlR
         EAZUqUDZXSobdAXHTeamFKunibKHRVqQXQqFLrtKQ3/zCCy9DlIZ+ey4C3IwKpgMou3b
         hwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690374; x=1780295174;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYhzqpB2/DI6hoFeRTv2jvZcHqK4Bvk2u8nJ1PNwcWg=;
        b=DrQm2r1H+2ayHCH6FJkGjHxqQhn/GlFYin63pe4LwRE8wqsl2uogww59IWoEjZBPb1
         9GVdQjEyjSUftaPT6NShUSNyaz5wNl1xYBCd9jWRsN3V79hbOFJO8nwsAfFjlhwOWeW9
         Uokn2UHMooegDkcvQ/P+yL7cRiT7FyTA5dw3H/eCl04+ts5PZmCHzA/7M9WAbvjFkDCv
         zkvmGfa8eXA8dXgL+HdnTSpSbfaLkf830UP5VcI8LRYObdjcTxawS8fTeuegov3qjVQo
         QtXbitf5E38pLZmr/fwgq3B2fZVP9o1uGuGhVFt9ceUv/uVbAD5s6HXF/xD5HgYVOMre
         xRGA==
X-Forwarded-Encrypted: i=1; AFNElJ996ir5krM8wK/K2NuN2cbXJ4HVhjtmx4KsXMdV1SCNNDX1V93BG44+V/dljAO+Ri2vuAD0qqV3I9yY@vger.kernel.org
X-Gm-Message-State: AOJu0YzvtBzQ9NEOEwj9d8mFERQ6UgTmRnRBJGwqfvTC0rA7esuQMcUc
	kiS4Izy2iQ50GfNBFmYXuDwp1Mq7RHeHgu2txJQ19MJ+/PkrACEbSyyJt3bWxHjoXzTdy+7lYEc
	3GFy3NUl5vKdRX5MqMP252zwY25wi1pk3CajQapg7SNc1GbtvWTpAOnF5c4CozSZC
X-Gm-Gg: Acq92OHIyojbIPBPOtrEbhhGhPCR/62MRlCj8gLGV+tX1LyZMDdMcIJgDBpj2BA7W++
	0TNFxZMpJMig69Xzsbi0LL5XYWsTtGoL2dP6SqPsc2XttR8kXpXgLEvYKp/bjCWE0BbCoCQtFsF
	2szLHY1QsWHFPGQCx3t5gV50/nfXALzYex8cE/bvIBnIEmlEzeN6nsb3iRY/IBI6BpGVIgY5aF+
	9MgiqJvTlIJJSVeFdkKUevbCCqpcSs5MhgCGAD3V1pIFwIYNd5/I+AzZXfelNFvjZXvI503nW1/
	+0xMgnk6kZwCIUh9tgCFoyVKb7fG4zCRmbT+y/NU5KdG500hTTlYJRwRdKj47k2LS5CHjWl+wcW
	4v0gFJuBQy/3NI33TjoIVpQyP9OJAM4BaF6qHkQ63N/wHLF1Mcl15V+0MInX5jzbEX0po7Sf2xg
	DQNwM8Sq00mNRXBCcW6+HE61d7tw==
X-Received: by 2002:a17:903:11cf:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2beb076ae28mr145177055ad.35.1779690374303;
        Sun, 24 May 2026 23:26:14 -0700 (PDT)
X-Received: by 2002:a17:903:11cf:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2beb076ae28mr145176765ad.35.1779690373801;
        Sun, 24 May 2026 23:26:13 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58db58esm80174405ad.62.2026.05.24.23.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:26:13 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:24:00 +0800
Subject: [PATCH] dt-bindings: interrupt-controller: qcom,pdc: Add Maili
 compatible string
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-maili-pdc-v1-1-2fb03a977cac@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAADrE2oC/y2NSwqDMBQAryJZNxA15uNViotn8lIfNGoTWwri3
 ZvWLgeGmZ1lTISZ9dXOEr4o0zIXqC8VcxPMN+TkC7NGNErIRvMIdCe+esd1DdIYsMrqlhV/TRj
 o/Wtdh8IjZORjgtlN30KEvGH6iwkfz/LaTvtU3RIjbX3VdaKsvHJ2tBic8UIZCMFK71pRKytBQ
 /CIbDiOD+1Vau3AAAAA
X-Change-ID: 20260427-maili-pdc-71a488a96973
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779690370; l=1042;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=L00mK2raJrV6y81+9ruSkaadJuU9lHh8SwKx0G1dYEs=;
 b=DN/fUjgTJg/gDDH8u923TaoqGXaJGznmBut3NUWYQ8adqLlO+k+f9qBN9HqEiZh1eJTlLJqHV
 4EYNs69wi4nCIdbH1VRfBRj7afDBhDdxQ/bVONyydM1yONXGBkQsWnx
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: u3fQu58osggivWce2o2e7MKc5EB7hbb6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MSBTYWx0ZWRfXzTJ8V1Na+VeE
 b+m7yxYLu2RC5U8gr4ZzZf/62wgpHl6mqmuP7VgT82iwEfy0uNWSTl3NhNXGLurmcX3fLBmPf2A
 QKHg3rAhISrOWb5VWEwuJH3C3c43ZrYDfMGjpPs0nWy5up9u/TbX4zVyDeZU7Z48Chk+ziGFZSF
 04XqgmHcsqMLr9JO2ZtcXTXlT2nnNg9cuKg0oM0kDOIN1K1C5oOD1THCwq63npuZheQdOme6iN6
 txgFBhGXOgQ6hI2pxtI1zOlyUbb3P2OX/6F81Ab0OIOG07aVvDmJ3I5OhYbSAOrWkoEfCe6kTyr
 iIIvrPbBP7xlKTzI/J46qayuEQyuvL8RuYHjbryaIhtfTrVssfs/NMrIFFUhinPHOfTJvf0IQmi
 76CdG+Y9yyVOZVGIR5K+k9s3KXLoevCX9AHwh7YuNLYhO2956VlHgWMsgwxSdmsF2NAA/jq4ddI
 PLncc1ru3UilDBfSYeQ==
X-Proofpoint-GUID: u3fQu58osggivWce2o2e7MKc5EB7hbb6
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a13eb86 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0TWJLbmp6Z9Bekl7B0cA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250061

Register qcom,maili-pdc as a supported compatible string for the
Qualcomm PDC interrupt controller binding.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 07a46c5457a4..8162a49d49a6 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,glymur-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
+          - qcom,maili-pdc
           - qcom,milos-pdc
           - qcom,nord-pdc
           - qcom,qcs615-pdc

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260427-maili-pdc-71a488a96973

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>

