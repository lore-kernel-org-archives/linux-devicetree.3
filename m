Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A403EF64C
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 19:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316791; cv=none; b=MkcDJ4m+qxcWF+4V3S3EwLaBxNkAQnlBasJyEUc7pSHad/9/nt6PWT2Kah58nty4FMjEB/p9dTY49Obn0NpBOlCTT0EeXUwW7ocyJ2FslDOkC8B21rxID4MKHRUzWT9laZc9P0AwbgHNiPaUdrTUwyqurqJGW/hdflSGY+Ji4H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316791; c=relaxed/simple;
	bh=5aNRN84OKFOh5IPvThdbtzj9Bgy0czm9fuZD8TrdrbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4UW4+nfYF1RXH87JsMXtHnY5RthXBQdbB1IE3tJOa3eob25Oq8PITQj5iFeEzrs9CJe+EZQ4x4QRnWwKuhhi6BJ/BGy+jdt25bz1UGoTi01d+/0VCQoDPlPfY1HKeP9SG++FMPVTqPz12aHuxlMZb6P4Yz0cPT6BQO8RQJYJBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUpRdZxb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A4boBoLm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUpRdZxb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A4boBoLm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RFLPcF440983
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 19:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Mt2hqVDHRpK
	IqINyb4FsXTJqc6aqWI5lx9jihlodcdk=; b=hUpRdZxbxMrirtnBLZe+srErpO8
	3ipw31vmkt8SLIsz18pmMFszlRZkOUCgG79iMw4cFkdI2v1bDB4n2GPH87pT1E+D
	mtiDGA0bDpyNJCbStTE7RhgbxrRwcgZKR8NW9wPex+jLAASl4M/UrKWup0Ab0jqL
	BwQDMxqPYc7rLdr2nQcHN4E2Rrv3RA/WMlur0/RIaw1slSNLAi59k54xoTRfcFT3
	9oP5N6GUaKB1/zWMw2YO1xUyocJ4uqV8khZfQCLaenF+XqGOr3jCBFnZ5gqRNsD+
	G/0iyrS7qN96o0JFOV529ZF/uUTmVJdC+UDvwEzcgQMVQcUwag6HfTyVyhA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac40uaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 19:06:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d99c2908cso10216836a91.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777316788; x=1777921588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mt2hqVDHRpKIqINyb4FsXTJqc6aqWI5lx9jihlodcdk=;
        b=A4boBoLmhrzdrGfx5AijcWXnM7nZxbscXbMGSnV/GC6G/y5BYvcgruY0FJZaYHwtTd
         9/eVJzTg05p1HqY/7JXwPbNyFm39UjmKRldvsieNZ5RWu6V9Ww9CfHu5tvyRswaXvA/D
         Gn17nTGRsuEJ0yBzaIdypXVQvQlYWx+h9nXGPIS/J4vktoN1QISXjHUtMWHSlMjHwgng
         65nKU/GdNCvdboJGP28Z1cwswt2ab+ZfcIrG7Wi1CrHklIOe+JngIfaKBOAwJA6VkC9h
         AdPwZn9t/d81TyN7CwgL4WuX8Su2JaUJfdRnpLC9Svak3hmAcizcFbNuFlFnvsVU5XlG
         qftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777316788; x=1777921588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mt2hqVDHRpKIqINyb4FsXTJqc6aqWI5lx9jihlodcdk=;
        b=owzbBH4900ElCNJ2WIk3hyT09KJluPGjcDJ2JI0NPMB1l2fvUX+J5EZ53MTMg/kanb
         DS5B/wDcpUl1WNvYoVXh6Q09MTNX8CYUT5cWA35RrabW+bsbZ3uEZQ7tCI6bxdM5AiWb
         mThjbkMlgi7ZHfn5gFBiUe/J+GBIV6DFDEbiblZF4jKHWsF2PJPoffPQJ853H2939cAy
         TF3Vwi3f0ZDaK+tgReVv2HEIDHSTPuAVStzXxyQI2XjKFBRL/H3ftcsX0ZKw30Xl759K
         42Z2OEyqMqozrzPmaueG5MJK5TZ2NySOxdREbqZ/Wa8pESEO4iYGOlq21irauQoU6+SK
         00Hw==
