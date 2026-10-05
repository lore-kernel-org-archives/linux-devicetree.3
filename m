Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA16147FAE1
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 12:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203129; cv=none; b=eQhIj4kSpnnZDmCptZWWaSK8QhsGlAC8UTJSx1a0DfsUGH22KbcMsFdGhAIFmNcNy2hcVgRPxSXGyEkWa/YbQeSiinSAWSz6An/LkGYT4kYc2r/+jgbHXzAa3ggBYtbwAy2Njz9Lex74TOigTqx1BUWvtsXc18bMWFfljeNDQcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203129; c=relaxed/simple;
	bh=l2UFpeIb/ZppRxdD8O+VfdTDOJW3TTKOPFZvJP5Dwe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fqlb+Mgrs7Dnqk/zdwoC6rRpsgu27mK+d9RPYBnFWAGVuyngfJryd9VGtc7pDEUg7p9GmFLlS+E3CzPzkjNEy0HE42Mi5H8blBzcD5H328VNOI77QKNOT9ScAvvmDRbsbX52bUz+RhmVbImds1Xs0FfG0Z5KkMqFU7UI5umROA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGSxfRrL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7e14gej; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGSxfRrL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F7e14gej"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFVBs914098
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 12:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YJzYAgsj56oFX/JcQeAS05e2XVfPMZWJGYGTeNHh/zk=; b=jGSxfRrLph0fRsLe
	m1KhMAO2peKTZEgDuPj6ykjOPLDafOPpLyvA+coiD1f8AftApRHXXonjRw9ueIjL
	UhB3xXGmNUJRbEStHO0fgWydmKr+1ouqxTtYmJvMoqallM5x3wF87B2dZbyOr/OA
	6YhMXNYUSW2pC4/9kus4iV5Zxv/6tnfTOXEyYURbNnik2AG8CXU39L3XiMbcCLPP
	jpV7EDJaK1CfjVlE2kj5tNfcGJxi67lcJEXday14uZIrj1Bm4QIFOLKLddVqEwZn
	HwEWRIWvAaPNZsSZy1KE2PbyafxIEpaPPZkFfGYuwWRBHiZcceAsWOi+jwSM8SCe
	u0rFQQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfkp1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 12:25:26 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8255327a28fso1536219a34.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 05:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203126; x=1791807926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJzYAgsj56oFX/JcQeAS05e2XVfPMZWJGYGTeNHh/zk=;
        b=F7e14gejlftDM5E3PpANgKtAzbYr8nwk53/lVIUI5vl2dDjjK57icopI2Doy7SaRGn
         e24chwo0JwBxOQ2M5mwic2Kv+0uBvq4rI0xKZGn/w7CzGq8HXFBuJ5IYfu6ST5Rt3n5D
         k+GD3m/SNmiW4SRd+GbxUw9N/zJDBPdcq+T+jmzoaEsl0pIM/laDA+3E9bcINKgqFu9p
         t0p+06o0KGjW+s6P6banB9YVZ75mdgTbQCbyxOD210BJG2VxPNZMiHHH9UJxzlrsDfbG
         fezsz9LRGmH7TD2mLmydJwcKOEZ3IBbogxS7f/oEt+BRdK3EUWiRotfgMI1FhpJsHoo0
         96+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203126; x=1791807926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJzYAgsj56oFX/JcQeAS05e2XVfPMZWJGYGTeNHh/zk=;
        b=qg8WLVxEvNmBpicciKCALqoKDgM1xxyFIIInEbmjaQRB2wFdFQBX4H9AJnqCkq7Ayq
         5M3iDgIqmf8MISmvM6neJFwt98yx/TKw+Hj0gpY2pbba7WqF04/vXuWvAtX5rjB+h73q
         0KVmFYBrxEG4XaoWqrgJ5jSOauh/XjCvQGZFiukOS8Kxez0QIoTTUEfIGcOOyzfKEig8
         pWbc66MoeYfvaVVFivXowvi0/s9hhCPWXtR+YRCm7MdZ2wkMWvkqFitZXWvokDIWqjnT
         Qhi1pUE+IOtPTb2DVzvBHH2IUmNV1FD1+Ibf6tnc8atYUGn6ZUeuOLKgCZ5KONqxFmsm
         /MEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKYWYKiakClDxBNnriYAWcY58UVVy/syInwJ38+YhzdXuX83CAVAojiM23Xz3xSq5qCsD4nDudHE+v@vger.kernel.org
