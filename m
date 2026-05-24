Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F384329C71
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652257; cv=none; b=fRu/R5oi68R7XtpuY4lGeyDVLMmhGhiuPOKOEzJ7MUjOqyvhUha0EO6Vm7yHAF0LOrLxq8vZT/7NUgp2E4smrfiLd6vFOkwKPiKG7K28tKs2HAKCYZX4pp1gxvrea4rWFAmDrWBbTNAGVPiqsm0Fv5pZLZhnEdYHWzHXaTpg8hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652257; c=relaxed/simple;
	bh=FHLYhjcHnTi+yH1S90/auOggbU7mGJYRlOt2Lry2S1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yvc3kPwzm7F79jb7WtNg3Kc+3PJ1KpdW+JsSIGRTf43WfPYiK5gbbQmy+0Gzkyqd+6y6xPpnHMNKyjXUM4Xi/XCtQrOMN1FuiT4fKFJz+HCtm12XcuPLD4bjhg7S38oksqZV662HikZ3pNiYj2xxJ8tMFO7/3FqnpBbP3RqeQco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIzgRwn0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YH6d81TZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIzgRwn0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YH6d81TZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OA9O0B128127
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8/1YFCun7nwK0khfAZYO26wBdqUr3Eyl9c28EwiUub8=; b=LIzgRwn0WZhDBRDh
	Ty9kcAaEFF/IGw1v9L/63gN21M5dAO+9DRksPVuroRr+KEodz76utZaS2sBMhDmg
	r8l25E3wehznViJKWi7pFtPO5AoNJV3ml4hamllfMHwEB6iqSZmQZknApHSB+CW9
	1Dwy7QeaE9oebDKAXyq2s+vJK5QywwtX9/P10YccCD8EfBwqFzsfLQPN2tSdCmpG
	7w0BMMit7jzNNy2cFPvRDJOsz6VaOYsPqCvwr696gefEoiqS2isDUyqBdDFlkU3I
	ElbqCaovd2JW6oKuXDtZokwxYj0pHCgBXpXCDLvCAq+01Ki8ypkORPtVvy3z2EUi
	N/nSQg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txkwqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:50:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so8484238a91.0
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652254; x=1780257054; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/1YFCun7nwK0khfAZYO26wBdqUr3Eyl9c28EwiUub8=;
        b=YH6d81TZwai7Q7bKJoVSMUtbjWXzqO+7HdadK+a6uLMqn10dlJN2dfzrUNK8XvKHzk
         ZEOQo23LnOUO4zrh4gh4wxVMCpNiIzzOi1svQgPUh77q0M37RtxFEKaLkKi6vuSsGub5
         7h/4N3dghJVMyVMQn5uveQrHSTmbqAdcqInrILopYFlLEpQsf4seuP8pc1vL0qtCPbF/
         sXZebCxAHSasWOfwIGw5mgvSuVOU98tBvYU5wJ0UJrjTl2UmSVDeOlo+eWy5d8erUO1k
         brE2DTauPblzoXpAs6jeWr8MUZURW2Kg4NJffiFtESgrRxEme9kn7qQeEXIO274ISgnV
         t1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652254; x=1780257054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8/1YFCun7nwK0khfAZYO26wBdqUr3Eyl9c28EwiUub8=;
        b=UTUpVbHQ57wTQ2fPT0LFJH4vIZYfLVNSVflc/bjcSlqkwAnYY4HXCOW2PxXMvRbebx
         nJdCv49uybkIviSvza4YweVAt2L6f2jK3ZJdCIvUjtzni3Rp+61SralNLbSD/xQxGA62
         rMhGsfa6eltJvEUjN5cp8Cg052EpGHowzgddN4/Ss0oywAoUe38jELLUfbrb5+RAzjnh
         orKk6JhBjJw3LA+E4XbKu5In74T78/+hlewQ6eOPf6BC943odkGXYeMpPVKeRT8YXPwD
         bWut/ttt+jWKfqWE6cdA+tF4rt10Ul7C1Hxjinq2sRHfu6FQukySvlumeCsAEooobVAa
         Hhmg==
X-Forwarded-Encrypted: i=1; AFNElJ8gyA0PGS9TlNYl/M1hsTuOiMuRpASmDYA12GHGRTS+6gMnuJOz4tM8Gvs/p5RwsgRx6Mm6THrC1v6m@vger.kernel.org
X-Gm-Message-State: AOJu0Yx839SSJMlZe8JHJorFLjTv7Iph3J1hbb9OYDH55hEhkxBhbNR1
	Oxg3OoZfb7oE0NSd8heyutGyEXOb46a3Go554fufiHzICQbE1KhGSNYy8ykN351J3UnZdLlY4hz
	1Vx/keanA4d0H69hCjThf2WJF046vVpHG3ltSgEU3YoUNpWtZHr0KJ/VB2/8gQh8n
