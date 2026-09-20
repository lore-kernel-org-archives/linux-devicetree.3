Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F1F3CC7EA
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 11:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789902682; cv=none; b=DAoj1H3WL3eUGEeiq60whVxDX+uFn8WWZjGlbDwnC8QjQlGUWtSGkKFADg1vbJNJGrwAHKcf63nebSYOhO+EQUKkX5MUJ+lTMyZTqm0N49jIQkMwlHKdIblcBycKfXw8aE9V8bjffo07Y7x9wimkaS0waI2JP8Dwm6nTO0KZ2qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789902682; c=relaxed/simple;
	bh=rwZUfoEKoNiiSz7O8dy9jN6tBP8Ev5S4h049+Sk6wig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nCOsYL+rCfJCp6rPHaWnC7nhB6Fe6eGrt1rWPJ2Vxpyn7PGwQ6CGz1m+LiDZgC0rUcahP9nkI2FJvMFLVHPqPsiAs2NFIsghyYhbrIuTTSYb2DxQ3FhyEbXAccbWjJnoE6da4+fITdZ90t1gKT6AEotw8KjMsvt0i9QUu2NRe8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lCS3d6to; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTq5kgxJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lCS3d6to";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTq5kgxJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8WdJc2514796
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 11:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C4RGaHpvywHljUFxyaizgM
	YtcxEyrGcBtuZq/uHfoVs=; b=lCS3d6toZBiY4SWQu5T54qG9WASvMK5DKXy+tO
	QsrvvGTHx1kwtwofJVoftyLRbRH5sShOGVXEBzN8y87oQ7hcj5pTEF+5/9MoBNfb
	fnjBlOMsW8MWCxVBOYBbOQRnr3JKiRz11DMbG2PrmC7GT2u8V+azN/nR4UXx8UsI
	IDEDNjrcRUCiLTUk1Wszbn8MkLs82umbSO099uuWKxZrbeTQ/EGMqoM2ZaSGb3yj
	TKBMOLK2iEO9W7txCqKIwdp2rwG79vkAc0PnkLMYcFsOstaz7ri0WWcfO0ktIYUt
	g9JXRTF+jkSMlhlVknjxvVSt5qxpkbdup9fwK/DFwqMw4+rw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshyxtw2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 11:11:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939d6c515deso461342685a.3
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 04:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789902679; x=1790507479; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C4RGaHpvywHljUFxyaizgMYtcxEyrGcBtuZq/uHfoVs=;
        b=CTq5kgxJ+Y4KzU8dCfRkIg0fWk9MQ3T9izZ5lZ4X30TRfpVHPp8owkMHGaCIQ/ayR9
         HEhemVO7/+wQYaWly2+7+B07c++1BInqrDGytGE9HDkMWBdD7PcQPjGCrtGbGQEXbLY4
         KlnCmdWl0ComyKxJAUDuQpD5QVbbZ4LTj4z6c0CSmMt7rLVGgulGA2EyCJmSHkBfw5tK
         g49s61+eXLXNsGRkZzye64VsC9pIS9QTyzcSmgcRqmI5HkvtK3VMqEV6bUkyEW248noC
         YhYRNyJx+zzx5CajrlZkUFV2Pub67KWOdryz7BOKaSP0vu434dncUKgWzNxAwyN4mxaJ
         6UsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789902679; x=1790507479;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C4RGaHpvywHljUFxyaizgMYtcxEyrGcBtuZq/uHfoVs=;
        b=couAD+bcq1I/YlgoHsuW2H1Jjx5Mfcqf2f5HJ8iKhobkd5MMsdD84QSEy25qk66dpa
         yF6rvxOgGlRopi4cZ2Gu91t3/YlPyOKLczpGeisfV3yLs4GDYGpghUtQhJu2TVNQ+CNF
         RXfnKifo03m9kq7d73JXq6m87oU4YgY3fdI1E8z9G+f99yyGO29HmJ08hGLX4d1r/G5c
         jnftuA7hU2feiGkC7SS07NjFq6IjO7+YLaFiF5tBBHVUn5a9wiy2AU5t11tAk2Fr0fuW
         ypPg3oFuHNCs1oyv2LBbuYeDBj1ONAVMMNBoWpAg+XQ4yyKG8kiDemPUq8BO5I8mWZ0s
         j2Ug==
