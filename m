Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E490036D510
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526534; cv=none; b=F5rsukQq3SfY6jGVKSD7+UJFRXBSVzt33SzuKciFYeuSMPi/TIyBgXqvxW/VofpOr0ZmDrG0340Db3i6lRXbHx+Akd8w1Zt4/QVfKWe1R7WJs4jhystAcMMq0NX1YZbpmhzKu8RKW9Aw5QnmnhXI3Pk7S6QOYY5n3qvLa5m3py4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526534; c=relaxed/simple;
	bh=GfDXtP3q3Dcq71TorRZ+dyMBMVzxG86TTwppOvbQ4e8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eO7md7CBi1yYIVMtmArCP0g0ESjD1g61m7AkZhyIY33RVl9rPJ6tPhrXV8ZejDUeO11dRrDKf9zNPtuGBhkx+sGJKDChBVyrxo3Wn9cBCiah/bjZ2mEpXrG9v00kFSu2xblSauZprKKSUNztewUQtgPK8NGlK4SJ9na80gsjehM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pF3do9re; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jzOijT8/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pF3do9re";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jzOijT8/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64N3jiqQ735379
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 08:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SMg/l/29667
	tIts74aebOptB25uIIPJLTQJSiapxFr8=; b=pF3do9reLJAYo/SO47Ir496b0Hj
	yfW/uGru/9LDxnF5TOCqSyUhdXGFC5dJf5YeqZ/6s11CRezMFJ38i1DxHbFQGqYL
	ATozJU3M+87eY6WugG5vNFiSpozHq/c3BheHUdF9Gpox9XAsoR0eF8Sbu0l4A1iD
	UxxMKF7aQj9XaTTbrjXh3+xlsKtMZIPVxJvrrpd8EIT/5OmKbcIQSvQjgM3/lx9+
	YkyByO2isHtP+xFlJ1LWhHDFAzz+R2kN3fD+PvIuyON3zp0x/sI23xfQhQgY11HL
	4tzZr2jfk0vr2PcPESjDjpF7TTR8R8C14kuyN/W+98AWgoFbRY6kk9w1fsg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7ggck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 08:55:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd00a65673so60648675ad.1
        for <devicetree@vger.kernel.org>; Sat, 23 May 2026 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779526531; x=1780131331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMg/l/29667tIts74aebOptB25uIIPJLTQJSiapxFr8=;
        b=jzOijT8/DN9XOZwIem64QYye4IM1pPEE7thlfGbjaWHI5/c8qhmSaQghPCyc9mL/US
         Hbu4QmM9E44cdF6/uRZ2qrHyySfQN37K+rkNX6+2zWmrqMlLVwt21UdGCxhaXPqrW2wh
         VLBkkvWAtmcQ7Ja93V1Xnv+AOyD9Oc0BqFzTRn/B+tlMlapBObfrvEo4KqfGZw9+MSi1
         MpGnqjpUuNz1eoMSxHxftKVzOEArpBrxVOQs+CZhsaa+z3lxCVPgPtS1SoeRDusBDFR0
         2UjTi2mdT5lEYuZ4S644l/os/JQ90lEB5ImInbw6D9ZmvTDgahDv3+39rBRgpYlpIouV
         pfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779526531; x=1780131331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SMg/l/29667tIts74aebOptB25uIIPJLTQJSiapxFr8=;
        b=W/OCvuCQpRQa9JhXY0ImPFnRLcpPyiaLYRk8oLBBB2BUzw70R894nT4JSyKwtPPchn
         HGDi1CoOQksn6eVA0wbnmzBS6IqNxMeIyVXp9sdFGeTMsFO3WSEkxrWFuoJV0vX05+sx
         Q/ZRqhOxzBwycd3kpXmxTQanfi5vxzIwNJ+t0C+shXl9RlUMFHdgVnq8YIxDJDNpEzRg
         aF7hi9DVXvxH8DSV/OFqr5Qu4w/0oFe0EFn/J8sk+vy1Wzdyy04lAptoU4jFfxAjEJr3
         eQmweQHsq3KgrdpygtzISfBSqL4py5ybgkyLtdqYbMGMkMJVj2VWxULmThfTGnq0yE/i
         lI3A==
X-Forwarded-Encrypted: i=1; AFNElJ8K2+UfTvcVpMGkIOL/Sk2i8Ev+XtYvmNk0WKhO7Heots7PAAYJU1vh3716Ju2S2ZEklQWtd5E7zZQq@vger.kernel.org
X-Gm-Message-State: AOJu0YzV08E4QTU6mQjXKm2IIhLspG0nZA6b4PvEIBZgoVAAlY4kXBtQ
	BndAD57Uhpsa5wpPngWBmf/m6t2vPtVMxxuYC4WxIpoOnUtSl3E4lGCvcz5RWLGqljrhLgczIe1
	SGK4DcK/8Yson+afiU7l1FSkpxM+LNcrwBhzapLXcpcYXUhtD7MAYIWvKt8jf7Dtj
