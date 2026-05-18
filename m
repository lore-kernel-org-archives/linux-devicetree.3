Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0442989BC
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779123238; cv=none; b=n0DKQlljNDoyK4lWfGXPjV1PbF5UQ1oVX4A3F87ZfaPQBFNHd7dMYVW9bw/F5pR4DSvHh8R9aFBlIy0SA3TYV0+hGhwv29LFi6CqnCagmNghpQwZOWHJfZkLwj4mcoT/pBs6BhLSSup8BuUXC6+fdUArAe3oPsyvEDMsZdgRagQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779123238; c=relaxed/simple;
	bh=ioGP5Gh5mUOREyixP1d7WQYUH/GX0L+WVAO7T2iGpyA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FCRZRK/kfpwzTUFChMjkhPY1hGOVKpyj/Pa/UwsBtEvADBScmxdBPPIeIDYIKWFZl4WBBJHzeoZ0ITf8MrWuSxuRMpzCgy8S1aDh8ecSjBZDaWk0hlswRoujPZkI5U8qJ5lxxls9LZxoyFDrsuwxSWJZDS+Y5Pa5fcTLrSWFP+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aW1fIayC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+Ee5Rid; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aW1fIayC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+Ee5Rid"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IDYvZ12891952
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7lxUpI5EKNmm9bW23PyCFwlpG321pegHYU1
	zPi+AZCo=; b=aW1fIayCRt93kgOeuxzaB/69wtRh4CPaEc7dJSFfZb7Gjg+OJ2e
	JkuqyPIBABL9ZmBFaHfXwqofR+NHYsCv6qRyiHMgixpt4dvlKqCuY0fmY7epAk8C
	kA9o+wcjiHzhI4Qrx8AmcwnIP2Ka3Z1MW+NwK/yxytdCvxgZpj/kkh10RZWTpYag
	JUbL5U/SfBEjKosxFci0HmouJeJkC441kIy7jp0qiL9JcoJImIb5PfnpLUVsJZG0
	13DkXt+7RK43pEe8SES2Kq2+g9rokDNPg03barZY5+pFBOZDzRd8XFp/MsU4tEbG
	XtVqDg58699KwL7t9U7qVkfkJLjsojGhgFA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk1a7m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:53:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba115ab6bbso28111075ad.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779123235; x=1779728035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7lxUpI5EKNmm9bW23PyCFwlpG321pegHYU1zPi+AZCo=;
        b=f+Ee5Rid4SLmEDJptg55M8xNHQEVnSMOs2gVG+DM9fICq0r/trRpgVTMg3kwYsYV/6
         FZ++PwUKBTbiAtdfQVWfsiZU++f+T+/iSny1feyHCw+CqwR40c6GHPRxswHfozUxdqy8
         I49zlimkypflcbmUEdM5sr/ODCNx/4T3/pJFe1g/E88x5wNvEOSwVyM4OIcY+yfdUTgk
         CWyuraYjcTBDfZpePU/PuZAp074FKB9SSuRlhmBEA84LMXmjQcKsx03FcsvVxc5kQszT
         +oMXSkWKN3Ox8Jh9K3WbyVKysdP18v/JAWfplsmTm9yapxmBSaZtFjueOpmGwLGkAib3
         c0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779123235; x=1779728035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lxUpI5EKNmm9bW23PyCFwlpG321pegHYU1zPi+AZCo=;
        b=GKk6mfsHbmTaKw362bm0tWLxmUcsgU3VpKzVtlsKEgJWCb4U8DGW8tyTVuatRLXIXY
         hHf7/tVAv2vc7c2jE5XQyWOsEeyrA7dgXsnjeopHhK5nu8dqXzqj7rGGmRkkxqQjW32n
         y84HUGA9NxsSx6gIpyypQ/EHJqqdkmPt0KL+a21AXQBHpMn5tPXR1WOX2OLIJFbo7WCd
         WsSKnerT4hym3sNViAlTiiErf97VqCHZRsYlXeyfY8mg/Rdb2U7bzuwSSXeDNka7t28I
         3WTNUeft5wtf9S34uNxzmXJvfMcCwrQAqNW0VdMLzFW7kKgG3VWeYlmv4FQKQANhpPRX
         RmTA==
