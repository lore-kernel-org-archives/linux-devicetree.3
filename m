Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57ED3B6366
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 20:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782419965; cv=none; b=b+v7Un+oW4/ENgX69t8AKw0t8DiYNDR5hGQ7f8SLAHR767FKA9b45S6EenOhxx54JzgtTvTQs9LFfmZvykwLbBp7kaEfxvc+zhEeDUQM9aSFgePjgXZ65GrANS9sbzHDDJZwEWAXeZIuGnFhFzteqUbqD5j1BXYvkkB+3cfP12w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782419965; c=relaxed/simple;
	bh=i+0AAz3WDNLaIrf5TpMkoF5mSyPu7bbMM7mmjXJH9WU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ffPJbHclHgzXrD9sbw2UcTnZ2dp6HyGMCyU4/a9fgimYtYjCQVwNOy0ctn2ATx6TXahUEKhhtsTa+UvAJMHSp8m3kRH+dvbt9VCAJAtL4Xo7tSA2NMO9wGUyq2PrSigtBfNjyv7MPKyizW3G3Xd9AUMo75QF8BtGmO1Ogn/fi/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cay3Jf4t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LxLx3Pso; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cay3Jf4t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LxLx3Pso"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFe5ur2801337
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 20:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wQ0wPa9pi/vo3Mf8WPQJr0
	IWTIlooFDEEgQnkHn1StA=; b=cay3Jf4thwdk9ESA2CKIAlvIAYcruFdbSVmlLk
	cBb2uCuNnpnTiQd7O9f9dKVhVOTM1mzevbMvu4pVbLE0b1wXzMy4hkhM0Gmcd2rS
	UpRuSGCaWtlc7B48W/A2UbSHx2ZKEqZNkFppcIMBba+o/CnPVzyDPCdUaVtx7RwP
	y1LbrusxmcwIfSK28cxYG7N5D8b8jO8mz48cHhBI7XGna9r+K3vSrcNA28j5fh4q
	I82enO3aAzDcEEl+KJpeGktEIsxhfzjL2lhf543sW6ou7XTbOgpsuQG7d1vkTTo9
	i5hEFsF/2RwGTmYbjkWmXmIacY8u1kfvPGL6Id6//BuIZqkw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uhmm751-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 20:39:15 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b70ca7e5so517954c88.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782419955; x=1783024755; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wQ0wPa9pi/vo3Mf8WPQJr0IWTIlooFDEEgQnkHn1StA=;
        b=LxLx3PsolJoPpIYMq1/MbDN0qJ04jY9Dx7Ttcc7w/fP3b6KRlGml567PiW3Ro5SoRd
         Sy4PeQCFV14TOn6V4yi9tJS+2DGk4PVgH8gWrAR5nibiL7p9bJ73E03ouyyfNnPIXWGJ
         vdk/szIXYD3HbQ9pBA7wVw1/fa/2oCnnCCD/hz3xIot7xpltDidVPhVX//AwH0v4e1RS
         kNvYlZKAUfkipUzvJfMd/+0EG8uBPGl46B1orV5SjmQchCwy6RxomWnBnVx2lW0lM8Ry
         7y+C4OxnS/7H/g9XRkLzyl+/lHx2Ejav/9dTF/Z3JOWVYODcfsYheOHs9DKxLhdxYOEp
         uJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782419955; x=1783024755;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQ0wPa9pi/vo3Mf8WPQJr0IWTIlooFDEEgQnkHn1StA=;
        b=m7nypktQteW2si62bBkkwn24n7giKo00FLaaqL8OYWAZ0N4HEae/r681bGeoLUq12L
         cu4TNhy+YDzYNuObMNgrs+kvtSPxoX8JqyG9SJu1YYgQzRO5/PIpmfihlCTUjq73S2RP
         qGcVJhXNIBLKbUCedbeVwOEG8SdEqJ/4JWKE0oXS4UrKOziLzkDC8CHjGjQgZMCFBf/y
         /+8YSMyKRXxdb59eJ8QlOPy4rGCEJ1sgiFJhQZas6pcR6X0D88Gq7m2a4tMKbYJB271o
         L4DLVBuUcSJk/COHTren0Fu6UaIKUprT4Gvm68t53qtT2sW3U/YBizhkaCtd8ZmAR4Ra
         llcg==
