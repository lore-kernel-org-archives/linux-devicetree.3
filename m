Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB5B331EDD
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790720321; cv=none; b=OlLTgm1liZTd87n/9zCCqKEyd/Xja4hkl0VanTnLkF1+CucwCEiMFuvj1StNLhFSu6ONJaLKCrmusclWS9vD5/fELGe/f7FUsonQxoemi4eDdKD9YQmZxSNMfuEKSxxEh5GEpTbnq205JKmur25AcLDoLiL6BsoagxR3KAOK1L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790720321; c=relaxed/simple;
	bh=J4b+GKjO/Lbw4R22A0b7OR3pelE7+QQgjwtjKhaWb4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rlcWKLx4qVDwVF3r8CT9QYWOEWWwACCu8mkYUMPAX9S3UWmIAjBvh7DGmAgX+u8RgzGI3iTVUB87LQI13y7BZ/dvYuAK1NqEWPwIRuTSeE6oG459waeW1kqgZ7rVDqxySILs4uxka4hORLoZ3JO97HBhuqbkBz4qhfXZYw9QBYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVUSA1fL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fbfYYU3C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVUSA1fL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fbfYYU3C"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TJFrmr128756
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WTHmeXQxf6a6kunqjH4I4wkiYejtrLAs9GV
	LWcjlRaI=; b=PVUSA1fLaztdZoR835bo+pXXe4/+P5tCbL/Psk+mpA/Wjr1GZOD
	4EyxnieRP+2XC2GUUTPTgD6A17tTx8m3CTdaq6jSP8o/HEzMps6pkgdDZjCy3vrc
	cx4VpiuAOzLhD94D/22D9QfkmWQIAKWV2sDqBjQkYiTqMxJNTlTioNCQfpF1EYlw
	min1bNsg6BmNCO4KmpbQ70MMYQGGTDpf2gdwSBo7wgzvyJ4UaoIypuRalKFjtdbv
	uklMYCa4G2t6X5jjIhTF1zKXVkZsS8CpuLPCySbqox/iojSRX6w6FZvjAVR5E7FL
	I1BvLcd+sLeB236zNEksI+o10Lldow6facg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0eswj33t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:18:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936708f129aso944372585a.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790720318; x=1791325118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WTHmeXQxf6a6kunqjH4I4wkiYejtrLAs9GVLWcjlRaI=;
        b=fbfYYU3CG7/pHecFqUHJKzs2iZ2BDWYxjtoFPu4r0Vf9dp/iMcGLfG7IOpfh0hsL6C
         b2SsEdffsWqBWo3N1jDzEh80Coxy6GenH+rHq7PGkWJyjwwmzDSUGvGg71DHl0gk0KJN
         ziaWNAUR4VnPJP69lRdhVD5jd44mVyxR7yGb+VPntHSK/fd0PfWSZjI1jkBqAaIXltnx
         PL1YaRkMRbLIcSceir5vlWKuUnKkpJcfjlCRXjSe12DCxQwKILlkzQgkT8W54ZPwQ1TR
         3DvF/u/p2u41F1hhDf885SsEhrcmKkbNXo2fC/LIvGQ/aQE7XbGVterUskKF/3edY8FE
         u23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790720318; x=1791325118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTHmeXQxf6a6kunqjH4I4wkiYejtrLAs9GVLWcjlRaI=;
        b=nSPZMvc97Eg80fro+SRoZIqR8GjxQPbEhasUpqSyhXWAOYtrvKhiqIc/0bOS7WVAg6
         z3/XgtLMJNBGMKfz8aBMvpCrs1CjmfnseC4tGWr/RXV1qEKMbwxtXvZEiHim4HCgQJ32
         sy8Jy4m9tkk0ML4wqf/vvrcTt3NJo78SK7otU55yhHJlf5kg8zEpJCL793fW0AJpPu9D
         VSK0qHW8ATjgNr/hh1EL4fn9oHYv4uMoLp4FNELCWOmu2Vh7L3HK7mX4XFYx1tIdKL1s
         fDhAeQi5bYuyMVsfh73K5PNtWM2EPWnIV5gxSGhdMnLtoOhMrTQrwtgpo9iCGNfX1evQ
         j2eg==
X-Forwarded-Encrypted: i=1; AKwUvByCb9sYEEEnZy0wRb5GJcYigir352y5mGQdtSuh+zNb2Oru9uYOYkVg7q7x/IL2gwCPnlQ99Ybcdzx+@vger.kernel.org
X-Gm-Message-State: AFuF++lpHhzC9tZUrarPh9OIL4unVCl10OEYEZ7Vrodobif90WDa0wOT
	E6uK+71ujpB8KZ+zROaHmp9SmxWE4NyBpzKPMDTgRXnPJzqcP8tgHui8zmnxuD+ySJ3eWPlp2e1
	+ufgbO8RqwEtPC+kmVBjgRBc36QD+bbliwS+8C3FINmsgOlw0dkS8XtpnI33qDSbn
