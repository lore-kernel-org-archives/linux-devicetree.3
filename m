Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B473DD50D
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367037; cv=none; b=uHqyIwzz0KFlPamzzq81TTqGNUcnVuqhkzbHXgyqAR8jQJHL0NyT5U/UHjAhaoAQnScgCfDKcEwvuZDJp2VuCxNpGrdk4VLrdLwHwo5hTnivx1sGHb/yf5pqKlvu80tbqaU7OKkcyu5va+ZcwBVP8LNcLj/CbR3x+1SVIlpXgMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367037; c=relaxed/simple;
	bh=GgOQlj+WKwIJYxC5QLRsUAoKnwyhA7Z5y8FiJwAXdKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MsrnatFtlvcK1oawrJOViE3AGU126OPq1PWO9nJR05E8q2hxYkC8W7+zH0uuctOUwKXUXYkt/csPMPVD/VkEPoRi70mu5XqAf76QkdyELMHa/J7b3WeAqhcDvDPAz33ThG4RzeYWIbzvLmoAGoIbuHt+SdRej3FOQCzlHVeq5QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zc+/Lh+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFT3Zp57; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zc+/Lh+4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFT3Zp57"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjJDJ2206762
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zKz+4lotkXy05Ym8t/zKtYdqypdd3WV7+4QMu+Fg/1M=; b=Zc+/Lh+4Y1HdzZnp
	IYEoSGRGSIJEweHTORSqCL6PX1HdiqJBuYkkSKu1RlXbIRdzToChFwtcD9p1NJw7
	C6P/weUrX/4j7Tl6ZeN6P793UM5zkvx6cTrs3ARbZO7Ec/kBHKykes3m2yzbq+fJ
	2JmfKNqBuJ67JN1SBFulBihx8e4ahxyyvfyRBVDndCs1wLQN47VcfWcrWT1L9tYZ
	X4G3G7AzORzr7c5xq72kWF5GNh2bE/Yr5TqxJYDwEXgLK1bgkArL5j5VeFyLTIm1
	ktM/AI4oEtc5vBpOGMcGwczXJ+WCKUAdMEoEW+P7P9T7AhxhoWw9vzOxyAepK1Yr
	jStmBw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v3skc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:03:52 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4583ab9a376so2033103fac.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786367031; x=1786971831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKz+4lotkXy05Ym8t/zKtYdqypdd3WV7+4QMu+Fg/1M=;
        b=EFT3Zp57IUPcYhuOEaMVJyLAEwv8Ogfcpmk15OP1sP68c1Ecmbl/o9geh/aRPug8ns
         XukT94gHsNWslF1bq/NB5p0QhiCLhkyDv1sfMgd/AbHhTwq+eTB3c+qkk/LOoc+LIlz1
         o0Dk482ULk3+ghXeXvZ4kLhBKgzK7uJeoEsIORV9/pJVnENYAmLzedxBKR8jefvLftQk
         58JwhkMXarR4OS/SYW9exTNDC0lH+wVtXYQQQPYemc9yBiey3OI1DDnoAIpFCdT8IzxD
         RqULsV8QMi2kEvDCyF7DzriNlKoIG2sS6BfXTTtRY60CTP7XsC3PDkqO0081UGR8ttbv
         3L/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367031; x=1786971831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zKz+4lotkXy05Ym8t/zKtYdqypdd3WV7+4QMu+Fg/1M=;
        b=sFLSZLmC00yuS1DJCdgwerwF+kFnl0NLZlIBhj15jgKCuZzNsw3riwBrTf3S49gmBM
         YyhMS5Z6extEAVSEaT2RS5Vl9dIsoQVQPkk/YqPPsQx8su1F7WWWpIqC6cgidu8yu+r1
         3tMowdlRH1O7JoLBjoErs6wxDCe2AkzM8tAIFf3QMuoDk5V/5dL8X2C5U4V0XJPGL9gm
         clAkJFvra1uSVuzgcoICQjrCCTGAN8FaFolQVQOF6ZH94/7/ojI0pZ46gHPq0ei6V8yA
         4VGviYN+d8SxndvmkKYZt/N8YtRMbx3MKwgBg9M84o1E0mGRx2MNnLazEJHTSF7cKj3S
         xDJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0RohdJeJ/Ir81LdTfTsNr64ZzdQf66fmQJl+8xEpGrLayNgYta3XDk71FDE2yE6DH+fMbtOPapQ4p@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3vpkK5dGhIl0uZxNCyGbvYphNVrdnVGQu1pYK5/28AaIOgKeT
	LOnQlwkUSsoVrE/ufoaENyWbnEJt2eRNSHCTXpnyq7YMCicihW5I9A+eU3K2vptpJk9fqo7d9Ck
	+0U/ojf1BIsgS2WuHikueOMwIDOG7jXEUMgjGbBav8s/zDH3Bbbd4K68b0xkcKyck
