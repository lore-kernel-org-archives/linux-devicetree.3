Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958BA253F07
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606382; cv=none; b=rHET156wxhmftmku63Rm0CTpQ3mpB/jHzsQJiuPD1yqa0AAiKQHwOOHm4W+AIkx3tGuA7LOhCAgk6xhDPj+8FqwzKAl/IfBVMu+GRKA9v3r+J8RYcT2+9/CoCp9KGQQSQvFMj/ycz05ynhLycALGnyvggduAoMk8gc1IpJsXaeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606382; c=relaxed/simple;
	bh=NzHl+TSMYx8b7yrFreTP5LVTAgHzY2fpAX7dzVZ+Ncw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hL7KvOXOZIZbmZWVnQvD3eOG/g5HHe58V1YRUvs2tGCDye79Raxq6jOpS4mby+WYMD3z9QtGIO9Wnd8uKLkQWjvy6sh6iiSMrd2/IEjqjaKcJTVqvWaPcdQpmfH678UX85HV4KSEgy3O6ulHIbdVLc5/9jdTZi5XTY4VV76jeWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONlmwu3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8Qlpi+O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONlmwu3S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8Qlpi+O"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w77O3132162
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mk7Qe3bjicV6DXPTZkBZhb3fM69i7303uZK
	vtWPVFp0=; b=ONlmwu3S78wEgZTgHLy0D7e5UtbzpGDnlOk0zNlgAW5SBJ6+V2m
	JUnjktz63ZiWM4hx4PegD7haVxPrHyEEO7VP871ZrRrJVBfZFyoKJsxukBDD9VBR
	DP8eGbc2AYylORPZ9jtakxCGwkxeUG3tPTbxQgz+B0+oq9Fj+ICQ4swneYaEbArf
	q2vhUMStwdPP2J4M1nKMzV6p7QxWi5Uja3/Jp4NeiI2f9jBSO9yMTs14DAW9/oZb
	ddVBQEDlNHgMUE3bFnLoq4fEA/3eVnJRpMZFNfmcTVCprVXRaPnP3LKBRdm3bIfU
	N2n8o5kWarNFvWQJp/LhqNAJ4guDo/+CaVg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s430ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:12:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50917996cfaso4498441cf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606379; x=1775211179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mk7Qe3bjicV6DXPTZkBZhb3fM69i7303uZKvtWPVFp0=;
        b=i8Qlpi+OV74wKWKldrhj9OEy/j3N8iFxd8wRnBKI0WZEKYDuoELot+/rOJuiRL9Op0
         UO1AT4V4n0/Sv0Oi1SnleYrrY10KOBKSUhYSOb7DNyxGGjhgIDS33OWVo3z2XF8x/HMf
         hisVyIybGasPIAeyBKohivqCrCDHoJVrpRrDAJECbqBOZjwMZyJNmUNxpnZNaUiwEhy6
         ZCdQrSbzOq59p5BYJWsKq7VfgkldxO7gRH0/gh69e4YFjcwcU3xwVUeUEvP4ZdkgYYZl
         qNdPGd+mqQWXLwg+m9Vn3eLMS1z8rNPLIRPpIBH6p152FPwNQNQMdGbY/1XqurpWM2Gh
         2QVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606379; x=1775211179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk7Qe3bjicV6DXPTZkBZhb3fM69i7303uZKvtWPVFp0=;
        b=dOheAi7juvHCimt0lREk7Qeen3EL4TfQrNpPVhbjRFF7yOHucpnTiNuFoxChp/Qcmm
         j+TLitnHs1VPrZ0GsvA6ACeGip9BCVzI2BwGoRqEhvLcZ/nQ5fwHDkIr8bUW6MXXlkza
         bk3FpqO0QIiTVXyyWGEJYcVHRI5/88QlPCVEOfNfmAc1Lxur9nBnYDFAfyrmUf8vF9DK
         h1tefimxZC/8fSaERwbRz+z4RK8EhBjxWM5aZIhwo8nQQP1SNumqwEvJVUoLwTKvxI4O
         S/6P7XeDRe/C2XQxqDNzYpiAeCRP51CXyOLetcNAGBA74RxIUcjsJGU3UMlNCLarGWio
         0KnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0pcBpCFKF+Gsa8FnEsM1rn/VWAtPecgJCngGKMxsbGJs2/HeuNYCxvHNIST4XZ6g+DqqkSJSGZzY+@vger.kernel.org
