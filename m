Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478720;
	b=IszKmb7X3CK/d+PXLogWWNueyYmXiuTgySvPR/o/u838ERODVszawucIWSpBdY6UQAzf
	 18tOFesKEAXjy53c567q1z9sshBtjAEclE+Sdudu4y8lJ3tzYMSfWmjOQmpz2SxIlAkQT
	 kHFbAnZvoCIhlUNv85eFb0YHminZC2fl0jegEl1Z15fY+kjLgXDwKkX5tAdnj/hNDIv7L
	 Tq3XbvKXrtTjSjxzZWegwMmr5YpoCYwcaqKoWTJtdEF6VSoiAPdit+QiooGkWvFqueC2x
	 rQbOa46YQvVherxBC9sj2qbdpHcsrGAVEU6u9S/Nf91MoJIkwF3yynpe/IqsC3WjV2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478720;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=idS5k4WwcN+QcVezy1yAf8DcTDWK1kRKZZKByAnDLKE=;
	b=mCmC9Z2vlzQiT3WYfQo9BhcTdX6I4Xgx/psDwEEaTrpsPsbFmdDg/PiO8Xx9SBhXxD+0
	 zuZKHCkhv71W7rnimY/YzJm6tDyDMhHPonKj4KDiG3KeSU17/f19NiPGQ7+XNfoawTUzZ
	 1dQV0yWluf9ZPPCQx5GQj6S9C+xXsFyRADVmd4DcrX+XF5tm8IflCbTNv+3frSDRzFcly
	 Q4/S8vgwEnfnN15a6mLHCy+6J0JLa+I46Dbgzbg1kPogkBKl30dw+C+35fsLGTPk+qLUt
	 lu8CZlCmmpaWVX+Yj8bVNjZ4D18MEr5jcurgizlE9Xyk7i+iesUz265cLx4Unm2MBcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JWu1mZED;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BrtjdYeB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E70A606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E70A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JWu1mZED;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BrtjdYeB
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9CXbD4092381
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=idS5k4WwcN+QcVezy1yAf8
	DcTDWK1kRKZZKByAnDLKE=; b=JWu1mZEDdi6dmFOmuUBSyBjcPiLnDQTlAllzqk
	AxArhkHMRaQwhsKFnFhlFSw7XbjDPuNLuK8k7h4Ocpad0NNjx6DkNZaHWegbenvb
	LiALXHB8xPlfG83oUfTNVAMgR7VWavHgmouBawvYts7UQa5rgGFwhJBYaTpSXd5C
	bPhvjdcS9GNele0vyJwxR5Q6KMNesKZ12lzU9qrcBlMekoXhiYz0wgvlGPBn8uh5
	Wznv5bk9wqakHFWfQqRscn5lA45q18P0R4S60qo1Eeh0UtkV5lrQydoF4HEBWXoy
	T1sAvKLmNeebT3ym97j84Qj6UnZvU862BMFGtzY6+9seI+yQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8jbv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:18:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eb5375cd68so38061815ad.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 02:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478717; x=1795083517; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=idS5k4WwcN+QcVezy1yAf8DcTDWK1kRKZZKByAnDLKE=;
        b=BrtjdYeB/pCACo3OieeRCZG4wOj2FiQLLCuL6ZXu40FqLbktJxMjY+XGgzSqpVzMll
         +L1HtZSO6WdQiuKM8q5dyCE3AcSkQiuhjylWZKYiFpFEJSPRX94kA4i5WlQZQM+Ef4C8
         4AyuqanAcex2vG49l2DK0pMtJ5QsWD+RRWY1+BuohS9I6NBY5p3jN+SVZqLnIjR+VNVI
         ng2+UE4MMqmD5FgtoyLkUKF3L6fgImjK6RF86lLEBLJymLI2hCFZRHKHOPlOEzSmLl+j
         //A1V8x2oRk6B5VJtPf6abMwi1/Vte6T0MYu006s0rNz6d1i3dXDO1VksYVidx0oXH37
         0Rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478717; x=1795083517;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=idS5k4WwcN+QcVezy1yAf8DcTDWK1kRKZZKByAnDLKE=;
        b=jTZ82ktOJ3EV9OA+Ga3++M4mPJBVHLYZbsTDk87qIOWINS9SQC6c81jc1GWtb+8oZW
         Wd4ILpiLoCIvGeyVr3OPZ6KI2VcZ0tQTE8/naheJV2rTVHPI1lUthJR6XFFTUktMiIEU
         Tb9w/OtkGXtvjSHqeA+hSjaqeaNvznbJanz/qJT5mn3U0tqgmVIgkkmZWf3DbvcLZAYf
         BwrFVwBM5Of2RCDXNuVUEm+2EG7sTQQyxotNAIq1k2swVRCPJzV0PBwCJDN0KY943EZJ
         kYFcu1g6wNojWzVFmCHjCAyAD38E4On07Hjj9viOXtiJ0dGBYACBDtIBKurwQWV93CzI
         4gqA==
