Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8852E36B04E
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971639; cv=none; b=n/QkvTThIBqzIBUdydbF/Uu0BQ5Hj1x1bprghrSO4Vfr3OzbvJlI1ZSJvva9Ihw1uDEe7uVUnPOOQBdKzqYSa2U5VtZviwn8MaR0kcASfsXtBCjGXMhDYLB6ZcuyZDtWILm0adBJcdigPPBZWw/3kIeb+n+/GjI1exdw09qVECI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971639; c=relaxed/simple;
	bh=NHRsT6JNMGdlVVEykow6bHQhy0Ht4gerx/Zd8NvExMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N72rPlozIZIpDzIVNrAAFCnD8wEGKmyGpZ8kT7SoNWI+IsQjfCdFgyhcAg/f+wJ52C7ZwstEumNpPEz+syZthfo1WrM2wAmRgo2m+rHuw/5/2JKshTxoFktZU2+v1uKbFtH8PthF406x82i9nsU7QxaZFeFLzLHvxTifnN867Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZwkbqODr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvqQF5nx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZwkbqODr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvqQF5nx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZVBB007203
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nbMGMuHirphbE6O5+vqfS6c2itNd3oyQVocKAGOT5II=; b=ZwkbqODrvT160sDu
	06UclUEhAV14/M2M52IralsJ778rvTEKPMcjNhsBrlmGvB4/0NkC+dcMgNfvBEjS
	v+ev5kVCYWuWpYfK0qAh7+7yzhOIPfvI8nco3+XwE4dQu9VV9NAiBCafH8E7jM6I
	BM7SVK3mX2iwDZucGTyzczmHd2upCLV9qq/VFMcSMgGh4u1Uly6D71o3JbeAr/3S
	BAoXpzMGLA5h1JtVGS4emilt8+zcQxM5RBzrPx6dL4wOoOKMRVFFG3JTLfeBJsUi
	Wh/JBgP9p3x95K+B4ykoL2gE8H/OmAFvL6AoNJ6wdaXHtizUOLw/f1wtHxYnmQr+
	E5KusQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8b95vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:20:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e3dad7ab3so3688391a91.2
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 23:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971636; x=1790576436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nbMGMuHirphbE6O5+vqfS6c2itNd3oyQVocKAGOT5II=;
        b=YvqQF5nxBeSggwba2YeBGVZ6P8FzmlYPdVCElInAZ+Z4fQVdLDrX4Lz2pjTZERXfqe
         7yoKCVbwcNLNFUeaMvGPAjszkaIC2G95Nwx5ciLefqrViyfH8ym3LOwZ26DrJEd7BQYf
         ERiy5k3lVdfYR/3UQdJkQ2h9ouK/MgT/dwu7LKZy643wxts3uTHiVFXG6B+Y/jgc4Aw7
         s8P4tM45LVAGmmDqGXeHNstgF1ZQ32s+jysa9jwmh6/6hG4DSnlDQCVDtzzA4dFzmtS6
         AB69RH37L79A5aYrhuhG7/joWUI5ixc5sLYlpGpkqGac6VzkXZD8Tflojn2UPYUUMQWK
         cheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971636; x=1790576436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbMGMuHirphbE6O5+vqfS6c2itNd3oyQVocKAGOT5II=;
        b=r+ZLReHqWTsRJvKDEinJpo/BsyoRH28QBSUf6tSuI/a6SLFyTBsDQrciBEZTCJpH9c
         QPYv+ytOWXPHdLEITD373EKSpkUiohbkTNadH0kriCv9psY8kZA7GCrWlaVBgFM257yy
         J2cCmUonhLEP/l1b7ASmWVQHuXp/S34CdNy3jdjef2vMFyG/bC8USzUf/TSyDOZTiluD
         FWgSkQQd8OftMpTIAQUW8tG/V+7osWzNv/tm23fy0Fkt6jLFLljMFTX061x5Xj1s2RSC
         Y63AA1Lb8n2DreBKr2UN9QXqxNT/j7zYFvHBjwzSpBdG2knNvqC6MIb+/ib1M4YYwHXq
         hKig==
X-Forwarded-Encrypted: i=1; AKwUvBzQqpGzbUItSIS3YPnkoXL6S+Rrf9kOPN+QKAJP2UUvPfFKYGXaV3l5l2CSfXE5Xj+jbOR1JEXC5W5I@vger.kernel.org
X-Gm-Message-State: AFuF++kMYi0elIQ44A8SyaDHkRRxYnJSxm3sdjTmcQjwV3wmTkGOGUki
	rNB1qGARJXWDuOBIwY5qUdImq4fkigMkbM9ZZcETtoPcY4404bpG3MnfbDgokpP/w0AI60TzRF/
	PovUwYUqkZUpKXUs03lx1P38Bq7+/ALL2i/2Rsl2ykOQnhlrYxmmR+mUUXfchTNBk
