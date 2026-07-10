Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983B73FADFA
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677455; cv=none; b=cRfp+BmqV+jppKwo4tpE2yLVnTlQ2iM2Z1HjIEGiSzlH1mI6Nnx03FOS2c9GHL/erYk8vK5h+6wPNAbMW8LR+iE9L+J9IRdymaIshHfpy7louTtU6C0mVAg2h7XyngGUtbo/WKLWKVfr+FXb1WeIHLjBKZTP1LvqA8F4aM2QriI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677455; c=relaxed/simple;
	bh=BC1i5CTT8hEROlpRriYXpfyJBmL+KtWxwcFIQuJ74ik=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GPNiRHjnOJlzsJgV2OtR4ww4L2M+foPiJCwvGHRFtRw3oCaStaq0DCF8wvb99VbPHgajKZCT6uJCltmpy4hGZ9eCMZTvEKuDcuR2QbJCkdLq1rzk5tIbVWJrIbwZaHrsoT9GABTbPQRLQPm4V62gKVuY9SdFvt5xyJKtT1z1efE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fyf/j1sP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWn3+Q8Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fyf/j1sP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWn3+Q8Y"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7eJPe141561
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eCe+9upivq7I1QkHqTrfks
	jrU/cl381iB5pepWLOaAk=; b=Fyf/j1sPQXJaruPX6ZgdSINKXnpfWASglcf39Q
	hd/RgeCONCE1aCcn6LmVn6sMYC5ifOpqnvhL1VW5MJKds+jTUoQIDbWz7RQpEC0r
	s6fHYdrO1goz3nIhC1+x5T8vVuPqAs8ZC81nSYftZCe5NgfEhSh+2zRoLI4f6URO
	Rkrx8LEil+AydnyakdpOUUcqIhiuCAlV9zRkAMe+HKi5IX4LiHFnJH8VkWBeuFxO
	hliK7P3Akc278C5aJii8WUJKZy4jHyu9Os/b+or1rHMFTWISvYZVbmSsCJwirR77
	vIH918QNKrlgsPDaAy0QQQ6giN+QSHtQnu++yL/0q5w5R6iw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf5munp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso13037511cf.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677452; x=1784282252; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eCe+9upivq7I1QkHqTrfksjrU/cl381iB5pepWLOaAk=;
        b=SWn3+Q8YnbjgQaLMCHFwnUwRfumL1xp1UwF9eH53ml+QUZCy6K4tGFMs7xE0oNyrpD
         0EFvxx82/829oTRYys0umuV7vZdjgK4+JzB4pKbyoZXlC6NCLegPP4GCq1jpgDJKDfdA
         ZL1iYYQoeyEeIj/hZiJlto6fcHTbcH9QlTRBMm5QnArv4H6zrhyiJdeubzKXZ981IJ/C
         3yTautOETutiiBu3xNhT9f6aDN3oA2qrEyGC3ZdzHrN0rKtpRAcO50oqDfkaF+qhhomQ
         a147d+iagd+cDyvLs3ZOl2gvF1P7ycqiHXuXIPuMqBVHp0X37qR00d/LN/sxUVnc6Py5
         2V/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677452; x=1784282252;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eCe+9upivq7I1QkHqTrfksjrU/cl381iB5pepWLOaAk=;
        b=DYtD2JjwlC9BAi8Ej89ZKhTJIE+fjpFnb5Dno4SezmjO99xTeNPRfPV4HfchQ6gyGs
         XSfafn9JH347bZbT9z2EWinU0bjG1/Y1jT/WOPRuM7aB6YibtSPLidYcE8WWLlxtn+0e
         Th6VgNt8n2tRuYMPBv0M+mN+XH9r6SQY2uJkt5AIWglntD7XGsR/klbOpxRchujQfc9F
         dDF8v3Vfo8HXFW836B5IsC/vxMQJPEf7yXDAbxcOAbyMrUPVJrND+AK1dgsu8vGezUnt
         S8uVcA7Koxd/k7Vb8D1as3kLa6DDTwaL36HxEXNkJe1Mnf2DJUyGBNJkchEfQa4eHWz3
         WUhg==