X-Forwarded-Encrypted: i=1; AL+hErHsDHn7AcOLniRxsWXVBorumFgJHi470eTAtpd6eOP6/EM1o5eTCnZW8hnKtq3Z5INP7XuWqTMcIbiK@vger.kernel.org
X-Gm-Message-State: APuU4Z+Da8u6CNzhrql1QJkB+5UBFE/8EUTOOCgQcGBLFOGDm2qstWVg
	08AY64Tuhosxcb0P2Bdb9O2jkPkssmRQHi+OY9PaOGCzSSc3acrRjfOofj++LZJvefYnOyu+fx4
	RAmaZe5e7hlxFlPlk5dw5JEE1LpxrzY/Trk0dV/U4VfRVfPC+fDcagqErpH59vTqeXnuto8HS
X-Gm-Gg: AYBFou2uBEhkd4mibHYbB21gV3mJFBLGFRz6SWGJqu8k068MjBP08bAP1VoAE9MctPy
	kM4JhhPkDnpqYbgZEWlPDzSQX95miv2I8+BczOYKyPrZ6TQocv0mIGwz9gI4KBmUsh+cf29W9Rf
	mFBccSMs7VJ8479MBAN4nxdgIF9kD3Gh0IlVMXpwqKZCXoLt7cZ+CiYfDUpD4O67zAvx8TkzrSe
	6T14Wc+OUMZ2uJjQfR63JYocIiYK5+VQUeSaobEUF/4WHCHQ74aQfMqJjvlL1T9VNSy7rLFpblc
	R7SltIDDN4skjc+maqaI5UV/UzeRAQ+P2DAjIr7WLloZFWvctDBPScb19aeNn78w3oISzGtvKC9
	hD/FS/o2uwcS1MDc1GhGKLXRyAxEc4as8JfxJKjCSgkBloAUoKZVzFBk95G3Tkg85BoNluaDptc
	AxUbpvhB6WDQ==
X-Received: by 2002:a17:90b:4a90:b0:3b0:db75:4bcf with SMTP id 98e67ed59e1d1-3b182f45140mr4488432a91.42.1794478717420;
        Thu, 12 Nov 2026 02:18:37 -0800 (PST)
X-Received: by 2002:a17:90b:4a90:b0:3b0:db75:4bcf with SMTP id 98e67ed59e1d1-3b182f45140mr4488410a91.42.1794478716927;
        Thu, 12 Nov 2026 02:18:36 -0800 (PST)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182debb54sm3300528a91.2.2026.11.12.02.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:18:36 -0800 (PST)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:48:21 +0530
Subject: [PATCH v2] arm64: dts: qcom: eliza-mtp: Add WCD9390 USB-SS mux for
 DP alt mode
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
Message-Id: <20261112-eliza-wcd-mux-fix-v2-1-ce7eedf47bb3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGyS9WoC/22NwQ6CMAyGX4X0bAmdAuLJ9zAc5pgyA0xXQJTs3
 R0Yb/bQ5Pvz9+sMrJ3RDIdoBqdHw8Z2AcQmAlXL7qrRVIFBJCKjMKgb85b4VBW2w4QXM+Eu3ea
 UyUKRLCDc3Z0O8eo8lV/m4XzTql9ES6M23Fv3Wp+OtPR+fvHHPxIS5olKBeV7koqOljl+DLJRt
 m3jsKD03n8AWC2FWMsAAAA=
