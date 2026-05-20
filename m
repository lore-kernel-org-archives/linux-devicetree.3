Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56DE3D4108
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779274914; cv=none; b=Zg+lP/tRHS6aWZ9XmP77ooD1XSRpHz082CwYehOs1V9s0BuSIPRy8bA4Kj9IHkdKBuug+VlFprvQQx8fPFqMIZFOvdtnU3MolgT/Oz3NFUpTZOaEW6fUnwKzyP95uTHYJp3Vv2a8UCChbHPqepaY78SV7yf6KNBy3za5eN1QGKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779274914; c=relaxed/simple;
	bh=sxTOeNZUCJiaLQF43tM6RQQ8yErITtuQ1DjdECwZa5A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ndet4zWr6qf4R78N2FNX8n7O9vrQ2632JC97X6RcMEYIusp+Pev15eFvYD3C/BJeMeLHqaf3pknMQ/jXlpcDkXmFctIXMZDEeSjD6KodFgBf6fd9X/0HMKhPeBKj4P+Y0SLVAFIGioMGVqRjkq06pNRwkz1M/XlkmcGM8aUEGXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zl66O9O6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7w+VHH/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zl66O9O6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7w+VHH/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9o3HR448311
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sRQ+frqKGg6yviczCOuRmF
	JXb9EFREKQHuap6tZIl1Q=; b=Zl66O9O6yQDMjWRBijau+OX8I//BUkL2xHKjp3
	DZHD7FATKCZqIvzrFFGBxIgpZaYDkN6Unl/KVyYaCCjpvaedOdKeeBYPMaF4DEep
	HmZBY0+BCn08IELNaQGFTSgiD+yaSjwA3LjeGslunnlE7LVLAhOzeYGKZeJ1BQMy
	TeWfPVGKGULcnIY9SlTl5aJm2AtZVIHSzZPEWpKmpsyIdZt1esF7SZBDsKHZ0UJs
	Iuu7DsNbqnUt4UrRo3w9hgZ/AhsKD9g7VEhQiVNIjP+yxKYQ1b0LEt7TBSLXqOTy
	t2D62+8YJkVCqQMQv7gF1sxw8X10ZnRTq+9fh1VD5f4eUSIw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrg8h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:01:51 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-69be75020ffso10809888eaf.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 04:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779274911; x=1779879711; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sRQ+frqKGg6yviczCOuRmFJXb9EFREKQHuap6tZIl1Q=;
        b=g7w+VHH/91UpwFkDEMysBQOeWdTRzlONCfoJSLaLu8Ijy78OGGsue5RJ9O955YCifC
         RS2KCkjfmWW/cwLl6ZznEz6/OmSKAwfAFikQTB05oGRwqJ29uGcwkzowUmoBiBT420WY
         nb2TlHFIoCYpDYHxun6ZTkF/wzoQdFkkNC4IcnpUpTKnIwhjIvV5K0O0IGnLY4uZK4BL
         5kFZnZH4XzBA82KJTHbWIStRe7QfES5D6xZqmog0tjZXl58TE+xyZjGJhWzXOG9O25Ji
         FYCEJLYzbHjvWZ+9ORi2mROvbXJbt9oZbV1G1rYAXkfIB6Da91vgWpganmfLSqBWjQmq
         JFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779274911; x=1779879711;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRQ+frqKGg6yviczCOuRmFJXb9EFREKQHuap6tZIl1Q=;
        b=FISRDXCK3oUN72lXJ1ips5Lr0LPZItGXsOFj8xB39uUWLqJdz/K40CKjorSZ8QcCA0
         HGC902JAGGn/DEmvWANmn1YMofqiK1pJ0hDF+0v75WfghEfBvnTzvm5xcw7vESeD6zS6
         iCzDvxQ50peWPWRsaUaSUe2PKnx3Kagx6BRI2M0jc9LcNWW4Uhz6Px+CWys/qKnsh/mR
         fCxSR15J0A2Jm7wDPXisr+RRXrwL9lgLt8Nhv3GLrx6nwqewhSVzX/wsaQRUPQfh9Nz3
         ymQ5OsQVLvO0IVuDw7b0OjbVA2Tqa/8sEa8wfAZHKN9m6H1HUZ6DT3/4a3QpVbTKFLDs
         S02g==
