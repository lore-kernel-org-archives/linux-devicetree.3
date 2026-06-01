Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D7939A07C
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 09:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307242; cv=none; b=ImBT3iO7/kI8l1iDkUxWqrpdqZrmTMSFfBXOwnmjpus0jHnjAp9irv2Lfa97OQIslEGdfIyMA5Mq6qDzUbNmCoZSedbX733nzkuPBikKqoURSEdWc9uAzmiP5mx4BiPzLRLMN66IegtuHZABbJYL/Rv/L/EmLUgB6Kg9qgoKDqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307242; c=relaxed/simple;
	bh=p/vEWXfWcfITuHPO9mfDyXFqaiM3ASW/1cHspYUnUG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T426j5clNqehQRx8rHD4kPleBiZtZBbm/G0chUk4OKRrsVPS/kTCB/8H8N4K+6MDj/fJkCdfxcoXv554CKE4qIjAzeh8yx3DT+NpBY6HLwAICLf17/ctwCScR2Ek0cGZ3tXFBjDsuuW4vtOGHRAtdP3eWv0myozLJT7m2Z5XMVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iq3Eq1uJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IeSG4yNS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iq3Eq1uJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IeSG4yNS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6517LQ4X3034776
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 09:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32iMDaQ3qO7lDTIoDuzY5zW3z4FbD3aMPXHmlVvtKpA=; b=iq3Eq1uJy5sqIyaB
	HEeTyGysoJFEbltXLV4EGShG2OY1eXw99X6JDSbw21wY57+Ry8w7iqhCG+9pc7e3
	WTNa9kgWHeLANCjlgSA1mPJQUkFMOPzJShC78ifs1DNraLkHfqEAVLiBMbtFVrCq
	ZPUxTEi1AVKlWjoHniamktcwbrcGahmyziNw/5CF6V68ltzeyxDo9VU7bydmkJGs
	dqBtOwayhiZokYmcjfP1rmTJ+DbSWLcZKPAR8nOfV4y6IDrpD68FV/UAsTQVp9ex
	zcGpwK3XS2dGoXKO+/0lV7vqhQ4y8b1210ygEdjfdIcPyydmQRfh79lAKR+taZiK
	LTRoAA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqyuy00b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 09:47:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174d1b326eso30035391cf.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 02:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780307227; x=1780912027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=32iMDaQ3qO7lDTIoDuzY5zW3z4FbD3aMPXHmlVvtKpA=;
        b=IeSG4yNSeqImHHiYB/YQ3mjNpOKrAVvbqGFOKQrHJ0AtUj82M1Rp14aiAuprhD+f/S
         39I4qB07aZ3kxWHBXzSYojF5yr3A7qIvzu9pEi4HvQo3DA4CeEuWN2nxk5ITZ7qqw4ly
         SUVwcLgNQoOFirj65IjXxfrs/S7aDYnjaqGnCjGkMUcI1uTLMOdwVtRq8VJg/rqODnBC
         fTFTsJ/K+SJ3DjOOTZl4bsW8JQigPO/vd2REf+F7yNN4lvnZsx57QPTkFhq+q7uEOiX8
         qALLO42aLMVs2uLgekRzrkMHr4gJgco3VZc5aWE/Ev2cp3eWXSxlZ/5JSmTsVc44VnTI
         zTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307227; x=1780912027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=32iMDaQ3qO7lDTIoDuzY5zW3z4FbD3aMPXHmlVvtKpA=;
        b=IVRqZqCOMgOn4FMK8AZFqm+hRDDG/HaT9uwDbsNbyhf36GBjavrLpjPa/gEJeSx4oL
         H70xgDIkfi7wbywbonwcPFHIKrNXiKYjcVQO4E/J0Npir346bB5IOn2TOTFr2hHzsLOO
         ZDXM0fR0CBENqZqNpOWHHnh7B/EIgBwaFCjQaG71OTxE8QkFA8TdVn8TkVD1BwLu5dh/
         MbmAztEwhnY/D9fC4JeR9y6JU5KVEwzM1tEXxireFaULUM5j4O+Kx7Fm9clb8kPJWl0r
         waA1NPqiW07ncK143RADjuqXaNMmodiHxunQKrs05VUeeJWv++gqgT8DNRAhTuall7rh
         jVtw==
X-Forwarded-Encrypted: i=1; AFNElJ/pMEzUVDOQTusfEUV5ObeZVkox1U3JROK+QO/Y8mdCh4yWhZkmvb/L+DgZbnaBUNaWTNGLv8ANetmb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1KkuOWWIQ6HHSKpvg/KN3GQQLkA0h2QDCTr6HNe6c4PgtXekb
	doH49hltzbPi8wD6TRL5+VlDSU+Hg5LZfBffJgigVDMVuNgFjVqss53RXim5vdXADB8mr2SH7rD
	eWFYnCDr0Ib/qRsxsQMxrnfNRcM7k3YxvpZCWDaqzs7Phf83vUvw7PkGTQWJlWutN
