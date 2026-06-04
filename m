Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0DC3BED70
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 05:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550811; cv=none; b=oltzlDvubAF1lcdIa54CBUWDdFr23/tHrWAB3nEsM7t/iHDQ2cqKmf4NNUOzjOQj9CCXIrNgBIE5syVDijEiaEVqRYAPtP0J+mb8omoTBzHXOJ2s+5t3MzYhyh1XGd4Q7PT22Teh9JUxW5ExV+9wm8IWTRM7xh7VkJI1Fc1jPiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550811; c=relaxed/simple;
	bh=9iDney/4UaOp4gyAQJJgqYiksjkSOYt9Vy7GvLh9Yzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YRj6lXqPao01U7k2Lopov6tkUkIlOCpGTlEbuu0kqkrTMr9apvj74KIIDkHgMqES5lOXfs0Swzx69FiK//kxDGGp6UbwE6ig4WQjoME4YOwQSNtlz3CcgNStOqf3/z7j3yR2fUkY/2+OAGowYGoX0TFOvMet2ugYcc9NOofyBws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hmVAjKsd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+qBT41Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmVAjKsd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F+qBT41Q"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540ObEv1476759
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 05:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=; b=hmVAjKsdVxEFlHjc
	ysMv6bgDRHL+YM6itkKc6vq0rAiN8h7XYMlXEl7W4io9H/UjogLMINwY+sYkZy23
	V3twBR02KqKfjKZJQ+2RFiHkY2tQX+tM4OZAkH2L5JSiM/9mRObPvSBpfMMNyi2L
	t6KgAijahIgtOu/n2MvdBpwXUC4Lt69s7W4iJGfJhU42fb1VD6S4zYsAExM6Oy4V
	Ck7FNMg8MdllYLcTL7RrIlwccHQ1zTAstwbkPdpjWRJqhqE5+K+bN7uek3+HTLfc
	CWa89UKHMCONa+Q1sLG8LZtlCJcfQq7S1Z/00PB6nc5C16xVOQdhMeAfEcv+YATy
	UOf/JA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nu4m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:26:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85759a8f33so924175a12.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 22:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550809; x=1781155609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=;
        b=F+qBT41QU4BuF4HUCmbGa8jdhS5u2t5B/oBIwCS3S9H+CA9MXbxSWg/3q6X8u8Fa0K
         qxP+zxEgfuXxFHaj1xEiooY9V6bxby7LZSWut0x0iXvH2yBKtLIxXeGzW24uklsdV1CE
         92f+CKeBXgJpwbMuGn6DauDj4M7D5bdKovLip7E8kLKNjzrFAZJzvPKOTa7bk0DnOaDr
         3C9AQebPJnDu12Uqck7mTM/ipNaLCs9cynUiQvuzlM+Zv/FzRhA0nds7A3cIohbodeNA
         ZSUMBm8sACXX1aN1uvQPTZ8GauM9I34CafeItbJC1DfGMFQnlsxGyaehcDPHvePqm35s
         tiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550809; x=1781155609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=;
        b=TjbH8q1XTLXvxfc0NUDPkUi8YzyoLiMi8Gk6yHEyBoK0/MOZIQb1HaiSldP4VXfkgq
         KPwABStVUpEjNWdTghm3XbIFa8EZT6gB+YWt8K/3wvau9tMyTXeAdae1B23OBZRrb1/v
         6GbXFfUTThA8VCJGmq3GZsMfUTUWGmLUMYu4vsiXkoXD8kO3Nu7XB0RwWBzKUjh+wplR
         gS45pe1jrFucVIOcZ46o9jZfkZER6izCKFL3nidYkT1ta5UIVOsf3boUb2RegqSAarZH
         nIhBunQjNqRyN6LFrBhZvTDWciIPrlkUrnrVqfr5nCgtR1bn8CgJou1/OjVi2KNsfJFm
         /zNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9K9BvJNItIb7fUXEWvEb2ava8r9R4U4IBCu6pPCfGPik/Tmz/ITkHoiEdo6GYyyND4LkViLPKdsCD7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Up/UgyWlkA2sVnHxcRuo+srOENkVrGhedTiPv2HYIKU1LcVk
	66cmyGfiU//yPVztKA2m53Q6no//c5CEwhojZ/F/NB6vzMmNtnZcf+5BKAfAwYcziHBDDNigZ1Z
	CZeiTGIHWQkmRTvN/ffSKlnlH5Bs26adJM9jaP3afWVgogv9lPmW32SO9Q3ABbgo/
