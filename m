Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F2E4C9012
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338660; cv=none; b=Asa90JL1DlBSr9WzTqLOWq6RAiMJpcPXSOVSlynSFKDG/zCZrWderL+Z+YqmXU50mHJ0PuPBfz3EWY27LtgPh+GYsBe3xIsW7AwGCVU7dRejGeAj/bs4qBxVcuQQ13lzHgVuWFYdwduZNXHlrl5bjcPXCFWeZAmv35jcp3Fl3Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338660; c=relaxed/simple;
	bh=879g+mK598YtAYgU49sD3vfPo4Kq5psSJSIoXy/pC78=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SGsmMPHZm7gTCE7YLd6U+eNSIVpprfaXCKP6/2m9pVwWxYlgI/9o34nVchYgOwAo/8m1DAAAMU+DETX71AYB8dwAAjRJ35YJ6frFKpAT6ZCD/5bTuqxCDtz8fqL7WOFALGOirC0+lbOo22gf6rnqbtJ1hocVZ6pOKp0+Rj3hTZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aFmuvxyN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+LG8QqT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFmuvxyN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+LG8QqT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3DUl1700489
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AnH9lvZhGFIb8RDKadhDo6
	YW6auAb4Np/IIdX+siX3Y=; b=aFmuvxyNHgP21zePHKB2RdX+48NuON5WYjKYxN
	sO6gyeVEhiDJYElrmof63t3MkydLnCONuUDOHXgj0HyLaZv4RyLB+xLCVM/93NDP
	nNOu9mTe+whKf4AFxEh0tyhfsP/KxiTZuTR/wvF7i9uCv5ZtIQKDHroVRx0ksFSr
	lX108GAsmoAXPSfJ1QrlGk4GPZe0PX8ffM26fegmOViqEwBDah9ZbhKfAX6NLIhG
	zbBPez0aGKfpVAaVkovtqN66WRUCdJxrKhXf63EyQ6QS013D77HqXaOsLWm9fSXN
	YsI0uQmntqES3dXnByGFO4f7ctr1ZvMIrIJ4ieSHVRdaPf+Q==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrj13k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:24:18 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66898a9bc85so1375866d50.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785338657; x=1785943457; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AnH9lvZhGFIb8RDKadhDo6YW6auAb4Np/IIdX+siX3Y=;
        b=H+LG8QqTSt7HlLlqFB+wi7PsrQjb/j2DIBDOhZQTMchW4iIy9dOsNQRKQh4X2rbs8A
         Jk5wJ7cDAG5dwEu6RnAclsTGp8DEZBWqq4SRNkQVOpjNjHFiMD7DuVY2XfBT9TGnube/
         GaWiODZ2P+F+VQ3CsOizyDI7YGLxHoki8TVsG2XPt2TExojzZCktgqqCW0It9mLApnhA
         hGxQZGHrTic3L1UhbeokSbs/Td06W/a9QmILG/73QygG3obTGBR0ZAJz5ypdubsiY9a+
         iYNsHGL+iB3nQdocTwIo2H9VpJrxIms5GztwrQrDBj5m659RGJE+3S/+8n2VmOblzBv8
         iYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338657; x=1785943457;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AnH9lvZhGFIb8RDKadhDo6YW6auAb4Np/IIdX+siX3Y=;
        b=i8KAzODdlGyw4cSb4MwgiMXOrJ1eAHvWV4marWQJMIE+fb4HKdJ8/UMSg7qc/i/5j7
         kE/BygxG1a9gtOziNd9F9QZzYiANeIV77+SbrQAAB0c+egcIxWmVAX34s5AdnP6MoslA
         DXOo7+ph6to4D66C1lsKUzfP+jU9JTSN1Yj41O7V29Avgain4JvjpGKdCM2El9llWBEF
         cgl6nO1Rb4RpgZ5owUaIezMSmLVpQcL3CyGYp/jN+m8bQz7xb6IqKIygIJfrGM92CU+t
         yCkFand7AJTxxoIxvEZGQIJkXaGNZkG/4nQSjycquj22+5dK6JeVTAuNgm6SSvzdJfaS
         kAcg==
