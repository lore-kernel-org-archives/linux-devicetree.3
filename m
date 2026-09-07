Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4F73914F0
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 07:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765919; cv=none; b=CuD62w+SNlLY/px4+c/hxTZa8dtkABZqj+AuNkBhG/voiD/mH2StRdvQoxImeHL2B9qbjqlOtAErU9Wq+aKbimGrI67i9WVcT0fnTdlIpMMbtrZ4ThV+H5Qr/soq4YT4lxW7Q51Egk6WCqST7xv5XwcgiMpMokPzMPFKj7txmjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765919; c=relaxed/simple;
	bh=FY37/8KA47VN8fP/68+GJgKFpqamyHZPGDD4qbtA9ZE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LdlAV2gy3N59d1emE4fAq3PzjPHTS90FMRLUVwACHMmfvvdbZUi+ZxrXZABzS2VGBZCE1puFsySLchIuWiN2U2rFSZTdrnS15S5Rdb7e01k7/CBw7dSm1F0ujhySCUokkm4Tg4zhypzmyJn8fVmsh1CVZ9wMyTP3dvCagdK/wuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RjYzJpZw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJx28miU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RjYzJpZw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJx28miU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777eRn3903337
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 07:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xf+Mr8tzeyzCB/+bA9XBCA
	ccLWFvBcPX4vmeg7fcP0g=; b=RjYzJpZwSykdUuVQQ6VUfmdU9d/VsQkeWWqznJ
	McpH+TDf7PqRmY5fiIfF/vZLlSLXrrkPXzZg8FEfzwQR2DcC2tX4G1onibjvuzXD
	dvHUrqeOdz5RzLQfdTbyaS+uQaDHYWM8V86LYEal/yLnck6EzSbbTa+OOQjcfT7V
	b1HuF1+j9ecK1F9/CYJlduAbJRod+cM0CX1fLOimXXusbhl69TYdrpZ8Mf94wwhT
	Z5k68dHR02d1VOqTWfCusTlNwVTFllDE9DRdNxyEyxJMX7rlkp65dbBUqPMFhC5D
	viAfYFY56/KvqAVmTdBKlYmRo1QjNyWnkFzg7TCyWWWpAtzQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany5m85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 07:25:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6f73d0f89so42426055ad.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 00:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788765891; x=1789370691; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xf+Mr8tzeyzCB/+bA9XBCAccLWFvBcPX4vmeg7fcP0g=;
        b=gJx28miU7KGXVY0FZQPvJXwaUBYNnoQiMPGkjt9MEkd0mdJ/2MYXYj3bFiM+3vuRo3
         Iq1cY5IGVRPUmkcADRORnoCBgbyP3W39VxBP3KGLOK7QhaztF9I5f1P+dT/YFxRXpal3
         6bTEmxKkzlP53dlWFALVw1z7SEZS+MNTlTkZd5YBu4N2Wu0G7Upvo+LfjNtTe42NHaIt
         39BM4YXnYPqS67AJYG/fJRBXh6k5bXXOt7fhaCZr2EkHvxukbYKLNu1arIYtgzMxTNdH
         Dm0XxbBoq5EmRuUHegOeeBFHGr6K9zEYXMiTMkzhiYPIkQ1/54XG61qP6E1rK7XxzCxm
         cf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765891; x=1789370691;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xf+Mr8tzeyzCB/+bA9XBCAccLWFvBcPX4vmeg7fcP0g=;
        b=lkrhPe+JKF9lvATBky6i8N1rnzTUNw4XdyrpHlx+HfgCAyQB1qHwRIbjBray9ybjuH
         pw5mrQrg2OwWBRSeeekc/tDg/ng9h+7RKVlybnlqZ0txt+cNFy5yLcdO+n8lXj9FYQ95
         5xfmbXJQRIepX+j33FpSJjMHsT/CxzbDnrCUG1uxcj9QErC5138shiX2W28f7zgmFYyx
         5WFdse2IyuosjhoJbFhgsT01Q5Kh2bYa94++FT11FaHPfAPRSMb0XIjU/amC0EHWa31f
         NenWEa+hshlikEa9YgY/Nkb+AUP4kWIR/by6ZJiYivthzoonuPSvxAqMKWHybejwlx5P
         rPuA==
