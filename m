Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A929833EAED
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776139192; cv=none; b=i0W6z5EXWesBumHIqocxp7ccAtgG0I7Hu2ycKKT726nVt/EBrT5S+sxMQk0z7ncnm41KuIANEA+tOSNdpKP5Y3NpCM6+xWY33yikEtcHTKaOntiNQY/9DQtermnUNkAIj6U1HS3xNFRgBcCuj3IGu5J0U4bdpidowjIJOHb0KIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776139192; c=relaxed/simple;
	bh=WdAwV2ejL3POz12dfXrN1UH7myAW0uxPAf3hSkyDGTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=suw9lP/EdyokmibH4T3SXG0xOcO00t1dy1oldPkrkwnNOj9YDkrkE3nb86EDB3mQCD4cClV2rvfDOsGlGUrdBCNd70bk5TFmXU/7OtBV/1IVGngFar1iccu+7E1U/hG9Xt9wPWNVE1x9EXjSbdyQS/zJOa3niGOIDtIqAnRKW74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBrbb0ZQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G06Tdgne; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBrbb0ZQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G06Tdgne"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCdfU2386515
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Cfj1ElFhQ7U
	CtHccCgOn3S4aPyvBMl1dKXXhKEwS3w8=; b=fBrbb0ZQSVnkfkZJb/AM//ggNz3
	zC9LhBnb2izxgMyGAgmiAROk36w3j6kaDGsKGhU0HSdNzVaEhyqTcwxnFqQ8hcbk
	LTcqbfJjjmu9QWiWbd1ObYfNaNweqokW9irOVjVS4PLTbX6M34HqUkcFkIRo27YI
	1UHt07kqDfGxdsXuX1JlEeYjgwYpGGX2qiVMY9/7JInvGYpaXe7sZ9SplRBu7vO7
	PXQBCZuNTnoDT03TKt60xOLJ+wIdKvuZJUXHiOeBgwRbIVX5u6n7n8KsgtRYvUOt
	cMdVi0Z92o2kIWAD1mmUkGj2EPwa3sCcW6l9Qs/srhiwGrdrPd5ZykP/NUw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w0x0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:59:46 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-127133794b6so18086396c88.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 20:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776139186; x=1776743986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cfj1ElFhQ7UCtHccCgOn3S4aPyvBMl1dKXXhKEwS3w8=;
        b=G06TdgneA7BSSmHvaZwdl4PRONTpkK1/HEMMpTSDA3rvYoBElSA9xmMKismwSv7vVa
         RR6bEpAHtRYx+P0nrTul3bIJLMDGuNju91zC31GPkeMprfgPseqMnxCTnYTnEYFTvwLa
         daT6egVitFv5ImDiSx0DXCt152Ly5o3xnyR2FKfvp2jg6fQNP53vC43JhEt/OL1yQQ4V
         q0LN8k7DrDlLGDGnTi1pSft/5gI0EIKeROD8Lb8C+lCseCIU/orsWY1ptPTvuwNTh6HR
         uDbgbCA+xniVFwrruwcsL8t3tAVqzOXduGPxqE6K3X8aNqzXufdpaBDg7GGkuzBg58Um
         M65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776139186; x=1776743986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cfj1ElFhQ7UCtHccCgOn3S4aPyvBMl1dKXXhKEwS3w8=;
        b=cm8mQ58zpyRUEE+KCjMANHLYnMoUqPF70xfxqngj0Or3oPjiFGFq764J/e+y7CqWlx
         XinWY/q473HGUWcTTEKcj90RsJRy1kUUWCvvK0Ked1tonbKclfKoQwIkETzIg5JlsolH
         w9i0rnJ38FLrmUKeyu6HtygURJcPpAPZmi5kA0rvJvwfQraCCv3kqRfURnVGHZjpE0iR
         W6m0BHGgzaW38AmjQs9freWLlNWpaGgnMwc1wICBkEajW1X6WEYeyQZ/FzdZZNV+rA87
         0IwBDCFIeHh+7Vl1D2SmNm9dZ7Kr3GPYha3CrizkW+k9QqEiI+b/WQTSspiOd6KnN8xR
         bUJw==
X-Forwarded-Encrypted: i=1; AFNElJ9nmj6I9J2CUjEZVjc6Wi4Rt3S2upURxKVz97Hf/1p4ww3T/mp9NeUCoBxoFyb9bC3SpaV5/rkqQu4S@vger.kernel.org
X-Gm-Message-State: AOJu0YyWYZ0QFyaVJakLGeiSUk0YrUASNVDnSXBk9RynRghUm+/5srCI
	M4A4hm5tLp9FInSXrkYuh9ZoI32BFDQ+cBw3rVZGWM2k5RPuIBwcszYovgwpGNb8k733kdyEM8j
	cPAZA2+djud86JeUyzbY85PXq39w0sXUd9n4LtB87vwSZj2ONahTpjWLi+p6uNV0W
