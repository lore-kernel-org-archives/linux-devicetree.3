Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA253AAF71
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 07:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260483; cv=none; b=nPHHb42nkydCSgc++Ah/z2MIOdwsLT6gP+MWxiikYJB7VKmScITDJ1GVT9JOjlE3vMH9yrQb7pIaP4XViIgKnkY5jnVQHFCrDN+06hsOyadSjIPdGW2f5P9TY0lEZ2DFR81WwWmGpTXjbqTCtnrEbiyoJ5ObyICM/BbsfBlccXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260483; c=relaxed/simple;
	bh=8BR4rtVhwYePx7OtiyyvFiqv1zeYmDvcmqStXzdoc6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kdOfUXBK5vmKlQ2xixPc0aDGSkeYemEYc5gj1cBAbT6HwjS/LTBdCpukDV6o/Ta8rR08nUNP0EvHBp2+pzaB6zwgw+1LSPNhS8Yyshc3YVKtWBq2jP/eEmqKNM9s9RPJ+sijF1VNFJpAn3ZQPneAGQDG8LdJvI/KxroazEx2Vck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rq4Oqh0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AM763D6X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rq4Oqh0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AM763D6X"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795df9B1916620
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 07:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yIm0jZKXauOTDvdwqOD46DoyhqsTr6m8BML4p6crnEQ=; b=Rq4Oqh0bjk9alcCp
	SzSl0GW9LFJKQDFyd9i3tae10bor6flIZJhYjmGklKEkHb+9774dxDcOcCf9/78a
	7cfCeJXA1C2SXBaeuW2ZlqHjTAYY3xNWy0amYZ5/eSsTHVfY6n3Z2Pml4kIhzZ6K
	CF+g7wcuxURZTyWurPQMFd/nz0ao2+G8rINDIvojHzCpb69Jpw/uTlLWLWZZHfkC
	KU5x7O6ldRQPYnZrHIaZpw0W2JEfs0J8iii1Ms44RtijhRMwS44YtJ+nSFHQQPYN
	SyvCrJacFqQ5KPQ2P8kNowjSnYpsWeO6EYzWrDjhltJyiPjRlssNYsvoL4jWnJbz
	uEcm9g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwstp2sa4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 07:28:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso1154061a12.1
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 00:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260480; x=1786865280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yIm0jZKXauOTDvdwqOD46DoyhqsTr6m8BML4p6crnEQ=;
        b=AM763D6X23Tqr6YcVYewDDU97+cOKPNNnrWJFj6jQEL8qznrhoBaaEfoJWAF4oSuBm
         SO2JCFmH5+nUbEWbv+jPJYk1etMKNHJrctYYOBL7izBLujph86BRbc18M0c2EdEWlhz6
         aSVF1wCPGog+uqC3lZpfDNZKGC8I/eOI04pI5K1oyiMcb6tHWHj0xFxRDw+oeCENBY9r
         lv8uDTZ+gbXhouNVwHIvqvRlNnO7s+jJRSIljgBW50HqdmwowUjHZSdzXB3PuPJKphyT
         JlcZO/LNhXwsPD6toFnGHRKmyCmzhdXOEIrV/jN80yAOOLZTe0mGlpbNiHnH8Q0ZgkLD
         +kBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260480; x=1786865280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIm0jZKXauOTDvdwqOD46DoyhqsTr6m8BML4p6crnEQ=;
        b=TsKEUBrtarBPFb4OAGOUAW+RH/+mipKk5Yu6MsX6UH85V6htMRs9zLBNiC80ttEQJn
         PMT0XUPs0Yw55Q4ldqnDGiPkQdV5lIkjmVCpStT8GMKoc+3/dl8PSnbX3H2WNgJfknU+
         lVTO6tzs5rjziMT3+yxVU9gkuVi8dEGVOo1rtYQDEUIZpIv5z1DyTbD2l5Z052Cv2N43
         wg7YJTmrf6KSAEZwhj/VtfquF7JYyFozy641rzyGD0sLldy99SYfwCW0vWIPVVhZzY3+
         DG7MrHMMTwjFKlWvkiB1lQLwUrbXvEMg/sWfvdNUAkQbJdoqRy1DHuQ77ZUQWaOmKMGm
         TUyg==
X-Forwarded-Encrypted: i=1; AHgh+RqSne1xNeMHiQZ0p10cfRd7MYlZLrLjcSqN4XIbNbfmsaR4OiKI3Y28P6rg5OSSog/siPMwKgLUfoRi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx57/7tYdK3xloox72denSHVM9a76+BIGkLyI7/LGpzeNAiFj21
	FdGpYaniEiyFLxyR7FU0TaBtAKE18rhncAOtg+9YcgwTt66wQF0AhkV3hOxQRzvPRiPK9ID5p90
	3D1l8kPP8IY3b0H7ZdMcnR973MWoya4mF9jvDb97+pF8NF/f/+rQ3y31NVGgI4l9Q
