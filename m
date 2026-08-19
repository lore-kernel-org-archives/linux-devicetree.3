Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEC5369D63
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144033; cv=none; b=n1m5MlBFAvUtr8tql4hV3Us0mQ3BpKFuHxmW3y9D6VpsJ87aOQiyFVSqr4za7M11L7ABC0+pUp7cNXL9IEMTb4k845jK4qINeO3jS/CtW4TSbbP56x8Mi1OtjXltHjUGIOBV1mJOJrycmKOEbwx8XjKjdSCIlsKLTCf47zMBFtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144033; c=relaxed/simple;
	bh=lRo3ALU80eN8NLOuV0UOQeuSVv9zf1v4drYuyPGYgDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tP6hjmDNdKj3qvLQbYBEat6qzyws055uwM93FdiZISF9adtYygDW8/MUeR+MVhbd/47Vk6JXW1JAdqtccCfx7lgpaW7g9ihPGEPj3mzJlxRPh+zdW1oQM1NzT9RCw/CTtRVlJZrgxtS8G10LerpYoj2YRqWdE3hvA47ZSY74IsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFJEnTZd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jb9Td1Qc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFJEnTZd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jb9Td1Qc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClK0h4016647
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zSKwl5LDXICbGwUAIJuk+Vh/EggkwaR0tn1iVebnnkU=; b=XFJEnTZdYpMu2VIZ
	j6hg5IoHaxF5SklFUr4hi0qTCz3Y/Y+R9WHB8cHgEpZI92VVsrhazwiyQfecRlq3
	q2XfDbj1OwaQS5H3ipDtg1YiR6iVIV5+VHCmnONGNSi0IjmZ1O4KtP96OPLnyx86
	YolCeCNZkumz92sSN5aIdMF+CIu4n05asoEZA1OSBq6bfbbUHLdewaC0vq5MusRE
	juc+m5EWaqYLaYZEYhLYQFM2TLcfKCCRr1pjm4IK9UfkP4Tl6ErtsswdiPbdONav
	26gkwIPIvgDVSHlpz1d412zRcsTAohzVo2NGvzcEnHGgb8CgzBrnT9mqujDZTaE2
	j2s02w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkkae9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9309af14fd7so114240985a.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144031; x=1787748831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSKwl5LDXICbGwUAIJuk+Vh/EggkwaR0tn1iVebnnkU=;
        b=Jb9Td1QcZBKdJv6QOQv1OmqCikSW9Io13fPbhybEH0/GM/GUvzxZ4RlAeCINLEXCVL
         0ZbfQ1uSFEjZAyxVt6s80k6aKd9i9FXPRv7iZ3aUAriN2wkFkcZ2B2Rdh8UBNwhSH0PB
         B0cktR0i+DihsswFtTwEgkiNwWUWvDBllVmOR0e3YZFu535yP7Adf6Fp0IGv5hvF+Cvn
         POQvsVDo1/q7O09qXxdVo8ZjnjZvvx0oSZfoBDhfC1PLgImAdWaAciEo4kRm/yfoT6NK
         HPaVh0rsa8+J9zf4vYF12hp6a7JAz98ptX2neu6I2K1r7uDmuYGxGrEyb9ELMbKq8sB5
         V/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144031; x=1787748831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zSKwl5LDXICbGwUAIJuk+Vh/EggkwaR0tn1iVebnnkU=;
        b=qBiPj1A3MbqA9clUyxp2jus1Tp9UH8UaMCC4kVkfSSAGEiWOQrkOssomHMs58oonG7
         sjM8+pQ0JAk9VT9ssT02PUMxTL5NrD8cYeqSLwVJQ9Ahwch5lCjwIZQjaNMaTp2Tlk/A
         fkx/YGBXPiWVxyqYWaig+cFSvWgMt7jYMJA9gYmdZOD9dkLWh/VBfJrlP8AGdd1xMArU
         n7ftIxfJer+TdXdoaK6BYWk4pu5TGA0kdA4apHZygTrRwBptpdVGhr/r69keInAjr14R
         bPtyaqgMA1RBnTUFERlguqFM5iOT6yAu8MS3FpzUB7M+DAVzLpDkIQ3vv4MWJCHIagol
         QQJQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJWctIpZyOk0jOfdVZJgJUvjJC+0ResjYpuYHGipUX0pqcmCbR4xcgEGuIgLFnsNFB8qVnN3soFa7L@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoi/DcgkVznY03EKFnGYdo/Xz5SzaUbr0NAyBlWQH1SseGItgd
	C3gQcxUYBbUXMwX5NBkYj1VcBwoccRRyOQ7STyRYgf+eRWrvyzKfutTYrCLny7F7fec+X+wvLrb
	fzaNGgXdMyv+U4JTm4CzJYG7oBmjRrC9COSzPzP6wjA6Df+DrQ0iUzYzjXljAWXOv
