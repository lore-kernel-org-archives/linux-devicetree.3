Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690AC220F2A
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147876; cv=none; b=kk9uCBEO67NDNx8WRtRQdb1t/JW/eXlTXw2mZ2L9fvoB4DQhrYZ4VhmW2ZeYEPKzVzTewHN/fepjaRM3qGDnOAIDpP2q3fhoAPWblvrnkrmfD9k3mVkFQX+skr4/h91K+7Vb9Rhyy4gEnHPlYhZ1dMKtSoGWmewTrFm86i3rXvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147876; c=relaxed/simple;
	bh=kSiftulibVL0HSnjjOpYMYmixsE+/nkUGXx6P1IyA8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lSQ2oAtd7i8Uo3HnxFqAJrgAZKzsO+Oej9rUBDU34HnVKg1j0KFMshIIXTPJ2trSvU7vrU8hRya6YAbPzzYMx+HwCjTEyYUMcDLrKe14FXlkAWVhXGN4GNdwAoLWfI3wHfOQBOkMzxBOBC9cDrqfb4fWVmkJxBRqs19NEAdAH3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KtR77LVv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V4bVFx2W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KtR77LVv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V4bVFx2W"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD09XH174259
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rf5LDVyJLQFDuHVaje46GeTwqruso+eP5jYsoKj8CcY=; b=KtR77LVvy3dMb+3y
	8LJqrhcMajKEuoDNDnqIecA3t+TebNFIkNFs9b/WzBSGKRpyoBsWdVHONbvlR5nz
	L2GM/Dzc8nI6amcHICU/76PKx3allFOH/716FgaliI5vW+j9/tuTSmLtZu8SEQ2H
	zB+QlM3DuqSmro1wrtColgzN3x/xC7LgxMGst5b6VH9qigVcBC9IlZdLyHNibTR5
	kgDjjXje0i+Hs7ALAlwweHVG8TG6rWx0QKR+P46nWLHpCkgxP0Ec2CWOex18r4WF
	ap+WHSlwVs4G+WfYuE5kO+DCwj9/VP/EYENUNvi3d1QBusoPX9aQnxLANxciBvHY
	zfjNmA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjkp6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:57:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca8aee882c4so101985a12.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787147872; x=1787752672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rf5LDVyJLQFDuHVaje46GeTwqruso+eP5jYsoKj8CcY=;
        b=V4bVFx2Wx7MOvp5sCW/CAfig/hCZIkX9eCKmXts/NdvQdy2jNSCeY+qUfGDqRla2Do
         raKHGtNCabEb/QizlgVsbAxPQB/ejAGubd05TyiBrpNowhS2GPdyZf3XRQ8A5nDkxNUG
         BftjeiTpVp2R5ZQFx0yANIwxCNqciQGw4Gh4SnYQ8s/mAH1b4QwA999mphSBYKEyQgi/
         ChQpbabEZGPjwMc0+75lLTPrT/hdqu4Ft2xHDSqJsNcKrfp7hVbbGhK5HKOA3+vad2Uj
         QZ4gesrFvLFBvkkW70HvBwcJumkRbSLW1ra29GeS2jjlPAPEBjd3DiWChZOXOgdnyYHO
         f8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787147872; x=1787752672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rf5LDVyJLQFDuHVaje46GeTwqruso+eP5jYsoKj8CcY=;
        b=cjeBrF1jLuIw+XsIl2mxgg4jVWE7wrj9dNN7Ia58NPR7vxHYizlNjtC/D7rSOI5OwT
         0d4tKVKgCCfDjncVkHBO7dQs2/6Pp+4kIca2ghkO9JNAK5Lk16+SdrVdepkUpKhxhET3
         BoUrOXvDoZV73Vc85zhniVrx2EB3PFZ4VPHwrb4p/MTqNU5C+SWJVJI+hIYgcoN4N8D8
         10Xsx3JJSyJm0rRAk+NZSIzCu+e7Fri3GnfFqXNf5yC9INzIKtcejA5DroY1pdKWmFvm
         YFjCLs+vDpktebC4YC2kZeE62XMUmRb3K3/dL08qwXSkRqoV5a5hopdCKhLhr2LMQQnj
         Lh9w==
X-Forwarded-Encrypted: i=1; AHgh+Rof7KWfcP/Wc0C2M0xaeTwEYK4u7dhf9ahUbgLL6uCPfu6ZCd9ZJgSiT4LUcr9dKBxT8CbcwHaxYalk@vger.kernel.org
X-Gm-Message-State: AFuF++l93cdDOXhDd0ikUTEOUGDmF19wz33xmLOc4SVjIGuRlIHKDMNI
	DwakzURoerhZKFIta7ByuM6Bd0DWzA/06T1Wfp9y+8gcSOe/deAFLNdvejJQVtbFcBln4cpHuLl
	xHLlfQosoEY8yar5WKcyCRI/tTpRx8WMueo/67eB22GZx8IRLJ4ce2vfMeuxmumjU
