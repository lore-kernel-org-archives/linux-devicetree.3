Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1808739021E
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026989; cv=none; b=Y0VZ2eKjsUPD7n5jG+rBzc/RabZGcXKluUQdQYM1GpkZM2idUNLjrobBORJkka0+uRU6oZE7WnbB5yAPf5Bzx60emGLmcPx5AofQxdBt8i8Z6QaG/PBu3xN+DLOH0WUwmJMs6F4uiGp0q3lhnUBdkgfBRBzVNBcehuuyW7LF03A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026989; c=relaxed/simple;
	bh=s1ZA/D83mONCPI3fvWRV+QKqAIgDXDqkKAjXtCiygsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AJP4McSZSReTUsVH7ZVpUBvdayfmYQh6IxylphSN9oUrVDStoHNxUPwXJU/G8oL7RErdK7o0IAPLYFOs4KSC9LMdSlCBGURlnLY/jRiyX2lc+RPcWWdatrYIKzQYVfs+s6HKvPwmSa2EVAx32Yrn44UbGrINLkaXgsuUycDIzbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dH4+g7Vx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bsubuNYC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dH4+g7Vx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bsubuNYC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9GdWB756723
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZRfvQoB42p1L+b22QAnoq2fK3TmD3MV9CgEN4SOZUIo=; b=dH4+g7Vx3Rn4ZMVX
	RCNZba8Rd6xE5sdOI2nLUYrNW+AGSIqzZPN+nZMV+XL24ppVgC2eLG/2QdhPlRqq
	8ONvh9hLUsMiQYWRK0AMZwOa4QNRaapoU0wJgfcfgffWpNhBmTCVmd+WySoT7mYT
	L/k3vCW5sEOPTNajqb0qFnWahUQJrf1TjOVjkO+jWXRdK2n1I3itnLVZrOuhD1GX
	P641q7AM3ZPxlm6aCbwg8+QYyzBsZl5oZbtj/2uTXW/9lCnz6eiZSL9lOyrJzEEZ
	0a0gL96xDmpRvpf6dVdqiABUVJfvh6qA8KDTUZTKt3PooXKzu7fwDZGp+cH3MxDn
	UP+uLQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr4bkjtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:36:25 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c87ba0890so23629969c88.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 03:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777026984; x=1777631784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRfvQoB42p1L+b22QAnoq2fK3TmD3MV9CgEN4SOZUIo=;
        b=bsubuNYC0Ywh0VjlRpuJCvDrkhzis8DEGzQDzejkZSxhcSwp6nhfhygBo6FOU8XwPR
         4W5fV+kPpU8dyGuvLioLaYOxz2rsCQwt9vckS0fa2Kc64Gyd2sxJFFQKjIg9uZl1NXGD
         3OJ7qG7IyGzsJeuhZZXp4rxlKleRfTAvGXmJN6BsV7xaIm3m/9IEzk0LUG2GEMhw0Gtz
         OEtqTrnzdjLUB45mPxeILGXJPVXEooatFxaT2kpueOe/UhPlMj8PuMfrjhzDANJ9U3Tf
         sQ39fxeUSgXXGfKB6h6lRiLHpp0KR2XuU9tSYEccO54UmN26WHFwZevODd6YhA7RyGj8
         COMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026984; x=1777631784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZRfvQoB42p1L+b22QAnoq2fK3TmD3MV9CgEN4SOZUIo=;
        b=EkX1e/QHZ78T9p/24HtAjogsmdUMf0KS3tld28xgWyQKPPRQ8nkCf7jzK/ZZajQ0sP
         VfJ2jgLCV0woONGIlUre/NdKtIJBNIJD8oR/h+KpvLqkes30EqNeDLbqQCwWOjLT1JO+
         ot+KwvUVgPUZ5qysLNHKCDr04Am5rvranuYfjqylUSRpaS3I8aCALhoRcDiW7+CCUBUa
         vScgRV/Yp0Zoiq+AiJtuSDeXkLc2tja8weaXAkQ074cX5GTAsUS/pKF7BOGDiXCRyfED
         6OgMJdnHjPko6UhKoDyFxCiTCzYlEvm7VA64eWccZmH+MrZfYhq/4O8jh2Gtm2zKmFK9
         CRrQ==
X-Gm-Message-State: AOJu0Yx5QrUf9wUbuwhJE7KmefQxg5CXkOVOj97YBwXxWHTG3w40T/kL
	jfxpoBLB+Of5zKpSzmTLxiA0MmQOwnTsWBbKPUHFLB6sBmLPcJ+KZEds7km9nHuHzCIO7EHorYj
	uOq55DYxXtSAYxqzRdHMGyAS+oV5S7v56hTn9RQRGgUsGzjnCzLpR1e+4LwfrROal
