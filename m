Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2A83B0AC4
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846778; cv=none; b=VJU7IIBkOXvA0BysCbXCW/DO4KlT+dPq55oeZVn2ssVTVQzHDcN1tzl8m5kZwDrXbDxNYjBgF4AF70PRLduRt0Dx9WBukDqg/q4HPKHF145RNXCkNXOzjYqWG0guZu6OXtJfA20gSa3wA1qJt0+hyUj9HHL6n4AxIBQmayeC0rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846778; c=relaxed/simple;
	bh=0i97846MSXClmND1/FtMAs55l5h8AwGNr6ZoEn5SBmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jj2RBFaRJYygGoHULwvMGC7tbonTzNVoRMTVYjnXaudAvfASBgouEpqoZFV3qOqcuhGjJQxg7DmsovMLU5Ub5/hTpUS4SioSpiAWyi6npcEb5WTgdqitcrnPdvcHYY2Js1lnJGDEAmTrzfqGFdYgDHD9/NXhHHgdKnOHyyxxAxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZgMDMUyi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jkf+DInJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZgMDMUyi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jkf+DInJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CWl35818407
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 12:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gz+q6oeXaiNkf1M3KEIXRcdKW4P/xZBJoHTTcrcs91Q=; b=ZgMDMUyiaGBn86vg
	EwtSk6tCgKx++Jg7/v6Hd4nyLKAmsaf0ugg0/+GBFqQVOOLF9ZPIsf31NDNbMv46
	9WH1vpdYf88oJyqkJ9ugsi1sxpMl1zGLGJsEtx/lNfA0GwpDTaY9DYSq306ngRBb
	I/ZgbmR32LW3i80oBz5gAsKCYcZFer/bRa6reSdksPkSmPLQpCymQBS5uB8nlJNq
	D58cvhlYjSUo/ZK1dTb2zQI+4Ni5CGYIPZW6iCCO5ZABqeWFfT8/LCglyQqOL4IW
	9vHxI/Y0Gc51P+am1Hstr2fMySO9YyntbyWcyOjNaDJFId6LK81qfTjLv1wm966K
	WOhZzQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fud1dgsse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 12:32:54 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4485c1944e8so2363707fac.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785846774; x=1786451574; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gz+q6oeXaiNkf1M3KEIXRcdKW4P/xZBJoHTTcrcs91Q=;
        b=jkf+DInJO4DQ31GW0qvxmsSrafz4veRYLqji+mIXMxSomzXlF0MY5B5NKpnsqT8sJT
         QAAnB6qga7ujJ0y4AJ7RDaUiacxOuUspUJ1bwYCFWqSUXBfsRe3K/Y8D/9sOo+ZiYFET
         78xkUiFW2V1bBF2x+Q1f4Q7l3DgTHh8pCvXGFkDwgjZxotywdumQi559RjetceW78hGJ
         W/zkPRHW872rVcB0PnUcPUniTrMruA6gJJLAceL1p5jDOGlh76m0tonM1Wzuz/aEyg9r
         +iu9JjK4ZFsG0jeU8oiXfg+SvwHSJbMr5JQYG98cs0vwUIRM1P5KomuCDXEjH+Rh5ecX
         csUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846774; x=1786451574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gz+q6oeXaiNkf1M3KEIXRcdKW4P/xZBJoHTTcrcs91Q=;
        b=FW4H2CB5Rd9Vgq4qWt3TiZHpFa/t6Y+oQGZHwND7iLvsK9DS/v2PVChBVn2MBmnIgd
         1hZTOr1WaFDenBlng7RvYapKJmoTi/jUKpRvA2D5YCes1MY7Tnto4wKjBAx+WlW4dkbE
         tZWvMOZa5Eq3R99JYUuPs5i5EXgyCuj80VxiE1cDf6cMj3dckCQZOvuYNJBnrV8CvCWp
         zR7ApYsitYhHLqpHG77zv4BBUFWQ9kc6CLqqKEaNGbsWqBilwhtCTnGdn6T0EcrxO8X/
         7OnkwAQ6yPJSfZQ1Zi6MNppalWaN8prOwgMn2E8TSph61om6bWKlD7MC3U9KEVoODPX2
         tBkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJwcRIZx15H2CAcmqXnwKSPHgpHpNs5DyVnhT3pnOFTcbECJOfewh/vSzMLzLWAmr/erFeHgonwJt9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx40PY/IQ5jLsw6OpuZeql8M4fMrftK5ZLdlu1nc4eV06TrjCd/
	0K3CjBCtZI4KHSDn9dDfuCyXY3z00C0NBSteflnrFGyNs/pT2k6Qg5GjEdafAegngM6NKgbhFop
	+mntEt49Zb1INts4FOZBroAnhRU8r4KxbBU2gUaf/uZYpMRxxMm3aRvBXo0ylmxLC
