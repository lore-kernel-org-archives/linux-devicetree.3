Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51053F1ADD
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797747; cv=none; b=JioyiPCzpcPZy/sBYU0lt+eWkk+0OO3JluTxtixjNyZL0Wak7zQJfMf55EWtB1z4O5tj6wAixeLvx0/GoyzqQDpjXTJew1sAOAaMBXAIPy4U1CEup7jEXVulETr0EV7LwrCeeF39PvTiCcr0FEs/EZen3yIYc2rlglBn/pZ3zIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797747; c=relaxed/simple;
	bh=b01C+cALlYI7RrYw5YybzmEoHucSCjWLpt7VPflim3M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ftETYeoBbQZQvW2NNjfDPasZE05jA/Tk8W8BmJSQ8igRdumHpVhj4K8MTNdGpztC707CzNq42iz06wpW0SHqVnIVIBGSoHRuZLCd3o0nIcMuWf/R6viNBvM0mG8uXwJ2Gpo9dLVNKbEgT1hl2FukjcNcKD3OXqB7oLB+5rmUx3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gsiTecnd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVMGzbV4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gsiTecnd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVMGzbV4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8r4HF3790809
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E+aKamOlxYz7AE8Ff5o5Gi
	NcK0ARJPfTyH3Ux2+L8TI=; b=gsiTecndJTGQ8+pMzSqeEUbw2VyQXCHtjFKzql
	twMGxN2dlDCxYWdsqk2eMVgEbUxtg4UwwnixPWYPLyDVYSvfEBCmt6NkLyHz48km
	En4TuNzlqTKvs0EumRh0hX8IH0m2n+sXPzjXsuD7iMcpEWsQuxnmQf9ppUain3yf
	H4PCBpdLMeD+uyhlx9TIi/8J1ZrhiuM9dMRyBG0yL8X9cx3tymPdW2q+hyWyNx6o
	KheI36MV2ppS72CllmyzrMUMlGWlaJXPm2RsOq2kOodmvpFI9DLzXt7k+XtalB5e
	orx/k9CfqeRoewvuB4bQbqbi7l/QXkKaO6Ilpx+BojFr8jng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b52113-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:09:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e6d253330so341639a91.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784797744; x=1785402544; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E+aKamOlxYz7AE8Ff5o5GiNcK0ARJPfTyH3Ux2+L8TI=;
        b=bVMGzbV4TGQY7251y6xNB4IUx+ajJ89kuqzuY4bCnuloIywrTPTY4afV0z86npC/56
         Wk6K84FgZ28rAwhFGpMOB4b0XYhxq4VsUoPC87AQ/95F7AfkdQkVoMnCL31kUveg+oQ8
         YMzj1hUfaYVNG15eC+t3Jq3RPTl3WG9pa2MRFj8oLbSjopYzGjEfpRojqUFLW8w7W7Ue
         +lGI0Hx2uftWIe/lO54VjNITNGmvBTzs3kdefQE7ziRWOn40HiDPjtaetcd0dafsoLFE
         PyAKnFlPcpd70Fs7sGg3JrB9+gDmggdy3w4pJ0kHe2kS0PcUtElKlXx9T53juCzUx/qg
         AsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784797744; x=1785402544;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E+aKamOlxYz7AE8Ff5o5GiNcK0ARJPfTyH3Ux2+L8TI=;
        b=ghpEOAYUaUL5g7iDb/PcIPr/uLRlaIn4KA/OCn+ybAA5bD2nuzj6yBf6WdB9qdH3HO
         EwrZFRfzOMKYy8Ue8enxHCNRHvCCz6bFQU+5kH6fG+t5GdrqqNaPEpo7kurxJqI6CkH4
         CpzzYFRHClSsannJesLEjohhVUPEv/ixSdbFmPUAbAnTE++V8c9AfQ7qM9FjKwAYvvdV
         EHV1Dp4h+709vouHUrd1hjp2wru3O1KBwrVCgzAfEvoabArz3q4mE0WMwWUeFpyDnuk0
         Hdl+Mf9QrTEwUx5c+0E6dwKGJiDc4fQ29OZiUiRMX6et2oGdXpzdxpOOVTQQcV8lo4NG
         dFig==