X-Forwarded-Encrypted: i=1; AFNElJ8WX05KkHLizsJSEld7AIRrXSpfWf45CEob3nY/wbHYEhopPkCqQojIBgK69gCOFAy9Y1Lgo2flU8md@vger.kernel.org
X-Gm-Message-State: AOJu0YxIqL1qb7vB3bgYRe9wXlmA0Kt14HEp7XMuq8QdDiU13Hjz+r4b
	Gg05PwMiiuRkfz19W0ndyGy8VNtiNlCSnrZvow0Sn5TZca4IdIOwX71mRJVPdIO2X3Qq1FkGjM1
	TDmR2vECvPHxo5IKuwNMx1LEpqnwsXIAmPQa7Ced4fDBqjBvsHaOzrsD/DLV492Ui
X-Gm-Gg: Acq92OG0ciQHYdYstM7KA6vzAvn53lzYDd261zynjg0K6gmhPGWEeSB3xV8jIMg2O//
	p7sOecff6PR1zXrPDxB1ktkG7ZXowRi/QC3qPeYBO03uYQLo+dC83lRVdaxJ0ijcfmsWKaiik6B
	iIbMnvrgPiW0tT1+OoScdVAja3MO/pAjOS/pjtelB5pDKm6lqlGlqAKWlSXjnjs8LjrdEXYGSZJ
	bSw8TyWELM4JGQ9gsxAyTMbxCvhGTGIEqwK77aVz7f8n1BTuzS7EXBPZC+njxCqWLpWtH/wV7dP
	Rp35cOCmq5hTAYMOURziej4Fc2mQTjZJkN3e3t66q9AVp1MFjKRHmqIwVBstEET3ZhpRzKTGKPm
	CIqD8NO2F0gjsZrn9Idy77IQWdGG8Kb9gh6ImeGP/06Y+EjbSJXGkiyUylAGxpLA/
X-Received: by 2002:a17:903:3884:b0:2bd:b585:55f5 with SMTP id d9443c01a7336-2bdb585571amr91337575ad.8.1779123235477;
        Mon, 18 May 2026 09:53:55 -0700 (PDT)
X-Received: by 2002:a17:903:3884:b0:2bd:b585:55f5 with SMTP id d9443c01a7336-2bdb585571amr91337175ad.8.1779123235007;
        Mon, 18 May 2026 09:53:55 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fc47sm149971045ad.10.2026.05.18.09.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:53:54 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V1 0/3] Add Hawi UFS PHY and Controller support
Date: Mon, 18 May 2026 22:23:43 +0530
Message-Id: <20260518165346.1732548-1-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PLMYFuZ_5nAfYLw5jyeilyrw3wCFZca2
X-Proofpoint-ORIG-GUID: PLMYFuZ_5nAfYLw5jyeilyrw3wCFZca2
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0b4424 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=wRtOOnJjwWicnHpPwtUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2NiBTYWx0ZWRfX2P2BO7pQsr0b
 M15v4mVMMQEcYvBsyAeD2K4asaL3QTbl/btRNmBx3l+YxLhQQuBbyhSvoSS0SyoolV5ahCvLuCm
 UrnX+XhC8pl0HVwone801MNtHDX6qy0ysBU4ZS5sVJEiPGEF21ogT7RmAhDZHQzIGpWQWGdM/nU
 bIrfU+Y/IPlAYUyU8008pBUK35zSkABHekCOeXdQux3vaLSv24SSsI7vTxdCQOdEA7kMyF+CmD9
 sgKbJ1KL9X96c4SGu7NtdaVvXSqXp9QEkuEN4SlHNz3FTy40PFqW3V5SRvxGd30FtAMXwwpRipJ
 37WUvbIzrIc19Hkb3AxlWcYVjt/XC8MLcCswjYa9cVBndo6FqjAAL3USE90z2Ywcnr/MxQVig87
 mtjMcUDYk5wXM0w2yTd4J7xzrR9XOmszl7TTOFhA3m8hPZv8HzTELUPYKf//aLKpM2dzPm1zH8+
 7/XNzfScPqByY8fkzOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180166

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

This series introduces devicetree binding documentation and PHY
initialization support required to enable UFS on this platform.

  1. Devicetree binding documentation for the QMP UFS PHY
     used on Qualcomm Hawi.
  2. Devicetree binding documentation for the UFS controller
     instance present on the Hawi platform.
  3. Initialization sequence tables and configuration required
     for the QMP UFS PHY on Hawi SoC.

Palash Kambar (3):
  dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY
    compatible
  dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document the Hawi UFS
    controller
  phy: qcom-qmp-ufs: Add UFS PHY support on Hawi

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   1 +
 .../bindings/ufs/qcom,sm8650-ufshc.yaml       |   2 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  22 +++
 .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 140 ++++++++++++++++++
 5 files changed, 202 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h

-- 
2.34.1

