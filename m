Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5789405AB7
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774365151; cv=none; b=IYPTL3q+WnGeNDEMN8WQHJRM30okykJj+WkUWHxVdV/UBFQBib3xLVMaIr4dVH1wjRFRq5lDNGKAlCEpYebIZbTLy8+0Wc0wGDqHVner52Cd14iMcAMiioA9IzmAldKdOwKYBwsbrV95welSbeBrLDudf2QykpaZhQyIlK+9t7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774365151; c=relaxed/simple;
	bh=eYQEb6YCnmhcyG1On8DU77NmU0ONkm+Q7bBZ6L5slqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZPXDdgp0xDPbvYVQeUYPbLdH63tZGoUl/1wM6IVd9uFRahmI/l/P7MMNGM4/f1R8A/TS/v8UHzkXF2nDIorMTDp7ELeqrNQe+r5by7WfeXswvGWY2LS8TNGQRzAsNQgcYb6ld/h7F1Lu4SXGmy3n0unAFV+JRLXW0vRngQIs+eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6dop87M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kE0ACAJI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6dop87M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kE0ACAJI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OA9eZX890492
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SBwNzz8ZwWwaD64iiMufvm
	ZlZC6DB0cfqGGIlSCwwak=; b=o6dop87Mw06wZ/tjCcg8JGdNVHxFhPQZiwjCBe
	f0rMaxZp35EKOn8wTesQNvHaxvsAEjtmN5TfLVWsj2bLM09sQVG+ia2NScdlxVYH
	N5I2WoSc/g/3Uqp/y+/8+dhJRyP+YjHRxWXKIqWYnlsrsJTjNgunUWmpooBEevnC
	asNoTSozhoYZvPRtXdSP5B0IbXwCZwIwmG4tghxh6viZqB8B1Jwtag5Vp2RlWDa3
	ZinTb/AeU3mqIOwQOPLQ/62z2Ls+eMnSdv8fci8SYqUd1i+a8w935AGmVWwy4t07
	4og7hIC8CaZBkeeEenRMDk56DvpIhGpdD5sVd5Nsi8luB6KQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3k1xaf8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:12:28 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffcb3a10f8so6922808137.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 08:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774365148; x=1774969948; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SBwNzz8ZwWwaD64iiMufvmZlZC6DB0cfqGGIlSCwwak=;
        b=kE0ACAJIADeVXPqD2+X1f4rkMYc/JpgJHU5dVPsgXsqD6vNqCRgsQSTd4Px9s/uKiS
         L9dBwiAu5//72QwPLqE23+GjL6bQEhwKjP3Ynhqb8DL1dqCfQx/UZjOZiqKlZksgFiIz
         YJYbxsRCN8EaXhfEyyJPqBt+Eaq5nNhiZT2T2ltJl74SjP61j/8wQFnhyZ42j4Fb07yP
         j1GYTH71v5z+k8xpJx9fDGP08a/XoJaMBmVyhlpCbQuCYVOtzFo/vHRBtvxMJXjChqu9
         n/TfnZUdTUpkDMKDS+OInJqKy5jf7Ox1BZ6jJE9mep6iWhGlT5ztRoUgi+1eqS73Rr86
         T+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774365148; x=1774969948;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBwNzz8ZwWwaD64iiMufvmZlZC6DB0cfqGGIlSCwwak=;
        b=hRAwAG2tGtycsZeRacEDD9dVUytqCMKJofyVhhj+fNZPmPeeM42WK+8Wy5HpUX7ds6
         gSiPmCjC5uW9OAg4S09tO6LpwoOsEmJDKGOY+w7bLOMgiZORjRSg288/n3n0fImUNafV
         HtANWNWGY943zZwx30G679E3zzCHZZuBJ87bzEd+MdODaYKfd4ZOgJLRmiYA5WN0f5O9
         rQ9V9llwPkv8ZtItv466iiE7Cuaped7YPDZQgGPBMqrcnsJz7vb+0cwp4ytVP0hT7wt1
         Oa5uvdRCCKIsam5uwu4QFFeWFBIsDz5o8CqOTaZxMCBQ8CDrvabcfoE+y/4Tj3pdaKbJ
         8SaA==
X-Forwarded-Encrypted: i=1; AJvYcCWxjW3my1PzTBzn2PEQf6CMBTCiH7C1NTHL2l7JKis8Y9xi4PNnSVAWIQ2cTvMIPyxF+oGs8LlRleeT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6t4ADjlMc8rvUKiGbi37wp91vTaOfk9wFvmANQXsLR2z39D62
	Vvga29L9lMfhIv8vlyonoa8BiWpdVLK07/lqwVn11abuGSAxe0SWzPQSiY9S8oBZGCDgwCKJiCd
	QSyM0X3UFbUCuMkZkVx11yHCjIRVjejq4yeqfkiPA3I2RBj1lP9Y4rTlgD1OJgRYI
