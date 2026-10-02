Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5014481FB9
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 13:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946222; cv=none; b=h6yX7h9Q44fjsxLmDoKvN98Yy0psfCZxGklfkWbeDGKd7H/cCfzDo87txxpcX05a+6CUjeAd0qYGvEIZqPabIJ5VM2REa3RaT2eIEkgRF3yr1QC3J9TGKzbbE9IwOSd6KCb/hU7KHaHQr7KXV9kd9Mf5/xsLxjEVwOTEg3UUO94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946222; c=relaxed/simple;
	bh=GdZV1LuiuON7wDYiD4V7gQ5eXzvmuO/PlhMtlKThPH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SfJz5i6YwDn+ihuFuqKWWY5n6QOQkbT4j3lANC4iqKnkRTiwlNxsapno541njXbjDz104/MLUSgtgSMLv5M+Jdtlri2uQGylNouGd4zaAxZ19xcYd/3a4a3k9ujeyWQQZfXKIUiE8FG65Dy+3zFeYhxCPsgW9n6skRi3DTbO15E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMr3a9R2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LNBWZq+L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMr3a9R2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LNBWZq+L"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929naVI3935139
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 13:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Obxc3C1Z/hYxlx7zqZoAvkxQarjrDFjcRi8kNm2R3LU=; b=PMr3a9R2/jC0I8Ne
	RkA4UERnEleF+snIjoIJu/Yfd/Cr2KRoiIFCWWDtNgo3tpk3rdWY+yrlZ8XfDin0
	bm+aT1vhRvTeFi635/ZGVa7LIWFcznYFj/0GX6iENVgi7t65kaptsksx2YqTy+q3
	M86mQ/FLBYco1OZISP6wS13MGW+vKA83WUqsqmNVKSZ+vBel15mpp7llqds5P5/o
	r9emLq+arSbX/SwKXRsqziK1d6oklAGElILTpBBYvGEFu8alhbLbh/kQMSZs/D/J
	3t8sXaY5JICo4whxpHAfsGbKgQ6uOOyqcFXvPDhARiBNzTO/ZL17SZRcZ64ipm1V
	1bwFYw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxeb55q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 13:03:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34bbf2e3c5cso8730980eec.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790946211; x=1791551011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Obxc3C1Z/hYxlx7zqZoAvkxQarjrDFjcRi8kNm2R3LU=;
        b=LNBWZq+La+oKvmwm16yzwsLHrYLkZxpxFmnWSLrRWFduQg8Nsmu27WyqNWNvBjkpX+
         r0Gtd/hSPpwe7ePbQ9mPcTOqp4uh5CwPrdUv6vOsoNTR0IWHfJ2TJm4wUW+cbP8DXX07
         K24WRFvNJqv4R8fjvaHQex9fo5YJk3pIkGh5b97NALOUhv6Eq/oCjx8lFkd1IrDl+2ts
         WggYLJtXOoLNcn++caHHvHFP2wFXi2vX4MDGJpQjNKXgyj8JQeqeJFOMv2Z+twjcBk+e
         QtPIaQpj89nk9bTGFXa3kyzp7eEYswqFqpkbTGLsnaI678JIOE5sJl+w/IggjZlSFiwD
         bghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946211; x=1791551011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Obxc3C1Z/hYxlx7zqZoAvkxQarjrDFjcRi8kNm2R3LU=;
        b=rAlgDogM6y+biu9JWC98ojwieb+QWBfqGVmz3+lwxeywUDwmx0+mGdYC61Jmsjixs9
         PLW7SQBY2hqZuydgZAA315d4XTUs0WhEOYCOze7fnIBqOzzhUKnxgiLhM3kFGM/H8VvU
         iAuRe04WXHhx0lATlV+BaxxbnkMAZknNlgrEOKhVPUkCijw7jlT/FM+6+pdFlc70KMgD
         RDFp1I6bhqFThOMY4ULz+K68xEiu4N30ud58MpgLu45vax7SVa25MX5kxYJ5hm+ZUu/L
         4M6mulA9Byq9KVRgvjtwp/ArSNOfl8DSQeqhGZrGyWOBEBCVxq1XySO4XaOCOv8rqQJ3
         81/Q==
