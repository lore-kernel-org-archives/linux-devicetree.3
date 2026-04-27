Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2803E958F
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777314262; cv=none; b=O3HI06ed6rQdcll4b7yzmZ62PswDy5N/QYWDre7k4bO2SKQ0V0klEp0n0hhHW94tgs8mLvt2E2hIKnvhqp76npKBng3oKuPaJd24n4QXFkoDLPs3OcGmz+kraVQav738R8f0LZwVDIaiusTI4LUqydL71jhHO3vROLIjyV+LEtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777314262; c=relaxed/simple;
	bh=jIECr9FRaVu57KbuvYt3TlCekOQQ8yPcnRI61ta4ad8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lCGp+2JMWURr/10i9i/UPqyhgn90fFOIQaZwpFh77V3xp/JCg4R7Wja91EJnqDansGF/fkR0WCEJZZR094IrAH46zoTdrzIvacmERTXENziX/5MIeExIjuiLqr8+HcVK1ojWBJHBWY30grgl7UB6S76iAEi+cppD+JkrzJv7MIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fbiF6LHA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HmDUvxIl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fbiF6LHA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HmDUvxIl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCYRKI429032
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4xCZEaTrqVgdHm7nGx4Fm4cHciJDfE1deL6
	gWETpCwA=; b=fbiF6LHAawntygaEVyT35coUxxr9Ml3MWI2eevZyW3YCMV1svpL
	82m1Yk6eWx6Cq6GpQ2qlVn0U//ZzPO5gjJMjNXjARNDyfbHnHzd63RgEVA1SxkYo
	R32o7fGjjYWuxIyInhpe1ylB5zumuDKjPGzMmUxExG8PHmGbr/MxHSrwqLZksb+M
	EX3TeLo4ohWuTDsJdXmjq8Si/w79X5sUXIB+A6GEcCPFcO2ZAS9n1n0OEVrXfhhw
	UYAj/1cKfz08J2B4qKEul5EfwHnTzNjVJsfv7WKn1rJU4udEvZwv9cjGFhp2L5od
	VS0yz+XakWS1IZPQK2+h2TPTkz1AA6CCTqQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x31bkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:24:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso13257964a91.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777314260; x=1777919060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4xCZEaTrqVgdHm7nGx4Fm4cHciJDfE1deL6gWETpCwA=;
        b=HmDUvxIlt0pXj8BpXtnmUwNujFJc5c8fQTJysKfnH+Bexx4jdFixbC3PR9kGAIQNxt
         FHrJI4WnG21uuBqnM+RZh37TSQmOjalzMBWegwlY5y/VNFfeb3b1/hZQsPB3DQPO4M/P
         SDqUOlELSKivOLnY+ciPkVUkWUCYV1uQltcxkQKKZFc3cSatMDx2h4cV78C2CscKPSGK
         4W4KjO2q7XyYzD4Rv6glr69qUg4dYSm/iqseoeKmSF2ewVL97GKOqCoe39ZZrER1WkT6
         SNeVDomSnLXqxFYqHASPG8IV2j+ROxx/EEmPuaygGYTlbSj8RXv2a/1RS8m6TAzke+QO
         y+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777314260; x=1777919060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xCZEaTrqVgdHm7nGx4Fm4cHciJDfE1deL6gWETpCwA=;
        b=IDrZXe6N0+NE+EAJTSxNnIKPXRLO0KNjhL5wKiZPMehbXpopszi6HiXrc3s2NdE6Y1
         +7/7f2A03c7ovqkbIGCDFyIyqDWOT0bS3LFAofoxGKe1wOCEr+kT8l1e0wwl2qj6wfql
         63b205ywgSTFxN6LA25fZAN1EFXrMj1irE8sO/9ZMBJaR9O+j9RDaJ75btNKsU4BAdKi
         zu+VYuaYRTQ7qqmLZKzlIwFEee8Vjo0qa9qLto9+BtnGkgDn+WOl3jS0qs6FvjUPFg9g
         B0jmhYallVLaqwGwoG70pd/kOhkLuUzwNbLEctUMMjgTobsgBwFCIq17oAohLMJLbSCE
         O9xw==