X-Gm-Gg: AR+sD13D4okgNQLnuu40dwS8BP8fNdN3nmaWrsp5oi8X1giT7U81xnGO5pHGgc6EUvT
	MKTMnj87l/iYaou9YppqPSlbtSiR1hc/zmafvZy+Afg5/eNg+XTa8ky3pOUlo6+JAxQb3FV5cKK
	sQLr5OkY8G7hcqkKk/mAPlcMs9m07XRGLl8S/voSvtYgtRIUGDMmgxCjXS8OrNVdxJTjgAIWmOM
	wdw2IQ6iDTxn5SlLAJpk2/nUS9O5rvCETrLGBGh1BQMNGpIvpmOHObq16KY/6VylFqZH+VwIpTM
	DY/v9NUf4w7Cs4pKKeoBFlMY8THxIHjSg1WhKF5snMBSVIwD242ab/faV9Ma7IOcBILCe00zYs5
	iqKnLWMLpvzQOYVIX83AOlPU1GrVsEzBQIREnUZeEeKeISETSlV0=
X-Received: by 2002:a17:903:230b:b0:2d2:a952:2628 with SMTP id d9443c01a7336-2d5fd7197d9mr43661015ad.2.1787147872065;
        Wed, 19 Aug 2026 06:57:52 -0700 (PDT)
X-Received: by 2002:a17:903:230b:b0:2d2:a952:2628 with SMTP id d9443c01a7336-2d5fd7197d9mr43660275ad.2.1787147871452;
        Wed, 19 Aug 2026 06:57:51 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e550dbsm25318255ad.42.2026.08.19.06.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:57:51 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 19:27:34 +0530
Subject: [PATCH v3 3/4] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-b4-monaco-evk-m2-v1-v3-3-988145ef65cd@oss.qualcomm.com>
References: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
In-Reply-To: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwOSBTYWx0ZWRfXyp5YygbGzNDM
 QYRjJAi4UXkI1BaWf1mfZ8d2HGx80iyQZYvzkJYfTnGb5kfgdWIsptdIsv48ssJ6xsuY0UIC8Rw
 LXM7Gkp9cA7dVWAbchet0IDpIWffkxTFRkpVLRnFeCWru3z66LomJTQKGCUzKGoGTyNKtU1Rqe6
 j408i3rQnCP99BJKCVtiBnx8+cgElkw+aQ413DzOd49JaAgBVnPIMqjl0Z/qFeCPkjM8+OE6bkd
 MeA2AydO8JYUjsbTCJRIoH+wnV9MzuxFBnwBhO23RH2LMCtk5cZLoVNjrJISI3x61Jd82vUCOy7
 3GA2o3ezksZ0MnuxcREPZVBoPZYmtsR/TLXtEBzl/XeNdkO5+DiFhq04cLgZsVawA71U1lisdWn
 7M0q3FON9wS1Oo8oE8AiTM+9I9dgLQD8EaIibYf9lS49D8P/e9i0Xg3erjKytBNp0Ps6Omly9a/
 C4osxNWzzAB4e6pkEOQ==
X-Proofpoint-GUID: LKVQ0oa8so5LK1dqIoSfKGH4Udp4GdF9
X-Proofpoint-ORIG-GUID: LKVQ0oa8so5LK1dqIoSfKGH4Udp4GdF9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwOSBTYWx0ZWRfXzrU9mT3+HSIS
 AmMx85JJQb1dd9L4OlYaHEZWpvU5VJ2/Sy1X1HC0pKKQ312xYSmdRqFCKazmpnbG8gvk4dwEelq
 8EDQChNjHMCSm9ZWdisVv8R/+4xHUVY=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a85b661 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rHbtwcfoZ064LjEFTuMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190109

The monaco EVK has a PCIe M.2 Mechanical Key E connector to connect
wireless connectivity cards over PCIe and UART interfaces. Hence,
describe the connector node and link it with the PCIe 0 Root Port and
UART2 nodes through graph port/endpoint.

The connector's 3.3V supply is described as a fixed always-on regulator
(vreg_wcn_3p3), which is required by the pcie-m2-e-connector binding.

Also add the serial1 = &uart2 alias, which is required for the
Bluetooth serdev device to be enumerated on the UART2 interface.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..5930ddb3b4b1 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		i2c1 = &i2c1;
 		serial0 = &uart7;
+		serial1 = &uart2;
 		serial2 = &uart6;
 	};
 
@@ -47,6 +48,38 @@ usb2_con_hs_ep: endpoint {
 		};
 	};
 
+	connector-3 {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcieport0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart2_ep>;
+				};
+			};
+		};
+	};
+
 	dmic: audio-codec-0 {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -91,6 +124,17 @@ usb2_vbus: regulator-usb2-vbus {
 		enable-active-high;
 	};
 
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	sound {
 		compatible = "qcom,qcs8275-sndcard";
 		model = "MONACO-EVK";
@@ -646,6 +690,10 @@ &pcieport0 {
 	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
 };
 
+&pcieport0_ep {
+	remote-endpoint = <&m2_e_pcie_ep>;
+};
+
 &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
@@ -923,3 +971,11 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&uart2 {
+	status = "okay";
+};
+
+&uart2_ep {
+	remote-endpoint = <&m2_e_uart_ep>;
+};

-- 
2.34.1