X-Gm-Gg: Acq92OE3P5lY5xgQO7U/wgNry9btaq/EisLv7La6Q0P9U2EWokWdSA65QEod/isUg4v
	zK/quOJK7hqFFvROjOg8tKY1hNxt1k68TKphW987YYnl3mPnIBNpQPnMvTjUJLVrYDbfr4dN0PY
	JxDBT+wYJuMLc5StskjE5HlvV0AnOt6zjmRPjN4xgd/5V8dOwhWfd0WxdSxH6RoUGjIH4uqvD7k
	x+GwXbA2ngAfh1/1OL4Vn8FPEiXMHQu6SyOavKN64faeTskgWDW0PhslKqeveV5HVhwuIsutVko
	6VETIHLUg+DHbOHMeUK+PLnbaOopsipMOnIx4Ex04U9nIvm2nOEzTwlqbnobby9qZFprqcDCKo8
	YD7koTjYBtebO3r63Mo8hc5YsxqNPYY+mnYOw
X-Received: by 2002:a17:90b:3807:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-36a6741dd88mr11802250a91.1.1779652253843;
        Sun, 24 May 2026 12:50:53 -0700 (PDT)
X-Received: by 2002:a17:90b:3807:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-36a6741dd88mr11802222a91.1.1779652253240;
        Sun, 24 May 2026 12:50:53 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:50:52 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:20 +0530
Subject: [PATCH 16/16] arm64: dts: qcom: shikra: enable WiFi on EVK boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-16-f51a9838dbaa@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=2856;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=IuIrHBERJ0hnqrRSXD3mk6EzC+EPUKJKq9TAcJbNRM8=;
 b=cDCRCUW8TmJJZNo9vct6MG1ITuL5Rl0JD6RogQQt16QeboTCRT9BwbUoc17/k4xqwSkC8dxbE
 sxKLOVzqnRCB0+Hjy8pMG7HMwwl5vMCt/My/3pq4KYG0VR+Qiraijia
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfX6rF8jdur4JGX
 66/Ujq681MJBdYfyoSHHwycrRH2oMo0smB4VVXSrd67IHWzdJGM1TxsVlh5DCaxbTREhCq2nEvy
 2LtXOgmdNgkv5S1g94/Gd0E7qdx4dubNfkoNxtLRwe+0+5fdyXCXBTZfgdHbNAOVySGMzrzsXJ8
 GFXnUgjdGhDRH7bBiLn+V0mWWXKWFyD2mwnTXzvELRqgYQ1TNC0uBf1tPs+V+eTlEU46ZlXm8Qi
 7QcDw4wmMZRD7pHBafaDmL9jTwqMvkinJ/zy+UPW8+SJKe/APgw1s4bjZRYafRodGzYYpi0huKb
 WD7RYdaC4H/0yA79coMLlLmRDJRT7RY+DNfZyYNUUW4EgUnSinAfbz9WqEGNIkHyYK0qnAQfSkP
 GPD5HoPgKMcvVSr/ehRN/FZx3GQDeHCzs3as79Rh7PSMTPl+spMffHQz851Cr2+K+/Qcnu+JMp6
 p7QYd8XckwSUaDZG8Zg==
X-Proofpoint-GUID: xd83cLR6XmP64R5BctunZI5JyP67Jfll
X-Proofpoint-ORIG-GUID: xd83cLR6XmP64R5BctunZI5JyP67Jfll
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a13569f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=D3pLEnpNgmQHNggwgVMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240198

From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>

Enable WiFi support on Shikra CQS, CQM and IQS EVK variants.

Provide board-specific WiFi configuration, including power supply
connections and calibration variant selection. The WiFi node is
enabled on each EVK according to the corresponding PMIC and board
design.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 11 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 11 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 259032bd20af..15208e1abff6 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -69,3 +69,14 @@ bluetooth {
 		vddch0-supply = <&pm4125_l22>;
 	};
 };
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
+	vdd-1.8-xo-supply = <&pm4125_l13>;
+	vdd-1.3-rfa-supply = <&pm4125_l10>;
+	vdd-3.3-ch0-supply = <&pm4125_l22>;
+	qcom,calibration-variant = "Shikra_EVK";
+	firmware-name = "cq2390";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 142cc8da53ce..51267c1a86b3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -69,3 +69,14 @@ bluetooth {
 		vddch0-supply = <&pm4125_l22>;
 	};
 };
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
+	vdd-1.8-xo-supply = <&pm4125_l13>;
+	vdd-1.3-rfa-supply = <&pm4125_l10>;
+	vdd-3.3-ch0-supply = <&pm4125_l22>;
+	qcom,calibration-variant = "Shikra_EVK";
+	firmware-name = "cq2390";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 9bf52030bcc5..f4e93cfb77e3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -30,6 +30,14 @@ vreg_bt_3p3_dummy: regulator-bt-3p3-dummy {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
+
+	vreg_wlan_3p3_dummy: regulator-wlan-3p3-dummy {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan_3p3_dummy";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &remoteproc_cdsp {
@@ -77,3 +85,14 @@ bluetooth {
 		vddch0-supply = <&vreg_bt_3p3_dummy>;
 	};
 };
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm8150_s4>;
+	vdd-1.8-xo-supply = <&pm8150_l12>;
+	vdd-1.3-rfa-supply = <&pm8150_l8>;
+	vdd-3.3-ch0-supply = <&vreg_wlan_3p3_dummy>;
+	qcom,calibration-variant = "Shikra_EVK";
+	firmware-name = "cq2390";
+
+	status = "okay";
+};

-- 
2.34.1

