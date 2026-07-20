Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFC423A561
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 02:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784514972; cv=none; b=gS/e2zKHwYGImYh0YqRd5rlG3tufsgynRZiIbCVMXd+LD60UQHmN6r7d9433AJZlkY0Ppwt6D/tpzoVmvGqdmX3jdhH4kk8vZkYW9xRB3Ir50630IcooHo+73/jk2ouyvQTneBRAgDYQmwDBim7fIZBboG1bnRwjjtsmTp80jpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784514972; c=relaxed/simple;
	bh=Zd01etCEfWO+CM27GNY1MbP+KsTaDAZ942YCw2f5G5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cQ4rAWST9r0HqRSsSvuilj4rTwhpwsBOHJY/Lo2wiwJJ8SoO6Z4uOiBHdvmoff5nsdpNSpQmLr1GaypjOiR/G7IC3Z7JSXmGL76cUXs8ViXPg8lYhfjrMsG4/P5+60hJ6ciJ34rZyy4tOwA9oW4POqoIG9Be/OPmZBTn73pAYEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5/Bdg9m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUTGH25Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5/Bdg9m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUTGH25Q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNtPsT914744
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 02:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JvsdJN4ylr02nfEuq1zebFxCT9Im8rIcShf
	jIkDDYYk=; b=b5/Bdg9m4rAvFnX8Hrx8VFWvIycY3QV6CN59DmJIfnt5spSzgeZ
	JMCE0y/HlQ+R1eAmP23djwOoz5XzaS72jDqjK7Un5Sg9nhlIAzKj5oG1kCLmIFbd
	F/NP8enz2ZHcI2w6X1zXc3lCmaafk3BcjugMMMNBw1V8iHIThB3d/8fis8BtsygN
	mdsQdRif6hBowTKxwrS+Rx032o8OWKwwNVo9e+8DTXFdztOJIBsU1dVGUf4XVo92
	RlIaJcuXQgNDEk2l1zYldDyaWwvuLzGyIAb6O3U9mRC7pcaEu9FIoSMS7wj2vDKn
	EaTTpqFnePwP4jeKOnylcu2Cld2FgGW3wcA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af40v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 02:36:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so10159879a91.1
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 19:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784514968; x=1785119768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JvsdJN4ylr02nfEuq1zebFxCT9Im8rIcShfjIkDDYYk=;
        b=hUTGH25QIebCveT3SPzBsinrGUMdcRlsuYczagIwYYKz/8am4q3tTABwDtBZF5VdvC
         f3mCrHQbR1H6TEkZMilDXdk5VDwgjvbpK3Cj3dBoFUKhsx75ioE2Vju4vytuJly7shR4
         8uT7ZUQBCWIwYHIou2+HfsER+GCpfVHgwMMo0GeO5vXtH/XmjbNJ+K1XytiE/6vpZoEE
         DnMRBjvAutLYmAi7t68pAqqhFt8cZvKZsVZrfJwbS4KixYxS2xwGzJ9fAxBTJz2pawMJ
         hApTw3yn7px04cVccPUB9Of41iE5+WvPzoJFW1EEefU3kEQAIqCj9xvcqEDeHwnerckj
         d2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784514968; x=1785119768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JvsdJN4ylr02nfEuq1zebFxCT9Im8rIcShfjIkDDYYk=;
        b=HjTWZyp5QYWKPgDGRtkG1+PYMnguCThJTJZCzSTjNolNme8CHHbSqojnOMZxVLvAgZ
         l54CdDWaS9T4T46Xb8qO790bDX15ecPoT9gM1IC54wpOg57C4iz/IzuvsXJk08XmkG8y
         0WQe0emzdNWMF984jSZnshwN5UDS5wnIxT3Nb33MYDvMnS28i18UNExURhQ01VbqVbUR
         HqwtaAKSOcj2hcSgFGMCUjnUl2m8RWgaRk/qBMHdQxJH3/zZCT7FI5ebH/PwIMB8jjPa
         qBKmbDnI6BePTXt+YI4LtJVqNQ5FDeYpwIvLhKnuaKdY+LFlkyi57n+HndBY6ebB22hF
         C89Q==
X-Forwarded-Encrypted: i=1; AHgh+RrN061t1qrTGnHbcRTojMHz4+acU/4Uv6gKdMwVuO/8VcOyUljRMGuZqAQzxVyvs0KComIh49FBb82I@vger.kernel.org
X-Gm-Message-State: AOJu0YyXp/FiYkdOFeYnatZThneJ91vSVjM3VN79NZbYxzBjsYSecYYR
	ejnGBTsfoCjx/UjQneKBKIOy+EqdORukTqa++1FDLH2ZZZCuRjhwMDZpbGXg/WwfgeHCC1+IT3e
	QE5uQU5oLXshySeRDf3rjmta7pkfGLv5rwCNBFO8zUUSijicPep1hy2ueq8b6amzb
