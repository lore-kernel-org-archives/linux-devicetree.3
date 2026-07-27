Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945A541C30F
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167269; cv=none; b=IiGpBG2gBUpK5GKHsjlCxJ5ng79IQBUL7qYYb4cIjtmoX/uYgfQE4iVLSIsnudOGI4cLNHZ182fZV1OdimKfMau2/BsvNhTKH0UQWDmN0cUQSp6Gaw9OQC23qzFRutgUZMGBRuGhqUrwiWgVJ36WviykfASXqHNb2be5X4kwu6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167269; c=relaxed/simple;
	bh=IsjrdH24CjSgc96IuCwaVspLRx+N6dGHCuJdewvIy3c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bm+gfCh5i/t9sU3K9azrpBDL4QnqpVhJzVGZSBzrPiD9Q9MS/8N+0jsLvawcik25Hz49UgdPLGePu4hmrCCp23aWVdX4ADNVJPy9TEpeQoN7tbvH4wOPIGznWeJ0wqsccSLpc/WDp/ymdxGrx6wFud7sm7UbLG2ajgWqTZVwICI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oxu5AgOG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kb7d5+AN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oxu5AgOG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kb7d5+AN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlalt3905424
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z+43v1dS6IdmduzpcM3Ldi
	Bz89FaxkIy05MK0lyPXsM=; b=Oxu5AgOGg8ZUXiH6bnkDZaO708PkZZQ/v5BLtX
	9fQsNsZVsYG7SXN/IWaINp/Q0pSqF7nfs8bAjdoNbTT4d5P6GYxpEnze102RyBGd
	kOC2OIZIz03UmR5rn4nF9KzvfyxFp0PpRgR0GZ8yB1PUAM5oWkJdmn8XNWtQ3bxE
	EKTVJoHcRB+aA+A9fP456iYR3BA6grMlpyS5T2CehoGqYKNi2RGRouqzzrf9CjeR
	TI/QELOIAHsLslpGNLsj/lQ4/Y/qGwqZlwsZamGJrR4TfaeHFK5O+zwy4klcHkr4
	2WtpBMHBKvqtdUnO2H7ZbEA9ie/4wy4WoBQxDOA85CZ/WDNA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4uksfhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:47:46 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e01a62d99so3919061b3a.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785167265; x=1785772065; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z+43v1dS6IdmduzpcM3LdiBz89FaxkIy05MK0lyPXsM=;
        b=kb7d5+ANgtHGW+/bJoH8PPMSIqQsH6t+mVkaxFuzhb5M2F7JS5BL2bzEeunljLmF0/
         rAxnM+ms3ZFxj1hGqMSCGN7RgpaSyTZqg983O48eihOncNXpGHlrATwjFAWiiA3UHrDo
         l63tarzzG17jg6nYKGX7UpA6XVak6OrWSPeLy6YSZThEs/+OY5cxXYD4s5HXtoATehT5
         RFxL31+VfHTSA4nEEbyc1zTge+C7+OrVpyq2jwWIBcmhSZ7QGIHqJnxjRhrmSag5csr1
         6YsUJQvy0sRddHbViVblCp0k14AkVw2M55MonSl6wAEope9v6FK5RHQyzCBS+PAYrFuy
         yEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167265; x=1785772065;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z+43v1dS6IdmduzpcM3LdiBz89FaxkIy05MK0lyPXsM=;
        b=HTofkG/edPjO+N6qmgoM6kNs2u5+x4iqkuyrpDkds+WNTaAnHBz1SU1sUjukT9qKmW
         76vBuhMYZOF64q1zhZIWsyD5lV0qDo1pnghVWrA8tBZh7xlNfmBBxSphPSWv1dTsMjrZ
         rRHIXnab6NgbU/Zui4kpGKQyqOlbCmbvhI8g6TOgJ4ned/xOzpipR/TFC+FRYTDekfKt
         wyUhz4b5hgLn0kEzVQtoldWeBaA3X42HmScCEXad1229zqg/cX4dBKSbg+KLTB+RZbpt
         fDar8sLwepIxUCSZB3PE3u3QubCjaTra6xlXuEAGWCyL/8A4nj0r0Z2eD8ENSlHazqWu
         dZdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+VG5BZNAtLxV6ti58erM7HylW6bAIw/iLOnZK1y/rzbLVgvZtEWUsbQzxS+gvclLdAhBPnfkNdtFz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/V/hsGYAyEPg3cKh59SjP3Dz6UHuSKu2UuC8nXJxwvtJYsDZp
	WtfhITs+f1i9f5nnjPbCqp7eyowPSrPWq1owrqyUl8hdm3WxywTqnDE6WuL9CwMUm/r1EG+whQB
	L5JsCfo316lOEbQnhO9jePxTTL6GvX3uND+1dY6yzpEu0aUezklP5n7EURHJgEyUB
