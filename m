Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F1347DD4B
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810199; cv=none; b=MHuwOURb1TOP1VbrR3Dv7QhGn/pV9lmdM1t6TaSYRDzR3sjtNafipvZPB6wTjP/+IXP4dc/d7XlTDrItYtnfZhCeRzJ6HeuV2lJqTEqTVGPCKGUDlv2Y291KV7ZIhN5II/zfwqVMkIzI0djVpU17P3FE1gYy81opyfQUariTpbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810199; c=relaxed/simple;
	bh=FHEw6eTv4uTtoazBa/yv/zQvtrrtf5o/PjlO9noQx5Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=outlp87D2eXo3FOTJihjK1u5zC73vMWOUHw1/TnMAm8IcqkDsmEy41+0TyU4RWck/ovK4q0n7y0wfaAfqmv8W11sfj10k17EMh8lqgRcAWafA0ytIX7scpdOUe5LoZ7R2S6Up1TjainUvOw9Y4FgGdDc+LV5VHimJh4LR9OLeX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAgIEnSv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uwqsz7LB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAgIEnSv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uwqsz7LB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qWMw3648555
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DThEr1s3tPcal1DMFLIWL4
	XTiDVDWZM+qmnsHI11F08=; b=hAgIEnSvrIVorkdWTEuILW2Du/esJWk7pROvgr
	LcVqk7EC54PAP5w00M1Y/ov6spjryb5Z4lwkyETebAKkqjNgz7L5jL1iIJKVXWeV
	PmdEuJDFqVKwrUoBVWPfRFunBtAzwB1E1lR8ocRx/sxpvP1LvJi1dLhQ10KIoIpd
	36WknYuSMX2i/zJ6oLm2nvJGKMtKe08deo3ENu9SThpVG9SgotR9z1kOj0pj12QV
	IOXNb/Xh/5S9PPS/ayjnB8o9XXOPvbjhX9GVxvx5eE2XaH8ALV79X/Vbh9wpkYTS
	dUKyj4EdQRcJLG9BQ7hd+JmvkK4/MJ7/FK4JcKLNvnn8gXTw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7k17w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:36:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccd1958e8fso9407365ad.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784810196; x=1785414996; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DThEr1s3tPcal1DMFLIWL4XTiDVDWZM+qmnsHI11F08=;
        b=Uwqsz7LBbwE2zJljISggqBnSbC/eN2RvuhR/LwQ5sS9MCOEDGteZvCjRWaNtQTFq7s
         HGvStXi88MsIYG6GHgF2obGwh1HR0PsOfInEGU1246oQ6w4bWASiCL6oATC0kwECEaYB
         7VdpwA3uMPoMtOzqJLpLM9ZJkSUFbG93la6GgNXSD9ev7E1SfD6CoZ1Mds6ZihGvMDSm
         /IsOFk/K4c8BKa8+VivEOuPR9XZfszwXLuJy8bBYlirw+TfUwN3bGQyhEUMDVj2drZ+a
         JJ355k+hNKcldFgzvUKSSvqX2BLRTRhPlSCtPak3HK6iFxOdyot74tXIfRvUOseBkMdY
         QV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810196; x=1785414996;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DThEr1s3tPcal1DMFLIWL4XTiDVDWZM+qmnsHI11F08=;
        b=DZWIsNyPboJ95QHeXebo37KbrhFnyKxKtaH4ZVdg0/1farLKlUVaygPXIHXKnCsfoh
         qUgn0U+x7WMvuUUooALVZXZ29crsZqgZtL+BV/tQlwPL6e4J5oFqF+yPgB/8HXYqM/EQ
         YY8WwaPl6A6j0T00Qqk2IsRolzq4wzqe0MAKsn85yVQv6uB8zeQwN8R39b58h8z0Fp0h
         6H56Jv23Jl+b9PlXPaHaTR7SV5mWOr8qi7gHuR+oCg9JQnZeXIgIALkX4w2GD5ZJVA7e
         pm6o3ODxeJCuPMZVD6Qo0zrrO8//SgE+5uhftlZp/vRQRgFd/tq9YrXaEL9ySQTTRSU5
         bd2A==