X-Forwarded-Encrypted: i=1; AFNElJ8zsa+SQHCWYRu/bn/Y/rKoW73cBJW4+qKK7YGe1ndOBABLiB1TtGhINJZr7SS880VwLIKHqr6kFSRb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/vrDLG/heQ4XOXXwFeCE1jfwL8q1KzMUDxFCiU/A3YVmqbgef
	mWtTKnq6+nSnI3m/Z7/PejRbcEqfpWixl5rKDZZuim19eVl59X+RNSg5Ur7HU2ZZdnRODg8sWcU
	VC8LDEmwPL4wH2HcqOHdaSp5jbMwwW7K3485SsAkkvYPHUJ/MkXRMQkSQ1ZIUd8Jc
X-Gm-Gg: AfdE7cmdSgIaLN7s6Akw1iDiTMEyVYmq1IVeX1fNWm1+ShbmzUql6Rbl1a1/83FmRLz
	Klo71AVZQ550iPle19mskklKFxPpxzFRXHZJV102l1NgU1kQodydmJj2FlifGAE8oJdCsWq1fAL
	ySJw1Xfuj0yv9eJvYo5q7HWH+DEJNgtRDv1mo/+fbUr8f08OVHuHsN0l8q8NyPUFxCnLjssZPCa
	KQdsGbtYxwhtLb2m5MEmV67WADb+zgeqgpwvGxJ0nxYEYZWRVraCFhNtNgTePEXzGWK+naB9hAe
	/r++YP4iXWqYk1g6iuIzR20tOcq8176ODhsEcY679GjNj9Xq+xV+Zb6fMuG7Sm3RW9TCbCoOkbs
	+gjrTy0IPRXu6yNiVS2MQl2nPxn90KHLj5q4ST9am53txvcR2
X-Received: by 2002:a05:7022:ea21:b0:139:8172:76b2 with SMTP id a92af1059eb24-139dbaa7203mr3356179c88.21.1782419954622;
        Thu, 25 Jun 2026 13:39:14 -0700 (PDT)
X-Received: by 2002:a05:7022:ea21:b0:139:8172:76b2 with SMTP id a92af1059eb24-139dbaa7203mr3356150c88.21.1782419954100;
        Thu, 25 Jun 2026 13:39:14 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8ddcd34sm10858623c88.0.2026.06.25.13.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:39:13 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Subject: [PATCH v4 0/2] PCI: qcom: Add PCIe support for upcoming Hawi SoC
Date: Thu, 25 Jun 2026 20:38:57 +0000
Message-Id: <20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOGRPWoC/3XOTQ6CMBAF4KuYrq2ZtlDBlfcwLmCYSo2CtoAaw
 t0t/kRMdNPkNS/fm555cpY8W8165qiz3tZVCNF8xrDMqh1xW4TMJEgNMWheZhfLT2iJGy0iFWM
 WSUAW+idHxl4f1mb7zL7N94TNCLwajs5tGGk+tdL6pna3xwWdGH/fY8lkrBMcOGAqIAVtlhSva
 +8X5zY7YH08LsLDRqyTE0CmU0AGoKBkiRpRKsA/gPoAWnxdoAJglEgSyE2u6BcwDMMdHgq69lI
 BAAA=