X-Forwarded-Encrypted: i=1; AHgh+Rr6LkoeG1cJo5SDeQZj/daDhEPB72A/LyWxrp9qKlc9wMz2JGnutBkdiK8q6e8NBkTq6bdIJosOgAk/@vger.kernel.org
X-Gm-Message-State: AOJu0YwYlm/eA5vny3wFE58Ztr1NKOUUPZc7a/fjibCYaCtoFUfIaH4Q
	z1doAA1pFYmOmspYalQa4meKYCKetAmb2mV4+DPCpA51RcosvJyJbCTT5WeDO5u44ZSQESKmF1o
	A+9yHcy5l1hdkRQGka4jamXP1/miLB72XUR/8qD18Pybj+GRkSFJU/esHwRchHLgv
X-Gm-Gg: AR+sD11r+zGSQaylOee8IIvhc8aeGSfDpScIrQa33zis2aE/hd8jI70oiio43eN0Jay
	aFWoxN2l54VFTdZMG8snAoq3fSubRqJq9BGSAHghPdVv0ioW4XSurC5cu8xUwS6mSTaCqcVIL5L
	Ao/9cju/0+3he6PZt/zqEynNJuTOGb4Aj7Xuq1inrBncd5hxmNNewoBltxC8pow3FxGUr+fcbaW
	5Llz7ONl3iEHFBZpfOkRJYw+WuG5VqnzWhNlVibBCo9uE3GI7aEb2V0Q4Js2KJhLJVXM0qR0XKE
	10Yv+RKnVPR2RYkaDEgKOReowrX+X7Ej3DlIz+XX8cwup+ZO/HRNhm5Cpzx5Uh7WEwaNnZ0BtZo
	PGbuIuZJgowJMtykRhZeFim/JTK7FPfZQu6p8ti/d4jpw539sY+ahJPhRwgNTu5e+Qfs6iMnITr
	ZacPaMGIrDXPX9YgiPqU70sd2jtj7hWg==
X-Received: by 2002:a17:90b:4407:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38ec8398549mr1968655a91.4.1784797744116;
        Thu, 23 Jul 2026 02:09:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4407:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38ec8398549mr1968611a91.4.1784797743591;
        Thu, 23 Jul 2026 02:09:03 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f42bbsm15191485c88.14.2026.07.23.02.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:09:03 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Enable mutliple peripherals in IPQ5210
Date: Thu, 23 Jul 2026 14:38:55 +0530
Message-Id: <20260723-08-dts-v3-0-074eb131f382@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACfaYWoC/42Ry27DIBBFf8Vi3bF4Q6Kq6n9UXQAeN7TxI8axE
 kX592LSVpWaRReALnDPDNwLSThFTGRbXciES0xx6LMQDxUJO9e/IcQma8Ip19RQDdRCMydAK6j
 33ATDPcmXxwnbeCqgl9ebnvBwzLz5tkm8Swhh6Lo4b6seTzPcmJyv/g5TcqXatnosB4pJiCFAH
 A+KMwoLAwpe5Saa1qPU9HlIqT4c3X6F1nl6ug/STFGbEbZmkjMhDTBY3OSaPN5dX/d5Pbve9f8
 FGsqgc3HvhxMsPNMUavTBGokS/w8R4MaUIOw/YBH5bdJYhXbjNkHZ+5TRzWFXGEIhtcJ7q6SQT
 sjGaqkNKuE36JDJ1tjGMa7ImsUupnmYziXjhZUwvlow33GWz20DWp7NoWHNnwYKaeG/3Ez9uPk
 aDdXUa4uUK33Hfb1ePwHgd4SRbQIAAA==