X-Gm-Gg: ATEYQzwdt2znUwnKhVFYN+pabXiWRztKnsNEFmj9iZdoj/0/j51Ikw2kqouOQFXKZzA
	bBHPvEMMj8f8EG84CmIOelOskLRT67Dm86zyGgfG9gJGoqGp+lOlPdUI8HNgqL/Vwb2DrMWxWFC
	6+rIdQtW3CSR6eVh7V7hozHjoWsd7QBTEI+/l4BAVhxE8G9VkC/EUoQ4o8cMZgoMy2CTIJl5pC9
	+qdyirfFLBzHL3OUj6dHQpfIUN1noHWymu/s/k338HhHNBBXYCLMN1uu4oP3MsuWp71wcDKbqoY
	Nodc/1ifPqqjIaKjpW+i4VsLpjTXijTyNK0+3lLaxUOnp2aDWJIX5ZGl7UDrDCu/G2RWorhyDBu
	Un3mRQJN7nD3+vlgBsX0yWO2bjHw=
X-Received: by 2002:a05:6102:ccc:b0:602:b370:7814 with SMTP id ada2fe7eead31-6037903055emr127915137.7.1774365147764;
        Tue, 24 Mar 2026 08:12:27 -0700 (PDT)
X-Received: by 2002:a05:6102:ccc:b0:602:b370:7814 with SMTP id ada2fe7eead31-6037903055emr127884137.7.1774365147002;
        Tue, 24 Mar 2026 08:12:27 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f6c0fa6sm25506855e9.1.2026.03.24.08.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:12:26 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 17:12:19 +0200
Subject: [PATCH RFT v2] arm64: dts: qcom: glymur-crd: Enable WLAN and
 Bluetooth
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-glymur-dts-crd-enable-bt-wlan-v2-1-6afcf1ac277a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANKpwmkC/42PzW7CMBCEXyXyuYv8k0DCqSceAPVWcfB6N2CUn
 2I7aRHKu9ekPEAvI81o9O3sQ0QOnqPYFw8RePbRj0M2+q0Q7mKHM4On7IWWeiuNbODc3fspAKU
 ILhDwYLFjwATfnR2AsJGuVCWjtSIzvgK3/mflf4rj4UOc/sI44ZVdepJftcC3KV9Pry7ayODGv
 vdpX1TK1LJWWJuaGs0KW0fkdrjT2GhVOWe3XJtWrvSLj2kM9/WjWa2wf46fFSgwaAmJqCpN8z7
 GuLlNtnsO2WQRp2VZfgFKCtEjNAEAAA==
X-Change-ID: 20260309-glymur-dts-crd-enable-bt-wlan-db90c414ebaa
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Zijun Hu <zijun.hu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5581;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=eYQEb6YCnmhcyG1On8DU77NmU0ONkm+Q7bBZ6L5slqQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwqnYx5Ls+SiEgM5h/ZdkCoDCbX6alV5CJon3j
 yIdKzVo7heJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacKp2AAKCRAbX0TJAJUV
 VjDaD/0WnYwPYjxe1rlTqM9fbIZO0gpgMoOloQTgmyfe3zssSBsj1bPACBcpVdPV0U47PMlgrGC
 1rcSIxCZdRnWMWBLvLbD/+UgDUim2FH19X5nlWt8/Mez9zHij3ex0sjvwzGuq3NipdXcbbk0KpL
 UtQouoIoOVqTO1IIbF7qycT+cGQpg7vdE8LqVTUA2u+BlJ/AymP7ejbT3VYEY5rM2ZmPCrBwNW/
 weAz7b7ttFxecYCIVWZtoixIf/UPrysUr2r44Yk3MjisiGOcwBi7kYMaNSwKrR196piYfbPD3Jh
 ormZ12cRFL/RWnv1e5+fknjW3Lp3gD/vl6RQgujUouEJN5ONCWau50dD0bdWJ+9e+lRn/Nknu+O
 EpDEd8L5kVRhnAgcsPk7pLhji+QWLWTkLG/IqLKxTjuwsTZL+ctBR+mo7l/Hq0nwBxN5RXciFQH
 XKgb2tlGG9jB2omB1kIBYZtTlqQWU+w2iDzBikmhEWtoPuq/Z9+cvV/9jjP7B/zm/X2hLfwpjdu
 fYUO1LVLSGOI6Q7WcWgRn0b30o0NosofBr0p6Fgw9o3IDe9BiqUKycyttLBTBy/rxgbWCmxay2L
 SysuOeFQ7el1wLZCGljf8nj3aEyQZFFownnC6bHlzTp26HnNdN510WZxsRVj3tk1NPPV30CpKf1
 kG7BNzOV3uvSsuA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDExOSBTYWx0ZWRfX8FiHzsiiTDUX
 Ee3Zg/8PXUafUgoEm7wH59nAL8bpfZEyt4CeZ2KrcYnJ0qEsolvO53FxylI5JwY8n4qJtCdCsj8
 p4OR2epc4Ft0as98k5R6YbJRqgzdVuVodzmfvDfZWfY7fbPj7eIZeL0iQoifKbJmNu4mXKxdvb+
 +HzyoHHc1g9AUx23L2Cuko+LYAIHj1+hAL6QRDVeGU6dFWjCY+vxpA4HfKxqXRWl3oKlAbIbYNu
 3LgMRY1yG+yWmlIkiYtbRTklLeRo6lh4hD6/ODBRmjAJ7tSlANAxV2K5eDnwqmIJpKPTzpcysX5
 YHz4NcQETQGUOHHTi+09I8WaaiiW6CNTa5x1CvXDZg5CH4DBSmomo4m05ayyf3Q02K8z44kyyKE
 qO1zMLqYBtG0Yv1eB6U2drPcT++aP7Vx8Yz3dO/sOvrTnAf+gZJFtBc52IOiVksfl4gPTeq99SC
 zq5cdGEwAzuq/Lu4ERg==