X-Gm-Gg: AR+sD13O2xeBO+GV/m3NXQ1MPOzr3SxiLCaBjOPnc3uWtYg1pTJ6MCde3SPYLYHR7rZ
	kI0sr6r4MDyO2IOcmDO1iK1/V9SVi0KhaY0G/rxlase9DYFP/I41jlVo4iIt0jX+CoWBcpJvG6g
	WewMsb2a4qm8IAl0xU1P3hCUZOWNs4wYnKRWnWu/jr7L7Smrt3GBcJbeA+908QgKToVzrTYkYl4
	YQdVuRH1R4A5HroTnkqB+a2w2GeC/jxnNZM6/j4IBnhzZFyhhZ1yWe8nm50TCn1Gl2CuSyoqufC
	gJgjYFlwlqTLu7BgjKCaz55pC90F332xEILq87tGI6c8CGooiT5PI5Dc0ah1mZ15J7LbthhCUWk
	vIoH1wjQwaMFtf/qz6OYKbFHusGMihWGH1xZmi/wXS5XyW6mfZQ21Bk8cwOigTClF4G1yyi8T8i
	cjugKQIMrJzgd0+Vv73CEcRn/Wya/pJDXj1So=
X-Received: by 2002:a05:6a21:908f:b0:3bf:ba89:5236 with SMTP id adf61e73a8af0-3c6c7ce8785mr151116637.33.1785167265111;
        Mon, 27 Jul 2026 08:47:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:908f:b0:3bf:ba89:5236 with SMTP id adf61e73a8af0-3c6c7ce8785mr151081637.33.1785167264568;
        Mon, 27 Jul 2026 08:47:44 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc4164ddsm32845204eec.9.2026.07.27.08.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:47:44 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v11 0/3] Add support to read the watchdog bootstatus from
 IMEM
Date: Mon, 27 Jul 2026 21:17:34 +0530
Message-Id: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJZ9Z2oC/3XQTWoDMQwF4KsEr+sgeWrLyar3KKH4R9MYmnFrJ
 9OWMHevJ5t04WwE74E+ga6icklcxX5zFYXnVFOeWkB82ohwdNM7yxRbIRQoDQZBfsfzW+HK63Q
 1T5KcdiMTKCAt2tpn4TH93MzXQ8vHVM+5/N5OzGZtV8wADh1sNhLkM5LzZHch7ugl17r9uriPk
 E+nbRtiNWe6O0rpjkPNMTpqTzwwsn/g2P+O6Ti2OYAYBmeDN+P4wEG4QxqHDtReBzKwjw6s88g
 9aVmWP6V136mSAQAA
X-Change-ID: 20250610-wdt_reset_reason-7a5afe702075
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: cuGK6aWiCWNURoL6AEzE2we2bgRN-42c
X-Proofpoint-ORIG-GUID: cuGK6aWiCWNURoL6AEzE2we2bgRN-42c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfXzfWbgJxrv90l
 v7x7JEFfxddRoj+4MEHjprdYOdCuTgR/+GINar+uaUyiuUvNWlhkcEFj2fWjAbW8GPs/s9mWvEj
 ZpI/mnKnKSkWrJNuRXiQWDpXdOr7tto=