X-Forwarded-Encrypted: i=1; AHgh+RpE3tmo5SNRiVNZXE8jclxc5AOoz/06yROePWg1lzW/O6ZEMeISQh9IERv9fzIfrougpvlmQ/W3zu5i@vger.kernel.org
X-Gm-Message-State: AOJu0YyCwfbCELNPRrB5UjylNGc1IfloG3hm0S2ki5uNm/sSUSwPW0MO
	rJ4fov9XtRCr2NUQDu+iusqanGoZLFVhvcxBpU48eAlrFXgu50BeMM8xqyjneUBKNb+PcAj23Xu
	l12rzUbbDobvjN0frtL6W6hW8cfDTnGz+F2B5/qyphYng3btu6OOflUuLOxTY4ymA
X-Gm-Gg: AfdE7ckrajt0OTkTnTP0pbu93lZX54rFBEHSf5r2OrxGL0+1yb1BEGyM1HZyRuDlSY/
	4puLs5Wm88n2Xy9WxuPWJRrq1eKdsNflb71INrmpq9ixPnJ5xP7QjNMXMTCCoFS6nsZycMg9bBf
	j2DAF6Hpi2briNDmZN+g7jMPqw5CFMOmART0aKm/TC/tR0xxtpvOYZ8qsAJWcAMkpyKPS5xXm4V
	6KE+0Dr05YGzbXwoDDmA+gE+TSCQ52CNpfrCdUrAReNqnyfeZKUtu7JJZBnOREsi7kh6sJoktIK
	WWC6QG8YW9wZzpNkp2lwW+SvXcUUMTxmxiP9FH8SVijT3WhElKiHvEaT7Y6KxzZc+UmRSEtf3GB
	73Q53KyoycjiTbEc4GoWfSMQaKlBgruOpBJH4pmF1jr7HdwWfsNwV2tJg9gUkEIsQLVwxcTQOWx
	Et/Ep7O4WihB52INY8xZEcGyC9ypKHNNWBW8wPXzyZgSi4Xllfz501UAj2i7x98KgDE2i1C7yfi
	lwkTi/VMlhzsYqhG5oq
X-Received: by 2002:a05:622a:1c0d:b0:51a:8c97:fb94 with SMTP id d75a77b69052e-51c8b4bacb6mr108170061cf.61.1783677451900;
        Fri, 10 Jul 2026 02:57:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0d:b0:51a:8c97:fb94 with SMTP id d75a77b69052e-51c8b4bacb6mr108169921cf.61.1783677451484;
        Fri, 10 Jul 2026 02:57:31 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm265357966b.36.2026.07.10.02.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:57:30 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 00/11] arm64: dts: monaco-arduino-monza: Add support for
 LGA WiFi/BT module
Date: Fri, 10 Jul 2026 11:57:26 +0200
Message-Id: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAbCUGoC/3WPy26DMBBFfwV53UF+YQdUVfmPqAsDQ2MphmATp
 23Ev9eYRRdpNyPdkeacuQ8S0FsMpCkexGO0wU5jCuKlIN3ZjB8Itk+ZcMoVrTgFN43fBu7W4wV
 DAFQd6oEyMYgDSUdXj4P9zMDT+549zrfEXfYlcenMZG5TvO5YquF69wFncBzaBSIHCkxL2vZSH
 ypRH6cQyvlmLt3kXJnG2+ZqTUDYNnZpiqhLBr6TZLOebVgm/5VbRZa1/xWILLnqQdWSC0ZVJZ5
 cmRj5L0VT/kTZPtZtpZAbZVQv/6Cs6/oDoN8SCG8BAAA=
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
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: gYHkwh07YR9rb7Xd6M423FF3iMdOgsvv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX3mLfAiTHUAep
 FAce9Aj6VSWb73y6jQp/n7faxs7LhqD7zmSmBao57bmkj1UpscswPGVHnEsTKga9bBCXpmaDADN
 vevTPPx+DcqTVzX8IFBF21oNm+Y4LAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfXyl+STHTBOBCa
 agOhTDlCB4BtLOqynoTUtsWaiokNH3oL5PIh0/ZG/Uyib7CEAqeIIBClBZyxUWwBf+8JhQqRWhO
 FOD+qNnXto2DlzH8LFcK9GNaYiga+Hs9yd/8lqtl1Hu4Ni9P2/iiyzfxlBpRzKDeK1mLYccxl5V
 LV9SLuVBu5SN+awhCzCahFKyAnMancJxXeRKp7KllaCu5mLIYcA63LKqqMOmnpeGPoXwCmUXqrC
 TFuE4uE8rAW3K7sUvrIi999NtG3ONDE4lMIIhZux79oDcJGZR5tWKjDyd9wRFCLlNIDMiGn48Wp
 cSo9gCu2NH4QFVN/fJpmwhxY6zUQTWKQrZWLCWne8Dwery33Z4ZE21USuNUbUMPMxTVP2WLGS85
 36N5n/tQLQKGkhgSIOtOTVqN3xNcSIvMFWbqAZ5WDVFE6VHjqFgg3137RAvtr5XplqXwRupauF5
 Xx/jhRTcDzaa9ABTLeg==
