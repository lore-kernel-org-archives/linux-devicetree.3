Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264569;
	b=ucH452LZ5qE8nXxLuPUTiYd8xTwfbJTjuSmsJsa71lOjAY29aP4odDONUo3ug1benfo5
	 y4Wub8HLMhXLlroQ+LghUQFJnQVBUFMCTZhdH2ebB6czS6eEi6byamsLd4iMGjA+8oc0a
	 Rad8dRjeGRsIki4ehfPnDiBCMrbT7aKm4EPbAuj9t2xcUu15l/utzYL0nIDlVdZ57SjCg
	 NZuLcXuc7J0GetdzbKXbCmBKDwqI4+pBo55wrkU6P4n7uIjor6TSl/Q1g18sWSExdBMm/
	 LZuor31KNsvMdURy+/FtE/XZeUJnBXoe/XJ5haEc5DWRLKhVbQgqELIcKB9SSbuA8Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eb2MimSeo4rVu060OuE5fuONCdUdlKo2DfC0lcL8Cak=;
	b=G0WhFdpSy/NCTe1AaCtB4Oht7E+ur9rIrY76Qw/ypseVMOSMMaPL+nyBQeBzlePpA451
	 7CeXcXaS/f1Z/a/2ZPpkKcrXgwtR7i0c3+k2NYIPWKj4qGypZBHLATJH2OdVwMB2DJslD
	 +CD3E5qjNgSCYnMVHeg9PTAsSL3/hq/Gp132OxY4kM60szKLoXO29kvfSQYmkVXPRKjIH
	 JkaIBOil1uH8gDBDMnrLDifCq9HpgH3KE1VWDT3iE2psTB5ziW98+UXTCzC3nldDfSKxm
	 +4A9rfI7hACrCQJK2YmlyGCy42g5/O4kyylsTy8fQb21aK3Kx/lts83zn0ZS2T5Ihzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=INI+Hhly;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eo0iyMq/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FB360A260C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41FB360A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=INI+Hhly;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eo0iyMq/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vFdi3765967
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eb2MimSeo4rVu060OuE5fuONCdUdlKo2DfC0lcL8Cak=; b=INI+HhlylaLekBfD
	AD++3ms3aTzkMA7Ndo18GKoSpT60fl6A71cZbNsQADO4ETd1QZuflcURvK+bfYb9
	k0ScrJYxQOd53N84KwFaKrY270atDSOUoxOb/PBsWmp7jtfOMUOYeYVn/SGyI0f7
	VfdbFj9ZmD/36pigcZje21QvjQrn5fyGrP333wkgGs0myTPsgwpgRZSmxFRPkJii
	664kCYsGxyjhaAjvx+yoWrrntvH8siNY/YhExFCH9v3UNQOSTj1fCH3kDgb0PacI
	zCMsTAxlETRxpAeUCQgCD0ATwNJr9GCRhi0TxHVcVMp31/xGymW0zlECFKgri/bz
	herXgw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgptt0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:02:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac6795617aso1715242a91.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 02:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264567; x=1793869367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eb2MimSeo4rVu060OuE5fuONCdUdlKo2DfC0lcL8Cak=;
        b=eo0iyMq/vJAouIaTnQz5vZQ2J9B8XaHBsLzfTvcQg0wiImLfALphDiT0vHUNXGuHtI
         IIr1syzF3W5WZM2AWC7j2gr5U82DRgScpq7VbC0sPtz7GfyGRlVrtzdi94AuXao/Kgia
         3R+TDP3jL6lW6byFwBeePSbng4U1a7iGD7HrEkvGjiw0yPNi/ssFaCdL6abXNJQT6og1
         HxVUq788lV15/8XzQFEVnyXjOLFiHHMluMz9z+XGMV/GYwDQSIFoKuHuAB4jr0qKgP+L
         mp3qSCkY5BLuJecrcnhsz2Zk06Ga6Xpdr1wFl9aSv4EjbiPOqRi9muO9A7pPbDx0CZhV
         ea2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264567; x=1793869367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eb2MimSeo4rVu060OuE5fuONCdUdlKo2DfC0lcL8Cak=;
        b=QdqeuZRlDoIFiGqQnwBopGZrCbhW0P/1w/VHyafhn16iuc2Ynnawr9auwnSssACUh8
         5ZAusFSCG13btdFJwK6xFFrUzWSDYUeAkeGt4WRqPzgbzo6pWcjRs672r3S3le3ZgLtZ
         I1TbeZn/id2xDeZSVUaxzPyghf+wKHELClfkud2qwinkLFP8biWltsEI5uRFMX3Iq0LS
         5c1p2NyKah5sWkRAcjnlucHAsWIIe9Oi7TRLNFyLzUVyP5NwpJt8dHn8WXCYFAMFDZiQ
         oWw5/lu/TOzlZ/TbZrpDEEdUTb0/Wzphh+g2iQ37fkFTAkWv1slRed/AAXy/JRZCX3/Y
         NEUQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8iqVAq+o/BRbUsw8sQCfUxgWU5vWIbEa2CdfxFSIARQH/0kni4gwFic/bllnksFoVFnbWvfxLstlZ@vger.kernel.org
