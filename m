Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663217;
	b=dfCPxsWOu0ULCojHZkr7KR5d+eQkuIVXYcqXAaQMyHJO0FGWg6sMs84oJvY5z/ZmA0rw
	 O1WZGce1CCcNLhrFEBTLs49dc3QgNWBYeErbTP+O4FWPi2aHf20RCtPSOFog7jDYhjhSx
	 42qrHKYGwwqXZQkH0S0FRhxMnhe5arM6iSw/3MjnyCOQVU5RsLI70QvH4IircJgp3SWvB
	 lELAQvo0/KaZJ0PYtIF3RupGIkuy419f/mI+aY66jFoZhZLzLGZFpHkb/ZFkBHyd7Nt2T
	 CkrbinHBjIiEPwXHphc+8OtljpiEXF7zL51Mhr+x6oEnum1Sxnus4gydQ/KJeev4+8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vJO44KrOOjKHyuAfn9RvfaU91UTQC1yY5UAm4QAAsXQ=;
	b=SvA4QJER/wqCHYqSplOEJB8QpmpwkTQAbavEVrgqNM+pZbgzteYNBFfbkGYT7Qo7r9i/
	 9Ay3IqS8w0kgk2Msc5LbGZpPwiNw1JTBtx0qrwebJgDoBbcimcCZSPypmJZ4UkFcpzOn1
	 9bPDh2PUSnSliVoDaPrQ8ZGCLwpfFeR6VJBJwQrnCNeF7b4pN/Q7XHRBrw8HCpHLbd9hG
	 wFKQ8oazZ2OrtJ88delfE+hIenUXQls5LqkD1UheaR68nJMlrq5KSKfprTPPIUd385y+A
	 N3W0kvIa4705PbMxJ90rG8q29biUdbXoV2Og8YCPrIaeCFOQ8kORaCMLPWIDk8ej6eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BE1oZUA4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jvJXIivB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C18606A33B
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C18606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BE1oZUA4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jvJXIivB
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wIkL174049
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vJO44KrOOjK
	HyuAfn9RvfaU91UTQC1yY5UAm4QAAsXQ=; b=BE1oZUA42W6fgiC9Z3KFr5aLwF0
	qrSUMj4QcCd80jqeRGzGyuVmwkt3sz3M8NPBH5SmH77ILW0Atf1P2O7UuQKZvqJo
	3Bnz3pcWOfqJ96SLmG9XpB91vm9bWQv3qzFiNmcZHr3dE38oWklHj9BzYG8znQ2f
	wwv+Oig8bGCe/TnH8/pEKRW1eK5ZGAOX3VaIs5c5Qh7uGb1bRw7vfETtmxR5dFLy
	d6uStR3hb2V6sojYFSE98/dawDix7j1rlQGDVGeBy2lLo7Fl7nDw5ReGzk8ZSalw
	LJ3CVwa5gYWjcaAcsySE0iA4QkJZwb0SEn86xxizWCZwM4co6DY5IXeQjsw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmagtkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:33:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e94f72fb9fso17078985ad.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 05:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794663214; x=1795268014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJO44KrOOjKHyuAfn9RvfaU91UTQC1yY5UAm4QAAsXQ=;
        b=jvJXIivBNPQ94mLAOEdRt8wkJ+kKUBckPEp06fuldkzdC17l/UOkbDtkytLr9pUi5Z
         2Mig1dF9vE60MAOj1bfyskNcAlSksYEGvw5XBJflHFzpgFvBw4/VavUQX13cEyqqf7Qr
         PxjRzVeAxaUtd9JakjXUvAIBBCywF9ePd5uhpyOqI18z6oX6VGtR+eHhrpPOfSSTpDnm
         7b7IUSKBrcuMSjA08mMqOUuuDkIBLt7xBA+3g+JSNN8QdvMhdpOsfVoHlyzeUAcOVkiZ
         GlFdDMCbp36rLMB84Xbt5eyuZq0P9QJxHZvN/j0QUPk1VR/Ud+g32os/PmMAFJUmV5Qn
         Aeyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663214; x=1795268014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vJO44KrOOjKHyuAfn9RvfaU91UTQC1yY5UAm4QAAsXQ=;
        b=FeWQB5/D3ZRHEWCQD0Rki7zilQ0Av154f2zhjKu6z4h32RF+9ytNW7OuLLCdSokCs1
         9MOOHkgr7wghtqLRSI3Z2tk57MvISlM+jKBVP0EUrQS8BOLXzjzdKDPKeFd4ePDTYApB
         nTNYMqHcpd1uozXx/NJ4Yqr+3UIYanYUtjPmLlOjs3pW8x7Dxhh1ykRJmHL57l97dgDE
         w0XCmHxQhleUEswUCFvt7elnGS9L++cJ74hcg6ALi402PAJVO+FTX2mh98+KWGyQLlVx
         5jI/CAx6hhhm1p20iCfD5Sa8d/jdtpjc5iSGZB6watHeb/NdWTfvBmQO4CflpXezmo+i
         GNPg==
