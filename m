Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9853CF1FD
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068472; cv=none; b=YKm5u2XbsbW8lZ+Qn/gCBGynfOlNPzwwWETUR/jhbWCK1aP9IfNX1B8iL2j8YeU68wp8BZDoEShCBm+vOEiUlc5voM30QDkD1rAQNDwlHyc682qBxdDTg0csmOVUedXuve7BpfzReR1hOWuQgd+8WGOPf0NokW46ItDYI2AVdDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068472; c=relaxed/simple;
	bh=WVS9GHikQg5wf1mgNe+vtdGOXxmmqGP+XxBotszidUU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=autSUWWp38/qpa8bP290c0KhIJchNTh4RHLrJ8tVV5S6Apl/DsIZCugiILHjFctcgMJBTb1Lu1dqog8QjAaSmVOs0RZUVTLnC8wPYlnR7EuOM8LK9LZIMMs4icWBy28sSMbfS7DXMiozCN8x2unP/zTT6hEsfsd1AY9sCkTvCfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dU+0aLHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bs80cJ4y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dU+0aLHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bs80cJ4y"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IE0fXC1427044
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M0vkyOIUMiYiRCITnoPLyY
	q/NcpQ07ugD4GeVjYtDjA=; b=dU+0aLHGjGjihaP6Nals1yBgnMrih8Vj4p6XUk
	WnRh9IFReFVX3Muy05gID5Gaow1BhQFG3COGcF3zrdFLsdUCFJVumXEAaKz6Eukr
	AzWT/zAmtihSJ2gUycWGAuKkwk1zonPlX/emlwS/it/6N4qUyQB120TxSgKJSCtL
	UW3Pv9Gi84Z9VG3o0bCOq694GNA4h+32C31BL0J9N5wCkpNC826NT14/4BaVX9ka
	1U9oLJIQ79WO9BX8k/pthcd0MRisDkw/606el2M68/YnTRpR/81h6JHN4pd8Un7r
	GOWmukg2d+Ce4boXuRGloSGk40nfqzNmTBU3NyadSwh0ZCVA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4nb19frh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:54:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc86a9ef97so94210195ad.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787068468; x=1787673268; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M0vkyOIUMiYiRCITnoPLyYq/NcpQ07ugD4GeVjYtDjA=;
        b=bs80cJ4ygavqaMoLN292Aq5xRmZU+zP4k3ZBhMydeUAv/3TcgV6ABtY22SYqvNMEgD
         HHIVUIRw9o7pHWHbKSFutR4SQa79sO9VYZlRViZ8rZbWU8/UTEfrTs/mr5sTz16sw+i9
         9+uwxEMMeAQgJIa8iEfaE5jQvj5MZifraWPuOzUlsarem1Mxtis9SbsPTnlzGBkx6VBk
         Ucv9vVO8D/s94n7xsvK9koCaYdrApaMWTXMO9/TPh3ol750CINyCvgmqz2KMr4pD/+9L
         wV5OBuBVKpuK3LawuJ0Zz5V5IkWWKo0vDYW+vwEJ4S/4AlBmJQFEKWgAMTKd7ZuKP2fa
         lQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787068468; x=1787673268;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M0vkyOIUMiYiRCITnoPLyYq/NcpQ07ugD4GeVjYtDjA=;
        b=KYx+Bh7Wmpg2DpawRyE8m3sBg2+oplLLaNJTgtCXvFf1O+aQbB3JlVbosnf/Rw6fnB
         phnMUt3Ay32FeYNStz+L4Gr6z2/r7wEusL3qRgbJNi30Wxb86W45QRzuj5qYrpUL0WLT
         FbLPv6zDSnUDLTIF9OiPuO9C4H0qo5aQwReo9VAvj8Xe1E8Rvz2CDx+IGXtOBGRL2PXc
         7WDdpfWyKwrKFnzTDNoazg3o9AMEJQQWMjHfNTmQzIEbzd36ZnDW7FvWtqfwZGquv9/J
         IC301g/XkCcMVAXgHLOgPcN9B4AtyjpETAkFb1//YxBnIVDbDYzwEprN+G7oJqy6DyWf
         i5jA==