X-Forwarded-Encrypted: i=1; AFNElJ/U0fSZ2wXrTZKyKOGb3SFSp76M5n6bV1I7vV03DLtSlrCX/bGLBVYsvtsjVm3Zcffx+GZgDoucvjPy@vger.kernel.org
X-Gm-Message-State: AOJu0YwSd4gLTQI6LWakPJDSwU/0b6Wa0IxJDcqy6hAY+qXckCyD58iE
	LWSleB8NryAV5XKyHOZlDNkhXa8WNdKunQcBcPnEtd2MTyp3A+cVmtzYwIB3Omfg6vcpn8PW8lM
	JprssbtXuT3d4gFfQWWdv+MoFeYkCb3fZjHX/GwzeurwvFkcCy3i4ZHvf9mtE+v5Y
X-Gm-Gg: AeBDieufprVknVbXVjvtYXnVd9xz+LfunpinV9tngJyPNkgXs1LChuPOa+J/D1dsZza
	WmAiOrYOjS1kf5u3I9BDX3p5P4QlIwz+iJ+JRSp+UpojpTKr7UAA3SKF9StTJPdji4ErPhLBKhh
	3h87yqlBGo3JhqyFMN+UCAPjzJBItCpUowmhOhDaeOegJcHJ8hOPTobty7wWa5NyzMA+etJsu9I
	/IxdTiNOr3YvdhwxRnLwYHbSIdpd7i3Pumqc1f3bT6JilMuqXMxpQr0UfeAu0c6dJpWpbip87m4
	lMezsh3g1gIu3hwB+8znxT8W6/upQk1CZMM/yUDRAf5vs/XNX1NGbTUaDiVvqkQAtQHag9LmuoN
	qWPthDcWrP7xCrRGEdZpRuTsj4ilGHthQc+3Srk0QYpnhbinJ22pCUoEIiGI=
X-Received: by 2002:a17:90a:e7cd:b0:35f:bb33:d727 with SMTP id 98e67ed59e1d1-36490cb851bmr284248a91.20.1777316787985;
        Mon, 27 Apr 2026 12:06:27 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cd:b0:35f:bb33:d727 with SMTP id 98e67ed59e1d1-36490cb851bmr284227a91.20.1777316787443;
        Mon, 27 Apr 2026 12:06:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490aa527bsm87306a91.3.2026.04.27.12.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 12:06:27 -0700 (PDT)
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
Subject: [PATCH 2/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi CDSP compatible
Date: Tue, 28 Apr 2026 00:36:14 +0530
Message-ID: <20260427190614.3679937-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
References: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PvopcsH2tyYbRDLkYdgHPP6F949LPL17
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69efb3b4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=0pp5giOrAzlh4QsvPMEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: PvopcsH2tyYbRDLkYdgHPP6F949LPL17
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIwNCBTYWx0ZWRfXwLDRwVaYOWlB
 K5eH4VvzyWVjuc20nak8vWG//BEPewSYN9SDMEqXFLDwucoPYPRRSiBdOHDRS8wmoHgN4wI8uGm
 nsJNcB4ov2CCYymhdtyYl+/Ri8jw3T5oEkx47313o//qM3mX8qk9y5aD/2ap/ZwWECKUNxS7rIb
 EOtC34GQgT+etwJicrEyNkrbf8vm1TDOHUhQ2PR9+mukOXJAs7m8GRpqjQguFR2nDfmpGaxI4ji
 maOdYj9mgxFGI00eSGw8MileHzyxQyfCTr/IxwIUmuc4NHRAWB4I+feqw8E+t/mcJNvBhnNDd1m
 yL8wzqSPBsGyu96JYXSX2XeZ7qIlGGyYvfq5vfJ3duHh2+nNqjQ7XpW1MNIPAMzKZBPkLCsD7oe
 pkE17sQkUjA9KR/x7cANlWOMLT+bWmuiPy+zwUlXbXHHT058Qorxdjwb1FNchxgFZgAIvZCP+xx
 XqjfHvy8Vd9mKVUZINg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270204

Document compatible string for the CDSP Peripheral Authentication
Service on the Hawi SoC, which is compatible with the Qualcomm SM8550
SoC except for the one additional interrupt ("shutdown-ack") and
similar to the Qualcomm Kaanapali SoC, "global_sync_mem" is not
managed by the kernel so it remains unlisted.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 161e9b55cb3e..9f30a38152a3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -37,6 +37,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cdsp-pas
+              - qcom,hawi-cdsp-pas
               - qcom,kaanapali-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
       - items:
@@ -106,6 +107,7 @@ allOf:
               - qcom,glymur-adsp-pas
               - qcom,glymur-cdsp-pas
               - qcom,hawi-adsp-pas
+              - qcom,hawi-cdsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
-- 
2.53.0

