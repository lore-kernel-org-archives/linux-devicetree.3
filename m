Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B63438E8AA
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588828; cv=none; b=UBJkjY4JAPrYj91E8QkhcmjP+YE7t4wmeLT07RVFYO2ir9YT72XZStlI39tBoU869JjUQCH7LNZlZzBhgH/5pMDnNmymfX7xNmcIHNgvNKHbeDU8WS6caDl7ZjZqrmTyz49drj5/qCY7PvbF0NdaF3Okz/rSwu8UoVr8QIZfvGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588828; c=relaxed/simple;
	bh=VE9zYakVKXcw64xN3ntaqUGBdb9GJ+q1zQ5aGM+Z1P0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jrICMYvYfD/7l9Kmn+cZQ+fURo0J9aQiPksLcFiXzfIHUolE2OE/RVu/dV7CWmXm4lR2OFo/ZxNDSPu7DB7VVDVZZnT0cRZkvHZK5rK7qxoGOzygefqB81gcpOrazxYkDNymwYQSo4YvfZFNLR3ZuLbtPAvxOS3Xny3NLzRsb/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ll3KrA0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KnoGc9pW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ll3KrA0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KnoGc9pW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAe8mw2186405
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1rUY3+a++VGq+5VGAEgKNy
	M4DahpDViLmO4ey2lBSpI=; b=ll3KrA0eQy8fQ97+e55frjbFM2uUXfcDD+NCal
	dLsfTpSKozlT6FroZgJx6egnIx2Ti9DrxMmjz0Tf1M5zM1hzBH3vQ4XChyV62aJI
	aQkDRCi8CvmEt3eITWdxXnaVHtXH5eg3rEtriQDBPqJ6FBSocYjyKvR8/J943iuV
	LPQYdJghk9IbRSUfmBR7pGwihLc55YHkyKVmjaK9jQutYTJKBtFkE/umuoSEJzYO
	07XtvnaZ48GPI/aHKO7hswu+RqcNMAadd1gHrhcK0Gf2zqZ7Sa9WR1kWw5EPbqgf
	ers6bTpHzmRDMogtESvAn1b0eptR/U8i/E9kP7J3vaB5ek3g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0u6d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:27:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9a6a853bso101333121cf.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778588819; x=1779193619; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rUY3+a++VGq+5VGAEgKNyM4DahpDViLmO4ey2lBSpI=;
        b=KnoGc9pWeRKX+qCIY2DWM83+PsieCoOodLi7jQc+cYJvQw4HtKf0E/dnQFy6PXOwqt
         I7cqOjP3Tg91Tqe0hKDMz8OEvvhnm10EukqpXjckdehehWSEeayfPF5Tt7Q/twv/VzVn
         DKtQV04vV0MaKj5hCrHVXds1NhP9nmLbKS80PluCw6Obv3O6iyCOMRdmO0DVuWDtYKYC
         +KIgApYZxvkuEo4Z2jl07sJHESRbXTn1OQNldouU5SEJVngjxPyiDFZalsxhltlYZ3bu
         EVqnGhXqXVjouILmNKkT2Ox6OGF942VHWRXFguWtE5DHmOIHZRDP0vNoUZyzicUW+JJg
         WcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588819; x=1779193619;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rUY3+a++VGq+5VGAEgKNyM4DahpDViLmO4ey2lBSpI=;
        b=WUfbMPHCJPKHZuCUQUl+XzqIcb2Tj5T23oPJvhl6ifrQVsvXM6gdiJkI5jOSBERbaU
         dhRLHJ6V6PIcTwLSbUG4X09coWriHy2EBkyr06qpVreVnjgvp0JRYYPr4cWBCcEk80hF
         RBxXpDT/Zx+TKbBg7QNp7FPqLEBX1bSvvFvBTOiNZJmKe4SwJlXPVlWsyfLAQKqY5KQ/
         FbBm+ShCbn7fLfDIt83ly9p1rBRbjM4XM4ad2X5SqryKN8PMOM2UsswGcmivX3C/8xO7
         X9WYCk6QadPcZAe91S1seAsHHB620rmGvKwfG1CbB6nmvUF6c+vxc1S2pHm/83IfSnjx
         OM/w==