X-Gm-Message-State: AFuF++mWTIyxIB4Rih8i3rym7+2xssLXqdq5QmzMqPPPFnnxLUUUi7Ft
	eJVJ9F2FpB15/MoHCAD3tII6wVmCTMCpeAEEERUyugQO3p8L7YKZugYvQzl65XDGhRI6JU712Te
	xyuPUufpxCxQfpRWwBOR2ac0j7v5LqTk4qo6+e5OjMtaFk+KVOHofTZ+g8dkNEJd5
X-Gm-Gg: AYBFou3oHYdqOw5qNadxvLF30859ECULR8Pi7c3TKWPUPeDez2kZDHk1d/yZZSdSRGH
	6vkRb0lv4AyoIPEjDaxO2XGP2r4ojQ6s0P9cZfJcsiWo8SiBLT4i+p8mF9YBTq8+xx8sI0eTHcT
	4rbYkI1E3TMbFFpfhYaTH0wKNYg6deeu3UAJzVgA4LH20DjF0wu5b8n/Ho8aPOK2a0i3cRl+B/w
	ixoeaD7H+/7WTlkKsIKptjlownoQDy5401H7FckMmKCqOBT2CrQ+jGIrEroVr1ojCQ948VxuBIL
	Qzp6VvJxDhGxcLKqVJXFdc2Ar8eDfFh5PVFOLn4PN/kLna0ZXyT1LYiaU3qJrZeRXHAJbp+xNyG
	ACt/aqk6WbcJ9z1oVGpKumT6trW2F0BNuyg==
X-Received: by 2002:a9d:6167:0:b0:822:b35a:a2d3 with SMTP id 46e09a7af769-822b35aa750mr9186661a34.9.1791203126147;
        Mon, 05 Oct 2026 05:25:26 -0700 (PDT)
X-Received: by 2002:a9d:6167:0:b0:822:b35a:a2d3 with SMTP id 46e09a7af769-822b35aa750mr9186640a34.9.1791203125674;
        Mon, 05 Oct 2026 05:25:25 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:25 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:07 +0530
Subject: [PATCH v4 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
 sensor node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-6-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1240;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=l2UFpeIb/ZppRxdD8O+VfdTDOJW3TTKOPFZvJP5Dwe8=;
 b=jYgdPcZHCJob0qX45GklNH7KCVf8mAgOLlclTbZSsCEWFfsIr7/bylCbVJY6XrI13QDYa1bnM
 Y+atm3wKaERAprzxhkEEEl+wkU9dYQC4m4jKx9Owy225aAS/NO/ihuQ
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: rFTnpyQYnBQiVZ1knfJfTKIoCJqV9HSz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXwaODx3ANP/n7
 XNy2GJ82aWUl9bTNXNuxhQqX1zsL5Cp8INl8NeAZId9tZElzzpapM9H8LkkZJ1s0njhuXJKuZCP
 IqHt3kiCvuGZYHb2TmAOpKX3JL2+B98=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac39736 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JVADKE0FdtAJhbIBjnoA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: rFTnpyQYnBQiVZ1knfJfTKIoCJqV9HSz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXxBoQhZD11aeQ
 jRYF/jX9hE4hkTMy2/FYt4+x9qaBmwpnT/2hrvmQx9I9bHGjoqdzpUqToRDHZdQJzckHfuQREG9
 hnYtE+a5e/77w4VQjNWe5xmy3QLJliuqU3dEjlleoe+pXissVc8qvYBq4f5DTxUusyfzXCTVrNB
 tIzMT2H5sILWhrCes+7RWB7e7/SVufuerxerbpbTgEzkGGknPW1bfL+qzmCY292Qnr5XuH53VJL
 dJcrg8l4yH9bXXwJXGsk4+t8EEeGV4jJeE2ZAYYLbbBTb0tIyzvs6EbQ4IyVfDF2wvtGisUW3Y3
 epkOzNBKm/4eQpxyioTiVi4QrHabltq/zwSidmxg7LTbykJ3mfJGD6HN+w6eV9PohTx23dRB9g3
 1ADsZqRlAeblC/SrVzbz6sd4vfxVuxI6Z/dmKmf7x9mbpQxTSCwfyoRMhWnhR7kc6NSNcRpSEDl
 oUiFlt33rCXgQbL4kRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550ba-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
index 18692893ca41..f0c252a386ee 100644
--- a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
@@ -50,6 +50,17 @@ pm7550ba_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550ba-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7550ba_gpios: gpio@8800 {
 			compatible = "qcom,pm7550ba-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