X-Gm-Gg: AR+sD115IeriIU7p/T4wnaofSG4SuYHpbiVHzmphASwDkKQRzfqWCS6UWQAIyKNGtc4
	bD37mks5NE1SpCsQDMMT3TX7PSw8WCIRLB0hS543Ip0Kx43p3hyo+bVQW0T+z4qsHt7IN8K37kQ
	bfASHd5Kc/Ra9Tpx/oU6PRsuDgqEaTByAMFx8yS4LVjJ5gXwZlg3H4smnjJYhbjrsFzkxvoAQxh
	NAdKOg8qi0Pyi477tCitaZ53Ay1qSUFvqwpEHnSq3cxgbCVBVURZcF3KPrmTP6x9gNX9wW+iZnv
	YEjOeUIk2LFLHLlIhbbedH1K8E8E672KLfu+SiNZRAMJQZugov7f0EgYveQVoPPEGsvZJ5q4O8P
	MgK5o4gGd
X-Received: by 2002:a05:620a:414a:b0:92e:5fe2:fd35 with SMTP id af79cd13be357-9371e678dafmr348883685a.32.1787144030605;
        Wed, 19 Aug 2026 05:53:50 -0700 (PDT)
X-Received: by 2002:a05:620a:414a:b0:92e:5fe2:fd35 with SMTP id af79cd13be357-9371e678dafmr348872985a.32.1787144029511;
        Wed, 19 Aug 2026 05:53:49 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:52:00 +0300
Subject: [PATCH 15/16] arm64: dts: qcom: kaanapali: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-15-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1012;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lRo3ALU80eN8NLOuV0UOQeuSVv9zf1v4drYuyPGYgDk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacuJl5k/5gtHuqN3D8RE8paN6hliA07HJq6r
 8euavzM5EWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnLgAKCRAbX0TJAJUV
 VoLaD/4nuGMbWI7OW63djbaG6+v/BmDy/5cdHu4K3Swt9y/UfsIF+OnfoK6t841HLXlvbclaiq+
 rDBnacaHNa1MHwICcGxj+13QVOSHBQVEJ7dZMATxTHEMCieN0Hl7Hj1QpwWRE364B5ByZfaGWRQ
 4brGQOi+zC7SeYZFukakIBxDBZqzmhhzRCVuQkPa70O6qVw5cH+FOvtsdfGwklhGJzPlAyKT8xt
 4K3qE8EpY0aT+QpTbq3nLM304xBf15T80ptXU4wIsa+r7bObkAhrF5Ub5yumDAZZc7VtuoFygpF
 X0WUW3mPKXWfKGq7a/eOD1os9cbyuxHgh/gRnr6AQQaqYvX+8RhgaoSKWtE+jqiW2uUKvWMgwKK
 YqBzIOiwkYdIvQ+dw9DJwtv2YywJCPQbB6zW2YYb5n4n3hUAp/1crT5gITjYiNIoyix1hj8y4uA
 HKcG/RiRjuTrIWa1pOi1r/geqLapIhjS1Sm8VdNmpMtpwYB6ry0Teb5XdVGbGKCUbTZpZusHaAc
 RTxep/GQWZYr2L9/PvsKosYnsffgfYb/+7tlOjMkPWHeclNdLevTFCnpNi9nL+HuSzy6tRneUgz
 YCqcJlrC3gx6T/JV4yLjWXMZ8NCK+MWexwEMY20bswTd/Ho7ckTSrzLnxAohDGshhuDDse3hf7a
 VrZDidkXVcilACA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=NoPhtcdJ c=1 sm=1 tr=0 ts=6a85a75f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: H9m8y6O7QOyzqKIwXyd42ADHhn5WZ0bx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX1WMK8nl4qJrs
 nebo5cIeSxPSYMrcNBw8uUT21DxYMb0btPlHrFJhFIIbKwQYXl8D70ti5b8lM/7GF8cZy0bXTLg
 0YH9x4vEe45tJ0gSZvTRsLno5qABFJ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXygIpPTJuWsbN
 aDrZDqZnz8SIj6IuOIESkv55g47bLz9BaGtUvNL5oowJPD5dHry7bmR/RHhVj9BUS+EqVWNNXLh
 DOaeiQYXhMrEeyfI011sREEIxrzsmI/aaBdH+8Cd9CsHmoE8t1pafjoLcvHYVyD7d8o5q0j+rQo
 k69sEnC+PUnv3v45845QVCA1twxrhzZmODfR8e6vhK1bgMObydQZNV+KQrUY4m4ih72ssiydcP7
 +qMH3H39IrH7vvCTFeXb7GuLOvSFg1D5+H6u5Ae8nGP8i/HcjjEqfxfc7h6ZLbtMFfHJ6/48fuw
 6bpNQEHB54OgRqclGSiA4yQObVpTLxBqfltWWwU7//r+NY/wo/XQ+lH9P34zRdmRUuMZMkH7REX
 MWmMFpyq4QmLnnVM/EuJn/kikJuUbqrrzEGvKvQ0yI4zyvMhjz5oSM4qHxJOewJ+fBsYbeqWPes
 59uMQIzrVSvL4Za0atQ==
X-Proofpoint-GUID: H9m8y6O7QOyzqKIwXyd42ADHhn5WZ0bx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

The GCC GDSCs on Kaanapali are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Fixes: 2eeb5767d53f ("arm64: dts: qcom: Introduce Kaanapali SoC")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..c1528cc8b7b3 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -552,6 +552,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