X-Forwarded-Encrypted: i=1; AKwUvBy+RGTfUUGdoRoNk63Q2xljwrTS8VTX4ScbrUN9908afSsOqIobUtIHRvrWEv/dgcA+WRswKebSIrAd@vger.kernel.org
X-Gm-Message-State: AFuF++kg62VQNpxcsJ3NsY6rcJjCDrj0xj3tg971ohsDhFuqzdTq7JdJ
	a61ImyDzQLe8txbhzUh+gkQUh8uxMZRYw9++lVIKIjVLIjRb6Snhkk+mHVMPhEO7cia5p3/DaBH
	74Vbw2xEoUrrtQpAMYvlGuNUNCf6YbDDT+x5SfYCZxj1tNiC4FEY1Ey9P4zh8NJ7s
X-Gm-Gg: AYBFou1I0gBiedIslLdffjH8F3ug4Y8f565frrAi+8e3TlZ9KMQWyJa/GqJtstYke5u
	CDJVTyYTq3ovbbKXHNLm0DjYzoL5O8SPUAJ19Vxqxrlq+GRapWjaEFyFYMYIsYjaPUIDW/VLD/P
	ZAnA7arlkDtMhZPanOrm2GCFy/qYM6uXkp6hz/zYe2rSwXRuOrQz/6KoouqC8kSaciVlzTcPy2x
	eAVZIhQDhp0Sn2pEFsUXpUmQeIo/bV8OJ5+Vf69ebvynyfYO0ZtGu/zQp1hMK161cPri6yg8Izt
	qSz1ocUblstguffAuJ2NRDKXTmgqd7Up6p4VxYbEoQlsePQmZ525SNy2+rVWBUitcuJs64BFWpU
	YEVykytjzCcEcN08aOloNoOiqYd1qdHUIXo2UgWG07te5Cwl6TX8iMzv6qxIW3BZ71CiGzvFsmu
	rtWXBeI5h1V4KWtYA9sRYgqQpxcXPYpA==
X-Received: by 2002:a17:902:e952:b0:2d8:d4ce:9f32 with SMTP id d9443c01a7336-2db12754d9emr320828925ad.16.1788765891219;
        Mon, 07 Sep 2026 00:24:51 -0700 (PDT)
X-Received: by 2002:a17:902:e952:b0:2d8:d4ce:9f32 with SMTP id d9443c01a7336-2db12754d9emr320828445ad.16.1788765890781;
        Mon, 07 Sep 2026 00:24:50 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm26161861eec.27.2026.09.07.00.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:24:50 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v5 0/3] Enable mutliple peripherals in IPQ5210
Date: Mon, 07 Sep 2026 12:54:36 +0530
Message-Id: <20260907-08-dts-v5-0-584e5ab50b40@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALRmnmoC/3WQS27DIBRFt2IxLhaPf6Oq6j6qDvg8N1SNnRjHS
 hRl78WkjSI1GfB5wDnAPZGMY8JMVs2JjDinnIa+FOqpIWHt+k+kKZaacMY1M0xTZmmcMkUrmPf
 cBMM9KYe3I3bpUEXvH5d6xN2++KbLIvEuIw3DZpOmVdPjYaLV+czkwm8wZ1dvWzUvdUOBpCkEm
 rY7xYHRGSijXpVHxM6j1OxtyLnd7d33Im1L93pfpEExWxS2BclBSEOBzm50sbQv17d9GY+ud/1
 94dZNYV11QiGzwnurpJBOyGi11AaV8M/oEGRnbHTAFVkCWKc8DeOxBjtDTeA3Q/OXYf1RF9DyA
 ocI8d8DqmnmNzSoK82XPJhmXltkXOkHtLihubjSZUaZkehBQCcsf0DLW1pe6TKjWqEGByXfjt2
 hz+fzD5kIDVleAgAA