X-Authority-Analysis: v=2.4 cv=PeHPQChd c=1 sm=1 tr=0 ts=6a677da2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=K0PYKaws7Cf5qQY9JUMA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfX1ZblTXF129mn
 uEPNFb735AJFn0YjrRzd9NhlOynjaNwH3jEbXVS+LEXovrCDDlRgDJ7ff80rYsH+iiqNDwh/Ykk
 ir0UVxnL6Ml9DhuipOoQmb1YTPn6xwh3xNdkjvr4Jkp1wf7fcoSYQd7l0t1z0l7ud5IZDvDQRpc
 RgM2qN+cJCqnJoQEyDQdIbpvS4+f6L5AS3wkvrveklmc/xBIb2nnNrGeAhow9K8XSaor5YNtbZq
 UdwZSzBW94rGgKe/ziffSsTHWzZl0uzyCXANNxscIgJI3ooz5D6FfE5JRNC1lgziK2P/elYMGlk
 4XDJ73qlKRNHvRC+S0IRKtfMw+dUA1fz+5/sWnmfTYCTtsmQu0K7oLpixaU+ECY+3tc/8qkJ+cE
 +taMn8m81Wb1rBPZpu62FBYqNNOkx9TbFG+q+sFRFTCURHRW4a5iIWetjYjOkmJ23AxX5sWR0Vk
 3qfEaZX4CCAwsM6UNmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270148

In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
timeout, there is no way to identify it. Current approach of checking
the EXPIRED_STATUS in WDT_STS is not working.

To achieve this, if the system is rebooted due to watchdog timeout, the
information is captured in the IMEM by the bootloader (along with other
reason codes as well).

This series attempts to address this by adding the support to read the
IMEM and populate the information via bootstatus sysfs file.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat
/sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

Upto V9, this series has changes targeted for both qcom and watchdog
tree. So V10 was sent with only watchdog changes and it is picked into
v7.2.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v11:
- Rebase on linux-next tag:next-20260726
- Link to v10: https://patch.msgid.link/20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com

Changes in v10:
- Dropped the watchdog patches which are applied to watchdog's tree
- Link to v9: https://lore.kernel.org/all/20260228-wdt_reset_reason-v9-0-f96d7a4825d3@oss.qualcomm.com

Changes in v9:
- Picked up the R-b tag for 1/5
- In 4/5, if fetching the boot status failed, just log the error instead
  of exiting the probe
- Link to v8: https://lore.kernel.org/r/20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com

Changes in v8:
- Collected the tags
- Updated the commit msg with reasoning in 1/5
- Updated the comment in 4/5
- Link to v7: https://lore.kernel.org/r/20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com

Changes in v7:
- Collected the tags
- Added the reference link in 1/5
- Added the flag 'no-memory-wc' in 2/5
- Link to v6: https://lore.kernel.org/r/20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com

Changes in v6:
- Moved the IMEM compatible from qcom,imem to sram binding
- Updated the 'sram' property in watchdog binding to point to SRAM
  region and update the watchdog driver accordingly
- Dropped the Konrad's R-b tag in 2/5

Changes in v5:
- Rename property 'qcom,imem' to 'sram'
- Use dev_err_probe instead of dev_err
- Link to v4:
  https://lore.kernel.org/linux-arm-msm/20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com/

Changes in v4:
- Kept only the WDIOF_CARDRESET and dropped other codes (Guenter)
- Renamed qcom_wdt_get_restart_reason() to qcom_wdt_get_bootstatus()
- Dropped the device data and describe the required information in the
  DT (Konrad)
- Link to v3:
  https://lore.kernel.org/linux-arm-msm/20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com/

Changes in v3:
- Picked up the relevant tags
- Dropped the fallback compatible handling
- Split the driver changes into 2. Introduce the device data in one and
  extend the same in another for the use case
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com/

Changes in v2:
- Dropped the RFC tag
- Reworked the driver changes to use the syscon API
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com/

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

---
Kathiravan Thirumoorthy (3):
      dt-bindings: sram: describe the IPQ5424 IMEM as mmio-sram
      arm64: dts: qcom: ipq5424: Add the IMEM node
      arm64: dts: qcom: ipq5424: add support to get watchdog bootstatus from IMEM

 Documentation/devicetree/bindings/sram/qcom,imem.yaml |  1 -
 Documentation/devicetree/bindings/sram/sram.yaml      |  1 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi                 | 16 ++++++++++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)
---
base-commit: c5e32e86ca02b003f86e095d379b38148999293d
change-id: 20250610-wdt_reset_reason-7a5afe702075

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