X-Forwarded-Encrypted: i=1; AHgh+RozOtqhZwX7Xp5wnD9fb8+69YwaL0fdtcSU3LDo2yRA6169vZhYNHuVHTe92SC0Ny0yXRdi4g9eTPP5@vger.kernel.org
X-Gm-Message-State: AOJu0YxzqfX1vLIXYDVswgzi0+G7NujxVoooX5ofFsPWqzxgbwF78Lpq
	iezajrf6mB44XZH3pl4zoY8BV5sxWHvSS4Hw2LOwv4YjhDPSl6tHIzLGGPo2a+k5llGMjTxFWBK
	bavvUJyYgLmh7s+UT/MuQNLwv9/XrB9k7qYQ/4avr8ZOsG+5kQnARUy5H/x60C8ne
X-Gm-Gg: AR+sD11jBYUOuxRReqmWuFKsJI27urgG4egxEdityKV5exwZ6VWkM4DzW1WZgoNP4F2
	DgZziyWlvg9P+eZQU3u0sCdJ6s8HQAgJHcyK32TMFYSAPAA/9uj1sj3rDZQyTb/nlA4iiD/D91D
	Cdb0ARzEpqpza1Bz04utzf2tDmGkm0VQyEqJVWMBPVWiLJaaDHLII6U0Pl1nzE9T34B2HoSR4Qy
	1OobdjDU/h8Ji94uMiHo9DD37ayOyvWrL1Dcf81oMjfoFnBdz21p9dvFkm1WyXDAXmE44hK6iAr
	NgGmnU2fnmOf6is2i/jUnzs4rvokNHvK6v3XqGIs17Q3gGa0h2yicdMuL23Z/R96aVHta50BNZf
	oNW7prtcYA+Hg8eXUO95fvzYYa+JzzJDEJg==
X-Received: by 2002:a17:90b:2684:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-3955a756226mr13470167a91.9.1787068468098;
        Tue, 18 Aug 2026 08:54:28 -0700 (PDT)
X-Received: by 2002:a17:90b:2684:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-3955a756226mr13470085a91.9.1787068467599;
        Tue, 18 Aug 2026 08:54:27 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fbb41esm8877721a91.10.2026.08.18.08.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:54:27 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v2 0/5] media: iris: Fix DMA coherency, power-off ordering,
 and frame interval issues
Date: Tue, 18 Aug 2026 21:24:13 +0530
Message-Id: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACWAhGoC/yXMQQ6CMBCF4auQWTtJKUjRqxAWSAcYEyt0qjEh3
 J0Rll/y/reCUGQSuGcrRPqy8Dso7CWDfurCSMheDdbYytR5jRxZcOAfCfpXh7PQogwJnXFDXvr
 q5q4FaD5HOmZaN+1p+Tye1Kf/H2zbDlYoHbh8AAAA
X-Change-ID: 20260818-iris-fixes-dma-pseq-fint-707f14d69753
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787068460; l=3971;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=WVS9GHikQg5wf1mgNe+vtdGOXxmmqGP+XxBotszidUU=;
 b=7SFbwildhCgD02fwzEO+gjhalpqIW+Ib23N51Yq69ldSx+t7+sjt72LtbyHdoCvue2ceCkh8m
 zGhh5EvSMPCAWNtnVkz95y+iRjGVTtSwmuZ56DYbefP81rBBduSjKzE
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfX7PlxxIwHya/u
 CUN25mftiUmtlIixvcBL/UpgGgLX0iRpk3vLQj8/CL35iS4g5nwE9JJGvBQVnJusmzDHONUZu5r
 wKrI2TcIQYkF9lHX+4nyDw0Hs9q5yJhZn8NddlMcc98OtRfhLrXiI3HnAP59gjGChpXwFepzvza
 ufe8enxephfT9g40FQrkHFvkCZtlW4Foqrt5MYYY+D1Jccl5/CEt0nhHVjfqNTBXryZcjVz7WgW
 mXiTHtH355M3jhT+NRPzD7zIviEzxLgAsGDjlbtRHjp/GFfnOTpzi2364cZocJQHsQQf6L1EkEP
 zRdgnpaRcyngi4e1W6fcIRMX9xUylt/PRR1rQ3lWJM+CswRtZLg4RS9RW8qVByuHLw1CCBKDg8c
 I0cxs7kISCaRaD7bzn4rpn7y/mR9LeohNFqqo202UVFJUwJsyGsIcvO/n0QWPqf5kvOF+9LrfmS
 E9e6lSsQwK73Fd//PmA==
