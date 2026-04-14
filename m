Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09A52D94AF
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776186549; cv=none; b=bk1foLrpF7qKEhT4zo+kLn5bNKg2HYS4wFcVRG+1Qkbca4AAd4pCFEGZqwTmxyEP0oT8WX1Yk5a+bcAcA7KhzrYuBI9ijgoujQizV/jhJ8MsxO8Ov4ohRsyPbPbX/q2jWvtRymU0UCIN3LZWvtDD1DLN2GMyfNzzgIqmrR2Snuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776186549; c=relaxed/simple;
	bh=IpvPgvKMIkkzzFuFPdE8c6VPCt08BcGP8tSrCPowhjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k4EXhpylD5PqwnVrlnDklmXEGhp/KgtY6inW7mB3HtKBIHGf1G472sPN9FS88Tb1BBql2/UGh7mgNGZiSXYZBdY3aISewzk/AQSsiEnp4iz9gt0s0K88fM6O0XPA6byUlRufJlgnXG97wFi63k46qSP2mDq3HHepeyPvw7NJZXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KfMsmIsy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3ytqozZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KfMsmIsy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3ytqozZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EGr6PP030017
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PD6XdSaO/3pyxUrUmVsiAAOynJN3mgln1X4YOSNbMwg=; b=KfMsmIsyVs3OTNx/
	/F3lgE92+o9mgKmKKzRmrpvknECcE8mQ0Wqd0t0PG6brCsEr7NQIbNg4rymHPQ88
	E7IY9S7lVPuh94tLSa1Jw6BgtQlKsAuwjUNHum1M+LrIElM8fUHsggBroFP6GbHq
	YpidaHK/qY0dIINsPD+rq8B1EzSgVqC+H4cBxPWje/ZEgRXOOwsax4c32bYeL++B
	iIy2XJ16vbY8xkKwjLZC6Li/bRtyps3BiAkjVDShWjkKvHE15jSrk8apOYXQT2V6
	EyPdawnZgrLQ9+dpJpqMrmL7DTi7SKdbOwBSqGW7p8krWQnoShXFt6s3Tjf63UNm
	xMb0aQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhkgmhhcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:09:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e06219cbso37846045ad.3
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776186546; x=1776791346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PD6XdSaO/3pyxUrUmVsiAAOynJN3mgln1X4YOSNbMwg=;
        b=P3ytqozZPbF+xdxj99E1vkdXJ95wOBgg83LFB0ClLRXiLc4Pa8SD/68AsuFLZdOk3V
         /DaHSFhsY54ndqqAyNORdmWW9FJRQ1DfvgNgX/ZaQHtuVgZF6EwFHQEaVsqImEi6SL9y
         qqglPR1viC99Z5pZct3T42SRr7+H0WG1trMkqApyEsyHL4Wjodu3oMULSFac48QGcGu3
         sOuaJ9AGS4Th9qIjKkVq5LrKmQBxeebfpFDHLbk/V56M71uRfdY9NodOQb0L5u6F/1KH
         HmX8YQjH82cLhrurG5vFPLc2ZitKl3xr3p5eFDlsq+bewzYOjyMAToydCxYyL38zMxpw
         zC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776186546; x=1776791346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PD6XdSaO/3pyxUrUmVsiAAOynJN3mgln1X4YOSNbMwg=;
        b=pN/oMyr3n/cNHOCQ32HGVZRRkAOYCwsWCzw+zwzIzahLhjlWLGxU2WZvJz/K2a+BM+
         lCwmi05fEsOGcZdSgIscVEV9lqkDQp9WliabCh4H9mNOT2EcDufI/dSm7XK+3Ma3rTcO
         KoR0/CVn33G/yhh2DI2S7+SAx+GRrZEkzSOEkfEttlD/1kCWWJh9TagdfNJtl1H/l+3X
         +ddsyepKx7HXFMlQKTGlz46qQTE8lxfu259ZSB3NBAMqNqvtJg/pjWD6LULzSnH1n5Ze
         mmI1YS65d25ACHTkG/lEjNdtaweD3BYxn4nvIEtobzXv/kCIqJ02grCfQnG+RHd99Q3I
         sqYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/J/l7N6off/1VOUN93aXULUqhSYBzI5HblvNF6LJjlXMhAMjtbKEVB1zo0u16jHVJKOCokiOcWJuOa@vger.kernel.org
X-Gm-Message-State: AOJu0YwYchZ+xlYzvU9T3A05VbnyCrKF1KwaQJ/21lMdmx9qUr/YD00a
	alu1bl+MvI3CrUpr46BpfFtVmTjNXdoU79QL/NzFt9Jc3WnyRcVvhLLBKaeiPHLR0Qoz2qdz74F
	1vjSKH4JkSyNHvNFRojnKZt24g2DZbBgoHecIEio5ROVPB4+aE693QyvGhmQLbrON
