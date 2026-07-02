Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49724355F5C
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017204; cv=none; b=jQysgxt/7RXIvukD++fBZOxS3hwZY+PyDjY+a/AAkY60CqXm0p8YbLS8cAbFsXdh1ZADgfLNjOUPqkFnT3QZY6rsKxi475n3XRk2FO/Y/RUj0SrOTq6smIeTRLHDDLxxmo549IuccNyWHEfM6BU6LCzT1x3aSC7LnnHANYYbl2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017204; c=relaxed/simple;
	bh=19mmEckBUJGeN9DN5ffYBqQt6ULi+z66mXHOJ2yQjMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6a5PsNHB2ssYaL6SXbPqOQXpdFwrOP/KAaZB6W/xCts3Es2F7krySp/rsC8kZD/v3HAxm6vVvTioC3Cf4iXOopb76r2Tx2ry1/LSpLcof9m+i50jJre5Xah1cNUlBbcZDpVwHgTi8n/g2qbZKKCcrSJi2zHN4JxsxtLQ+zkj50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evGfyPBv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AAIwErJA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evGfyPBv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AAIwErJA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3di6560343
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 18:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J5D6hk80ySWEIZRtu89Dl4syOBTuObuXvvf5lY5zwZ4=; b=evGfyPBvZJxQtmcG
	/T3aXRHKhAuN4xE3yJgxPLAic6M72JazO0smK1EgO9klTPwTSJq5XhWhKYgeRKJv
	FMUNEsdO474K6dyxnR8GTuvni3dIYjGMfslJSda2vsuYQcwN8PY7O8sYyyFEPySP
	eMwTmt4QyCOJFlRRsIWMAJ7uLHKpM00Ia17970raXiNC2DIrOuLUu9ofPcZFu4ej
	To6fb2GEnGt1Pz4yqYCFaZ0J6ZR+pBKDZmhHSJsY7JVAl5z/NtEJVZFIFnjIOZbu
	+qok9DHXZDJDQg9AOLMVhobzgnKIOBt4YcAMiLJ6EBs1FaA/cNabBEtva4zHRFLS
	FYXecA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bjbjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 18:33:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c860544c077so4037945a12.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017202; x=1783622002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5D6hk80ySWEIZRtu89Dl4syOBTuObuXvvf5lY5zwZ4=;
        b=AAIwErJAJ7l+u+65ESr+oDLjy781Ak6qEcbFxX4uDITGfUsgRd2qQXLc/xTwp4OJr6
         /uHU2p6u314ErThxJmBoMnxbnwt2iwSostg8u+OfHNdgPQHepdtVWq1ZxD/CmhiDh1TE
         TvQA2X7yAvqP6al6WjFsRRG8RtvrX2+dLf1vqvdd5RVts/6frCqwrFOUdwRz3QlGjSzK
         W7MX1akZpyEa7we/+2SIup0AVz9QOd5d1whXl/gdKaD4OFg91fAxY2EGoGkfzCxHHTfF
         hQm8HBRsoRBnXEm6EeAILVSxCzqbvTT09PJ3g+vwLrqUrDu5NAVJBVEf1y4lVBYVDT7B
         YpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017202; x=1783622002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J5D6hk80ySWEIZRtu89Dl4syOBTuObuXvvf5lY5zwZ4=;
        b=edizRA4Jy4JUUA1Sge13LhQHZt6A1Q36ZuCBHTDSfMD8TEK8U+foMEv08TgbBq4ADj
         DoKB0eLyFaEcdIw1NWpzZeBbEYuS9wtWiq6m4k4uRjnozcTaUNxkCo+gBF/W8HTZcDYE
         v8tMjJxTf1psxQDt0rT0RSEGfuzhTdCJPWvsAWV2g0PbUtr2edv2HVbV2yNZw5rKHB5s
         IBX8tTft7htXo9eSvIhCxx9qUluEcF9+sC6fc8E5mKSqDWPb0MxbaD4nU4MuuGsOKEfg
         hVDBy79UyUcchIfhkYK+hL8JHHZwi1bkGma1e3rbyHkuebzviclS4/emUyT4zw260gS6
         6+wA==
