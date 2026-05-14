Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF903A8724
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731993; cv=none; b=MefRjsiT4xShXLdQh7QWWaVFa4zSM227ZDgT3yAbWHsF1w49QszFIvSHj081tWvTa/e19UjebDshR9XpV+roEzmYzaVTgr7wYPHOgQqI0ZeEI82KaryIXqNqtHqeDcLVhFdq1fgkiNOK1kypvp6jVWtVhSXgGOcXzPxuNn00g2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731993; c=relaxed/simple;
	bh=UCvF5W4Php1eq6KLqSfeXsUXTv1lLN3d9cYyXqBJvHI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kYXgjYF7QzYqNX6mZvsVzKqbEJKwuS1+aFJTFMgk+Aj+iKAX8R7bR4kFP4j8Y8kSeyR14wmhC0JmB4QEK6UrURF0rEBEuWswgIF1i1NjoYjhJ1gW+xJIcg0jFVQ8H7dAxJqg6I4kg0+b2W/Wep/FzSDeT2VMAAFLbVb8SFjVUyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fsn3KOPa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FWEd6kiU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fsn3KOPa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FWEd6kiU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E2xWEr1095236
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Se+XvDLdHFlrKh024A77jn
	O6bIXBjZkbQxOwwc6Wg78=; b=Fsn3KOPayXzjgeP8UurUtOWS7+CkNmB0hf9vjE
	whrOAVvaFGcU9p1kZY6Jy/9uoWIOoM2kBGC47rrW/cZbi4vtJoVbiX39DdVCH8+p
	IA3vOE19xj+EWS8aQpu9YE5cB/hhqdK+PbwBnvgoxlpopj9MckUyhQ11aLpKoF30
	05rbAVj2fmIeezhDB33UPcwfEbQNeg1gRIBFigFAwvc0Z2iCxlkdfroujZB0uluh
	kLQlLuVztU52D8wGIZlxNvwE3zIY0JkCbINo4X96y89hQ8Qv4ik0oq7ofR0JaIgV
	yy+iug8QgM/lvGta/8+r1bL6vftjlT7bKezzgZPO/3kuw6+Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e563hg6qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:13:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso4778214b3a.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778731990; x=1779336790; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Se+XvDLdHFlrKh024A77jnO6bIXBjZkbQxOwwc6Wg78=;
        b=FWEd6kiUOZYmPDjPZlgP0viyxSddRW1WeWpX8DrBB+xQkv11tmaFlVaXeZUQSKRI9t
         1ybl24sIQRCw8iniWrteQpMdg3doh8imkk9mNVdhbCuX/4k5xCFZov8JbH4XzMa7jENX
         giptf6c5oo6tQ3lw+f5FdcOtWJFh7EviNTEy2SzQg/yZiJ6Ib45UF0L42TM7Rhxk/RHh
         IMDpV2OUnbf1I1ageJdpz80fZj6UzPUM4mt8tOuh9O1b0LcbxrGv1QjAyg/ouHeoXy8S
         xKpQEPKplXJiOjvC3/X53zuRZatLyazSkjPjQ6igx0eVBTvzANcgvfctBr1WI3yNtQdY
         GAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778731990; x=1779336790;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Se+XvDLdHFlrKh024A77jnO6bIXBjZkbQxOwwc6Wg78=;
        b=d5Rk3oDVy/sN3eUP5FARL/wb84anz4vn99A6Kllt0deJlhjl0S4mmQZYld7Ehrpzie
         XJuHUqrxXKv/DruoItU0JgW+QuYUGDKA9h7DJF2lP95p8GLDITMsb4AyWNnrmbjRg234
         ZgYQR+JZgat9IaILmnuIWzTyaoSG6DuWjKi6cfE8rps6nzpKHpfQ75C93NuxafyinSt0
         YSXbAhMFtQEmoaQ881rLZ35OJf5tftef94fXoCOeOVZ5vVgoAIfJnMtah79Xjk96J7Nd
         SGdPdPwSD3yzY1PUZc2daBLyjRwyfVPEDXmvu7ACyFAS1FqTyiK3aLiRf2O5ME5MFo9K
         cFsw==
X-Forwarded-Encrypted: i=1; AFNElJ/ue85WkMqlwPMXFPlEsW96YPoLI0WPOYV+5l6umAUVAHTVNYG6yf2uPkJLebjFNBF7gYgbXr0q7cD1@vger.kernel.org
X-Gm-Message-State: AOJu0YwXB0xt/3tD0PaRqrK8yf2//n5y0hM0xnZsuunFTTIdZOklp8yy
	tqsYK3+H+dZr0yvaPLNFmnJP6eYtxhdha5p79nSrYJcpLHzGYU0Q5r5GzuZ501vuQTjRL+8L9rs
	qkX6fDMBRjt2ZxgNix3c/1jHwVgR0qLIjsetvtbRIspYMylfRq2jstQv+KadabqQm