X-Forwarded-Encrypted: i=1; AKwUvBwYoU7F1dAfKPpJNS8hpWWiDtQMd2M0nuIfsVsPEM6ioNZXJJs1lSjTYYNJngWGJ5jHAg3Ad25Idyo/@vger.kernel.org
X-Gm-Message-State: AFuF++nyociGM/P9XxKEFih0bWrO94y5HCZcsX8fGYyrR3heqYz/O4tu
	D4DZKND3+jYomD6fDXUxTW+p+cXAqDZhHtQPdOZ8RJMIfbaEDWyBgnHSaeYXHDvzof9l0bXRnON
	nC2Aaj6r90UPX5/g8Wbsjs342A8J171wBy/ycfnypPLOcYUEuOWyEDUbeJb1y6Bjv
X-Gm-Gg: AYBFou0s55gHaJJiG7CXY5C2IAku7nBFkFAz5gF5FoTOmgAOlVaugmj0kA/5FUrcquc
	1+XyghBaPCjh4+7uhpRmVoqUgnj361Uu8tcFOWenJWKyAujs+HcbG3DprhBncycuNU3xosjZnz5
	8LhHCApI4N1t2I1M4bSP+4QvUBQ29+368YaG/6OWhAC2f1hAAHBQV+GdF2RAn0ePgz6ZBMzfyI1
	a37yw6QERrMuQgSj0FpP0/APi3+BF1ZQ2UXvMmwZ+qSq94xy9CDIuLF/9NDsacHIbbHf2Q1u002
	Y1vmxg4rvnR6erBs26BEExKPyOaedfs5QAzuq24XK1NwR+GEj9sHigPPDv3NqLu5NzRuciO+vuW
	/KHgmI1nBHtUCWnHx+MLtPzpqw8teh7oMSKZlhA/Cu1z891RWxsUduAaVL+B+rDO74mgznackED
	r/+Pqf9uN0JzgG
X-Received: by 2002:a05:620a:27d4:b0:939:f188:6d97 with SMTP id af79cd13be357-93bf56eadd5mr525402585a.48.1789902678718;
        Sun, 20 Sep 2026 04:11:18 -0700 (PDT)
X-Received: by 2002:a05:620a:27d4:b0:939:f188:6d97 with SMTP id af79cd13be357-93bf56eadd5mr525399485a.48.1789902678095;
        Sun, 20 Sep 2026 04:11:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a60764949asm12859501fa.35.2026.09.20.04.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 04:11:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 14:11:09 +0300
Subject: [PATCH] arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535
 interrupt pin
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-ifc6560-adv-v1-1-89b1435d00c2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEy/r2oC/yXMQQ5AMBBA0avIrDUZExpcRSy0HYwF0iIScXfF8
 i3+vyCwFw5QJxd4PiTIMkdkaQJ27OaBlbhoICSNFaGS3upCo+rcoUzJLqOcEEsDsVg993J+t6b
 9HXYzsd3eBdz3A4nA7w1vAAAA
X-Change-ID: 20260920-ifc6560-adv-b8ed1242008b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2165;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rwZUfoEKoNiiSz7O8dy9jN6tBP8Ev5S4h049+Sk6wig=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr79TryCo9hBKlbmGNCJn6IAdMOaZX5wCbQM5M
 IPPSCaHBW6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq+/UwAKCRCLPIo+Aiko
 1QJFB/9VCzdKKD4YyUsJBGfC8NUqaIiCLjR7zHPqt8PuGqzwyWXdXDatuKXnxqw/+N3+rxeeaHA
 HgZzC/ePgB5QoJAPo/WcxanJjntvmele+AHsnCR0naSHrsYtGHcfzU9SZpXwnmYxYnQ4SVOuepq
 73q1aH46CZmXXRakrsTahPSn8BGueC4IQuwhjsIdvDX4PfQ+tbSlGVxukb3C6gr+RbdSeStRDD2
 HXppyN5t3nsBsaAlvcWLAiCzS+Q+3ey+HtUj/HROweV6pE5RVKQnQJrczU1l+rcW44RUK0kFtOu
 23J9UYJIqMYFuXELNjdnvNt3FB+OFXfTimR5HnNqaANuvGFs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=PaRqFShd c=1 sm=1 tr=0 ts=6aafbf57 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=JDyqL9-wDnDoAeLICTYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDE2MSBTYWx0ZWRfXw1ceLYQm0d/U
 7DEIPPLMbBeh9ra0FsBfzfTN/FoFfgOAp4AeuyEqahxP/pO8DmjnVo45CN01h8pqJ3qJyDamfPX
 rawyb1Owy4rKX0a7/y0RMEQeEgA/ac8=