X-Change-ID: 20260506-hawi-pcie-f61435ca420c
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782419953; l=2300;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=i+0AAz3WDNLaIrf5TpMkoF5mSyPu7bbMM7mmjXJH9WU=;
 b=lpd/QUzmVBs06zOMfbwXTuUN+pgdY32SFFRwkrj2d7jUlld75+y3T0UpNWu1IAERG6oXsorxZ
 HIeMqsU79MmCuB594dOWZ5KNSnWZ+cU5vywiacdnBKqQS3C3jSAEtXr
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=cqerVV4i c=1 sm=1 tr=0 ts=6a3d91f3 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=yFGAn9Q8HXAzXJEDlGEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE3OCBTYWx0ZWRfX97MhqNIxodNF
 HsKpJWLBSCKV4y3fBYk0TySncYA/wW5HVbNd04AzP/8jksRT1AGByq1pZ75czXSXbe/yNLLW5sp
 cSLV9+IJxGK9oewT8wF2OGobq9QtdPHtxQNuhH+WdItD1NMqcZz9kzE92kZZ3zUk/vgXW7dRmOL
 uvqywtRqxMAtCyOKjN7WY0wbkuVDyCJF0kmjtK1zZmnXYCeOwOeoy2cEbGkoBnh0UcH7UUpwAyG
 KdWbR7nnxMcRPrvzpCfp+9eC+ku/8J9CIrrbra/y4oi5mPOpIbyXpIWn3a5LHoB3p4gvO6evrPw
 dBIc/pwgDfrBzK6s+87F5fzZTuaBhUnKD4G0FlSS8wCTtZoi16O6aa/T5qCa2Va8SKoc3YvtjHG
 aaz89dZ/R+2BsJemSdKhW+1dzpYi4H1ZqLDGCWW6PrAmWS8ns8Uk4/2JXHgw6MQ/efyh5eMWoBj
 xWNkhw2+f/IlVl613YQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE3OCBTYWx0ZWRfX6peTeH1iuY1Q
 Cb6W01HP2Iehe4HPUiB32EsQ7RYcLVK+g+o68lUCQMcck+yejP0t3nSEsREh0LoR+psWhcOMnSF
 vdK0F9JVdeuzdM5H2ocykQ7d838BQgc=
X-Proofpoint-GUID: N-O5SnjTUGRLnBQXE0lP7RQtNHEs3qQm
X-Proofpoint-ORIG-GUID: N-O5SnjTUGRLnBQXE0lP7RQtNHEs3qQm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250178

This series adds PCIe support for the Qualcomm Hawi SoC. The Hawi
platform features two PCIe controllers: one capable of Gen3 x2 operation
and one capable of Gen4 x1 operation. The first patch adds the device
tree bindings documentation for the Hawi PCIe controller, and the second
patch adds driver support by enabling the Hawi compatible string in the
existing qcom PCIe driver.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
Changes in v4:
- Dropped minItems constraints from reg, clocks, interrupts, and resets
- Link to v3: https://patch.msgid.link/20260618-hawi-pcie-v3-0-f31880bfb3ec@oss.qualcomm.com

Changes in v3:
- Updated binding example to use ephemeral values, removing cross-tree
  dependencies
- Link to v2: https://patch.msgid.link/20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com

Changes in v2:
- Rebased onto a newer linux-next snapshot
- Previously required dependency series are now queued on linux-next
- Added minItems constraint for clocks
- Moved description comments for clock-names, reg-names, and reset-names
  into 'description' entries in the devicetree bindings.
- Removed maxItems constraint for clocks, regs, resets for the fixed
  size 'items' list
- Link to v1: https://patch.msgid.link/20260508-hawi-pcie-v1-0-0c910906f7e5@oss.qualcomm.com

To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Wilczyński <kwilczynski@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Matthew Leung (2):
      dt-bindings: PCI: qcom: Document the Hawi PCIe Controller
      PCI: qcom: Add support for Hawi

 .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 196 +++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c             |   1 +
 2 files changed, 197 insertions(+)
---
base-commit: e2cae00c05d196491c318196792297f2dfbaa02c
change-id: 20260506-hawi-pcie-f61435ca420c

Best regards,
--  
Matthew Leung <matthew.leung@oss.qualcomm.com>

