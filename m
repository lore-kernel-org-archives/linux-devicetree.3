Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209352BD11
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774101044; cv=none; b=NIg4+c5lMVY4SXh6pzL+BJ1n/U4U1LklRbeJwwVd5aGazjqoZGT7vGDqjK0soVqIQRR6TjVtcbaw/YeEbe3KkE0Ib/716gr4gwlJg7R82Xl0piut/Xd3STbLFOS0Gtx7fphGb0CqtMMYvM3wlUrgSVjoFObcxjKI7kw2xctqgBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774101044; c=relaxed/simple;
	bh=mKHx+VfRPQw/ItF5UDbBI85OytKLSDar0Sp+oJ606Rs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XOzO3GI+GB8OB6vheLnV0GZbVbeeiCo+fK5OmY+xW8iG5Ru0C/9GG4qUsKRN02B6+7C1lrY4CbgO9fZnI4kzuBBCrMgiZimgsMxbvAHgpqMCm+6WVlhbTumUFuXXsLH4zikKdYkGvczx9HwfJZVsMt8NW+RC5lFyHzbY0BfDdME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnhFWPjf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilL7vhbY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnhFWPjf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilL7vhbY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LBidno1108940
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 13:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nXecX1NuKNC16BMQb4qBGz
	Rq5LjOcebRUD8yZZIJjtw=; b=JnhFWPjfrRRzGgmN8G1UB11yazMPXDNiLX9wYg
	/Q8ibRyHtgg+Wim71lhmhzMeP9NRlj4P8rUr+N6ats37jli4b2idNA0yrd/+Vm4Y
	3bU22VzXmLk21GwcQ9mGaP9aJbJj+j3rf9A9CYIDA5gHL/HqrP6I5m8EVZTHK9J0
	YWjxdIWd5kZJBNE3zIKPH3426f1IaM/OHXhQupNVCXSALqQVyaa7ZMxvN5xYSwaY
	zqVkNdZOlsD+S66gPW2creujUKcHZil23kxNsMmq9FsmWPLiq5mhNpNXhWH+8Pts
	ifZfK00xcrCsyRN2LzEPsny6vqAPMynObd2WqqMEDHrRY5EQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9r8uwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 13:50:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b064f043adso34046855ad.0
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 06:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774101042; x=1774705842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nXecX1NuKNC16BMQb4qBGzRq5LjOcebRUD8yZZIJjtw=;
        b=ilL7vhbYBqiIpj4K1/MJbPnXdlPNTeI86uD5qjtQ8vNNluwOSYyR9+vVWUQW8+Cb0O
         u4ianka/Ny7FcoVQUcWJUdZnn9fPU8xnQDHZtqKPCDdB4VMEsBH736OExFWmgs46TZsU
         34GnBB90SJPfXnI5B9ATE2nfBiglDQVEcv5BHYviAp0SgjDPda3TU2xxUHhBi3kZy5Xy
         1WrETDbLR7og+uhySC2HdZZX/9T49ezGclnlT36ywhZItVJqbsPGQ6SkgCnR5l3IkpRD
         BC7wEXRYl0Htv1RFr29B8mRVqLjT0BK0FR8jnU6CI8A1Qsh3CvrryUhO/jSAZKF/ITOL
         uxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774101042; x=1774705842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXecX1NuKNC16BMQb4qBGzRq5LjOcebRUD8yZZIJjtw=;
        b=gIlch5oF8QI6Bc0NP6rJybi3OhCGOu2EE6/EI718L8HHs7L7rlIDhJuuxFVjorASkc
         AFt+htPDUtNy5zjK7KaIoHIVvfDbqrPql1WNScg1BA/m2EotSawC0l1PrlBHfq3zC5Bk
         JRn5j+hv4W29On+IzPToeHX6Of32SDMvR8CItYbhLlWaJsmZRtXxndd5QeLYDIlWidJE
         3VZ9cImh3/zwG/ZetwsnVnUhZUcmEtV380p8tQAY4zUa4c8LUwofSzr7HcFizcHIKUGn
         BrUFvhE59vYchH0Zc17F0kuS8DHNUIh1hVg6uws+GQu9GsQcfix3Fh9LmK1wvwRmwOug
         rRxA==
X-Forwarded-Encrypted: i=1; AJvYcCVVifOyRHz9G+ccD3OsfaeCFXRb6yVUyRgKbiB4CNoL+TMPP90r2dofDt9+VWKV7Xyw/Zm23EPdE3Nl@vger.kernel.org
X-Gm-Message-State: AOJu0YzsFtTNvvB9OtDaEokeOWHLMY43qWkndFIy9YQWprTWnBU76R8D
	domRVl9QGtik/bt3c5MyJyxGjLgMTn6MitnQdFR9GQ53k4VeEOcOWcqzA98lygXauPtTsHRxd3K
	VoHB19UV7JRzKf0Evb65JSbIls+h3Rl/3wVEGACAeOKJO6IpcGkCfgffCutV/pzcA
