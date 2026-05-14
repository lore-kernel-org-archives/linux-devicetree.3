Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD9B410D23
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768942; cv=none; b=LUqmGLPCkcw9Ff18xtOse9yICzJX/ugvsSG/7relx+XhXFSKrMqOSK8Okg9R6hgoVrEm2lsakjGcwsESCj1lILngz/jYGag2saV1ZkxHqUb7jzCyDLo4dEgFI4oofiKFAGuD1cdWjPVDC9uTeGbf5RMrmeBHXgZZb+Y79y5OW/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768942; c=relaxed/simple;
	bh=0UqGJToy0TBXJ6WPFU7lKlAFIhpopdAI0eFI74nJSqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eNvS29hs+mhxLtWdgVQ+3UoyIHfJKgsu491ZY/DwDV8r1CZjeNaF9q+AaTNThMrTB7hZZvT9m1owwxq8z6wBhaxShG509VDLIQZZROGSQ7X7ZWHC+K/NS6DpUOOWMWoalfmHPxpy7VmM6stfRGV6F0ry8gP7ADpyDQrfsp+5z6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QeQM63iu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQ9SbyOZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QeQM63iu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KQ9SbyOZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeRwt2713163
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTNot2G6UXK9KjvKbPaeqUks8bb1J/oblGSXDP2sQRQ=; b=QeQM63iuLk/7LG7Z
	M4Kp+xld3oR+w1BZnykV7HZRxxUscupSqZWv+NxtomStZgmTLEQbV/Juf8JezgDY
	DR/VvbfEebXjbFVtGyih5I0zB1GzYG3v90Z8Z4kojHxRv7nIKqMRS/XUu+NWwkLh
	7LBaeLZx8HkF+1WxfMypBu+WCdi6fpDu3TvOtPJpx/Sre9RCmTatPUJc9OJKs7A/
	wGyFnlv838TVpKzz0wbYHh9ltETQq0F4c1XdTa76/YdtCqsyVMYkE//dPoKsoTtt
	2Y2MVpBGnMirHmLDL4XVGWp42GkRv9Y1fBXzpnWR7J7wVh8AVkpjQYL+H/mSeLSE
	56VYUA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v89pqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:29:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc7f9b2213so44327745ad.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 07:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768940; x=1779373740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTNot2G6UXK9KjvKbPaeqUks8bb1J/oblGSXDP2sQRQ=;
        b=KQ9SbyOZ0hSJmFobCdfHsqggcT38FotnsswP4MMGCCp9uqNfVcfgF5F4ved/eXJ0Sf
         yVZIJYqRgqHNA6RJN+LuG7yHQfGqisoIvZV5RxVu4+VKpA3rdKE8FdWV1559WLf7lCnU
         xwmqHThzupb01p2tjQIMOfdBI29vncp8oFjy0MAHsnqmh8DF5ptFx1BufUM+dvh60wrv
         ze1meLkGWRtL8sXszt9Wi7OgskwGsU+38Gj09DLz0SB+ft/axrOExS/WL6tfjRdFJnD4
         lRs0hnOld+3H1yXKcrfL6TgHjpqQ+pRR5gyHOfH6cj35702oIFzsZYlLkXTI/WtLPbHD
         zYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768940; x=1779373740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oTNot2G6UXK9KjvKbPaeqUks8bb1J/oblGSXDP2sQRQ=;
        b=otiyCFUGnkleSEZWVP4sPcpwYIjcZIZ919GejE82yvRqb4qN2A7jLeFJgJOWJeh/qr
         /DmvOKhJ2ENeDRMSB6FS12K6oJUMM3XIL1NzABtIPFbzbMXgqy7zcsQ14wuHZAobREMs
         tu+9hnenfKGplDK101IVuv0HaVKD65XA7FDT4taim1Ts1o68Tr4zOt6DpK+VgbuDamb7
         n5I+std7pXXgWPcfHkcQDlq5OsPcMulo+8J9dW2a7pJHGhCJKsez4EeKEVJleq2L8crv
         4M+iCYVSVrq5m4oCH122eOdQhlZ+eMdZ9QW1dJiwdZyvHssnjPnACg4lGDWS4fCeDQ5B
         7j2g==
