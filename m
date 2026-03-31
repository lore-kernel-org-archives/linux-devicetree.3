Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8A436F42D
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 05:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934715; cv=none; b=TpIsGqk644iRDF3kXMlODGshbj29GebuuQayMt1DFLYdGIwPA9Uys4kRoHq4Bg9K5Io5qHKkh8z42P4c8USuFpnsf5WKJDWeV9YX1u3q4Imp6Yb7E2a5UsdzUY0I/yRr5wDtruGxkwY7AMR5d6PmvktuEuTRgHMKbqyoaapAK24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934715; c=relaxed/simple;
	bh=+w5mzvv3He+i3zAH/an1mHEkOtJQ77ziFKuCzPuEAq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1/6u3Sp7ZoGjGK63ucFkDqx3RZnDQ/c2K8p73u+6tSfIXP5LPOY1WLn+kTsdwFBUor8xvT+YxyR9UXg14jGitctkd4L0Zt6no5T3gQImFsucV9t/Nivs1qKFd/fd3HEpPVjI3K87ws4ZJ5rKwgneNTitWKbd4P8iv+uurJy8jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwdxJBCh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dnNQkcNs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MwdxJBCh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dnNQkcNs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UNuerh3176220
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 05:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FdQ6bxt+SrA9TlaETGf4z20l9PGfdTQWJEULqBhMqKk=; b=MwdxJBChgYHB4i9e
	oI4x8G5BXD3kFhNlidOvssB40pRwalMOVdjnsZKGj40LGaLThj9vyjS5mV9PLnQS
	v90hLZy9fMZyArUmUfj9TRQYxihDr6p6EfYJ6rI40FJZpitXNAuIUSZecqBx6zH8
	pWJlxzc2VmhzVYnEd/ddwXQpBi9UVG4S5GV4/yzEtQiloCO6W1PT27vJxJT3Q9WF
	6e59lmECE+7YDz9TdkIP2VWG9Hx3Q1I+8c1lttdgopa4dRU0+9wrWOsvNF8vnabx
	arSlwNWPo/beVwZ0Typ4kkFBLhrzkHmzIqunUzaMjVXW4kWEgnbmKpSNk2yneXh+
	QN5aRg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h3sfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 05:25:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630753cc38so11877089a12.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 22:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774934712; x=1775539512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdQ6bxt+SrA9TlaETGf4z20l9PGfdTQWJEULqBhMqKk=;
        b=dnNQkcNsje7dt47gXirRNJZGO1D2PlMuDo3pI2xtTRHj7urNh1So0BWu6LGeYnAOnW
         lYw8QLYxFCcGqFOOmac6uRRixo+2QJ9hQsLlqDCrHSUflcVTD2a4NdJ4mIBF4+DcZLT/
         7Cf6Bcxl0wN1b0kHpe0ephydSpp9hWE0C/bKJmK6oYVd2qgKbx9wfW0AyrV1xb0Hl4Vq
         yfemkyuWniod2cFLx49Q+bmWTmkoD7kFXIWQmyLNvmY0GNMdvbqC4TdAYPldnF73NDXK
         iTJslK7AHL9oGkA+1NR6cajaao6qTV72ptS+U1FYLOmiqgyddAxspnbvPTZUDcDJAalV
         06PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774934712; x=1775539512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FdQ6bxt+SrA9TlaETGf4z20l9PGfdTQWJEULqBhMqKk=;
        b=Bsc9lqWiaCBOcawKlGnfd1t4iwdhYEYU1auI9vYzpWAfXNuik7HHbVJoodT4sQVjJ2
         ysYwUSewROwMw7n4g5Sl2+7Ihqpd/EacDL+ZfFvWcRSUOfM5BAntGvg96g4wgzJQwkF1
         tSP8G3lTREGsJpX6tXIQkdWVmbyrXFHQsEGsJ35RbxD93ChYWc1KN2dd3sszLpxeNo4m
         qz6tZ3RQNvoBmV0a7FMGYVGOeE4/Y8i5PoOazgCqe004T/UD8TTL17QeSUgEKa6e8LPf
         ZxGYNbtZ5OGKQCBCfso9dB/AahTZ6T20qDUqQTj+2GHzRnp/RYza/YpEcK0yVyU0qnTM
         4Pdw==
X-Forwarded-Encrypted: i=1; AJvYcCWEQw8cnkWhtNyULnQPERyxfSAl5v1yjzfos0U8tY/aGeizQ0nKBvM6Jw2VjjS2oJnA7YyJFWyMPD6X@vger.kernel.org
X-Gm-Message-State: AOJu0YzhtQd5HXgnV5CIAEZZDVkt3hhT2uYqDJ+xw+ZVS1GNHw1WxTON
	vu7AuPWjQkQFggS4+8MQ1ts31pEWMlDh/8DJVk1yWV3vpahfPGUmpzWHivj8ajAKghg2tXlBc1+
	u4Wbhxy585Ys0Om8JrFFmt+lUQAKBjLn0S5dN4XW5XXGXONb0PvOFoEhAL7aj7nlP