X-Gm-Gg: ATEYQzzivEKPcD4XCDiyw6udGQcaQbRncLeofbKoWX9qR8civNIQbOA9W1cBXqBk+kS
	nOdf7wm2aSDg0HkzL+k8Wye9PtNZHoKuomok4oVN12THYw/Ne9u/AqiqtUZfgRN0+ZoYVzSGBOz
	52L9T7E1kkFby5RxkEAoijlpVOPJt26eapkpOkswNisvQtQlNhqc4f2ZXl8Qrz6rRtxuPvFjh0Y
	158R/gXk6Nc4uNvgCZfAMtqhfDfQ4Ro5esaCypO4BEaup+pW4eNNIAv8anJcTh0EZSwKAllBKzY
	U1XPElUTDGzLkStUbAnH0IHgmOBPP4ktkIR7bNxXBbs1WsiTqmq/MsaymJ2NFDLY16OrKHZe8v1
	rARo6C+/0ST9MuqUMuZuS6NJJD9ThPEiSzKzFXFTvQI6g0mFubnjfuATU5A==
X-Received: by 2002:a17:902:ecc7:b0:2ae:5163:c2aa with SMTP id d9443c01a7336-2b0826feed5mr59028895ad.20.1774101041720;
        Sat, 21 Mar 2026 06:50:41 -0700 (PDT)
X-Received: by 2002:a17:902:ecc7:b0:2ae:5163:c2aa with SMTP id d9443c01a7336-2b0826feed5mr59028695ad.20.1774101041170;
        Sat, 21 Mar 2026 06:50:41 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516cb9sm54897555ad.2.2026.03.21.06.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 06:50:40 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linusw@kernel.org, brgl@kernel.org, linux-can@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v3 0/2] can: mcp251xfd: add XSTBYEN transceiver standby control
Date: Sat, 21 Mar 2026 19:20:29 +0530
Message-Id: <20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vozZFacLZPBG3l1Nic_JO-9FI_N39wwQ
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69bea232 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3aoVsspQhmqNhTY_ZuUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDExNSBTYWx0ZWRfX2/PXTtiOPBRd
 drEwYN7TIjUvYLcVC0Iv5vOW5AUfrjo7ODv0/SKUFg2afZ/nvvpDhQhCk0Ln9Y/X8m3f5pQe1Pz
 ZTcYlagNealIikz8o6n9WhRs6ywHj913Dpyyc7DL9eZWMiKSah1/osvgiZEzbQ6tXOrkqnw/B8d
 oKgidULbdy7+iT0X1VoiYWUjL99qB9GbsBKE6rbLqtem0h9oWWiqS87p1+q/fHmOC2SOflmYm1h
 p/OqoCV1WR9Nm09CdSlL4XVG78Kruc0d/1P0SNE6al+DvnAkVtrQgK/sHhoghWbuk+jCfav5JW8
 /KiiRk6NtG5sHxgHhxq9j1lowwD/3z9GF6k1rrUeaLwNxeTYViu2QYXG6FjegTkYAkW2dK58Wzy
 gpGFQZPDm5ogRSK/2OqgT3iIEIRLpJxLLZEqRrxWMX8d6f3jen2ogK4XbFpyaeqhfVcOUC5edrT
 /KbmN6g1t6yNLAdq4+Q==
X-Proofpoint-GUID: vozZFacLZPBG3l1Nic_JO-9FI_N39wwQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210115

The MCP251xFD provides a dedicated transceiver standby control function
via the INT0/GPIO0/XSTBY pin, controlled by the XSTBYEN bit in IOCON.
When enabled, the hardware automatically drives the pin low while the
controller is active and high when it enters Sleep mode, allowing
automatic standby control of an external CAN transceiver without
software intervention.

This series adds driver support for the XSTBYEN-based transceiver
standby control feature.

Tested on QCS6490 RB3 Gen2 with a PCAN-USB FD adapter: the transceiver is
active in normal mode, CAN communication works correctly, and the pin is
automatically managed across sleep and wake transitions.
---
v2 -> v3:

- Dropped device Tree change from this series.
- Configure xstbyen pin before bringing the controller into normal mode.
- Add a check in mcp251xfd_gpio_request() to ensure that GPIO0 cannot be
  used when xstbyen is enabled.

v2 Link: https://lore.kernel.org/all/20260316131950.859748-1-viken.dadhaniya@oss.qualcomm.com/

v1 -> v2:

- Drop the gpio-hog approach as suggested by Dmitry.
- Enable hardware‑managed transceiver standby control via the appropriate
  Device Tree property.

v1 Link: https://lore.kernel.org/all/20260108125200.2803112-1-viken.dadhaniya@oss.qualcomm.com/
---
Viken Dadhaniya (2):
  dt-bindings: can: mcp251xfd: add microchip,xstbyen property
  can: mcp251xfd: add support for XSTBYEN transceiver standby control

 .../bindings/net/can/microchip,mcp251xfd.yaml |  8 ++++
 .../net/can/spi/mcp251xfd/mcp251xfd-core.c    | 37 +++++++++++++++++++
 drivers/net/can/spi/mcp251xfd/mcp251xfd.h     |  1 +
 3 files changed, 46 insertions(+)

-- 
2.34.1

