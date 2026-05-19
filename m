Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B05C3AFAFF
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779218786; cv=none; b=fjQbeTztFqhAdhAK6sj7DeEMZuYwEYsBwPbyRxmZQ9ZBZsbY2/17zlcQJq5OVwdB6kBU7g9kY60ibGJAnNkR+mUotndZXH/rK1LrNpqm334AoxJH1hkbFlVapEe+v3fvCPge2fVNueOy5YBbmYyMJGMiHykP23qFrtLu5v6r0AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779218786; c=relaxed/simple;
	bh=zW5b499U1TRt5p8wBJGiaSnPdrSlS9J0lZWt9neayxE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mHdMF0pPgUqThaiMZ23WNwmErh4W4Nj+9KCGZA5NAJCkEcyImAVOlvHxRd3mVTZfD38UfksoxyDy6o5uMeWNpn6HKPz8vHMFM3Allh++yX0q4bNh6usgr/GijZuuFS1CuwsBtjKJ/uAaimqrKGwa8xT6JpjiQTlCuO3OWA/GEAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c40ezBTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=drjaAY9F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c40ezBTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="drjaAY9F"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExPrq1963823
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uf6vNedqKPBjY1rsrsWPqV
	vcKV6iDdSc9+qVonvoMYI=; b=c40ezBTk7JM2WUoSwHH1E9kdVj5kozuG5CzZG4
	wgV+2ZPhqoxkgP/DrX/CjzfkK9CKx88gXf4RRSs6iYcOZwLq5FHDwmBSUHCDflR4
	4ZoXArEmxltWLvr2yZ/qU3cFD3TqGYXK8IQO9aeuwYbKf6v3bSIYONkJREENSsrL
	l0MZS5uHmkaucCFKTNCnWSGHhzCCZXs9pvAA4NHFkxhqTnQ4PaC4BdOat4k9V+dM
	F5jmOa0740F6yShyutvBB8KO1GJbnuUBYWekLZFtXghlpmQmZ5PhORUwTqQweu/K
	PjrDzxaoe2IoP7btHJEhPHAZHJld7kyRMQgd4sx1rrZT91lw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t1591-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:26:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bc7f9b2213so30357935ad.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779218783; x=1779823583; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uf6vNedqKPBjY1rsrsWPqVvcKV6iDdSc9+qVonvoMYI=;
        b=drjaAY9FIhpglk7R+XujL1kwxqqqSij6+E2jYfeeLdn3uQUGLuwEb46v3F8k7DElLr
         BSnfp55IFy1kvivaKPQThCVRapFigR/BYI4gjmH6BZaVNzqgMgA9D1bScRBn2c39yIk8
         HNrF5rD8trg8gcL2QY486aHXsDpRRZ0TMhUChmn/AA9Rl0oNv2nJenoLpAVbTpmedsBo
         xDT+QWTCWd6gHWfkKVadE/r0oD2LIBZNwYTAqrlT3xSVi5hv1OSCBOSHrhbdQyHHcLSY
         jdW7SbJOoE9oPf0JAlRR5im0cZP4s9fs3elcbY1D+U+0RmEeqIcuRpXz1oSJA070zV5O
         puGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779218783; x=1779823583;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uf6vNedqKPBjY1rsrsWPqVvcKV6iDdSc9+qVonvoMYI=;
        b=TrUjN5sEa07uUD8n7exOBdFv1c7Bsi+Hmib1rTD03auHHn+V59cjO69ee+P0r/7yBj
         CLGGU275+Z60/RNOMaGjl1F7Y9tBBQ76T8xFOs4xWH7LHwMxF3dQSYJQIC0apW5bNfht
         HKqqsT1WWqthJYoxyzXkPzqh5uglZOBPiqJ/OoN5kvytY43lUoBpi37gS9fwSoZnEB1b
         2gv1vivtPvBechEvQF8NmX97/0qrxsY+f+FZfn/8Q6Z0z2lduo0BI6zFI90LXX4XkG+8
         Lda3j+YKFeRxr38vTa0KiidRcqn4gP9dICiWknybiFza+AAmAG/+tvX4uoA4MZfv0HMD
         D+yg==
X-Forwarded-Encrypted: i=1; AFNElJ9AW6TVUjP0gNnYhNvOQqo2gCJ7XHsEVeVV+EzdJbvZZgt8OQVG25MTIsP+KaFn2MfnkMEgYhCRSCvi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0bMgOJUC3YrxEjhVdkGjRcKUxFafC/5LCfe7gV/wz00AtmqB5
	TsFBuyQe5bioABxXJZd/Joh1r7F2XIqYfeqNgg8hbUcU+7kDAfoTKgEttNN0iGpcmibHsFdRE0e
	jmDsO+euew+mutDU1fDYMOEJKa67SIPZo3hBNNJDEY9VAzmnw/VGXnGDqYjFdqWtG
