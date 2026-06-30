Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE02367B63
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846201; cv=none; b=XBQ48/cUAsgtOFZeda6HQsleyOm1pDVc5iBvgZOccB0Ab5L5LUnRmjyR45qPGVFQr5mqqfAZXyNnBX/5DuPkY/o1G0JRTTefF6Dz7YMbVVoFXwBKk/ljKerIvPWthQQTzls9SFIScdzTH149yYArWkpzmDsfpthuBo7TH36puCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846201; c=relaxed/simple;
	bh=LvlwbbSfGWB/DCQMdh/o6bn7mfpSa5BBkE//6kj5XNQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CyHDWRuNDgK9WaSoeB0QCmMiD7a8uPBS9m5Ti/OKsXPdTQLG+w0OypJCB4fVQZmdg0nT+a5TWbLKa8RdpV9k3pGPQwO6wBcI+eiQiDkz+DAjsTyeHrEnvfyNJbr9nP9i9IePbEsXCjv66pTE5hr0RhfwIU+omtIVr6rJOC1LjgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hS54l00K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j+gyJzl8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hS54l00K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j+gyJzl8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UHkfM42721427
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=54AYRgZXvf1coJSYDJ7gWV
	G1vab9Ivg+RUjNrzNJr9E=; b=hS54l00KM3CPK3ibO6D+sKBkMYZKKW5zBhBPMj
	FQoaKd34lrUQNQ4vqR06liGGQzQUFZCqquOZbaiV++D/oP9/26pv+3FxHl/KFMH1
	UDPBtcWORSPnx0Ne4lh94tmcOEAnWcp7bgSCJfEpVIHi8bfrgm3EkfYLwB1aFx2l
	yjaTC5dWjU0xLvtRQgB+xACEtYJSyD1BlBwHqJNoz1OK5Rfe6SKQXoDVvmVYGKjM
	U7k8iC1RWLXCp/hD+0yl+aZKHwk2Uz819LAB10UU4C1wItrkwVZoNjv7Q6lfv6FL
	SVE7HVRmpgHMFmnw9VnSf4FJlOa+oGBtuhDmYqAzJ0e5v3oQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4fc09g8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:03:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c011c7cb9so13661401eec.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782846198; x=1783450998; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=54AYRgZXvf1coJSYDJ7gWVG1vab9Ivg+RUjNrzNJr9E=;
        b=j+gyJzl8lJ7hHfhpCdiB2cu9ZTKGEsShylZdNbDVspvb3bUuPQOfBmaMapdRZEClBy
         BYqqMvD6fzdL09Z/W4KTzfACiZZIRE00E7ufqyxp0rQC+3gD/U6v7uc+8/yxC8ZV0Gzt
         y7gUTFUK1MI0m/0IGYEg/izkWPVANpyxj2Wk+Ml1UBCAXwrcBOFvzm7waS1Xzv24069o
         tw9uFSjVDpUMApuJUpOWe4yHBm54mFxwNCapJ8hD78A4v3N4yDZQsrsZsM0gT+rLa9tb
         r/uj/5gkZLbcOgOKRsLjbNmFp4lefZky4FSQdHtEtsgYHkpFlrXhjov8rBO07HuzqfMT
         0w0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846198; x=1783450998;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54AYRgZXvf1coJSYDJ7gWVG1vab9Ivg+RUjNrzNJr9E=;
        b=DgRtYhGUmXR6DJCwAajh2vzQ55yF9aEXvtTdFhCqVQ5Gm7YsVzhstLWE/ju57Wt9E/
         gg/r+xGqIg7eX18yDmGqR+7Ecx66IHskfGVnSo8P5E/QZReN7TnHBYIeVtPzJ/tL9eDX
         VqvMhMBTnWRQRtSGJb8Ugs8VFzY1JXoC/y3bHdFR9/JWaobMdHAo/C6J1MqzOA0FI3+D
         OdM4tKoGqlJOpruUVkjrjqQeGhnDSzG81Ls/OSugkEl9/fi/oCMQGIrNVPfCSmM34oJI
         UMaSqyWtSlJCiJIzOM/e+MQdjWbOfy5Lp3LT1oHBscJlxMe7WONTdMRtgUeYb2AP5P1b
         Zq0g==
X-Forwarded-Encrypted: i=1; AHgh+RrrUfN1Zjcwp1Ma429aBnuz2GJARHucsyz34FkDWS3ZgXAdKSqaHRuIbCnrql/LRDs/S6biYheZFlA1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj9sjRVQFepXFAZNWkH+POdTOtS4oiFOsVyxOty2+IvC1zyFWa
	bl6pQ+KLEOdvhKZRyvyFwK5jWb/304CAcvEMMrPINBsMpKhCRhICWNHAe/Z88xQ23ScwuVnZ7Ey
	okc6r6A+mbIYlZmx9e1b4HeSI5a3V68pu/Z7q4U4juhAKWlRNVd3WoP3KsVr0idII
X-Gm-Gg: AfdE7ckQZ0WhdQhsT8P/xZtONm35EHUAOcR4XLzOk6TwS75xgCHWE0bWAqSgQvz32i8
	h8ssTJhr3agu/3LXU83yYytZtbPGgBLgNCoBzGP3TQS/QnCY533YlcNdAQaJ9KGvZ4m9qiQNEHC
	DwOHmLcI1T0LtFsosIhddMyeNAJkhMbaItpj0oFgemVbwwuo7iGeDnmVoU0AyLvLJnG1qJFIuMO
	PJC/09EAcIm44h3+jQRt9JEepz1/pXvE6wmXu6R19jS9ui4ZtiISNr46MqVTL9Fjvf2GrvLQ/TB
	7qyR0i5hl5vgUi2LeOO3aD9WxIMN5IL9xDom68ZCRGSJOnfHIapdQBQt9KavhBbrt/p/hKjwKEO
	YR8ztnQT6+LiFqFUlcM4SY1VA8ydOSbECr5+LS2jYmCCnoME=
