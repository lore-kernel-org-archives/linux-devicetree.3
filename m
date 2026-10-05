Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190AF374E55
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 07:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185105; cv=none; b=g/lIEHsf/43mm7U5vPYnchegP7uRZioSR764Sp7a5XboZKLzzu+CxKrBxQNb4htqPIwcQIUBPOpQ8o3t9tZbyzJnvTQ2zNycKIWpF4YSG6y/s+Pkm9slpwM+Y9SSm8iV0CUeIKUPrTlYwqefvJdrYKRo6fdBw3QXAcSGFVcp70w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185105; c=relaxed/simple;
	bh=pp707mFFIsFOhojrFXFJDmxlQS8mlwPfd2cpcTElHgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hSpvOvF+3MhesKpyK1UApN/V4I+M4sHNo4uGoMb95CifMjzQuTX8I49b6lun8XiBT0qxRZsGaVtE94r7rbCfB28Ek+ebOQW40X/uv3IagIaOl/bXZ1YrGrLNfVIFOflEW7ElpHzdf3SsKTWhBB6/CCFSyowW2Ewv1fS346QMklU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lycGStG6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BEFOsh82; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lycGStG6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEFOsh82"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510Rv03839163
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 07:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OLb5pDtUQOaPF9wZBJMGDGKqDnkf5ns6MI9EMrBQMvY=; b=lycGStG6yYfswiNT
	C3IgCb8flMbfV+2MsAkgnBKw8P35UTlOZlYaljHDObokQHkovcoVx2oQdrY8U4pe
	tq7OOzWLaAzgkYv2/7CZG8Wx9907N7KVMRG9FJFckrD4e9gLIYYKMupQdg216An8
	giHKj2xRXkwvF4bbKSjOuMf860mJRilyE/dLtC8qJ484My3e1DxuHPex/iW+Xs+w
	hryHHRZtVhLeTibR513+IoKxYqXngTtFeOr5K1hxzSMAPOIgnl2YTDuX6uOs8tbM
	zaekAcExuZWOKaeAaA+LD+nzge742hQww4CYt5HZs0bHN61uBOdCpCfCySD1p/JU
	kNCFPw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08ms8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 07:25:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a47a81e70bso1481850a91.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 00:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791185103; x=1791789903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLb5pDtUQOaPF9wZBJMGDGKqDnkf5ns6MI9EMrBQMvY=;
        b=BEFOsh82poEW9VL5WJP0mCEQDHvQCd7FRu66oOTAs1LEUdnnb4PbEsU3twJziORiDc
         Mr4eLuBlNRx8zhwL976T7ITcDdUio2EfEukSy+/At0h2J6pAvw8YJmOAjqz+Oi6ShMh1
         0Kai2D565G9pVOfI/9u4Ieqnp4gzLvqGiLXaZLmZRu5pPtlonezWMIIggqhJWbwn0B8D
         vReYAEIhCmqLgY95SUPsYHWUiehcyLBfb8dKTw6M8D6xJ/PbQ9XwgrJX/rLLd82vgno1
         ErTrazWVwd/JVX4jrf+pgg7Ke8LO/Og9gLA5GteNSqE5LH35LRMhBXe+9/lOuXmzudte
         02DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791185103; x=1791789903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLb5pDtUQOaPF9wZBJMGDGKqDnkf5ns6MI9EMrBQMvY=;
        b=EcL//YbpaIcakttzH4dWw7dXQveROBtsCuxF7wduavIPYI/tRo0sauTMKvee5QQ2G7
         4vhxmoea8Wnj1CX1mSbAobZpskykPL+HxKfyk+9kyMD5SbYcC1QgSJh4H44p27x05L20
         k31qVQOyoE7QyUVt4bP8RVpPZB5QVnGoVP+Yku7TIt+uoCju3je4Mo/3r4A3CnYGy1Pb
         OLZFZJHlJ0b4nNtIO0Xr2c81bu6DxmIRzrnvoIU0sAZ0VLVrX/RkFgGK44o1xgEmtHVq
         TQBWa8mzwsMNxZqbbnboi1Qzv1bzNZe+5+Qn7eKBAEwDQ+VRg7Vl00jgJSUb+z/nEREr
         pmsA==
X-Forwarded-Encrypted: i=1; AKwUvBwWAsbYYPRLx3TXqizQuhjUVaihurCj55jhnfhUHxCNu9xF/3FesNdEdqcqFL4JNIOom1Rst2e2ObIu@vger.kernel.org
X-Gm-Message-State: AFq9FYJIKsKsOgDVoyUVNDcM4V/nJ02+xRPAwcb7AvFC5o/Ln6s336Wa
	sg4Uujkcw19ZWJtBVb44GqX/2O2rnDB1fb9d1EIkOmoC7GBWpTAz0FVvqFV1MRb5SySKWwGrmDt
	3tw7YheYRbZOmmU+6yI/P23d+OzGPxpk9bbakg3lTqEZMSUJlzJbapChzLt1m6csX
