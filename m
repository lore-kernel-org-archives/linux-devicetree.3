Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674B33ABD99
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979358; cv=none; b=qtr/EVOH1nfMRIaFizc+51N6Je+ryeapdlzeHTPbl0rDPjv2UiqoHkKnzPC9DFomXyPVWRTA3PNkU9I80PJForoxlCX2JpePknW/QlLX9nFPiZphzZiwsUEb/5JEd2EA7Cdc5db9WueYPuqdM9U40s7um9fQWvvIdTKHD6tGPfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979358; c=relaxed/simple;
	bh=806xV2L1oHUsTPDAJAUBQMr4mAXXg51e6OdEFZEM+CU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NIaa7Twh1ldA8yYUitxcTYCPBnzDnPYZy4PWkYROoYJV0JJG4AgSv3GRvpNeuU/h+ga41jIwFeUWWprokE729MgrNWN5SgO7L0ptjsclZOep/opl17q62sSSxMQTnDO3dSeC7yAhfEi/Lp401FeCXD4Q0uSYQ7IR9PsUBa8aLME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7xvuOJ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PlYUtVsX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7xvuOJ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PlYUtVsX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5ius1510848
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/8l3A7Nui29KNu7qqqM1/u
	6wVlfzshkbGHvb5dP7nB4=; b=B7xvuOJ6ojaRdophz37vn0ttM690TxJ2Y4hDoG
	M5kojxMauoNM+7zw0xEh2W9tbf4Q7/vLhoYKhG3utH0Rcakw6/HC/sD51W4+VWUg
	SAjyhOiB+V3Dud5Eq6+5b9kzdmDf7wKaHDHh5JcPl2q36A6OORoCXKO++49aNhmy
	acUdfeu6cN4UMkU43pKH4rG1G8VlF1wtdYQXuVaE3lrd8EnHOy6828nv4uIicJ3G
	Mm+eB+QLEKg75hIR7Un80SDVTW0vOtvV4t3+Q57zv0hXyxV5gGe8vKT1SWU5p/iQ
	xFiX+tJjytn4+Qan6VpJgiTManYvlO2IW0ZtbXlpfk9tSLOA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3x30hpvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:09:15 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66c70f78c75so7211765d50.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 08:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786979354; x=1787584154; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/8l3A7Nui29KNu7qqqM1/u6wVlfzshkbGHvb5dP7nB4=;
        b=PlYUtVsXKj2uBdVjOnxvdlRE8ieo0ShtDKKr3qd+DVyyv1+Od5z5nD1upXyhqwiTEm
         eSkFukli0splKwpvzU2i0LA5irxpN+sUruxr81bL5t30SBaKsYXz6mPMRsb4GowRHKXO
         Ck8h9CTwMqwPdXgA1FZxbmMnOUfm8dW0Yl0U1NTTWEn589EgbMipQQmTmHw5zS7TI/l3
         lg17wGxrwjO00IgdftX61Vgs/IyqkKebTktJp17aZDtO/loEeiqFeWoHP1IRot7CSgH8
         BpjbPkVKESvq3rJfQP4uZrxbs55LnBpop4EGstIRXdNZ3NaDAEfmqyQ/BAS+fjwJCUQq
         OC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786979354; x=1787584154;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/8l3A7Nui29KNu7qqqM1/u6wVlfzshkbGHvb5dP7nB4=;
        b=CRXJzM5wut/WQ+0lxETpxqK26w2gqU5EfGLdU6LcatoZ9Mr7+Hp8KaqiK3luL7Sqy4
         GOqWGGYM+XBTPP7aJ2V0QjCL4KZ+Dt0SNYu0c4f/P+o6mu8U82zNEI6k/a3qNq62ciNr
         8MUiczSd50AWSqegm5zdwYnNCeHPvvFricyElL5sUKmfs8+X+O/c31q3b+qIzKPOJ8bf
         TmCSBeLY+y+cvXTvaTbpiOkfVxuXABUi6Mwc/puEfJrSvHgnN4EULVwk3fzCSzDhGGhe
         QE4IwwatSQGnn45vrXddrOPcvFqu/XjPCs6svFcdBfmHM6laiWA9gtPOQb34gGyHsTSf
         i7bA==
X-Forwarded-Encrypted: i=1; AHgh+Rpqn0Uy5Xn+VAQDyoFB57DnQ5Z+sVthZz/gCJm5AK7+OJbJ39OoU+ghI6e9kOw9DW82sP0ynsGEwuUO@vger.kernel.org
X-Gm-Message-State: AOJu0YzfmKpwjqQN+Xgv9HIs/D7yCH5xj4Jkm0lyCqVGrtmAGSBTXXcB
	+5vQkqYW/MOx1T+lrl2JNSF6d9JNW7tiegFmgkzlZBPIdnJ7H9h5RqtrfdUZ5DUmlNPNtxigcHY
	Yb8EoKmIgM43sq5BI4Z9hqJuwAH5yCKLbjc8334Qdlub8Ah3leIv7iPd2IB/K4E/K
