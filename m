Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B7F3B14A7
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 19:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787514504; cv=none; b=ClvDoWlEGy5M6KnGa5chQg/h16RGjKh1vdnPZEHnlSb83jz3iG5wfVjOF5K2mSz1R/QKBZzDbkaOVuMEMrDqquhJRP5NCI3y+Qk+1zR45z8GrBdAVlkyBC4QWDUDg/Uug4V+ALEoxXRliZfUHUo79z9GoR5YN1zl9zuAYMW5Pj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787514504; c=relaxed/simple;
	bh=x1iqRk3HVUS/CcF/hXLoxPVnQK7ivi+5ZVRHnCUMofI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BWWBJ3C0GZmQYHYADmSWZ5N/F9vULKm0EFIHEdRGhquXVG3XhEUBaRyLifovEuLcv+7KmRAqBNLvDdOoJRiyX3NjlU2DNUB7+m5TfYxZ9CaG8zowV1NmzmvohZDMMZ27+JPW2wPQv3bg7qbzZvsary8JLL03hH2441tcWuvzd6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p3dMq+Vq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jy8kf8Dx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p3dMq+Vq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jy8kf8Dx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67NG8BF8396093
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 19:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	faESQJSsZSzMQIUWsvbnCDla02Ciwf6cJxe2npadCW4=; b=p3dMq+VqfawZR3Wm
	EEeGohZrhHqV2cTLY51Auq6UB4CAaciPKw6RjxmlC3v0BimY0TwyxCkf3gqJwq+w
	QNUfs0ojv0ok7OB2Wz23LUm8hPsneyoFm/sBQrs/FoUgYFo0X+Yrr8DhGpXBKp8B
	sWyYJwWuEE42Psb0tGhalwZNOFEubgrs1nWuMmF5rrAXaG+KUpYwJdN4KSe3tKU6
	4ltzIWHE1e8mjXuY/CcuoS0ev6D5nLrpIL2WHEvJQwIUNvZy/54EQsfqNnDwrgfe
	wskZ5jJHEyhYOMFGUf5S9IdKKiHw9o/sZMZgQ5QslBoZrACsCLwYlE6tyYP3c3/D
	5DbsVw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7439c8u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 19:48:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso14388435ad.2
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 12:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787514496; x=1788119296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=faESQJSsZSzMQIUWsvbnCDla02Ciwf6cJxe2npadCW4=;
        b=Jy8kf8DxrKoy1M+Ho5aI4CcTKR86CUhddV+0euRG0Ec8rx318ROFEsoCeIldnhE6vi
         jEH/5krQmd/5scBSQvLTwjpZu9vnP3IF/I44g0vYd7AOlfjswUsVaXYlAU6WA6hncB4b
         SbdLSTcTrCfwwTZA429/6/VaFs2VrQxktkxksOQXVaKoJM+5XQHwP5496OMwjkHuTKbJ
         1/OzUIV2g9REB1XpVa3+2pP5coIvMDRfJlnlaBD3pjZ4fXMJbTDcdwoxXiqNHxPSqhAo
         hwwwa6dv5UvF7iUpZnTAJlVuY+Mr/hRwlrYh4c8VOWTcGimfNd9jnOU/ABhGuhD2lfzN
         U8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787514496; x=1788119296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faESQJSsZSzMQIUWsvbnCDla02Ciwf6cJxe2npadCW4=;
        b=QmlrCpT2+81S3JfT06R8PFfo7bQgumIYX6FJj6TMUJl72mG9y0vg98leLelAipN7pK
         zK4iMggjQjOOBn5yI1xFZ6tmNjOYKzJ5MsLLqJTF7TRqRzInpfIN1SBoBx2ZMuSsoE+Q
         hmcg5A1ms8Hs66tJdMUA8fbJfReekgnX012UKxt2Tgi3E5cLOb21lyGVdPeDOV36KhrB
         XmFSb/15xzSBYESf6Gs/REANgDVPlich66Lk08lbvUI2Yvd1l2OWlNJYpJkUG2ivESxk
         LA+UYsGVvia+scfAJGdtAMICOHNeTXsH6UAEegsF/wgOYB2A/ud83U6zZuCTzlIZ52rE
         jusw==
X-Forwarded-Encrypted: i=1; AHgh+RpNp84Bpe0+ovYkrzcyzArBHhICgMLA7XNzKoJbBZJLAzXUhFMqLqj3ynL72jdIXDEdH7wKPNq0uNlL@vger.kernel.org
X-Gm-Message-State: AFuF++mfmLwATkYdjp/wg9ya0ESet/IgHeWt9QBpd9zH1JUeHx5hAQlN
	mxtbmw51FE9V27hQ2NaJwRPueQKXpV2l2L8gkuJ6MEwZ1eMYUtRVnSrsTfTruoDDlvh5g61BWVW
	PALBplVgf90GL4nLhNARziUhKusE+wHVznqW/FB7vehtLW5V2uq6PcChv2jpW0eNW
