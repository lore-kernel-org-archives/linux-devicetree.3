Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071273BB123
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167224; cv=none; b=eXgWHwf/aM2lFc8FTfnWYGl2aQjN1XakpCxO/kgTOyKLEQoSQovounhvPCjKz3RAnYNHfWqcRxIqEUpk9OeTT5fTO8OB8ctKQJIlEaiSs/9c5jcrCOaQ0Q9D2JBLlzT3VTQgviOhCG1pOZhdZq1XxLBvAS4Fe1IebLsAQNxvDPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167224; c=relaxed/simple;
	bh=WUJVJaQPKb4FmPPBon05kk0BKevAXuQlPhkg/Foit20=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c2513/dI6tfIipPu2eA8Csd4m3uePeN7dujLjtb39ltAISGKJuim8/pIZvSs3xWnPemjuZufQIM3mqJjiUvKBN6YFxnep+S82eWqPT9VWAhsXnojqEM1UPrM4cJDSjS4zrUQdwAGoYLjMnzTL7thJQ8J6HXKjs+H3xL5iWwZjc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joEYp206; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqbC5Py3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="joEYp206";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jqbC5Py3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDluaN3414506
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y/Os8II74xNi3CPYA1RpX2
	RFpqg/9Y7rX+NuKgGBK2I=; b=joEYp206CdowCxq6QdErqFTHIhqRQ6He48RXZL
	qeTKlc6MiwSDU0mbfMCChEe8S2308K4wjJe/2zb/7gBXwnXeEps89/I3mHQ2KJoS
	O2l0Dcy44yhTshr4IqMpkA5WXeGyKLNp6CWEd2epV0T15s6YNwBesbz33jscxKjf
	eFB6Sxm2vvljKyj+kkSrI0hkSH+NbOUZq1J2Yj/jZ/CuuO6oA9zV5eK89thEVhEf
	G6WPVrYi/rebo0Dgcl09rEltekpJO9KwdswyuclA2k3dBKknlOCv5qwHIcZd8ip8
	kJnmh8u1tLpHA7/2H0P2j5Zwwh9zjP6BrLduD/0meci2JS0Q==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v69gb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:47:01 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81cb01c07b2so44692537b3.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785167220; x=1785772020; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y/Os8II74xNi3CPYA1RpX2RFpqg/9Y7rX+NuKgGBK2I=;
        b=jqbC5Py3W67LJSvUOWz14JsfCze2HJNPDQNdjtmxeuyw4qk2egzVFdS8MjetLdHjvr
         +wdxJwOblO2Ohw0+Hq5vRt+GAg2bzfY1Kjh2uRur/WZFjBFT67k7tjlP0SqhM/0gKLXZ
         GNx+Z4+mAdIxdOrfjQf0nMTOaYCGPxRDADPFilkUwLKpjs134OpWSR+DITBbCq73kBgF
         fsp2nwhx6GzSd897hHcccxjgfiZf6kgt+oJ2Dm4rG1U1neecO+vuNxd/vR3j+FaznKYv
         olpPe2rpMWA6e4yB8m1p1J6l/jIllNcovLihcBnUVQnfHzXbYwYu/I5CIucor2oXUd6p
         zs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167220; x=1785772020;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y/Os8II74xNi3CPYA1RpX2RFpqg/9Y7rX+NuKgGBK2I=;
        b=pgmqzOS9dhG/MBdxapnbBG0s0cqS+OEMJnl1EbDrS2+WJ/VRQCK4o2Zf6Nae3EFWf7
         eEQ+MneSR9KTNlmgUCEGk63bGP/uHgqzyDADvXdzQIytbdgzeSyxAJJ2Fg26J9LdaYgJ
         mJecEfBRJKt7KMMpk/dow7utQfERrpBdqgh8K/JgvoxK+rILAtVsNPOynWujnLYF0Bdb
         pbYnDACJQuglY/kKi0QJuhBQDho3Xn01TmJC8Pxryg2R2a5b1vCVDISyHgLhkQcHVq10
         GzCb0K2BwDFiL6w5BN+mLRMcLMlgO3lAZ7HrDd32WweQbW+kUvIhOR8/AAlgBQBELumP
         av4g==
X-Forwarded-Encrypted: i=1; AHgh+RosWbgrQ5ur3vOo8XKyC6MNCTxKnOYsWJ48xxYvUU91dsadJlrKEUF/xcKkmvw1ip58XW494HH7ahXx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8gnKnWvpmO8dhUNAljiqC8SITfeOF9N+nekh0PrSUYGeUUKFX
	JdibtJFnM+DgqIWrz04U2NGk87PCe3p8Mdt2Hc+Wnf2OnHW+C9auvgYSX3I+2WJcn/VmLMSaDPx
	2q07CNQZ85fSpa5w6T0BXd+m6GjygaIcbxFbCUahwcF1EQ5pipcEpyIbotbSXQI9R
