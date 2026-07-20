Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFA23D091B
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535630; cv=none; b=WG5ITcIrpY7fP6p2xAeI0IVvlbQ6STk5deHsGjA60wJY6yj+bqiaHd+AO/s8ZfrQkS7ShCoJo6bifNFHqMG671ifAxiQKur4+W8T0FR2ZgQCuBhuiZZH6veRJS6EASz982pGHtZmlkWKz2Q5Dv+Ujsp1tlhxjH5mTGVjhRBAo8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535630; c=relaxed/simple;
	bh=aiv0AD/suh5Q8DfpHWahqVpLMyb+b7u4U+TQtpkkaaU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Afqx2cARo+g1gZPaf/O89PbGz4rRwoAfnKxTikYEOQQ1X89apTKKLlZmDigV2yuQ0pF+KDAyAvPnWsy+XMvg+qV4gmDNPAgLtatY5KnBQ1IVvZCQw/n8C9N+xCnRql1Zhl/vGPH853dOP5e2eORc3oa3feamdv6iATJa9hVAuzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIKteCJX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LyrFnLv4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIKteCJX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LyrFnLv4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K76xrP1896182
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AySNhEFQOTN
	/wXML7Im2LDtrkYAXvBDqSS652rSteso=; b=JIKteCJX8orE7wUxGG1lubywkxU
	FALVxjpDSMQVqIVSP9ni+w2B6tHuOHYHc/kCtGMBjdGA8LnIluT8WIZnkVmhSHZq
	pnk/PyPdcAlKRAiqbUUcKYjM8GaNBPnjtCzOCQENpd6FCwapIoy32gDfj9QRPXQO
	l0C51Wsj865NmqRz33R0kts1lPqUaiopCaTyy5zGD1pVBZ/Hc6m0rKSwLwJ9EWov
	oys9OPjkHFUSHVyVDQcKpK4WMBOG0gNeq+8NsJHQbg5RnYQvoPPrCFjwVqfR8dOI
	7H1kynKrkL2kDFV4z25X6KxSNUGgDgpw97n4jCMww3scxLQA16NwUALjwGg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0kr9b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:20:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dc0eee75dso2444539a91.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535624; x=1785140424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AySNhEFQOTN/wXML7Im2LDtrkYAXvBDqSS652rSteso=;
        b=LyrFnLv4EslrdWwHJ0mDX0x3etbVQPgwRRD00utL/eLe6OypPROCB+bPGm0geLSava
         IcEyhX8AR3cfhc9T25FN3zHvuZChVP4v6eMp5kbe9OHWHL8prXXbx8BnN4p7NEflUssI
         XWgkYS9h8lpT+aJ0z9B6soc5OuRFczfUU1CehQ/xi7hFu0NBZFIIn2xVT01Pnb2qMY/p
         LMe55fBOMr/FuYAiB1VhnQ2Kt2AywW/UwprphzfTS3XmAnDBSQaOKkqm6qvGYsuBYVVz
         EmmfTljZwsnuGPaWj+JXWSWY6iMj9jfMxwtTq/jX9/dDGvIbs7fv9SQBc9sPUsvomEDu
         pgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535624; x=1785140424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AySNhEFQOTN/wXML7Im2LDtrkYAXvBDqSS652rSteso=;
        b=DfQ0yIpkFNVXgA44uJKlVT5HcHJhPIdH5hwiadwl037fwwNa5vCWHBWtgyMwtk+HBe
         +opgM3D9kMr0l6fOtJgShndqfH7R28gOLN3/EzGXA67zH5DabhugdcJi8IOwitTyBf9P
         pW7aoECWQTnp8a+a/KmxjfNS+VKBRSvnl9TPlPXuK/qJ60YEckGWeaYSRa1hDQwfkh1e
         f/qeqr2mxL3oQNow4H1fpyfbAk0GyF61v19ydNqhx62/rTFgSnw1tHaYTn+Pnk301O1x
         EfoXaz3+4Rrze/vWWRisl0rjuMshhKp0vnGEWek8zILp5+QtGLmAeHo2HPJLe3L/cENH
         O+cQ==
X-Gm-Message-State: AOJu0Yw25tIotQTLR5XmL13Tp9IC6WRQb+ka5XvI5fOP+icL/SrIUbeT
	hmwMT43r+npdiNriJOFIXvEhFtkM014popE9weF+Zskaa1cqE3h5TkiChT68wFD3JYwTihvDyJx
	20o5+HHKpVOz0rY+ESHnpIG3OwYHWKGdf7g71Z70u3BZCtan7TBPvN9LY8uYe0Zv1
