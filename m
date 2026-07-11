Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9FF3CBE6D
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783789802; cv=none; b=Oz0+hLMlC/+dyiqPI9akvFyOehAbUk+pDKRylVvBgr/4nenQMGpkQf+Xa1QfvA3f0xPbl0aMvErshQN9cewy0Pk/iGqiaMAiu5x1GhzoVdE123QcofdcHPbSUbvIyW1lFXJoDOH8Gz35Xfa+FzrqgO20OgEXmFK+vBSz13Os1hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783789802; c=relaxed/simple;
	bh=f5M5hytx1ky2qfopaUhBZoYqxyomhDfuBgV0wm3ocnQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RFv6wl28/heOsqpyvuZTnTl80WQhhuWK4hTYQJtqQHbmVEezJfXQiXobMOLHDZXNLNby5PhoSWk9vKsNms12yFHKZ2i0zl+0b34dkDdaqRnO2z06iq2VQd6AfObPObxXOG0WrLLLxaxvEvq+bDZR/ZslqD8QX6BkC1oSVQaVxss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJn6bLnP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UX0NP1N5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJn6bLnP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UX0NP1N5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BEOHnT4101967
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=62TjJ0RY6VeZ5IOBdjTqk2
	iAOTl905RMhzB3iESIMIU=; b=ZJn6bLnPlKsXEqftIeuZ1GwNFtzcOKaheZRZpE
	oHnVV2+vOxaR3yhmj2EMBk22qA91i/ekI2vmPBY4JTB2n9wTzfnCklqYSoJdhKVj
	MoiE6SbdN7sMYy6eiCS1J1PAg1igFDYEqWhGi4rNIl3Q3P4Hel3O8Xz0pgnCVz45
	cfwidpvjS9dWC0UVHZV4d8CRoLLqSguACr/u/pNQphMng43JyAh9D4Z05BX+jFq8
	UOdipfFuMTldtRXjpq47+crdx2SqNgYjc9p+oNVDm94/1Z6X2BehWwG2LFFRBl+k
	FX/Ypl9FgT1eLCEwCvypw0VyLslhpVPKYI6mMzj/Rbf9Q0dg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgh9mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:09:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca8aee88725so2547210a12.3
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 10:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783789799; x=1784394599; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=62TjJ0RY6VeZ5IOBdjTqk2iAOTl905RMhzB3iESIMIU=;
        b=UX0NP1N5NcMGrz7psz3Y5IPIVwoRCm9u0agPGp3/hrztwE9TF2V/FV7+DTPFkrv+W7
         9kb608lITxiyEjkxHEqs6Ur2IBNfgRYvXngf4ohyBGP0L+lE6ne56K/fHedI7JdhKjMO
         hKTSrNVOFWjOwHq52YlwWqSmom3dlb3t4njwFtxsDKpOShK/7qwH/1reiXqaupQ3jMT2
         PIGiwMqk5AaE6qIGsvNWlJym6CHo8K4lCVqBkzJJQJCaeVDLVL5S6qh0a60KszW6rDS8
         uG5aDAjFVseb3WQEst8MHhX1fZeydYhr76CafrHFJVLar8+DuDrNO+OsCnMNBI97lijq
         5wAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783789799; x=1784394599;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=62TjJ0RY6VeZ5IOBdjTqk2iAOTl905RMhzB3iESIMIU=;
        b=Fok3ecOSPBQIMI/MNcK3UdI5PQ+4ivAu9vkLj26t+NWsNfeDsb0IW7JBSJKM4kMqeJ
         oTXVrKOjTUJWyITzUVi4oekRoeMWW/cGc7E/dzXgSlxBCehgIk2OsT8ph8X8YakewGVN
         BND9J0RQM4FU+5Hq/2FG/uwExu2aOEL3jr5rK0hPgp+QedsPPINAz6y4HwVZAfrmcyfy
         EVzXusMaYSTcDDS4lH9AeUpY4PI72TVBQfGr3HHiNgNbzNqP7edFrFlIlmKVU9aPOUZC
         R9jACZZ+UZFRVKfYOR31cdkRN9nfNJaYoJ3NC1E4zeTHYgXnfK2mc9akdn+IRbz89qHb
         WQJw==
X-Forwarded-Encrypted: i=1; AHgh+RrT7Tr+QQD49VSgDRfynSJVuPUWs8WEKlkRRa2yphy5s2YTknz8cB4ZdXpQkOssd4qRKVw36sCWG+df@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/BPXHcdVNtxAXMjB3Y1jsAYzawj9LeZxZ6LOMTM6YWncs5CSP
	+DeD9em/6bJtqLn2UA8qJifUyOdA9HkRICNuyFF5DfFibpBgYKdLj0FckHSOd35rH7zcMHuAtvs
	P0Ytdrbd0nOmd3X/fMaVbkx1A+iqmu4yFTSpn+R1yVhyDgYpIk2ovxBllf+Oe8dv9
X-Gm-Gg: AfdE7cnbxvVm9BgHQmjPhXMYucryI8HosQZ1BHfxKEqWkrld0OUS2RMuJEa48KdbyJx
	tEI/CBjLFrozxSvA/+smHHBdReLbgI+jj405R2XeEEACRi8d62xxcXt4dS/XyVi7XeWyWr0azox
	lQW0H7bcsSvBKIH9d9k7YgscgMP3ogrBRr/jD9qsJNhFSsnPQTJikJbedLUU0VHpiAcSd7cLYNh
	88x9SmcDcMpGt2Y8kkavMUDmO8x1hhSWLMZMosQogVVxvzwr4miyf82FMUSS5phbWoJak/nL3fC
	2dekYhKmp1V5EdVneh58BiF0nVXlzEYC+OJ4Gcr4HlJDe6dIl7qjROFWa8yxLTw/7Tpfg9Ya6di
	4JaDr/40QGmXfGTw1ThfFE0O6+K7e+qsvOUsNwSd1AH3HhLYx0mu0O14Igs9RLB9c/CahMj5X7S
	8nqcT9