X-Gm-Gg: AYBFou2uM74XaFeg03KzPjzw6QQ+ZgwzbQ2ueFQe2dj0rOHKs5EMvyfXPJ5FwbHXw3M
	b+CRO+T6SfSTy6MOyn5nwaWAUYIY3r9CejIakCuPTdwIh1aMR2/guXBLmW7Oj/4z4F2VNH0UqWc
	e1+NPHiIvTlNyM1DcPWFWBFSx5XaFlzxmJovBhAmLa0IwZF+2OAwFNXVr+8Vh8UZnWinUNRD8r7
	BVO+B2MAM5vSv2/0AYOuhgYw6HOaNFJddpbo7gg/nUOqOlbgHOcW2cFXNK79k2AF8poLkoEhiNh
	pVdSB3mVxbTdcWxpT4HzDnDGOKpWV5phQLWhHshVrhhn5XKvCd+RVitVn1u8/BhzloXS5S0nivP
	M15KmhFpv/Lh0WZYX+qlVrGYgnI5cO9ZQEc0wJP3DOvyxHRnZL34FMZebcHZ+OlMUs/GpTgAYRz
	T6AjrsFUiAIEeZAZ8nE+AJZ/ix2RfOVj8nJA==
X-Received: by 2002:a17:90b:384d:b0:39e:6c6a:2092 with SMTP id 98e67ed59e1d1-39e6c6a2289mr7962860a91.51.1789971636360;
        Sun, 20 Sep 2026 23:20:36 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:39e:6c6a:2092 with SMTP id 98e67ed59e1d1-39e6c6a2289mr7962845a91.51.1789971635971;
        Sun, 20 Sep 2026 23:20:35 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:20:35 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:40 +0530
Subject: [PATCH 07/11] dt-bindings: qcom,ipq5424: add NSS MEMNOC clock and
 ICC IDs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-7-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX7mcmV2nQcTkA
 hR48lPpgW059fAcsXH71w8ApEiDzjjZ0+HNymbMoBDv4vsihkJHFBG+VcFnfaGVbDOr3FqLlsie
 /RTZhWEFspCP0h8P183AjG+l3F6huDN8nAZSVWz10SRWyK5SkAyFKF9UgLf9SZw8SxqK0Vqqtwi
 AYjrZtu9aDJo6Fp6vpdvlzjiAm0xY7Ahe4M2mxQiKY9JPYyHuJu0bh9tbrkg5INXG5IccSduSnj
 CBgLH6wDjOeGA8yfaNZoTM0CbACMWdZ0FkeUPMaDgCac4SkKmCSk5aXQ/GTEo6XBLDGMBjJKHBw
 ieGbDFeF2vBfgKBaeNkjw6q7wUzOicXuYkFg6porWv/fjn0SobeQWAiDUiWnwacrRDS+JW8t/BR
 80VRQBP5wAvd512wVaLY5T25fTzDnGvkmd6VJTNKFfeGbGbPnISLNU99F/fux9hOxeTOarP8WEh
 g5prjzAwv5vvPA/KmRA==
X-Proofpoint-GUID: vhxa_FeK_YDv2sJkmDgW-ekaC9LuRi9O
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab0ccb5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Y6j223gtehf2z1fR5tgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: vhxa_FeK_YDv2sJkmDgW-ekaC9LuRi9O
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX6xcjBqrke+k9
 P7pslqRUW9Q7vtEq/EhUvV7QYmOBUwAN4FCzpZDRJzrK8cftp83BkBHqNS7h2m1a9JM4UUAvx5r
 Skzm0kHbd8H4yKfJbhLaf2To4ugk2Rg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210089

Add clock IDs for gcc_nssnoc_memnoc_clk and
gcc_nssnoc_memnoc_1_clk, which provide the NSSNOC-to-GEMNOC path
required by the NSS block.

As these clocks are exposed through the interconnect framework, add the
corresponding ICC IDs as well.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,ipq5424-gcc.h    | 4 ++++
 include/dt-bindings/interconnect/qcom,ipq5424.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,ipq5424-gcc.h b/include/dt-bindings/clock/qcom,ipq5424-gcc.h
index 3ae33a0fa002..b736cf42e9f2 100644
--- a/include/dt-bindings/clock/qcom,ipq5424-gcc.h
+++ b/include/dt-bindings/clock/qcom,ipq5424-gcc.h
@@ -153,5 +153,9 @@
 #define GCC_IM_SLEEP_CLK			144
 #define GCC_XO_CLK				145
 #define GPLL0_OUT_AUX				146
+#define GCC_NSSNOC_MEMNOC_BFDCD_CLK_SRC		147
+#define GCC_NSSNOC_MEMNOC_DIV_CLK_SRC		148
+#define GCC_NSSNOC_MEMNOC_CLK			149
+#define GCC_NSSNOC_MEMNOC_1_CLK			150
 
 #endif
diff --git a/include/dt-bindings/interconnect/qcom,ipq5424.h b/include/dt-bindings/interconnect/qcom,ipq5424.h
index 07b786bee7d6..50b883b16a12 100644
--- a/include/dt-bindings/interconnect/qcom,ipq5424.h
+++ b/include/dt-bindings/interconnect/qcom,ipq5424.h
@@ -40,6 +40,10 @@
 #define SLAVE_CNOC_LPASS_CFG		35
 #define MASTER_SNOC_LPASS		36
 #define SLAVE_SNOC_LPASS		37
+#define MASTER_NSSNOC_MEMNOC		38
+#define SLAVE_NSSNOC_MEMNOC		39
+#define MASTER_NSSNOC_MEMNOC_1		40
+#define SLAVE_NSSNOC_MEMNOC_1		41
 
 #define MASTER_CPU			0
 #define SLAVE_L3			1

-- 
2.34.1

