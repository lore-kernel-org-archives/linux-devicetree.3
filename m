Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3A93EE1DD
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 19:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316786; cv=none; b=q0s5ZM7BinW9Cx7jDjOjPJFzgDMmU4BlpVhwkn3FZkNab0DmOX2zHJscJeznTtHUWqmnFSBIDNgWuoudXIyIQtb5hx6v5oAnaDkJcgJf7XBukrFZVxjD0qGhi+Wx8TaKI+ItcxDvSHTn6x16S40/DOzv/7nnqWssP0fpjEB2FCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316786; c=relaxed/simple;
	bh=QKU4OfXa0TOEBsC5JX3T4fZUwzwDcxMp3Mj/5ntsANk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RCM2rQA/Bc+ugdK1f6IQpqvUmdyS0vsiGNOynpXsh+ZsKJlhAlBOm6l+oGGIo3MP8XMXnKJ/5oSXtprFs40ltPCn+UMrYQzBmP5BYA7omzfNbYyfBFKsdL6d7r6z7F9jkB/5paldGFkC5cUwnY4p5xOESyyUXAZzWskTnCGDXy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkXOJC3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cao7hLRS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkXOJC3S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cao7hLRS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCpFb52383098
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 19:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UFAu3zBWkMxN96L2kkrvsJNpW5eSvMVSmG2
	pqDdD6Vk=; b=CkXOJC3ScnF1b6LvFD42qEMRXarm4bMQiX1VBn3nxTl13qlBk/c
	7gHn5nB/HzOA0ZAk2J6coKiWslajHQRFBN31gNhiLFRUc4a8W+S9nybpBQg/p1TD
	dxjALWh1APriYDwW0kbD8E7vBFBQ6Wfkxv3vtXqCN2zXIfOPo34jCG5OydGLCmY4
	RQXA/9by5lQdoUerMegcna/AYFCiXY0yEvNy6BcTnum61ozqEUhg4Fu6E/77a27d
	cLSDnhDKYMdm4wfUvWvntV+9J9nkmORta4L7VL0b+tMC18afYj2OUL2yNvwKJP+C
	2E0XvIFYbRDPOcSjo/L6fqc1tpZJlBMtKZQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt85xsew7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 19:06:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-362d9dd9a49so5023163a91.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777316784; x=1777921584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UFAu3zBWkMxN96L2kkrvsJNpW5eSvMVSmG2pqDdD6Vk=;
        b=cao7hLRSFIq9WFBOwOaoGeb2HgL2rMuTcV8m46IBj6FhvdFJQPrQ2s7WOn83l/DKCF
         0dvsgM6GALYCTN2BudKuna4qJnQvwD2ETBt2HUu4o797oCYQPfrZLLeL6yAw3FmkeEMV
         mHsgewTE0iJ2KTzT+LzNgkeSKW0eBaHYIZ+TC2nl8LPWZkI4biVxa+JG5KTDWdAg4Jr4
         vICOtdNVOtzGXluR8gKqpe1YMLYzzKTtjcdPHvxu6Rm4Tox7GLHlz3/LkzdHtoVIgtd/
         +HFPd/oNBVP+vfvwzCZ5W75z86v2CkeU8C4Nf9a61xdfLkzukXsLGwvPckKJlG1wWOCN
         aAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777316784; x=1777921584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFAu3zBWkMxN96L2kkrvsJNpW5eSvMVSmG2pqDdD6Vk=;
        b=LmWsqXf2pbkW/X3cjL6lS+qnfU8L2e4y8z+kP/8CHXsqw486c4TNN8sNFe6TSV7WUO
         AbDbEafhdBSBkJd2eIEfSqlx+2WLTtfvq53rk89lQVZY6eT+/JIAjZVTugqUcdJkujv8
         HWuzm/Nvt2XSyBqrZw98Qu0WGOuK9TOgNxGtP+umQqWnnIZNkFir4lsOJFnSNmwUdx7B
         OEMg2l7Usg7kFTOCFEbplhuFK8Mt/qpd5Z57fcl9naRDiLELbmLQaXl+3szT2DUCooSZ
         zK/d4QO3S6QNHi1ycGgk0Z9fzvJeBzkX9hZREhyIsHrtt9W1W6qyaHAEe6xtA/L4B6ST
         ZmSA==