X-Gm-Gg: AfdE7clvncrzW56Nrve5F0rWrVP27VxPix11rXZi51AHw0nqQrEpZZJzXw94o5NKVB4
	Rs3dOAUx7jklxeWL8o2G7+xf3xa//B4Tb/DUZ7YjfO1ut8KAExQsSxaHdHubZC76mH725Bafe/M
	NjPu8r1ltI/PrEj8tAjHfV8W/xqqfP5cCIBfAbxVpGovezBrO8a4XnueqeiFLEGKBMhm/p+fN3m
	/AhIeC6kt+S3ls2iGB8760f+dNR8vTTMfEGBAw5kWBqKZKq2LoY1aYJMQ9GfKyG1a1VMrXekr7J
	tX5Kn6OmU4sAvora2Laititflwh3Xpg80fQeVMAwIGBnfKJm4y5osW++gqM8r0S67Locb1rUdRq
	E9kJXpOo3H4bbY6A5kpdyiZV+UY44Hn8=
X-Received: by 2002:a17:90b:264a:b0:37f:fc3a:382d with SMTP id 98e67ed59e1d1-38e4b6044fcmr10163012a91.6.1784535623923;
        Mon, 20 Jul 2026 01:20:23 -0700 (PDT)
X-Received: by 2002:a17:90b:264a:b0:37f:fc3a:382d with SMTP id 98e67ed59e1d1-38e4b6044fcmr10163000a91.6.1784535623504;
        Mon, 20 Jul 2026 01:20:23 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39e0531asm7233688a91.5.2026.07.20.01.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:20:23 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
Subject: [PATCH v2 4/4] arm64: dts: qcom: lemans: add RAS error source nodes
Date: Mon, 20 Jul 2026 13:49:54 +0530
Message-Id: <20260720081954.1858180-5-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Xo95yEoFXid7rLOr-CzofZxVJxZoF80y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MSBTYWx0ZWRfX2B++2PmGEK9X
 NPWy77IWWwi3rijenYOgVP99p++D63uEiqXfR8S7hmZ0hPUKzYJCywlm5UYd7ARHr4HRcm4kTn3
 XIvlItZPU3tSzkf/M/nRoaS2Tq9sPwc=
X-Authority-Analysis: v=2.4 cv=G58s1dk5 c=1 sm=1 tr=0 ts=6a5dda48 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=isxhWOj3iQD9eQR5az0A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MSBTYWx0ZWRfX11VCQ6LkM67+
 ltAOT1yTe4Ru2Y1OXw+FJ2HowAzQ7SEFymtnwQoPIrUnWWb45m7fjP6Lue0b2WCtj0kS3VMgOxb
 wP+pv3oYcmgT3oqMx1B0KQyG+8bBIhMGfWIxWXWxvsBq4DMZ85TS04/4TF0qe+ihkATNFhDoI2s
 jR/Wid1vqztJAd1jKt/hWD4H2/zCegdt2KnznAQxaXQOuo7FNUBTilz6/1Dd2lpguSxfqXdGuZM
 aSBbWXPcBp9e4p9m33jvpoMraP1uOGSYCjW+73TpvypwadblDYTk6mb2DhuTA++sbUAzGAchn32
 YVSUNw77a0ascRc5py7Wzza4WxUfQulJsOfatUne5Fk9RPULffmMuOiP6AEZmZLEN11KBivkRqr
 k1gML9TmBQNvV8l42buEt1f5F8ujMNt9oiw/oU6Cic3bo8L0Gj8rlAkCnFAtcdhb/imhOYvt5tU
 SKxo87p0qSoY04QCuZg==
X-Proofpoint-GUID: Xo95yEoFXid7rLOr-CzofZxVJxZoF80y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200091

Add RAS error source nodes for the Lemans SoC.

Two processor error sources are described: a per-PE node covering
the L1/L2 cache hierarchy using a PPI, and two shared L3 cache
nodes for the two CPU clusters using SPIs.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 3b0539e27b51..64d3370cba82 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -619,6 +619,36 @@ system_pd: power-domain-system {
 		};
 	};

+	ras-l1l2-0 {
+		compatible = "arm,ras-processor";
+		arm,num-records = <1>;
+		arm,record-impl = /bits/ 64 <0x1>;
+		arm,status-reporting = /bits/ 64 <0x1>;
+		cache = <&l2_0>;
+		interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "fhi";
+	};
+
+	ras-l3-cluster0 {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		cache = <&l3_0>;
+		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
+	ras-l3-cluster1 {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		cache = <&l3_1>;
+		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
--
2.34.1

