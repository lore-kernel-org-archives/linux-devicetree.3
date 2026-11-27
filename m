Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794939;
	b=ClyxsXlPggp63iLa52oXUcVNI5728dgzvgzH7p7GbnkhG+f/SAn7LOPcKo20gtoajITb
	 pw8yL2tHbiaXMhIDesJir8/X+Z8FjRmPn15LWIrwBzK5cgFrZ+9jmGUT2iAhfsO9WT6ej
	 qa6YWiB4CWtJw7N/amY8awc/OLyB5IrJBLAqxCuV+LrL7NCPnXm2OpXBMsIAVk1Uw4CR7
	 UhZVZRRC/rGueqAwa4jrt9YBY9hMVbl9YTHga/DBxLNQAig2DKsod5oUUyGWn3LSRtc0D
	 RujxBO105TbCYKgHrbWahXk2POFCBE8ParmVA+1FssWCHTTmbb3c4Do2Gl0uXRIgiJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794939;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dZvmTbygxl/XClFljr1KmcHrdVRr51qfi7CDWubHxqs=;
	b=J49443kRjuyxVkP3djArB0mZdBpQwljXT/WDHYxaiVkWZ2/mUf10pxDcgztKYSkXJTo8
	 UUXC2TPEcJckYJOaCtQ+fNKGIgEgq7FUV1JqSUzzsohnYbyZX0xFI07lWFzoOfg2w+yIQ
	 EMnNMOaBMkhKqYaMZWndhmiovsm9bDniGooIR4lOhNOk36cGMIB/cEuPB4uRDfWKR9vZD
	 66EXCX5tgqStW86bkjD9VBRKemMIpVIWLHR1GROG3PorQJeU21xZS9JGJc9qTbu11mlBR
	 wijU9xTeZqKsfJd9ZjNwTaGCFiN8hPFAL30CKQA321j4wGfApY6brrV8qmprNXcMmlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLFbTXj4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iQyGesAr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3C4606A33E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD3C4606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLFbTXj4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iQyGesAr
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp4lW2337913
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dZvmTbygxl/
	XClFljr1KmcHrdVRr51qfi7CDWubHxqs=; b=DLFbTXj48d+iUKP8MXY1V6LJ7c/
	B5zTgkap38t4G7/IkaS+Fldgw5YmxoZmneh7zmU4HfNM8AE7505B30YK7VnhhOw0
	3yqNCnsZsk5q4siT3zmYCLcCMgwE+oWmCH2oTcqnv7kNU1yt16kHW4TpVwYgRIMd
	0Ul6xNnNYzcJ08o1lQ5Dh/dUMpAPSZxACipq4YFPoDREcQkSRyi/xSBmaQqJ0Zyv
	t/KfREBLp/hbEjM2DThaK1kdV6ZZ+rOILuZlPGD8QouRVSXvSBDvCcvqLAwUsVUf
	NogBmCWdfTqGdQUORppRp96UHkSLvoByQjRi9xvgx833jR/SoaVYonS+TYw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k9yg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-948d83322f6so700175285a.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794937; x=1796399737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZvmTbygxl/XClFljr1KmcHrdVRr51qfi7CDWubHxqs=;
        b=iQyGesArv3JICEV2GW5sQcBTospM8v4985n1HgyLkb/STM5iEo4UhdYbuTbkSryfcZ
         eUBT95gxDK4SvRri86nAeJH6Xl+5/u7YW2fkuutLLeMk+8zr21GFOoB/ZuWcIc67Bag/
         my03uMeAKXL50IHk9qVLrswPyi7N/Zqbk2cXxhrrJHt37tIFLp5DFJfxfoq2FbteUQST
         ZGEILQ3uqWbcezEziKkizJhCeYCW1+wny3RCvhgFBTeLbs0b2mr+G/vLaPwWAJzPg7jM
         GQpGeiDA7dQBVy8D3YkE74HoB60zXseBwf53J+TqshTduw6jKCtbbFCBrOcnlTizL95a
         d6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794937; x=1796399737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZvmTbygxl/XClFljr1KmcHrdVRr51qfi7CDWubHxqs=;
        b=JppLrmuHpH69zRD6rF63bL6/0AFoJWxQKWQ9oDMcz0n9vPkb87k74P1cdfFtXlgJmo
         OrGl4GDwSPbqopRF6mEkQHIw/0iUBtxCYf/mpPWbDv1WFffOh1YZWKMPB2o3EeV1qeAE
         f0RYXvatbV1GO2cdsValv9AkFfPha2fB+URF08rP+tRN3kr4D8NyM2TyyoGQXO9Vy7f0
         BrDOVHL2PylXQsLCGz3Om7XGNParsfH0R1KEVyRNWJPX9hYSjtUXIK4GwJ4XpYrBHEjO
         JKSzS12HTKuu6+M7ux/jtLaBEnjShwA7HMlvnEQ4kamYKnIempeRjZY6ZLR9iJSSHXjf
         1hPw==
