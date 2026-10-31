Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453035;
	b=XIkOD9TXbtnLiFUdA/u2O3QTv8AwjKwpPIfR80fOrE7G18VbJ4Evr6lmYressBA+t+Sf
	 f/g1lfQ90RbwFZxQhoCH4nHAFK9Ruwisl0MBLSnYpET1OygHpF5R/zCqkojNMT9T8CUcd
	 fZha1IOc7QODgnJ00QoCjP20eusUWe3nONtl6jEgf/v6NCG2UHz4S07yze3T9qwbpuVvx
	 ZGSg6t98hHQIgClQb0qqTQ/9lxg6xoSI6PtcyjyqS7CF1ed2OrjN+EF3Kv76w6XYrZ8Mu
	 KxxVqqnJFTGEJlddvSGPaQ4OAcpqF98Mp4YZs2mgaVN4OWEVTM1WLk7IXNRdEccelTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453035;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mr9aAsQ/GcBjwXE64X4/hSdBwmEaTnPI15Fz4ghAQGE=;
	b=pfz+1iUIhwPpl2UQUu4cF3K5hLh4hTBhEHChXTfV/EFuIvBj8DZ9k3iVdm7faCcd5Ghv
	 92ZSRfAf9PkI+mnHCexJqIm8qZ3zwxbtUl5SGe/Bd7L8vwr0KyTav+SCWl7vlfSgBTc0v
	 LKkLRhmGoPZRF6V2ZXN0vv5SmqZNwiH1Z3S3ENKgVkgUEirPqqtnA4+pSHXg38vFBuQxk
	 DnNG/i8vuhii442U95iUTmg1RReSyPEtztoGVZF22vYohTxk4SY8U7Q1dMa0Yt5drFIa7
	 Q8RWqXzA3aj/HMcvAugYr/7/pj7ac+m2je7lJBUt++QmLNQdBXsLpoXL4CrSjK8CYDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="OHIdTdt/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gCjL8yo+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14047606A320
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14047606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OHIdTdt/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gCjL8yo+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VCxvlL2765513
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mr9aAsQ/GcBjwXE64X4/hSdBwmEaTnPI15Fz4ghAQGE=; b=OHIdTdt/k8FzhNl2
	cpnKZ1ptWxQGb0qB0J1bVEcitOuq4xWEcnr2EOpTWYIqgALc0VUhFkF0RPyfVYUx
	upWrQFRgmhfS0uiaDSOVcGKv+IeKM/01VMuJCS6U66F8YGzVmj9NXaPc72cTl0+P
	byaiVgmePxMVz5surUDUwsvbh/zwI00JumCWPKcHT0G3A9jrv9wBWbU0DDNPeC0F
	5TZh4td081cDKOuegK5XISTZ/LA0zV7X33qphGD5/aerHZaC4QPM8n65c0woUfVS
	m8tDwr5AfxHw6FICPvkTlcq0hDezNCgQJafWxQpV7rOT/aS64OEagoa0lUDi2emY
	Ei1ZhQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6ha4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:23:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so3726717eec.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793453033; x=1794057833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mr9aAsQ/GcBjwXE64X4/hSdBwmEaTnPI15Fz4ghAQGE=;
        b=gCjL8yo+aKgtBfkG0bGwFG8yW2mFQtzB+R+4pcQmLdSECo5nhjlWhosdgB0jw9I3/C
         wi3n5Fpnp1rK161QtArZNMSTRtmO6dOF5RYPI0Bz88P1gf0IMdMqL2fMzMnh4721s4HO
         BxJ4FBGGYpzuuW+QkfD6TXGfM9UmUkSO43vkeuFGEwWaLx+R+HDX0vqyULPTUBK0Bf/u
         f0dJM/QB67p6o9j33BgZFlU/Ym1A7OfRjWrwEOTzv4zsUj7P+0yyvrwL+bDYWoV6kr7e
         bG5EpQ4uS58c2QphZRCQKP6/zvCd/u8AwfXAqhkO6QNVHAMzIUjhG9Pkvjpm+7tPRIdC
         qdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793453033; x=1794057833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mr9aAsQ/GcBjwXE64X4/hSdBwmEaTnPI15Fz4ghAQGE=;
        b=OEpKOUxpFnIDaslm2oV1gBmfUeDm+d51pD4qvm0pUZgs4nD8+0THE4rLD5pT9zeomd
         dqalno9nUkUA7rxYcZzHJHeJh2ouFR61pgBucM5wO1qfpYTwQ6/2wlgIwGcUH1vYPvd7
         BlbGMds0wY2U+kKfGe21ml3SV8qbIU0jaf4zt5Rgu6n2T7vB6FF/wWv6HvU/CaUpLu1/
         PasH3dNX3XK2V1Mqe7F1OBkpqgrF9tBk0gaODh29P5N2oXyyxtrEiMaj0riR3cW0WaJw
         YSbexOkgfXObOhZE6LGeBlUzU8sZKAFUP9JwyECUk1LaVMfZhFw57z9Q2UFNuekP5/WA
         ZoRA==