X-Gm-Gg: AR+sD12VJzOKsdw2WpZZdoz/KgRMO9UoT1icso6PwTo1eZxwgegiBZIG3pavfxA6SVW
	e+cFcjhBRV+2/QJJqYYCv+BIrONJaQr6YVKaCAxwX3ovxYVRc+Rc/orOJr8MO0r5LSckorHYLqH
	8ux0rYI0thXeY/qDhi8X2730Y1sJiyRoGRUjlvplePlwYtOd77sErxnF+kfd/cbIamkwLX5iv76
	axn+ucbKFTSwfbHCpNUNhbhSBaUW5wEXV8OpBzBea6uFkUvGSSnKltKnyuDT+iXSj0t1Gaz6Anf
	1mwFaze51Cle0EIAC8eAKEQ4xJBYPdy9mkkpeyJpETC5Dcl5XWgX3CJm+GlSV9LkMgs967SyDBa
	mkNtl2dxphwJFBhwUwPKbWtjUzcRAOLCfTxSIINWRbV66lAv4TA==
X-Received: by 2002:a53:c4d1:0:b0:66c:4efb:6518 with SMTP id 956f58d0204a3-66c72baf01cmr7065289d50.21.1786979354018;
        Mon, 17 Aug 2026 08:09:14 -0700 (PDT)
X-Received: by 2002:a53:c4d1:0:b0:66c:4efb:6518 with SMTP id 956f58d0204a3-66c72baf01cmr7065264d50.21.1786979353302;
        Mon, 17 Aug 2026 08:09:13 -0700 (PDT)
Received: from agents-mac-mini.lan ([2600:1700:b450:a0df:2c9c:bdd5:b705:b119])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66cb3d377bbsm938108d50.0.2026.08.17.08.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:09:12 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Subject: [PATCH v4 0/3] X2 Elite HP EliteBook X G2q support
Date: Mon, 17 Aug 2026 08:09:08 -0700
Message-Id: <20260817-glymur-send-v4-0-3fb89cec703e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABUkg2oC/3XQwW6DMAwG4Fepcl6qxAkEqmnae0w7BMdpMxVoC
 aChindfgE1bte0SyZLz+bdvLFIXKLLD7sY6GkMMbZMK/bBjeLLNkXhwqWYgIBe5LPnxPNVDxyM
 1jkupcgdaWQmCpR+Xjnx4X7WX162OQ/VG2C/EZ0dH1yGN6bc2VtlIHNu6Dn0aq42xplBG28ygK
 kRZSQPWKYFItnJWF6gN5gtVU4x2zXfYPa7xDMiveJfTlNDG81FyyQ0WpSizDDCj5zbG/XWw52X
 mPj1PbIl6CrFvu2m9wyjXZNvKIO5WTp7gHrUF9E4Kg7+8lRvhJ5HdE5AIIUqRKdDeV/4fQn0T6
 RD3hEoEOEkpAilblH8Q8zx/ACXEr9neAQAA
X-Change-ID: 20260619-glymur-send-1136d243a120
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDExNiBTYWx0ZWRfX1t5T+VtVtBn/
 F+e+TgDnBB0xsEL2xA135Ik2ob/UCSnD78OocxtMwtzNnJdCyrWXLLCFthV3fgyj4zMgYzntT87
 6AuMnzLzWJJIgynHM+LwKgEN4l8ec5ofllvtoNv2JHy3BlEbXuO13vozDGALF2qXVA+Igzr9plp
 XwBhzeJo3F5XNubTeXZhG0SxAfl+dnHC5dztqLnSc9MFkstelvlyk6Cw5JtxC6yl7z1/PAAxmue
 QSTC36Qflq0BPysDeNTIHgChGvYjBrpO42nmOZp9LJ5CE/+utKp1Zef5U6gR48g1o7brhIolJOc
 c0639MLTwdSAUxH3v3diePYNMpYARhhT5gtQJ9ruCTmjkvlA9cWPT26g+KWh+4NeCoCpT54c/LP
 zTtczUPhP9iZX34RhNupTWMxM7jQgwEmNdQA8mEzhMWNXb7CYvl4uZkKTChK8ZgES4f2eAn2FDT
 xTZ3tYMYo5GIXpgCwzw==
