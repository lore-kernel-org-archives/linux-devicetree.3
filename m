Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898262;
	b=rM6vfgMCaLJmRmyaTvjb3QBzXBy4sn0zJMRFjZmcoBB9bCH3E9nLvJoIv697y2w4xoiI
	 OnfxU9Ak61HjoCDquZWtZY8xy8KlIykcLQDvuzEgICqbx6r68w/YE9BsKwTYgxuorgaqi
	 iHbaDNAWN22NRhQIgk+AltehtToMnrKJNsszPQnhhitagAPv/f1Lecxrk+c5EgjezT+Fs
	 hmGwt7YDM8mC8wsMrpgh0SzkkJ/4+YSjIVHXXjxPT21HSRyYfxTUfAb7y0OE4ck5VCqdo
	 rN5jGUMWN7/fQdF5aT6KBu5lSOVRuSK3B0Olivj9SC6p8W9kfPB1IXn/mWlHAdPD1LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
	b=KNO9rusgXPwDU9vvsqEHkgw49r/+MkzkMOqFJLc/AsfI5xTD16Rk37XnnQBwNwEWcXQ1
	 oO6LDG71T7NfSgxAabhwk5QUI2MGzTw3dPsWSKkB2qV/JMXbdgvCI0UKC77W2L+IeS4Wr
	 O/QheESOaDeLNJ6qFFUb43e1a3typdKDCT2TlPoodZQ9zi/SW5f01FNgR8vaevgoEPCs/
	 NbSjr6C820DtsLgrIDDsq97tUUHf0oU/IjKS4FCC0yjsUNNriBO09VdCwWCsbIIbx5bzX
	 T946hNWixhuVhZK3+jCYIr14f4RudHYkKTufJttakHcmganKbhAd1FlnJ3+2RKOqWcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gqf5Wgt7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BLghFkbn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCC3606B518
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFCC3606B518
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gqf5Wgt7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BLghFkbn
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P167mV3120860
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=; b=Gqf5Wgt7FLstbzJC
	lki7X6yL4yu9ukVAl6Y42L6ZfGb0Gw41DEKwlOe5obCT/uvG2fWHSAzSAZN/AFZr
	Zj+F8+1fLxasf9qPF3OUAndrVjl90mQx6ivyFaoBQbPWEYNNca5NQrKMhSPWk4vQ
	xSFuhzu0vR2Z/gIJlL9RuGstdEbVusKLN7nw8NxLIUymaqgQDBTepNNhZe5VNjf7
	DRhVpI3ZzLy+BV8wQKiWj8rFfLIzBstTk1yI2nPckvarCnPf/a/VkDGuDCQGPMgI
	38qx4l7cNZi9K77XL0uCaARoF5KoTh9AqSoIm/OaflfyJ1kPTFi1rZcB2tzizg3x
	4+rzGw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3j9t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:17:40 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so10033682eec.1
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898260; x=1793503060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
        b=BLghFkbn5hI0lL/YdwEGP/qC5FE+4IkAk29jj2DWTcl0EI+SyEz06i3LJTAWdflSzP
         NjdYfiQuEzOxqUf0bsICopeZajM3FySO2Wi7wcJKSMjswq32ML6y+haUUhI3aiKy+7aT
         UCl6tihGMgb3L081h++Js7kWFbzYlfEcImaC2qhhiBplZfmr8c9xx7lf7WLIJVrkmlSo
         yZttia/B6Y2yQIyhItQCKO6uWgoSVaz9xo+h7yHydmQry4+vnAFL9jtk2OB+PwKfbuNJ
         6GeOOSuCImQogngBtjqntsfq0wLGQC12GL6ChQ2iYTQiAu7XF04H1m1957wFnAloVvr4
         CVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898260; x=1793503060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
        b=PQgfzlPnGnCq/aEK2cG5OX7BqfBEcGYrT3PbmNGm89TN39XupamuNGoFcQiyCuj4Tj
         zPc4sI9f602sJKEXgAk/kAKouAGxvrZZqK6xbK33f8FnVAs8w0SnasOskdT9alOOmPzR
         S4GbdZCR4fR9oGR8J5tLip/CVIcvUU1fXrIF2WYQUzgS8HUBet8wR7JvRZodBx/KZxJ2
         HF3oZ+5EIz441bb5CItN2HYQCxRScOu8wzJj72ihWB+vAWZcJIYdibTx5Kt8X43Lc/nN
         SLRUYi+sfdwESllZjbtt8iZaIHDVdK4BUtH100sGcHI0OJYzvSOMehiW5dzbBu0HhD8K
         q2AQ==
X-Forwarded-Encrypted: i=1; AKwUvBzo10bIOu3ybK3CSk6/KLEU6DJZMpj+cZdu699S7D6Q0AT2k4P5LiB5hvY/5mn5kPLhTDLgSQueANBy@vger.kernel.org
X-Gm-Message-State: AFq9FYL+WvBEJofwIpTtHuzAnl+hWBm5eH+knYZBiVyQhaIphpRoai5Z
	LLMUl5gBIeFOpzKJ7745ENgZpML1E/EU31YOAJif4H6AoDWTYZSCZK279apI+K9Cgk4vtGBtRy0
	hnBjoeg+10T1qh0fin2+0oFWpID13zKkg7OG+zfaG/pIA7OWhxuxSgHo2aBjHfbET