X-Gm-Gg: AR+sD13h0n0djnYW6TfXLDtPeo60BQhGLiigNT9zPG7UVEYMx71DwQSrNVOAT9WB9Bt
	JM558b883PkqgGMp6gucqKa6SFBtTJZKZpimB3cPx8CFrim8Kv8zzlUHI3K2IDmZsgsPBZ+Kkzm
	aSjYE3qlgIXy5/mmw92/bTSv9X6O5CK4gO+blDTS8KrlMyBPxQSiE28BlyofilJ1tq9ugM2P9tx
	1AauKneaJFqMuWJRM4IjrzDqhcFhP/Tc+jRhLyc4u2fkeFvDE3EUfwY5g/oklDzFHMirBSg+Xq7
	N4fEUQbo9zl7Ke3x7Dq273WQatZxbdDiKBBsFLa/e65hwQNS1acvijoIUlYpP3v+qQ+/C6xHKWA
	YQJRkDMJ7pSj92sHRMwH753+cIrLTSg==
X-Received: by 2002:a05:690c:6d8c:b0:80b:bc16:8a2a with SMTP id 00721157ae682-81f69e2e741mr28011287b3.36.1785167220087;
        Mon, 27 Jul 2026 08:47:00 -0700 (PDT)
X-Received: by 2002:a05:690c:6d8c:b0:80b:bc16:8a2a with SMTP id 00721157ae682-81f69e2e741mr28010937b3.36.1785167219651;
        Mon, 27 Jul 2026 08:46:59 -0700 (PDT)
Received: from hu-samana-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f657c727asm33307617b3.19.2026.07.27.08.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:46:59 -0700 (PDT)
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Bluetooth: qca: enable QCC2072 on RB3 Gen 2
 Industrial
Date: Mon, 27 Jul 2026 21:15:00 +0530
Message-Id: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPx8Z2oC/4WNQQ6CMBBFr0K6dkgpQcGV9zAsSmllDFKdaYmGc
 HcLHsDNT17y/3+LYEtoWZyzRZCdkdFPCdQhE2bQ080C9omFkuooT6oE6krAqY8cCPUIXYCoKYB
 ram20c6ZxlUjjJ1mH7/342v6YY3e3JmxvW2NADp4+u3kutt5fyVyAhNLUtqqlkU1fXDxz/op6N
 P7xyFOIdl3XL9yUvVPVAAAA
X-Change-ID: 20260723-rb3-industrial-bt-uart-f98acaffc9f5
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rahul Samana <rahul.samana@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com,
        Vivek Sahu <vivek.sahu@oss.qualcomm.com>,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfX44GJ//1Mbii7
 e4tuHWEPsPxBdFVX5sKDIb4iqg6NtDjLtYO5PSFKWvor7oF/W41QdL7ZTQfK1Rm1rDWP3bwh622
 +y/SN5FuWhD8RwpPA25WxfvSm53W3fI=
X-Proofpoint-GUID: UsTUs9JOFFhQP68ue0JFH_ilWyN7_uX2
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a677d75 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Dei6p5SHAAAA:8 a=pGLkceISAAAA:8
 a=COk6AnOGAAAA:8 a=4-NKwLwbh81bemdoGZAA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=M-Yerj1wOn-OpK7r_3ei:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UsTUs9JOFFhQP68ue0JFH_ilWyN7_uX2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfX5rII+dozci02
 k/r6B0wzUHf2Pm+tX+/fQqkmJmTWpcyULaZ3l5hrxcFElI2nQ6XqJGDjRv+XH4Zy9d/lu/WMj8I
 xfKi+lfYJvxX08HBZj7+TK20dlnzsTqQajt9PoeXIdBblrfjR7B9GM4d0lg913gXpBsqme5fuvD
 RvqBneMhEd5PebDA2CTPAO5e5GLlIszw70/UPOybdV6gI89vfryhCh6I/ybJmEivQiafI7KYYso
 cKq00i4xxASK5Zb2iRsFAsAbE+kjgNtTc48Cosw7qHCoSgB5ewqXDAWSbSck7RxdUIV1Qw4VL8x
 2oHMY+cXQTFk/g4tYZFen1NdhIDDnfSB9iiEcini8+e1Bit41IfNxW9JmNf0m4I9Q2sCU4rGbZE
 e4hxNQHUt3or0fdgdoYkJz1AbIkWPyc1NfR/5/HI76rFMN7/OgcjyZMrwBflnZcxx2CePtJXujh
 QdfkfDu2SDxt8rA/GEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270148

