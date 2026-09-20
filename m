Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9573E8C64
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 08:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789894195; cv=none; b=eFf3a9UergEf1HKASvHtY5OVNubEgHpqHAC0aMoDlG+qbH4und4qpBFjhk+lfPCXp9CRUhFZr5rN/PS25X8I4CsxDJmkQ3BUSS4Mql+8884UZ/KjbC+6QDf5jiF+VCFgKfy6rvFLviUXJ+ncrNzhakAUIpDObnsOX+lG1S84A8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789894195; c=relaxed/simple;
	bh=UNWrCYUmKF8a9BTxU+3YVNEjxJrki4rae5vIBK1PtQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I9oHlUpboGj/OCY+zqmej1DdZSvLZB5djXWzHduBAkfWphNs6AJqEKH3vSogU67Pco6tB0xFs+OoK0easRd+5q3Jg0uMML9upfSRre+8ryajqhWVOxeXdGYXQmpVpqaUKHr0X797Kju8qGXQWZXWoHAOqo+7SAliZqtt9xnYh7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOnP5VkN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jESgOlwf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOnP5VkN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jESgOlwf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8W36r1243281
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 08:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=15/F0omI6ey
	VaWtg+k9gQhvDCbpTtZA0dSnC/zlpdTg=; b=hOnP5VkNIrwnuyyvAfniYEBUdA9
	uplzykEBuk0dTdBh10imS8VQKjEKtg0+2KwkE8Xtvn+In8EXqV4WSZpFs45YAGyd
	j/BCTlEjJI/PrgO9B6yWaJTBxAYyii8SbzUq6ow/4wEJG9YYzsP37XzKfq+OPxu2
	PCXtYFXVwdherDMnxh7T7BmSB2Cm0N387k5aBEa0Nf0DHMgDuIXMXAKfwKnp4iie
	f8ZjAQ2uQlWr3usJYhphltqwUav9vcZ2qzT0HuOqJLjIk+on+sIDBUlkbOiEOLO4
	ieU4X5f2VmUtkGwGZnFGuVAWiauI2Al5fJ0WPKA4wHNEA4ka+kgK7/dSzog==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs82j99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 08:49:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so4322277a91.1
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 01:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789894192; x=1790498992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15/F0omI6eyVaWtg+k9gQhvDCbpTtZA0dSnC/zlpdTg=;
        b=jESgOlwfbzb+E/8faZOtMqCpbBbvN3OkZA4Af7vB0HbbGCnbaBNQTnKwzHNXyonsRh
         cdVRxI3Wct+dAVL26oW1250cob/i8Ew6kIutCJhcw7brJljYViks9Tjn272GLtgP/4NQ
         154G/NSB7jCN0cnVh9f+yRSWliqiXcdytJiqVccdptgIMWjfHdk6mjKoh2HgKZJqQGV1
         uCRdELvXlmi6BbAD1tsk4XwKXdEf/1SAJD+QzQiVX4N/lP6sKrF+TvHHXxmIq70d0D3t
         ZMgGrZDBpyjDVzZ/cCech/npkqbO5mn8Z+MpQK3ZPdRzT1LLaw7eyHfL2LRW663+j8Y+
         vIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789894192; x=1790498992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=15/F0omI6eyVaWtg+k9gQhvDCbpTtZA0dSnC/zlpdTg=;
        b=hpTLOQwdGIdKBhdMQJQoZL6oE7aRi1WfcGckKhT5g4YCvDFm6tohjbxzj/gJ3cTy5n
         GN6Tf0xR0vL/fbome34pVUgrSZ1Zwde9NVrNwPmUi5P1/K2tJKbL12ZeaAZC+HnYlpWi
         Jm9LEV6EIaf0JyrMaIZ/zW1CHiZMMQknI1qgTjZB/u0v/Pjuuxgk2Rk5Rnv3EZpE95+z
         QPxf+pUQhdUH19lKD1sfhZMptDAf7CXvgRAXPNt9JFuHsQoUlSGiRsjFMPQU01UCu/mu
         tKj5saSg/GIkosET4QB73L36yWPG2XcjdbPVrtdoLOCAKyJqFESL1vzv1GFAR1oSkBl1
         yfxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoAg/OGew1YF6Q9x1uxNS7LhUa+TZyHXtWTaiWqFhjh/eGJRgCAs70VzQPNYFJ8SIdfFJy5dWYx8Fy@vger.kernel.org