X-Forwarded-Encrypted: i=1; AFNElJ+HX9vet3YwqqPuGDcBKjg1oFPHKfItKsO7DcukmN4s7/EEGMyEeEA2l+JSjLwvpwMMBr7eUd0JZzhq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7M40xruiHjXRZLyaD0aLnx9grPRncKbqCCIWA/iukVw4E97SI
	yDHNxB5g1eOwCCFHvsxzG8FYJw8EoG6NfkRMBE4XuUUIf02b42UL4X57NPAyea2BG1dvdPy3Gqi
	TnrYAhIs5btL9IF4m57BIC/9d9MfeiHuZ+iXY6uueEQgPzTYTCK9GkfOhdjauUvLK
X-Gm-Gg: Acq92OHesaUAQjsXXjOIiY7pi7fVWn0cxknaEPKbnvIexlvEHL90jnjA2o9irXn27Db
	I/qr+vWk164Tfx6quT6gppnMLYo3kG5XsnKnj9gGJz+l2i5TeLe+DRoI3n/RUAtmAO2zp8hVjtH
	hYVVZnLZaOfBN/FZBTCmi72ojvoHZ5z27ZQQjAhE9eW/G8XKh29WyBMeUOoqPkwmaN6S8Y6GEBq
	rVWLsFYKHpJpNmTN0n7n2nxiyp+eRBRlIdJRZQvlxHSkq80LuRvDR6jl2yvn69qFXQS0Nbv9BA6
	LwjpEvpOQv70PZbWhISKcpbe05+mfjsKpnPHbFNem9aPxbXEcQ2uUsn9E13k4shagxLu17SeBRf
	sZjhvPtWCyPGDae8pM2YJD3DB0lWA26PciLFxHwPVFuv2GePmUbiVNvm9og==
X-Received: by 2002:a17:903:247:b0:2ba:1202:4fa8 with SMTP id d9443c01a7336-2bd27291ba0mr83863585ad.20.1778768940031;
        Thu, 14 May 2026 07:29:00 -0700 (PDT)
X-Received: by 2002:a17:903:247:b0:2ba:1202:4fa8 with SMTP id d9443c01a7336-2bd27291ba0mr83862895ad.20.1778768939331;
        Thu, 14 May 2026 07:28:59 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:28:59 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:53 +0530
Subject: [PATCH v22 12/13] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-12-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=2244;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=0UqGJToy0TBXJ6WPFU7lKlAFIhpopdAI0eFI74nJSqM=;
 b=mc2n32EA1551rOvh7McfKD4VQShAaZJi6Mm1+QyG4LG1g9r/Pp6mbhT0nsgCYpFPHBED8gDSD
 4eBSLKFcKEXCJfpEeyPgXtkIksK8OgGl2nUJzAaCxihw4VD+s4uRJlb
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfXySyIcXdSQSLR
 Flig7axSZbeqXO/GpJbTmLvBNEFJArZyVozZ8gnnAoFppeVWjYZHm27eDbUl9mckxUkqsGo1Vj5
 1d8UgXcmPE8rtwuRrlkdksk4tJC0oOCh5eoOJ9MShQOQDm4u8DanJY5Qkg3s+JJ0eXqulOj7jBV
 njEvakp0jJYo9qCX/d6TLsHNUcianVeKEUfP8P3Lv9HcPso+RXAv7aRNDS8mIXdzObC2yTJCEcZ
 Xrz9dQvX0zKByqXn2031K2op3P7bF75HYkPi4zNQ72bKl/K5aYOZSY1j7W9bK4liic6QHNmkbf4
 bf8aksyv/jAJr11zUWANcw7uprX62yr+VqlXA/FJWxnBKyUcrQuEEJuADz/ylyIxVPybj+cZbhD
 2HmbNLaOVQLx3jXIYKnxIKDdSxnx8IN236/WQ1lU78y1qTTIkjbVhuiAwEeC8rcTNLUdDnw38e+
 ypklvqKoNhCOVmCiggQ==
X-Proofpoint-GUID: VeHb-Px4epLV5ofRMyiVvKrrsnSCNzEC
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a05dc2c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: VeHb-Px4epLV5ofRMyiVvKrrsnSCNzEC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146

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
index 9d17ef7d2caf130564efc2d0159ac0de39126e80..df668dbf2bc60175c36cabfa310aff625647899e 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -661,6 +661,13 @@ usb2_id: usb2-id-state {
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
index 7b1d57460f1e6953acc7fa06d22a1f83ab24edb0..da675f7a8f2d83f3598a6a7ad71a99206213d03c 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -674,7 +674,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d821ca88a38ac59a78625707850bb5d..3ab5ae3124ed5314f04202b6b247fbbbef665053 100644
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