X-Forwarded-Encrypted: i=1; AFNElJ/hqk5S+hItq3HmKNf+ojOpcY56pf0NiYjG1x/4DRn9GLaL3OyOhFzrsG8OCvCUygFsKU45XOsRVomV@vger.kernel.org
X-Gm-Message-State: AOJu0YzmReAlt4VhMKQ06ySneuAWVGQGSraJxR7KQOVDr5QX8HNLNrxT
	rYv/6ETh4SopZXihMXvd+WnRazXlIoPKB3QumtzXArDZxxfQS3GsiafydWDE4hMOlPg/yAbP1bQ
	c+LBd4PC/459aUGp2oivStBDn/3wopxTl85126mr95GIF7VaNrAeO2Xe/e3+ns5gg
X-Gm-Gg: Acq92OGDAXV197szHGYLaJ/KUAOIyLX/zTx5sBtIp6qDTDGAGyxJ0V+fsalSJ9T5nhZ
	JLycHyZhvzjnbim9ZeLVUVfGPO5BTtn1rMZ3VP79D0+IsiU563Tkum9j8amgh0JVFVjiAubI93f
	1cj0XMm4a0wO7heNrx5tU6Lvr8akQyojOdN6vm4vco7OARJZ4ZAmDu7ThC947jHZdm+MNOWF5wu
	flH8W90TvGssxPK9Hy/GdE6R+ZdRJdP76zmR1t2Pt+8uWtnZX6uuYJ1HuMmvXpKNPZjJs/SPtT4
	bT8N06NoJ1kdEXol6O0OFyfltJgoXXvIXg+u5dvjh0FuPzHNuOsoGfIVz6mwN+FH8i0ZrPXYKPy
	t1EoumpdUpOuRqkpjssTTaRqu5gs/Cw==
X-Received: by 2002:a05:622a:1789:b0:50d:82db:773e with SMTP id d75a77b69052e-514a0b821bbmr197431721cf.47.1778588819398;
        Tue, 12 May 2026 05:26:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1789:b0:50d:82db:773e with SMTP id d75a77b69052e-514a0b821bbmr197430881cf.47.1778588818487;
        Tue, 12 May 2026 05:26:58 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e90681760sm43089135e9.12.2026.05.12.05.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:26:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: eliza: Add ADSP and USB support
Date: Tue, 12 May 2026 15:26:46 +0300
Message-Id: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIYcA2oC/23NYQuCMBAG4L8i+9zktmlJn/of0YdtnrlQZ55KJ
 f73phFBxcHBC+89NzHCziGxfTSxDkdHzjchqE3EbKmbM3KXh8wkyC0oBRwr99Bc59TygQzPsJB
 GGCisUCwctR0W7raCx9Mr02AuaPtFWRqlo9539/XjKJbeGxff+Cg48DzTMhUGJVh18ETxddCV9
 XUdh8WWH6P8KCkkP4oMisgQTJgEdsUfZZ7nJ7j+xRULAQAA
