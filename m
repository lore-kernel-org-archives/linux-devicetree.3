Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8E33D3333
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512489; cv=none; b=MPW0SaRqrPucswSFKucz8wM02s4epL0eHhV4YxYK/O/5yD5HGTDMwmvRUL1V6qe8MZ+G2EPsWYIM2kALaaUi3XTzxG2njm0ba6v0cC0kXTRJ0GDDXSfOwztyUxhSXPxosSiqwWlghqVrzcH4int20EGINCgR6ghsFVgq2YsOOQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512489; c=relaxed/simple;
	bh=QUAOHVDW4Udars0Jbe5wX7sJIZNINY1ZT2YyhfvvXAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gMCI8CXSlWIuR7eT2cT88nva9o0VtlOLV3kXcLtzsbTJtUTfN5PUG+XCPoTMbEyvzEIBrQVKVl0EMbj7InTkHwsk4Lt/ejYXsKeZhGJV+X9sLYU38vgbFMmLWqZRheeQ3LWmYVHybp/OLAnKPxdtQjRupCC3/xUOqr2ZVlUM1Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5bCOD31; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBAlHkwx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5bCOD31";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBAlHkwx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F7Twek4091260
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=; b=C5bCOD31o9X8JCPB
	EH2SV7jxXq7pOagOvmzO9qdzXMV1FzPgAgfTTe03s8GZtVAC0R4ARKpnb9Aur9Mj
	euFZsY8I13LIJlZYeBDbhlDLmuDi71OkTV/D73twgXMIEcdZ1V6Lw0ZlwKU632D3
	L4FJv5d7s5xXZgfEdhf8S6sjH+CLxMSMBVHljkwQMZirYPNFRzrWV83blw19li5P
	DOyU80Q6zRXw82R8F0SRWD4yeAG8iRcEPio1kTTpo/4QAFc51pg1ZrIWI5KKLjTL
	dYTDcKktDUTmn8TzNp1VMdYjuABtr8OKdee4cdwnpmoc7Tb+UNSj/6BuaJIeixLP
	UmDp5g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2c87y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:34:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c2b64850easo13180255ad.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 01:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512477; x=1782117277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=;
        b=OBAlHkwxg+mXOBZOaVcETdKRWQKV/bFnpgxQScbGKAnm4XvaWRXbxAWZwjmBt6T90N
         8vokZLQ7hzLPK9t5BvmMmTzxYWphuHMXVzI8FKR0mUgmq3qV7q+l94vyHO+8EIKWzdsq
         6TrP+TeRhssePPkamqP3iAScLNTVEe2RszAu979PcKE6Ls8ZaK1+eARzzUA0RaZGkdtn
         NjjNzHIVSoERqZ1eYVe6tVHgFsrBwBLz8DlRN2MJM2A5JQEFXTxujmLV/Al416PiPOUv
         cUQkMtmZP/FzSwM5teouEfiZpUiaNbQ04LHex+w1/jchZgH1SFn2I7N/8Tnzk/5iXY14
         mjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512477; x=1782117277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=;
        b=QBDF0Lo70VXuEsqyNp8fkzKmuICZIpGlh7s3Uah5Uqcu9pBvtQgdcF86w0mn1EBu8m
         rtPnB7s+XilD8LuC8GjVJ1tO8YKeLhvXVBocP4C9XrqO7YxBOyG4N6gplmZZMjQJLnBx
         FzXdbI9I2ksamQohljeAK815SBhQIq3oyRYIqB/kExDWrrAkR4PXxMGwIhtdj2udq3X7
         99/za6SeZLBIBMUjHXpih2f7JHk1bPM8AJgLx0wZbM7pXrmIS+uo+udU5QejN6CslgcL
         IuMdgKdn/xxK9p+glSwYBBEHjpurrAwbCVBCqKuTjuH2KJHVLOhUPM2nivuLey31TZ7v
         kEsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ogHDZkGoq4DlXs/q2KnYgaMPFEep2FsiiMMu1yfZOdyyxUBcA5wwG4LG/V19Lrp+8haRXXtJNf4u0@vger.kernel.org