X-Gm-Gg: Acq92OH3CwCN0hyBK+Rro7kGj6umhrURBhn0N/nabCRKAUYjx6QeSChPju0/ErVyAVY
	Z4PmefonMjVrgDfP/zMxUsRxifRohkdB7+Tuo93xJ+W10/Qf8EgItw0O6B0BxbpLrp2Na6N3Y1v
	JnNYuC9hmYfIz92AoVtxzftzYwgYICtsNuxSAqH9hotYpOfjL8FhEyKv76M0AsRGbVqenjD9UDa
	4Ub/Vh5CnsMIuc/68cPFq8+IIjacSS4wzSTAKirA4LkG6S7H+q/h9qUjxXxhtkkjR4GS/3ok9QZ
	myd9IIk8Nq6HuF7vAOVp7ijBo5AB2d6h7ZTk6M0w8wVuOOgJbwuURpKA3UV583OwwyJwc+82HZv
	TbXA97xKQcmohqSngpSHGgCCMAA1l0//hwz8EEd0jSaUpvJvrsAej2ySSrOIEF7r1nvMdrraOu/
	Y2ji9lxC3tNv5VtfGKdIxCEd09WPZ46ZbouIp3
X-Received: by 2002:a17:903:24c:b0:2bd:d7c5:927c with SMTP id d9443c01a7336-2beb09b70f0mr58569265ad.20.1779526530828;
        Sat, 23 May 2026 01:55:30 -0700 (PDT)
X-Received: by 2002:a17:903:24c:b0:2bd:d7c5:927c with SMTP id d9443c01a7336-2beb09b70f0mr58569015ad.20.1779526530331;
        Sat, 23 May 2026 01:55:30 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56d68adsm49105395ad.32.2026.05.23.01.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:55:30 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V9 3/3] arm64: dts: qcom: glymur-crd: add Audio sound card node
Date: Sat, 23 May 2026 14:25:11 +0530
Message-Id: <20260523085511.2532669-4-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com>
References: <20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AW4STEB9xeAaG8PFEUzaf1vD3miqq70x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDA4NyBTYWx0ZWRfX/6kP6ddwgoSb
 C7Y3XaDbLkj0kzfQHFsMvr3FN+rpWbxvHcPSfpUcwozxOnkVNzRRE3Wvpq1Sn1Jrh3NyJiilXTS
 nH90t3sy2K/QWQuwMJhucOR4QupOLu+hEurqUeshAW8TE10zTh+LZmLCZBaNbl2gtiQNWodjy7e
 viwt5jlCQXsack0TUR7ilmNbfsZNhX8TO9Ps3tq+Q2KZGj+ueEnbfBU5UgPNxUNlsXaMmf0mscN
 cS5AtJzlKzD9M73XBkGsM67Z2Jo759Dflo52tJXW+nkPetACFdZHn5ThKoZ/Yo2yu3Uzl/fItlO
 v8THolY4Ej/c5a/FM73wlRY0UvKDJx9wH7jWa7Or+v8NmZ3mMoMWn70DKou35Jy/PR60OmxmnCv
 W3WL7xRSsbK+PSGsGeLBiz1/LLPgtfMuUf6/STsKlW+L88O8lT9mbOF+4bovWRa8a5kO9vqftJ+
 +5ZLTHyyValyW4uEnfw==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a116b83 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=p3rkaTs2iMnfG9m1iUMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: AW4STEB9xeAaG8PFEUzaf1vD3miqq70x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-23_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605230087

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Add the sound card of Glymur-crd board with the routing for speakers.

Add device nodes for the sound support with WSA884x smart speakers
and playback via speakers and recording via DMIC microphones.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 110 +++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..6c272fb6081a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -68,6 +68,54 @@ switch-lid {
 		};
 	};
 
+	sound {
+		compatible = "qcom,glymur-sndcard";
+		model = "GLYMUR-CRD";
+		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
+				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
+				"WooferRight IN", "WSA2 WSA_SPK1 OUT",
+				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_woofer>, <&left_tweeter>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&right_woofer>, <&right_tweeter>,
+					    <&swr3 0>, <&lpass_wsa2macro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -444,6 +492,12 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -571,6 +625,62 @@ &pon_resin {
 	status = "okay";
 };
 
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, Left Woofer */
+	left_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, Left Tweeter */
+	left_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
+&swr3 {
+	status = "okay";
+
+	/* WSA8845, Right Woofer */
+	right_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, Right Tweeter */
+	right_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/glymur/adsp.mbn",
 			"qcom/glymur/adsp_dtb.mbn";
-- 
2.34.1

