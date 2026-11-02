Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616169;
	b=GbkevDes/jSp7lBUtUk7SVRUHq8+Nq0c8FdpulGOVGCOInBlvsXH9IIbfLkpMrSCZ9Rr
	 iI9I8mMD3Lw0UJEd2hM+OJ6lSdPxvaKJNizjdEYdDhq12kysjIpNSRtfxwGIrt6neCSJ0
	 LobGVa4q0UnAI5WCczuzhogxnOdoSB5/N8CJB5zBmpboct4G2nLkoaMbp54kkV8v7QNHM
	 iNXGBlc7c4YczcUNY6pfABHd1QxLVMKP1wAtqXTrviM2ziMTLpk0KvyAzYI3zZAibGl5u
	 gbl7VEb2b7Jzsvh9Kn4fVDZAzuTODSE7RoSaN035OXbqSK9XxPAPThkG2ucD6j0rGwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616169;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WFSkmzhU6ZfcsWYrD7wTmAX1CjLb9zWXMvg6Mo14xU4=;
	b=XqGulGhAGl43pzBylPy3zMbF1wA/bAgmw5zcC2z5h1ZxXljff5FTDt/xvTJABpZQk/wH
	 XK0x4S//TclL49sZToNjVOgMN26lvFXcQtWcYerHg0XaPZ8HS4Ps5dXKIV5DTLU/VE1ms
	 4xsdBOGgymoZbxSiyCBSbygeBqMEsaZMNq1YAl+x7zfuKGqMDeOEbHax5/m70bbedME1d
	 Of1mW41eSdEu1m3dLjvKo2GDuGq894DMZhxUx7vEErv4bjen3RZeN32sJAMoyWJPHXrDE
	 RpEbP/n9yOh+TyZx40APdVRKqTBGTY/xB4Ml6HcW5rE7N/LdvNpUpl4serfEy1f5Jaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cn5HKJch;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HuNUEXFI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519EE606A860
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 519EE606A860
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cn5HKJch;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HuNUEXFI
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A2DW2466164
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 10:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFSkmzhU6ZfcsWYrD7wTmAX1CjLb9zWXMvg6Mo14xU4=; b=cn5HKJchFxnD2Pb3
	abSbABmjYOkN3fOGFff63kYAWGD68+t3hx9kIbyiCSyrHtNkQAmm0RSn0VXCKdi6
	q55s+pVoDqdKMKbmX7YxIn63fcSWLZRPvFZLWtvHkLBFcPhANL7b/G4TaZhTkTuh
	Ukeu5LaJXSGGEOU7lLtnyJ4raYvxyY5fHbBg+aYEtyGFkp1OWlktO40gzKYdQQ85
	9a2WlhR0pFbYsZXth3Z57uoThPwgOdH5A2/u+zIK9jgHSZyvwqCu2tjYOuk5+hAo
	J29UO62luPIJZE/NnTzo3BHjXudEVKzQ4T+Pn+gEeGeIK8HskTmqiLpccbhHuyS0
	8cZPcw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhcn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 10:42:47 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-54dbbf252cdso4299761b6e.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 02:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616166; x=1794220966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFSkmzhU6ZfcsWYrD7wTmAX1CjLb9zWXMvg6Mo14xU4=;
        b=HuNUEXFIvM0nrdaNNLZwxSR2+KktEwiFpBnFE7jqzvqyjlgxFLAr11EtDqJiFGS62k
         K2y+GYC02cURoRbbBGWL5uolqOuY6AyQwgBRWtBuXaDYQY70vdm+mzGGjGm45gDOkavh
         ycVh77HURppRBhThcCIN3bJIEcDs68QDP53TvrR+r0k8y1vXj2p7s0CwQqKirCUD0Oe1
         FMZd6fbPKg7+B7aGJI39buzUsezfJ263RseYYqHe7jSszazHxlLa1ENtVhdFnkolxxCt
         U+TNqBt0Idl8rbh3IC0EI0gJmHGKmW+UnIB6s27LJ9fzt2hJsLZu6+3hyi4Tz6R9fjuQ
         n/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616166; x=1794220966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFSkmzhU6ZfcsWYrD7wTmAX1CjLb9zWXMvg6Mo14xU4=;
        b=V7PSKLSemzZExRJuiyVo0elKcOZ8czCU5lCaFXTb3u5VnM1+0NpDpfkwd5YRxTS+oF
         /i9kSLI/j+44XALmZL2VZXgHAahVrIxyY1gJP2EnNlBRcsLxCePF0j3srXbmAGcVagzW
         uciaLnktM+jvcdI7pRuhbK+Y94hGR0eRMgOYybCWQAdJETXuPxFvtpFZtZTSkHDXeLsY
         zgdQXDwAzC7khMz4Uss+hUFSq/yVZpuR6dZoYwNM7zhDhCS/kZgP9oZ6GppLjHgoJXx/
         r1EhJ2ItBBPjl/4fKOYS2qvdvrfpYm+CwPHe7gEru8L6tFscsTM911oJ7TrpApOv1NHr
         JlgA==