X-Gm-Message-State: AFq9FYJ1K1JuGfh3ozZhuoz4fOBq0EeJizZ9/Y225+cF+9NwLZjju8IQ
	xdotBHb1xVev7Xq3BSadgqYE72FacY1iPOvlLvayrYpGp5/gPqrSG7aZ+9v1ewo9/iQeIBaUCDP
	gJYjkvzBZWZvJ2l+Qfn0KRPOHnl1y39kfiTQe8OqTr5/MhSvCY1X0TDrsU6ZKRpA8
X-Gm-Gg: AYBFou12i3ouew38iYKmTPJjVgE7UyHZBblhOap9PjnlFihyEAg3kw1khUF5mkewAFY
	n2+s8jOUXH+fLCRpD8CMBEl/fBSndNj0j/y8CN4E6pLewiM15EXD6tYkWrKIbhXN+FK3+TOH0eJ
	J9dkgNGNaEW7xZ66d+fWcPA6eoVbUeIREHFdxchQ1O1HOP/kR77Ti6OqBVvNDz0DZLWTuQzgZs8
	XijQ2/VJDIKgSZnJEGE2/PIUGV4Y5u71brYCvZ/k79TQ9bc1ca5mufhbSizqGdF7VQIbzL48EBV
	DTrS7CggENEfo6wMhc4eEyEWM6/6WAY+n/UcNAlyM/JHrXLTbYrdKTjnEjOmPsX8JrH9w2yTI7m
	YHohIWlIzoSKBOzMGwrHua6/PWQDIck0IfepKukAjtGprW8e/oLCtHD7A+kMDb95dUJ04PsrOGh
	I1BHnzpXPR75dj8e2YBDlaS97hniXFipEFkA==
X-Received: by 2002:a05:7301:3f0a:b0:34e:9147:b862 with SMTP id 5a478bee46e88-34f21994f0emr4212183eec.34.1790946211156;
        Fri, 02 Oct 2026 06:03:31 -0700 (PDT)
X-Received: by 2002:a05:7301:3f0a:b0:34e:9147:b862 with SMTP id 5a478bee46e88-34f21994f0emr4212140eec.34.1790946210483;
        Fri, 02 Oct 2026 06:03:30 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm4217543eec.6.2026.10.02.06.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:03:29 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 18:33:06 +0530
Subject: [PATCH v2 5/5] arm64: dts: qcom: ipq5332: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-imem_restart_reason-v2-5-61703c6362e3@oss.qualcomm.com>
References: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
In-Reply-To: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abfaba3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: dvxJyq8w1vblniOgJMTA8Ldq6OFm_05v
X-Proofpoint-ORIG-GUID: dvxJyq8w1vblniOgJMTA8Ldq6OFm_05v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX/M8e4lj1a0rv
 X5GCiAhTnH4mnE8KKUUlyCbMZS75avBmweM2NUwSQbTMpOkgC+9718R45qpHw4y9GGlth/bzl2s
 ymsPhWtzbz6Nl7I+opUa8KycM4WSMXNXd2vAUK88Ulp4V8GPj7sFHSvFcFtlatl5CFnyj/5SwGN
 LqCV0yI9cOCfuGybVKULPohfjDX/gaXr4uxO4gHnYYszETVv+qgVtMyw2EOV7J6VLo1Uz68hIjZ
 0SxB9PtmoKIq7vkeaxDBgwUvLEQWAlGJoALGchRfUSHoKyXCKvcBaC9Qj0s/sBLiKMcwUiEw+EW
 C5ezGo0I4tRscgmBRNU/z4dUSBozTth2wJaKmEYPjeCa3lkGFLC3SkOylw53pR8yWVQMzsuLvc1
 2FheAyJdAccp0FzgehmezlD2nySiHyTFBKb+i0z3Bojk0MMVpsiK1lHOspUp3hzbfsbTRTiBYVn
 rdJOQ6KI9t1ao1zvacQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX73C8EAjvWjQE
 bnsf1EYvo9nMTFGJai3Y4zmsDzHKk/PNTzIdFvZz7NBKvhAlc8bEcicjHqWdD3CY0CMKASm9qYr
 b4567KzcLHa4BwpaU3KYW/4tRrBh8Tc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020051

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 3e10f45e182e..c1b083624696 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -496,8 +496,16 @@ qpic_nand: spi@79b0000 {
 		sram@8600000 {
 			compatible = "qcom,ipq5332-imem", "mmio-sram";
 			reg = <0x08600000 0x14000>;
+			ranges = <0 0x08600000 0x14000>;
 
 			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7a4 {
+				reg = <0x7a4 0x4>;
+			};
 		};
 
 		usb: usb@8af8800 {
@@ -585,6 +593,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1

