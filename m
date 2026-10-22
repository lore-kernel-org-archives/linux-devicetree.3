Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662630;
	b=ldfWm+EsPEl4Mf7iBjBJgY8uAXrwgrZduZvZL5hKa/+4qrMRC/YTyoMTyJBmXHOTIROE
	 JvIHPUOkSQM4wK/qaEzf6gc2KpS/j/AXPAxiMJGLYZA5ReO2dOJAsVKmlhHSLko3VGPY7
	 7BysFaq2xN1CUZFibEQffMF6tr8qqlIiyAq9mCUhkd7oV0UIeziDSnjFLZh1R3WAC+Ico
	 Z6qenGvjkMYvmfzZochKWXLfXfIG6uBhpkarvwQC6hd+RZI6ggjgoIYNlC7tOjTKO6aAL
	 gFKcAF0+kss65uPcRBuEGO4vsUMjqhiUr1f7dp8dwfkDUKMqaHHQk//TZXLZWqumb8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0BSM0N2JW8/qC2xIwahgqEQhwwj/Oaqli2yB2iYA0Ho=;
	b=pU6zxL06rtEWuRprGQ5DJfbrQZ/njNrttoElOMr1+mM9CaS+qW1hYNff4/nnWfE+upor
	 1kylc+Q89Y91xJj3hOPQvu8A/kghGGCPGQjZNG9QoB+DWVklvrOwOkgzBGI9q4hi6iqag
	 Rn3iWvzQHXVnBntISTgM2PJegzox3hpkOev3No7GBiJgSV3R9pFMYXrxDEcYk4i52wzKr
	 hxuaUJ0ZBs0GaB8IBq/Kt0raXj7iMJUirShyjlZcMHMGFroRuTnGw017v2dYqmhSaFExe
	 WtxeR9RUhsz8UDxc7lrcwmDJrDmnVFz/UQ0ve5StsiF2l0kLcyrg+8dhaXGGOmaj3EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPG0aXT+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E4vbOlWx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEFD606A33A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FEFD606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPG0aXT+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E4vbOlWx
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M708hV1561484
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0BSM0N2JW8/qC2xIwahgqEQhwwj/Oaqli2yB2iYA0Ho=; b=LPG0aXT+wbIDw5By
	zduC5v5SMhALUeA+JfhOhTFI37hZWTIDYx/yZA2vI13KOV+EqLZCZ5LuYVpvbUk2
	anrscltO0pi9+d8IUz7ptn5ro3zruSBBShaZmiFvLOSbUESVGn6MgvXO+ENzvBsh
	yUsaXXdhnrGADE70Gct3X/22TClRJlUuaY+NHCOFxsQZK5bJmCOhxbO3GX1Ub05g
	mk75xBjtLDXVzaCkKcF4wDGyhUz9ioRiWOIF3hVO6uUy65E21IGABaCMd4dKVvUI
	SqZCBVFF2XWv7LZq61FOSImyH0Rw6TlxNTsWBPRL7Apiiw6+X3PGu/QO9+r5RGIQ
	LrY1BQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahth0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:50:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36998507c13so34014eec.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662629; x=1793267429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BSM0N2JW8/qC2xIwahgqEQhwwj/Oaqli2yB2iYA0Ho=;
        b=E4vbOlWxin3AfbviydUilSLg74+WExQtZr1NdlHmnAsnS2uwtBEbrevwdUgQ3wR+6l
         npMdhGPEKAqdrzWv/pkGnBntySgj6xJ+7Kvbd3kkfCBUQ75z0+Q+WQM4bm175qMAFp4r
         VABB+g2TJ+VDsg5mnrQ+hXwHJW3Pcm4A6q/R13bmi0m+5DRt9sz+cMUre040mmusMQV8
         vytTvfzlaW4HJQH/O/YeoyFcGleMu7nn2VfFI+tqM+W9fvOBdzeO+tr6PKWk5l5V5KxQ
         PMfiFSJ3djzBo3jUS5b+2cwIr9QUNIIFgopk74FtrZ06nbNweLwMFiMnpfdGyJzy/xBm
         dYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662629; x=1793267429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BSM0N2JW8/qC2xIwahgqEQhwwj/Oaqli2yB2iYA0Ho=;
        b=Wu512/qxa9iF8JcYMbyO4dLdhjMcv2FSONMrdx/J9+uKH//h0EprUC7o9Mal/dlXne
         9x0ic1UEiPuYDpJlDg4mXmebxOTKfTE864mTnyUJwUoPDZkuaQUjdNb8geSscxmlDLgy
         +4p4c929/Z6vvPh+GdzUVD1VsLuSkyXWEaiQWIBw23dibblD+fcicw0vRmn2fbSwTVo0
         8hatwGVlmIHRbb0og5920CU8OkWMtmiJkudCxtIhJjZMW+EEfsCSZMw/GqNMm4NTEW1Y
         y56vrFYFTRcrBqu4TBEq83PxPDHcTJ/D56yiOI9uEBl+aWMjuIpwhS7fSAQiJrurM1Dp
         6pbA==
X-Forwarded-Encrypted: i=1; AKwUvBw3KSY2OF8seuBx784tyNkCsIY/QWvcFniTETqToxAb2flKls3z8COKv3QGzM/A5BWmhIzXcsTP3YwF@vger.kernel.org
X-Gm-Message-State: AFq9FYIelt7DtuIzjWbBBrBqlPXu/i3Au4bzrHHJBKPqfVSiYMNhZjMi
	PaFmlzpMeCVD2BOlhtVNjJgLRNzMYfRwp5VWTqCNl8gIK3sDcHWsWo9cQFJFrL7nMu6U1owuLBt
	BQB/Jm6rt/gx6p2nC6DOzKG/Pv1O/q8jWPm8qbYnexGnLQ+GeqdIFBGxKkDW+cbRr
