Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B9D3D3D02
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226373; cv=none; b=JNbrDYjt9U3OH+c9CZwNjWJymkBU7gr3rjH3tuqe9v4BZQKlR+CS7GOnkSK6u5BmQK8OLXsc8BCCRLxsJ/3oQsL9r2Ub0vsiahheKj+U0mrRK8i02sdi/J5H0h7hgLbTlLsQQJMHFHkgfTNq7x3IJ2Df8Rfdzd+rVnNCPEnjfz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226373; c=relaxed/simple;
	bh=kOb03Jdyp29jPgRmKn/Ve3iixRKc3a10Zbfid+x8L0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g2x3ynRwpOiLkH5Fsm/SdSHUDICihoCFMESs35TiYHcuy6FwQTPzj9YWj3mpeCJAe03yEOfShh/9BqyzjhMM4IBL6pN/mHfn44ainjr/1HZ0wErF/pRc9GQBYjZp5JOdfwoffZm44c6FrLewWO5h5SrFyI0Id87CJStK4/GUmgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bqb1tqFW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJdDW5js; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bqb1tqFW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJdDW5js"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZsE04053144
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Upnj1dro5no
	76AJPF0WGep4IipqFATA6uaE79gGmLzs=; b=Bqb1tqFWVDfqCUwUh6nbw769zFR
	FpeoXqJ4vsR9soJ1IPCy322RRwAW9N1kcKe8mNBegteoswSYMR3WTrU1TckGYQaw
	TANtLdXbeomiqxP4GTY98J1TXfoUosDHOHkoRLUnCmnI9HzI/LRUpI0fM/6vqSxG
	bvDDBNyricU0G7Se/B5u+M6zXuAEgvlnt35Igajnb/+Wewy53sj+z9mB+Ifz24JB
	UmVcEnNnxzWO0ThSb7FbdM3312mPA0/6ssr5TAwbKqNpi69zOktJ3FAlAzOayCJn
	f7fVcsUMKV6KVmWFOwJ2Pom2+lzWXAyMk0PeSeq7cgiherVWy80nLfLzxrg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr9ys3bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:51 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-728f9ecd022so6639923137.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226371; x=1782831171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Upnj1dro5no76AJPF0WGep4IipqFATA6uaE79gGmLzs=;
        b=cJdDW5jsz9oUTcRAbJRK3cQ1lrId7I2b7nOE8Bkzxxf16+7hJcIUh1+AGzORPBP9Mz
         7yIbYGnYnANqbEXO4j/hHbjqeo+mF07gMu+QrU4TqVYKL5ZU3dZLgSpVCt2Hg7nrzdyd
         48rkeckG5gNalXb9gpKAx97VzQ/GiuUoNY5cbBPCCQ40wRCw/l9K4NpNjETtc5FyrYiW
         CVgaZYA29Ww9JA+LvgjTjnimV63DRLuM2K7oQSnE6W4UhXCST+uxUX5NSPM9vzAk0U3p
         5zVjBxkXhvK5K6S3wsTANWFeI27bHLB5boANGQEmE6xNJ7OVp6MMN/s9uXPJvZkxWpgC
         slOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226371; x=1782831171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Upnj1dro5no76AJPF0WGep4IipqFATA6uaE79gGmLzs=;
        b=SyOAzW2/+FUiIur4cVnn86qLCD9XcdwUolHeFpiKJO9WhUCFa0duH6IdsWmY94k+mA
         l4GED+pxOm45ef55YGFK9F/TnpgoCQ4IS2UPBwelmls/eRRXAx5nQvAT2FbiQoBWEUmZ
         1u8Fwi9NQliS3CCtn++38e7MRHl/gFU7B+IM76kR19FyQ2EU3M+TfTpSXA2AGzbbPW9L
         dxNCyIAnsBr9wj0lOuUHQ6NQxaeVR3Dq/yNtRa8Dfh0ZkdM9u+nEO/dE+1WaZI5ydzVM
         M3C8gt+P6nTIgi3GpvrvQAV0xB++8oSJhEKkQbQgdLqpAvMte1ZPKusMPOTK6tyduV75
         Rnwg==
X-Forwarded-Encrypted: i=1; AFNElJ+NN+eyBLnTXDtFQV5fXC0nKLMagm3NAsVBwCo/59E1JEjfUvzoJw3vXt4zeMV7UdENkVNawfdd7P+y@vger.kernel.org
X-Gm-Message-State: AOJu0YxgqKMy7EHDRg8ULEoXkBNr4b7+DEevloVZgkjiO+6EZxXPCLH4
	tr8oMbzegMjQV2zCiODl6YdgVa1ptnHAc5pn2eoUMYF05/EYcWQJ1nN5QPi1BqV2Hmp7daS1NNH
	Ohc70AYibNqqcghL8ieDQ7oEbkV9+kA1NG6mDHd1/oG5KqyC9gQhwWCYMAaWD4tcR
X-Gm-Gg: AfdE7ckvTYtdCVHYoK/af+G34iBhAvIwMh0f2AGeYuIzhQZkxmmvCc+K6YoYxXrFDDa
	7DKwvL5BtBEfreF7kvQxl5/xLfRPFvNznE3QFRO3NH7KkMaVCqyNhDl4M6GcBs5y3GE2uDTcESx
	nIlY8W9eyHaT/B4j6m3X8kvirJt7GdG3bCQS7UGBzssVxjSgnPtSsikKHrOe0XOVOCSIl7HzYkX
	pYkJdLTr0jbhsET4k54D4EpOn5NQuAxlcBY9OXQX/k6lljGWpz4xQUgPEGPdd6O6K83zoET6Zv5
	sq7ZOoKkDV0nXCMLi/YyeYG1BTQN/lOE2QL9FZ/aQ506GwFfe2deM6ObSGxhETRUcG7JyJ7Ct8X
	PpjJi1x3/rKw9s6pcIpCJHuvoFfezlSNXpFOjyfAzCiwloOWHO4m0Amxfxh6pJ7itUfEX1ozydC
	gekhqNwDQuVM7bLAS4RR0J5XfDPQ==