X-Change-ID: 20261111-eliza-wcd-mux-fix-453716a9c1a9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794478712; l=2790;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=OKIfty8D6ajySNTRoI+nZGC+zq407XQMA8cjCg5j2UM=;
 b=8oTLxh9VTapZEES2TC5Ms47tbNefj/i8R814bXU0nwnCChIopz4vLKhn8X+kwaHa8+qhAUX1Y
 bUcKvLTBy8kBNdFKYTyXXRTtKndipPqsGZWPTf5MfMfOIcFMEkHQW5i
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX01fdYFqd3DCc
 kPW7F+EzinF0RgguLlpX3Jq1FN3JfseyGKTQBnR2uUKRWnSXE/tZr06FtufoCRj+qUgwGkv3TlN
 jG/r2AVVbgdQgidQN3xBr+HK8UcLps8=
X-Proofpoint-GUID: MYiUcwvvaVGyqD7abP_FvF7MgJGpCntY
X-Proofpoint-ORIG-GUID: MYiUcwvvaVGyqD7abP_FvF7MgJGpCntY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX47umwpGFM9q9
 GRcRLS3cSil7lByN9biNCGJ7soO0mfOIsEoHZRz8exvWilIcK7zufzHR1SlBffxA0IgGWMPURTp
 5E3D9K3GKuMVtndhYZ7UpkzIgLEAW94JWzEWM4LDOccN0g8BC4RrDahLU5SHoJOtaqkrIzl5zyt
 g6e0I0d1tvYVJEoakpCgCRTXsyImMXceVAcofSugdDPtyiUo+5+vf1JU9t+PitK+e9ae3Ho69UN
 GG2gCjRvvIIyFyLbeFxIlq2uAAyeMkPVG50TTRIrjHDl+IF08IDa707aVR43/cPgbRzcn6Zy+vC
 qYmKyVzDrRo68xufl20YBJHYKhYYICucr9VprsTPEabWNX+TaZOHV/H/QDBykG04f7cHdx5/8JO
 ET/eQ9Hh1haQ22rSQ8XkBXC8KmRNeV8Sme87ug3NgWzeelKN8voNrr2Xr1s6D9pczSxNUgzvFrU
 Xakr0bxSEBAwwzDhRYA==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5927e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=jVEDQz8d6yieKVSr1KAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120040

The WCD9390 USB-SS mux routes the AUX/SBU lines between the USB-C
connector and the DP PHY, but eliza-mtp lacks the devicetree node for
it. Without a physical path for AUX, every DPCD probe times out and
the display never comes up:

  msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> (ret=-110)
  msm_dpu ae01000.display-controller: [drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, status=2
  [drm:msm_dp_bridge_detect [msm]] failed to read caps
  [drm:msm_dp_bridge_detect [msm]] aux not connected

Add the wcd_usbss typec-mux node on i2c3, along with its supply and
reset line, and wire its SBU endpoint to a new port on the pmic-glink
connector. This gives the AUX/SBU signals a physical path from the
USB-C connector through the mux to the DP PHY.

Fixes: 193fd5f1aadf ("arm64: dts: qcom: eliza-mtp: Enable DisplayPort on USB")
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
Changes in v2:
- Add Fixes: tag referencing the commit that enabled DisplayPort
  without wiring up the AUX/SBU mux.
- Move the &i2c3 node to keep phandle-referenced nodes alphabetically
  sorted (Abel, Sashiko bot).
- Link to v1: https://patch.msgid.link/20261112-eliza-wcd-mux-fix-v1-1-70c521781ac1@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index ee05192adcfb..f5980516eae1 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -96,6 +96,14 @@ pmic_glink_ss_in: endpoint {
 						remote-endpoint = <&usb_dp_qmpphy_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&wcd_usbss_sbu_mux>;
+					};
+				};
 			};
 		};
 	};
@@ -430,6 +438,34 @@ &gpu_zap_shader {
 	firmware-name = "qcom/eliza/gen71700_zap.mbn";
 };
 
+&i2c3 {
+	status = "okay";
+
+	wcd_usbss: typec-mux@e {
+		compatible = "qcom,wcd9390-usbss";
+		reg = <0xe>;
+
+		vdd-supply = <&vreg_l7b>;
+		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
+
+		mode-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				wcd_usbss_sbu_mux: endpoint {
+					remote-endpoint = <&pmic_glink_sbu>;
+				};
+			};
+		};
+	};
+};
+
 &mdss {
 	status = "okay";
 };

---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261111-eliza-wcd-mux-fix-453716a9c1a9

Best regards,
--  
Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>