X-Forwarded-Encrypted: i=1; AKwUvBxHv0MzJvlM6PseWvAI54BK7QsjcMGpSKByZmARYWnt8nFTZOYlxWkTG+T4+Tr3DKP94FvxN6Yae/kz@vger.kernel.org
X-Gm-Message-State: AFq9FYJvI8srAqSTjc3WaS9g/bDxK/Npd3i2mgrTtjH+GbEXJbzE6Abz
	PZTtQmQ6NE3zl3Coz43+YQxqSK8QL4s1RDCRa4Q7A4+ciDgeQ7jmrhclKylsiznQPtAVGsXm07r
	gauIxFHaaxW7oeJ0AJ+t2+DuFWQhh8XEY0YcZlBaEQacV0Mw66WYy+0iVjVEFHOww
X-Gm-Gg: AYBFou0HFiGT6AfcG/yCN6zmv22Jl0n9aVEvwoyJu1xBggD+n/9uoOHYdmeWUTljRUb
	QvXX0ikJZCXiZS+d+VJOiJUgGVABUL7dHt7M5X6q0YAezxsGh9JdtCnUTc54pA+JwcdJj7w1xU2
	b1a9AG2v9uVoNCDUCyGXHaAyLUEaTLOUulGLwub8tKhldOeguAwcOqnCDcePECGOeRcp+w8yZMB
	nW0HNA7vcwb3VbGIMYALjwID080NXWv2jCi/QnSAmjD79VB3XRPyIbpHvxyHHHsBaArKyfoBzMl
	19CB7Od9+YnLZQYgDgTih/7aZu/tKar05zc9sI8dsUU9iHj+H6tgKLBDhieHYsAFf57aUK07nNM
	4Byj7YVFmeAg85MMJMW1dPJ4mRXeGWH5CZJpzlon8sDhUeunFQhM6hYblpLRZ9k8KjhXzcwad5f
	rMHNZHbyQPm0Ptve+UpeV44Jg0BL8Z9AfxQrwuyzjLRV+psWOid9AjvohUtkk=
X-Received: by 2002:a05:6808:244d:b0:532:4867:8916 with SMTP id 5614622812f47-5640d9277famr6043857b6e.4.1793616165675;
        Mon, 02 Nov 2026 02:42:45 -0800 (PST)
X-Received: by 2002:a05:6808:244d:b0:532:4867:8916 with SMTP id 5614622812f47-5640d9277famr6043848b6e.4.1793616165250;
        Mon, 02 Nov 2026 02:42:45 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:44 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:23 -0800
Subject: [PATCH v24 15/15] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
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
Message-Id: <20261102-kaanapali-camss-v24-15-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: _c3XgU3p-hrSxKvBAODYMk18uPkfW-LE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXwb4UlaKl93bE
 Q9qDqJssKBDlkAodjPx3iHHVGpfY5KdW5WsLo1zlC15Q4dtSK5soAhwymduH0q14Mf+4g+t6P2k
 lj7p9Ux7icXm3dlpF00CJy1DfGF8ctNuZ3S1dQDOsWIxuMOrKMgl1DiZ/nBHxUiSjd7nHgQzSpD
 Q+meLo5bzNcGC6w8gM3/LwARS9jAr4vUrmEYJLEXjQJATcxjWV07YBZUxmAbXj4X8MaLm9s1tAY
 PtougLsNGJglizIMfAOMvXWtMmeXYnTcFdBS5phCbM6/StZT8XodSi5YflMCTNfwZl+kF4Mx1Io
 ezw91/CNFfQnq+52lOabVidlCqOXslDcRmthh8r8I26Ei1Mt34HieFVYTEXtVfYGvXpU4PIVt+i
 yZ7dPD0u636d1XWFaZSDimT3mZPqxnHhEcY24eLqi6PzypJ0RSp+gGVDEnpB45Sm4Qryk+UAleq
 /5UkKOunaG6HjQhlr2Q==
X-Proofpoint-GUID: _c3XgU3p-hrSxKvBAODYMk18uPkfW-LE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXzVr9Byrq8/QS
 fgGSWdFw7s052sTSV79TqPEVX85Ap1OlYU15E/cxxqPSuR7dCJmiaKJ09cw2aibzM1f9/C3SFzV
 NhCEEEP26lshyJ/v6BfbeeC5sb91APo=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae86927 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=azXR8Rw6a_W_3m1MFLIA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.

The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
lane mode on a rework camera module.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
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

