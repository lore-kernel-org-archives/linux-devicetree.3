Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1FA3AC0CD
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910232; cv=none; b=Le82llPfMeh2Mp0WShAbAG3KEXCYlzf2VO9YWPyOyFC8Y4rN0wn0wukfPD6Qiy8D3vVffInUQayLaD3Lxz6MVcScMApCQ2Nr8t19GULmGN2T842wvoEWv0opG0BFkiQzReJHr9Q1+/OQspkmx2+aueEYUzZ/OYtrVngxBYA6lg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910232; c=relaxed/simple;
	bh=5l2djtNbAKG4yz59Sy0TGxxB5M2aM0T1Ix6YMc2Rlxk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hqWvvW6vemJaSeSmtLK+5vnpFMZnDR8jRHL5MWmgO1KPoSMAsAZ50Nur17sqeAE5t1BlC4foOcXmzz9olB9Np4raK8exy9g2yya30fKjWx2/5ymU61uoG4GPvW5nuKc2dHEcE6bhTjJDFjPAJ3yhsYQSqUvB3cY95P1ozxOfNc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clyMt8TZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4R4WlAV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="clyMt8TZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4R4WlAV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PjFF2733082
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 09:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9TQChVoZGJE1ujfnF3D1YTCmrzz01p+wDC5
	U6eyAgsA=; b=clyMt8TZ9PBMiGr6oQ63qZiAEfMD750Be7MXNqRyIJ6k9WuvfD2
	eAzU0SJ/10PkBWQFZvnPx6UUXmurumz+J/4WE/5TfgPW8D3kIEQY8gNFbhnQJT3W
	KUPVJJZ0eF1WjixFVCtgKDX+msGmYCHp1XpROWIVoJFzp/caedoTiNTqDnmT1Mxu
	Zc6UT/xfqCHqcmVltzYSALh1/2gZITk8EYOqw5aZCH/UoJIUkpaaJSqtMEWwI3sm
	2e7I4Tu4+Cl6v1JNo1YrjV9+cqPHOOZfc0h/eh56Dzi4+ShBQQGByJ8Sg9vqQFWR
	BmKSYvPAP0eWVb+PjkRt437lXHvJw6ov5qQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf75b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 09:17:10 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137f9301fd6so187591c88.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780910230; x=1781515030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9TQChVoZGJE1ujfnF3D1YTCmrzz01p+wDC5U6eyAgsA=;
        b=a4R4WlAVHYjFgjivj5e7q1Z/gF5dR29Bhoqm7NM9dvG9BB9wL9zV6hU6V7zEpKms5m
         LatT/Pjgn4DZR4yw64Bk/ULZwjZBojSIWiSL6DpJZQ409TgL8PJ6ogJ9ket1sSLaq/WV
         TVV/HmgCcjt8h/nC6FP3gzabX5RZMRPsAkSxEbX5N8XiHl7LHhHCh1AqRkxIPsJmpefC
         ShoojDcux75ss8rUurbasp/AO66+xU12n6BtXJ4TcdAseDBb8/InHr4g61F73hcLVu1I
         W72oJisrnGRCE4an7ov1+Syufg7k80gC38NqAGHQDYqSwi4Mp/ZVD14U/gNtfhSNmIUE
         xu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910230; x=1781515030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TQChVoZGJE1ujfnF3D1YTCmrzz01p+wDC5U6eyAgsA=;
        b=n6i1l6fJkwDVBLs5gatxtluAueWh+5Iq35AFzcHAntr5IGEk6JFmdST6P7mAc+s2hw
         pzTagR1rX3UOEI6uHrkLsjJa45plreLwohYDuZMbNkltKNsPj8rQHJqr8oFLABSOA5Lr
         xCWRwDnK51nbNbILDjFgJQqmi09gNhrVLFfeSdF8jupg5NPucSFenKP8h7TePw5f1xY9
         Id+smQr2gu1/by3p7+jSyj262PgQ8+by3YdH4kjmOQR7hjLiuiQY5RSAvPVkqrPDMvig
         vyj9ydWHJyaSGSz1z6XTR/e/m3Jq4imDoTMxxjaDaGKbAuN4x0VBKZVVIuvKnEkGQNpI
         bPWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9raBPO9+8xh9H6RNQ8/iT1DLWgNPgjT8SbzrwU5NIiTai7Sbd4xwYeBo6PqGpxlVmhmfw6Z18ArPoD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2k6vxp0c+jHTJPTmlYfpo1iZbZZimO0n8DH11FE1AvBG4m2n5
	gUjpeH/XVZ16kA0pT2ZzYysVIxLXnWZu4MTBt6zFt5XMhG8baHZtRt4UE0XZWz1mu/pKWbO9w9E
	6yiuy4Ec3nxSKqGz6B/bxsbCqJwVHUm0IhX4xKSA0i+c/No54lDxVnEFJg4qBCt6P
