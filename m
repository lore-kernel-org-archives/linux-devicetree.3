Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F093B52B1CC
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687456; cv=none; b=hfUGql76uVyvgY2zf84cPo8fULswW5KelfoT5WXPqp3R2BBfn+/kLIKbjm5w+rXh0UrOzjODHLzwvMrHNGUnzZBI4YsAnSe8LuCoqTnbr27gvZKD/lMqwgU7/Pu2DSebKj3Bo2YLxPQcu5xAEEwEy1D0Y6wbujTG+9MFLoCP2LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687456; c=relaxed/simple;
	bh=EynXBYv7jm6IhGXsx+LGDH4y4B7iCFwW4RuCBSpWjto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ugKqg5QDz8F2E3p7fnkuSH6CAiarRf12X5Zt1QkmZoufQYex0ManmE467tBpAI9Mo9PDgv8foSIzSifttOkiWsdPb3N2JW9oH8Z2zy8TSo02gOsnwdJEuTKURncH0lELtHbniAId4j7HmwR3b1G2bNXpSENWqu6Ou51BGw9uN10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZyFn949J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKg28DBg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZyFn949J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKg28DBg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqgAZ350050
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MlDeI22alqDXecSnxJALXX6TE1LHhNM1IFhg2ie+kKg=; b=ZyFn949J8H2wK35J
	U0EQuF7iIxVy1nc5gCGsvfTfZILpNhX86czvaTMghi8RxaIJgyiJTK/+xhxzNdOv
	Y7xyEInQNDkPsMIwsvGvoxi6mziPTGY3LBGYwFfFAKzbC9OArIpWCqf27sV0LH2q
	WV5m1saUL8wcgpjwyW+tkrHK4n5+OUWFobP/WjhoIFvNT6Nsobx+oAoQ7EaoB+Xl
	wLHqRgUgdqW1BFYbtP/e0kRBllmV92ECR2Jn6Pcjqy/V8e0UfxBVsN9U8VKzo4FF
	kIKoZWFA/UblD3fwV+KGjWtYPE7+e8Wdudt2F6C+CSQoRrjs1LBsz6ec3fbEm8MZ
	Xx62ow==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkjxsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:52 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-836c9f68dcbso25437387b3.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687452; x=1791292252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlDeI22alqDXecSnxJALXX6TE1LHhNM1IFhg2ie+kKg=;
        b=OKg28DBgqLxnlHwlLCT+3jiEBuqA1eEe0vZFxiH9sddR05SdDoiQrpE9KxR3CbEYaY
         mzFCQBlQP5PoeeqKQJ1bxq+W+rLBuRYG0FLa6Y9WgP6PbE7o+/cCIY/5RZ1WSeBjerAB
         hRvtNyZ6iqb5wmlKU1QmLolfULvFUk/L6zlOz0d2K6ZebyMv+1tIZJXFuz8h6q3r82c/
         YziFMxR9H6CfVsIaybVCHJQt4RtSuCn3OSENxL1BqzG1FOlxTGJRno4gcn2t386J1qvW
         Rg4ZULaTfk3JljRhSkEoW0t6GFDB1tDjAOjBjZzNOFSPlFj0QZ/Yl3RbtctlgnNwmqwl
         G8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687452; x=1791292252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlDeI22alqDXecSnxJALXX6TE1LHhNM1IFhg2ie+kKg=;
        b=tOI0VsNuw+DbpV/i638Y3aePKtYCeEaw2vedxwZ+0xISAmX+XeeatFEt6HUAqBWRxc
         QdV8EbW3yB9AekVvoerVI1XO7yxKm215/KZAwQLUMb69cx1JHv76Kph6gWceuo2ZwNzx
         AjjsRTu3GOwJuuvqT39RsF9cejHaOKhxgGKvlioht47N1cJNXz83Ix0pISn4R5G3fUwg
         McPrtXb2ZstQ2VCpnAAg3xj7PPn7B8x66Yc6vbCJ0w4ZMwP+fzdWeshnPN7mrXgvE9Dx
         Xkq+kqfPOrOALr0SW8vcr7lRQBOhPApVDjAw/r6ExOuqJ0RKPEaUWw7dyj+LEdc3ugwU
         Q2Hw==