X-Proofpoint-GUID: Sbfa6A6-6TxQQ9UUUaqw9P57EjmqcwGw
X-Proofpoint-ORIG-GUID: Sbfa6A6-6TxQQ9UUUaqw9P57EjmqcwGw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDE2MSBTYWx0ZWRfXxzxEKMFxaKqE
 7KAiSIuKZIqiJyDrOfXaYWshoNMNHSwS1veBnpx3Z/6bYyoJkcGsa6Y3RfW8GQ3Gtpk5Cpdcpsy
 KO7/HCasEUPDKgh5tnwuiSRuwWr5VZ5vj5tIAhrpMl9cvMS1kx0Y+kwQv2n9kKFZf0lkbVu7LOm
 mCk9tDrMTdLuu0xN8tiTRSwYi+fwRVi7wGHmKUT6KHFnMWSIcmmbY2EgrlbmWPHvXlUVJ7QulFe
 OwpRKp2pOtx7Y8dZeiGNefjp4uyrY5fKsS6bG8c3pIh53dg6+eWQRPKKGlF1pz4cye/qD4y15jO
 8tPIFVyqb7NNEbbcE7yAhlLtgZoRXiR5tWePrlsiOHJlbOCDlZnqgGEUiCdglxjGxzGeeccBQz5
 t1UQ1jSm6nVc/GPAYFDxEMzvdoeD+9CBOjnSkQUAeYd8Px5W4glPxHn1UO7UmJF9CAiJ8Pmuz5+
 NZYRi/AWB878hO57w0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200161

Probing the ADV7535 HDMI bridge fails on the IFC6560:

  gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
  gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): unable to lock HW IRQ 10 for IRQ

The bridge's interrupt line is PM660L GPIO11, but the board never
configures that pad. pmic_gpio_populate() reads back the state left by
the bootloader, which is PMIC_GPIO_MODE_DIGITAL_OUTPUT, so
pmic_gpio_get_direction() reports GPIO_LINE_DIRECTION_OUT and
gpiochip_lock_as_irq() refuses the line. Requesting the interrupt then
fails and the bridge does not probe.

Add a default pinctrl state switching the pad to digital input, applied
by pinctrl_bind_pins() before the driver requests the interrupt. The
ADV7535 INT pin is open-drain and pulled up on the board, so leave the
internal bias disabled.

Fixes: 34279d6e3f32 ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
index 9e14f53b552e..fdedae49d1d0 100644
--- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
+++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
@@ -170,6 +170,9 @@ adv7533: hdmi@39 {
 		interrupt-parent = <&pm660l_gpios>;
 		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
 
+		pinctrl-0 = <&adv7533_int_default>;
+		pinctrl-names = "default";
+
 		clocks = <&rpmcc RPM_SMD_BB_CLK2>;
 		clock-names = "cec";
 		/*
@@ -285,6 +288,16 @@ sw_ctrl_default: sw-ctrl-default-state {
 	};
 };
 
+&pm660l_gpios {
+	adv7533_int_default: adv7533-int-default-state {
+		pins = "gpio11";
+		function = "normal";
+
+		input-enable;
+		bias-disable;
+	};
+};
+
 &qusb2phy0 {
 	status = "okay";
 

---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260920-ifc6560-adv-b8ed1242008b

Best regards,
--  
With best wishes
Dmitry