X-Gm-Gg: Acq92OFF93nAxqF6amBmd36KY/F7XwLo17sbKE2XVj6QQpc+AxzXx0ETAR8mihfD4TO
	ibhqK90WOIvpm4PWUl7eQ666r4ac26IzYGno2O8T5mcmXSlFojTE3gKQjd/Pp2A/7xuskNEFrRw
	AvOV771gaupsObBIDaf6pp5cdnlTxjAh1B4pvbAx3karuhAst3LRx3PXSBaeH1Aon1kcvHnhWtZ
	cRJkbzwQ+QD5vxySe4QnNc5Rka/Kr4n9nqGF4GZO2aNdIHdSTl/1LS04mKDV3wRvjDlSrQcHpZT
	IhVh7zMPCrEk/De4C824/lo9oS2DxRhjVYXjvYNYhIb131t21ejpNOaPdgrzIHb6gO4e3+ICQ12
	0+DmBh7znzREkg8/LJeMRmb+dpN88ImnoBCD8y+vBBcCczeSHi0nKBkI1qG5Z9HQSEHvJue1HeH
	2rIYofybXIbz0lMo89h/oduUFm1NXSR8yKncObNou6JRiYIpSBxn3ojCkPOxMDiQ==
X-Received: by 2002:a05:6a00:4004:b0:82f:70a7:4a25 with SMTP id d2e1a72fcca58-83f042caa00mr5624647b3a.35.1778731989374;
        Wed, 13 May 2026 21:13:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:4004:b0:82f:70a7:4a25 with SMTP id d2e1a72fcca58-83f042caa00mr5624617b3a.35.1778731988787;
        Wed, 13 May 2026 21:13:08 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5be71sm1075432b3a.39.2026.05.13.21.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 21:13:08 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable PCIe controllers present in Qualcomm ipq5210
Date: Thu, 14 May 2026 09:43:00 +0530
Message-Id: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMxLBWoC/1WOSw7CMAxEr1JlTSQ7pmnTqyAWieOAF0BpCwIh7
 k4FiM/yjWae5mZGGVRG01U3M8hZRz3sZ8BFZXgb9xuxmmc2DpyHGpe2Z7XaH2uHYEPT+MYljtk
 7My/6QYpenrbV+sWDHE+zdHqFX2dX/Rn77dVSKxwSch0DdGc0vxd+6sr8OQAxARWKJC29JymOY
 vmw2+nUVRLa7JCxgQSYsxTyvoCjlAoXnwhrCCW2ZNb3+wPk1NWtCwEAAA==
X-Change-ID: 20260514-pci-ipq5210-977672bcad62
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: iVE0UhRTtRx6uECRv2yRCaCaCUcjS-3l
X-Proofpoint-ORIG-GUID: iVE0UhRTtRx6uECRv2yRCaCaCUcjS-3l
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a054bd6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wNaPFhMNx_1Hpoq_LpsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzOCBTYWx0ZWRfX1nZkUuImU3Va
 +AIf4bGfLIY45TDe/rDo7e6XroEVhD/fENJEUNZnFN8IZt5MYKvL6YMQRVstAH5yMWiijNrAQFa
 4TYGpzMIzvTjgqOY7WEUKsg7kSbu6fw+dSpAFOcuiu8p70Tw/C0xWFMvk4e3AKjmjDhM1m6W+GL
 +ACGWFd7/Ju6TQmHd+neCMmJ1C0IN0/Xo0G6gN+5qyFxYAR+Y9KmKxgc/8BPIt1c6HeqajX3bJl
 ciD5m+k5f1gVA4TFX63Z4MiVlza4Ar4fenwoRLtKzdpXmFaB3rFBtqI36JNB8uDGDVszDA+hTH3
 +IgI4bFWA5HIVXLJPkdiaaWl4byelIFrDjlJ9faSRRaM3nidpK9bhhKFZZzIKZn/DNx67YnfO2M
 I1Hu1X9sTGHKetp42ZPqas5YORXapkcgCNkdc+Sk9cXfcIuALRBt78nUlyWAh8QBHfHp5ach0LS
 6XtRT2j2+2Dk0gB5itQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140038

Update the relevant bindings and DT files to enable support
for the PCIe phy and controller.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      dt-bindings: PCI: qcom,pcie-ipq9574: Document the ipq5210 pcie controller
      arm64: dts: qcom: ipq5210: Enable PCIe support

 .../devicetree/bindings/pci/qcom,pcie-ipq9574.yaml |   1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  43 ++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 261 ++++++++++++++++++++-
 3 files changed, 303 insertions(+), 2 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260514-pci-ipq5210-977672bcad62
prerequisite-change-id: 20260514-pci-phy-38ec9b1c5a90:v1
prerequisite-patch-id: aea0d856b804b879fd5f24ea02f809b4dec84a30
prerequisite-patch-id: 26fb9a62b5ba0fc6275c0b081c7a16348d5a4fd1
prerequisite-change-id: 20260514-icc-ipq5210-0ab03f3a3e83:v1
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