X-Gm-Gg: ATEYQzwW4JeWulM0AFR+sdKT11H2/ufFmoWjoyY4yNij2929SMnRzi9w3nIiYPbPzRP
	nMHIyIPXIsqIEpdpTnRS2fCd7Kx1C3Ps5QOYbthw9j1Ru8LkPt6RJPrSlJHyDRBR6FdCPeJNsp0
	eACXes2ssbq8zxbr6N0zR0laWC2qXJypr5LI8961WidAh4ZHORsr8ggBr6sFuflgHhd0VRSkz7k
	DAh3R7oobtu4lfvBQmL8gOkeGyVkFkFc+Vo/FhmLeqTVhTvNWVjHXhu7sNvpyPOospMb5v3IczV
	uA2qz5QaFb+Nw8ju5wuI3lUZQbgJvsHQmYrGM14qAeWwONo8+yFtAeQicaTZKh0wJFNPQQxk4KU
	CpcC3b9M85rpwwFsoHzOKoWH4uyBoC0b9PPcl+mBku9LxZHsm81fT
X-Received: by 2002:a05:6a00:1797:b0:82c:6683:b866 with SMTP id d2e1a72fcca58-82c95af1132mr14276142b3a.4.1774934711603;
        Mon, 30 Mar 2026 22:25:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:1797:b0:82c:6683:b866 with SMTP id d2e1a72fcca58-82c95af1132mr14276116b3a.4.1774934711157;
        Mon, 30 Mar 2026 22:25:11 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843db09sm10270751b3a.7.2026.03.30.22.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:25:10 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:54:15 +0530
Subject: [PATCH v3 6/7] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-purwa-videocc-camcc-v3-6-6daca180a4b1@oss.qualcomm.com>
References: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
In-Reply-To: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0OCBTYWx0ZWRfX5VDVLbGTbZue
 BBzB1ixr2xFXBc1qBcAPu6sxevBzfDWV8GSQ1nkRaN1SOc0X7Dczd4W6leyWcx+PsF2mBURzgeA
 +Pk/Wr8LDNu7xNIYA17KBup2qlBnUii0B+gsE1Q1LRDWUC8IR2W3lp4/NPtkp+Wz/e2EP4dUu6P
 c0EtpXh8gPq3hK4lNXDe4bXHsYtduxv0X7b/uAnSpOFLErcYoyWf8zBNCd2HIyqFMgoeWrBzUku
 xHMyDZSjRtJDQ8Afezw6ZrD2E+Nl1S6IpYYmS6cC/jwCa0ms3Aew7lqI4XOOio/dadMVvEsjhVi
 uNpXysgA/8k/YIXBFpdl/tZGOORwuv8xTSr2jYqLupv0nLlDW8lCqYfbYGXUCxcIDIAx2n7sHvB
 qJgZpKEZ/6VSPxI1G8zyFNse/StHXTLIzNoQy/NrT6s4Njt8BnQ4F5TH3seh51tEMqbF9hMOx5q
 0LuSq+gq268XpxlhL1Q==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69cb5ab8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7hkWjQK7Xc3mONE6JcUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rhtArsF56vRVqfc9ZKlwRs938-Xb9WsE
X-Proofpoint-ORIG-GUID: rhtArsF56vRVqfc9ZKlwRs938-Xb9WsE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310048

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one. And update the compatible for camcc and
videocc nodes on Purwa to match with their respective Purwa (X1P42100)
specific drivers.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa.dtsi | 10 ++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee0764167338023c96342d895f2871a61c59..12d17ae6da6615876eb698cd7b677940eb1731c9 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5550,6 +5550,22 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 9ab4f26b35f298ad7c6c361b3e232edf07baf223..ea65b8448836ead83f837e973ed536e8ea0ed8ef 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -6,6 +6,8 @@
 /* X1P42100 is heavily based on hamoa, with some meaningful differences */
 #include "hamoa.dtsi"
 
+#include <dt-bindings/clock/qcom,x1p42100-videocc.h>
+
 /delete-node/ &bwmon_cluster0;
 /delete-node/ &cluster_pd2;
 /delete-node/ &cpu_map_cluster2;
@@ -36,10 +38,18 @@
 /delete-node/ &thermal_gpuss_6;
 /delete-node/ &thermal_gpuss_7;
 
+&camcc {
+	compatible = "qcom,x1p42100-camcc";
+};
+
 &gcc {
 	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
 };
 
+&videocc {
+	compatible = "qcom,x1p42100-videocc";
+};
+
 &gmu {
 	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
 };

-- 
2.34.1