X-Forwarded-Encrypted: i=1; AL+hErEW8dl6XuDqeb6M8IMXR3HNEWAyxuiRWYktE2Yjw+kEw0iDyl1l/+ZrSz5smz8FfNdoTK7SDDsmeXVr@vger.kernel.org
X-Gm-Message-State: APuU4Z9AfMsjoAwJEyDir2ecEaSgymW7yKoJnq4nKcU7eCrDze832s6N
	IqHYOpvNcZYrttKdqWe4CpZcJgPHG0lFAGYG7Skm69SzfhKQVlhu4DD2KotqlgHJl5SotwMuCt7
	dWc2tKWlyGx6G9mApWX1PU7Cv+fcI8rU2T5XKnnnyaMnBKo6Z4XCE9lQbfLiq2XzZ
X-Gm-Gg: AYBFou2dzXh5N5GCqglma6PsLVSxOuqPmG0vqKKZH3Vj9/J5NH8G2clDAs+jzQuLE01
	Lk6nD9BNzRQkTHUCIlVbR/eRTMRBV8RDbznoWsZ5O7YhSOpw5N5rEt275YoPZwvIz1B2caOK2IT
	WpsN4GpFFv1AT2YLPWhxcbzGyKtXSykDLnvYKt+nszT3Z9zBn5IGTFprv4ijIOkynuoQqdomD7Q
	ygZD6zyLCpw7b6TphIpn9yh9VHVUqBT7hlzBw+z0mUDGPMZ6u/k4fJpHphcNawDSP1mkpilRrNc
	LIgrGqQHEubi0JaH26DwOQfGm07lquHY5OpLt+V8920Ny4pjJh286a2m/5gNJAXi+Lpy8qTyifd
	oIxGyFP7XeVCpV4DKlXDF3SkOc9yFOZotELuyzTNaD3sUkq/QeD91+A2oFc3RHM0QMT7L6Fe6UF
	ZVFEoHFlMBp21ud3VPN1GnBTDWWnZt5HaFcrYW
X-Received: by 2002:a17:903:244f:b0:2e6:1828:59fa with SMTP id d9443c01a7336-2ee0de41da6mr60980415ad.18.1794663214504;
        Sat, 14 Nov 2026 05:33:34 -0800 (PST)
X-Received: by 2002:a17:903:244f:b0:2e6:1828:59fa with SMTP id d9443c01a7336-2ee0de41da6mr60980105ad.18.1794663214036;
        Sat, 14 Nov 2026 05:33:34 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8eb275sm20266965ad.64.2026.11.14.05.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:33:33 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: arm: qcom,ids: Correct SoC ID for Nord SA8797P
Date: Sat, 14 Nov 2026 21:33:01 +0800
Message-ID: <20261114133304.989635-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lN2JYNGlT6ltSSc60w5sqDD8AUw5Nk-n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX7xf2G/H/LfFL
 7iqaOSvAgerT4t9CdzMO0//96pap+YM46XFlryvh5ERZOLmO9ioyFiaqgM+N2ThItFnqADfV7ZO
 H6vobBvNgmSvhgchx/bYM/t4o2LBWTgLuFVXqRwMe2WYuJjpx7F8zn78Kw4WYKsgru3xOJAPiu7
 japcqKetHzosje++Z7ltk9wlpImplc/+dRXm22F1rejLCwtpRtlgomh5LLafLG3114yqpteZCTH
 62kcrmqGTM+Rpt7GGiY+wltHLIejfPDIHOrSYavfOD7qXCw9uwbTFDyBm3gfRKbsH9XLYbU8uyA
 6WDfLu0jbB0SK+QP3fsYsdIu2bWn/7sjibcZA6hJNLlyBtygWoO9ElxE3WqsVRkmmspq8lVjzR6
 PEzeYc/Sxdc/iURyAl4G5qpf1iWMM6Ga1YbZj4yo/n8cqf6L7KsM2lsXQrWiKOY7PIyGcNNe60p
 ZCi0TK9xQNbda/UBuEA==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af8632f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=4vZ1Im6IUACyycUlj1cA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: lN2JYNGlT6ltSSc60w5sqDD8AUw5Nk-n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX24XLbUtUTwnK
 0dN57M1aB2dAdSm62wlg4jxvPn7RZAI8WIvmSXADlRJsMeIdHy9kZn4usqT/o8IebtCjsneElTw
 K3SqlwZlHvncd9ZkJP/wF+aPax1dKqE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140053

QCOM_ID_SA8797P was defined as 690, but per Qualcomm chip info that
ID belongs to the QAM8797P/QAM8397P Snapdragon Ride module SKUs of
the Nord (NordAU) SoC. SA8797P itself is the default chip info
variant of the family with ID 648.

Correct QCOM_ID_SA8797P to 648 and add QCOM_ID_QAM8797P for 690.

Note this changes the value of an existing define. There are no
in-tree users other than the socinfo driver.

Fixes: 0670a10b7c22 ("dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index d89d3b5dd00c..5e84c5a7666a 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -288,6 +288,7 @@
 #define QCOM_ID_SM7635			636
 #define QCOM_ID_SM6650			640
 #define QCOM_ID_SM6650P			641
+#define QCOM_ID_SA8797P			648
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_IPQ5424			651
 #define QCOM_ID_QCM6690			657
@@ -300,7 +301,7 @@
 #define QCOM_ID_QCS8275			675
 #define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680
-#define QCOM_ID_SA8797P			690
+#define QCOM_ID_QAM8797P		690
 #define QCOM_ID_SM8975			707
 #define QCOM_ID_CQ7790M			731
 #define QCOM_ID_CQ7790S			732
-- 
2.43.0