X-Gm-Gg: AR+sD11HkgybH70vVBYjIuy101FwMqtplJu80gyAeNGP+tp4jjUMB4xLEKZ3OqDn5s9
	+jSnCPvdzFowlFlnbKUhRq8CRWvLdScjOD2vcXaxpb28kK/y3jEC0PD63qnEJyKUcFqAKxwzVB2
	SinwxWakaVpuLHo6FF0z3KRlaaqdLVTddFMiSxjgaXUS6OTivLsiTKk2KJh25Z8zRaI3Mv0EU3N
	4dD7V1qLW4/KmfdB3PdvY3snVNbwbodsxmB3Xws7Am+uPAlEjXTFhCIlTmiKIp8Dwsun5WU6dlD
	8rq1TBSd7uQFa8g3rNHqWQw0NWY0JgbGH83KquKC/Ho0e9pg6VWyarbkf/2VjM+z9T6eXCvNzGN
	3Mg65xBWBLYvbYZsV8svVXtzSa3CDYw9mI5WU9w==
X-Received: by 2002:a17:903:b10:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2d64a9f80afmr400110595ad.0.1787514496530;
        Sun, 23 Aug 2026 12:48:16 -0700 (PDT)
X-Received: by 2002:a17:903:b10:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2d64a9f80afmr400110045ad.0.1787514496128;
        Sun, 23 Aug 2026 12:48:16 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f925190fsm32321623eec.31.2026.08.23.12.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:48:15 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 01:17:42 +0530
Subject: [PATCH v12 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE SDHC nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-enable-ice-clock-scaling-v12-5-09271f583dc6@oss.qualcomm.com>
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfX7uB7aAQ6S+KR
 Lt7QAy0MVO7hNtRjedwl0QcJdH5WtnGvRNHwDp+nXGy3UKQakh2bK6XR0w0nWb5nUM7aMUBnKDb
 O5u2jN4a75YCpgZhbqSDqO3Apmit/PZTc36sQ73Vrd/YkMLpnrWEKqXTMQdA1ivqdDIN5rCPUrq
 GnKIfJcm0N/PmcYAXwkE0xeXWJdRNaHhGWdC/0ZhEjHO/8KjsuvxOPS4QCfMe4eQJwbbIRKYFQl
 hV/UgMaThesMQxAc4B+6WWrRmpA2yFIe8FgSiG2k+PpM/iMSerjCU+Hg0kMOPrvuEMLIeGCyj2n
 cyXysYH2OMWOyIdYhlEeWykQYKizZof+6w2MRmi30H5uGYVu1v5wFxuAA9QuCLhgt4MhfVVsAt8
 YZ8g9J1z8/6zfBPjvaKA+UNa4LggL62qge2NaG4pcDOSaT6Q1x5W1csIEWi64FTjPoTTECbSNw5
 mKCJ/KAXgHHwkNpXEbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfXzXGP4qKPP6rm
 bdXRuXyxzNjvlpB/ycUE3Q69FQq+pjel/Rnxa6A5k+zqCGEwCPm0ax5AKHaA6MsgmpeOE8DS+BY
 Rc+YfkYC2R7iKrbGRby2/y6y4dekDpo=
X-Proofpoint-GUID: vdFQifd5-Wq723tlCDUC1twht4ulZBX1
X-Proofpoint-ORIG-GUID: vdFQifd5-Wq723tlCDUC1twht4ulZBX1
X-Authority-Analysis: v=2.4 cv=e402j6p/ c=1 sm=1 tr=0 ts=6a8b4e81 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IFdraIdqUsMg42QbtkkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-23_06,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608230181

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE SDHC device nodes for Monaco
platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index ffb13d61ee36dca61bb4a720c51001fbbd135a40..91f55244078a9122365cba635f8d0034f70d11e0 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2742,6 +2742,27 @@ ice: crypto@1d88000 {
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
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-201600000 {
+					opp-hz = /bits/ 64 <201600000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-403200000 {
+					opp-hz = /bits/ 64 <403200000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		crypto: crypto@1dfa000 {
@@ -4907,6 +4928,22 @@ sdhc_ice: crypto@87c8000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmhpd RPMHPD_CX>;
+
+			operating-points-v2 = <&sdhc_ice_opp_table>;
+
+			sdhc_ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		usb_1_hsphy: phy@8904000 {

-- 
2.34.1