X-Gm-Gg: AR+sD12sQu7UrN2WIUUFYj0VJfCgYt8FvmmaNfE+q+rGzqhtAAm47ys6vtYMbjjSrJB
	hoWMjczhyq+j3EKiszgaGNIL7r/uNXlkZd6r9ZFqq5CMsduaxcQPOo78H2KJlrBjxitOqKRlMBD
	NDG/FONpU4hEH9xBjOGVOytr1f76KxPp6auxHxju8zWpKF2EYMin7OV4c9EvZ5oJLCFKTO68tId
	cwgbP2D45eUP9wj4IbSm9gvZ1iCNYyjGpeBLPHd7ci+RiAAvJk7owq2KcnxJwiiqV1rNCkOnZ2U
	EPlJb4nMwJXi6BRmXre6bAEX5yjGhiLHBdTSjSagU3iNjsYm7LZdISQuFunkm6FLByc8KPdfkQx
	nemyIK4SjvOwJkWhHAMNI25fmybPP69B+xpGeo5o4l8oJPUX/PQeJ7O1KmhaUREpIeIdQXp6t4O
	GLFEvyclOgAMhA9nddRaMk1h0=
X-Received: by 2002:a05:6a21:485:b0:3c4:3b16:2979 with SMTP id adf61e73a8af0-3cb85f0397fmr44015020637.30.1786260480347;
        Sun, 09 Aug 2026 00:28:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:485:b0:3c4:3b16:2979 with SMTP id adf61e73a8af0-3cb85f0397fmr44014968637.30.1786260479773;
        Sun, 09 Aug 2026 00:27:59 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:27:59 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:04 +0530
Subject: [PATCH 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-5-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=1953;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=8BR4rtVhwYePx7OtiyyvFiqv1zeYmDvcmqStXzdoc6M=;
 b=oM+orUQAPBHzZHp5jc2/qebVjZZltxDLCGWAQfXWkQ6aLU4WvkutTSjn5WVErv6sbrMedwMW+
 Ik07bfCbxY0CLjMcgWq/nD+skzV7Z82JetCFKudS4cr/LqMJU+NSoky
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: 8Rdn8C_1C2tXwzlWAJHrOU6Dcw22gXOL
X-Proofpoint-ORIG-GUID: 8Rdn8C_1C2tXwzlWAJHrOU6Dcw22gXOL
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a782c01 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=81ep5gnlwPa1PUBqnVYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX/ZKEyontOh5s
 Vi+wYFxJAS/U3e08rIN5+ZlCTlpQSVsmTJN8GX1oBh122c+splmIHACNJUydzP09GJE4AeKogmX
 UqsgXqB/K8spOMhj0iq1jf/RslmFEZVwd7I+fXuc/Yz+uaGQlZhOmogpVfbiNpC8HCOzX9UVj/F
 ms6LyX3GiygD0/SrZ2chllSq/MjFJOIm/wBiCw4RKxHYD7NjynuZ6/DLgLeQrgXDBt1+2EY8a49
 KSQ8yZk0Ey3auJc1gZ6J1LX/vzs/YMMyEwyMxWtn2F4RoiDoiJAB6zbGCMYsaWYOaLSKmZpC6sR
 LHQo5I/LH9QBRKPyXq77TRthBlkLCeSrll9odMnjBbqAAmNAN99c4wvZUKU44lyBS64gT0xWtmm
 dz427UPg6y4L6QC4fwUjNkN/z+CcyMfGS/+gMthkM1DfzCY+jFuo3GOfJFSBAq2h9axSMneeF6c
 UNF+Mgrvni1WqLigKJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfXzfhsEWymGt6M
 PC0SA8vi6NHF4+Xrty3UCWY6P+8pzRBHgQ5R4Wvrj/TBYPPLfN2p8h1LuOk7198VCP4dqPUFygg
 bnKgutToZpLUNMKXdxJSzZ4h/UAQs1Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608090063

Add the RPMh clock description for the Qualcomm Kuno SoC so the
qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
always-on variant), the QPIC BCM clock and the IPA clock.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 6367b2a5a4e0..d8c3a6b12d4a 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -943,6 +943,20 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *kuno_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_kuno = {
+	.clks = kuno_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(kuno_rpmh_clocks),
+};
+
 static struct clk_hw *eliza_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -1103,6 +1117,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
+	{ .compatible = "qcom,kuno-rpmh-clk", .data = &clk_rpmh_kuno},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},

-- 
2.43.0