X-Gm-Gg: AeBDievsFTYIObtTvyw9jVOQSjAzmq3rkyFfWvyLu3I27OXd0WnnwWLLOY2EZfTEs+7
	ybDQa+s6brJoIga64COIZptUW5qcZAkh/yTUh/1vYSjNCCgiHK8nLc3oYXwSInvU8oPIjLI8pMK
	OeyiiZm7mfU1envmC6RCyZoSSQLK7nMJ/GR3iLMjNqdTG/OBljlalMafjpkXF12xYY9CISielIn
	YgIQyqa2rqjHaiynI0rReezSn37NQIgCkn0yVMclNTYDvNsmpsfwMzAJndiLvuX+hLjKNeHGCE/
	RjMQRIsAJgbfi8XejhWTzER6dXvRSSQDtjbjAqkLju/1E0EKZPJbR+7n4wlEAbFwRF7f/KhQbjn
	eNFCRrFtWHPAlWXe/5Re7MFvwlwWiWkTvgrey+UYObZuhR878K4zue854b/llDFVC7FlYtFtzp2
	u3FIRYGA==
X-Received: by 2002:a05:7022:ef09:b0:119:e56b:9581 with SMTP id a92af1059eb24-12c73f6c410mr19454825c88.6.1777026984366;
        Fri, 24 Apr 2026 03:36:24 -0700 (PDT)
X-Received: by 2002:a05:7022:ef09:b0:119:e56b:9581 with SMTP id a92af1059eb24-12c73f6c410mr19454805c88.6.1777026983775;
        Fri, 24 Apr 2026 03:36:23 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dbe78e12fsm9187846c88.15.2026.04.24.03.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 03:36:23 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 03:36:14 -0700
Subject: [PATCH v5 2/2] arch: arm64: boot: dts: qcom: add IMEM and PIL
 regions for glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-glymur-imem-v5-2-18ede63cf063@oss.qualcomm.com>
References: <20260424-glymur-imem-v5-0-18ede63cf063@oss.qualcomm.com>
In-Reply-To: <20260424-glymur-imem-v5-0-18ede63cf063@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777026981; l=1116;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=s1ZA/D83mONCPI3fvWRV+QKqAIgDXDqkKAjXtCiygsk=;
 b=He1DNCiHSWNFmcRiEIA+MJNWwRnuU9TKfgvt08E2bwtN3qMRGP4klfvxanffqbuIMo0pXoiL1
 zvPDdvCV4QLD4l/P3OMHMMfjJ0uwVvbG3Z9Sx98r2j2kvV2jOfoUxWZ
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEwMCBTYWx0ZWRfXzSof3KUXyOSq
 pLbZYbaMu5XCqfmjAuLfIhBRuM9YNGZFbHCOjJFTCm4OYpL5xboLErXMAK4hZR08ZT70uHcJWXr
 0+MP6eH/exDyx0DyX97ZKtgOiYZLTBP1USAjA9WmXSOdhwvCsunRGYeHsaV79w8veyj6Ow0jICZ
 +oT/IKAUrSPMuGGp643O/SD4eui5zIFfFKls49ZJje8FXwMbrfRnLV1QRiYYJfQdW26TX6jhOR9
 LGwpYRigpquWiV8gTRpAMQ/49o7z6IR87TnkWywFaH5GqEauFdooE/sgxSgCsnYX+6n4qlr1Yza
 9cJZZAr2ihmYseDfQdhs3MSAWaYqyQHdESIRycJyLemFTdrO8RGb9JU2kNfaJDpM2ofnrxgwimd
 iRA7OCZbI+uOtqZHEb7T9LXmUrwAtxdo5onYzaCVf7V6VcYPODOlDWoyK38sbzUzDPTFDnFgeta
 CCINiX6NzSUip1i4vzg==
X-Authority-Analysis: v=2.4 cv=TtnWQjXh c=1 sm=1 tr=0 ts=69eb47a9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NM_c3QKFEUqHB8hYJUIA:9 a=tIW79zcqoJXJ6Hta:21
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: eiXqJeLJMj1tUCiLHfnbjZVs_uBO-S0L
X-Proofpoint-GUID: eiXqJeLJMj1tUCiLHfnbjZVs_uBO-S0L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240100

Add an IMEM on glymur which falls back to mmio-sram and define the
PIL relocation info region as its child, for post mortem tools to
locate the loaded remoteprocs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..84a115993e7f 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5501,6 +5501,22 @@ rx-pins {
 			};
 		};
 
+		sram@14680000 {
+			compatible = "qcom,glymur-imem", "mmio-sram";
+			reg = <0x0 0x14680000 0x0 0x2c000>;
+			ranges = <0 0 0x14680000 0x2c000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-sram@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,glymur-smmu-500",
 				     "qcom,smmu-500",

-- 
2.43.0

