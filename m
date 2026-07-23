Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B6F47A882
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821575; cv=none; b=RLW5+ldzZYHjlz8rDBCXWZu3GoKjwo8xJ37oSUcZwRb3Trdd2ifohslTa9Z2hI6UEJrJt6QHT2DFB4LF4l1JQAL0g6Zl6jX3bfGQ/d58u7Lzlu7A8G2NbXbEeu3azMF0S/a8+XBkj4V/MtDHoRWwMGIkm7IE+2kqejZQlZBqb60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821575; c=relaxed/simple;
	bh=+clikh+L/7l7phHO2Ki3EQDgnUQENVMgpJdExPKaRgM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pdtGqZ7AWe+uFDsu7dPNMlbJJbVoj9X0SJEuHkotJx24xGP/EgceRZBibZ1XEeDRTwpYqM/rF+34wgt4VxtRIz4lQohih11WXnMQbg/7bxNDGgoYx52O80h1jLQFCpbc6SZc2auBc6z3r0rRDH6qWwulg9dISGGVqdds5oZmXUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VwhF2/w+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dl5SVnER; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwhF2/w+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dl5SVnER"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvoJ3011801
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QoF9ufEAl6HI3WmVt4LCcs
	uzUeUymzKzn28jGlkwMp4=; b=VwhF2/w+93S9DpDANB41Cy+4U8VOmUodyIMKDs
	UfZEyuitBQalpgr2v/jXuQuFks/HU69WtCivn7dVTEJIIc6TIvVl9kI3YxC2gq9m
	pbYJhNESn9l18gCSeFDJvcgzqkxwG1EcZ9fR7jgvSnDd9WS31r+k5p/JaZY9ydxo
	win871PtxqMUFWAUg4d1ThS5lwm7380DKrjIOw4XZq67OIkAr+PfHfr1IzYUtl5+
	y88iGPtT9sETCpBpUziG4O2tWEd0ZzERybyuN6NM2wqnt4D4OI1GPvHUSawxOcWI
	CAdu9Gj2n4EcnfcAZRRirqHuu0+G3GAHibOyKoLEvRtBpieA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayhb00r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:46:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so16114615ad.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784821566; x=1785426366; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QoF9ufEAl6HI3WmVt4LCcsuzUeUymzKzn28jGlkwMp4=;
        b=dl5SVnERGG29wQ++saJlzXePYopg1dnJvbTAO0JUZlgUDgq7diWqh5wKlLAzRJbjHY
         J63Om86rNq5WjmDv8JGMLYIazB6p4Iztyiy8Xjz86FnRidVLe0bw4Rg9Df/3X0szaWZ1
         upA2CL8IR7vyDf3c+qZyNGsDAju1uzltEbS0gAyZTNtb5HqaRwgY9JhGkmWs78Q8p34J
         LLLMn+UwWG/uVTWgzN65bJP4taTJEYUMJCJ2Skkl957KtNHfA6h7owr5yOdomFiLfPiZ
         3gPzzRVjKvqnOTG3IxYSSk/DA9nuzw1fphWsL4K9BKJQ1eJxMMwNzMQ1S7r+W0B4A+zb
         P+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821566; x=1785426366;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QoF9ufEAl6HI3WmVt4LCcsuzUeUymzKzn28jGlkwMp4=;
        b=f+JyKIspE4/iOeOaOYHeX60a9VT+cjsJzaDoWJwn0aASLZvx8f0Aw3lSs90LpIn1KX
         0W4J+3AqRvHhV5znjwmC5TAv8oHPHyS9vlZP+0HSuH7Y1Gj1v+Iot4m8PLlH5qCilTFj
         xn1XNX4LNY/oBEDjhAl8oV1xjgnu0W4oGL0dAcrz0cC+NgSo6CVS1ltQ4T/4+HGNe8z4
         7NsRMg9p/e9fgqysxhFLR4ms1VwcHqbyR8xpAGxdbcEckEjT1mA7dQjUT7WKOEc5YV8x
         OTmco3atxF1U3QOd0PF68HcSrT96Yd61SVqdzj7ajRMFvle/mGSCm5n8LTMspqabOIhG
         DL6g==
X-Forwarded-Encrypted: i=1; AHgh+RoKXJqLI6WCcgb7xP6DZ2T1giX7ZHDTM4AOIzATpN46jHncuBxGTrlN6/QACw6rlNY1gY3FDJTjJqZq@vger.kernel.org
X-Gm-Message-State: AOJu0YxdCHRptUCgcFybmukojQyoDU52HGQWlcEIhf2slddHD0PwNjX4
	VAoX1WhDtqQ1udzqczqi3ATpGjNtoCxC+89XZpEIvvl/OJR3qP/lhS7DvdjndKDW9IUfipITqMs
	hMA9q3GtAAkByo7hHzvY2t5FnVLONxEGngp1ARAUN47Ak67wDr3EHrrGq+hY21Tfc
X-Gm-Gg: AR+sD11yuPyWb+2Lfl2LTHaO/CXvchcn/zICRl+hwIQL/7KrcP7u3yc9WZ/cO5XUE8/
	h3uhYfGYOBEJxdxyEBu5oKloaYgx/ttO+tQWVBSwTqgn7ER+axF6MVdB2eFngZFtvPoReaHKmpo
	hQI/oS4hFnYhF+zdae1AYqiAxcsBis8tTIskJTE7pkt8SP2rwbNFaEMTBhxlfATTzU8+6vgCjRe
	LwHRpwYqSr9SePM+U05DpYoMvOKHmzs3VG/805+Umth6rooNF1KcvXEr/VnkYIHMBNT/82VhgC7
	pnG3sqAaxf+ZlJugCLK3qG4DvI7nvVjY4WW1f2QpiD6ZZl0LUaQa03oNq3r1HjVZcEmp4QATKWf
	uSkSEK06dw021ook4FNVfnc4nl15PHVU=