X-Forwarded-Encrypted: i=1; AFNElJ+vzvf3SPCrWUIHXUak8hiFPEFrYd0UGFNqnWj5PIFn6o+pvrkZuciDpbdhZQEcGgVL2twN8tQm1K4t@vger.kernel.org
X-Gm-Message-State: AOJu0YyXmlEVH9Nnl3Z/UzkP2GJ6WSfD0S4qvsBS7ddKrFpgXaHdTyBE
	2Ssu8vCqdbi1vA6jlXIPXX+1MSw0ONpgOimHayxX22Y4ee+qMMUwzaJSuXLaouIrf07qCMphZxb
	LX/iNr1evmV5biOOoZoO1GQAHrKZh+24ifpfvP2FfKxdeSZ4CNPLpIIpJa+EAsQ8U
X-Gm-Gg: AfdE7ckVHU9O7AZPDFoojdpp2spIi1XC/Vc5CoInf0EUZa5bK0TcrSSTEV+bLompUBP
	neVoTFxT1MEoY6GO2AZ9wlrjSVFok2kwujO3BvsA3XpzrG4MnmJgS8r87woq5ShTtFj9TXGbM8Z
	j2RGGSEDs2squiDH3mV3R5pNDTsRVcixkjKYeIl47I82YUbEN2iIfs7PSsgSviGuPj5iZjkHu/U
	3GKcAMxhw+6l5geU8AA6VUzgfa9QLvSZWPK43tzxREKQJ51YF6NbEaPkzRmMpjMg53zoXAsQm1g
	i37mcpYHeQLeua0+lVkzSwtE/VPSactQberlfqV20m6Ye+4YqnqiZAxhHChcYsKNP3D9t5C1Yt2
	cpj6jMs1z3viNca9DjDlETcqf5RieVGRhdV4PqdUchg==
X-Received: by 2002:a05:6a20:b786:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3bff40c71ffmr7618615637.20.1783017201424;
        Thu, 02 Jul 2026 11:33:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:b786:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3bff40c71ffmr7618581637.20.1783017200953;
        Thu, 02 Jul 2026 11:33:20 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:20 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:27 +0530
Subject: [PATCH v5 05/19] dt-bindings: clock: qcom: Add Qualcomm Shikra GPU
 clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-5-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: W8N-hOmYMcpeOGqJUzIwpmF_w6IFFRwu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXz6BwQWs1/8XN
 RnpvPUSHPZLlbylfjxdMh8A1W37wGylRncjWK65hq8Yg3Tqvx3jdy94Pzm3KDlRuByyjWun8YLQ
 TL9hAIDpc4LoIHE82hciA6xdMT0gGwc=
X-Proofpoint-GUID: W8N-hOmYMcpeOGqJUzIwpmF_w6IFFRwu
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a46aef2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QCmBRgXzxa-qq5PbeBQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX6YtJGI3tZvoO
 pk1gMhlBxr8hlORu4ymnoeUcxPS9CdT2jspUlmsKbZBcQB1KFvYnJN7jvveNj1SMr/PH/zAdgax
 P6tTZqQpMRd2yjTgsK4w8F8ymm7Z5u6CBBj05OomQ6ZUsH/VlkHujCuATTyXQo7VVWxRC6k83yh
 LBy6f+3UbToAZ5nb5oeluCCkau9O/EsmsiDEmtP1cJHEJ/hGxA/4efdgBcEFowdlqsVyVP997Jr
 ICfTdzIi0SOKfyobN4pNlAxNcR3E3QENvxO14m60Bidz8ZiO91oHruTMrW4oWvYrDydumoato/R
 twuOo2dOyfpW23WEmAUGopblW0LL/P9eWYsMLNqKF7wQ0MdgH+h5qan3vGN6aErwWHtZ/ZUDfSz
 xRlFCMPyvJGl2xQXQn0J2OdPZsXwxucLBFm8815irBktBAGnwTUouYlkH9w7n+qRUMCJMW8fVWQ
 YYCmfMCAzosTimM4Q3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with same set of clocks and minor other differences.
Hence reuse the QCM2290 header file for Shikra and document the
Qualcomm Shikra GPUCC compatible.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
index bedbdabef67286afb6ce0a1ac53d1a9a15a01a92..ad2386190346cc10f53763e7c3b9fcb35fca8ed5 100644
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