X-Gm-Gg: Acq92OFJ56dGUC9QjbzsJtt6AR3T2NVm/CjqtngnfsrC4z6zQkvqgpNEUFP38OiGE6u
	oAwPtf8e4IPf1w8Nz9DXh+9VR5NBrrqhRYEFSNeEEpYqGZmomHBDAcGrsCNyx52UsKGVOWu64He
	V23FG3xkBA2RxW84Sram5yhddhnZr31FH/fZKCPqjqoorrdZj/aTpjQoPN2CUTOMgM6T44QBdKL
	dJF8S9lnfhIEowKxsAT2RoNJg2KtQ/JQNGmoV7q1eN/Dqhm4m+KxcnAR/2ZBH0UYavtx7kyuEYR
	uMbGjVhoylDj6lUfHMIqn82AVCmqP5ocd9UECfgFwgmPyw1wI8KKCUym4EHroLdlgLY9wNEiSue
	DR1Rjx6fi51RGFpKeQCV2JN+KjRaYLF1dUdXytUrAea4ZMei1T0GO8i9++VdJ+CzrFwU5RAePcu
	TTPUxNN/8=
X-Received: by 2002:a05:7022:423:b0:137:fdce:fec2 with SMTP id a92af1059eb24-138067f0b96mr2904758c88.4.1780910229720;
        Mon, 08 Jun 2026 02:17:09 -0700 (PDT)
X-Received: by 2002:a05:7022:423:b0:137:fdce:fec2 with SMTP id a92af1059eb24-138067f0b96mr2904747c88.4.1780910229057;
        Mon, 08 Jun 2026 02:17:09 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5550bcdsm12178656c88.14.2026.06.08.02.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:17:08 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
Subject: [PATCH 0/2] Enable WCN6855 Bluetooth on lemans-evk via PCIe M.2 Key E connector
Date: Mon,  8 Jun 2026 14:47:00 +0530
Message-Id: <20260608091702.3797437-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a268896 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=g11dK_DTieeChMdKYl0A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: YPJzYs8MltC-SzEw7G6LfLFwMi2rB5T0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4NSBTYWx0ZWRfX9bIho0xOZone
 lz4s15sHkgurWlLmOKTleV2HviPtPGJaCN18iiosYDv6sEKDUFvXZdAuRcZ30LJl6yBi4Q0+Xte
 4uOn9q2hPTaxJXHmIkGO4/7N1NIIBi38DIyOZeMAxooref62f9Btnnznt72BnwIzDkjOZu2eAyD
 D6c4c2o7TWPOJMT8VrFsiIoYztJEJel1TDXOQJccXd6Qg3WMtuTPQUlO0o1fpbZUdgi+adPc9od
 fwnXhneUq7POOVKcvvrkASyaLuXOyJXU2jg8/Igk1yVCDPxEzKX/zUe3sT0eluiORvFFt/2qwVd
 wHv9g2ptWTsLaa3/kiXMq15r93e8UGRikk90/duR/++r7PHL55TCpVgZ5s/WvmLZEy9Eead3iD6
 7Tuc1V929PjF9Y8Ne9MuYRPQnRVlS0MMiXhEo/17KHiQGD0UBhdJxpaBdU2vzGF4AwpjsYr1lUM
 o+YjA2XQHT3PkDetieg==
X-Proofpoint-GUID: YPJzYs8MltC-SzEw7G6LfLFwMi2rB5T0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080085

This series enables WCN6855 Bluetooth on the lemans EVK through the
PCIe M.2 Key E connector + pwrseq-pcie-m2 path.

It depends on the "Fixes/improvements for the PCI M.2 power sequencing
driver" series (V3):

  https://lore.kernel.org/r/20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com

Patch 1 adds 0x1103 (WCN6855) to pwrseq_m2_pci_ids[] alongside the
existing 0x1107 (WCN7850) entry, with compatible "qcom,wcn6855-bt".

Patch 2 describes the M.2 Key E connector on lemans-evk:
  - pcie-m2-e-connector node, port@0 -> pcieport0,
                              port@3 -> uart17 (BT serdev path)
  - vreg_dcin_12v (12V) + vreg_wcn_3p3 (3.3V, vin-supply 12V),
    both always-on/boot-on, as required by the binding
  - compatible = "pciclass,0604" on pcieport0 in lemans.dtsi so the
    PCI subsystem can match the DT node to the PCI-to-PCI bridge
  - serial1 = &uart17 alias

Wei Deng (2):
  power: sequencing: pcie-m2: Add PCI ID 0x1103 for WCN6855 Bluetooth
  arm64: dts: qcom: lemans-evk: Describe the PCIe M.2 Key E connector

 arch/arm64/boot/dts/qcom/lemans-evk.dts   | 75 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi      |  1 +
 drivers/power/sequencing/pwrseq-pcie-m2.c |  2 +
 3 files changed, 78 insertions(+)

-- 
2.34.1

