Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472447;
	b=oqgF4IKCcGi8EdGJ5bKyejeudRfNNmlFxTWWQYpt2zY+uslNneF5dtommPdtbkdEUqQB
	 aX82n+2N17oNFqmCR4K7eqHTpvZcM2CNR2gXK9/D0qxNiMpUplIyR8ojJZWzOutNCiKsc
	 gNXC4kVSr9fiXXt93kn6Sdpw8ox27ty2AJ8aAFD9Ba70LkiGJ4QFLVugAt32cCIJ+VFyL
	 Qu92ooFerlfVF75YpUUxWf4UMB3i4Lid8zel9sXKMSOioUADu+vYlEusMSBqi5cr0Iuj1
	 vs3EOyALSUJFDxDd1RBGQ+fjLg6iwwV8FJe+VK55NJveso6kODkDsfniwI6D/A4cUig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472447;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JA2MLM/kSRhbbemzPOhXyM8O6zmbUZeLkRPWG+4Um8c=;
	b=kAZyN2eSOFx//SxcvZlXQTzHKm2ZjzhiXlvF/9Gu0oh4Ti9403mjK/9NYmyYV/RquvSx
	 rVD7mGZYIT+VZ7zNbMiqh1yq/HU7Ytv8FDt9XbsTQJcafD5QrzaMNeshmC7Z/hdItJf6i
	 axnpsLCqCISQt1HOcWj0t1ZyCOiOpAp/cGi7OKDcOpVJvZ9AO/s8RvwVaiZyq9h4xmPN+
	 xUBrbTgtE+UiCFYvV0bvNBs8dWBpK0pmafv28bZkRMUHDuovJAxVNcvq0iac8zVfzpF5X
	 eVndQn+wdzbmGQp/aEu0Ov7p0r+xkLl02TA6s9gHtmWmakvqmkEjNE206zExQUzClug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LTXSISnD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Uh4ZYP/d";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7096F60734AB
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7096F60734AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LTXSISnD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uh4ZYP/d
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5ne4I441579
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JA2MLM/kSRhbbemzPOhXyM8O6zmbUZeLkRP
	WG+4Um8c=; b=LTXSISnD2o29P/Ymftsq5P9ISlcV2UZZa3dUIrogaFsG6fK8yk1
	7fI9xFKg55kb1Jop+i18dbSwbFvRZdaGqeBdTta1ArDT0BspNlwoeSQ85T2uwNwl
	Jk7Mhljz29L6/3cIrPTnb8/BUJ9Dg58lHZzYUM5FuzH126RD8+efgfV18vzSJQdc
	Ft2Vdwk75XawrOlBSeu5iEjYMx6h11EVRMGzlqLEWFlSVgwU0YBRDT1plZIauIcT
	zsP7Ps9ii4k1RHUSRMH+Z//o7jFbUCeRJmiQMdhhjM/gXQR6uyDmoMYpr4yzlIxb
	M82zRNSFQzOpWfnE0jo+o8qzKlwELmfr85w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc0k80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:34:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd694f85033so169457a12.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472446; x=1795077246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JA2MLM/kSRhbbemzPOhXyM8O6zmbUZeLkRPWG+4Um8c=;
        b=Uh4ZYP/dw65r95/KGsFsQwrtbvyghA3vs56A0kWWWqcgd0lBP37JF1KgiO1Cfpbs8N
         lrVhpCVV5skaYk7J96Q/6MQBa1aCQAj8JEBJXm0WXTOWY4VFAnWIvNJf0Iq2cQ0oTwD7
         mXQqHL5egItEZKE6BGXGfjLQJ9tASKIoBVd/Xv0CKqJsVDpzJp1wHso+IvrpHJE0mfgz
         8GzohC8DHUQ0VMDxXpt92r5xrtv7MRoE/QnfFft6QnziNcFuY7Dv+TNQl7eGQFof5X+z
         mw1RewSCBn+3znOEVUZSIa/+IF9vGA8HyvDTmuFQzgDFNox+nTUDmEEEpg/hA0TUtH0B
         OkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472446; x=1795077246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JA2MLM/kSRhbbemzPOhXyM8O6zmbUZeLkRPWG+4Um8c=;
        b=DgUKVwc36MepM1v2lrQvqXrIDh8dw9bS1ERy8hEZorRxkT/xqwGlBpxsrcQ5pir0GI
         adyKNIE7eIxAb2x0dhuJVCldq7/WR+JEa4UawrBgkdSWKlkxaXnfSw49qKtMlOEXySFm
         9XWkf7bcgmWD7SzhNZol8relM4zfQ2KVoL2MruKs2kU2Twa3+DKW4xLXsuYZMW9PBu59
         GvjQiNrewLKXTyff31P960vOKBZtzFVW+9dJ58E5sYGD1sRxwqMh7ckx8h0V5z1C3tsg
         AW9yH2sidkpIYFKOxRuNXuETYux1PDMeuDRRgSb+WwctbwkFJcqQJ71iDe/aX9zorH+B
         XP9w==
X-Forwarded-Encrypted: i=1; AL+hErEYcSNevqyOyEcEbV/fmilwrpL4MnGLGX3rm6I2oj05GitCatU/adkTSSOKkULAYK3qc9YhR5jR4iGQ@vger.kernel.org
X-Gm-Message-State: APuU4Z+1gaFgg0X5AZWtIBZiww8YgLB4D0cxpqxk0M7ncGGLE9TjrtXI
	7B1jg3sOqd+UWIFtBE6wDbk5ppmkwB2aTAJk8bVoKvTrDR4i12a21zGaSywRvswtamEEtsJXXwN
	oM9eZB/v0ax9EeSQf8oZgvYd+1xzApG+OY5e+1OBoBIyFS528wEO+GkHfr+OX+RAq