X-Received: by 2002:a05:6a21:a109:b0:3c1:142e:762d with SMTP id adf61e73a8af0-3c1142e7916mr2962354637.1.1783789798588;
        Sat, 11 Jul 2026 10:09:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:a109:b0:3c1:142e:762d with SMTP id adf61e73a8af0-3c1142e7916mr2962331637.1.1783789798131;
        Sat, 11 Jul 2026 10:09:58 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm12943635eec.23.2026.07.11.10.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 10:09:57 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v5 0/4] Add USB Phy driver and binding changes for Qualcomm
 Shikra SoC
Date: Sat, 11 Jul 2026 22:39:49 +0530
Message-Id: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN14UmoC/yXMQQqDMBBA0avIrB1IQmOhVxEXGidmWogho9Ii3
 r1Rl2/x/w5CmUngVe2QaWPhORbYugIX+jgR8lgMRplGPbVGCfzJPa4ypPDDzaLXRln9cOT9CCV
 LmTx/r2Xb3ZZ1eJNbzg8cxx8z8kzvdAAAAA==
X-Change-ID: 20260711-shikra-usbphy-v5-f120514ceffd
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783789793; l=2238;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=f5M5hytx1ky2qfopaUhBZoYqxyomhDfuBgV0wm3ocnQ=;
 b=3hRKKt8/B9PBUko5BUNEyYK6WYFA4VpMX778qo08Ux0D6etYTvZja932rpmm6tfzfGQQzrQxR
 fL61e6Dh2cpB43MyQFsFs2vbxxDQ7YkQDJSTBuSXCO2n0SQk9DVouKm
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX2FEvAvGiaw+e
 nXe/OEJWw7ZSEI7FLQvfkDQjw95xCv2CV9C8ADuMUEa6A+CMr2BBiK5Nrprsb+fJiIbHLvyioo6
 GmbDj20WdUHhixvDtHOcLVz9LB6TzKU=
X-Proofpoint-ORIG-GUID: MSHhdFF7vT7SRCWH3xLUAmgA07_xIsSX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX0U0rwgAMjBvs
 YqlDN+3hmCTHzAAvoWVeoO+c2bJ6mypiQcpJO0lh9NlSnjbO+Q4sFPk9HQkHIqD3Rke938VXa0c
 NA4StvTLwz+T1xWxbANV+TF/QEEoI/RfE9AZOJ48ASaXunr2tAvJ3ftfxUDhLg98qhRoWiqPn6r
 A51QEzR1B6h/+SOoOn0Gd7Mbu3Veod8x54FqrVSohLu+VrBd3di8gyZQ/nkAkBEj94TY2gwBvPV
 PkLP5QqweEHS/4e6VP5eb/+GdnPCSj7bDKS3B29Qx0MyzYseaQfdrOgIflK7yOeaekrWfqkS+Qa
 64ndur8O6JRsj8qifNQ3Vy9glHSiDankGOQKCuZ3uwyGsCeUm3kgrZBKAIuCJSBv1LuGCHZTZNv
 lRnYUoQE5NG7Dr3qbRKGB16zPu/eDyX3PF8VCtGJyQQQgg0iBDtZkQplYrrQ2Oi8aiYTMH0sF9F
 HxdeHHjeRIDFgYG9t8A==
X-Proofpoint-GUID: MSHhdFF7vT7SRCWH3xLUAmgA07_xIsSX
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a5278e7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=snenXNZ0Rr6npqWaDuoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110173

This series adds Driver and binding changes for USB Phys on Shikra.
There are two USB controllers - One of them is SS capable and other is
highspeed only capable.

Changes in v5:
- Fixed shikra specific minItems property for qmp bindings
- Rebased qusb2 driver changes on top of Dmitry's change [1]

Link to v4:
https://lore.kernel.org/all/20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com/

Changes in v4:
- Moved to using qcs615-usb3-dp-phy and added resets specific to shikra
- Updated bindings to reflect that there are 3 resets used in qmp phy
- Add remote endpoints and orientation-switch for Type-c handling

Link to v3:
https://lore.kernel.org/all/20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com/

Changes in v3:
- Moved to using qcs615-usb3-dp-phy since the DP Phy is present although
not operational.
- Using Talos as a fallback for shikra in qmp driver
- Add required "phy" reset in qmp usbc driver since its needed on Shikra

Link to v2:
https://lore.kernel.org/all/20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
- Separated the usb controller binding changes
- Updated commit texts.

Link to v1:
https://lore.kernel.org/all/20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com/

[1]: https://lore.kernel.org/all/20260706-fix-qusb2-v2-0-8d9cd73b1db7@oss.qualcomm.com/

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (4):
      dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
      dt-bindings: phy: qcs615-qmp-usb3dp: Add support for Shikra SoC
      phy: qcom-qusb2: Add support for Shikra
      phy: qcom: qmp-usbc: Add qmp configuration for Shikra

 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 54 +++++++++++++++++++++-
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    |  1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 53 +++++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qusb2.c              | 14 ++++++
 4 files changed, 118 insertions(+), 4 deletions(-)
---
base-commit: b7296e82650f0130b8811ef79c5e17aadbf85bd1
change-id: 20260711-shikra-usbphy-v5-f120514ceffd

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