X-Forwarded-Encrypted: i=1; AFNElJ8j7I3FyzaCYehNsqL91lJsAwcMjvplVXmu7yg2eg1tOfgMScraw6Pet7/xhM9JLuE/brKM+WD2KhK3@vger.kernel.org
X-Gm-Message-State: AOJu0YxNUeQXcSwHzd0WN5jq69xqvzdTDXJjJkh5WUYcOywvLr02lQVW
	QDaNwwXA17ItCwVpFgdzYIezha8ETNa5GrnL1icH7I9VoGjrOCdcpHknG96RqXDCueWSXlHsDYF
	e4H4jO3iTovb9p5EwqhT77R2O1WQi3/MSd8u/xUk+JqvxQCEir8efYVZLp6kp0kAC
X-Gm-Gg: AeBDieuHApDEEao5GSJ0cxYiFaUbaqzMTLldYVHXOUBLiuGgAqkwdgW7M0ab5XEugie
	PZNj/jFxOY6CrnCjI7Cdkj55MplQke2Qs2/HUhQ2lVSIgn/bMXGZVicGZdtEH393nw94n0nGec6
	PhsB/n9nKqkpOeBaGjekmieisbn7ftJW/nHtfjXlSMAguxpUEm2lnnNjn5v36sr+xi92g+HJy6O
	xYHoQHf7Z1Rv/Fcct9zevr10aNNRIL5P7vh6DUf2t2xPl4JcL39mb/UL8OaXtaKDuVBneOqSSmw
	oMj6fjj/q7GjoYky/OKSZXHnyhR25u7/2oB/xFwVZh6jwhr39ehr5HWsrDwtmYLqkxASlpisdSE
	hpRiv2C/+es1U89yKegDLDpl8vOOuHLwiGNQjEaJrxMghtTn/NXPKEDeo4Js=
X-Received: by 2002:a17:90b:44:b0:35b:e553:9cc2 with SMTP id 98e67ed59e1d1-36490cd3a9fmr172365a91.26.1777314259586;
        Mon, 27 Apr 2026 11:24:19 -0700 (PDT)
X-Received: by 2002:a17:90b:44:b0:35b:e553:9cc2 with SMTP id 98e67ed59e1d1-36490cd3a9fmr172345a91.26.1777314259040;
        Mon, 27 Apr 2026 11:24:19 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3648fd6f625sm326528a91.0.2026.04.27.11.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:24:18 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mailbox: qcom,cpucp-mbox: Add Hawi compatible
Date: Mon, 27 Apr 2026 23:54:12 +0530
Message-ID: <20260427182412.3666971-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE5NiBTYWx0ZWRfXz2pOFxj23est
 mOv6yH1RqiuUN04cCpv1uFvdlpHz3hHlzALKOM9/HEqFoHOqlIyZaMByKW/8EwhEetXGJ0b5SLF
 SgOkJwlaoR0qMCI/fbYgmbQiwiGIjvplLgAiD+9X8u+1idPC5UousAAvDSpCrJ7QySCWacA64Sh
 XiaIAty+nspZbSmdAshmYLt+mbPQ6ASm90MWOoho8VQlZ7JUGW5j2grevgYxwkSgqasO2+DroZJ
 xtkLxKg76ZoXoMfmG1tdYsNLCnmDqZrgULOeXrIX7DEtvcNKnOIGVV0wfLmhAPjhKH3ai8lPKB3
 BrB47sztKH1vnPeJbxh5d5TY8enXbADM4tf2HadrEjBKnIYjbEhF5TgwKfjJoRG+hKyhA/2KUvp
 vy3SACaxR0LoL1W5PjMmJFLIzlIuXUqYR4TmxOOgYm3/Bfn3r/N8zd8dFjPEGiD3oph6d20Evjg
 IaE/LBITKFVA9Ns/MRQ==
X-Proofpoint-ORIG-GUID: Rjp6rmCJiu124ik3j8yqcRIj4pjIZ8cG
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69efa9d4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=I9E_dBgcrS10KifyaIEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Rjp6rmCJiu124ik3j8yqcRIj4pjIZ8cG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270196

Document CPU Control Processor (CPUCP) mailbox controller for Qualcomm
Hawi SoCs. It is software compatible with X1E80100 CPUCP mailbox
controller hence fallback to it.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 90bfde66cc4a..167ee222a163 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cpucp-mbox
+              - qcom,hawi-cpucp-mbox
               - qcom,kaanapali-cpucp-mbox
               - qcom,sm8750-cpucp-mbox
           - const: qcom,x1e80100-cpucp-mbox
-- 
2.53.0

