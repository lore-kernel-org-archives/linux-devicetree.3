Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24451A681E
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777252176; cv=none; b=R24NLYnUZYuakINTkS8woi2GrFDczBcj1UAFwTXBGzc0tH3/lKGKSCzlifMR0Z8Hj024PYD/z6PkZHxxLmHzlAJ475YLQ1OVNmka1/OhFk4noCGscGpvAUiz7DGmwSRBpbyuYgWJiwDbfV2ZD6jZOkYcFXiVcYBGyrhu/YlA0AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777252176; c=relaxed/simple;
	bh=fNyV4DTw0MPKBMC+hc2ip1G1nLqAU3cUP0RrWYPknn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X6XHAODJ9EFuowJ7jrxaTsj10stgMuRvMmYD/Unq2fUkxLpnqoBmK/oa009UDFFY+PNxkUj/SDrVuCqtor8Yt8d589kuKkF80mJfzpoL8c3KUclgLaPduehUHeXvK955h/+llFo6NJTtEFB49Ay52CHCrbWrK1d+fYMtMRemXhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g51L4nst; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLqng7by; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g51L4nst";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLqng7by"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QKdR6p1410025
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=N+7l19QPmgoLLlehiycg8lhjtzp851uBEKd
	JIned3Jw=; b=g51L4nst/P6oMWHlMpY7xf3BFb/CQRESVX0jLaeyA5XLT5Bnzrs
	NBzrfcwPPx7UFaUjrcRZf4psQrxGKanBSzABfId1Ss69o5z6iYrr2WvPuVwuCjZq
	Dg5ErQxQ2mHVnDCET1iz3LGcvniqSEQ+wmucWzdsalFXRYx9D5biEyElOD3TD55Y
	EN1ByFV1CweMNFDCh9FYTXYak5Lkt52yOXQKkZfgO8tp+70zfcmgJh5n49Dh6jvg
	xcHJizImiHUK4ERe6hOYGkFsnl7pObylb6FWjjqeJxKafZcDWxejsGv/gs8CTauq
	6pnUfpYNYw/imzWTQOZaRSG63BRc1UDZY8A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnnf3un1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:09:34 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1270dcd11c1so6421886c88.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 18:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777252173; x=1777856973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N+7l19QPmgoLLlehiycg8lhjtzp851uBEKdJIned3Jw=;
        b=dLqng7by1uKlmCIfdViBivwBnPZWukkG5ZwlBqOsRdEremkmFqKny77WqKy0Wzsw50
         HVEZcJegG+XxE1xndhuW/hfxsI0OHp4BbYUSPzcv0qnmpymJjk6KV/x1U2bSiw2+aZ+m
         u3PyDADVtam0+2qSReSxJtPjqtZpzMh4U7Lz7LIrmbb1rigekQqV8sVV4yUqcd7ydHqF
         XCyPEGz2S+ll1UifkX9pO1BSBTzDdgLzQ4nxOP7eX86IExI8JieN86Fhz4n9Z8vmi1oU
         +jghcYtet4op6Lgq9FNnSxUP3B7fa1yrYAVuC4zOu4kWZ+bgA2v//XsRrV34X1stBp4C
         6Cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777252173; x=1777856973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+7l19QPmgoLLlehiycg8lhjtzp851uBEKdJIned3Jw=;
        b=XMqcqhzbgugwHrpPk/2Y5qCbtENXE2//U9YmDJb4vi+57655u3cYltYsVVYPiaQORV
         a9m7UFqb/9Y8jVBFPJ43mQcAsz8BrkX+75jxxF2NTq6dY2u+eH3q5HtqC+e6qMsXiXZz
         vhMOD8WGKclFoJxkXmmEhPDOsac7NsG3mjGH3wCdyNhNhQdilcSlMSqCfL9y1xRSLzqI
         Ymt0bV5NvSbq0346Yfl5Wt1jSEfKiiWbNft7b9j3bVGrr+u8p1KaYpAlT4wC3lIiIMoR
         5wCGC/qgZCUSWeJWk2PPr/X+x0FuEUIna9LTQc2vO1AlwgMbr9yNXF88w/VFcQaOETao
         P6WQ==