X-Forwarded-Encrypted: i=1; AKwUvBypXlcuQWDbHq1trojGauXicG/SOOyItfPD6WmgI8/rOa4j2YZ7QgHKSP0pkzbYSSuhYN8/5pxr4SH3@vger.kernel.org
X-Gm-Message-State: AFq9FYLiHB8VfWFVrAXmTmbsTjAjoY173O5djw9c85DFs8glqJ1EDxea
	qbTAz6anxmGhTjnMMv8NJoknPJ5pTbDTyxEBJrns+Bw/cWnXDGEYldEoiJbsODzx+ajZt2IjH/5
	IS1uAEVAj4OmAE8Fjd2jcRY/7j31WtFLY+0IkbOaxErkf+1RB3C4RDfrYmM/KUs/G
X-Gm-Gg: AYBFou0YZL1eC1j1yDtZInJytq6BzaZFc8H0ssSETHJSVTtk7mFSfi5J6D8k9DLnf3g
	z2G8atgQ0uLCj8dvKleQH7aH6I6ppikn3IKhJJGLxR+SUVVSbMUshu08V6F5SJvsQeoB4rM9AkI
	jPhOHHzaUDwSCzpXsscARXWz6UDHjuwEuMeUrJio9X0+MgcNffG4yYXNvjtVMLm2+uDRs0netNu
	cyUJjq0QtoeSTS5KYCt/+/DleVxv24sXNpHvstzZLw6rxNTFy7NnvBe9Qxjv6Xr6doX6cDNfFEr
	CO51V3GkbakpyuZZPkCIRWhVYUnQGD6yN51m3/5xjRDXmib54tIL6exRhNWnF229Dct8X7yfQWZ
	FOu9i7R31dx7RT6DtVfQzhR90wYnj4upuB6KIu0jUCwcnIQWm5JMHzPYLJeOfTINjdnu06SDy0Z
	TWAGM=
X-Received: by 2002:a05:7022:5f0b:b0:168:3243:c91a with SMTP id a92af1059eb24-1ac5bbb966fmr7281713c88.13.1793453032680;
        Sat, 31 Oct 2026 06:23:52 -0700 (PDT)
X-Received: by 2002:a05:7022:5f0b:b0:168:3243:c91a with SMTP id a92af1059eb24-1ac5bbb966fmr7281651c88.13.1793453031986;
        Sat, 31 Oct 2026 06:23:51 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm18234699c88.11.2026.10.31.06.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:23:51 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:52:52 +0530