X-Received: by 2002:a05:6102:390e:b0:6ef:f681:d914 with SMTP id ada2fe7eead31-72ff628e831mr1645889137.22.1782226370831;
        Tue, 23 Jun 2026 07:52:50 -0700 (PDT)
X-Received: by 2002:a05:6102:390e:b0:6ef:f681:d914 with SMTP id ada2fe7eead31-72ff628e831mr1645870137.22.1782226370419;
        Tue, 23 Jun 2026 07:52:50 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:49 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [RFC 12/12] arm64: dts: qcom: x1e78100-thinkpad-t14s: Move keyb and touchpad to ACPI enumeration
Date: Tue, 23 Jun 2026 16:52:25 +0200
Message-ID: <20260623145225.143218-13-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JYSMa0KV c=1 sm=1 tr=0 ts=6a3a9dc3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yFha0hQGoAcqzG6e0GgA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: lduL5eKsHwyWS1Iu8CV5WLXzx38JZ97M
X-Proofpoint-ORIG-GUID: lduL5eKsHwyWS1Iu8CV5WLXzx38JZ97M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX/TL9ofZzixaQ
 JRCbFRR6+vHGtMrAaYNtOAtW1GrijJITnn3ikcuOqwdfrjvjk5ReQXd84M0meAsuoixHKyLPrLc
 SPEKa+twadIoiZN+RBpKIa7JYwePj0U8ycf0MZnqI8DAMB/FqrFCzkPWiQ5BEXjmMcuD69bcZEt
 GHVrsppeSA0y2X139TyuwOvNgq8XJlynNstwAaZfpp1wqCop/yNx+6zLGRkF+iqwck3FE38ypov
 cN8Il2+2R83TajhM+sCNUaQvUcCAkzgDeN0K1PcOP0q9Fx/Fel/9N+qeqyjLz2/qUD3pzMhC4ql
 I6+XZsl5EepsREDJgkx7yl++aMj8/eN/trNFi+aCXMiHrj9T291vIK/En1Ra0p9F550EJV+aftS
 gyR8O8rucmnZjQa5JWYLtJ6KnE0YVYd7zXS1KgIn+MT42Nut0YX83tW/Hu53lR5stat5pnfVTdw
 s0gQhDcTOS2xMcgaeaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX9SY/mE+V+0ER
 0C6IU4RAwqDA0aEc/bYU8qQcahaiEZdxQZ6MJoxv52N3h2aQWNJ5h6ciAGd28IvDD69x128EShM
 2j1016/iPS1oYGRJYqot/1MQlQs53/0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230122

Add acpi-path properties for DT-ACPI hybrid mode and remove the keyboard
and touchpad description switching to relying on ACPI to enumerate these.

Also drop the clock-frequency this is also provided by ACPI now.

FIXME: Needs DT-bindings patch as pre-req

Note this depends on these 2 patch-series for working PDC support on Hamoa:
https://lore.kernel.org/linux-arm-msm/20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com/
https://lore.kernel.org/linux-arm-msm/20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com/

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 59 +------------------
 1 file changed, 3 insertions(+), 56 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 2fc01e8e8c04..a73576ec238d 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1017,57 +1017,8 @@ &gpu_zap_shader {
 };
 
 &i2c0 {
-	clock-frequency = <400000>;
-
-	pinctrl-0 = <&qup_i2c0_data_clk>, <&tpad_default>;
-	pinctrl-names = "default";
-
+	acpi-path = "\\_SB.I2C1";
 	status = "okay";
-
-	/* ELAN06E2 or ELAN06E3 */
-	touchpad@15 {
-		compatible = "hid-over-i2c";
-		reg = <0x15>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l12b_1p2>;
-
-		wakeup-source;
-	};
-
-	/* SYNA8022 or SYNA8024 */
-	touchpad@2c {
-		compatible = "hid-over-i2c";
-		reg = <0x2c>;
-
-		hid-descr-addr = <0x20>;
-		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l12b_1p2>;
-
-		wakeup-source;
-	};
-
-	/* ELAN06F1 or SYNA06F2 */
-	keyboard@3a {
-		compatible = "hid-over-i2c";
-		reg = <0x3a>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_1p8>;
-
-		pinctrl-0 = <&kybd_default>;
-		pinctrl-names = "default";
-
-		wakeup-source;
-	};
 };
 
 &i2c3 {
@@ -1598,6 +1549,8 @@ wcd_tx: codec@0,3 {
 };
 
 &tlmm {
+	acpi-path = "\\_SB.GIO0";
+
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
 			       <72 2>, /* Secure EC I2C connection (?) */
@@ -1655,12 +1608,6 @@ hdmi_hpd_default: hdmi-hpd-default-state {
 		bias-disable;
 	};
 
-	tpad_default: tpad-default-state {
-		pins = "gpio3";
-		function = "gpio";
-		bias-pull-up;
-	};
-
 	nvme_reg_en: nvme-reg-en-state {
 		pins = "gpio18";
 		function = "gpio";
-- 
2.54.0

