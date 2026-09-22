Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931AF5326A0
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072186; cv=none; b=pfX+93OqHu0b4kumgZq/iAWVHEhBXbF9mrfuBw2XV97MOPmJEaBPlqptXnfCin7t2TVA+Hdgyv0io35hLW3uPaiN0QGH3wD8Ct7TUL1XiQOc7AfkYLTfQG3iqAHEqqh9GmEQl/rzJuAk8fk/uh4aZFv+o2L6W0tlcX7HR8fNbHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072186; c=relaxed/simple;
	bh=Zew9DiXYlMGO7HlKp34cAJvD9oAnKwFFouDwY6ExCmc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HZB9YlywFW0TopWjgnop5rV4jYM2/8q2o74byv6uDpw81Ghn+w0mlQAGZ/CHKI9ooE3QWiQufrg2RwrBQDFTDhzN5Tyi1xNei3oCxoEx70nInxYOh1ajsy9qtjcabmcjg3QWWO+Hi2waIwussOmxvPUu8yGAwCUw9TIsLwJ2DqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LTsnY6Ln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikMbzTQb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LTsnY6Ln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikMbzTQb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M6ntOR1978705
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=halr08AGvM3e7+vdJKHgPMGEd8gTfjGSRjK
	ghooAsEw=; b=LTsnY6LnOyo4DLUfSMZ+678xnHJf03VFaWmvyU8KjhDxzvmrvbs
	28ZEHHwt9uJC9csT2dmXmheaa+I0MLPSiWUAgIfdgHsTwQufnvACPrH4NZDPcIq+
	r8owxhqA+79N9LzI1ip2vE5y7g1MhpdTWAFf18K8nQ3Qv7TKIoZrgnhvPE/OwVxr
	rkZZH+UDy4YUxGy+iKmB4YAZo19RYNU/HWVsWXnZS3SxxDVCdgJiutQ5P0jqoXGB
	/VkRY63H685d3QPBRq8VTofTJt/UZag1hTlY4nztmrU/kgBbQ7IzRU7pUxX+W4xJ
	kV9OJqZTLrL5cbqTnivJMts2HFByYUxg5tw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0jb65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:16:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso4632930a91.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790072170; x=1790676970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=halr08AGvM3e7+vdJKHgPMGEd8gTfjGSRjKghooAsEw=;
        b=ikMbzTQbvvAN57uz2pSAi3bYp8ADIy+oVKZuaMUwe7NoivWXnkFtPrf0AtAlCTmjzC
         C6TotDm6b4Tknu7RBd4TMpzW66Rzqj28qR+i8QWO6QswM/oQls55szcmjI+pC5u1JeRa
         5Cs5jGVWO5Qnt2RcqOt0GV38yVGuaTz+lYQBU47xVFeuc6L+AHHpaqQHyotRxRxquM2N
         ZFYsTjV4S/XBSHPNfwaA2ruQQ0+NGegFm07g9hhKo3fSfF/cekI5i+HMT5e9VijVMzYE
         sOLmLNxhYUQ8VwsjC03AxTImsLP1dhUyvJdNPZUqDSB6rz/mnTROiWZ/GOpJhknuK9b+
         vgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072170; x=1790676970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=halr08AGvM3e7+vdJKHgPMGEd8gTfjGSRjKghooAsEw=;
        b=TuCB6Lomb7sCGqrwRc2xtks+bdBs0ovMsL/kgqtFK28i6SNsm2a0Ikqmqvw04Q0Jak
         eKos/duO78OvStk27rc2gqSpYjc4vwIR9m2JAD5Az0lVj7QYU7Efv1u+GQgixiDW7ciD
         Re71gPW8x0qzUj8IutFD2xWYspEvmljbacaVIQT8qvgRKwp4fX8IyKqcpZ7L32583yU4
         Vv75YHcRd+oWReg+wPnv263393DAz79Rx2E2nMNL2Hubu6pblFamUbZiGey6H6eBf+L2
         MhLmJgZ9GJ2cMxDRiacIrh9Pvwkv6QEAWulupfZSCZbWeLt8QuxcCJluX6bD9RSU4t6a
         S2kg==
X-Forwarded-Encrypted: i=1; AKwUvBwBOnVeRRLC5kFOz9vgEs1MaHUYTvVZnaXXds1W07bV86sU6rMpdNdqeWgdPAYH1o/G3hcUFDyVRj53@vger.kernel.org
X-Gm-Message-State: AFuF++nQ8eI7549+dg48fQLLJAevP1nich1Urs1txwb0la5CTmW5QqPX
	Anx7tTXL1m/uvz+r0w09YjqmzH4cavmb+y1EEQs+VK9hCpz+OPIzhuuNYeysYvvIZPQ8deItVpf
	ei9erzc/eMi3pzMmvgfyu8ZhEMIILTRIHk8t2U/bFapINBeooG+GVZ3HhQjvF+Ikj