X-Forwarded-Encrypted: i=1; AKwUvByDjxDXolvXjZru6To00CixHKMYjioxz5EvE3wAadXKDmmaL8QD41akpkZscVUaTGSD20bNuWu5zAoB@vger.kernel.org
X-Gm-Message-State: AFq9FYL/pRJbLOhm4EZguF2xZ+c1WCylOK657kBitmAETIo4kJ8y0ocV
	t9cCOMz9HUsSp7I+oFcOJdzPSApTfWE+rTT2oSm3GH3yjqzc0xUIXuR3c2h9EGAHmQ8S9FduBOF
	YCT9EXz3BVqqjx7K2VUMCTOWeC70HpRRvX5kV5Mwk/5wqSk2WBc9xpyh8IQtUSj+N
X-Gm-Gg: AYBFou1hwCs8iFT+37++MWg6mVg8yaVxBHhuVQd06JyLZQTOEXf1LKnP4mMz9f6IMEC
	B+uXCCLslIgm2rLqiY4G3Y1J/LzD6pj9AFj7k4pBXY7rr82tMLs5RHgvXBaNR2kWHxiDOcS6fLx
	joERhO+SmNtijeuhTvSDk3O0oOp4xfpa0OS0wPuLWqN4nLAMX2nsUUrVmuXc8RA/h9Jz1nfgrar
	etdKvOBvz81oTuHjEFSYdejcCSBjsl/0C3tjaK6XIN+xh1Wbj5qIP3RMIhK8RlbRmQsIUJ6W5rw
	7psVoM/z+MovdXbdSwV5Jc/nVCZQdhRsqZXF0LT2W6sWTMpsgX6ukgZ1NPdabfLGtpHssgDOo6f
	dKhOw/120txUyknR1v0TjWW5uV22yO+gEpDU=
X-Received: by 2002:a05:690e:1247:b0:675:6bb2:cca2 with SMTP id 956f58d0204a3-6756bb2fb4cmr349388d50.104.1790687452248;
        Tue, 29 Sep 2026 06:10:52 -0700 (PDT)
X-Received: by 2002:a05:690e:1247:b0:675:6bb2:cca2 with SMTP id 956f58d0204a3-6756bb2fb4cmr349357d50.104.1790687451753;
        Tue, 29 Sep 2026 06:10:51 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:51 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:41 +0530
Subject: [PATCH v3 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-9-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
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
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1146;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=EynXBYv7jm6IhGXsx+LGDH4y4B7iCFwW4RuCBSpWjto=;
 b=dj34oe+T09Fa7ErZKy/lGsEr8Pll3n76AGjBp+zp9lrbHKJrNgnEKsUl6BLy7U32S6eVmW95I
 51TZNkbrw9gCGrIBYwEo65x/y6tbCT9Y3LnivZh1rOUiNPpW2yLXFjZ
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX2h7MV0qAO6f9
 fU3oQXfobWgtLyTjnL1LNHXpwZW6GbtqACJH4ghf8GhfVPuxD+wB4dDfXE55a9c3I+U7/kDWbkh
 DivMxZoZ9QH6peefcjHfqhJCCjOOKrqwfYRBtCK83Z6NeXFgx/VUHaX2PRObyw9xaEo/rniiGYe
 8804P2BabKAY+fTNhNYXQ7Uay8HFo3QfdyHx3cp5d0v2uFCX99MoGl4UR/xdsbn2BfdjgUg4xXG
 486V3BWvww8wxDpcii0YYZl0kwLuYqFjJUm8xj16qNCfXKlEkml+WUFuCXNRWbuH26ZYYT4/v7w
 QvGraGy0Q6XY7JVQN/M6BWnERTyHL1y0+P8Ou41ltSef4KTQEKsQ8AdPMKJzdXBvfgaEAlek9bN
 FHat+n0IKX9MzYAFBxd18X/7lB+/cUR6Sd3AZ0Tjre7BO6MWb+KzWhUBJIHB2EGtjLxzuwYbUcG
 OqI8qTH6YzNhqzkNZ4g==
X-Proofpoint-GUID: YJvVAk0xZ2Y08Vb455zY6uZFFxP9T-wb
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abbb8dc cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=C1EnqVrfhtXmwaaqmQIA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: YJvVAk0xZ2Y08Vb455zY6uZFFxP9T-wb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX4qm/3y4JtH+2
 osI8gIm+kNh7/PwEmRA1vKS93yz5c/5XAOpkyPD7xAFoxt5YuhrDNFIxnKAnu3ro5ZITROtSedu
 0h7jrMJUBj+yo0yImLjTbYdS7IUnBKY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0101.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmh0101.dtsi b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
index b1ec41325958..5635ed350f38 100644
--- a/arch/arm64/boot/dts/qcom/pmh0101.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
@@ -43,6 +43,17 @@ pmh0101_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmh0101-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmh0101_gpios: gpio@8800 {
 			compatible = "qcom,pmh0101-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

