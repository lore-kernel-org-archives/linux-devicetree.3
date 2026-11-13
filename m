Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559496;
	b=Q1ccn2PLG9MuurEzUUnUjfuSa4y/g+iXAM1g4GBJv+aPYvPxRmAGtpdUdCAi2l90Rx3z
	 LU0AxF3M71pKTi12JjLf7AU5TuyDGi21PKT0K+tRK1Q0O2UK94iPTXJZ+iKCvNk3s+FMO
	 FMlY+ilJItU1GlafIxuad84DQVwV2mw+GhqrWXx+yw4RPN4JheosJefc1gjEIcqHEtR9A
	 lC0XYJvmA+lKQTXkGpWcW6c5Re/x5Jc55iTzbKhxSChp2vNUF4+Mn0x8/FjOTdUCrPUb8
	 e3lzj5myi1MNEyLNnzHo51vbL0LSv97i0YI0BV1WxJiJE85WKlQCU85MafqWz+UMFMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559496;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qAqr0y0c3ANATn/bhBe6uVlQ1yjBVTFNuYpOZthfFyE=;
	b=FP/sEX2EjGlO+TUa8tOPCg+wFxNz6OEr/YpCVtWSqqg/sQ//7D4m9esK7VErllHPtybw
	 pS1j/c9PxAXH1HTa8/pPemOhEw49CH/RIr5PcOUKTvk8sEooZB3IZH5j2bGYHVwdIZ9Bh
	 PrEYCEjOBC40+wvyCclVw5dqipUP/Ie3S1uB8JCmUs9k//nb8swJSZ0YVpVJ25DiwcJZE
	 a0yBPwcPT7vokFFRW2FFCk0D0Iy90C6fWlADfGj99ibn7sZcwLXm6qyuL7k0lxPsyRfJI
	 F2Dzc1CbZoTQGSk36ZJLvCjRDjLhES8DO5R9VdS/A7A4x0aOjwPBhJ4a117j5//ASmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UjlG20A+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hD3uiBlE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAEC60A3804
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CAEC60A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UjlG20A+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hD3uiBlE
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8Ux9t2181558
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qAqr0y0c3ANATn/bhBe6uVlQ1yjBVTFNuYpOZthfFyE=; b=UjlG20A+H4dhVO+R
	Uc5ldBRge/eh2a5re0i7cVdw0AyV86Ef7wD4BeBJHnowM1vgCG5rigqRjVmn5dW7
	TOa2CwdDdD2N3kJGgLpeOv12n26HpwAhKIDHqZTAtwQw+2XBlAkWjhS8ZAmKyee0
	K2MSGlC2/Ocug+W/BgHkxtxfoVaNe+k+aKAWmmS/oDIm+lDgreHTwMvKxL2V6yHX
	zy/hAH+k+BT3AZQYu5tnwis5XdkIA4ffECcRZms3F2s9jP7HsCK/p/ABZwTcpGUA
	8/Uupk2LDMv4ieYyBPa+XzHJ+5SYnotZRrAOiy+nq0k3IcByWryf66knaUUJrkGO
	eSqAFw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6rjhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:44:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso3411776eec.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559493; x=1795164293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qAqr0y0c3ANATn/bhBe6uVlQ1yjBVTFNuYpOZthfFyE=;
        b=hD3uiBlENyAvxPUPrfuQgWnTnTQdOtYzhEs75uOg78fiBrC6H5ff1LTTKvvlStRl4H
         W6E8HD5mvbNMjBGDHXA1O7KTfyvUFDHB4y1bRO7Y6Ok96frHgyS2DMmH/s1Pmy6JZSNG
         6TVLwYx86uqmdRPLelXKI6j1iotgYt0refg8Q91Yex/iI5HmZJtsBhRb3+inWWSdovYG
         7HD4zm9E34ZzGMxxpfSLVE7aipeyiqFIGVX9soYXWCBMIc5DPO62f6YFYvcEgUukCOgp
         pz3JfjvIzSFnCMdUZXZ8XBkxuGsFv8vkrgXENGkEsca4uJ8kX6W6tAVzLmrHcYjFOGbl
         qSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559493; x=1795164293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qAqr0y0c3ANATn/bhBe6uVlQ1yjBVTFNuYpOZthfFyE=;
        b=inrrzWxkOtFTTwQGBoIWUC5tz+zk87QEjKrvbEmhQggpCN+jX7TWkE1NBSQflbEyD7
         qzNC5h9xqoIyPLRh/0KGjqP+BN2WBUbPFK/WgyF/olVLsmOfQ8AuN460we9Xm9UrmIaj
         sYj+gY9bkAMv2DA4a05AqbFopCtFismLKsorXOWSS05hTsShm3OqBXVlaXLHyjNSVeop
         SySllMOwkD5zJ87/0znk9LfnIS3ITgt/kJVXIWN9cxA8H+liVc0RKQeEkFfwnTZJTcrQ
         7dc7hnBSo3w5YCCKgLvxmW5x5zWlSnCgfuel3qjcRs3VXV0pTD20/K2m0xjWnvAUL5BF
         OrNQ==