X-Change-ID: 20260706-08-dts-e830bb27c72b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9e66d9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ASWaWnsz8j2Ky6kNu3AA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: nCcTOP3DnAzNf9Dv45gMar4oZsjy1gEG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3OCBTYWx0ZWRfXwhgEIDKuhRoO
 7bNrMjQduywlihbi9b46bcLdDv3MShNrUftr0EcXUbDTDmBMx6CBAoWV3oSOYj3NCvp8a2TSby4
 Lp+213HOW1zWSZg29nSShDV/xJkeorZxpUX28/gGuwuBRKCGDkwCmYSN+lStRTIykLL+Jlpqf1+
 bp/o/npbAWLNao3ZvFZhrAqklZJ3ubP3yXPBENQBNuMa/RKnzqNruI2C4tlKzp7mrrMdX48J3Qi
 IjOGQddfSjqCtAXaWKwNTl6/QoFVoOvDCTz2hsob3yb0XpAjVC6z3+NYM0vrIt+RuKydiVkvt45
 o3OQnu9PmAmAPlMcC1AbQQF8vZ/rK0BlQn15qOWVFQ+17/qcxpXnmYGaZ83FBnDX8TU8Z1uswCZ
 ow8NL3gBDR4WsF3VTKmhBji4EFQx22DifKgQ6JE79JNG0qPPCBJysbHhd6HRTlYrJyOqnH8NOmp
 rOV1Zp755rgAsGJEAyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3OCBTYWx0ZWRfX3bvSpAeRFtvF
 Ya5BRTpfUHigwPbJ+6OHrs30/7Mg+OI4MqULeGmCjh5DDtuG1g3pVKTzDk/0XuoFQz8sn0yx+tv
 bixYRfIbTEOYD9XqyOaxGdqenEDoRUM=
X-Proofpoint-GUID: nCcTOP3DnAzNf9Dv45gMar4oZsjy1gEG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070078

This couple of patches enable mutliple peripherals like USB, PCIe etc.
Additionally, it enables CPUfreq and thermal tripping points.

Please refer to [1] for initial review comments on the PCIe related DT
changes.

1 - https://lore.kernel.org/linux-arm-msm/20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v5:
- Pick one R-b Konrad
- Do not remove ipq5210-rdp504.dtb from arch/arm64/boot/dts/qcom/Makefile
  and add it in a subsequent patch. Instead, move the ipq5210-rdp504.dts
  nodes to ipq5210-rdp504.dtb-common.dtsi and include common dtsi in rdp504
  dts file and introduce rdp504-nand dts in the 3rd patch
- No code changes
- Link to v4: https://lore.kernel.org/r/20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com

Changes in v4:
- Fix following sashiko comments
	- Add #include <dt-bindings/thermal/thermal.h> to dtsi file for
	  THERMAL_NO_LIMIT definition
	- Change tsens interrupt from edge to level
	- Remove ipq5210-rdp504.dtb from Makefile in the second patch to
	  avoid build break and add it back in the 3rd patch
- Dependency related sashiko comments ignored as they are addressed in the
  prerequisite patch information
- Link to v3: https://lore.kernel.org/r/20260723-08-dts-v3-0-074eb131f382@oss.qualcomm.com

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
      arm64: dts: qcom: ipq5210: Introduce RDP504 NAND variant DT file

 arch/arm64/boot/dts/qcom/Makefile                  |   2 +-
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts   |  17 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +--
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 605 ++++++++++++++++++++-
 5 files changed, 828 insertions(+), 71 deletions(-)
---
base-commit: 2b74cbd61ba866a42f7274bbaca27d59998bdd2b
change-id: 20260706-08-dts-e830bb27c72b
prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c
prerequisite-message-id: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
prerequisite-patch-id: 66aa95814074faffb61393faa30396c42af41126
prerequisite-patch-id: 0a03dc1c91a2f0c03af823aa43f59a9005eb8607
prerequisite-patch-id: 35e083bb85434a34d86467e53b9eae14f78da125

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