X-Gm-Gg: AYBFou0ppa76xAPvPzwsZo7/+pC2yW7LDRX0/UwSLQCWbRC3LG5YaGveJ38k3sy3lXU
	Jv8/Uj+PcYggjdwfBRjebOcGnIG2H8fhVmYLcuhjOCSWCxO+mrosdy/szfzl+7pexKz4W7VBbmd
	u2XHFp75O+B2qIvitULkmlCJ73Kc87DPB1gRWx25dbLKMlwUsBDYWeVeyQmCt4AhsefFAqbOGOa
	0PRySqzD9k75LXJ14piWD7JhVd/UCaG94BjE3bCiGir6QAv9/wB7hibAxPATSPHFYB8KnRTIPNA
	J0kuRkdMsHRLx+O8SGFlrS1vaEo9R5bHs82k5Mq4FOOfpYJjw9qj7POga0GyQJR3iaaxmrr8j1A
	jpqPfZUA2sEUFJ20CZL8JAaPkJs+r4do6gYuIwFGqDzwNpM0CcCLs+8bphEN4b0g0QWZlsymRwz
	pH5PTEZ2jzuA==
X-Received: by 2002:a05:7301:4615:b0:369:2505:380 with SMTP id 5a478bee46e88-369e84e80d5mr5202328eec.24.1792898260089;
        Sat, 24 Oct 2026 20:17:40 -0700 (PDT)
X-Received: by 2002:a05:7301:4615:b0:369:2505:380 with SMTP id 5a478bee46e88-369e84e80d5mr5202289eec.24.1792898259504;
        Sat, 24 Oct 2026 20:17:39 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:39 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:33 -0700
Subject: [PATCH v22 14/14] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
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
Message-Id: <20261024-kaanapali-camss-v22-14-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: lyhF-Z8SLumpWJAQUxDtAzGqFsK2UGEm
X-Proofpoint-ORIG-GUID: lyhF-Z8SLumpWJAQUxDtAzGqFsK2UGEm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX9SIFjMliZx8T
 t2wT3S/WWBwGBHKk1IH69OY4BBja8VCZkVrWn9p4PBIDYKKemmVuNunCq2r5vabRLig5eh4Q38H
 iMEnn4c0BtOD/5BoBw70ooqIhDyE5lM=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6add74d4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZJyx6tJpJz6uHbTMGDIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfXze9U5YreEUOx
 RO6xE9GYRkqMEBANOjhbnFugy6gBsy/41oPswyfm+QoJBom5DuTiGk8rjj/IcOU1DGYzx6SBV17
 NmR7s1uke6NmbNWGncI3aOakXjb/ZerZEQVxqzrFfJfQRFUXA/cWWr0W3AmDA30GI3nq/82Co+7
 7woDLARdLzZZgza62GomHUxShNlJUHjlJcCEf/eRNBOvWXgvU2MHciL8ONBWov5bErhngoU5vt3
 8Np63yFPqhOKXjaV6UNrk9tyq5A5XK6N8rhCXQllZfQZ7xJoq3YtfjVo5wRc3o9aODhqktZ01J4
 /5NtfZUL67BjpQhM1HxmecCQ0dKuoxYFxbl39xXS83/d7UbnkJXSUw2+owrol0cF5IFbHk49Cil
 YTqM5ocINBQ1O0vvtUs9fQf8tuDv+RKKJsKWYA05NyF7CV5fVgL3Yh0WkYR9UR8X08/4qpkfg4D
 hrZEEr0B1bRM254FOHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.

The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
lane mode on a rework camera module.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |  7 ++
 3 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..84b244d43e9e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -48,6 +48,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtbo
+
+kaanapali-mtp-camera-s5kjn5-dtbs	:= kaanapali-mtp.dtb kaanapali-mtp-camera-s5kjn5.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
new file mode 100644
index 000000000000..d0e39855e0e6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy2_in_port {
+	camss_csiphy2_inep: endpoint {
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&csiphy2_out_ep>;
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@10 {
+		compatible = "samsung,s5kjn5";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_mclk2_default &cam_reset2_default>;
+
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		vddio-supply = <&vreg_l4n_1p8>;
+		vddd-supply = <&vreg_l1m_1p0>;
+		vdda-supply = <&vreg_l4m_2p2>;
+		vddio1p2-supply = <&vreg_l2n_1p2>;
+		afvdd-supply = <&vreg_l7m_2p8>;
+
+		port {
+			s5kjn5_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <1248000000>;
+				remote-endpoint = <&csiphy2_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy2 {
+	vdda-0p9-supply = <&vreg_l3d_0p8>;
+	vdda-1p2-supply = <&vreg_l1d_1p2>;
+
+	status = "okay";
+};
+
+&csiphy2_in_port {
+	csiphy2_in_ep: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&s5kjn5_out_ep>;
+	};
+};
+
+&csiphy2_out_port {
+	csiphy2_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy2_inep>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9eb02fd09dab..c70cd39bcb75 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1243,6 +1243,13 @@ &tlmm {
 			       <119 2>, /* SoCCP */
 			       <144 4>; /* CXM UART */
 
+	cam_reset2_default: cam-reset2-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	wlan_en: wlan-en-state {
 		pins = "gpio16";
 		function = "gpio";

-- 
2.34.1