X-Forwarded-Encrypted: i=1; AFNElJ/CzdwQvG0yz8aK2u3OIevcDEu619zoTFYbzqaXff4e9NUx3YBLyO59pbHCDTg2VNNBMvkMvEgxG5tI@vger.kernel.org
X-Gm-Message-State: AOJu0YwH2oCY31qyQt0Uoyjdmk7Id8aFK7DSn8eqmgH1eByjUtsPlFAL
	t1EfsMxPrHhviznEUIulnnrC+Gw/wd7i6MlCJiHzZZErAg/GKMZaK5I0r9WSg0W4ni83kRdxx8o
	hdRZqTDorf7hcY3pi3xIEzcKq5nV7F957yxvO1Irwj6p1DEb9CwmpcW03n1SImB5ch7NkylXX
X-Gm-Gg: Acq92OHWSbxUNn7YMMRQdpni/ttndfBbJogD0ewkF/9DigwSbwWuzoS2YN+p890Khu6
	dd01FvWUeUXgAT5AMhceXlwkM9DItYu43DC3ZciEbL3oWxsQKBjJLUVLLB8VRPrNts/XPNHKPTg
	6ROIUthjvt8cTfKF2g/WYc58AREIk3QabkFGPO0WzgXV5c1ZYsrhni6tf28JjbjA2P9hR09LMTb
	073KnZO69Z6HV5lnakpryZ2Pm4Cy1QtKaQMmsfg5INeC9Tg69PQhGATUjXTa48GSiJXsup39WZM
	k+OEuBx4791/IkaOI6lXRJWCv9B47Pa6M3sbvRi+BBcRB8F1RPBVGX75A0tsvvyGCwXR9wGUgli
	u3uxqWmONp6oyog/zZVULElWEUJnWjorlts+bOXI+2P7ByqbgeHDVqEBd7JYGQAXU5YUIBeUK/D
	RkeiVJ4gqzimTCdTnE
X-Received: by 2002:a05:6820:4cc2:b0:69b:73d8:60ba with SMTP id 006d021491bc7-69c942e0844mr16305577eaf.21.1779274910947;
        Wed, 20 May 2026 04:01:50 -0700 (PDT)
X-Received: by 2002:a05:6820:4cc2:b0:69b:73d8:60ba with SMTP id 006d021491bc7-69c942e0844mr16305529eaf.21.1779274910402;
        Wed, 20 May 2026 04:01:50 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:9d48:e1ec:d837:6344])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4eb6320sm840310266b.59.2026.05.20.04.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:01:49 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: monaco-arduino-monza: Add support for LGA
 WiFi/BT module
Date: Wed, 20 May 2026 13:01:41 +0200
Message-Id: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJWUDWoC/yWN2wqDMBBEf0Xy3JUYL7FSSv+j+BB1bQON0ayXU
 vHfG/Vl4AzMmZUROo3EimBlDmdN2nYeokvA6rfqXgi68cwEFxlPBQdju5+CRTv8IBFgVqNseRS
 3cc78qHfY6u8hfJYnOxwm7x3Pkhk/U4e3CG6nlkvoF0c4gBFQjTAL4BDJhFdNIvM0vj4sUThM6
 lNbY0If9/2rUoSwN3osglmGEbg6YeW2/QFWRIry1gAAAA==