X-Change-ID: 20260706-08-dts-e830bb27c72b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5MCBTYWx0ZWRfXxy+kuNx7rije
 zQGMQXgn/Ti6f3DEL7vDnBtIbKyzIQeoWVFpdNJEggjROFcNve//taSENOCLOBrTCuDw0MrGJh+
 sSFV/0FdY//spqJ1jL5bieIr2MGE4hsW7uzJN/KlRsQJY9NFnPX+v5fDzl04cIdsS7dCO0dEKhx
 yHA4zHISdl0ix2CiA1f9/bwaHaTauEhqLhjyIJ/V299WX/gNc8eCR8gzK2HRaUPwJuEz+ngiP/i
 HDDds4DuDaS2dyWNkhoybfNti5DWLdSCBOZj/gHJ3W2IrrBgwo/BlvIx1Q33vktdPBpcmNPz0l5
 iYtwJRUyRbRgNyh5BydeohEjJrfFjy6CM0Drvc77ytpCRTh58jc/Jty7stDT/NNt7jN2MlJAF5J
 ybG6MRzNZPb2gTmmJr43v/L/Faejzvpvu5ugDNfdWIFv8ya81sHyyf7aSaMmUKxLILL5DagkY9c
 9j8QU3yHBV8+4yLjleQ==
X-Proofpoint-GUID: m3QcMOhWJZruju8p4SB3MxpITY3eRGOK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5MCBTYWx0ZWRfX82f8exveof0d
 i47H1Slosf3wRuQt5gr8PIwC17WZgcuNW0u96Cd2auZ1vTEmX/5uniwOuOqsHe0W/yQs409oHoO
 Y1+5bN3tN1CLGFgz+oU0lvAuR5xfzwE=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a61da30 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Qypwj0kMYNkJ_6xT184A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: m3QcMOhWJZruju8p4SB3MxpITY3eRGOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230090

This couple of patches enable mutliple peripherals like USB, PCIe etc.
Additionally, it enables CPUfreq and thermal tripping points.

Please refer to [1] for initial review comments on the PCIe related DT
changes.

1 - https://lore.kernel.org/linux-arm-msm/20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v3:
- Address v2 comments
	- Introduce RDP504 common dtsi and two board specific dts files one
	  for NAND and one for eMMC
	- Move 'dr_mode' to board file instead of SoC file
	- Dropped 'polling-delay-passive = 0' and 'polling-delay = 0'
	- Use THERMAL_NO_LIMIT in 'cooling-device'
	- '\n' before status = okay
- Removed 'num-lanes' from pcie0 & pcie1 nodes
- Link to v2: https://lore.kernel.org/r/20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com

Changes in v2:
- Change usb3@8a00000 -> usb@8a00000
- Ignore other comments as they are covered in the following prerequisite
  prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
- Link to v1: https://lore.kernel.org/r/20260707-08-dts-v1-0-fce82e14cd1d@oss.qualcomm.com

---
Varadarajan Narayanan (3):
      arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals
      arm64: dts: qcom: ipq5210: Introduce RDP504 common DT file
      arm64: dts: qcom: ipq5210: Introduce RDP504 variant specific DT file

 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts   |  17 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  64 +--
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 604 ++++++++++++++++++++-
 4 files changed, 825 insertions(+), 69 deletions(-)
---
base-commit: 06a508eb73747a8a71bed89f5766226e433594c5
change-id: 20260706-08-dts-e830bb27c72b
prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c
prerequisite-message-id: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
prerequisite-patch-id: 66aa95814074faffb61393faa30396c42af41126
prerequisite-patch-id: 0a03dc1c91a2f0c03af823aa43f59a9005eb8607
prerequisite-message-id: <20260701-mailbox-v2-1-5e6ebc874e4e@oss.qualcomm.com>
prerequisite-patch-id: 956b405a71f384354b5c35a44b97a0a2dcf65eb3
prerequisite-message-id: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
prerequisite-patch-id: d9efdd8a09b028b1343243c5f0e78cf3e8b1e253
prerequisite-patch-id: 36cf721e00f3f5bbc3ccdc0d39503c5899771085
prerequisite-patch-id: 35e083bb85434a34d86467e53b9eae14f78da125

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