X-Forwarded-Encrypted: i=1; AFNElJ82agqdqhJHVsK3n0W4YvGdglprqK7jFRXpe/WXYwmlkbFGyLX8n2k19kPZ8sPgAWlglw05fnTkoM+n@vger.kernel.org
X-Gm-Message-State: AOJu0YyBs0AqMwppO19caaargSKESYFvw7w519Uf1e50eOH2moOi9YSJ
	maPBCQwp6+2HS30TNYdoqwUjj8643ZMaBNoFCRgnDwRFzzqmwJq9Wc1VMHp7ndZiqhZxhV0Wz2g
	G+UH/LGb/N1ZeP3QL3bOSFOwz2iUGPIiafZT6/BS/nInt5bvtfiHHjtTeGG9dzfIY
X-Gm-Gg: AeBDies6z6vgNEVo5vdWKG6yBqN40KsZIJmcmJyZyx38T0Rmw4ouxa6ON7P5c7de9rU
	K1gHb/fZs4CmA8x+qjsirPgRMJzOvarKWPP3m7fQA6fKB2YFhtrDE8iLdCe8r5PS1/a06DhR/0A
	DNysE0YR/B/ZJdJrtf77ERF5wXs7XLDXppmKjC2S0t9DxjNu9Cw1wXve45cnER2nA6Zvn2FOrFz
	FjPAecllYED/eF/ka4WrmGZV55mXzlxQ6uArumrAzOZ4FUYgYkPofgkxNNBps2kPnI3QeSWx9pm
	wcfBERw8CEmEmnEffuOYgy6Bt204lygN0ulcaH1HSuaFo5D2N8y42e9S0KRt8CIuvVyxOWPbwrc
	FNbkIciIg2IDr77tdsY4BGZzGhw4flIoVr/cCzd5llRt5DH9oEz32rnq1AAf2/QDcr+TE7PRJuc
	hGPUyzhQb8InIhJBVQ
X-Received: by 2002:a05:7022:23a1:b0:12d:ce34:3f97 with SMTP id a92af1059eb24-12dce34406emr3459278c88.31.1777252173036;
        Sun, 26 Apr 2026 18:09:33 -0700 (PDT)
X-Received: by 2002:a05:7022:23a1:b0:12d:ce34:3f97 with SMTP id a92af1059eb24-12dce34406emr3459254c88.31.1777252172397;
        Sun, 26 Apr 2026 18:09:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dcbe079c3sm9502573c88.2.2026.04.26.18.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:09:31 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: interrupt-controller: Document PDC for Qualcomm Nord SoC
Date: Mon, 27 Apr 2026 09:09:22 +0800
Message-ID: <20260427010922.230586-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GAxoK5kwHvjUDrqgk4nZScGmhEO6OlHS
X-Authority-Analysis: v=2.4 cv=Y5rIdBeN c=1 sm=1 tr=0 ts=69eeb74e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_dvTtxwuY7_ow4vAqu4A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: GAxoK5kwHvjUDrqgk4nZScGmhEO6OlHS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwOSBTYWx0ZWRfX/iQw9WgraYhI
 U/oiYi+3zoQNS0CUotJWpC/MejQe52Yd6uwGNxVXTPq9g7ZCKTBDjQuohBh2ht+EXwSWttKxORR
 rHPy/XPCTeS7U2aob6ZbcCHueu3464mRUmlKhFfLpID5l9Z8cpgXqrPEBukDuERm0Ji7ADhbqvM
 VZuUipdCqboRlqCWxo8Tw+iHd/CFGJBbk6VC698j1N+lXnpsLvN4ojeY3xnd50PX8reSBHqfIac
 qhQeO5iBMSE/l1JMxMAYUTmefdhCXqSiyOcjf94w0MS6ZtxltiMofMDUGNYEcMsyEuY0w6HOtNx
 eEhs4w/EDVFbPaWwyLGc/b6RhxS/IUsTEl8gIkWTb6wS1kPyfQmCJdT4+ug/zgoUn6bMv0eV8dG
 HGknuHFnD0bCOCofJHQj9tR6rPl94ka1F2LtMDK5lQqJ/SZIkz6AyHO/guSsefD0MvydqSO4e8W
 H0sdHhkLqPFxQp/iGVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270009

Document Power Domain Controller on Qualcomm Nord SoC which is compatible
with 'qcom,pdc'.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420024733.1240249-1-shengchao.guo@oss.qualcomm.com/

 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index b4942881b9c9..07a46c5457a4 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
           - qcom,milos-pdc
+          - qcom,nord-pdc
           - qcom,qcs615-pdc
           - qcom,qcs8300-pdc
           - qcom,qdu1000-pdc
-- 
2.43.0