X-Change-ID: 20260520-monza-wireless-e6ce7f013f38
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: e-vTy2wBdBaNyp0IW69e3y9MqSK1wGpb
X-Proofpoint-ORIG-GUID: e-vTy2wBdBaNyp0IW69e3y9MqSK1wGpb
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0d949f cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pLl2yMwwk8GGFzfygZEA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEwNiBTYWx0ZWRfX7b/I+3o9QS7v
 xfIQTJTbBfkC9iMjIHf8bfPDV6BcsBGPt6nNm+6R/BjW0+AAeLouD1N9SI2m//HPEXJ/7Glr9nS
 p+dJV5t7bJi42LeWB8+PMy9/U0eLXtonmWQ8lOYqSdkhwbtoxkFkwFDNOu0ugZYhkErv47G7o8A
 EK3GhAOKluIGqE3dwgjXuzXWrYJpJXmKl/zlQ5uMF6QgejYSx+yyq719Ir/DR1MnKaOQiXRnirf
 pe8KgtZ3gChrIv140gD9pR8DfiG9unW4NRLO5LekqJzkaAF4rTUlTlztEqT2RYHIS8tFL6WHupd
 3MTFBOjYZDbmwDsS/riPucoxvTLe9CFBJQ6hc5E/qMj+fNB3j7JDoERJPdHYG9bOW2aV31VRfVg
 wVSEV6Us8t9Me4II2804tV+RkfelhgZyZAd1Ck6E0pWdMO32JEme4fI+t4bQFU6JHNbhsPhcyIf
 zt5xXMn+7Jhna47lsjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200106

This series describes support for the onboard WiFi/Bluetooth module
present on the Arduino VENTUNO Q (monaco) platform.

The board provides LGA pads for a wireless module. On the VENTUNO Q
these pads are populated with an NFA725B module featuring the
QCA2066 WiFi/BT combo chip. While implemented as an LGA footprint,
the design is functionally compatible with the M.2 Key E.

The NFA725B exposes WiFi over PCIe and Bluetooth over a UART.
Both interfaces are gated through the W_DISABLE1# and W_DISABLE2#
signals, as defined by the M.2 specification and handled here via
the pcie-m2 power sequencer.

This series models the hardware using the existing pwrseq framework
and connector bindings, allowing coordinated PCIe and UART bring-up.

Patch 1 registers the QCA2066 PCI device ID (17cb:1103) in the
pwrseq-pcie-m2 serdev ID table so the Bluetooth device is created
automatically when the PCIe function is enumerated.

Patch 2 updates hci_qca to retrieve the "uart" power sequencer
target via the OF graph and use it for Bluetooth power control
instead of a dedicated GPIO.

Patch 3 adds the required Device Tree description for the board.

This series depends on:
https://lore.kernel.org/linux-pci/20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Loic Poulain (3):
      power: sequencing: pcie-m2: Add QCA2066 (QCNFA765) BT serdev ID
      Bluetooth: hci_qca: Support QCA2066 on M.2 connector via pwrseq
      arm64: dts: qcom: monaco-arduino-monza: Add QCA2066 M.2 WiFi/BT support

 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 65 +++++++++++++++++++++++
 drivers/bluetooth/hci_qca.c                       | 33 +++++-------
 drivers/power/sequencing/pwrseq-pcie-m2.c         |  2 +
 3 files changed, 80 insertions(+), 20 deletions(-)
---
base-commit: aa61612ab641d7d62b0b6889f2c7c9251489f6e3
change-id: 20260520-monza-wireless-e6ce7f013f38
prerequisite-message-id: <20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com>
prerequisite-patch-id: f4a7d1957c1776051608bf3d808b2786606c1ae2
prerequisite-patch-id: 6cd3c33583a9af16b3f6f71517b16b32d8155b7c
prerequisite-patch-id: 0550c57d69cf112fd4830e62f4388db6f8bf397c
prerequisite-patch-id: cc10d8079e37ef0ba0c33d0984c95d76361df9dd
prerequisite-patch-id: d7f4bb2bb4498ac619e67a94f8b59119a5caaf26
prerequisite-patch-id: c00ce9095b2d3a412229796194828b55642d3d96
prerequisite-patch-id: 09600595c2e80b12eda3aae39af192847d0f03d0
prerequisite-patch-id: a6118ed2894c176780ba933750e1068f2819fa4c
prerequisite-patch-id: 1dee41a33e032094e8dda74ac4e0bada928573d7

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