X-Proofpoint-ORIG-GUID: ZG2JnGuvwtDEhAgOYQYIMZ5H2gfAKR_H
X-Authority-Analysis: v=2.4 cv=O880fR9W c=1 sm=1 tr=0 ts=69c2a9dc cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=BeTJHSNCMgFxTTzwUYoA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: ZG2JnGuvwtDEhAgOYQYIMZ5H2gfAKR_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240119

Both Glymur and Mahua CRDs feature a WCN7850 M.2 WLAN and Bluetooth
combo card.

So describe both the 0.9V and the 3.3V regulators, then WCN7850 PMU and
the PCIe WLAN and the UART Bluetooth nodes.

Do this in the Glymur CRD generic dtsi so that both Glymur and Mahua CRDs
benefit from it towards enabling WLAN and Bluetooth functionality.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Sending as RFT since I only tested this on Glymur CRD.
As far as I know, Mahua CRD uses the same WCN7850 board, but I do
not have (yet) access to a Mahua CRD to test on.
---
Changes in v2:
- Rebased on next-20260323.
- Address commit message issue reported by Zijun
- Dropped the vddio1p2-supply as Zijun suggested.
- Did not rework with the M.2 connector since the E Key is still
  under review on the list.
- Re-worked so that it is done in the generic CRD dtsi in order
  to add the same support for Mahua CRD.
- Link to v1: https://patch.msgid.link/20260309-glymur-dts-crd-enable-bt-wlan-v1-1-3badbddd5439@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 118 +++++++++++++++++++++++++++++--
 1 file changed, 112 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index abc6cc8bb0a8..2852d257ac8c 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -89,17 +89,27 @@ vreg_nvmesec: regulator-nvmesec {
 		regulator-boot-on;
 	};
 
-	vreg_wlan: regulator-wlan {
+	vreg_wcn_0p95: regulator-wcn-0p95 {
 		compatible = "regulator-fixed";
 
-		regulator-name = "VREG_WLAN_3P3";
+		regulator-name = "VREG_WCN_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
 		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
-		pinctrl-0 = <&wlan_reg_en>;
+		pinctrl-0 = <&wcn_sw_en>;
 		pinctrl-names = "default";
 
 		regulator-boot-on;
@@ -118,6 +128,65 @@ vreg_wwan: regulator-wwan {
 		pinctrl-0 = <&wwan_reg_en>;
 		pinctrl-names = "default";
 	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		vdd-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_l15b_e0_1p8>;
+		vddaon-supply = <&vreg_l15b_e0_1p8>;
+		vdddig-supply = <&vreg_l15b_e0_1p8>;
+		vddrfa1p2-supply = <&vreg_l15b_e0_1p8>;
+		vddrfa1p8-supply = <&vreg_l15b_e0_1p8>;
+
+		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -382,8 +451,6 @@ &pcie3b_port0 {
 };
 
 &pcie4 {
-	vddpe-3v3-supply = <&vreg_wlan>;
-
 	pinctrl-0 = <&pcie4_default>;
 	pinctrl-names = "default";
 
@@ -400,6 +467,21 @@ &pcie4_phy {
 &pcie4_port0 {
 	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
 };
 
 &pcie5 {
@@ -575,7 +657,14 @@ wake-n-pins {
 		};
 	};
 
-	wlan_reg_en: wlan-reg-en-state {
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
 		pins = "gpio94";
 		function = "gpio";
 		drive-strength = <2>;
@@ -589,3 +678,20 @@ wwan_reg_en: wwan-reg-en-state {
 		bias-disable;
 	};
 };
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
+};

---
base-commit: 5138081b838d92e1bfcddc7b72b9215cca6e83f0
change-id: 20260309-glymur-dts-crd-enable-bt-wlan-db90c414ebaa

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

