Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3258539D6E3
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166602; cv=none; b=Dhq5+nZZFn2/nmWqjvAEtKIVLamn+9YEhuN+FdWfJcE73ocVKghwarUE49c/4xsrq4PZD3wRafKv2z9jtE2ArE/ToaJ2bYS+NeYW4l8PlgKnJqYVYIGO+Hz29gY7a/l0LNpae5/w3erO5uw9cCQEKb+KL8L8xRAsEnkdS77Pyy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166602; c=relaxed/simple;
	bh=xXmcrvotnDZzXlLQilFaoy2YVYYbw+p4ILtbH2GCOY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t2d5PXOKBf094a+hyrVBWrxzdG4IfnptXtfqpJu4M/SHPYrVC8v5VHjlOHlniRA+8+JyupYXnR/sNsgteXh6+7K4Uyb38jo0WEycaOc9mCU0z2XKMTwZU5HMG98qfJEm+sR4SS6xBacrT9R8STiiickOTCe0Y7Sk+ykYIsfUelA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BNX+UYt+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eOP8gVjP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNX+UYt+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eOP8gVjP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBHI5O3505463
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zpHTOGz9cxLg+mIfEhFiJuDitQxUHJ94gQ8N9KoQsm8=; b=BNX+UYt+BnXC7/sb
	GHZFafLr9Guls2CCfd1lUGRu4sPsbdQA133ETROG84sGuhSV0hCu2DBDjJUAaCmh
	sBY+TWqhtdRKg5bNutXjSDcsjyihAzpieYUE/O4wh9LauHkDbvf5bsEpW8gujuLZ
	6u2cw/KEJf7y7qAxpLGOphLPYWw1PHRcZCCeIUtUFBQYeknnby9Qy/1HRyQUGC2G
	jr+TLEHTRvHmhVe/hJOT402O4ugbWVy5v+KLUmT3JKxJvYuL7R4Jd8JjwNvrqjWs
	n49UuCW2MgGi5JFZzzaFxmqODIsEK6Kh0GwCPXbksxfGxwBEroN3iclnsbGlcMMX
	EpZC5A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870jjc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c7a84a43eso6596043b3a.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 04:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776166593; x=1776771393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpHTOGz9cxLg+mIfEhFiJuDitQxUHJ94gQ8N9KoQsm8=;
        b=eOP8gVjP3xqUIn0ws8qGiCnM8kZh0+02oYsk4xP34doCHbphz5R284TSgM26X0CVM9
         CMQ9wFQQNoQpLPjjwTdBkofv766HeSGEzTTyaVoYXtZICuUUiKEr3uuBUfG29dutTCWO
         m+EjoncHsfuZ0hF41UohsdG6QR+SbAUQjDhFJ9QI3zYaeWsYoNNNwRAiBx9mFon/QEsk
         UWlGDZDK8DoPBYeoqwbLoaQDaCX/jO4G+StMm6u5Bb/+2IFeMgeK+DAMuBS3dwQ7nV/p
         ennaH9QQCwNRPhXaUn8pjUPtSk68/ccTAxGQR0o1SjVNyKsB023Rxdrxde85wHavin1y
         eSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166593; x=1776771393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zpHTOGz9cxLg+mIfEhFiJuDitQxUHJ94gQ8N9KoQsm8=;
        b=VTvRuBXySpIZfDpx/qmkI2Bym/3+5DmArdFSmqLWpEn9r5MZfr2L/0VVBW82nQdYdT
         7XOix3fKoqwAeNhvGgEuMsrjdTpNkGvqxPJudASpRlVxW2hAX082FFQXTQHAgByTB5rE
         /jCR0apjydNMOpwiMY0izlYXCtDWzI77G6WAyhs3YHGt423vqtm5ZJzQ1tAbgMTR+GsP
         Jyyje3MEXwOii5DgrRcywa+PiAt5O7DpKMRgWVxtZqaSWQFc4zNYybhg08+BvMdnhiJ5
         ZQnBMsSNItsFAKgpsQc/pgxWclXyv8/hWWeea+57o2ECWwrNvOkj9kyZ76Xfk9TIT5e3
         qTGA==
X-Forwarded-Encrypted: i=1; AFNElJ/RYuZd4srjuELQGQpdTWdJ5EY2jqrlOiL0v1DHFhYaXkxrnaQigldU8P8o6qrfE4duXkSj3aw7Lo+4@vger.kernel.org
X-Gm-Message-State: AOJu0YyIGLSVeY4kQnqsUuOIEf6FSrdw4YcVb3ZUPIh/Tgfpds9nOn/g
	NX22Lruvo8UoSw4S/woxOx9QZQdH4jtsk9QHS3hmLAjy3+u7DDghxsDTqVnkwb1GiPhTORdkjpw
	NrYNEC4I2JL0h1Wvf7z61C1U3KCF1MRuHo5KcrHtHLotBJUYQ+/Pq1bO83dm0E0G3