X-Gm-Gg: AR+sD12wf0No/Z6JmFA1RZiMybUf3Wpn/YNKhfY/oTf+cG8doSYIbGjRWvNRoOI/TOc
	kfbp8j/a2y6WyjEWAk7nqV8+Ply5TqcrP9Gu7syCldZMd1Ev03EQuKqM8Crmk1ZL1ECWVBEMcMj
	CmHh88yi67k9WGj2aF33jqT4dDxidcc4tK4mCax6enqyBd313HCJR1DRniGj+NYoRzS6Fe32TWz
	w5adYQPSEJExQPu5LRF+7bZJyD4qXPVqVyQJsacm9qMYoKX0diJd4YOtKz1ktfM7oZ/7vVC63QX
	u/VJ+EIP7PnCuQMUXnOKeOUof/XssjJsJMIEDsc+6X/liluKmzOIjE5WLpqRrtGwPlgmPnDcCLU
	Zqww12zT3BTtQuUWa6z9bR+cYRmWosBTCtHycnIycVahjUtkVTpo=
X-Received: by 2002:a05:6871:3a22:b0:447:56f9:d975 with SMTP id 586e51a60fabf-459065e8b3amr10961259fac.3.1785846773630;
        Tue, 04 Aug 2026 05:32:53 -0700 (PDT)
X-Received: by 2002:a05:6871:3a22:b0:447:56f9:d975 with SMTP id 586e51a60fabf-459065e8b3amr10961246fac.3.1785846773181;
        Tue, 04 Aug 2026 05:32:53 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f6064d2esm12227013fac.3.2026.08.04.05.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:32:52 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 18:02:28 +0530
Subject: [PATCH v4 4/4] arm64: dts: qcom: purwa-iot-evk: Describe the PCIe
 M.2 Key E connector
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-hamoa-m2-dts-v2-v4-4-1b5ceac74538@oss.qualcomm.com>
References: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
In-Reply-To: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: Sg_-DRbjp_XxyPBlIXqaRj1PNHc1wIXz
X-Authority-Analysis: v=2.4 cv=SJRykuvH c=1 sm=1 tr=0 ts=6a71dbf6 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tPi5z99wbeDVDy7mnzQA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: Sg_-DRbjp_XxyPBlIXqaRj1PNHc1wIXz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEwMCBTYWx0ZWRfX+rqqXEd2IMMC
 PfDE3e9XgMZ9I80xbzWhXhiDl2wJsh6MSgqxB2RJylee0hbqRJlM25s9Sfg4y97lZ09IS97/+d8
 b8dmURFUBTuuRjmSNJuLApMAdunFCXM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEwMCBTYWx0ZWRfX3gSrKAs2mUzd
 4gAg0NnTooe/wTIRwYF+Vsy9At/8677IZxKciA6AAo4F4g8Zkga+rserRPUimcVIO16IBCUoFDE
 qse10mZFf1M6mf0hyTkNIv9sTkie7NkQuO39qV13sInGaQTMV66uf0MQs0YtUPkvyi3LAODfXYL
 WfFSjJ19R8bi76UFxZGy57eDZ+Z6sSOFVkbZbAVTaqImZ2J2LDumy6l0ZJYrbn+1wJGLYEXLuZs
 YUj8bI4o58liK5ItBu8j51nekRdmTVjvyLK8G9vKyDxehCM4H+WUV9ejIosc5gnRsspUo8nG/wq
 UmSLz3zyaqg+7lb+TpM0nodG5JmNaQp+R7JU6slk1X+Z3Ots2UMcRBiA99+T3aT497SGBZHA3+5
 voJsKAkXRdhkhwUzV6PSPuWKgZiXecOunr+IwufPkjdrO0UtFxHiMsIMESwaoxNvQWw5HYveLee
 DZWN8DoBvRTZafQAnhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040100

The Purwa IoT EVK has a PCIe M.2 Mechanical Key E connector for wireless
connectivity cards exposing Wi-Fi over PCIe and Bluetooth over UART.
Purwa inherits hamoa.dtsi via purwa.dtsi and therefore reuses the PCIe
root port compatible and the uart14_ep / pcie4_port0_ep endpoint stub
labels added there.

Describe the connector node with:
- port@0: PCIe for Wi-Fi, linked to pcie4_port0
- port@3: UART for Bluetooth, linked to uart14

This allows the pwrseq-pcie-m2 driver to manage card power and
dynamically create the UART serdev for UART BT variants of the M.2
card.

Remove the chip-specific wcn7850-pmu node, the static bluetooth
serdev under uart14, and the wifi@0 PCI child node, as the M.2
connector approach replaces WCN7850-specific power sequencing with
a chip-agnostic model.