X-Forwarded-Encrypted: i=1; AL+hErETlPD4lBRiSV3QGAHoRG++SA8iQ7c3P8d0hp/5eC/GTnHnzBWd5U05kQqWR7UtC7WzzS5ZlSVvg8sr@vger.kernel.org
X-Gm-Message-State: APuU4Z/kY9PfLKRT1I0u0fGmTDdsMByhlMAOYBJ4JfJf6Zm2vFgz4JA3
	hhVOUSyRDgFlffV0zvnic7eZcJq5otr8m90i0bUwZYQa7MO2lrH7SYZhRQDnGMQ5rtfwW6IXwOY
	jxw2czM4CiDaNarXgWWOx5Rp9sPbv7tj4tz5FpXOOjPQBPiAU8q/2KY5C31rE7Ndm
X-Gm-Gg: AZFdTZfI6ocBb5xWueUGY8SJhmjR6uSrU4+Y4jXs0+Wr5FYy4sx/FWH9OCC1WReoW90
	oBKXan/12I77uO9O9paqRmgvnb9DvmNh+pXde2AHoBmvL/o4XxKnNP91+katX19ztEWobzR3zcW
	7KopZnXqBZJqFZwnEUoN2BcIKfF1e9hlGCXm72VSlvlDTNSvpQnUZji7KYXVVO1mOkrFIYSD8FY
	Ej7bUgBonYNngVcaRPaJjpPXRzK/yY1YxtvP7lzaaVoyq/oAig/OpnweYvRiIOwDq2BlwPNOw8V
	fU3bBpQyiB+NyBgw0eRGaW08TYa74PHKJuNbfAGvtcgai/If+gnV7rPXLYFrf0AUlTDqwV9kceG
	g6ljc3ZiNSt21SJHPPBkJ6eRufyzXcYzjeyZN0/mqgSis/+dcW+xDHSFe0sVam6Ri
X-Received: by 2002:a05:620a:468e:b0:949:6027:7580 with SMTP id af79cd13be357-949bab7df00mr4612602785a.83.1795794936935;
        Fri, 27 Nov 2026 07:55:36 -0800 (PST)
X-Received: by 2002:a05:620a:468e:b0:949:6027:7580 with SMTP id af79cd13be357-949bab7df00mr4612595985a.83.1795794936461;
        Fri, 27 Nov 2026 07:55:36 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:35 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/7] arm64: dts: qcom: glymur-crd: enable WCD9378 headset codec
