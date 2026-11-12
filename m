Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458222;
	b=q/78yZYhXsTdASgJo92vEMDA9mDIbnDKjbGkExAmjb/N+XFYuVTDjX4sLpGhe4UJ+ulL
	 ED+N5jOynK+yiX7YkQUaDFrznWQdMCRmhDDMmWVqmEM2lLjISe4cWIbhPRYYSbEZKHGDO
	 S7HpFNrNXl/PtM3mdiBo9LxN7kBRXH771s4FUCtU9piqBt+bNGgbZEikdiXltT0BUQEVP
	 psSCDZcTrKVmQIDvc1RRXcaHbMx889dRA5H6grgdAxrpxRVIDklGUhhcMhfa1UAlE+IfK
	 J73aQB6LeeZ8kQMbxNhWX+QWXuamuxTten3b1WDLFOg/0SfHOlwiH8cOcsWZ0jLvrpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Tg8j1xRa3B5jKF/z/asR4+mf9XmaFFqaFZTk8DOwBCg=;
	b=Nm3xBJv8ZIyPMD6H7SLiaim6GLdSld5LxTxF6f6kA7kUJV3SptcVR5f7QnmE/NqeGuBl
	 F75e0mDoE0nag8a+6+HHXyYSlEh0Nqs2KwCvxRdscfRwNchSIm0ZNTNlhp9Mf4LgItvYZ
	 FDgr3byHYAzH6hW3EWHAwoC6kWyoUc/t80j9exL7gRjUy3kwx75vd/JswFNS7w3gvaW4M
	 JS4Em3GfoyKB5aB4jaY0VpJgRIt9rLm8wxo7wfsqtpTjJKRBwfZNUkt9ZF08VKV3DmzJt
	 8xUM/YAjWngCrzGY744dd6HMz7ORnsDR5gHxji0duiBfP9+ICT9ZoSGkCBiFFFvfKyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DwNYLkRl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BscJYipT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661C560A3817
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 661C560A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DwNYLkRl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BscJYipT
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZVK74149291
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tg8j1xRa3B5jKF/z/asR4+mf9XmaFFqaFZTk8DOwBCg=; b=DwNYLkRlsh9N6pXg
	03ewC+yVYp4GxaDSNQKotyQKHLw1ua553XqXCPv0VOFi1D4LI4RmOStx3bmtzTOO
	AjsjG9pEgPMn7LAuaq82A4n6f/1SGI6EouWF7/F/oHWXODUP1rHumCPpU1kfYDzY
	d2oKOy6V5UTs6W6ISrJqC5cIJXvkZvWCTRV3Uzx/i+tJvSdBE5ZPvMiXJbhLPVYm
	hvKT+TcH/G4+8G6RGnkvJLmYTKj0/Tf+o5k8RWijWQwZDAsPHmojWWHLyx9hXSRb
	twbb5CFW4qcHZ0x2A93Ci20fh8KIX1wHdXo6bWSsDqZKceTj7xzYHghOakLC3pxB
	Zx5lSg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc61psh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:37:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so7639686eec.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458220; x=1795063020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tg8j1xRa3B5jKF/z/asR4+mf9XmaFFqaFZTk8DOwBCg=;
        b=BscJYipTG+/tYjY/U7CFwXAm6C8ZE0yX4EqxKj3hYbDIdyBGeX4t1tru1TgBEf1lFr
         wDJNvfnmsRXuikV4/XtgGHYbAtDZ0wC4GNuFM8BpsvP3NuYJcmWqjwH9y1fMtWFmVknU
         GUvjHI2Nne6smtdjp9YrsWMqdgVa57oPZWE7Q7hOfpbfWbWT2NxSeBQQBiyYvaP/2qUx
         c8s7phplMCEDLMCmj2UwXGvDDPjqQ3fKb2wfslRXTZ/f4kr9AzXza35GpYUHZm5xk43i
         Hiz+EKFtV2yJi+DdlRTbpYEEQQvkCG45wGAcT7MSnn3gLgGgdBTjgBKFgpAbXlmOd7kq
         2lKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458220; x=1795063020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tg8j1xRa3B5jKF/z/asR4+mf9XmaFFqaFZTk8DOwBCg=;
        b=IPYwaStJ64gKwR4fDRP8eL9o9VeZ4OYjuoUbtYKYAPFH6hhuGnMQo/xQHHzDDl76vE
         mTmWpJmQt7aj902rsPPdq1uwOpQy2FGroJHn/bYRVAo8hcIO8uauvI9sWUl3pkBkZOD+
         uLr9vKnfLcVg2p4vHJ+UiheOePlXba89XP3y/ci6jb+18A8ahneCtlqdMr332OizKEFE
         wUsMLXXAL3EsbcgL9+KhWnOzEkhSWRO2GtJHxmu5MMBqcfa1f5JsqDpHJZsWaWF/75yI
         uFslWbO5ET7l5N6ysNQIXJo6k3RRt7wkHIPvsd6vax4RA/L/XhWvgBDsXeEgqwjkwM8y
         L+2A==
X-Forwarded-Encrypted: i=1; AL+hErGN05UbNiXSHlhDZRxL5c6Opc96f5JTQLsyRNEuqYAuvua8d9gzE39XegQRxQ8iSWPZmJ00xyg1vU1h@vger.kernel.org
X-Gm-Message-State: APuU4Z9t+4cJV3vuFGonGDlGIoiYCONI0nwbWLntPW58xgvksF3vN6Lq
	bp4XV2bSkxp85e+2MGlQxRJOc7uV+wyycWGS+8in2gKK7/CEmrIIKOyiuaB0Bxt/fvIfAQIxa/l
	+ljB8O5dlwmm1/M1e1omy2RnvjbXPnqnx6z+JSWAq9YZQsxfFk6TTYhCJCiKI+lpA