Also remove the now-unused vreg_wcn_0p95 and vreg_wcn_1p9 dummy
fixed regulators whose only consumers were the wcn7850-pmu node.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 129 +++++++----------------------
 1 file changed, 31 insertions(+), 98 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3..6fc6fe7c0899 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -471,32 +471,6 @@ vph_pwr: regulator-vph-pwr {
 		regulator-boot-on;
 	};
 
-	/*
-	 * TODO: These two regulators are actually part of the removable M.2
-	 * card and not the EVK mainboard. Need to describe this differently.
-	 * Functionally it works correctly, because all we need to do is to
-	 * turn on the actual 3.3V supply above.
-	 */
-	vreg_wcn_0p95: regulator-wcn-0p95 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_0P95";
-		regulator-min-microvolt = <950000>;
-		regulator-max-microvolt = <950000>;
-
-		vin-supply = <&vreg_wcn_3p3>;
-	};
-
-	vreg_wcn_1p9: regulator-wcn-1p9 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_1P9";
-		regulator-min-microvolt = <1900000>;
-		regulator-max-microvolt = <1900000>;
-
-		vin-supply = <&vreg_wcn_3p3>;
-	};
-
 	vreg_wcn_3p3: regulator-wcn-3p3 {
 		compatible = "regulator-fixed";
 
@@ -618,61 +592,40 @@ platform {
 		};
 	};
 
-	wcn7850-pmu {
-		compatible = "qcom,wcn7850-pmu";
-
-		vdd-supply = <&vreg_wcn_0p95>;
-		vddio-supply = <&vreg_l15b_1p8>;
-		vddaon-supply = <&vreg_wcn_0p95>;
-		vdddig-supply = <&vreg_wcn_0p95>;
-		vddrfa1p2-supply = <&vreg_wcn_1p9>;
-		vddrfa1p8-supply = <&vreg_wcn_1p9>;
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
 
-		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
-		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		w-disable1-gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 116 GPIO_ACTIVE_LOW>;
 
-		pinctrl-0 = <&wcn_bt_en>, <&wcn_wlan_en>;
+		pinctrl-0 = <&wcn_wlan_en>, <&wcn_bt_en>;
 		pinctrl-names = "default";
 
-		regulators {
-			vreg_pmu_rfa_cmn: ldo0 {
-				regulator-name = "vreg_pmu_rfa_cmn";
-			};
-
-			vreg_pmu_aon_0p59: ldo1 {
-				regulator-name = "vreg_pmu_aon_0p59";
-			};
-
-			vreg_pmu_wlcx_0p8: ldo2 {
-				regulator-name = "vreg_pmu_wlcx_0p8";
-			};
-
-			vreg_pmu_wlmx_0p85: ldo3 {
-				regulator-name = "vreg_pmu_wlmx_0p85";
-			};
-
-			vreg_pmu_btcmx_0p85: ldo4 {
-				regulator-name = "vreg_pmu_btcmx_0p85";
-			};
-
-			vreg_pmu_rfa_0p8: ldo5 {
-				regulator-name = "vreg_pmu_rfa_0p8";
-			};
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
 
-			vreg_pmu_rfa_1p2: ldo6 {
-				regulator-name = "vreg_pmu_rfa_1p2";
-			};
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-			vreg_pmu_rfa_1p8: ldo7 {
-				regulator-name = "vreg_pmu_rfa_1p8";
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie4_port0_ep>;
+				};
 			};
 
-			vreg_pmu_pcie_0p9: ldo8 {
-				regulator-name = "vreg_pmu_pcie_0p9";
-			};
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-			vreg_pmu_pcie_1p8: ldo9 {
-				regulator-name = "vreg_pmu_pcie_1p8";
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart14_ep>;
+				};
 			};
 		};
 	};
@@ -1012,21 +965,10 @@ &pcie3_port0 {
 &pcie4_port0 {
 	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+};
 
-	wifi@0 {
-		compatible = "pci17cb,1107";
-		reg = <0x10000 0x0 0x0 0x0 0x0>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p59>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
-		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
-		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
-	};
+&pcie4_port0_ep {
+	remote-endpoint = <&m2_e_pcie_ep>;
 };
 
 &pcie5 {
@@ -1499,19 +1441,10 @@ wcn_usb_sw_n: wcn-usb-sw-n-state {
 
 &uart14 {
 	status = "okay";
+};
 
-	bluetooth {
-		compatible = "qcom,wcn7850-bt";
-		max-speed = <3200000>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p59>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
-	};
+&uart14_ep {
+	remote-endpoint = <&m2_e_uart_ep>;
 };
 
 &uart21 {

-- 
2.34.1