X-Gm-Gg: AYBFou0/cE0yTsuPJaZdjNtTJr05zGPFZlXtT6Vvcah5TR3MCD92XXTJGgozKGj5uMK
	Hz8rclcq7RA9i6AzsG+1dOnVkyHm+wXtC4El9oLvVM9w3dBElvtqWaglia6t11N8gPIwZkT+sUZ
	jNMUj6W9ypB9O3ujDMB8xq57qf1Nq40YOhL85VAcEA9E2QaVx1/Eel2YDz6VyoSoxTx7FiKItvy
	E3Xv+MXnzW7knJFAO05WQ1wRabkhaSklG26emqy+W1yedx92eDtRcTlECZSmyy9l9lbQ02YcNLf
	/p2SSMiKf80NUhGrqSvySLdWIx3fCiyX99Q/kkNjalerfjlFbaXIlB796LF0Oil0eeKz7maQ3nA
	ZGjCd7TpxU39A
X-Received: by 2002:a05:620a:2793:b0:93c:8f50:8c65 with SMTP id af79cd13be357-93c9f99159cmr185636985a.64.1790720318071;
        Tue, 29 Sep 2026 15:18:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2793:b0:93c:8f50:8c65 with SMTP id af79cd13be357-93c9f99159cmr185630985a.64.1790720317400;
        Tue, 29 Sep 2026 15:18:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014f77b7csm16981525e9.8.2026.09.29.15.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:18:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: Lenovo ThinkPad T14s Gen 7 (Mahua) support
Date: Tue, 29 Sep 2026 23:18:18 +0100
Message-ID: <20260929221821.505551-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4OCBTYWx0ZWRfX5tCWn1suTanp
 vHJhW5QCFQGW9XmkKi/GROOZWLbmjkxR1L+IrWbDRmqEYAHMgJZ2YOA+QPVsixMkGYxWPAlGOvD
 oNO5QzfDNEIRswx/Y3INzOwy6EiWa1FyAQcAPBEeZjxio56bErNt1KIoh3La5VIw+nLnep+n9O1
 04z62BGpjuz0Ogw9Lzd/+RAwUDOPSxjhJi1M5KM7U7u+sidI2jQ+mF+fDOiAY5d/AbQXMnrvGba
 7P0N9XnL43jNwGm3Mrub8e0iWXXIZLAnqtAZLSL6y5jtkFGvEToQy8miVAjRGlEGFRld1/WrKDn
 hUIjD4J6bso/cAltF4a2hhQ1e0EsGvbT4TtKlT8Fz7Ruqb4dQOk3k7E3CJ5av3xV5cx8cxqqgMJ
 G+SPzwTX+cEZ+B8uzTFvJU1w6RalvQ93vTS3I/x1V6F5zMXWBsFxh8iW38pSSm8VoxSSJzdRERT
 RSipQtPvvO5fIjfhgFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4OCBTYWx0ZWRfX+Wd5uzcGFxG8
 RKEWjW5XCwPo9ESYECjnyCyjRYMkoklcnpLPWloQ3t+Zmf93WPtyYGmkB/cbGEiyaK6n/o1eLdK
 6+8pJFX4xP8tmMY9dzR1PTmOicjoo1M=
X-Authority-Analysis: v=2.4 cv=LaWpeTfi c=1 sm=1 tr=0 ts=6abc393f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=Dn1Vr0pbAya_qSnb4TEA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: lm1S2r4-zT9VbRjE8DzhylYNHFyrMBgi
X-Proofpoint-ORIG-GUID: lm1S2r4-zT9VbRjE8DzhylYNHFyrMBgi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290088

Add support for the Lenovo ThinkPad T14s Gen 7 (Mahua), a Snapdragon X2
Elite laptop.  Patch 1 adds the board compatible under qcom,mahua.
Patch 2 is the T14s Gen 7 (LCD) device tree; it follows the Qualcomm
Glymur reference design used by mahua-crd.  Patch 3 allowlists QSEECOM
on this platform.

Currently working on the board: internal eDP display (with backlight
on/off), WSA8845 speaker playback and DMIC capture, DisplayPort audio
on the two USB-C DP outputs, USB-C (host + charging on both ports),
WCN7850 Wi-Fi and Bluetooth, NVMe, HID-over-I2C touchpad / keyboard /
TrackPoint, lid switch.  WWAN wiring is included but untested (no such
SKU on hand).

Real backlight brightness control needs the PMK8850 LPG/PWM (the
EDP_BL/PWMR_BV_PS signal on the schematic).  That will follow as a
separate series adding qcom,pmk8850-pwm to leds-qcom-lpg, a PWM subnode
to pmk8850.dtsi, and switching the T14s backlight to pwm-backlight.

Changes since v3 [1]:
 - Address Sashiko AI review [2]:
   * fixed conflciting gpios
   * add panel backlight switch.
 - Sort PMIC includes alphabetically.
 - Pick up Acked-by: Rob Herring on the dt-bindings patch.

[1] https://lore.kernel.org/all/20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com/
[2] https://sashiko.dev/#/patchset/20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com

Srinivas Kandagatla (3):
  dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
  arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
  firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s Gen 7

 .../devicetree/bindings/arm/qcom.yaml         |    7 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 1277 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 4 files changed, 1286 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts

--
2.53.0