X-Forwarded-Encrypted: i=1; AFNElJ8UsjgqeECV2ZxRTO76R1TUWrC8ONTWcKPnhSDb0aNHjLrwOvdWdMhhh200VUhNNoxe+CyMmucJcx+X@vger.kernel.org
X-Gm-Message-State: AOJu0YzucKTCu7Yph2GPYiL3q8nBMF7+j632c2Y6OffEhAbPC2jQ6EOa
	jGvqU0TtWSExUyPclCPgydyRCxSftOBrOOZX9+XUNBZdjOFf40TMiBngjpZSphck3LMLelcAX8o
	ylwxuJEHqDURmG2NEIlxgOjBw69JxaW13PjJtteTedNA44sT6UT2ThLrtPk+yk9Jz
X-Gm-Gg: AeBDietwuLWjm4j1tfWvBlzT6//Mtr1CThu6K6jkFJrA8AcEGeqNLUgNa9BMcvUqH2h
	mx2WbHmo0mHu1movOiZbinh4OyvaEGml85V4TCbxTdpY9D3MFoJrC/LXisCPkyffOZIrn3DdkXd
	M7Xkgc86vQzfCkkmBKIjnpz56xoxtRVEwhfhOND6RzfRwc4sNMHbGT+lYmu8mFh3u18jgZOKXWU
	xFlOQDVFbhVaIRn95lH9YcJkQ22Xnl3E+oTueT7I7o9t/wh7MdQWKd1P/jyJX57nUvY/IHSczvh
	bZexBj54sqywVi3VCFclkyMwMj1XsvFhErECbXMhoOG6bUUuKIYPSbJfDGRx3/9Co8xlKIbE4Tg
	ux9g0QuFKxPwyYaBwMstWbjweMical+kIBw2ntX8AKWh6S7YPymn4tSBsFiQ=
X-Received: by 2002:a17:90a:d2c7:b0:35e:3aec:718b with SMTP id 98e67ed59e1d1-36490cb01c4mr291119a91.15.1777316784155;
        Mon, 27 Apr 2026 12:06:24 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c7:b0:35e:3aec:718b with SMTP id 98e67ed59e1d1-36490cb01c4mr291071a91.15.1777316783547;
        Mon, 27 Apr 2026 12:06:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490aa527bsm87306a91.3.2026.04.27.12.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 12:06:23 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi ADSP compatible
Date: Tue, 28 Apr 2026 00:36:13 +0530
Message-ID: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Zs3d7d7G c=1 sm=1 tr=0 ts=69efb3b1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=iOP-JMljhTESenzhlaoA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 3KqCtO8NjfuoCTS_Bo2-Atsdqzjxrypu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIwNCBTYWx0ZWRfX5L70gR07VUox
 Nf640eEyWhH7hXNA8p4YO1j7pE4qra3Lxnf7uFPLsQeFBG8Qf9QwxNhGICXHXmVRg159OcN2B6P
 Qne5K7YHuZ7rsQTACKaFKxzIm7PWy+220Jj08VYfSYwrM3SJ2cbZgN0KR1GBg+49ALQMqSf/OZU
 prt7HS0Zul17Yuxo4A5lDYYPyjAn47EDIaQxuWW5iMJDdQ3Yco5SHxWL8V3HPnPQKjj+ZsvBGwl
 8/h521ewUBK4m8PUNdVnA8WzIs8OkYQEYi6h8LWi9GxcpnE6aW/6ouGdTzWC8Ew6FaeNofvsnYz
 EJdP/MEm53F2cQ6375j06hLfXJY6Ld8PZg1LfVF2LOhMlRsgKOz4NDnVa/1XctDa9TKymrZ8NeJ
 bU5iMj5T+XDe174ol8k8zflHB33GzEo2QKBNW7uuokEOVHs5MUAEySOItUuSDHV/cCTLhhUlNvs
 dDIoorwtKh6ll85LHkQ==
X-Proofpoint-GUID: 3KqCtO8NjfuoCTS_Bo2-Atsdqzjxrypu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270204

Document compatible string for the ADSP Peripheral Authentication
Service on the Hawi SoC, which is compatible with the Qualcomm SM8550
ADSP PAS and can fallback to SM8550 except for the one additional
interrupt ("shutdown-ack").

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 1e4db0c9fcf9..161e9b55cb3e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -30,6 +30,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-adsp-pas
+              - qcom,hawi-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
@@ -104,6 +105,7 @@ allOf:
             enum:
               - qcom,glymur-adsp-pas
               - qcom,glymur-cdsp-pas
+              - qcom,hawi-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
-- 
2.53.0