X-Forwarded-Encrypted: i=1; AL+hErFYzYQCLYdmdn61569PBXAT79MN+tgUPf+OdOpaJT6U64d6B62Ro3RdN9D5N6qKwp6qA2EV93Rar/8t@vger.kernel.org
X-Gm-Message-State: APuU4Z/+1V1hw4DlBDVZgdTFHqp5+Fx7wLLn0/MJUEtHd+1rPAOZrfZM
	tpHe0YpttDvKrZK7YueeIRdzzDUwQU0jwvj31EjSeNGdeEzTu8WRl6uSwTDntFcfmqTqXckNLxV
	HB7/pRB4+htP3bYcRKp5PE29sI46dqZMQ5DNBWxIilz6GTQYna6hQ01aUbA/fyGKo
X-Gm-Gg: AYBFou2a6EH4VV0tDfUzxARrCvhMpRcmct6XDyZIrg/rDnK+3PVUOnEn7JnXf7LdoPk
	MHmursVO4ywfKhECkc9wva3G+qV7/rKe8Gtbf/mF30cSl2dOyqWA93FLJ1lXpq7SJqOg2qy+Ibc
	0Fetdp6mtDC5jUcwGFq/IQ2C9aoj2Ri+cN0lwviIauicEehvF+ZutLGTZALZY3V9+rsj31UyauZ
	dlj8GLzueo+1YhX8T6pVTVuXxMvTshz5Mh4lLbbhq0zWnmtwnGgy+Yz2yRFZQm7Htbd9BUhZzPa
	TFM0Nv4OmBb0T2NdJ/PIY9BgpXJJcO3smcRPH9+8IMHoKGwZV6N82hTHLtaHgGxlF3JmRwrw12+
	xI1oy5cDKJp4pX3UG1vOjKEsvoqtI0Jjzt6lDqRcndHSR94FKB7nSk14oVUWyG3+VcSMyd+3AM/
	zeA64=
X-Received: by 2002:a05:7300:c7c3:b0:376:972f:afa9 with SMTP id 5a478bee46e88-37966387a09mr1646208eec.9.1794559493249;
        Fri, 13 Nov 2026 00:44:53 -0800 (PST)
X-Received: by 2002:a05:7300:c7c3:b0:376:972f:afa9 with SMTP id 5a478bee46e88-37966387a09mr1646188eec.9.1794559492485;
        Fri, 13 Nov 2026 00:44:52 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm9662357eec.20.2026.11.13.00.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:44:52 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:13:48 +0530
Subject: [PATCH v3 5/6] arm64: dts: qcom: kodiak: use thermal hw-bin trips
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
Message-Id: <20261113-thermal_bin-v3-5-878df6eef8bc@oss.qualcomm.com>
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
In-Reply-To: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794559450; l=6059;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=el2uGrzjfzzcr0/E7ywUdoy8ioWHrdz1v5pBik7reFk=;
 b=J+OOTjtl5hfULeACGvJNuVOUjQzTj+1UZ/UcpG9FG5Jz7+wEC9Mb5ILgzp6QYEbYJ7L9J223N
 aGfSOSxA1dCATYNGI13oipI6FVpvnHivYaV9eiAyH0VNeaGuVpXEkuJ
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfXwB4nLwo2NvxP
 eEBIEaa+d0uCFJF865829U7U/V4fubyNC4SyqTweBW9ZRI1hkgmnqDVaaMDvZUdxUmc9H+CovN8
 be8woxBMcFnwLXO0/iZGZsVSp5z+WDC71xvNlSFiEtnZPLKaAEgsiGd/vF9SucGrorOjti7s0dQ
 MevwbfG+LXIlOgeBmp1i3jWnZLZuOsBsZVyHesikgbc3kKzQjIB7f9N/W9mkHw9/RXeB2/wGO4N
 7gOZujBHWCElEHpnmRiiaROh0sDguYIC8HqlWrmTxfYaMAqEqM5CCEke8z/uorzxMTuC9GR2v/M
 bTOq/v3MGWnMHKo26cf1zX0oqZFFwDZp492ft+VaiqtRxkLSPTLO/WRP2LB/PYLSOKkulTgNDm/
 W3F2bve/25XbfI9IRuj7Pc7tY7ISmoqHnlA4FXiAc+1/d2zQi8xi5roffXuiybCOWsLBzKoeRfW
 fPBwpLgxMRRQVkpCNLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX0hyyZaQjYU7/
 Qn5cGWrHeA1rgc5I2TSPpprHkithO9T1kDCvO6j9ENugw5hG00b2qTiIZ27LydDyzexc8kFI3Zt
 vaFRe8yL3JoINOqC62vVEVZTMc3JSSk=