Subject: [PATCH v2 6/6] arm64: dts: qcom: hamoa: add thermal hw-bin support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-thermal_bin-v2-6-d76fd073ae98@oss.qualcomm.com>
References: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
In-Reply-To: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793452983; l=5501;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=lf/HWOiVq2goAnrErZNybKHU64QNy57/+sqtdj020rs=;
 b=/Ieq6VVIVGsWZNyme4tdWx2ETcvYzsJYZAS/uqPl5ZZmRudHR0vnc97YcG4YGo2pZBntP4/Qd
 K647mMQbYYcAS1UWfdPAs7fNQUQGlJ+UI/J8s+s20H1EHR1eNsO5Me0
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-ORIG-GUID: pvrl8SFa0HIp616XkmDI7MxcMMgzphAS
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae5ebea cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HHdy7Z-N7RtC6Qn240MA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: pvrl8SFa0HIp616XkmDI7MxcMMgzphAS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX9IdIusjn02Yf
 gPGNqRUrLh5ThZJ4BQDMjeNVpm59bGwlBcAZ6Q5yAVsdEodFDK2P+D34sKNGllmMpUBUiJUzPvf
 wOd3H1YY6GgkFeD5uq3DRIM0uaQeQM0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX9hPUJ259YGCW
 RU4p0jNU2UOC2cGCi4oaljQ01AmCf67uNw90K66IEQKNq4d+ne/QQgn7mfHX6XhxRqsyzmjqWYU
 VzHI58QkSaxRbxmpiQ0Il7NzFZVTOijcDJIK+iKGXxf4/0i0GqXOcSPbm5f5ViZ+/ZEMJ/yz9YJ
 yHYpVX/I4xy37IeAY+QaDNWI2P+6QQanqzoIj2Gn7UzzU8bGE7DySLTiTdPzgyMI9i/BP/hMlxK
 scF3OCikYArctmBugsijvawyF0dKLMDHudvujZkkcCCfdyq48Y8uhs4zo3P6oq7uwitn7BRf4sH
 0rS2zWYD4b2BOkckev30MRuDfEZGeW0IMbL0eGVicRi/B2++fAEN46EUAT5u/HKMLh26INHScAf
 /9B0Sfyo6LfJYZ8bi1YZTM+0csaBtSHTWpa7Cfnspj6Lg093yXo80RmE0jCC+nS1JMpFerui8WR
 A81kh1ta0fXQVBavxbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310053

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

hamoa-based SoCs expose their manufacturing bin in a single i-temp bit
of a qfprom fuse. Add the i-temp nvmem cell to the qfprom node
and wire the tsens controllers to it so the tsens driver can feed
the bin to the thermal core.

Use that bin for the GPU passive trip points so industrial-temp
parts keep the higher 105C threshold without a board-specific
override.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 66 ------------------------------
 arch/arm64/boot/dts/qcom/hamoa.dtsi        | 42 +++++++++++++++----
 2 files changed, 34 insertions(+), 74 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 776bded3a312..03d753a0ab74 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1553,69 +1553,3 @@ &usb_mp_hsphy0 {
 &usb_mp_hsphy1 {
 	phys = <&eusb6_repeater>;
 };
-
-&thermal_zones {
-	gpuss-0-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-1-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-2-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-3-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-4-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-5-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-6-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-7-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index fcd88e5f5d7e..6cf911e30973 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -2766,6 +2766,9 @@ tsens0: thermal-sensor@c271000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -2781,6 +2784,9 @@ tsens1: thermal-sensor@c272000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -2796,6 +2802,9 @@ tsens2: thermal-sensor@c273000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -2811,6 +2820,9 @@ tsens3: thermal-sensor@c274000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -8809,6 +8821,12 @@ gpu_speed_bin: gpu-speed-bin@119 {
 				reg = <0x119 0x2>;
 				bits = <7 8>;
 			};
+
+			i_temp: i-temp@180 {
+				reg = <0x180 0x4>;
+				/* bits = <offset width>: 1 bit at offset 0 */
+				bits = <0 1>;
+			};
 		};
 
 		pmu@24091000 {
@@ -9669,7 +9687,8 @@ map0 {
 
 			trips {
 				gpuss0_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9696,7 +9715,8 @@ map0 {
 
 			trips {
 				gpuss1_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9723,7 +9743,8 @@ map0 {
 
 			trips {
 				gpuss2_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9750,7 +9771,8 @@ map0 {
 
 			trips {
 				gpuss3_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9777,7 +9799,8 @@ map0 {
 
 			trips {
 				gpuss4_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9804,7 +9827,8 @@ map0 {
 
 			trips {
 				gpuss5_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9831,7 +9855,8 @@ map0 {
 
 			trips {
 				gpuss6_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9858,7 +9883,8 @@ map0 {
 
 			trips {
 				gpuss7_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};

-- 
2.34.1

