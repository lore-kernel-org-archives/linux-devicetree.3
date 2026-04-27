Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BDD3B47D5
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284356; cv=none; b=TC+hZZkPdp4CeZCw33rDuDrHTVEgTzVAy65DZnL+PTBo3a/s/Kw3rVizJdRhRrDmlPIBlCkJ/ebHTVWgNAV8+1GhCrgmSHUfVHCUtKGveRJ7DJ+8STvOPY7TT3v3OyluNVDsDWMRpj57Ep0eDuVahgQHHqsixWznFi4VvCRUl7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284356; c=relaxed/simple;
	bh=+E4tZfMlel36uwMhdXbJ+b8CyJSQUpcuObNpX2cZjj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=klTJdQctPWMfneKTMuMNTFzeQwNbaruZ8bD6HJEwYFzCrYdROz79ezsg1VZfwFlPLBukQfmqds4dmq5iZ2TvBKQmk5x+Mbm/LTkHDCs9c8WtqZpN9auZQsnNAIiyBc5uMrHtIY/iPa8oioSxm9wqc+HG8iqLvzJNsLQ5eMm09kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BT3aUdX6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+5hwD5l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BT3aUdX6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+5hwD5l"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TClr4054535
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=; b=BT3aUdX64cbdVWP7
	JOZkuEd8UF2XXrH8pF0AxWqQ20nWvVUQI63vVGT1kbcvPgjuHZCJowoUehvZ9oh+
	1qDQD9iHtPg/mBSSRsfjfYzBmNl9naIcJIH8xDCoP7m9zhg8S6CWMgFPnZPLOJud
	RrMMYV+dYZMxb/ox1OS5d13wVFMO6OlD77jiiJ4YCKhWVHXCFznORlw8mtG3yCw1
	OLUQ+s+ZUW4sR66oh4pHPHJp9WDJm8vFCm8vCDr8Pc4z7eWV60uMdXKX9ZGAKkVI
	GpOs4eTjzYEqxb6vZn/mCaDFdWgNTf5NDQ0pGv5wpUtICDBRIR3G8oLVzTl+Z0Ph
	XduikQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkxdksn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:05:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c798ace3e03so3860559a12.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284353; x=1777889153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=;
        b=e+5hwD5lgsL5steTkh+1XjBj76V4k92ZywC/FASZXV9rjwUSUTC5hbEOfcHjjNqoC5
         Tx/P9/wMcTinmek1s9J7OF2iH1iM7nTk5yI3A3s6SE1ibpD0Z3GOeuIOgcOSyDV7FfDa
         rY+HrYXNoSKcVOE80nWw5nwfdemjBQV9VpJf5RiMoF0+D8+jL6VrD97Ixktqt+B6/Znn
         PA+TbymCqxExrGSM8lNAhEQaryR6zoCJDwR3VTQ7lYdFL9EgqziO6WJP+d/vYjyUjQpw
         PmUwrFxqplBg69blvKzT2BtECXNg5cYkHSg2GObRjyqh7if1EZWZnE/Se+Js9s8ezsSw
         +tLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284353; x=1777889153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=;
        b=j5hJ355EVHUyDaN8OIAlqB5/GSq0VZrE0z0jBEbS44lK2YpfxFxxyjdtLA5A5MkG/p
         DrztmgirydlLffmrYqqGymvdW+3JXf+lW0Qg+gb2RswZS3QBGxAinIe2HrdMTu2vhOkR
         QI1TRrc+4RoRobFNqAEsjXskr35nglOQ9FZmaNUgvOqV3dXx2Ij1AHseydq7PobTFoqA
         azPt7sTciVljx8Cxr1LxdO6zJryPx2+QpKd6qlobKu9oRUYZRm7NZGVSYHu1Dig8UEfx
         oT0A2nmemIQSmYOkjZLgMEjgbW8892+3QDsSuNe15XAV0tT8/6B2OD5d2brHH7fpmRYf
         8KVg==
X-Forwarded-Encrypted: i=1; AFNElJ8IRQXIqxWdgsEQVRmXZSXbGxPqkzCjd1i854m08L8xpkztU8L6mJSNxp1gE6wFenP6yE5uyP/E+yn/@vger.kernel.org
X-Gm-Message-State: AOJu0YzUUyIifg2v0YuZBD7HEsjN9ILG51N/EGfivulN08lEzu+UxCME
	Rp+vIJSL6wLLUTv1BgZzzR9MXwYiJ8cqDO9xppldR6eqZHccf9QYU1AgvDvwV/Xb1UHdir+Z+fJ
	L6EHBADTUWa+81v9owp5nFfD/uvfSY/lJSiv07StFncZBs/ReY7/37th7tKujGSOy
