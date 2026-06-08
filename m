Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACA037F742
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924279; cv=none; b=mfbOnjEQbQdlzhHqJHUDPnQnEt+Y9KwVsdtcjFM9Ww+tklJyF3n1yf4TAmvzX2nUfW89upNwmqm6H2U23h2MGwJ/LuB6pXq1PGAXru4dLC88MZKJwzSHg2y4UpJYivlZGS4L38ebgHn89O32mb3HdzhdsAdzGDMciZnWiu17WAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924279; c=relaxed/simple;
	bh=jR6YhV5ep5pLBOPLg761UDA0PjAz0VbTKnHKpTcW+ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uVPlsu5oBYlqrtJsn8afZNolW0cTBEo5LqJhK/XVrKTomo4b+MBl9j7mTgfz5q8Ruaon8kB/gyNc8jpUggzQxOnI5zP49tyAfkcScWkY+URK1YHHHPqJd9ZGGqV76ovSUmOsv4M3z1OjKYlUrUN3msUU0Qz/mbjlSxmZs5Opxko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pLZoXsex; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=icF5Ea+C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pLZoXsex";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="icF5Ea+C"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658CmdY53593514
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 13:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I/wz/9NOwSAVpwWiAKx19eaHSA1euzCq6tjGAxoB9aw=; b=pLZoXsexosy80BEm
	FgbM5oPIX/uS9H+lZ7EBAX+DHYfslx0F4oNEamHsNNSnQi/DZ/yIhMdhObkNOUC1
	7leZVzg8A7gz9Z5Q+G/zmlBARu/2lgBDF2pOhxN4esEueiGfxEd4S4PdF3vCLMLG
	Z/ZUP6/leVGMhBG6tXIhZ/Xf0gsDq2SdANMaz0sgOuO2DdpNgLskdRKpiGOE7URM
	rbl3ijfu2Xm5/PPzu8I5f6zQZbtyoaL9PqNbI6eHrHSi71peLiE5twwWmXYLYo3R
	S8943QmMEglwMMfokAxyf3qEEIkeubSp048MrElXlW+ABqnI++NSqQUqpP9hCUEY
	ulUOIA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enx2rr3d3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 13:11:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf335549b8so67975785ad.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780924276; x=1781529076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/wz/9NOwSAVpwWiAKx19eaHSA1euzCq6tjGAxoB9aw=;
        b=icF5Ea+CJbknkKD/TxbLN8clgoAUT6AS4pVgaJmatnByCY73jXnfDqFC9+FUV2bo0E
         c5Dq6MRnrfQ3haZCObbJjfk1cJHyYjrDTd0AZaDupF6XnglKS0a5pbwq5hLsfJepAQIO
         QG7kc4Mx1XwThBRQUXh6JJ1+LKgxOKzfmOgsxfqAH0R2Y44E7lFThIXkoJd19/H7v7ON
         Byzkf8dUVUOxaucH1XnIgvlerLQ5srCtD+7hrF4pi9fUfYiutOeq+E2bNSG+1wylomV5
         3MBxFy8MoLc8ew4CDU9ZeHzyTD3FWoyCC4BkBCPUb2FGBBd5rMiI/Qj1vIsRHnMco7fM
         OMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924276; x=1781529076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I/wz/9NOwSAVpwWiAKx19eaHSA1euzCq6tjGAxoB9aw=;
        b=C7mTMqg2yESkO5dhDI4FHy1kxzP0A/owGtkI3Ct7qVxsIgVVYTywTCXczI7Nod1TKp
         aY0i8raHXYg7dq65IzbGzUI4PA+zAtqwMdT+U930QMr6J2H7NHi3ama4XvyjuOPwcl4P
         GE0CCdV+E04hbWjzZHtqOD8wS1lzZaPOy0tEEdkPig7udw4AQGQ97sA2gjKE3jlniola
         6uYHKy321R9KSPYQWTpPGuoixUzdk980v6R8lSPvCWDvT/rqCISYoEuBPgeADWVw0Xcc
         kJHOFbRAMrbujpgD3GV10q0+dHrppGxqYEeO7FmEP9UrowDYPhSzC1B6/mgEb6oJ/2ku
         97Cw==
X-Forwarded-Encrypted: i=1; AFNElJ+d0BNa2FTU3eX38hvdqk111qL6VXOaQYi6DIj1CNIxSfDMPYKK+Q5S2fYnYvjTDNkIfiAZO8LkQJts@vger.kernel.org
X-Gm-Message-State: AOJu0Yz27SCtOixXr9Tpcce05D+LJo45qC8jjUp6hwBkDtMhu7FcJuMP
	SexUamdtNskFpob5XcLwh8ZbyJW7cSib71MmI621yawJx6e79m4/BsGM+FWYHLhiGfvp5FnE7kz
	wWdvPdBShtoREj3lObH1O23Vy/U+rdxEQSczHvd3wImJgxXLarzuGoTV/jXn6Co/o