X-Gm-Gg: Acq92OFENTd+AQD0OieZZOIlDoBdkJWBumuv5RrR/m7+ugH6HtseUHe4s7eFvxgHLIx
	DHxrXqr69isBI42S1gFU87L/NzpWvGY/PfzNFiGaVjG6z0pqwhJiPERhuT05KG8m19dr9qYh8A1
	ksQvKTiaL6lFB0eTYKeObCOS/djbn6eZ0aCcLrJxV1m8i5f2Jxk7iCX4Ow3ZfJmp73ppmFxCPD7
	4OruQ1arSvyNJrRrZlgEqwtEi5iRqcA0KzsjC/0Snd+CN2QKzMokfUNCwBHE4zE3uV/9ikGJ7JY
	Ri1mycwNK5J8934VYQJ9rruvdclmAWRVNZKfI8qU4khz1PQd6WRHqQV+WllT3RDWzC+yk5SEHDy
	onhgujSEOj4kbLZbqHTIRvMjgt2lBLzLYpQMlVlu2LvjwWtvxjnuHOX3W2J7tGLJdQ16OvUv6Jf
	VTlBPKO5lXKmN638IrVavVYLzpcUQWETrstFlyMrGD3homsg==
X-Received: by 2002:a05:622a:299b:b0:517:58f6:29c3 with SMTP id d75a77b69052e-51758f642edmr25765691cf.32.1780307226581;
        Mon, 01 Jun 2026 02:47:06 -0700 (PDT)
X-Received: by 2002:a05:622a:299b:b0:517:58f6:29c3 with SMTP id d75a77b69052e-51758f642edmr25765361cf.32.1780307226184;
        Mon, 01 Jun 2026 02:47:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39672802651sm15355201fa.1.2026.06.01.02.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:47:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 12:46:55 +0300
Subject: [PATCH 7/7] arm64: dts: qcom: sm8350-hdk: describe WiFi/BT chip
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-sm8350-wifi-v1-7-242917d88031@oss.qualcomm.com>
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
In-Reply-To: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6120;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=p/vEWXfWcfITuHPO9mfDyXFqaiM3ASW/1cHspYUnUG4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqHVULHknQTeqgXWLpTQtoBAPOcZ8nrUprloMHR
 HJqLRInYkSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCah1VCwAKCRCLPIo+Aiko
 1aswB/wLWeCDt7fqtyhpWQItLB5x948RgkF3AfS0s+K8vCNS5F6wN12TNHhnvx6N92e7SeuS4/O
 pbuLBC4kiL5kaoUWP2Y2zQ3KSWOUJWD+rWVtpA48mrHt41PQJIlx4L+YFCCLVPhZYsJwM9AsJFq
 0Z0rXdQuurtvBjuJbjkZEra7j+3bJMC6mOC+vkVWFisrSPB8txE20LJCRlZ+T8zT0MxTNw+g4Mv
 f9qnmUd5tW+23KQEPL/PK8+GbLTgxdPT7RqFbxhnPP+v+txO1Ku6VgmYnPSDBsruBI0FWtzcq3q
 EtcYzFmbprwQUCgBkP1sBKeckGK9uTFw4M3HA2jL2HVKUFn/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OCBTYWx0ZWRfXzn3pV/G/kZs8
 SWrC2dHEAWjJdHn383Lb5mmiB7ueQ3xQuMA0tqiI2my1FLkiCH4Igyj9atXWaUJzV4w9VfKv1b2
 2UHVxPWnYA50rft/6cEl2AMGTf2F+cH0dS9bJErlG33e3mowgTlAcIBoRP3BggPNM4viS6Huopy
 RKyLshARcSqEK9fPIcB6zLytRacetmwgF4IqbF05eeelH57SXxnAydT2dDyym0bhW2j7js+CS8n
 JXLO6QfdirpveliZuP+4A0vZCkFRh6cK0w8IGc5hbmCPDgxKHRqUMKx6ddse7xTw6INlkzKxfAd
 3BbW2V5Q5vGB2Sk2hegpZcX7pV0hqHx1SrhEac13zny1h0q638afjTrRJB19P5Ta8o/EFMlrk5o
 ZiFOxNEZvBnSNS4rAyZayregKmxGWmSHFlr+d8MTIJWwyFgmOthmXjlzL5TCC7ACvP3pgYWDDHh
 7aO4mfID1WBvzbcjc6A==
X-Proofpoint-ORIG-GUID: -zdefWBHv9CtFI21XkTXOw7kJFbRseCe
X-Proofpoint-GUID: -zdefWBHv9CtFI21XkTXOw7kJFbRseCe
X-Authority-Analysis: v=2.4 cv=B5uJFutM c=1 sm=1 tr=0 ts=6a1d551b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=o9ryCBrv46mMSQ48XGcA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010098