X-Gm-Gg: AYBFou10JabvxiKVfXfBOrU8n+QaqZeYfocmMdG4cUuipue3R6QDOPzrgdSrHJfZS4o
	YeR5tCK0mpTHcux7nce+JwZ8IiFuwd1/SSB3BpXaqQVEL0DsBUkw04dV3XutPj+g3vh52WNNhT0
	PcJgyPR1qAWXHjhx320PqSJ3gOCxVMGcRtZSOXvaW/ue1vx8lbrY8UFXYv1mbnKvgE1lwa3c2Nx
	+ZEikWmDRshXqoOR6WYkmcDrLwDr2R6hKctAtwDJ0WaeCe4udShlCr2Cl0BBN+PFil27J+YqfeT
	9mEL+XQErG20DjzS01GQTpgoGg6vKApbkbdgk3DzgaCBCoHkPJrtmWZ9t2H2eLyv6lfOe03X/zc
	yhBANNL74wO7XWE3xXCCok8YB16hITXhpv8w=
X-Received: by 2002:a17:90b:4d88:b0:39d:fcbe:fdcf with SMTP id 98e67ed59e1d1-3a073098737mr780544a91.1.1790072169939;
        Tue, 22 Sep 2026 03:16:09 -0700 (PDT)
X-Received: by 2002:a17:90b:4d88:b0:39d:fcbe:fdcf with SMTP id 98e67ed59e1d1-3a073098737mr780510a91.1.1790072169331;
        Tue, 22 Sep 2026 03:16:09 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f294e4acsm4141064c88.1.2026.09.22.03.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:16:08 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: qcom: glymur-crd: Enable DMIC4 and DMIC5 on CRD
Date: Tue, 22 Sep 2026 15:45:50 +0530
Message-Id: <20260922101550.2216689-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: z4zs80QTs9kdyK4ycjHhgNKDW32tmmef
X-Proofpoint-GUID: z4zs80QTs9kdyK4ycjHhgNKDW32tmmef
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0NyBTYWx0ZWRfX1C8bpW3689JR
 /Zy4yUy6G5+vKVNXxk5JUizv/d1ciOFZLbcXj+xIPmlMmZQ3Q8sh9CDdeRhvpkQ7YU4csUa6PPf
 9kvmNw/27MwkQfe1I9e0eeTK4bbgqCIeKwB4dPPydFClMLO8fUtsPiAWCvPYqMYC+LI3rp8bVo/
 v69JXOjvFyaR0R5WyAgj9j9um8hyCBauFxWaFJeB2u05kQi11QfOM463KZg3U9Aoj2tR8KjgRco
 LCgrn+QYVBR91V1ZZdDFEB6Gyk06a0k0aCKexufITTeCYsdhkNZ8oSXA1bIqDJF0jPBMjnjPdp/
 ga1oWAqnZZkLFeZ3TFye6rEGHeT4wVEM4wPuOHVnVdY2RBs5BCcRY+xiBky4fT0E7eP51xOMpLl
 PgZf4GRwb9FN3V3U47y1GyQd/HdVKuFAUnwiCy2Mwbmo47YT7RdZmDwufefiHtqLRTfOg0hvXQQ
 Hr07ihytGdwEsY/GZLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0NyBTYWx0ZWRfXx2hlCX/fLGXU
 HmmX4JdTOCPqJowba6juJU4D2QCPmBsrXafc6HbA+290AG4rJBJQcZVYwwnaq+9DtYRZFx9ObKf
 nR++NMoAlsUk2mIcTVg3G8IDujGiBO8=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab2556f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=x1nICoucR8wNQKwiGQYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220147

Add the LPASS LPI pinctrl state for the third DMIC clock line, which
drives DMIC4 and DMIC5.

CRD has additional digital microphones connected to this clock line, so
reference the new pinctrl state from the VA macro and route the
microphone bias supply to DMIC4 and DMIC5 to make them usable.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  6 ++++--
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 16 ++++++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index ccdc322157e0..02e342ecfe4a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -247,7 +247,9 @@ sound {
 				"VA DMIC0", "vdd-micb",
 				"VA DMIC1", "vdd-micb",
 				"VA DMIC2", "vdd-micb",
-				"VA DMIC3", "vdd-micb";
+				"VA DMIC3", "vdd-micb",
+				"VA DMIC4", "vdd-micb",
+				"VA DMIC5", "vdd-micb";
 
 		wsa-dai-link {
 			link-name = "WSA Playback";
@@ -695,7 +697,7 @@ touchscreen@38 {
 };
 
 &lpass_vamacro {
-	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&dmic45_default>;
 	pinctrl-names = "default";
 	qcom,dmic-sample-rate = <4800000>;
 	vdd-micb-supply = <&vreg_l1b_e0_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index de7c395d9c35..c941b473ce25 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4768,6 +4768,22 @@ data-pins {
 				};
 			};
 
+			dmic45_default: dmic45-default-state {
+				clk-pins {
+					pins = "gpio17";
+					function = "dmic4_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio18";
+					function = "dmic4_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
 			wsa_swr_active: wsa-swr-active-state {
 				clk-pins {
 					pins = "gpio10";
-- 
2.34.1