X-Gm-Gg: AYBFou3t3Je/Qe8e0U097/yhXV/crpYzD4djuClZ6uwvbh1qL1Rcybj2+rEG5TAUnLx
	ZVY5bqZgD8Vg5ZYrrcZQzB/WPlc7aPNQqxxqn+7H4qhnHeWbDjVhMzuw2GnrP2AtCMCZJ6PqU/p
	66iVUkiiZfqs5PmGrX2TBu1j6DABuPihIkonaViVA1gAGlSgW3SBrqnvrmLbTuFQyHWk9QGcoSH
	En11O7OCE4Lj675l9FoptYbGlnzJVtrM/D3zJc+bXXB1phbG3E/TnglisQGZtqhdMAgBV842IA8
	+hIWCNJ9vLOx8i+DM+lF1hmwnioKoSwsvmcwBSU84WWCXsAvC6+PCXlX6nFsC1phfiPNrwOSNGH
	+f1a4hIgSOdpGbkC0nJKN3CYJR/FIuXgYDGQ=
X-Received: by 2002:a05:7301:2411:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-36858cac5cemr3317445eec.7.1792662628611;
        Thu, 22 Oct 2026 02:50:28 -0700 (PDT)
X-Received: by 2002:a05:7301:2411:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-36858cac5cemr3317420eec.7.1792662628073;
        Thu, 22 Oct 2026 02:50:28 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm14418035eec.21.2026.10.22.02.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:50:26 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:19:44 +0530
Subject: [PATCH v3 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-kaanapali_dp-v3-3-b5ae8e6083c3@oss.qualcomm.com>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792662591; l=3872;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=kPYPcZOWZuwHUS12Mgjdh0g+aFqX48seESi4efFzydM=;
 b=7lerbAuO+khdCd/pqmyfNxB3meVJT9ZMCEUpz9JyvrHFx7v+qfVZ0sF+uM/K3YcVHpP6xpA36
 Wy/qYQfM3NlDtJqkZeWBQ49J7mlckxdEpqXZ5CXEU+dWWKMszb85deG
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX64ZosxWm7twE
 9cvv7fL5eB0+haImsY8DQzu15pSK4CTVQpY7CoFVJgQkufJtgCZ5DAl7D85NtE6KKz+9Se+OPkQ
 pNkZlc7uA0Q+BMG/7/UagGBQDBpUe6DHhStY083D8hIsN9jVj7NQyaxrowrSKwhcFS28gSZ0G7K
 +WgGORZIe4hVAIvLC9lLdOR/V86984WFMWaTdoqJG8+B2K2MB/k8xYugJZAHGx2PI2t6Bxub8U0
 ATgMoyZkmP2PF9ma/SVZ1ulvVOL8UB0C7eYl2V6tXdHv/4ZWlEN194aWca27CwtxOLWTpMIz5/B
 tiiYurn6eUzdN5A6mdlRl+i/S7DBbifCT8kj2PAWJDSs5M60rUoyqrlAwwWptIaFro6iosGH70R
 Saxm/8P3zAfsMUXFHyBi5494rGZLfDsBVXTOxa9z567AJd3TjntdHfiOdI+I9uSUPs40CUZ49dz
 I2H+yn4qULYN9UzmACA==
X-Proofpoint-GUID: i0xyfRmoXwwrUkKT9aAnvkyqsOObfYd8
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9dc65 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CcA5yJ8BMwMt8-iLN6QA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: i0xyfRmoXwwrUkKT9aAnvkyqsOObfYd8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX1GbYBsX3cgu+
 9stw2ODzaQn4FTqSHEfdkqFKT4n7wfcckWl5uwNvZ9/t6n4ztGKL3gdEQviKb4o5h1Luxbgi8pS
 haJUMFEc2wfIPWJ/hQCwe2mXrwxugAE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220039

Add the DisplayPort controller node, including its OPP table,
controller clocks and power domain.

Connect the controller to the DPU and USB/DP QMP PHY, and enable
mode switching on the PHY for DisplayPort altmode.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 90 ++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..ee1fa830b6b1 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3565,6 +3565,7 @@ usb_dp_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
 			orientation-switch;
 
 			status = "disabled";
@@ -3592,6 +3593,7 @@ port@2 {
 					reg = <2>;
 
 					usb_dp_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp0_out>;
 					};
 				};
 			};
@@ -3699,6 +3701,7 @@ port@2 {
 						reg = <2>;
 
 						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
 						};
 					};
 				};
@@ -3851,6 +3854,89 @@ mdss_dsi0_phy: phy@9ac1000 {
 
 				status = "disabled";
 			};
+
+			mdss_dp0: displayport-controller@9ad2000 {
+				compatible = "qcom,kaanapali-dp";
+				reg = <0x0 0x09ad2000 0x0 0x200>,
+				      <0x0 0x09ad2200 0x0 0x200>,
+				      <0x0 0x09ad3000 0x0 0xc00>,
+				      <0x0 0x09ad4000 0x0 0x400>,
+				      <0x0 0x09ad5000 0x0 0x400>;
+
+				interrupts-extended = <&mdss 12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&dp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp0_out: endpoint {
+							data-lanes = <0 1 2 3>;
+							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+						};
+					};
+				};
+			};
 		};
 
 		dispcc: clock-controller@9ba2000 {
@@ -3860,8 +3946,8 @@ dispcc: clock-controller@9ba2000 {
 				 <&bi_tcxo_ao_div2>,
 				 <&gcc GCC_DISP_AHB_CLK>,
 				 <&sleep_clk>,
-				 <0>,
-				 <0>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 				 <0>,
 				 <0>,
 				 <0>,

-- 
2.34.1