X-Gm-Gg: AYBFou2LeBaiPvMaiP92/y20J2AuD0d3pS3afZw81L14HTV3nJlu1xIGCRNYfKuHzeT
	i3wI1i/Pmhj8fWw3r/SQ5/Xwd43CaO4zPUtwIQiTI8Ev4rtqe8XqGI028jOSst6uUNdXRdkhsP1
	7nBu0PGPQTzvk10uv9A8oGu2ofFkAQSw4SnJFQNuq7web2VivvApsnkkVQwtta4rEn4JB7biYND
	KYY011gwIQG/0KoSY2guglsavyRnPOQe2OLM9lWIqKXGjcGKAiIIqUZwNpgbiVUS/QgbbHfnjrt
	ZVZ26lOAVWDruk0FikTpQE2DjkIH3Lwu1L4M7GoknvY/m65dI5uVDqhJwWUpjGb1juYn4EREQLt
	8vq8duQ9WcJDsSmvrK6TAsXbx1xoRrmzR9A53VR+OGk1pjEnw7QYyGhlfUJx73fZMQ3iAl9F5yL
	oAuRdFOfMORtmNxz7KpY4Ya3uYjPHLpxNMGrm9wGCcKjUdP0GBxgKln52q2pBzrws7GnXamuWwG
	s+rkSc=
X-Received: by 2002:a05:7300:f54a:b0:375:894f:2524 with SMTP id 5a478bee46e88-3768579df96mr4642381eec.12.1794458220342;
        Wed, 11 Nov 2026 20:37:00 -0800 (PST)
X-Received: by 2002:a05:7300:f54a:b0:375:894f:2524 with SMTP id 5a478bee46e88-3768579df96mr4642361eec.12.1794458219611;
        Wed, 11 Nov 2026 20:36:59 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:59 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:27 +0530
Subject: [PATCH v9 08/11] arm64: dts: qcom: ipq5210: Enable the PWM block
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
Message-Id: <20261112-08-dts-v9-8-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 1gGrJHtzfXDkV-T6YzN23FG4uBFotEmy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX8GrXJtq1yXNA
 hwiaUur7NrM0ox57BMhnV6IFnHgS4q9aUU37BZguEqvQDhHEiTlB2qv85U9mC6uSYTchSBw+ZvX
 XmnV9hPV2DGIvfVjxIRzwuvk3Ern9JywNhJaRKmhg6C+4J1nkBkkimnSnbd7xfhaNn25t/d/6SA
 fw6QSE0NdWtG1vv8OPQipwx/BT5vfGAWx6TO+Vpit4qtKSLyLrAFrruYksq0ZLGeTCsK0JDLey5
 C62hT7Ehd3B2tDi8nyjmFbCNTl9/WXpPryh+7TTwlE1qg3gcPM2Lcc/xEP11vlGhvz7dlkvin2j
 MZp54pK+avgODsm8B/21gp+Ul1huOM5W/gLand+knUXRBWZpd9DKUJH0jQ40p4xPB3BrbDBtfdb
 zxEV3NNboW/UD5t76k6HOoTMoB2ZsPtw1N8jvXcrFPzlv6lsj9zEPfxlt1kRLJHBLOAzKj4dHgE
 cPLFb6MRvUQ6RRgWKPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX6+K2GdjBxd2f
 wXOwvYBSWrJPK+UvPBwYOYP/VheCKyzVjWxAr5n4OyXuquYZDL8pxZeKUcz88c6OrlURWrd99Or
 daAuJZ28YYWGuLedz2T4becy2yRXkOc=
X-Proofpoint-GUID: 1gGrJHtzfXDkV-T6YzN23FG4uBFotEmy
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5426d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Z1SsOzVGKYioKmY9djYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Describe and enable the PWM block on IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi               | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 02fb76283f7f..87a7e625a2a4 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -89,6 +89,11 @@ &pcie1_port0 {
 	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
 };
 
+&pwm {
+	pinctrl-0 = <&pwm_default_state>;
+	pinctrl-names = "default";
+};
+
 &qpic_nand {
 	pinctrl-0 = <&qpic_snand_default_state>;
 	pinctrl-names = "default";
@@ -167,6 +172,13 @@ pcie0_default_state: pcie0-default-state {
 		bias-pull-down;
 	};
 
+	pwm_default_state: pwm-default-state {
+		pins = "gpio11";
+		function = "pwm0";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
 	qpic_snand_default_state: qpic-snand-default-state {
 		data-pins {
 			pins = "gpio0", "gpio1", "gpio2", "gpio3";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index aa1045f20ed2..4cb9f399d480 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -431,6 +431,16 @@ tcsr: syscon@1937000 {
 			reg = <0x0 0x01937000 0x0 0x2b000>;
 		};
 
+		pwm: pwm@1941010 {
+			compatible = "qcom,ipq5210-pwm", "qcom,ipq6018-pwm";
+			reg = <0x0 0x01941010 0x0 0x20>;
+			clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clock-rates = <100000000>;
+			#pwm-cells = <3>;
+			status = "okay";
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1