X-Forwarded-Encrypted: i=1; AHgh+RozQ96PpdT6D0yUllLjYyXq1Go0He6ahV0PJduDAsp5808CqqwS4GdpvSrh19Coos+yWBwYZwOkQm7P@vger.kernel.org
X-Gm-Message-State: AOJu0YyDP4dC1FzLGrtPRJDxniJSAsiQS2ZliAZM/Vp5qwv4JlYRUwUK
	XUgNBOjHNFnkwLzk0vGfsq6UblHNSP7HW7QGtMa6PwejjwuuQIspLCZQHui5U1CzOImxMxeKVUl
	e/ZVJjfTNN54x2Dcx5+nEBLcWd2P3VF0yxC8CY+IyY2/GPXmn10KCVQqgBjg4/45I
X-Gm-Gg: AR+sD12dQdPtWqgnlo9nb2qSj2rL3WRuuvKz8H+3rx3P+OMFJtY8+MmA0ksBCC6sXLf
	fmW7LqkcQOLEuQXsYcmrR42YyjhpQhwuj989DlRyemC7sFjBoKiZRp+J76BfauXC/aQ0NPfFILK
	VMQD7/gHnLaVc5C5qFqPwyIn9YGCHXcrn+/DtaxhCJHJsqQw0gJmSw+qnMqzWUjMDvGaU9lZQmz
	9e81cniE7Ajtf1r4jbAajRUZXLZnYT5Xlbj/8Kn+Q+hg636RsAPYi4K6cUR5hcWIosFgRjgREW6
	uYAtI5k+Fh1+tZW5yBr9kuKHYadUa9bOVjdfiN4bVEkG0vvl4y0tGlxxubxvRQmDNSqNbtIhweZ
	lihFQxPtcPzbYel0NYqYLiONLPYuqYw==
X-Received: by 2002:a17:903:1b07:b0:2ca:b8fd:f31 with SMTP id d9443c01a7336-2cfa6b77a8fmr37291595ad.15.1784810195753;
        Thu, 23 Jul 2026 05:36:35 -0700 (PDT)
X-Received: by 2002:a17:903:1b07:b0:2ca:b8fd:f31 with SMTP id d9443c01a7336-2cfa6b77a8fmr37291115ad.15.1784810195249;
        Thu, 23 Jul 2026 05:36:35 -0700 (PDT)
Received: from hu-samana-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd76c4sm33851225ad.23.2026.07.23.05.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:36:34 -0700 (PDT)
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
Subject: [PATCH 0/3] Bluetooth: qca: enable QCC2072 on RB3 Gen 2 Industrial
 Mezz reworked for BT over UART
Date: Thu, 23 Jul 2026 18:01:06 +0530
Message-Id: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIoJYmoC/yXMTQrCQAxA4auUrA3UKf7Uq0gXmWmiERklmRGh9
 O6OuvwW7y3gbMoOp24B45e6PnLDdtNBulK+MOrcDKEP+/4QBrQ4oOa5ejGlO8aClaygjEdKJJJ
 G2UGLn8ai79/4PP3tNd44le8N1vUDUOBBpnoAAAA=
X-Change-ID: 20260723-rb3-industrial-bt-uart-f98acaffc9f5
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rahul Samana <rahul.samana@oss.qualcomm.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hbandi@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_anubhavg@quicinc.com,
        quic_mohamull@quicinc.com
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 5KT4jmI-3clrrzeMi1ZRrVGY-ujBVFE9
X-Proofpoint-ORIG-GUID: 5KT4jmI-3clrrzeMi1ZRrVGY-ujBVFE9
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a620ad4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cndzWssY6XKUHHFbS9UA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNCBTYWx0ZWRfX+/oWzcm+gEcI
 AsVrFMxQQR4mNWBfa12+Pcc7pGRUpAD79kCtDra8OVcssDWuHlJjU7u+qV7symt/Wf6Jek0ni1s
 Ul+vD7NoWgS0oZJBVXq4Z5+G+yGgpSs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNCBTYWx0ZWRfXy1iTfkEMpO6R
 4JcxJ4BcX7Koc1gBwr6DtuAWM3x1COrXD6RchlWyIZxUgv++R4x6Kr5cImhCD6K5DqfvA6LWNqb
 mizQL+vOG3al6AK3KcGJq2h/yAv+BOibTERAWTTMjS9toGDg4co2+folMzD3uVbcxEaKB+/Ubeq
 +IgWphafL20eY7bj9XI60oJgLmdiC8PMYfK7EfZb/g6x3FNeH6ARWhJh/xx4HNrTyHS3hkx7JKW
 o9V1B/x+OAwR5jtsGqJv2Q9eryAKX+n2C+ZrnLfmZK35KtSkWn+6vSde1JKNl9c+lBTqJQbdehB
 zpZqN12n0LsWhh8AEY/BDK1G29hAkEhCIF6dFTlqsnGEhQS6cRQnzQqxfBr7AyrU6qpAxbASyna
 KakjG955q7LP24aFSgm3N9oZhGoQQjxFyl3ACMihKsNZk5T1pozwOgCIeitJaxAIVYbsOpPB/6g
 HPlXcEDg4C1rVZD7iqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230124