X-Gm-Gg: Acq92OHX8aTmVyDcn2tmQvaRtxorb4gPjaCfG7v4zBjSgDG4iRIJob00xjL+osezKMw
	uSl2azV9ErJCZo1hV/Pe/xxOC+N8ZhAHXCPpy8rJnMdxf+pLeqrlILDyMVOdO3YUEOQplzhkAId
	8EpTC8nazuAVVptRMiEZv+16LmDp/QTB18ddN2K9p7PWQ9nrztWPBIS1HvvMK8Y9gJGgXoWVAfa
	7svOOC8KsJFEJmYaN0L1ztGnJNS9tT2jart7mdDne2uBMpPxCuXyTc73qqDRotPe30UeLK1rGJx
	fsvaBEZJNTBwSpDLB5tCicXA1OCVQ9ARFa4cdcmk8stpzX3Nqt90tYQM/NnK5Q4yUcIaXwtSLzp
	OxgazvEzrsSKcOms7AaRoNVodw6GTYDiTps4zOzj7pP6p3M3c0HfDHzdlOqng8xVAIkdYdLeqLo
	sJNxrt5wEi+ZN9gu2yTwvveff0CMsNtfeXGwZrUlysR6sCxlKZvak=
X-Received: by 2002:a17:903:907:b0:2bd:8822:d8cb with SMTP id d9443c01a7336-2bd8822da42mr207978985ad.23.1779218783121;
        Tue, 19 May 2026 12:26:23 -0700 (PDT)
X-Received: by 2002:a17:903:907:b0:2bd:8822:d8cb with SMTP id d9443c01a7336-2bd8822da42mr207978675ad.23.1779218782632;
        Tue, 19 May 2026 12:26:22 -0700 (PDT)
Received: from hu-viswanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd791e0b06sm173927925ad.22.2026.05.19.12.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 12:26:22 -0700 (PDT)
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support for IPQ9650 CDSP remoteproc
Date: Wed, 20 May 2026 00:56:16 +0530
Message-Id: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFi5DGoC/x3MQQqAIBBA0avErBMmQ6muEi1Ep5pFaWNEEN09a
 fkW/z+QSZgyDNUDQhdnjntBU1fgV7cvpDgUg0Zt0WhUnI7eGlRCWzwpSfSqd67zNqAJ1EIJk9D
 M9z8dp/f9AIeryFpkAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779218778; l=1212;
 i=vignesh.viswanathan@oss.qualcomm.com; s=20260518;
 h=from:subject:message-id; bh=zW5b499U1TRt5p8wBJGiaSnPdrSlS9J0lZWt9neayxE=;
 b=S2O9xp9AA/AxpOhTEWGwN5XpSAoR6Zr3M3VVWw1DqU+TexMsboarRuYHN9yEBIWUgWJ88qJE8
 NXvv7rLjRHiDx9qhLN2aqHX28maZqV6VS2d/1KsSZzTEV4w9R0vb5LS
X-Developer-Key: i=vignesh.viswanathan@oss.qualcomm.com; a=ed25519;
 pk=/lHspsTTqZQg546ZudgrbywCsk3Whx/C0XNVUevaKNk=
X-Proofpoint-ORIG-GUID: 1Z2IJrVUkgGZs6aCf-4wYmilqSwP2ylv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE5NCBTYWx0ZWRfX0FAJl3Ufjqo1
 fMOjagEg39tJrR2etdQ1h9rhyIWKLB8OmLzQxwHNUzKq12uM1MYHeXylW+LzuDRt3PkP9vGmF1K
 NxI0AY9dhEe2ahIqgCX5eIb4WmHOedLYfcec/4jHnFHzXy/RL4SsuVqbhTVFB3nI7wjYOSHOC+C
 8Ahhb4rRh5avzNoxhTX+bkL9evzAXTbJUFdwcZUIPxKa2nnaZH7QNg5+1ab26q7eAOJ5U2CqKeL
 pZQjauct+5VGElJfPIC3h2b2q7ktI5RV1GQz5LjKCROj/akkNFKIutrNZSQuf1/09pfRNSqEzB7
 RwgVwVoFh8xLYoHgkwZTNHnatiAaBDWf3mqQJb/E/RwllzOGXUiXuBs1oFEnH4AbdDbP3YKMyTM
 oS7fxujzIRsr4ZfOb+jHLDCh4vRmBq9cv0ZS2PqafFS//3vNFohJIswfmrFuez5fTMfS8HrkQRM
 H9XFsHBXxnWqLEaF1iQ==
X-Authority-Analysis: v=2.4 cv=Y/bIdBeN c=1 sm=1 tr=0 ts=6a0cb960 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=995uESR89bAMFbUx9B0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 1Z2IJrVUkgGZs6aCf-4wYmilqSwP2ylv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190194

Add changes to enable IPQ9650 CDSP. This series adds new Devicetree
bindings for IPQ9650 PAS and also adds required changes in qcom_q6v5_pas
driver to support IPQ9650 CDSP remoteproc.

This series depends on [1], [2] and [3] to functionally bring up the CDSP
remoteproc on IPQ9650, but does not contain any compilation dependencies.

[1] https://lore.kernel.org/linux-arm-msm/20260518072856.22790-1-sumit.garg@kernel.org/
[2] https://lore.kernel.org/linux-arm-msm/20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com/T/#t
[3] https://lore.kernel.org/linux-arm-msm/20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com/T/#t

---
Vignesh Viswanathan (2):
      dt-bindings: remoteproc: Document IPQ9650 Compute DSP
      drivers: remoteproc: qcom_q6v5_pas: Add support for IPQ9650 CDSP

 .../bindings/remoteproc/qcom,ipq9650-pas.yaml      | 136 +++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 |  38 +++++-
 2 files changed, 172 insertions(+), 2 deletions(-)
---
base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
change-id: 20260520-ipq9650-remoteproc-9aa8c6d05de3

Best regards,
-- 
Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>

