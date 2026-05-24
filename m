Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89781314A79
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779650785; cv=none; b=bd8ahl20OPrM0r09wwtS8T16MrEts5zoKtqifJ+RxZSadOlQ54CK3IusNCgoqR1KAwKP9oJhWco//Os8weCWIf1qGkl8lTE3ZAXCVvdGUV+0FWcAXkBZyQ1oPxrGRyJ/vgbfzZu32h2cxs/zH4Rvgdjwgp/PNHnCU26Ws7kyznA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779650785; c=relaxed/simple;
	bh=/x7fhiqRUVFf6KsQ4pl3FTJpHo09DykPuFw1fEIj6wA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+Ab7Wl07QME3thGqOtu4xaHOdrlN93Pwtr/6burT+M3dNAHaom8eXQrWn+iy0vO/4lu6/iUatsUATuhDpOHXKTq2GOz/7je9sycJbRoUVtzBUfFkjhFIwxOB3jKYQqqvFBB9WPlUD43Cx7uKzK1FBbyhcA8Sh2CYOtZR8Pq2xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGYNI2A1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TfxD+KY9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGYNI2A1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TfxD+KY9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OGwGm32213194
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DMOlm7hNmzx6629XwqNAUJiu1R6QF7UImrBpTqYLhBg=; b=MGYNI2A186PM3f/i
	SiuXuk9wLr00ADqXwwfM01E5ZuvFtZnjJwt0V4v4ezjfoAMEn7qADTwbAVnQjp+N
	K19wQBw26/q7217xCZZqhuD9/SyPq8lC9KKYxKDC3jOIFK59gfdZwIpcpsJOqroF
	AnugYWU1pGi0GWD5J3dYABndPKdqdeTgKaylppCIC3J64u/1umXuTByT86hBQLBW
	TkYaMpatmtjl5vkpfNGbH1wQCDWaoZo9QnPcf2xpnPrM0NJpaJmaBFdiBk8hc7vs
	GEHp5knbhHnA1VTbB2E88Jgepd1iB32WayYKqfyFQ1uFM+B6g/kiSAg/y1AP70hz
	6kV41g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb50fursq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:26:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc7f9b2213so64603845ad.0
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779650783; x=1780255583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMOlm7hNmzx6629XwqNAUJiu1R6QF7UImrBpTqYLhBg=;
        b=TfxD+KY9p+VMlBCQ7eGdbTsI8o+Cmm7jYubK99DoHIZgFI8xDpdhu4Kn0wsqpsri5n
         JmHiu6FSLwCsJwaULML0jMsU/SBmVeJfdWibPugwExK+ed8NhRJL2tMxfLYPtTfDVMkx
         MvdWKVvgYhnWuqNBJ4ngSR5pKe5gZCy/LtVcnpKD4GV4Kx4gfB7XXYTWdLJ0h9PVXLi5
         yCCCpfkH2Nsl/hbqQZYYy15HbZRzyRnipREIrFKhALNvADn5EoFHmOLiAEv9fkwPaHiO
         mPuRs3vCMOWPtnrHdlhmSbuEmguScRKXFGb8+A2jkYT5I9rCcTlu+ytZkO1X6cjqBWVj
         EviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779650783; x=1780255583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DMOlm7hNmzx6629XwqNAUJiu1R6QF7UImrBpTqYLhBg=;
        b=OuXvf9eYhg2m4nq77gO+cnQKgflGCGHvPzmHEVSYW4Fh9qY1Ff0r9Tk1bNutaIxrY0
         jQ79kal3SRDgkFHQbaD8gWCzR0PCGuoTsxiMUHWYo1LBRhNF+f3eaPFPQm+ZO3VvUBY3
         J33SDqyy46BViDA4T6v9N4KJGmoEhM8cfer5WlIIIjCtkFR+wbljLNS6dbQaofzxTRS9
         6Ap6eN/l1yamSqwlI5HM34J3qWpyl5Sppog6ZLRI3sECTKDt6ygxtaDFRAtj/kH7Nx6r
         gbs2RyKPS8p0AlEkXI2wBvy+gtAda9G/V8a9PCSerS9cgdJhJOapie035zwOuw3/MxQ+
         JBgw==