X-Forwarded-Encrypted: i=1; AHgh+RrLABQ4HFpVB1yafQ87mMGLS3mKjeqF6jIfN/R97/lsheQfK+iLDfSFxtS8jBdI4f7jt6nF9MBU0DVP@vger.kernel.org
X-Gm-Message-State: AOJu0YwukSEb7IJLeouTt9h892RlbYiizZdupu9eOTvK9xg6J2IVaezk
	mLQ4XgQxMlhPIjxoNkmRu5HvCDbhdf/Yg6UVlN+SvMlo8ZmtgGhvG3bi7vo3PVbPmQ0ZR0FZRb8
	bwsOkkqYmsQoC4icN4R4k0+CHxfxLZ4bDoYwG+iZ/ctat435eq/JesgtOnzxe6NpX
X-Gm-Gg: AR+sD11BoWEmO6s1QNWgkcIsxl6QWl8vq8Pu4w4v9IzfvdymrBEbf9+SCyeWk1hYJGs
	amusXLdNODb0SHYE6JCyxdwGtIp1YbC9G7M+inS15hjfGXHH1W+f9QrISZOou2DLhhS8LccqOJS
	io+7XyT3W2nMC8J8N6b8NGqqvoUhXdxgnYHAwUk/QLaKLvYupQ0N5uU/RnlY9RIimCiuWkmJmnY
	wwHqpsuWBuR/+ZDJM/t4WwRbwoQ7VDtn7CcqJiX/gHU6NayvE2l+Uto6dvgCKRpupqmcVQJ27HI
	D5f9lH5RfLgOK5eGFuX9CYM4V9K670McfD/vZsCPR0Wa3Ii2zP8Yx23IPyMRz6jCshPSqFrh5qx
	mHooRmjUX+MsoeCAI8mSuqttBXnDVbQKkRuHXZ+Dx+2tAz35L6+N4IoT6wFurhexKoDjX4w==
X-Received: by 2002:a05:690e:418a:b0:668:92ca:f50 with SMTP id 956f58d0204a3-6690547b235mr2841000d50.12.1785338657249;
        Wed, 29 Jul 2026 08:24:17 -0700 (PDT)
X-Received: by 2002:a05:690e:418a:b0:668:92ca:f50 with SMTP id 956f58d0204a3-6690547b235mr2840972d50.12.1785338656545;
        Wed, 29 Jul 2026 08:24:16 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-669125fbbecsm2050937d50.12.2026.07.29.08.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:24:16 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v6 0/2] Add DT Support for USB on Shikra
Date: Wed, 29 Jul 2026 20:54:03 +0530
Message-Id: <20260729-shikra-usb-v6-dt-v6-0-72ffb4796a08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABMbamoC/yXMQQ5AMBBA0avIrE0iXVS4ili008GQIB1EIu6uW
 L7F/xcoR2GFOrsg8iEqy5xg8wxocHPPKCEZTGFsUZoKdZApOtzV42ExbOgseyIyzncMKVsjd3J
 +y6b9rbsfmbb3A/f9AH/60890AAAA