X-Proofpoint-GUID: md3rSBjUYh8bdSHmXpSnzRv5nReQDP-f
X-Proofpoint-ORIG-GUID: md3rSBjUYh8bdSHmXpSnzRv5nReQDP-f
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af6ce06 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PCFpqnHMHODqJTmB6Q0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

kodiak-based SoCs are binned at manufacturing time, with the bin
computed from the jtag-id and feat-id qfprom fuses.  The tsens driver
now reads these and feeds the resulting bin to the thermal core, which
selects per-bin trip temperatures.

Add the jtag-id and feat-id nvmem cells to the tsens nodes and convert
the passive mitigation trip points from a fixed 95C to per-bin values
(95C for bin 0x1, 105C for bin 0x2) using the new
temperature-bin/thermal-hw-bin properties.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 58 +++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed6..79553bf43a7a 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1028,6 +1028,18 @@ gpu_speed_bin: gpu-speed-bin@1e9 {
 				reg = <0x1e9 0x2>;
 				bits = <5 8>;
 			};
+
+			jtag_id: jtag-id@180 {
+				reg = <0x180 0x4>;
+				/* bits = <offset width>: 20 bits at offset 0 */
+				bits = <0 20>;
+			};
+
+			feat_id: feat-id@180 {
+				reg = <0x180 0x4>;
+				/* bits = <offset width>: 8 bits at offset 20 */
+				bits = <20 8>;
+			};
 		};
 
 		sdhc_1: mmc@7c4000 {
@@ -5810,6 +5822,8 @@ tsens0: thermal-sensor@c263000 {
 			compatible = "qcom,sc7280-tsens","qcom,tsens-v2";
 			reg = <0 0x0c263000 0 0x1ff>, /* TM */
 				<0 0x0c222000 0 0x1ff>; /* SROT */
+			nvmem-cells = <&jtag_id>, <&feat_id>;
+			nvmem-cell-names = "jtag-id", "feat-id";
 			#qcom,sensors = <15>;
 			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
@@ -5821,6 +5835,8 @@ tsens1: thermal-sensor@c265000 {
 			compatible = "qcom,sc7280-tsens","qcom,tsens-v2";
 			reg = <0 0x0c265000 0 0x1ff>, /* TM */
 				<0 0x0c223000 0 0x1ff>; /* SROT */
+			nvmem-cells = <&jtag_id>, <&feat_id>;
+			nvmem-cell-names = "jtag-id", "feat-id";
 			#qcom,sensors = <12>;
 			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
@@ -7164,7 +7180,8 @@ cpu0_alert0: trip-point0 {
 				};
 
 				cpu0_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7207,7 +7224,8 @@ cpu1_alert0: trip-point0 {
 				};
 
 				cpu1_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7250,7 +7268,8 @@ cpu2_alert0: trip-point0 {
 				};
 
 				cpu2_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7293,7 +7312,8 @@ cpu3_alert0: trip-point0 {
 				};
 
 				cpu3_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7336,7 +7356,8 @@ cpu4_alert0: trip-point0 {
 				};
 
 				cpu4_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7379,7 +7400,8 @@ cpu5_alert0: trip-point0 {
 				};
 
 				cpu5_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7422,7 +7444,8 @@ cpu6_alert0: trip-point0 {
 				};
 
 				cpu6_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7465,7 +7488,8 @@ cpu7_alert0: trip-point0 {
 				};
 
 				cpu7_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7508,7 +7532,8 @@ cpu8_alert0: trip-point0 {
 				};
 
 				cpu8_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7551,7 +7576,8 @@ cpu9_alert0: trip-point0 {
 				};
 
 				cpu9_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7594,7 +7620,8 @@ cpu10_alert0: trip-point0 {
 				};
 
 				cpu10_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7637,7 +7664,8 @@ cpu11_alert0: trip-point0 {
 				};
 
 				cpu11_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7752,7 +7780,8 @@ gpuss0-thermal {
 
 			trips {
 				gpuss0_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7779,7 +7808,8 @@ gpuss1-thermal {
 
 			trips {
 				gpuss1_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};

-- 
2.34.1