X-Gm-Gg: Acq92OG3wcZD9jXzpXihPs7rWiEoJ1fFQwNb68ZqoiB7sy4g8I9v2rzkjtXIgJeeoXv
	gioFY1U5iPFDHncwpHg/rLVbwMPgMqUdb+niR/SUHGTuJc/GNlN7tGenp95GDfBJCViQjl6xtQO
	Steu2y4MiqL+o2N0DhKli4+RncN2SM9XnynOwdupo5tO5F+7RoJj+arpzF6NduQPpUXYDMeh11a
	B8EVPKVvZl0e0Z7KcmWe2YrGnh/h0SbIS1H4ucKswNsg7S3EDBpQDb9n+CInkfv0KOc5ommA+nx
	WyvPrJu/bQ0nQUxwemVvf2RcyEPEZ3tDeQpxXhLsW6EExzZGKUEayOf42PzYOAf9Y5GD1zMiDmX
	LLoV5njKeIRJz4utgzAUryKyUP/wqAnoGL8GSt+TbAzFxh4U=
X-Received: by 2002:a17:902:ef0a:b0:2bf:2e28:db28 with SMTP id d9443c01a7336-2c1e8232ec8mr186342285ad.29.1780924276048;
        Mon, 08 Jun 2026 06:11:16 -0700 (PDT)
X-Received: by 2002:a17:902:ef0a:b0:2bf:2e28:db28 with SMTP id d9443c01a7336-2c1e8232ec8mr186341915ad.29.1780924275509;
        Mon, 08 Jun 2026 06:11:15 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad172sm185235845ad.83.2026.06.08.06.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:11:15 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 18:40:26 +0530
Subject: [PATCH v4 06/10] arm64: dts: qcom: shikra: Add SMP2P nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-dt-m1-v4-6-2114300594a6@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
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
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780924231; l=2278;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=D5gGyqtIwk2UK3htB2bHcmpge1N1N00jXDk8Ev0N0Bg=;
 b=+oKWdX7pL3lKgjEfn00fZFp2W79nd0TLZkO/Vp184qfUgWxSfRUypold2qgkn7c8W66zTtE6Z
 M6JTKXCI1biC2QVT05Y5C+W/uf91DMuFIR+LJElsoh/1uP9XymrqG/D
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: d_ZWmbY3x2D0pn3l5IlF12p__sC2TEpG
X-Proofpoint-ORIG-GUID: d_ZWmbY3x2D0pn3l5IlF12p__sC2TEpG
X-Authority-Analysis: v=2.4 cv=JdqMa0KV c=1 sm=1 tr=0 ts=6a26bf74 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=EkeGX7dVun7IgMBPpHMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNCBTYWx0ZWRfX/DhMQSn7SPC2
 AmiZLXwnCbEikXGj0orEfhbMwWGTvedEGuKPj0Ew1YGjnmi72Sj/M3HUHlZ95X6db3UBXM1Leua
 SBVVE376uG581LjVZ2ydunAJh5rjt+9CKPaeQ6HotrKxW8oHbDcEcSjKgxC3vuDaiCDF87UlLgp
 FiezXGEsi90tyBHWrl6GL9w/NymwkTK8oQ18R8yI5/6igm7M1qBID1HW6lHKujEjjo1KAiz1ezN
 EXGAwNP/XyRB4TvEMOxXNTj+/WRd4VOcvYj2q9jtjrW1N437MCwNK2sSTMis8YiGkst2irv8QDc
 NROsANVTKXMWxXknlCIxYIJKDUHKaNPZvmB68HFZXUSxMYBq1rg/7WzxDv01IUZtuNagXmOKtf4
 CDuQrctcLoHeiAVO3mgBXfGnvuYcS6tGNs+shQIGAPOjjUvNP0JucvLkeUL6NZMTga9h3crPD0l
 ++N7LpNR6Je0ZIInB6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080124

From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Add SMP2P nodes for the cdsp, modem and lmcu subsystems to enable
inter-processor signalling for remoteproc state management.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 309ebe515814..219c904fba29 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -413,6 +413,75 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+
+		interrupts = <GIC_SPI 263 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 6>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		cdsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		cdsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-lmcu {
+		compatible = "qcom,smp2p";
+		qcom,smem = <617>, <616>;
+
+		interrupts = <GIC_SPI 287 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 10>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <26>;
+
+		lmcu_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		lmcu_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-mpss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupts = <GIC_SPI 70 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 14>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		modem_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1