X-Gm-Gg: Acq92OHRsUCpLKmOp/XIZlGCM/rNImwv4fHDO+ocTMSQcXIQRvdBkQqY5BlO1RhjZvw
	7DpYZgdY5rbKJFSpGEZ4bLdzPUB5/N/8LuxcOKDwb8XjYo2V+EtFljNxvP5cpvL7CrwtU+C6ysf
	6PXcLEdR1qp5GExxkz3m0vnV2ve4OmolwDsDJc1yX9l124udUQNDZFBrE3B0axpI+m5FP3jRzkQ
	x/oKrWXGwZPjoT0OyeyAQtBHuQMNpqnd1RKBPb2afqcVnMshvq8vBtxlIEFH71Vtwvc0KyBjnv4
	QlWpE7acx99G72Hl2XonFVId1n8JSScOdZcSBE8Wj1hVIiQtgtuKHEdb5gIqgNAucUOyvcTL6Vc
	FOKFtZRlNHd9xej7rfJTR1xOm4siE82r1KJocU3HmAfIvbPF76aXBp7Fg8ZnOIFI=
X-Received: by 2002:a05:6a20:4e9a:b0:38e:92f6:9ab1 with SMTP id adf61e73a8af0-3b4b1ff2723mr1938600637.22.1780550808950;
        Wed, 03 Jun 2026 22:26:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:4e9a:b0:38e:92f6:9ab1 with SMTP id adf61e73a8af0-3b4b1ff2723mr1938578637.22.1780550808487;
        Wed, 03 Jun 2026 22:26:48 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:26:48 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:10 +0530
Subject: [PATCH v4 04/13] dt-bindings: clock: qcom: Add Qualcomm Shikra GPU
 clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-4-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: USOHOEWTMtDW3Q82JoCCDCsSS2NzaYjc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX4ah4UDY686lB
 FU3hcm98eyEUg9CFuEK89FWBx0/AXa00UPXidpAwiGDFiPFyeD03IdQhBoRHnOxo71MfW3C43QP
 7Zj9+zwP25VJJAHJkf+L/dt/Csa8dyIcG0oUZ/Sba97PbFytraP3CMqbA4bnER+ZQKH50BFHUhX
 uD2Ua+57GBnKAD8Xx/uzgUASDRyZo9zVMlNcuwLOy/TO+gq5+DlW7L1GXoU2jNmhsU/fHx+hqXE
 B2ANrUA+P/0FSbOwDj2nw6P/d0y/YIiI7ws3KZVu6vC1uwSZSJV6a9rN8phS4s7HJ6ZhkWUnGpr
 lJ9CfdgUa+2SNp9k2opk61sFe8vk8ZE3f7tVyjFhfyCs4SQGbNbReUD+00OtgNj3gkHFZqsef3X
 XnVHPMMJ6hrbe7Z1aJ0PjsH2CZaNnQjRqJfdCbZVzdy129vtQo+07xuq91ogPyqVUJnZNBsPljq
 1ovl29/u8MHJmeVL+3g==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a210c99 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tQxzmpfZ-Uf8aLjc2qgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: USOHOEWTMtDW3Q82JoCCDCsSS2NzaYjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with minor differences. Hence, reuse the QCM2290 GPUCC
bindings for Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
index 734880805c1b981a1c899d85435f83f4f3dd3ea9..1bd70d091fcd7b6d7805ac090aaf840a415c123b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
@@ -18,7 +18,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-gpucc
+    enum:
+      - qcom,qcm2290-gpucc
+      - qcom,shikra-gpucc
 
   reg:
     maxItems: 1

-- 
2.34.1