X-Forwarded-Encrypted: i=1; AFNElJ/P5W+VfiH+P7LivSkFYmnhDUNVPY2Dt+fmHxtCxNbdfyPYqqK2lEPTw0ssh/ch37VRT/3neIaYnGfs@vger.kernel.org
X-Gm-Message-State: AOJu0YzeEN5NfKG0IxfkzJL9YBvFS0tff2W0rz4c6jRn0/tTYgcwEULN
	BTGcPLrbVlTU0V24oLEKi/+LF70J8i3MrSQfVyBgKlRJesbSgm/uSLYmweGXCsH+V6DWud32lvZ
	LZeVzbJwwfXT/1G9K2iD4pDqelDC3FA3HdvgXw6SLhBtAxEdQpwTY0i3PsVpWHa6u
X-Gm-Gg: Acq92OGb7yORUbjQ+18LwN+mMbmf2qXZwJabJw1VYr0HhhBCNinnnpFpI59jcsAQ9Cj
	XlFY0sQOEMU9chS9ZDomSdLqBDIMnZSSfRF5SHQFDyJ0w0o4H0g3ryzsM0jV/0kmwZfmdLc4clF
	9wQa96+h6LoREDHbMqj8p6vpe45MvzHLWWgiS41vRbDdUD5WoNZisbIm5FXLMR/uYkYUpK9aO0Z
	7b1WXYHBJzWVDm75mHqz/AqLE3oyJNUGiniZQQbXhV6hWXiV/5bH5WHxUjm3kx8Y2X+BGE/H3Ds
	BJstOkd8FSjqfu5CYDfSdk/BYE59UHz8UyG3skamY8D3n7Gf1+LBioi38jklwDBEegX+fPn+i39
	RNw9aghF7hBw8mlOwaYMH6on9+HD3NDc/CU0hVu/scsSHPGH6y4FAyP3VllTIRpF5ui6NlA==
X-Received: by 2002:a17:903:1b70:b0:2bc:cf06:6835 with SMTP id d9443c01a7336-2beb0346047mr123255485ad.8.1779650783068;
        Sun, 24 May 2026 12:26:23 -0700 (PDT)
X-Received: by 2002:a17:903:1b70:b0:2bc:cf06:6835 with SMTP id d9443c01a7336-2beb0346047mr123255045ad.8.1779650782559;
        Sun, 24 May 2026 12:26:22 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ce2cdsm75329945ad.29.2026.05.24.12.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:26:22 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 25 May 2026 00:55:51 +0530
Subject: [PATCH v9 4/5] arm64: dts: qcom: kodiak: Add OPP-table for ICE UFS
 and ICE eMMC nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-enable-ice-clock-scaling-v9-4-c84613e9ce47@oss.qualcomm.com>
References: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
In-Reply-To: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5NCBTYWx0ZWRfX8LDxwgDlfSbR
 /oDfU6YurZj9LFKZOccM83vnHhj6F+ubVbk3podS6gSoF4f/d69GXL+Z9X+xG2bsy104n2aTO5J
 HZVIBG/lGFJsGNYDuFqIgh1Kxy4ZzgWfULqlT/uwI4f8BOt9393tH6Fax6RF4MEksdo/GjZCZe0
 FQ+0L/RZrwhld+0XqqJT6auBCO9vama+H0PbiBcSMXjraJOOO82jp7IxNAvkKhHOyKpOdko0+AN
 tISDoY/Rx55Jwsg+fxV7kIY3CRKbQHVtBKA98un6c+9gvMt6JhgCCpESNhvOK2mhTF+DlEbdYFE
 iMiYQ8fDiL7IUJ3yz3yPUp+PGVwtNi5s7r/c6nmppk/oBudIgLrNSYGUiWSklrLZguoqkOaNl4b
 KP/9ALSobxua/R+LEDjVWnkPhutTUkXcsqpsloN4mhO3SU6xxA3Qsrm9RVQf89OuLBk9o/43t9r
 2kPrRdRbvmE+IV2nXTA==
X-Proofpoint-ORIG-GUID: WbteDMCb8sESLWFwpP5cFx6paxt3gexj
X-Authority-Analysis: v=2.4 cv=UdBhjqSN c=1 sm=1 tr=0 ts=6a1350df cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IFdraIdqUsMg42QbtkkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: WbteDMCb8sESLWFwpP5cFx6paxt3gexj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240194

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE eMMC device nodes for Kodiak
platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index a8260f695058525e77653fd8005fd3d250715a91..8a8328c5dfa88b69594fca926f4f7c1825416259 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1087,6 +1087,27 @@ sdhc_ice: crypto@7c8000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmhpd SC7280_CX>;
+
+			operating-points-v2 = <&ice_mmc_opp_table>;
+
+			ice_mmc_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
 		};
 
 		gpi_dma0: dma-controller@900000 {
@@ -2597,6 +2618,27 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1