X-Gm-Gg: AeBDiesYNrqrjtvxXk/0ep9uM3zZabJT/HClItqzAvW0SiTKptFmT+Ly9hU554jNrMs
	qqtL+ENp3tU8Kz1+kc48E3I3W56nHuFXdzR6oEani5ZwMCznXAnKlX27k+S6HXbUQOL7+EThttR
	Q4HHRykc7Eo2/290sdN+QYEzcf29F39iKFNeNTl/WhkD8PggZAcKkm1dtLgksfkabtgSRM8l61B
	EIer7ECrK0evjMNSG/7ADU04A7PFRmWO77M4+B25bdvvca4BV3GjQSZlnCwnpoxS0OhJKeuhz9V
	kJDqxUhsTpR2tcaccdzXcH7ozQNBTeZOU74gX7bqObO+96w0s7ajTX3Q+mdg0f2z5Dez1hqy5qG
	nsV6t+CP7qCBOjhaZENZdfWe3fHM6PuINPqBOg/LWUm0CzNfqIkTLlzRo3ih7l0ItKbIlZ7BlpZ
	aXc3VChA==
X-Received: by 2002:a05:7022:790:b0:12a:b932:81d3 with SMTP id a92af1059eb24-12c34eeb76fmr8472606c88.26.1776139185930;
        Mon, 13 Apr 2026 20:59:45 -0700 (PDT)
X-Received: by 2002:a05:7022:790:b0:12a:b932:81d3 with SMTP id a92af1059eb24-12c34eeb76fmr8472592c88.26.1776139185421;
        Mon, 13 Apr 2026 20:59:45 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d80acca4c5sm13949983eec.19.2026.04.13.20.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 20:59:45 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/3] dt-bindings: power: qcom,rpmhpd: Add RPMh power domain for Nord SoC
Date: Tue, 14 Apr 2026 11:59:08 +0800
Message-ID: <20260414035909.652992-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
References: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Y2tcpYmXoa_WLFkMzM0ijJEwRecZUPzR
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69ddbbb2 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=fp39WZOfobdgVpjsm_gA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzNCBTYWx0ZWRfX3T8a9+O6CrNU
 4zKrlINaybCt/aqqpJG979YcJ5pRsenNLLa88Pwuz95IEzGaskWACzNRxdjMxHjv7Dadf53Vhxi
 MIm4wV+JLJu6Jv4+iEu2oTn5oG4SN8V4W8e55Kodc3v3C2ecbhTARlmmwLy4/btEtDX2N4BHFGd
 3CYQ+J8kMklICEqV18pRR6W9dLD8tDMpUTWvcqsNr+A7Ubps6Bu4IZX4+rhz0RUt9mVOep/QTnh
 0NbIfXncOB+axble8Ef9ypUQjXvIRda5g69jDQ/0fQ53aHufyqufSKDCr+L5oZ8laU/w/R58En5
 o7bjI+qwE/WDS+3X46+86pP9wSX5au5ZYGjHUEci87oreJLuuAYZc/IUMjI2OQa2QNyw9rx9oZD
 slQFfXI4sj6dJ2KflBkEfnuFhIzZ2YnXPHN1vQrygWPc7ai2UXg2Vpo/uHsyNglXp2ldKaStQPg
 HT9dxQ43VKF85gvOIKQ==
X-Proofpoint-GUID: Y2tcpYmXoa_WLFkMzM0ijJEwRecZUPzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140034

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Document the RPMh power domain for Nord SoC, and add definitions for
the new power domains present on Nord SoC.

 - RPMHPD_NSP3: power domain for the 4th NSP subsystem
 - RPMHPD_GFX1: power domain for the 2nd GFX subsystem

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 include/dt-bindings/power/qcom,rpmhpd.h                 | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0bf1e13a9964..779380cc7e44 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -35,6 +35,7 @@ properties:
           - qcom,msm8994-rpmpd
           - qcom,msm8996-rpmpd
           - qcom,msm8998-rpmpd
+          - qcom,nord-rpmhpd
           - qcom,qcm2290-rpmpd
           - qcom,qcs404-rpmpd
           - qcom,qcs615-rpmhpd
diff --git a/include/dt-bindings/power/qcom,rpmhpd.h b/include/dt-bindings/power/qcom,rpmhpd.h
index 74e910150956..07bd2a7b0150 100644
--- a/include/dt-bindings/power/qcom,rpmhpd.h
+++ b/include/dt-bindings/power/qcom,rpmhpd.h
@@ -30,6 +30,8 @@
 #define RPMHPD_GMXC		20
 #define RPMHPD_DCX		21
 #define RPMHPD_GBX		22
+#define RPMHPD_NSP3		23
+#define RPMHPD_GFX1		24
 
 /* RPMh Power Domain performance levels */
 #define RPMH_REGULATOR_LEVEL_RETENTION		16
-- 
2.43.0