The RB3 Gen 2 Industrial mezzanine normally uses the M.2 E-key slot for
Bluetooth over USB. This series enables a reworked Industrial mezzanine
variant where the same M.2 E-key Bluetooth path is routed over UART4
instead.

The BT UART overlay is applied on top of the existing Industrial mezzanine
overlay because the reworked board keeps the common Industrial mezzanine
hardware description and only changes the Bluetooth transport routing.

This series continues the QCC2072 enablement work previously posted by
Vivek Sahu and Yepuri Siddu.

Vivek posted the initial QCC2072 binding and driver support up to v5:

  https://lore.kernel.org/all/20260218114955.3970974-1-vivek.sahu@oss.qualcomm.com/

Siddu later posted the RB3 Gen 2 Industrial BT-over-UART use case with
QCC2072 driver additions, NVM + BCS calibration handling and a
card-specific DT overlay:

  https://lore.kernel.org/all/20260529175342.3363935-1-yepuri.siddu@oss.qualcomm.com/
  https://lore.kernel.org/all/20260529175822.3366535-1-yepuri.siddu@oss.qualcomm.com/
  https://lore.kernel.org/all/20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com/
  https://lore.kernel.org/all/20260529180431.3373856-1-yepuri.siddu@oss.qualcomm.com/

This revision carries that work forward using the M.2 power sequencing
model.

This series depends on the M.2 Bluetooth pwrseq support from the Monza
wireless series, which adds the hci_qca OF graph handling needed for M.2
Bluetooth devices to acquire the UART power sequence from the M.2 connector
graph:

  https://lore.kernel.org/all/20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com/

Unlike v1, this revision documents the qcom,qcc2072-bt compatible before
using it from hci_qca or the M.2 pwrseq driver. It also carries the QCC2072
M.2 pwrseq PCI ID in this series, because the earlier standalone dependency
was being dropped due to the missing binding.

The QCC2072 M.2 pwrseq PCI ID was also posted by Krishna Chaitanya Chundru
as part of the Eliza EVK PCIe/M.2 series:

  https://lore.kernel.org/all/20260703-eliza_evk-v1-3-7624440bd76d@oss.qualcomm.com/

It is carried here so this series is self-contained after adding the
qcom,qcc2072-bt binding.

Tested on RB3 Gen 2 with the reworked Industrial mezzanine. Bluetooth setup
completed successfully over UART4, hci0 was created, and the runtime
Bluetooth child under UART4 was created with compatible qcom,qcc2072-bt by
the M.2 pwrseq path.

Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
---
Changes in v2:
- Document qcom,qcc2072-bt before using it from hci_qca or pwrseq.
- Fix uninitialized QCC2072 BCS calibration filename handling with custom NVM
  firmware-name paths.
- Carry the QCC2072 M.2 pwrseq PCI ID in this series.
- Call out the Monza wireless M.2 Bluetooth pwrseq dependency.
- Preserve prior Vivek/Siddu QCC2072 driver enablement lineage.
- Rework the PCI bridge commit message to explain the reason first.
- Add labels for the WCN6750 PMU and M.2 PCI child and patch by label.
- Remove unused overlay labels and the ineffective overlay delete-property.
- Link to v1: https://lore.kernel.org/all/20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com/

To: Bartosz Golaszewski <brgl@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
To: Rocky Liao <quic_rjliao@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-bluetooth@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-pm@vger.kernel.org

---
Krishna Chaitanya Chundru (1):
      power: sequencing: pwrseq-pcie-m2: add QCC2072

Rahul Samana (4):
      dt-bindings: bluetooth: qca: add QCC2072
      arm64: dts: qcom: qcs6490-rb3gen2: label BT PMU and M.2 PCI node
      arm64: dts: qcom: kodiak: mark PCIe root port as bridge
      arm64: dts: qcom: rb3gen2: add Industrial BT UART overlay

Vivek Sahu (1):
      Bluetooth: qca: add QCC2072 support

 .../bindings/net/bluetooth/qcom,qcc2072-bt.yaml    |  39 +++++++
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |   1 +
 ...s6490-rb3gen2-industrial-mezzanine-bt-uart.dtso | 129 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   4 +-
 drivers/bluetooth/btqca.c                          |  72 +++++++++++-
 drivers/bluetooth/btqca.h                          |   2 +
 drivers/bluetooth/hci_qca.c                        |  24 ++++
 drivers/power/sequencing/pwrseq-pcie-m2.c          |   2 +
 9 files changed, 272 insertions(+), 3 deletions(-)
---
base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
change-id: 20260723-rb3-industrial-bt-uart-f98acaffc9f5

Best regards,
--  
Rahul Samana <rahul.samana@oss.qualcomm.com>