X-Gm-Gg: AYBFou1o9fkmr0bm4BlMS5+8KNWcJ9k9PfRpqGmFVjKt77AP2yQ5xENFA37THb0lL2I
	Nix7LJpDccFyfQLo5/PdFNZ+puD8kwO1iUqCcrGBmw2p8X8EF2oxsVF/xF/3RpmbqcAisPDI/6A
	LFnGtTh6nhr6fDyYQpr0c8On3ltpaZEP3RaLLr+TAvsSmxdZABlVwqPKKY31vnMTIUKJhVjzWhE
	92ldy8/R8H344un+jbH0oFbI079w0qh34k3VppWTIvdaCOInN726Ve43xU+/GkqOYysiND2t8Iz
	pPB2ai2bRGAdMs1azEHOJ09s3sdugSZNWXMM1xNhkONVIJ1kzbpqS8SISOkW/tICcb+pUIQPl7C
	k8ca+93kl/D4eklZdBEgE/5UvYNe3dc1N15liRoJequgpDBpZp7iSE1p8y32Tdyuve/0ZnGa1Wn
	TxGw==
X-Received: by 2002:a17:902:e547:b0:2ed:630:40ac with SMTP id d9443c01a7336-2edd7751683mr80863345ad.2.1794472446152;
        Thu, 12 Nov 2026 00:34:06 -0800 (PST)
X-Received: by 2002:a17:902:e547:b0:2ed:630:40ac with SMTP id d9443c01a7336-2edd7751683mr80862985ad.2.1794472445681;
        Thu, 12 Nov 2026 00:34:05 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4b950sm29351705ad.13.2026.11.12.00.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:34:05 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v5 0/4] PCI: qcom: add Shikra PCIe and M.2 Wi-Fi/BT support
Date: Thu, 12 Nov 2026 16:33:51 +0800
Message-ID: <20261112083355.3884737-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: peS65DaiQc_QPuProC85SsNcMJmv6EZQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX24savkIYNP5X
 8cifXkToYoA4d1FTxAKuE/uRLHH73AGtVql66kvobCmKZ5z2M3Xb+OD+yEvsH5UoCdQhFctB/WM
 N7uSxB86Gykpz4x731YX4uzUe1n43Xk=
X-Proofpoint-GUID: peS65DaiQc_QPuProC85SsNcMJmv6EZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXyb3obN+I6Atk
 owRoZ2rk+JuxDCPs69uCwHi6hEiYg0yYcC6i8Y8yhJ8vfvM0NmfWh2Rxa6d4HDhkBP2BOpmxaFS
 gI/CNz5DtHy8uTDrUlb0iAuAZ4JP6jkpOM297MEZ8ovkpRGFIqkEc/4+JFQX4nNawqBrrNcNTfK
 VNqxQBPIXwJtYB0H+/Xq1r4oVIjyRJK2VU8OJYXz8oNLcWzvz+7ZwefpjFrbHjx7NUCk9k+6SJP
 Ay9bA8WS1olevHvYBhIX49JgAQduzBj/AWwcxemJA7tZZx5ezlpVt15xBWIg5t9RRuAG0MxEMW/
 qy4u38D+m0VDoIfiGGf18XUB1N4dX1zD1tpfUQbKscg7in4/7u3PDRv3ScAkaNalpZ2BOT2hxio
 dH1+QeO8DOg7xkcrIKHtqpUE9LQVff7jxAsosmsqJq4I59ZSisucUoxOSyOfVjP5AS2sMbMsqTN
 R33y+3ujHXG+f1EFoKQ==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af579fe cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=f2qYStR2zr0EFXCAC4wA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120033

Add PCIe controller support for the Qualcomm Shikra platform and an
overlay for M.2 Key-E Wi-Fi and Bluetooth modules on the Shikra IQS EVK.

The previous overlay revisions depended on PCIe controller and device
tree changes that were only present in the Qualcomm downstream kernel.
Include the required PCIe binding, driver match data and controller/PHY
nodes so the overlay can be reviewed and built against linux-next.

The overlay describes the board variant where hardware rework selects
the M.2 connectivity path instead of the onboard WCN3988 path.

The series has been validated on Shikra hardware.

Changes in v5:
- Rebase the series onto linux-next next-20261111.
- Include the Shikra PCIe binding, driver and DTS prerequisites.
- Make the overlay self-contained on the upstream Shikra device tree.
- Build and validate the base DTB, DTBO and composite DTB.
- Start a new review thread instead of replying to an older revision.

Changes in v4:
- Build a composite DTB to validate that the overlay applies to the base DTB.
- Explain that the product design does not operate the onboard and M.2
  connectivity paths simultaneously.
- Report Bluetooth UART and HCI validation.

Linghui Wu (1):
  arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and Bluetooth overlay

Sushrut Shree Trivedi (3):
  dt-bindings: PCI: qcom: document the Shikra PCIe controller
  PCI: qcom: add support for the Shikra PCIe controller
  arm64: dts: qcom: shikra: add PCIe PHY and controller nodes

 .../devicetree/bindings/arm/qcom-soc.yaml     |   1 +
 .../bindings/pci/qcom,pcie-shikra.yaml        | 192 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso   | 122 +++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi          | 158 ++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c        |   1 +
 6 files changed, 476 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie-shikra.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso


base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
-- 
2.43.0