X-Gm-Gg: AfdE7ck5E3Uru8SwLGIaMlxrxzY6kpAkHAR2yNTRlrYbrHqie+TkC5St/YDB9yN02cO
	JO41wXZOPZpFkFF5by5ytxmuGE2DaalqgHAE9EFtFr6yhb0Nj5h0xP9rEgGrdlQqvpo12olaCnT
	ws7kiX122C0bu/J/APnZZ1M9qLXDtJaGvdXfXPuBzEc7kDbP/QiR7cDi9bL99F6VrddGOPjBLzG
	S/FzeKzbijJLj3n7o1ws+E3nwlteJBuCRJBmt53B4eV4C6eVoMgCBwtIXJqrkbUJZXvRQLhACpl
	A/HglrBi/QKQBqlhs+MJfKmE/5kQxhhdwl6zcqib39+ShvcokE9Tx6N+nzpo63mWEn7hpuXKVgM
	onOYz9x5YUwdKfyQLj5elBciMt4VdirZmUQoDOEy/b1FcgcDwi0tmrUZ6vYdV
X-Received: by 2002:a17:90a:d2cf:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-38e4b446353mr12364862a91.11.1784514968444;
        Sun, 19 Jul 2026 19:36:08 -0700 (PDT)
X-Received: by 2002:a17:90a:d2cf:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-38e4b446353mr12364810a91.11.1784514967443;
        Sun, 19 Jul 2026 19:36:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29e340esm24646932c88.5.2026.07.19.19.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 19:36:07 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Anjana Hari <anjana.hari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH v2] scsi: ufs: dt-bindings: Add missing mcq reg for qcom,sa8255p-ufshc
Date: Mon, 20 Jul 2026 10:35:52 +0800
Message-ID: <20260720023552.2667237-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAyNSBTYWx0ZWRfX1E6LsCMNx/40
 oMZXwl5TJV4r3d+75XLtW2LmNgKB33kF7n7iLDavMAQyqd/0YCg4+4vx9rW3euVYq8Wna0rXsFQ
 fAbBeVF7EOE8iHQ9iuA1CR0u+7w6baU=
X-Proofpoint-GUID: o6a8-YMtuDaGpf4HcERQMQyDddj96YSI
X-Proofpoint-ORIG-GUID: o6a8-YMtuDaGpf4HcERQMQyDddj96YSI
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5d8999 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3miq8Qb-Iyz2LYAwW2cA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAyNSBTYWx0ZWRfX7U7UCHnb42gj
 1DhnGDO+gkjkong9TiwtBI19qwKpt4rxfsV2Uwsos+IWyL2Bej32iyIAmgu3vou229J9JxoLdBE
 qNfH2CVfpoOt4lpi9+AAsdMIhnnc8x7DlrxuiGqdMFKrffO6fpHfwTQirKdXn56RD//xbpOz9fv
 LPx/CsRSA7o8ImhArNE0rcObQUZ3bPRtuYFxQtsu6CfsfTNCqiYj4NndpI4URHAEIit2PZF1Qdw
 xUWEp6X+4loJrrBu7wthyb3A4pTwhgyozvsJGvcsxwB8j1//yc6Y0NlrZqkJyNWRCjMz8BfPbPn
 ZRy6jgcTAaTx9xF1cFNrRRw8dPeOXtb5xdPVqX1MikOen+o+7XZ2Ghm1yZCLupJQDqbF/TNjLdG
 XSCKVBBpY8xJa8JhqbaSmAIX1TOtyk544Wpf9WHlkVAOLUyEz8uS0ifzpcTzgK/7wcS7GB9jUka
 JQN6BTAI3ynfOrYeZ0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200025

Qualcomm UFS controller found on SoCs SA8255P/SA8797P has a MCQ I/O
address space. It should be defined in the bindings even though Linux
driver currently doesn't utilize it. Fix the binding before it gets
adopted by DTS.

Fixes: e2725ed2a7fb ("scsi: ufs: dt-bindings: Document bindings for SA8255P UFS Host Controller")
Cc: stable@vger.kernel.org
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v2:
- Recover the newline which got dropped by accident
- Link to v1: https://lore.kernel.org/r/20260716083313.2367249-1-shengchao.guo@oss.qualcomm.com

 .../devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml      | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
index db165a235cb6..66d73e9025d6 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
@@ -18,7 +18,14 @@ properties:
           - const: qcom,sa8255p-ufshc
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: std
+      - const: mcq
 
   interrupts:
     maxItems: 1
-- 
2.43.0