X-Received: by 2002:a17:902:f68b:b0:2c9:cf5d:d9b8 with SMTP id d9443c01a7336-2cfa6c87561mr45223525ad.33.1784821565847;
        Thu, 23 Jul 2026 08:46:05 -0700 (PDT)
X-Received: by 2002:a17:902:f68b:b0:2c9:cf5d:d9b8 with SMTP id d9443c01a7336-2cfa6c87561mr45222925ad.33.1784821565387;
        Thu, 23 Jul 2026 08:46:05 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd7157sm36242625ad.18.2026.07.23.08.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:46:04 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v3 0/4] clk: qcom: Add Audio Core clock controller support
 on Qualcomm Shikra SoC
Date: Thu, 23 Jul 2026 21:15:49 +0530
Message-Id: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC03YmoC/33NTQ6CMBAF4KuYri0pw0/RlfcwLko7lUah0kKjI
 dzdggs2xM0k7yXzvYl4dAY9OR8m4jAYb2wXQ3Y8ENmI7o7UqJgJMChZyQrqG/NwgopRGSutQyl
 pVaBGzXiW85zEx5dDbd4rer39ssN+jPawlY3xg3WfdTikS/t3I6SUUY5Y1oUGdYLqYr1P+lE8p
 W3bJB6yqAE2ibNqV4Io1RkwVQFIpdiONM/zF69z1MUaAQAA
X-Change-ID: 20260605-shikra-audiocorecc-85efef073474
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a62373e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Vvd2gEOI0FwQMgiQslAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: M8JtliNCF54K3bJjdZk6Z8QxK4ywpWeE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX/f3d4CwT6Pb9
 U5db8u0nb7StXiVmffNQeSLBauRp85jGmPN30j3ZQl5fyfenbO3QQkYn4TtMzlU/dayAurh1CyK
 wQZH1SM7DWdQUnMw5q7wlvmH+ZIRxsa9P6NQUynsrS5TT1VRp7EDGysrlTp3uX420r1TnN5K29c
 bWp3g/tpVDobyBP0Z9hZieD/7tcXr1Zi6EGWm4lY7CZ8QrRXROydQkErAAZc8YJEgC3mmSRjh/X
 DOOoHw7kjCQ/d2AXPMz1dL8ptHAhSr/ZdOY4MNz6g68dAM07SfGczlijmfSZ87LdxfzoEu7kbtq
 +tt4DpoEPR3Xz5l02jQ7DS4z9/PLwBSZMR78IBR48XexC1IAlAgYukU54v8civX7Dw8o9/pTYck
 tEpfdOHqbG6ed/7M0Q3HI9c1KHdxnruL7Y4AQdMchGmF6jL3ByGjTlJRAcr18lRCPTo2HikD4id
 cJMKQGT98PI5/6fM+mg==
X-Proofpoint-GUID: M8JtliNCF54K3bJjdZk6Z8QxK4ywpWeE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX+TYpTleQjAMR
 C6ovEd7v8MQOUZf6OV4qpF3+EHI0zBlpdU13+uAqxHLRV6DNhGXE/dDLK21qgfWui5F/FTlh2vV
 7lOOfCwNJlQhO2J0V+bJbowz/K+2AqA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230155

This series adds support for the Audio Core Clock Controller (AUDIOCORECC)
and Audio Core CSR resets on Qualcomm Shikra SoC. The Audio Core Clocks and
Resets support differs across Shikra variants based on Audio subsystem
enablement as follows:

- CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
are required to be supported on HLOS.
- CQS variant: The QAIF driver runs on the Modem, and required clocks are
handled on Modem, so from HLOS only resets are needed.
- IQS variant: no soundwire codes, hence no clocks/resets are needed.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20260722, as the dependent RPMCC/GCC and Shikra base
  DTS changes were merged. 
- Separated the audiocorecc and audiocore_csr bindings into separate schema
  docs [Rob]
- Moved the AudioCoreCSR schema to bindings/reset/, since it now only
  describes a reset controller.
- Updated audiocorecc DTS node to use status reserved [Konrad]
- Kept audiocore_csr node globally enabled by default in DTS [Konrad]
- Collected all the R-By received on v1. 
- Link to v2: https://lore.kernel.org/r/20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com

Changes in v2:
- Separated AudioCoreCC and AudioCoreCSR nodes as both resides in two
  different register spaces. [Konrad]
- Updated bindings and driver patches to handle the separate node
  compatibles.
- Updated resets in driver patch to handle HW_CTL bit.
- Link to v1: https://lore.kernel.org/r/20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com

---
Imran Shaik (4):
      clk: qcom: common: Register reset controller only when resets are present
      dt-bindings: clock: qcom: Add Qualcomm Shikra AudioCoreCC and AudioCoreCSR
      clk: qcom: Add Audio Core clock controller support on Qualcomm Shikra SoC
      arm64: dts: qcom: shikra: Add support for AudioCoreCC and AudioCoreCSR nodes

 .../bindings/clock/qcom,shikra-audiocorecc.yaml    |  55 ++
 .../bindings/reset/qcom,shikra-audiocore-csr.yaml  |  42 ++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   4 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  17 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/audiocorecc-shikra.c              | 809 +++++++++++++++++++++
 drivers/clk/qcom/common.c                          |  24 +-
 .../dt-bindings/clock/qcom,shikra-audiocorecc.h    |  49 ++
 9 files changed, 1000 insertions(+), 11 deletions(-)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260605-shikra-audiocorecc-85efef073474

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