X-Gm-Gg: AeBDievEZf+jm5jUulFINO3gzA3l4GtrszKG2/+zG0ydOsBw+G73hNcnWlHFQS/nw+q
	k2727YyUWeJO5ei8N2dVauyjlrIGoJpt4Ayd5KVgAwvrQDfjG5Qw12l4yXQcZ/ZlglR1ID68rD3
	eUmSBWkaInzjbU8dQDZrbPXLdqQVIzAzy6WGMv9Ge97xYvnnPagoXOBYg7gbeouusXCtFl6ZtMm
	HiXzj++9hajsnM+z6S4QDSXu6KnzIXT53U+nE/RNd0uUKg6oV83vr2mJQtQPT1L5IEV+SHcmUku
	SXe3yMCxL8uXWr/znLXyGhXSS+xTjmlYZJDy0Om4kkgHiLzxjTrbs8O+XWawCnfrLkOtWqs3QzO
	R1du6S3Rsf2rqfV/sWaK8NUXuztYQ0pvnBo7t5LdgkNyczkqaE6LDjwYrHPY46hBu77xKM0JPRN
	kAPqs0Aomd
X-Received: by 2002:a05:6a00:3499:b0:82f:425b:4c27 with SMTP id d2e1a72fcca58-82f425b6ac4mr6501443b3a.14.1776166593327;
        Tue, 14 Apr 2026 04:36:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:3499:b0:82f:425b:4c27 with SMTP id d2e1a72fcca58-82f425b6ac4mr6501405b3a.14.1776166592807;
        Tue, 14 Apr 2026 04:36:32 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79486dde3esm1920024a12.11.2026.04.14.04.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:36:32 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 19:36:00 +0800
Subject: [PATCH v2 2/7] arm64: dts: qcom: talos: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-add-label-to-coresight-device-v2-2-5017d07358f2@oss.qualcomm.com>
References: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
In-Reply-To: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776166580; l=10599;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=xXmcrvotnDZzXlLQilFaoy2YVYYbw+p4ILtbH2GCOY0=;
 b=YWG7Er3sa/uy/3K9dGdJtmIZTxQ15YI2lJkf1FcSWyUybXF7mbKCXQKa6RgoZb2TjbtijpBLy
 VFEUICAtrtwC1SalBQZnkioM7qAMlMZH2a+HJBf7pATvUGMSc1rfJw3
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEwOCBTYWx0ZWRfX2xXUTlXtuCDn
 ofo9O0pde0Tr7uim2kQKQoNxxCjyiUHAlNhZReo5H7417AIXCB2VjxoqSHQNKCzBsk5pMkc6LKe
 +g2ZiAPH1GTBmqre43mJ3kvjluAe9Id8GBm/KXGBxVw2Q6uK/81QhDlPt68TvFv2wijKNKLya5R
 OZmaml3HOtpCIaMM40DJno+Ffssv7juBE73oBtFo9yrmhXZYmZQ1XAi1rCOYdNhvuEmz41KSS+Q
 edkI5rNThCYagmodP6GEwKvKpTl0603a8EaHJ95l5FN4w5Sht/9lbvRHoHvpec9bHXthQLMI5wj
 0MiEVFIX+yAWpdQiRzFJAexShI4n4A97ZxW3iGf0YnyIUKwlcDq9EyXO64DUcQTsv/oTlmVSz0S
 Gp9SGOgt7zzLY+SeUjEMTt63zGS85emFrb+SCuI+ZV2oK06z3RzsChSzJtVWsZH30YWhEj6FgKm
 qzY9X/2Z+NFRrtwHPXg==
X-Proofpoint-ORIG-GUID: t62ksHxCxGKpUJAaMIVutw08Pq-pEq2w
X-Proofpoint-GUID: t62ksHxCxGKpUJAaMIVutw08Pq-pEq2w
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69de26c2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OwfIJ90L-SrImz3bAfAA:9 a=ds9HYswI8H9LxFeb:21
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140108