X-Change-ID: 20260729-shikra-usb-v6-dt-a6ebccc2abfe
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785338652; l=2684;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=879g+mK598YtAYgU49sD3vfPo4Kq5psSJSIoXy/pC78=;
 b=53B0LrhwecIgK0h6199QY2U1WhXEdKcpHswwDpyus5ofjVpfO+ttzlzw/JL2Q5wdN/Yb1zHsK
 C+pLr3j+BRhDmiqSr1EDFbZlojlY7wn7LYRlpPrOPSI+OqzHDoKEKko
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=RJOD2Yi+ c=1 sm=1 tr=0 ts=6a6a1b22 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=_AVwzdTWJwZJkuAtZNAA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 4Dgg-JT4L7IPfFeCXF4psDeCRWpz3ApW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfX9lyOTgEWm2RQ
 y0Uv9VdtrrrDfsGpwUnEZ0wl0xTyp/8wuM1hz0n46jEL8ati/N7QV0I6iPkd32e5N4dOODL9aR4
 p1c1+0WMHlU4HfEsG7MC+Bs9KOp49Jgu8NzURM/3kNeBd3YpnBl/BXVK7iEitNT8I7yB+8yL6aC
 ozgsixAlS2T9dDGApIh45SvkG6Dy3WePAmQjJREhxZ40iA/cAdKiw0Fdk6Urp9tXo+nCdGOQHSH
 pNSLtav+29Kb1/vzdVUZQt9PHq5skv7KZEdbMgz8FsjOsbbYT7Y10+qSLh0mX09J6PNComIVgd5
 +vAi3VVTOUHsSGf4lnw/Fn12hNtoBrco/WSiCjpE5JbVVtHggHgzDrn4Hp4EWe4waiFPoF0MxFY
 iY0dwBs53wWRMrz9kpcHYuzQcAMMa7umklEXumcdkRXhFZX3b51GxzuEbMAYYF9GXxf7n//h9n2
 VZDp3XibXVCdrYaZT4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfX6sFQ+dMaiNzT
 /PcsuqNfVp1gqq/fCzaOjdpJ+7EJb6YPd2vskSWh/D3bR0WYDJS2TPqQgnqLeqfLVR6LtkZi4JJ
 HtCmUr9Zy1jm6mukcRup8cS8336g0GQ=
X-Proofpoint-GUID: 4Dgg-JT4L7IPfFeCXF4psDeCRWpz3ApW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290124

Shikra has two USB controllers. Adding both USB controllers support
in device mode in this series.

Changes in v6:
- Moved dr_mode property to shikra-evk.dtsi
- Merged platform specific changes into one patch

Link to v5:
https://lore.kernel.org/all/20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com/

Changes in v5:
- Added interconnects and sorted nodes alphanumerically - Dmitry
- Updated commit text mentioning that device mode is being enabled
  since role switching changes are not yet present.

Link to v4:
https://patch.msgid.link/20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com

Changes in v4:
- Enable both controllers in CQS/CQM platform
- Fixed iface clock in usb_2 node
- Skipped adding RB tags obtained from Konrad since on CQM/CQS, second
  controller also is enabled in v4. Also specified dr_mode as peripheral
  for first controller.

Link to v3:
https://lore.kernel.org/all/20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com/

Changes in v3:
- USB changes were sent as part of consolidated submission in v2, but
  they were later dropped since bindings had to be updated.
- Remove double vote on USB3_PRIM_CLKREF and also removed xo clock.
- Uses &mpm as interrupt reference (sashiko bot)

Link to v2:
https://lore.kernel.org/all/20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com/

Changes in v2:
- Moved to using mpm interrupt handler for ss phy irq (sashiko bot)

Link to v1:
https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/

Binding dependencies:
- USB controller: https://lore.kernel.org/all/20260711-usb-shikra-v4-v4-1-9d59b9d9aff7@oss.qualcomm.com/ - (RB'd)
- QUSB2 Phy: https://lore.kernel.org/all/20260712-usb-shikra-phy-v6-v6-1-1b3e51bf1541@oss.qualcomm.com/ - (RB'd)
- QMP Phy: https://lore.kernel.org/all/20260712-usb-shikra-phy-v6-v6-2-1b3e51bf1541@oss.qualcomm.com/ - (RB'd)

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (2):
      arm64: dts: qcom: Add support for usb nodes on Shikra
      arm64: dts: qcom: Enable USB controllers on Shikra platforms

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  23 +++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  23 +++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    |  12 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts |  23 +++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 233 ++++++++++++++++++++++++++++
 5 files changed, 314 insertions(+)
---
base-commit: 7f102800164990609e2b272396d45b197a55bd04
change-id: 20260729-shikra-usb-v6-dt-a6ebccc2abfe

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

