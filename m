Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C824E41DE19
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 04:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792037588; cv=none; b=O7Sqlr0q05j+u5NaICsqW8XvNPQ55Ht244P4hmIUeoUt4XtUKp8JbjVMmI47HyKv5BeuYq9P8OrJHXRJeI/6a6tUieYx0iTXHmNm60IUHzTO2ocCD8k+b58G2Wkp7fjvzWNAeqJRqPywVaWpf72z5OphWsHt5ukx+QmtY+SsnEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792037588; c=relaxed/simple;
	bh=sAQjUxIjl8nvqblAqmHcPV7IsLhvqooON8HdUtzV9R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kumHk+9G+58GeNl8bZtFyE6hfwOTKvvxPJV/QmysRL+ViH/Shkrv9vbDtR4Yzzbi//P8AtZrYGN8wmQ8hGOUn9Dm5RBnhy+ju2qhzMDOCCJfxtJI5Mmr5J1V9PYMk0yYe+xOPD+mp+RKRkOTfCVnuUBkGGJzTzjYp1s3fv/Ibs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/wvFhNk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMj5QhXh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/wvFhNk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMj5QhXh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMXaNU644584
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 04:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I+/LBRpEdI3
	GB5BT5qug2KBLpEPGdwxDFcSS+HFEn/Q=; b=Z/wvFhNkjpzEL4rlfFHP+T4j7hG
	Jm2GfYV4c8XgN1xwHgd0JISeGIY2doxhgLrdIZ0+PPlRXXgiudslDd9MeSbpJErq
	YjCaUS0gKIn9P6MlKyNUF0r29yu4iaeCMt+YOH4PI71O2q9Q1CBs64jqCuJqSI4g
	UehC6ZhiO5LVbW/n6SbTCrWxEGqqwDBuiL05eYQvqGe01OAzISjaX9+ROSu8WuoP
	cGdOlyK4HvGcaBGHXqCBT1Zy9/I3nASKmGH3FXyWJ74GcHWuaecNjcNoA3KLqgVt
	V37McIQgZCBhzupnaREHvTS4nJHLGyg0zOSgRYwhFJEZDRSLNAbcSCW2b1A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmy90um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 04:13:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac94f8df66so135402a91.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 21:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792037586; x=1792642386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+/LBRpEdI3GB5BT5qug2KBLpEPGdwxDFcSS+HFEn/Q=;
        b=DMj5QhXhEQRTPs161s/v57nRZbMX6YB4vKZwohDryEVRejZzPoN18WKNF6CVSLcZsx
         1kJfkpZVvZrFMXDjn8wsvZVLNkRsmYI2qLn9i1s9Byg0+C/EWtxL+ZhZ4dSeV+JVW+R8
         cs8YVLVMgakuLwjPv0+Zo3KvbDyXW81J5jzlp+NAJXF8PbtCFEfn+josbs6NtuGvwj9M
         DRmq7lHg74OXmm0AKhaMUM1NaBOkXdpDPMfv1MEo6Jr9yrkngYDCme/NLUpLuumLJmu0
         aY7gh/EeDE8ici0IIjmxevfPjl+Qcc5LVVLqmzS5hD39GIa/61P7mJm2mTDJ3sIPQAzW
         DhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792037586; x=1792642386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+/LBRpEdI3GB5BT5qug2KBLpEPGdwxDFcSS+HFEn/Q=;
        b=1AHIWTEs9z9yUorkrc7WX5sw1nkXtc7ZNyzov1eMoeVdf537wOrOKZlbnIbK/KdoTZ
         CoHJAKHuCXEaMMQbTvg6IRPHqis6Wg7EHW1Vdvv6uhv/tfrzFW87OavRG3918Mqgiruz
         1/j6WKtjqP9fBNsjkLRNfq+AGDj1mqyOqVH3Tj8QAgtZAPP26vS74DU7oCyRag94/1ZO
         xeBqZTXd+KDmq7q8f7SqqV3jeuMSzoVdjN0owjQlLY4HIZi+oaGqCVOWmeY8S628i7p7
         cQ7LTr8yDLEtkgNuz2aZjuCMjlX11gg0Kkzr6bkv1TSv7qiWzaeevtMpWOMICNncVHnB
         0/9w==
X-Forwarded-Encrypted: i=1; AKwUvBwLZHkoyt1Iedx0/bqvQjseXLHX4aSNuq/shSC/S5R9KWqeWoZBwvy17VhoRz2SKlc0MedlKSOncO4p@vger.kernel.org
X-Gm-Message-State: AFq9FYI3sD9LTR2oJ/ae1EXATzh8GY+0cowulhfY1X781eHX+NuXvfbL
	FgsdTB2AaHIJ7XR27o2TNjvi4OvgV/NWl+ps58A1xRDDV+GDGnRpmcJDZnG8rykJwZcc8wlWOnV
	dp5ECV26FffWf6uq/TJTP0uLZqSPlSn1cQdIl49e/z40XqqtJrDRQSoUkotMV3NVk