Date: Fri, 27 Nov 2026 15:55:15 +0000
Message-ID: <20261127155520.358909-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX2NcSzFE8joX0
 0/q+8YeSwT68ZRbVInW9C9GavNHYZGZDjzvU+UQkH7QTi7hqkIzvFoCGo/d3909y6rSKoM+YXcI
 IpwuWHInV8xYZybJpLyYZLGDdNIg49frYQOhdemRTV6vO/0mF4R9DJQnFcjUrE1QxMaOgMEwnRe
 77mHJy+lb8YpXnOmgeRWjR03Od6hKLX+rROQ5V3Y6absLDph9ENsNz/6bMet2xa6hHNISp6oleP
 gChPSNnLNMWKxUiMyG7c+LLeL1P9gSWivzOJKSiEPWqj/eDbQw7zS9Jg0/kDQS3uG55ohErEYRO
 vzTEynPgE5VDFd1MNZhENDNXn5GYJFZs6pEPH6MBvL231B8cDhE9o/iGfFR3PX8/HHMlPLo3v2m
 fWu7etFVWnheeQzNLhn03chkUHEV39DMyXIIDOuJBUPz4L1DELmaXJcT70lLUIlOOJ7sF1F2Vpm
 A3a3sS4IQ0awW+yGc4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfXwQPYF1xkoFV+
 +mPNVsZEhdsaPMXCcs6byh7oiNKzHR3yt511IOnbjCZ7WZB9EHwgu8v44hs4ooilfdk3u12Il3C
 MIIKDMjkPWKNkC8MG/5oqGAeTqpr4T0=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b09a7f9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=imSGFiSTgn8yRhLT7isA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: LWK6e_PCw0d6Jo-sdcNoK9l5tN3kSYVP
X-Proofpoint-ORIG-GUID: LWK6e_PCw0d6Jo-sdcNoK9l5tN3kSYVP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable the WCD9378 SDCA-compliant headset codec on SoundWire.  swr2
is the SDCA primary and swr1 is a DATA-only multi-master dependent
(lanes 2/3); the WCD Playback and WCD Capture DAI links run through
the LPASS RX/TX macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 84 +++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 3a9cd5f3ec2b..8e0dd2956882 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -242,7 +242,10 @@ sound {
 				"VA DMIC2", "vdd-micb",
 				"VA DMIC3", "vdd-micb",
 				"VA DMIC4", "vdd-micb",
-				"VA DMIC5", "vdd-micb";
+				"VA DMIC5", "vdd-micb",
+				"IT 41 Playback", "HPHL_OUT",
+				"IT 41 Playback", "HPHR_OUT",
+				"TX SWR_INPUT1", "OT 36 Capture";
 
 		wsa-dai-link {
 			link-name = "WSA Playback";
@@ -263,6 +266,38 @@ platform {
 			};
 		};
 
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&wcd9378c 0>, <&swr2 0>, <&lpass_rxmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			codec {
+				sound-dai = <&wcd9378c 18>, <&swr2 1>, <&lpass_txmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		va-dai-link {
 			link-name = "VA Capture";
 
@@ -791,6 +826,45 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+/* WCD9378 multi-master: swr2 primary + swr1 dependent (DATA lanes 2/3). */
+&swr1 {
+	num-lanes = <2>;
+
+	qcom,multi-master-mode = "dependent";
+	qcom,multi-master-peer = <&swr2 0>;
+
+	status = "okay";
+};
+
+&swr2 {
+	num-lanes = <2>;
+
+	qcom,multi-master-mode = "primary";
+	qcom,multi-master-peer = <&swr1 5>;
+
+	status = "okay";
+
+	wcd9378c: codec@0,3 {
+		compatible = "sdw20217011000";
+		reg = <0 3>;
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b0>;
+		vdd-rxtx-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
+		vdd-mic-bias-supply = <&vreg_bob1_e0>;
+
+		#sound-dai-cells = <1>;
+
+		qcom,sdca-compliant;
+		qcom,port-mapping = <2 2 3 4 5 6 7 8>;
+	};
+};
+
 &remoteproc_soccp {
 	firmware-name = "qcom/glymur/soccp.mbn",
 			"qcom/glymur/soccp_dtb.mbn";
@@ -961,6 +1035,14 @@ wcn_wlan_bt_en: wcn-wlan-bt-en-state {
 		bias-disable;
 	};
 
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
 	wcn_sw_en: wcn-sw-en-state {
 		pins = "gpio94";
 		function = "gpio";
-- 
2.53.0