Add label properties to CTI and TPDM nodes in the talos device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ff5afbfce2a4..019911f3f923 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2180,6 +2180,7 @@ cti@6010000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss";
 		};
 
 		cti@6011000 {
@@ -2188,6 +2189,7 @@ cti@6011000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_1";
 		};
 
 		cti@6012000 {
@@ -2196,6 +2198,7 @@ cti@6012000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_2";
 		};
 
 		cti@6013000 {
@@ -2204,6 +2207,7 @@ cti@6013000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_3";
 		};
 
 		cti@6014000 {
@@ -2212,6 +2216,7 @@ cti@6014000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_4";
 		};
 
 		cti@6015000 {
@@ -2220,6 +2225,7 @@ cti@6015000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_5";
 		};
 
 		cti@6016000 {
@@ -2228,6 +2234,7 @@ cti@6016000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_6";
 		};
 
 		cti@6017000 {
@@ -2236,6 +2243,7 @@ cti@6017000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_7";
 		};
 
 		cti@6018000 {
@@ -2244,6 +2252,7 @@ cti@6018000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_8";
 		};
 
 		cti@6019000 {
@@ -2252,6 +2261,7 @@ cti@6019000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_9";
 		};
 
 		cti@601a000 {
@@ -2260,6 +2270,7 @@ cti@601a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_10";
 		};
 
 		cti@601b000 {
@@ -2268,6 +2279,7 @@ cti@601b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_11";
 		};
 
 		cti@601c000 {
@@ -2276,6 +2288,7 @@ cti@601c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_12";
 		};
 
 		cti@601d000 {
@@ -2284,6 +2297,7 @@ cti@601d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_13";
 		};
 
 		cti@601e000 {
@@ -2292,6 +2306,7 @@ cti@601e000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_14";
 		};
 
 		cti@601f000 {
@@ -2300,6 +2315,7 @@ cti@601f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_15";
 		};
 
 		funnel@6041000 {
@@ -2532,6 +2548,7 @@ cti@683b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdsp6";
 		};
 
 		tpdm@6840000 {
@@ -2540,6 +2557,7 @@ tpdm@6840000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_vsense";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -2560,6 +2578,7 @@ tpdm@684c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_prng";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -2579,6 +2598,7 @@ tpdm@6850000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pimem";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -2600,6 +2620,7 @@ tpdm@6860000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -2643,6 +2664,7 @@ cti@6867000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_cdsp";
 		};
 
 		tpdm@6870000 {
@@ -2651,6 +2673,7 @@ tpdm@6870000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dcc";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -2671,6 +2694,7 @@ tpdm@699c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_wcss";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -2693,6 +2717,7 @@ tpdm@69c0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_monaq";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -2736,6 +2761,7 @@ tpdm@69d0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_qm";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -2756,6 +2782,7 @@ tpdm@6a00000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ddr";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -2776,6 +2803,7 @@ cti@6a02000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_ddr_dl0";
 		};
 
 		cti@6a03000 {
@@ -2784,6 +2812,7 @@ cti@6a03000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_ddr_dl0_1";
 		};
 
 		cti@6a10000 {
@@ -2792,6 +2821,7 @@ cti@6a10000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_ddr_dl1";
 		};
 
 		cti@6a11000 {
@@ -2800,6 +2830,7 @@ cti@6a11000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_ddr_dl1_1";
 		};
 
 		funnel@6a05000 {
@@ -2870,6 +2901,7 @@ tpdm@6b02000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -2890,6 +2922,7 @@ tpdm@6b03000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -2910,6 +2943,7 @@ cti@6b04000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao";
 		};
 
 		cti@6b05000 {
@@ -2918,6 +2952,7 @@ cti@6b05000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_1";
 		};
 
 		cti@6b06000 {
@@ -2926,6 +2961,7 @@ cti@6b06000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_2";
 		};
 
 		cti@6b07000 {
@@ -2934,6 +2970,7 @@ cti@6b07000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_3";
 		};
 
 		funnel@6b08000 {
@@ -3040,6 +3077,7 @@ cti@6b21000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_aop_m3";
 		};
 
 		tpdm@6b48000 {
@@ -3048,6 +3086,7 @@ tpdm@6b48000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_west";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3067,6 +3106,7 @@ cti@6c13000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_titan";
 
 			/* Not all required clocks can be enabled from the OS */
 			status = "fail";
@@ -3078,6 +3118,7 @@ cti@6c20000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_venus";
 			status = "disabled";
 		};
 
@@ -3087,6 +3128,7 @@ tpdm@6c28000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_center";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3106,6 +3148,7 @@ cti@6c29000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_dlct";
 		};
 
 		cti@6c2a000 {
@@ -3114,6 +3157,7 @@ cti@6c2a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_dlct_1";
 		};
 
 		cti@7020000 {
@@ -3122,6 +3166,7 @@ cti@7020000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_2";
 		};
 
 		etm@7040000 {
@@ -3150,6 +3195,7 @@ cti@7120000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_3";
 		};
 
 		etm@7140000 {
@@ -3178,6 +3224,7 @@ cti@7220000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_4";
 		};
 
 		etm@7240000 {
@@ -3206,6 +3253,7 @@ cti@7320000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_5";
 		};
 
 		etm@7340000 {
@@ -3234,6 +3282,7 @@ cti@7420000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_6";
 		};
 
 		etm@7440000 {
@@ -3262,6 +3311,7 @@ cti@7520000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_7";
 		};
 
 		etm@7540000 {
@@ -3290,6 +3340,7 @@ cti@7620000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_8";
 		};
 
 		etm@7640000 {
@@ -3318,6 +3369,7 @@ cti@7720000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_9";
 		};
 
 		etm@7740000 {
@@ -3492,6 +3544,7 @@ tpdm@7830000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_olc";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3535,6 +3588,7 @@ tpdm@7860000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_apss";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3578,6 +3632,7 @@ tpdm@78a0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_silver";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3597,6 +3652,7 @@ tpdm@78b0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_gold";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3664,6 +3720,7 @@ cti@78e0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss";
 		};
 
 		cti@78f0000 {
@@ -3672,6 +3729,7 @@ cti@78f0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_1";
 		};
 
 		cti@7900000 {
@@ -3680,6 +3738,7 @@ cti@7900000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_2";
 		};
 
 		remoteproc_cdsp: remoteproc@8300000 {

-- 
2.34.1