X-Gm-Gg: AYBFou0HCL0DinESLHmcU8OO3eUGl+IheEYYHdGbggbW1D6HhN1frRopzLbKERk/UiN
	wD5nSVmHeS642RM4LZwHEdQIB5EVVr4w9fZS1cvBIn6zYkNji0MKkLNEqB8eGRzc2D3ybnpvI4s
	0RYfzHrbSNTyNXhdQ0/U2zQCKC8MpVaz9lGlOr6YP81mwtdcPV1MT6cgoceHPIxHGTXXEWXAsfv
	KafeB/4KoxFUPYfVG9lUfVNF6fLWKZH+LYiKQbKYjbUY3CyC+8jAYCzr2Q88+VZocLNONPhstMA
	HE34rIVEV+55utCG+ZxPyF6sSSk1F2yvXPxgz5NloAAqJwKRjCqd4Q8uBNoH6JGmIMezTkPAnr4
	k5XrLdb3grYT3/qCUO7EHHo1uS1ss
X-Received: by 2002:a17:90b:3a48:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3ab3a33ce37mr25720232a91.1.1792037586283;
        Wed, 14 Oct 2026 21:13:06 -0700 (PDT)
X-Received: by 2002:a17:90b:3a48:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3ab3a33ce37mr25720214a91.1.1792037585841;
        Wed, 14 Oct 2026 21:13:05 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944af2f1sm2267762a91.15.2026.10.14.21.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:13:05 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [RFC PATCH v2 3/3] arm64: dts: qcom: shikra: enable WCN SW_CTRL wakeup
Date: Thu, 15 Oct 2026 12:12:41 +0800
Message-ID: <20261015041241.2186521-4-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015041241.2186521-1-linghui.wu@oss.qualcomm.com>
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261015041241.2186521-1-linghui.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ex12UtFfTg5A-qD694dwlYQ0d1Jgzh3p
X-Proofpoint-ORIG-GUID: ex12UtFfTg5A-qD694dwlYQ0d1Jgzh3p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNiBTYWx0ZWRfXzyNfp+M7kSdV
 0KmfpchE7R1Y9MXAruXg9Jn/gw67CwZ3LMLvx08x4UvEeCtH6PFY6yKbFfsSVDTm9nKiUx33lT+
 U2v7MNRm7oz4lwsWUqY+Gi9lq4kDe+Y=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad052d3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=GJxj0BfhqkdqIuq2HFIA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNiBTYWx0ZWRfX3c9n6MZ81Uyi
 ki3IAYR2OUT6qM2Ut0nRqWwCLwuG4ZncaX5SxIXkW//YVW8l/JvN71SD0kT2VmT//kR+UYvMx0A
 X7JX4eT7mwpxvlqrgjfwV5pO30oC6HQtnO4AfxJmTV0luFuSQ6QYXQpCIJNF6R46+rRDDlkh3DB
 vhC5Ld1S398wFpXHOr/dCl7unMf0+UyS2A/kVH/vaH0qJWNaI12vYIzdTNhk5LBbbWtjPU+tTDZ
 FEPAXX7afiRX4KJ1y8wEdPtbtxW1FOo7YnSj2QMVV2w7sicwpweaDvvgo9aLVTzZMC9PtnaTmJ6
 d7Szg/Th2maSGvACkI4ut5e2xp1C4Mr7TSKvX8wHaYaDrILxATma3TmyQZDOwkY7dDjiRMGcmEn
 bg91J39/SeSIUXE7hvRSAEV6qrXQblxMlHFMD8VdDjiGCjeYJr3274pn5hBTCfcN8k0RgY6Roir
 v7QQ4Q0oFhwU9MpuREQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150016

The WCN3988 SW_CTRL signal can wake the application processor on the
Shikra CQM, CQS and IQS EVKs.

Mark the WCN power sequencer as a wakeup source so the driver uses the
existing SW_CTRL GPIO as a dedicated wake IRQ.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 1 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 95eb7255fb22..c7b894b6126c 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -102,6 +102,7 @@ wcn3988-pmu {
 		pinctrl-names = "default";
 
 		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		wakeup-source;
 
 		vddio-supply = <&pm4125_l7>;
 		vddxo-supply = <&pm4125_l13>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index ebc3052d57a9..5edcabd9dae1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -85,6 +85,7 @@ wcn3988-pmu {
 		pinctrl-names = "default";
 
 		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		wakeup-source;
 
 		vddio-supply = <&pm8150_s4>;
 		vddxo-supply = <&pm8150_l12>;
-- 
2.43.0