X-Proofpoint-GUID: KfpXdLPKuL7eDV1zIt3riVjpp_2heSgt
X-Authority-Analysis: v=2.4 cv=Ze4t8MVA c=1 sm=1 tr=0 ts=6a848035 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=LpQP-O61AAAA:8
 a=24umufi_F3H4al0x9lcA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: KfpXdLPKuL7eDV1zIt3riVjpp_2heSgt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfX2ZqYElGYPKg9
 EqoYrphlYGVVxEZmEAaRZgISXMcClz5OO8fcAOtJYfgvHRj/U6U5ApXWcu1AcJQSZrr0El6EKAx
 q8Lr6bkiTa5fZFcbZB8DlQSHTCwzu/s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180117

This series addresses three independent issues in the iris video
driver and its devicetree bindings/nodes for SC7280-based platforms:

- While testing with some higher resolution clips, the venus hardware
  triggers a fault due to wrong input data being received. Corruption
  was also observed in the captured output when the client dumped it
  to a file.
  On debugging, found that DMA buffers shared between the CPU and the
  venus video hardware/controller are not in sync. CPU writes to an
  input buffer can remain in CPU cache without being visible to the
  video hardware when it reads the same buffer, so the hardware
  receives input data that does not match what the CPU wrote.
  Likewise, on the capture path, data written by the video hardware to
  the output buffer may not be visible to the CPU, so the client reads
  stale or partial data, resulting in corruption.
  This series adds explicit dma_sync*() calls in the driver for the
  input and output buffers, and declares the dma-coherent property on
  the venus node and its dt-binding, since the venus hardware on
  SC7280 is IO-coherent hardware that performs cache snooping between
  the CPU and the video hardware/controller. Together, these changes
  keep the CPU cache and the DMA buffers in sync.

- iris_vpu_power_off_hw() disables the power domain before disabling
  the associated clocks, reversing the correct power-down order and
  risking clock-controller access after its power domain is already
  removed.

- iris_enum_frameintervals() advertised frame intervals as
  V4L2_FRMIVAL_TYPE_STEPWISE with a fixed step derived from the
  maximum FPS, which excluded valid framerates that aren't exact
  divisors of the maximum and broke GStreamer caps negotiation for
  those framerates. Switching to V4L2_FRMIVAL_TYPE_CONTINUOUS fixes
  this.

---
Changes in v2:
- Add dma_sync*() calls in driver (Rob Herring)
- Updated commit descriptions.
- Link to v1: https://lore.kernel.org/all/20260801-iris-fixes-dma-pseq-fint-v1-0-aba0cb22f6ab@oss.qualcomm.com

To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Bryan O'Donoghue <bod@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Hans Verkuil <hverkuil@kernel.org>
To: Stefan Schmidt <stefan.schmidt@linaro.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
To: Mansur Alisha Shaik <mansur@codeaurora.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

---
Vishnu Reddy (5):
      media: iris: Add dma sync calls for input and output buffers
      dt-bindings: media: qcom,sc7280-venus: Add dma-coherent property
      arm64: dts: qcom: sc7280: Add dma-coherent property into venus node
      media: iris: Fix power-off ordering to disable power domain after clocks
      media: iris: Fix frame interval enumeration for non-divisor framerates

 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 5 +++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi                           | 2 ++
 drivers/media/platform/qcom/iris/iris_buffer.c                 | 7 +++++++
 drivers/media/platform/qcom/iris/iris_vidc.c                   | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.c             | 2 +-
 5 files changed, 17 insertions(+), 3 deletions(-)
---
base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
change-id: 20260818-iris-fixes-dma-pseq-fint-707f14d69753

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