X-Gm-Gg: AR+sD139JEJ0H1rjPju1I1Kg3DIPMtvPoriaQ2jVYp92mqL0lg3p90oEEFaD7eH/mrc
	h+OYBc6hh32VnZAcTK6YamcMK8oggUPKa18aexCzHBxOQhl1eIuPu4cKJyOE4iyQFs2/TvdlOWv
	q+dHkpd/5WS2gmN6570CNv2aJLKcyD9i1gShLQY73f7d7cQ+sEg6b1fM/UVw5Uk2ZY+hyu5oS2+
	irkhiNVdChc7wNLm6FLNBI3d+oFoYSMJhsMTUm5uMj/kJZ2X36GcoqYVA3mbR7fSAWwgKyLLVmj
	0TIWZWxT75J5HrgpwgluDvGCOZyjCyuMppwToGKnvnpJ8YDyN2cLeEhd/nmw2aASTL+tuawTqmL
	KBXCGo5JmVjrk6BlttpeAy5alLCy6SD9sS7qSZCRQ3j45eiOSpcJhQRzlhfZqNU66
X-Received: by 2002:a05:6820:81d5:b0:6a1:7dcb:b9fc with SMTP id 006d021491bc7-6ae9706e2fcmr24024803eaf.34.1786367031529;
        Mon, 10 Aug 2026 06:03:51 -0700 (PDT)
X-Received: by 2002:a05:6820:81d5:b0:6a1:7dcb:b9fc with SMTP id 006d021491bc7-6ae9706e2fcmr24024746eaf.34.1786367031114;
        Mon, 10 Aug 2026 06:03:51 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f1a9e431sm8218971fac.6.2026.08.10.06.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 06:03:50 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 06:03:27 -0700
Subject: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Glymur QCB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-glymur-qcb-v2-1-9e6ea7987b9e@oss.qualcomm.com>
References: <20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com>
In-Reply-To: <20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786367028; l=892;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=GgOQlj+WKwIJYxC5QLRsUAoKnwyhA7Z5y8FiJwAXdKU=;
 b=527OJ0anRFOB7EI38tttp+60hzk7X8ROaXuVfSiUsGY+RZDWLjhE5on1I8v1/Zv2jOaoQdKYF
 difqJRERvBKDGbrSVQ7/4wpbE5CnIRL+O8jpZQMGKEyekBf/pTWiSe6
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: pdkFjCNY2heao6XFamAuFOf0hn__xj-i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDExMiBTYWx0ZWRfX+Z7jbvpPDKUj
 zkeUOvRxjFO7GhmqvVFTbSvUjjp1idnQvFG2WBGk7s8vzz5t1F9L0OIMp5EXsoZzEg3blsD8Kqz
 i4tIDB+O7gH3OnsBj3aw7Ob5+xgLKCFeUcDfKNgeXZwQ9mWj1auxIOqADR4eFIQ3ZlVJujbI4U1
 mpSK1vw3Frw7y0DdSP56sygyz5tYg3YJbGhCTqAaqEsxw19HmsXvfiiiWDPVvqQwJTNzGA2ysET
 hFott63KHoozNmvzw/KP83I8v5R12XloQZLCITBLJVObW7+Sp0w3alSfW+he2gRYTCYJ6Gn9qx0
 gqmiU/EECbCUhG2mGZwfrp4S+PV2Yv+JfssxAgXaXI+BifYty9vv650Rh+hdITv25MZn92jLE3n
 0rK7uJ2ti8C75S8dx+D+5ZyOC271q7ySNDOIVST69MEoODgsYyweTr5vH/07ExUPjEeQXjQRg9t
 Vp1Cnffs0Zvr3aZDIKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDExMiBTYWx0ZWRfX/DJh46Z/Eow9
 H5j8v5PUd28WCvHqs/O3l580f2l2x4o8cSbGrq88N++gta5OXlzWf71L4C7C8aD8g2UfQjt5yII
 eyqiES3sNt6S+oTAwvHY6C4P/2uAmQg=
X-Proofpoint-GUID: pdkFjCNY2heao6XFamAuFOf0hn__xj-i
X-Authority-Analysis: v=2.4 cv=c+mbhx9l c=1 sm=1 tr=0 ts=6a79cc38 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Q3Bq8DPiCDqF4iPHc2QA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100112

Document the Glymur QCB (Qualcomm Compute Board) board id, an open
form-factor Glymur board intended for compute bring-up and power/signal
measurement.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..68f4a3b18afd 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -88,6 +88,7 @@ properties:
           - enum:
               - asus,zenbook-a16-ux3607oa
               - qcom,glymur-crd
+              - qcom,glymur-qcb
           - const: qcom,glymur
 
       - items:

-- 
2.34.1