X-Gm-Message-State: AOJu0Yze/dA7Tfx+JGo5s1owdvPUWCTo7BXDcYkp1guIv3FvqPb9OoO2
	72sVdn4b2ct9CKezXo1rrJoGs6e+XRcUA4cB2rvY/1V3CjAr2CP4MNPGOLS9Q9cOCodkTnXkK66
	DeFOYpLtyhUkWebjvI193+I8iXbYMeJXj9Z1jYTdrwy2rzKK05oGYQ8vuJhW4ow0nUbudtUFB
X-Gm-Gg: Acq92OE+HC8DbNoIcDDSbcJaHLvw5ThT0EvIrdAx5NuCD0obcprVRqBk5MKZJ9+uVjU
	4PxfXS3eFnW0ICDDLf/FeWW5VgyF2hRPHnrZaeAXNTJN8P+WAxWCOK5e4lOmS5+4F99+RtFmHly
	WcDqg8eaNlFTiYpITOezYrFZhVN0npA551Cxsc85hIvEtYKONv8zMIB6l3AXBjuQQwvesAOsMoQ
	ecANqNzLQ4qKfihOwBcmTI+5uJja5TpXWnzMvLYiSVdJf5tZZY2DqVdAVDPVvk11jvcnmhBpl8G
	kUyPdpjLS/grCp4aVaco1aI4jCMdYY8d6rZ2YVWAmhcfywvvlDdgAxLqpjqFnTIR20wEOk+c30S
	G65TKuVdLxe0YxkWwIT7BQT3im4sbJqC5sWnw7kOyPK3M0wGUdfDw
X-Received: by 2002:a17:902:e80c:b0:2c1:f262:4962 with SMTP id d9443c01a7336-2c664242d9emr117854275ad.20.1781512477201;
        Mon, 15 Jun 2026 01:34:37 -0700 (PDT)
X-Received: by 2002:a17:902:e80c:b0:2c1:f262:4962 with SMTP id d9443c01a7336-2c664242d9emr117853835ad.20.1781512476725;
        Mon, 15 Jun 2026 01:34:36 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:36 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:57 +0530
Subject: [PATCH v4 4/6] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-4-bcb51081735b@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=1517;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=QUAOHVDW4Udars0Jbe5wX7sJIZNINY1ZT2YyhfvvXAY=;
 b=/pRrOKK556VJkn2xvypB+WkA7Q98Cm4fvxRg787rFyzv9ZMhta35uNAd777+FV3JUGfvNTb4L
 we04eBxSkVqARtkFVUcK1QgfUuGB183k11kRiNV/HxlK1R5An9FDIos
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX+zcx4m289Yw7
 HyUBDFdRDQ4oHQStLWO1ouHjBB47tjZ1M1TaTObFn9LDtzlFiidDsA5KTgNr/A+QOblJ/RTiL0d
 gH0rYQoAG2sgHSnJOCZISvJ/ccBCfVOsFZYuGKZ9K9Y4BUAJcbqBS0HzxrS83VS5P9GC/x9P7Ea
 G3dZWk20cz91QnHuctCeoDu4H2acVWbPu4rym1CWf4bqxpaJYOMc3ZS7EN4RGpM+0joRjLVhKK1
 M6szg5+/N/NKl/IG3pZOdyLZEXmF17O3jCGCRza51DVDLRky/01jvcYVA4FDmXMvvmdB466CtYn
 d2dQl7a/nfO0voVgSCYB2ngvsD0RjS6wRdXzg4fy6AyNjCboptZMfiHbgC09s1RRgakVgC482ZP
 owEwie+zlIpDDYiSZqWXXhI6tuqPM1VloAdAyOfNHsO5+yiuhwvbSQT+mv/JUHnC+Ai6T0+M9P8
 bkDN5sgwgXRJ3z+BPrA==
X-Proofpoint-ORIG-GUID: 70-rkwxXZI6Z2nSSbW8Ufj_pHOlHFOcH
X-Proofpoint-GUID: 70-rkwxXZI6Z2nSSbW8Ufj_pHOlHFOcH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfXwDbiwzPdz6KB
 NbDAHJSYcz9U8VQMw0f5m/Dxao5b5OS8vO667czQQHqDyxW5ASlqRzyKLDsvLj4ZMTl+xyHIvZG
 S5hnYcJ37p+fudKQ9ftOkAkyjPW4DDA=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a2fb91f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hvkXKTiNP6R-ltmIA9UA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 57732804a6c6a114a407a4a541a1cc7af7635ea2..16b547131e8b14541abc68ff7cda126ba777ad80 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";

-- 
2.34.1