X-Gm-Gg: AeBDietsztj5JGSCf+pjXlwx6a83fEulNbpQy1V1T/WajAaqsDJG3LebkmRbpBr6dal
	OJ3Hfm4ke7XG0JEZhtoeTmRZbHMIIeFUe2VjlIVH5Hf0v3GqZh6EPoW9EtNwnRloIKxBwLjcU9l
	TshHPFVxeVD2HheYxBGV+0JQCqXpi8RtachGbZfg6reBcYOqo7nWkoXTfGwjZb9K0q0oPxwcwOL
	K6MI4yuSomMTAz3m/PGJO1LGNMa3BYTG8UfCyuvT/6Ock23DXgd6ypvAajrxo2STRKXAEs01c1A
	XFq8/6W1vlbdxpWzBX1i1PwZWptqpmQQoMEBBUIyYEwlLD2A47jDR7e0+Io3aReF++ipR1iOqk+
	O/La6jH/JlTVS4qIZQOTjq1EjQW2A6/UNdSY3JqHzAWbJUdZZo3tWe25oN0odB5yHsZJr
X-Received: by 2002:a17:903:32c4:b0:2b4:62b8:70a7 with SMTP id d9443c01a7336-2b462b87453mr76584005ad.10.1776186545718;
        Tue, 14 Apr 2026 10:09:05 -0700 (PDT)
X-Received: by 2002:a17:903:32c4:b0:2b4:62b8:70a7 with SMTP id d9443c01a7336-2b462b87453mr76583605ad.10.1776186545247;
        Tue, 14 Apr 2026 10:09:05 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45d1ab540sm97535225ad.40.2026.04.14.10.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:09:02 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 22:38:24 +0530
Subject: [PATCH v2 6/7] arm64: dts: qcom: kodiak: Add QSPI memory
 interconnect path
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-spi-nor-v2-6-bcca40de4b5f@oss.qualcomm.com>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
In-Reply-To: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776186510; l=1326;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=IpvPgvKMIkkzzFuFPdE8c6VPCt08BcGP8tSrCPowhjc=;
 b=Tf/WwFzZ9RHByip5fK+/QOX//b7aOa3kLk9RgsrNcnKM2n/VJ44h7b2fdiG/8/UwH8FX4mFiW
 rBGwEzL9+FeC+K0NyVsXC+SVImbvnGl6tEx8GETDbEZbEQ/eQjpNlKH
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2MCBTYWx0ZWRfXwaaBgQbZo8kJ
 EWQ6JUyiSowt8sw+WAjv5MqHf9ZN96DS/QKv3UzxljAD3Aa2iyS/qhOmvLhdZRZlDsBkP7TOB/u
 mSt7redWD68c1gXiJk8u2eSbpJz5Wf/jSroSzDgQoonBZY315Pj+pqxERcjC+F+69RHgKxAbLKW
 3mLqmLbTpFxCxdSDgAoADdBG+z+zf3prc9nTa3AjI0qyXjFRZqYPs9pG03kxmtUOwEyZvkxGpEE
 9fJw9gQg1ZfSW8yW0SVhtQaB248zDQuJSSQ8nydLdkSd26Fml+kNHt/MPUifrLFoK81GqP4/Qfo
 00s4Q/uKALaOvnGAsGKuFDuWsvIclBppyO4e9WF1BbP/WYKLdBJ6ssnny5TJZ+O86TdcazuBYE+
 S/wRsgvehcrJpgulKMXVsrRg2ZwzpqPComhADSDIvi7VLd36HQvwYxpRz2L9+ws1ubJitCsYhSM
 bgChDJah/nPTpKT631Q==
X-Proofpoint-ORIG-GUID: 9zS3pALeFK5JXzhUGzxMvz9OodNsvtW7
X-Proofpoint-GUID: 9zS3pALeFK5JXzhUGzxMvz9OodNsvtW7
X-Authority-Analysis: v=2.4 cv=HJLz0Itv c=1 sm=1 tr=0 ts=69de74b2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=DDoZI6XnaA0zmnrO1bYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140160

Add the missing QSPI-to-memory interconnect path alongside the existing
configuration path. Without it, the interconnect framework cannot vote for
the bandwidth required by QSPI DMA data transfers.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..105efb4b3aa4 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4312,9 +4312,12 @@ qspi: spi@88dc000 {
 			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 				 <&gcc GCC_QSPI_CORE_CLK>;
 			clock-names = "iface", "core";
-			interconnects = <&gem_noc MASTER_APPSS_PROC 0
-					&cnoc2 SLAVE_QSPI_0 0>;
-			interconnect-names = "qspi-config";
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc2 SLAVE_QSPI_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&aggre1_noc MASTER_QSPI_0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
 			power-domains = <&rpmhpd SC7280_CX>;
 			operating-points-v2 = <&qspi_opp_table>;
 			status = "disabled";

-- 
2.34.1