X-Gm-Message-State: AOJu0YzvDdmR9udsENHgMZhfb0p8cXW2/aZ4Ca83Dlg6gtxssuAmYIbA
	PBkLJq0w4WulNtOn4GBTIKon1CniKerZMx0iFZ50SUxJ4KV11OEIPOEBSrkTCrupdI8MEDNOIIU
	Kjliutze912ol47l72Z3GksboERsYtdVGFCk9SZByVIeiDaUNRsFKlgCevO1pzSeu
X-Gm-Gg: ATEYQzzZ0N7lbKvODsA+1I7/S4N5HiHNY78iRO7ds4yPja0nnByjIH5ryZs/SIirMfU
	GpyecZZQMSzzAvfdLh/7TtjkdglOMPDXrSLKhW4y/1/20ewefNQacSRmFyYHBXionCjsPVKim6a
	zc/2jfYmK41gYzCNQwjHCXc1dgoUxwpD4/EEByFSWLHp1ORxrC13hsVA4dmlo9QKY0QD168aAPI
	XoZzDj2cq6W5k/fpRGIOmN68+BHL9C1FkdNvUq0lYHFOZRIqRPjDWIVIId6PLgge15aoKtdp4YK
	NnLE2Z6DiNcrPOiFmw4+zBlgwFyxhs/Rh61K9CP3n/H0yjf+0uN8hnl7GjQkmpIH7f77+u0Tk3f
	OYFfY7ZsHlVerFGjkNmFq50lybM4PU3u7yz5i
X-Received: by 2002:a05:622a:581a:b0:50b:29f0:299c with SMTP id d75a77b69052e-50ba393eaa2mr25617141cf.60.1774606378900;
        Fri, 27 Mar 2026 03:12:58 -0700 (PDT)
X-Received: by 2002:a05:622a:581a:b0:50b:29f0:299c with SMTP id d75a77b69052e-50ba393eaa2mr25616681cf.60.1774606378282;
        Fri, 27 Mar 2026 03:12:58 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9179b212sm15075768f8f.0.2026.03.27.03.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:12:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: eliza: Add thermal sensors
Date: Fri, 27 Mar 2026 11:12:26 +0100
Message-ID: <20260327101225.382493-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11388; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=NzHl+TSMYx8b7yrFreTP5LVTAgHzY2fpAX7dzVZ+Ncw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpxlgJalbeEzRxcR5Q6asmJgRj1P1T+Gl13VXQ+
 wwkFqbVbDOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacZYCQAKCRDBN2bmhouD
 1wjcEACTjpiHEfQ13Tcx/b2+39b78UI9G9aQnPxzlg6N1fLlTYdRk2K57nlnxjSfa1dK93QUOk0
 sNI6i3VdCxSqMVIF/oeMn+LtbOT9LmDwS71Xc6cxVe0tIFteu4nk+MVspakFpwKvnKy8urfx/2K
 5KOvSFqNs5lKByXZPVAutUze/alTbLxiAZsG2zO6ZTh+FNTmrXctPeDzBo0ApNzLGBUhLNUFzqN
 f6udhOvrmn0clDB/1QR/q//vaMDMDhJqBZ2m9d7wVZvvpnRJ3t5fiZpE6g+c78BDVXUKZTOm9nm
 jhzQjv4q2CtL1qkTGn+25kt7KRKO9AqqbE0Ol61WAstj3hR52RnGW3py/SKkyiQd5gnq8ByxjSq
 35mOprPitKwYA5GSeZlqR8xqFp1zjKnpTBqRq75TLaeVT8b9swNEuiD0S3u9bzbXynB+IvRo8Dy
 Mjvzuo+gHhUHq+pX5uPKvzg1wUbQSG7doehn6QDEM7gvIDM742eArzytaA0feKtU4WzsUzauXW/
 D8Br7kq9iYtCfz0Kf6b7Eag/i1zpIE6KKsi8VCPi1sWqQ2zEiUTyCiKlj4VG0ujyvnWOnTMTcNW
 2/svCLEQXkEs/LlKoBj+2S6sF0wpa/NfSdXczlxY+nSGVS7KWx8dD+P8LewDCtsaWJmIOQcbNAF KdE1TU7MOZPlCig==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HCByTnNk0U89u8XpU1srDswJfq9Yiik6