X-Proofpoint-GUID: MrOfx6R5whxvqLaQlcT-tW4n2VLoz-xc
X-Proofpoint-ORIG-GUID: MrOfx6R5whxvqLaQlcT-tW4n2VLoz-xc
X-Authority-Analysis: v=2.4 cv=Y9/IdBeN c=1 sm=1 tr=0 ts=6a83241b cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=AisufbmASPP-vp6uVsUA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDExNiBTYWx0ZWRfX1NvN2DiMP1DD
 8Rub8c4uAP72TZIPPOw3TwiqWzFfJ56E3mUpHEUaVf3GyMPUd7cSNbL8JKu7O8RwjxqucBFT7m9
 w0K1vrMUir/osRGCSeuzGaKBAdP0EB4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170116

This series adds initial device-tree support for the HP EliteBook X G2q
14" Next Gen AI PC (product SKU C4JG0AV, board 8E91), a Snapdragon X2
Elite (Glymur) laptop.

The board was brought up and validated on real hardware. The electrical
description (PMIC rails, PHY supplies, the HDMI bridge wiring) was
verified against the live unit rather than copied from a Glymur CRD.

Working on this laptop with this series applied:

  - Internal eDP panel (samsung,atna33xc20)
  - 2x USB Type-C with DisplayPort alt-mode and USB
  - Chassis HDMI output
  - Chassis USB-A host port
  - Fingerprint reader
  - NVMe SSD on PCIe5
  - Wi-Fi, Bluetooth
  - Keyboard, touchpad, touchscreen, lid switch
  - Adreno GPU and GMU (Freedreno GL on Mesa)
  - Audio playback and capture
  - Real-time clock
  - Compute DSP (cDSP)

This patch series builds upon the recent work of Qualcomm engineers to
enable another Glymur-based laptop.

Like its peer submissions, the camera support is missing today.

The audio, GPU and SoCCP series this board previously depended on have
since merged. The one remaining dependency is the Glymur combo-PHY
configuration patch (prerequisite message-id below). Until it lands, the
board patch trips the expected "Label or path ... not found" dtc error on
the DP PHY node.

SCMI on this configuration needs CONFIG_QCOM_CPUCP_MBOX built in (=y).

The bindings patch is independent and can be reviewed/applied on its own.

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
Changes in v4:
- Rebased onto next-20260814. The Glymur combo-PHY configuration patch
  remains the one declared prerequisite.
- Fix the touchpad interrupt. TPAD_INT_N is GPIO 3, not GPIO 66.
- Describe only the microphones this board has. GPIO 200 and GPIO 201, the
  second DMIC clock/data pair, are not connected and are removed in v4.
- Addressed comments received on v3 as reflected in the next two items.
- Use the firmware names from the vendor package (qcadsp8480.mbn,
  adsp_dtbs.elf, qccdsp8480.mbn, cdsp_dtbs.elf)
- Drop the smb2370_l_e2 status override; SMB2370_2 is already disabled by
  "arm64: dts: qcom: smb2370: Disable SMB2370_2 by default".
- Link to v3: https://patch.msgid.link/20260809-glymur-send-v3-0-2d1ed10e3a89@oss.qualcomm.com

Changes in v3:
- Rebased onto next-20260807; the audio, GPU and SoCCP prerequisites have
  merged, leaving only the combo-PHY configuration patch.
- Added the TCSR reference-generator supplies (vdda-qref*/vdda-refgen*) and
  the vreg_l1f_e1_0p88 LDO they reference.
- Set dr_mode = "host" on usb_hs; glymur.dtsi dropped it from that node.
- Reworded the usb_2 and smb2370_l override comments.
- Link to v2: https://patch.msgid.link/20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com

Changes in v2:
- Enable the PMIC RTC (qcom,no-alarm + qcom,uefi-rtc-info)
- Add the SMB2370 eUSB2 repeaters on usb_0/usb_1
- Enable the compute DSP (remoteproc_cdsp / fastrpc)
- Addressed comments from reviewers on v1
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com

---
Jason Pettit (3):
      dt-bindings: arm: qcom: Add HP EliteBook X G2q 14 AI
      arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
      firmware: qcom: scm: Allow QSEECOM on HP EliteBook X G2q 14 AI

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 1032 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1035 insertions(+)
---
base-commit: 4477a78374a57c3809b172ad30cceabda48c47c6
change-id: 20260619-glymur-send-1136d243a120
prerequisite-message-id: <20260721-glymur-phy-conf-v1-1-7c8909552c5e@oss.qualcomm.com>
prerequisite-patch-id: eb10b682f1419fa6bbb45943afca62a8250cb68b

Best regards,
--  
Jason Pettit <jason.pettit@oss.qualcomm.com>