X-Change-ID: 20260330-eliza-adsp-usb-8ef2b1b0fc13
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2337;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VE9zYakVKXcw64xN3ntaqUGBdb9GJ+q1zQ5aGM+Z1P0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqAxyL+4RKUiIVKB57UGebQXuzeMcccfTfQy2Yo
 8ulOVXqJSiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagMciwAKCRAbX0TJAJUV
 VgvoD/4l9pilvTp0PpohGGeB453v21CqENUF67Moqi0Lo4WU145dA2T9f259IfaN8n7RC3PSO2P
 xwIxQg1bltOqOF8lNzjR+Hey7d9Y6vCQnfWq/LUkp7IFyBGD3mTyBKdWE1eDWh1wGtBrIJscNRF
 1Psf/hTs5vbRBGJy+gO1X3VDvCdr4UN5bIGVamOmZbKycGZSus0PpLZke/d8DUCBBk5UseZGAuw
 /fS6FnBuXmd98nusD16v9tuIycrRzyKY0tjTr6czfyKLliuq9ZiNgWjiscygpdLpbmE5iYSha38
 XV01s+CK8Yy+aOxq8iRuondyjjZ3uK3a/n+EFZQyFFtY4ozCg+wwn0CXsqEjALo6SwOT0IkNttI
 GFZH24wD2QraeUPMyHBaV9Z6zVT47RX59AAgWY672MtWqNMCaqVYy99fB8IKA+nFw/8nD7zh8uc
 ff5p0qNTlErTgLnMPinsbMLAOcx9u5sCiomvbncMbB+jLLIwWJbiVk5ECLmLFn736pJioxUChG8
 hH8CgHTWy9SFm6N5jFYAMS8EX1Hf+nszz0KEzqoA79osU9pJApI4mIa+z/cGshCk/gb1a5rewAC
 Vqgq8kgqFr8rtEszFcWuxMfC2P/3po2DnZLfvYKvJHbs+uQniZv2FlEQWTlV4oEU6cJlqA2v9t5
 /g2hm4Kix6ygJyg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyOSBTYWx0ZWRfX5HMNFw0KfLC8
 hYhw53j373pCg0rbfACAFmGE9umMTGPBUKe82PM1WmBdRAQVEqLAkOhasQdaoyCLxqeSlfIyDAP
 u5xEGLkajOcW2jCaCVNKMaUlwaq/zGlwPlPZ3Obhh0/00h2XvRvikKsxZbxQtarNplsyAYQquOQ
 xbtN3qBVuTJQDWynASqdhfgRITojHqchnqY4kP6pt2p+g/m8j0riopOgeoBZ/5725UOZedQHoH0
 LwJhEu8TGlLFMCbav7VL8+QFkSUlWa3uSv38+fkmzIYYQc5F70Eeuc5LAO4hYbZJzi8C2PMycRK
 WPApXI4VJXDen9bZnDYi4BLh5UqNhFTyDLkIgaw6ZLM+AKR+XQPum+gADFRIDp0OjfkM8QmU0ZH
 r6sZp1H6IeAA7O/8TVcxxkZQDSg8GuJXiWKiI0NSrEpZW2Ff4zpxXGCzYgmRaKzzYNYQZmogcwB
 8IXU7N3mN/P5I2p5TDQ==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a031c94 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=v-TjB7A8gc_t_YAPOJ0A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: RLmKPBXxROa4rN8o2m7Ug9SRzPad7XPw
X-Proofpoint-ORIG-GUID: RLmKPBXxROa4rN8o2m7Ug9SRzPad7XPw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120129

This series adds the ADSP and USB related description for the Qualcomm
Eliza platform.

The SoC dtsi gains the ADSP remoteproc node and its communication
dependencies, including IPCC, SMP2P and the AOSS QMP channel. It also
describes the USB controller, the SNPS eUSB2 PHY and the USB3/DP QMP
combo PHY.

The board dts then enables the ADSP and USB stack on the Eliza MTP,
including the Type-C connector graph, PMIC GLINK integration and the
PM7550BA eUSB2 repeater.

The following patchsets document all necessary bindings:

https://lore.kernel.org/all/20260504-eliza-bindings-phy-eusb2-v2-1-fa3a1fd65ab1@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-qmp-phy-v2-1-849c4de8d75f@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-aoss-v2-1-c3628ca79a25@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-pmic-glink-v2-1-d6b5397b7899@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20260508.
- Picked up Konrad's and Krzysztof's R-b and T-b tags which I forgot
  to fetch from v1 thread.
- Link to v2: https://patch.msgid.link/20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260430.
- Changed the HS PHY ref clock to TCSR_USB2_CLKREF_EN, as suggested by
  Konrad.
- Changed the HS PHY VDD supply to L7K instead of L2B.
- Dropped the dr_mode property from the controller for MTP board, as
  suggested by Konrad.
- Re-worded the cover with more info and updated the bindings required
  patchsets list.
- Link to v1: https://patch.msgid.link/20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com

---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes
      arm64: dts: qcom: Add Eliza-specific PM7750BA dtsi
      arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support

 arch/arm64/boot/dts/qcom/eliza-mtp.dts       |  81 +++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi          | 261 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi |  69 +++++++
 3 files changed, 411 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