X-Gm-Message-State: AFq9FYLuBnZ6ZpyN1nT0iK+77Cv5cAL/3288gBHX5CvyNrbihMk8nK+e
	UsEXjLBlZg/lJ+DLXyXT0lEKexoU4zkU7dT5fR5+rvK3FznsgHUWr4seS3FEuUoFpXiXI29idVh
	gj34hzdrIAMLfJu+1WMiyNRkZB406W3GNsD23o0b2zT2krI9aSQuewWyDfAhoKOas
X-Gm-Gg: AYBFou0r5R685PyRhvQ2NpNAvmdK1jsbqKGusIcRdYyWn96h7XW78BvMEsuZCp6udmy
	Tjkzlcnm21FLEwPp+h3MIgSn2zSulE+0PDzPZSUo7t+3wO3FGBC1dvDu7E4mreNQNEEgKOGP4n/
	tvonDLox70Qxfhz0foullSz+pRLQSMQOEBAeM99//XZ9Buuh4zVyoYpDUxiDKk8PL8cRN23RUia
	NvQyRfBWjc8fCbkunvJhgCbGqlygWOOJUj6XRgEfT0e03FLKMwpvWc9BjB1tvKUCLdo6SoIKV83
	mIgKzjvTWnu7DhqGEySlOLlRnOVnc3WtnlMqBWwxS6EAYkp53f1W+E9oMDDmc4YD1r3mJdz3/VC
	Az/JmtpprBjcfaBjrBIpndF0Ee5TwlODBsC4V85A1hsPf/VZO48QTO7LCsueY0/6xOGueN1v28u
	wwHwGSPJQH
X-Received: by 2002:a17:90b:1805:b0:3ac:9176:e836 with SMTP id 98e67ed59e1d1-3ae57f9abf3mr3412470a91.21.1793264567130;
        Thu, 29 Oct 2026 02:02:47 -0700 (PDT)
X-Received: by 2002:a17:90b:1805:b0:3ac:9176:e836 with SMTP id 98e67ed59e1d1-3ae57f9abf3mr3412412a91.21.1793264566602;
        Thu, 29 Oct 2026 02:02:46 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:02:46 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:31:03 +0530
Subject: [PATCH v27 09/10] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
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
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-9-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264459; l=2076;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=swFp0RJCSPHIA3uwc6pTKVW2KNCHZrJFvuYlsuhT0Q0=;
 b=T78rQDOulgfqlr7EEp9hcgO4PKMRQY/AElluM3yecob5l7BUxADUe3dKEXUi6GvmUFWhqud/o
 CB9oT+H9/wRCOmpCzC2h1FjtX1DMX10d4XVeyc4pDnRWmRusZxhNExm
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX51lrDarJglrW
 lbrvXI4VXxgY2mrzDMhhCtBXWgzHzkmBAdnELbk1Dwl5Rjlyq/ChPnp3P9JfsToY0scNEKIhvOK
 WBTgq4PScr29KArZhDdS+HF89pcuy9z+o6UB1OHAd8efWT8c8kf69BiL2/nm/tXYlsVCrih/0n9
 bR1Ki4hpuy8LDgBcNP1PIHE+++12YLwnSvNf5nehXke9vOIO2UCIAixpyPPgDp/6+PqSfhunVda
 6b6590Ry9RjUv9diVyry/82NrCqxiW+eJ7Cii3ISPDs5VVWtABXvZ0j3yuroePrLCQ1nRUuAqr7
 eUQgw/Tx1MoqHXjwBBHizL1u+WUVRJEvjRzlaZRuvbx+qp7XK3QDEsbqgJtNeYIF/LeGxapSc1a
 Cfgm5zOrBm58IzJOQworRr2RTacvkaU5xxbZo3I6EHLR9SFMGE3E8yzff7augEXp81rSHC4ZuC0
 CKi0Igw9r7eISH8xiNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXzYRr5X8OArmZ
 JXue6tAFsT+l4ENe0LL0f3YIDFu6KvCioGwJ2hyC/RHO36RnmLyxBUjk+IUFvEuOOPBVhqMyPw0
 2zW8lWCcH9VhR7u82GWaa04u+DfAjTw=
X-Proofpoint-ORIG-GUID: fQ1FU6r8BsB4i5h096fMijHBqgYlFABA
X-Proofpoint-GUID: fQ1FU6r8BsB4i5h096fMijHBqgYlFABA
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae30bb8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
qcs8300-ride for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 7 +++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 539c9c80a808..074971d310ea 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -711,6 +711,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c0_data_clk {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c6..9ce281f87a1b 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -654,7 +654,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index be850a23472f..abe21242d710 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -678,6 +678,13 @@ &mdss_dsi0_out {
 	remote-endpoint = <&dsi2dp_bridge_in>;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1