X-Gm-Message-State: AFuF++n+nj9eViQrHFhPN884pNpmqtBJWyF/37eaJqQppED1TjnvSpXb
	uuzIeIHyEP7URUsnZy4BLBZ4FHhGSlKo/QRXTUltFYI1r5bmyTt1jijP+lKfwdnNgkBeDVUJmqt
	wk13ry2XhI1jx6Gt+lRAVE6gCnGd73LgIEyjqnRoUQ1KEhl396XklJgTN2XNaowow
X-Gm-Gg: AYBFou34gkho2PT5gBLzNo1ZlOjDOzq7TCkYwDRfvP3kLbwC0WDI/riUc5f+HueEby6
	dEcgpxLkcWu82XGpj5ELV9BkTBZOofHzepASLKj2pJx24bAQN8EdxpSVQp2/VwHMRyUG9iiZg9O
	MYQyMZQrKneN19Sux5zRso//DEkeNntP6DCo1yN0ac3HVGSjO68gO4sM2FbwukD43LSp9NWdMvF
	3Kg5aUYwcirPKvTSKKWd52PfN7UYgRb1oZfMBM65yMKFsmf1xgo/d2VBf0jL3uiQVaCH+GWBowf
	MBSN08DfwFNFsrkN98/D2vP7H5sL1koX6DLF6YqfLxxb+tOrshrDKxuSgCk6ZbWkRy+K7rc5lyx
	R0UE9X3jn58DVDTkb7MIl+Pbak34TESFO03DWOfb13TSm1ElITAnUnHxOzXj7
X-Received: by 2002:a17:90b:1845:b0:3a0:42a9:9c7c with SMTP id 98e67ed59e1d1-3a042a9a00fmr362998a91.39.1789894191839;
        Sun, 20 Sep 2026 01:49:51 -0700 (PDT)
X-Received: by 2002:a17:90b:1845:b0:3a0:42a9:9c7c with SMTP id 98e67ed59e1d1-3a042a9a00fmr362980a91.39.1789894191451;
        Sun, 20 Sep 2026 01:49:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm11180808eec.14.2026.09.20.01.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:49:51 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 3/6] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
Date: Sun, 20 Sep 2026 16:49:17 +0800
Message-ID: <20260920084920.2201418-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PElyg1RPWnlo9S2ALMz1gqMhdO3zwR3j
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfXyW8di/pGa//y
 8wu16rVgfSAVmTN+wsHS7N/4h+7HXv5Y0cPOSKqdmuO4+merzaysoVy40p1A02TKofFBX45jHRX
 9nBOFBssW+dM87Wh9MvDELqBNFXvZX8=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aaf9e30 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=pTKKwl7rlpcWqDfdxRsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfX0WiRDc539o9h
 HW941u31zlXeDrXLGJ9ypXnF1B79npaXIbqUV2yXZJR8K6G564C+npfs29EAYinTY6hsjwPMHFL
 iSu2XUWxTUqdMeSRGsMdYnemqi4mseJPWk/IeIci3DZy8SsKGTXdHFkpta+rR9dlIpsr6ZtsXaq
 HMbAZCjoji1kFYDJ0G1txlScTEAP8ps7eUgECsQFxFdcy4m6E8QHgM60enzqWX4qFIiKXyu+iN9
 A5mNeb//06DL0HtfgVvjsKcwt/kAKfddwv2BQ1ecmij8/6JgCQc7AfR26yqE0Fl6rCTW6TNetzv
 HSgLpsZJqK4tHGf0JJ22WP3zprq6588eCtrvo5lvlgiYm2Ubqx7aIBYmQOts29+c24usAGVyyU/
 93MNzOkIOzzxNKDl5jaODK4pb+x6UvvzGS4UW1qmuxVuSF4b3ogp3V2nE5O+c7SBk1HrL/3bh9K
 IKGiSdsqmtjIH/mabqQ==
X-Proofpoint-GUID: PElyg1RPWnlo9S2ALMz1gqMhdO3zwR3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200126

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the SPMI PMIC Arbiter node for the Nord platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index d413341eac41..926ccf3bbe4e 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1866,6 +1866,28 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			#clock-cells = <0>;
 		};
 
+		spmi_bus: spmi@c400000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c500000 0x0 0x400000>,
+			      <0x0 0x0c440000 0x0 0x80000>,
+			      <0x0 0x0c4c0000 0x0 0x10000>,
+			      <0x0 0x0c42d000 0x0 0x4000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,nord-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xc0000>;
-- 
2.43.0