The RB3 Gen 2 Industrial mezzanine normally uses the M.2 E-key slot for
Bluetooth over USB. This series enables a reworked Industrial mezzanine
variant where the same M.2 E-key Bluetooth path is routed over UART4
instead.

The BT UART overlay is applied on top of the existing Industrial
mezzanine overlay because the reworked board keeps the common Industrial
mezzanine hardware description and only changes the Bluetooth transport
routing.

To support this board variant, add QCC2072 support to the Qualcomm
Bluetooth UART driver. QCC2072 uses ORN firmware naming, board-id based
NVM lookup, and requires the BCS calibration TLV to be combined with the
selected NVM before download.

The DTS changes also mark the QCS6490 PCIe root port as a PCI bridge so
child nodes below the enumerated PCI topology can be matched. This is
needed for the M.2 E-key connector graph endpoints used by the BT UART
overlay.

The series is split as follows:

- Patch 1 adds QCC2072 support to the Qualcomm Bluetooth UART driver,
  including ORN firmware naming, board-id based NVM lookup and BCS
  calibration TLV download together with the selected NVM.
- Patch 2 marks the QCS6490 PCIe root port as a PCI bridge so the PCI
  subsystem can associate the DT node with the enumerated PCI-to-PCI
  bridge device used by the M.2 E-key graph.
- Patch 3 describes the reworked RB3 Gen 2 Industrial mezzanine BT UART
  path by adding the M.2 E-key connector graph links from port@0 to PCIe
  and from port@3 to UART4, and composes this overlay on top of the
  existing Industrial mezzanine overlay.

This series depends on two M.2 power sequencing changes already posted
upstream. The Eliza EVK series adds the QCC2072 PCI ID to the M.2 E-key
power sequencing driver, which lets the connector power sequence bind to
the enumerated QCC2072 WLAN function:

  https://lore.kernel.org/all/20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com/

The Monza wireless series adds the generic hci_qca OF graph handling used
by M.2 Bluetooth devices, so the Bluetooth serdev controller can acquire
the UART power sequence from the M.2 connector graph instead of carrying a
board-specific power-control path in this series:

  https://lore.kernel.org/all/20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com/

Tested on RB3 Gen 2 with the reworked Industrial mezzanine. Bluetooth
setup completed successfully over UART4. The QCC2072 NVM and BCS
calibration loading path was verified to request board-specific files
when available and fall back to the default files otherwise.

Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
---
Rahul Samana (3):
      Bluetooth: qca: add QCC2072 support
      arm64: dts: qcom: kodiak: mark PCIe root port as bridge
      arm64: dts: qcom: rb3gen2: add Industrial BT UART overlay

 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |   1 +
 ...s6490-rb3gen2-industrial-mezzanine-bt-uart.dtso | 133 +++++++++++++++++++++
 drivers/bluetooth/btqca.c                          |  70 ++++++++++-
 drivers/bluetooth/btqca.h                          |   2 +
 drivers/bluetooth/hci_qca.c                        |  24 ++++
 6 files changed, 231 insertions(+), 1 deletion(-)
---
base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
change-id: 20260723-rb3-industrial-bt-uart-f98acaffc9f5

Best regards,
--  
Rahul Samana <rahul.samana@oss.qualcomm.com>