X-Gm-Gg: AeBDievw9BfeG0e9xl4wNxPikK5tENbOv+rgV0n7DAfDYtxK0ip6Hm/EaBr6LL7saqR
	X6jtlqMcJnY1hLhtLKmeKMfmtl3uikctzyYL5f5LgbXGSnpM3oS38Zd8wL97bvoMWUe2yZldPiR
	ko5oDyNgj0k6W2NqJ9nPrzT87KJuLcdINY1AmWumu7FeHEm68Tcd+OXfg2poXadlfayeF88mHqK
	wofs3hw2Pbq5v3qud3dVu2x9O2p8f96oBnVuXk4yCj4IqqJZAAdxxWXCZcb1Ow6sjCDK1djrj91
	3zs6w+KXoKCs+0QQxYKIBAeTmF9pqT4lUkhYZgXbKigW4lnM7DHMSj+vDN5cBdu2G7qjDGtavQ7
	tuDFhTY/uFmf5SInlMGzKgXGpjEeS+dpldq9FHgeNypzWN0oq/6YoPonV5zpVL61rq+cWOBFHn+
	vPPaANzeBj759SMc/xkKNmIMurtPBILAQ28usuIeNvlSjn
X-Received: by 2002:a05:6a00:ae10:b0:82f:9300:cc44 with SMTP id d2e1a72fcca58-82f9300d8d3mr37687521b3a.8.1777284352601;
        Mon, 27 Apr 2026 03:05:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:ae10:b0:82f:9300:cc44 with SMTP id d2e1a72fcca58-82f9300d8d3mr37687487b3a.8.1777284352136;
        Mon, 27 Apr 2026 03:05:52 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec24850sm33004008b3a.60.2026.04.27.03.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:05:51 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:34:56 +0530
Subject: [PATCH v8 5/6] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-add-driver-for-ec-v8-5-702f74e495f7@oss.qualcomm.com>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
In-Reply-To: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777284317; l=1627;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=v3xhy4TAVQzMuukJtx0ZPXFz4/C8vTU0vk3Dukc5Tss=;
 b=G20t0T6hMFcwFiB3AZXoLPzJUgYeyg6CKBcrlYdOUOKBo9Cu4kmaAD32H+Lj4JcIu3JWSqVOz
 xHb0FA5D2tKA6Tqiu/8D2JbXshlA731qqzunTq1XB2xyNkRJQndu7wE
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: 9v5o-5dNL-_naLVDBnUF8QjP29uAc2gB
X-Proofpoint-ORIG-GUID: 9v5o-5dNL-_naLVDBnUF8QjP29uAc2gB
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69ef3501 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=um1wo07bdbQtbc5qrgwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwNSBTYWx0ZWRfX7orRPNJjm+Z1
 KXFxf8+5+waYE5v9VLc/U75zyApXOMHiiSn7zB1+qxQThO5UbwIJAGhm56+OqIDz7LvU5su7+h6
 n5ZgRomWdj+H86D09lLX2t+RHBfNJJPQLlj//X76hF+QnCtma7Uj1kci+MoD7FFF1xDIa3goIFk
 ytm+rl7NsBchv9zvEe7/oz0JOwCLFdO4AefFuHHaZgG0SWo0uqb8avGInUWiNGQvzsFM9Iw0gB2
 wL5DHRakTww+bIELVNaYkql0XHa5W5Cdj3OJgVpvsbVNF8E/tiXQEXvy6ZnpoksMEUsjxGnyfcX
 VVFt0+I1NvQes0eMJ4ZCKfGWbhrAxjLAOZ3LoO/bgJQ12/hK0zPxJoZa/q2VjE18JKmcWZwltCb
 2mzwcTnE1nN3T8DBw3SlcLx+PR4uJ2bZDZumgRcYJKrcj2xmtsO4wduSSR7Ztcuv+8XGxSCFjBA
 7eeVfoxXAk1BEteCXSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270105

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Tested-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f6..a0d2ccf931ec 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -831,6 +831,16 @@ eusb6_repeater: redriver@4f {
 		pinctrl-0 = <&eusb6_reset_n>;
 		pinctrl-names = "default";
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-iot-evk-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1320,6 +1330,12 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1