X-Gm-Gg: AYBFou07KQfQ4No2Uzoc8ZAhsA3eEWeqB7O7bx0TSILz13tBVWdJhHzEHfSeJ6yMQtu
	gwPXkWQzzIYQ/irivxJ54wsxJrxiMKQbCK6hEgDdRWwLF5Nvpq5nUVT8eMlkjga4/rCkLccS4LP
	gBPr3fz95q4fq2rx8LllcdlvKAC9vEQS6HCmy/6Y6orh/EYZhQjTLKjhlYEwUOhW7orFQbCAEzo
	uKBxZZSy8qaCK69oe5a94o4tzdJCRZrYcYVDW6JnxsHFF/vFNI518A70BKEDn+ca+P83S0eT5dw
	n0Ja0DJDmYMwjAuWUBDo0cwXYqWlBRtKV9dr8Txc4RydbGrtqqRbNIHrGM5cqzFRZaghkQC5SRT
	cqcBAqOmP3x2/cXtHzMQQFL/Hn/SAvvrdEmc=
X-Received: by 2002:a17:90b:3c07:b0:3a7:9fdf:f60 with SMTP id 98e67ed59e1d1-3a79fdf17e1mr3283249a91.11.1791185101456;
        Mon, 05 Oct 2026 00:25:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3c07:b0:3a7:9fdf:f60 with SMTP id 98e67ed59e1d1-3a79fdf17e1mr3283220a91.11.1791185100963;
        Mon, 05 Oct 2026 00:25:00 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4f3911sm9901421a91.15.2026.10.05.00.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:25:00 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:54:28 +0530
Subject: [PATCH 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-kaanapali_dp-v1-3-6faeac3a6d59@oss.qualcomm.com>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
In-Reply-To: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
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
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791185070; l=3560;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=pp707mFFIsFOhojrFXFJDmxlQS8mlwPfd2cpcTElHgg=;
 b=z2L87++pOyLxWbsPAX3pnL+nVhC97yCtc2jN6m0+st48uoNgWCwVgLBSSfdz3diouBTpIEHZa
 93Ug54zFV1UDBkOAyGQTgWeNP3uLcUdVXHF57JoklKDvuDYFmK6k2m/
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-ORIG-GUID: fptMygR7vBGDPH894EstnfL1JtjJ0N0h
X-Proofpoint-GUID: fptMygR7vBGDPH894EstnfL1JtjJ0N0h
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac350cf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=InTVoh-5CTnzAY78DgIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX8LjfMhJl75ZE
 mhcgIpn5CJqm9/Q/zUeT8yibnifOnPfFzYP2JOjTXLVeIboIyd6ahER9qxffGJlwvgWeqUEjNEg
 sYWphQslchcbL449XiE8+VCxCJGmObw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX7RUPvABH9eIF
 o24ja5q+3BCdjsFxGW0eoYAuJsbGYvKwliQu/7O0BKz2Yjatj+WHORFIPSDpQdsoMqprDbGYmbg
 ZVqVbSE4Hh5q+w/mWBPjgh/c20ZoJvrFOmryLleghgpvzrUZU9bmN2sP0AGgGcT0/iJ/PM3BynV
 RxM9M8ATnFyWRvf+eshBX/ena3BzKnf3o40IaookyHpJYfar6HxdKsBbh8OulQRMDmBPesFPRr8
 HUYvlcX0M8oSClvIIS2ROuEXJr3hzC3Ur3orreKrZhQ7BuG239sFMdayqjMScf6bSBnUKBNSksR
 HNUcdIVusg4i4CgaxwX0vNbkFNVhYU3v1MBPuniVvmc/DPc8XBYYcxmWOHF8QuYQDQaU8hbYbBc
 jcjWl5gFSo7XFoHwmmKmaVU+6gUVyqrJQtDg6/z5FnzrPbXJhLwcp3WFZmaP2h2B3t5YBnEHK03
 R39/drW0SN9aS7AfVMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050028

Add device node for the DisplayPort controller, its OPP table, clocks
and power domain, and connect it to the DPU and USB/DP QMP PHY.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 87 ++++++++++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..155c590c8eb6 100644
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
@@ -3851,6 +3854,86 @@ mdss_dsi0_phy: phy@9ac1000 {
 
 				status = "disabled";
 			};
+
+			mdss_dp0: displayport-controller@9ad2000 {
+				compatible = "qcom,kaanapali-dp";
+				reg = <0x0 0x09ad2000 0x0 0x10c>,
+				      <0x0 0x09ad2200 0x0 0xc8>,
+				      <0x0 0x09ad3000 0x0 0x78>,
+				      <0x0 0x09ad4000 0x0 0xa0>;
+
+				interrupts-extended = <&mdss 12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+				assigned-clock-parents =
+					<&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+					<&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&dp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MX>;
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
@@ -3860,8 +3943,8 @@ dispcc: clock-controller@9ba2000 {
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