X-Received: by 2002:a05:7301:e02:b0:30c:6025:da8a with SMTP id 5a478bee46e88-30ee134962dmr4071745eec.14.1782846197971;
        Tue, 30 Jun 2026 12:03:17 -0700 (PDT)
X-Received: by 2002:a05:7301:e02:b0:30c:6025:da8a with SMTP id 5a478bee46e88-30ee134962dmr4071698eec.14.1782846197362;
        Tue, 30 Jun 2026 12:03:17 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm14963815eec.15.2026.06.30.12.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 12:03:16 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Subject: [PATCH 0/9] PCI: qcom: Add PCIe support for Shikra SoC
Date: Wed, 01 Jul 2026 00:32:42 +0530
Message-Id: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANISRGoC/x3MzQpAUBBA4VfRrN2akS55FVlcDCb5aQYpeXc3y
 29xzgPGKmxQJQ8oX2KyrRGUJtBNYR3ZSR8NGWYeCyRnk8wa3LnboRwWR3lbel8OhEgQq115kPs
 /1s37foi1EFVhAAAA
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782846191; l=2304;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=LvlwbbSfGWB/DCQMdh/o6bn7mfpSa5BBkE//6kj5XNQ=;
 b=3763bsqpx1pPGmDO0q0eQLi+UTbzjWu7ITIUvsYsUGaOWDX8P5RJYqmMHKnQYZmHQ3zKg/ClK
 xZZ8ExeoEK6CkefBKEg/3J2RCJy7MpS0xinHTnq6FQpeWGyLNJYnjmk
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX5lzCUi8f609I
 0zUIsRlwXrkd5qpk8UuX40EtGD2t5uiNOIGkpyWTBecdLwydx+QdOtckkfprolEkAgxGARj0iE9
 TYM4Cfw6Bwt8FFbG2WKtHFpO166GJovdvTOkHDItQiDuVIV+IE4oNkfUVwuGck2oIvQhEP7cJ/E
 u4UMDbC5Yn604LafFmN/c1jqiy7iG+T3RFRe0vYGig7eiXh536mf/4mv4HcA9Pwiv1XVzm01Ppk
 S5KapX455qJetJhx8/JmZOaY7NuA/Tl4ubzwM5WOpCsL7TH11h8uUatW8ZfWEH4leFnNHYIiJF7
 El7CJugeqTCgzq/aFThcvs8Nl/RQPKK0e5svvqmQMvqZgo8mp1KtL3waM3bW7i3KL1GQJGvMOmj
 1RWIKJT3w5lmTQaf3L7jSDZSVNdeKbQDDIof8Fs24ZJhZsJVo7CvarDfJiYsieMvhGJpJpkxD+l
 bQwxf0vbrJRvc/dqKeg==
X-Proofpoint-GUID: EcHzumCDKGDKnTzXk_fE3yKuc65Y_IR0
X-Proofpoint-ORIG-GUID: EcHzumCDKGDKnTzXk_fE3yKuc65Y_IR0
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=6a4412f7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0S22rWqy9xk-ZxXqdxcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX6C1KrN1hblmH
 eacnRXqerHE49bgtZYgEBryQA+JScDkA4baAhbDEAY7DrWtq93nGqSl93xKHubZXJbGNxkwVn+Q
 TqAWqBb9Vfc2O1xEVkIrTAz50ZgKBoQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300182

Add PCIe support for Shikra target, by adding dt-bindings for phy,
controller and corresponding phy & controller drivers/device-tree
changes.

Shikra RC is connected to TC9563 PCIe switch on all three
EVK variants: CQS, CQM and IQS. The individual downstream ports
of TC9563 connect like below:

DSP1: M.2 B-Key for 5G Modem
DSP2: M.2 M-Key for NVMe
DSP3: Embedded ethernet device

Power and reset to M.2 B and M.2 M slot are controlled via
TC9563 GPIO's. Hence, add DT nodes to enable TC9563 switch
and include corresponding changes to configure power/reset
to TC9563 endpoints as part of power on sequence.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
Sushrut Shree Trivedi (9):
      dt-bindings: phy: sc8280xp-qmp-pcie: Document Shikra PCIe phy
      dt-bindings: PCI: qcom: Document the Shikra PCIe Controller
      dt-bindings: PCI: Add bindings for endpoint gpios
      PCI: qcom: Add support for Shikra
      phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Shikra
      PCI/pwrctrl: tc9563: Add API to control endpoint power and reset
      arm64: dts: qcom: shikra: Add PCIe PHY and controller nodes
      arm64: dts: qcom: shikra-evk: Add TC9563 PCIe switch node for PCIe
      arm64: dts: qcom: shikra-(cqm/cqs/iqs)-evk: Enable PCIe PHY node

 .../devicetree/bindings/pci/qcom,shikra-pcie.yaml  | 211 +++++++++++++++++++++
 .../devicetree/bindings/pci/toshiba,tc9563.yaml    |  22 ++-
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   2 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   7 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   7 +
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi           | 152 +++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   7 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 154 +++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c             |   1 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           | 152 ++++++++++++---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |  73 +++++++
 11 files changed, 764 insertions(+), 24 deletions(-)
---
base-commit: 565fa02f75448ce1ddd18bda6b31ad985cf75411
change-id: 20260701-shikra-upstream-14b8668f1001

Best regards,
-- 
Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>