X-Proofpoint-GUID: gYHkwh07YR9rb7Xd6M423FF3iMdOgsvv
X-Authority-Analysis: v=2.4 cv=N+QZ0W9B c=1 sm=1 tr=0 ts=6a50c20c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5z_Ge3scFvwj-DIjt2UA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100097

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

This series depends on:
https://lore.kernel.org/linux-pci/20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v3:
- Embed bt_power in struct qca_serdev instead of allocating it (Dmitry).
- Add generic pwrseq_power_is_controllable() API + per-unit .is_controllable()
  callback; use it in hci_qca instead of peeking at the W_DISABLE2# property.
- Implement .is_controllable() in the pcie-m2 and qcom-wcn providers.
- Treat non-controllable BT power as always-on.
- Integrate the pending Bluetooth pwrseq patches from Mani.
- Link to v2: https://lore.kernel.org/r/20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com

Changes in v2:
- hci_qca: extract M.2 pwrseq into qca_serdev_get_m2_pwrseq() helper, called
  outside the SoC switch; drop duplicated of_graph logic and redundant
  bt_power NULL checks (Dmitry/Mani)
- dts/bindings: use qcom,pcie-m2-1418-lga-connector (fallback
  pcie-m2-e-connector) instead of the generic M.2 E-key compatible (Mani)
- Link to v1: https://lore.kernel.org/r/20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com

---
Loic Poulain (9):
      power: sequencing: Add pwrseq_power_is_controllable() API
      power: sequencing: pcie-m2: Report power controllability
      power: sequencing: qcom-wcn: Report power controllability
      Bluetooth: hci_qca: Set 'bt_en_available' based on pwrseq power controllability
      Bluetooth: hci_qca: Embed bt_power in struct qca_serdev
      Bluetooth: hci_qca: Support QCA2066 on M.2 connector via pwrseq
      dt-bindings: connector: pcie-m2-e: Add vendor LGA connector compatible
      power: sequencing: pcie-m2: Add QCA2066 (QCNFA765) BT serdev ID
      arm64: dts: qcom: monaco-arduino-monza: Add QCA2066 M.2 WiFi/BT support

Manivannan Sadhasivam (2):
      Bluetooth: hci_qca: Add M.2 Bluetooth device support using pwrseq
      Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to 'bt_en_available'

 .../bindings/connector/pcie-m2-e-connector.yaml    |   7 +-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  |  64 ++++++++++++-
 drivers/bluetooth/hci_qca.c                        | 101 ++++++++++++---------
 drivers/power/sequencing/core.c                    |  39 ++++++++
 drivers/power/sequencing/pwrseq-pcie-m2.c          |  28 ++++++
 drivers/power/sequencing/pwrseq-qcom-wcn.c         |  30 ++++++
 include/linux/pwrseq/consumer.h                    |   7 ++
 include/linux/pwrseq/provider.h                    |   9 ++
 8 files changed, 238 insertions(+), 47 deletions(-)
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