X-Proofpoint-GUID: HCByTnNk0U89u8XpU1srDswJfq9Yiik6
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c6582b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kF9h6JnbGkHsP-tOwnsA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NSBTYWx0ZWRfXxSaPlg6B/Y5Q
 AS8CAFalxuP/XGC6t6tmwFqbs5fHjMCWmcTQyBSwKHn5PljhX4PHzhSmdsmNXE3Md5yqZpy2ONg
 a5nN4Fhy0iqe5flXhfXi2UFbCdnqxP8lB9ePhHUCcbDpbIE6z9APgHADLyHKbmg0iRD8mlGiYsn
 m6G8ONPrryRdY+xeXM+tbFGkojIc72pd+CWQpH1p2EYhUSB2spDcIWWr6luNG7nOcf56L03DJWL
 N8CJQZpfZ35M3YdOgYk6kbFiT7SctIoUe1pJMOcNtfW89cB+kmOgjV1jsyut3P5k+P8FGLDc9xX
 VMsd9+ifP+uvNiw6RjwnFkik/xPYdEFI7NoNX1HGbieuXQVWqKe4VHV2d7qi6FPOSObK7LFG5wJ
 q87O2RJAl5jWYQX97+VL9pkTK0cp9d0MDlXOS81Xucg4mgeyidHEAelY/qRsLGun0CDtbXzehLC
 yQmb3Y7osjd0sjTCPLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270075

Add TSENS thermal sensors to Qualcomm Eliza SoC among with thermal
zones.  The TSENS is compatible with previous generations.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Binding was waiting for 1.5 months on the lists. Eventually I resent it
now:
https://lore.kernel.org/all/20260327100733.365573-2-krzysztof.kozlowski@oss.qualcomm.com/

so feel free to pick up the DTS with the binding, since it is not being
taken via thermal.
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 561 ++++++++++++++++++++++++++++
 1 file changed, 561 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 62fccb43a7e8..4a7a0ac40ce6 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -912,6 +912,51 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		tsens0: thermal-sensor@c228000 {
+			compatible = "qcom,eliza-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c228000 0x0 0x1000>,
+			      <0x0 0x0c222000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 560 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <13>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c229000 {
+			compatible = "qcom,eliza-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c229000 0x0 0x1000>,
+			      <0x0 0x0c223000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 561 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <14>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens2: thermal-sensor@c22a000 {
+			compatible = "qcom,eliza-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22a000 0x0 0x1000>,
+			      <0x0 0x0c224000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 562 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <5>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
 		spmi: arbiter@c400000 {
 			compatible = "qcom,eliza-spmi-pmic-arb",
 				     "qcom,x1e80100-spmi-pmic-arb";
@@ -1313,6 +1358,522 @@ nsp_noc: interconnect@320c0000 {
 		};
 	};
 
+	thermal-zones {
+		aoss0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				aoss-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				aoss-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss1-thermal {
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				aoss-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				aoss-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss2-thermal {
+			thermal-sensors = <&tsens2 0>;
+
+			trips {
+				aoss-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				aoss-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera0-thermal {
+			thermal-sensors = <&tsens1 12>;
+
+			trips {
+				camera-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				camera-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera1-thermal {
+			thermal-sensors = <&tsens1 13>;
+
+			trips {
+				camera-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				camera-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-thermal {
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-thermal {
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-thermal {
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu3-top-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu3-bottom-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu4-top-thermal {
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu4-bottom-thermal {
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu5-top-thermal {
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu5-bottom-thermal {
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu6-top-thermal {
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu6-bottom-thermal {
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu7-top-thermal {
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu7-bottom-thermal {
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss0-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				cpuss-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				cpuss-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss1-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				cpuss-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				cpuss-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddr-thermal {
+			thermal-sensors = <&tsens1 11>;
+
+			trips {
+				ddr-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				ddr-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss0-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens1 8>;
+
+			trips {
+				gpu-alert {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				gpu-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				gpu-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss1-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens1 9>;
+
+			trips {
+				gpu-alert {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				gpu-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				gpu-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		modem0-thermal {
+			thermal-sensors = <&tsens2 1>;
+
+			trips {
+				modem-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				modem-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		modem1-thermal {
+			thermal-sensors = <&tsens2 2>;
+
+			trips {
+				modem-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				modem-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		modem2-thermal {
+			thermal-sensors = <&tsens2 3>;
+
+			trips {
+				modem-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				modem-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		modem3-thermal {
+			thermal-sensors = <&tsens2 4>;
+
+			trips {
+				modem-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				modem-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx0-thermal {
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				nsphmx-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				nsphmx-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx1-thermal {
+			thermal-sensors = <&tsens1 7>;
+
+			trips {
+				nsphmx-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				nsphmx-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx0-thermal {
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				nsphvx-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				nsphvx-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx1-thermal {
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				nsphvx-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				nsphvx-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens1 10>;
+
+			trips {
+				video-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				video-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 
-- 
2.51.0