The SM8350 HDK has onboard WiFi/BT chip, WCN6851. It is an earlier
version of well-known WCN6855 WiFI/BT SoC. Describe the PMU, BT and WiFI
parts of the device.

The firmware isn't (yet) available as a part of linux-firmware, so it
was verified with the firmware files from the vendor-supplied package
(wcn prefix was applied to Bluetooth firmware files to make them follow
upstream driver changes, vendor provided hpbtfw10.tlv and hpnv10.b06).

Bluetooth: hci0: QCA Product ID   :0x00000013
Bluetooth: hci0: QCA SOC Version  :0x400c0110
Bluetooth: hci0: QCA ROM Version  :0x00000100
Bluetooth: hci0: QCA Patch Version:0x00001017
Bluetooth: hci0: QCA controller version 0x01100100
Bluetooth: hci0: QCA Downloading qca/wcnhpbtfw10.tlv
Bluetooth: hci0: QCA Downloading qca/wcnhpnv10.b06
Bluetooth: hci0: QCA setup on UART is completed
Bluetooth: hci0: HFP non-HCI data transport is supported

ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x605fffff 64bit]: assigned
ath11k_pci 0000:01:00.0: MSI vectors: 32
ath11k_pci 0000:01:00.0: wcn6855 hw1.1
mhi mhi0: Requested to power ON
mhi mhi0: Power on setup success
mhi mhi0: Wait for device to enter SBL or Mission mode
ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x6 soc_id 0x400c0110
ath11k_pci 0000:01:00.0: fw_version 0x110c80c8 fw_build_timestamp 2021-05-25 21:43 fw_build_id WLAN.HSP.1.1.c3-00200-QCAHSPSWPL_V1_V2_SILICONZ-1
ath11k_pci 0000:01:00.0 wlp1s0: renamed from wlan0

For the reference, the driver looks for the board data for
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=0,qmi-board-id=6,variant=QC_8350_HDK

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 126 ++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 4973a3eb11b5..8e35216e4272 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -115,6 +115,70 @@ lt9611_3v3: lt9611-3v3-regulator {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6851-pmu", "qcom,wcn6855-pmu";
+
+		pinctrl-0 = <&bt_en>, <&wlan_en>, <&swctrl>;
+		pinctrl-names = "default";
+
+		wlan-enable-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 65 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 153 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply = <&vreg_s10b_1p8>;
+		vddaon-supply = <&vreg_s11b_0p95>;
+		vddpmu-supply = <&vreg_s11b_0p95>;
+		vddpmumx-supply = <&vreg_s2e_0p85>;
+		vddpmucx-supply = <&vreg_s11b_0p95>;
+		vddrfa0p95-supply = <&vreg_s11b_0p95>;
+		vddrfa1p3-supply = <&vreg_s12b_1p25>;
+		vddrfa1p9-supply = <&vreg_s1c_1p86>;
+		vddpcie1p3-supply = <&vreg_s12b_1p25>;
+		vddpcie1p9-supply = <&vreg_s1c_1p86>;
+
+		regulators {
+			vreg_pmu_rfa_cmn_0p8: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn_0p8";
+			};
+
+			vreg_pmu_aon_0p8: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p8";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p8: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p8";
+			};
+
+			vreg_pmu_btcmx_0p8: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p8";
+			};
+
+			vreg_pmu_pcie_1p8: ldo5 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo6 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_rfa_0p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo8 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo9 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+		};
+	};
 };
 
 &adsp {
@@ -373,6 +437,13 @@ vreg_l7e_2p8: ldo7 {
 			regulator-name = "vreg_l7e_2p8";
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
+
+			/*
+			 * This is used by the RF front-end for which there is
+			 * no way to represent it in DT (yet?).
+			 */
+			regulator-boot-on;
+			regulator-always-on;
 		};
 	};
 };
@@ -499,6 +570,23 @@ &pcie0 {
 &pcie0_port0 {
 	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+
+	wifi@0 {
+		compatible = "pci17cb,1103";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+
+		qcom,calibration-variant = "QC_8350_HDK";
+	};
 };
 
 &pcie0_phy {
@@ -763,6 +851,20 @@ &tlmm {
 		"HST_WLAN_UART_TX",
 		"HST_WLAN_UART_RX";
 
+	wlan_en: wlan-en-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	bt_en: bt-en-state {
+		pins = "gpio65";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	pcie0_default_state: pcie0-default-state {
 		perst-pins {
 			pins = "gpio94";
@@ -815,12 +917,36 @@ sdc2_card_det_n: sd-card-det-n-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	swctrl: swctrl-state {
+		pins = "gpio153";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
 };
 
 &uart2 {
 	status = "okay";
 };
 
+&uart18 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6851-bt", "qcom,wcn6855-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
 &ufs_mem_hc {
 	status = "okay";
 

-- 
2.47.3

