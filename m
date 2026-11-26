Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693068;
	b=axUQtMLkezmlAqcSl02RU1sL9K1/bru3sB/wXekZ/DvLB4EBqCh/J3mibp9BDLIQFITi
	 wL/ox52X3lQuH1ocEHS/S8paUYkSQ16jScRi+YEMhR8xETUm/Cm5yQscXM14RYrp3huh3
	 WbJ0AiLF1XHU2KYC0Fxl/zKiDCJDoTAerXamLW2wdwiIgKb0+dP5ODwZvhYkt24dtqQ4M
	 DwSJ4J1uk1oMti5xGpqMA1gehgk64d/E1IMu/EG2dsmZ3I6X8m3ZnpK8yYQ80G0+E9DvR
	 Y1DWqNNiGfjVoT3Klg2KbrvdUr+T0eWIlVVBQK/3tFzVr+L+D8mSTa2D35XQVFYLrBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693068;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kTMR2M8nH+EwQ5Y7z7vyw9+nC0Feou+p6LDtfZIOJLw=;
	b=qt3nwlZmjdFTw8nUymQ2r3hifPKY0VQ2GvEx5AaP15jtGXhu0anDH4xtV66fty0rl3jA
	 oj0i+OF0EAvsgZkX/a1VS98hwshrc8BKVIwErzLw7XNhG8zIfPqL0CcQ1aWyFS5aGaNV7
	 WTV6+dLKIvEntaUhLaa6YUwOHmKll6Ilu0ug0vWV6EGqb9FA1U/8mkoCRyDp87tS/O+vE
	 oIp1R7IqQ+pnT2/rfSO25kSqPS1FUp5gpm3jn1CkLQ1FdphDnVeZvQnqcATNYo6ef65Dy
	 GuXmG+/zMehoGB5dl8lgoqJagCn7aoY1NgZU/STb6/bTBdZBuaGEnIxVVtuPedw63GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDWtmAx3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVeimmRV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC990606A32C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC990606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDWtmAx3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVeimmRV
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVnC7633206
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kTMR2M8nH+EwQ5Y7z7vyw9
	+nC0Feou+p6LDtfZIOJLw=; b=EDWtmAx3GvvNN3a+Z9iWMw6Q/E5iJXROPRDHPv
	GTu4wUatkZ6yHEq28Rk+OR7sHdiNz3so4/6bKoD08YDftefTSOrNQLcwPDgDKM/0
	82+UM+Id0BucWjHgrOSfcfUrUjmm3/GfNKW7dMme/T7mZwOTcXEUNEg09uuV+uPQ
	whPuXgpwCkocviFOUp8VK+5mxPf9fd7Fjjub44ulB6OUhvpIihXL1NniZMDu0Qu9
	SC6vBFZ7oPIPtnBrhA3XxMn9ENcBV5GsOCFn9hNbmkbZEMiqv923XZ1YjRL+0kLd
	NwfXaMLFFlBXm8crwzl2S7qCpoSFshZDn6i3241XmIcfbGGQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne0uws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:37:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495a1f5e47so1048690585a.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693066; x=1796297866; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kTMR2M8nH+EwQ5Y7z7vyw9+nC0Feou+p6LDtfZIOJLw=;
        b=LVeimmRVS8ewCYfEF/M1zlboIBbY3DfEYFGj3BF9PhLaaTDSX+eBdinDKhry6zgGQo
         rEGUOI5LgDIJyALgxPMQM6zjC0h5LG78ZL7ab/cEb9inXwnXOBO6hdb7B50rPtSljPUG
         P4NcFeNPSK1gWf9SsHh7JFT5nRn5duw4abx7qxDhPoFnJX484t36h2aCmxjzyDx4l3xQ
         ZkLBPqJn/r4Kf3p0oAtN4GpdcaY/ZtrbwhAmmGZbxmLoDatF+faX6YA05Txi9is6m3rZ
         b4hiR39zVzR9IF1V+nStQF3zxieEDLDzjy3qvGTNmgSSXVWdwEj1XbtrF1P7DVP76OpH
         OBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693066; x=1796297866;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kTMR2M8nH+EwQ5Y7z7vyw9+nC0Feou+p6LDtfZIOJLw=;
        b=AwmtpJ31EcM4N7qj3wYzPVtG3bB0GlPfelOr3gciHWg8WakOO3sfPjZfYHYKGm9Ev+
         vu663GzOKs0+BZUg/4X3td1qknT72GTpweum7KiKJ8B+MUvLR4X3J8ZIGOem9uzeR5lt
         RF0Sr5nlL/Ovz0sxwIFnGVcyYx4XFJT08HNLbSQzJSea2UYdO06vl+gWLevEGJc6b/Qb
         hXl5c0gBTe0XlWTzUP1NwLD64oDHBlecitycPeHZyaMc/tZXglq3E2tzHhRYd2DlsRTo
         M76i+SItIUYVHsV34B0J4fV6ZisxDebZp2Bj+xuexAeoaVKmT+ehmca1pUctoT1iP5hk
         T8aA==
X-Forwarded-Encrypted: i=1; AL+hErGoxNwrJ6f0ea5J+JkH64GPy2tvLM5b0JwzLMATH+DqTujOQlRxerMTIH8xotVtbazptnHaCKhBBu1g@vger.kernel.org
X-Gm-Message-State: APuU4Z+vxF2qJOA3RjkFufFE3wA5lc3Y4ko2FJwnCdIoemw0KT6P+b1L
	vr/KhikvG12m7iFStXwGIKDJX7ZP7l75PUunGWqxOeEq2hU9CrW91U9hdG3+TbgF4/Cr03aZJe4
	ZQNkar/NfVgA2nt40in5tAiGjt+Bzx84c+ZVmHoEBvA/kwZBuarnGvNBRY9YI+/k2QdvWplRQ
X-Gm-Gg: AZFdTZfX8H9cmBnp1DjrkpEILdf7AgGKseLgP/5oJqdu+BC0PGCWPMGmrvmaJSeJUOJ
	ZROym8hY8i+5fzGfaItaUgTe3up9We4oEePVD4DSS5Wi7ld9zBy4Q9SBGsk76OvqfTXdCqeqEQa
	DrW2Aw9PfHIgD6C+HDYfSH9DHfu6i2jzfVyyDvXdSKlzirUIImpY5vO9J5Uq5CZWrnXxRZ7sdwv
	Is3vHS3Rxm8jLvgDYp4Dlp7T5pkWiPznc7pLoNUHrE1TvQs6BSL87u+uLKvqEERoeEjeG6O+9BN
	o5hhHBgZHifh8jCMEcBC9cCYQt2gpwGcJjUJ0WcJSlWgpRk7yPjZSYHuPXnKYED8O+Hha1YPMtX
	DE3A9l7IqLvtnNrTy7YKOqz1UbZcNb3QgIW0aj10z7wUKsNjfc/1iVSkHjyPbwcm+BQKU4U9dS4
	x8MAkRl03qwZYH
X-Received: by 2002:a05:620a:2842:b0:93f:5717:e7b9 with SMTP id af79cd13be357-949ba99b091mr3609369485a.30.1795693065793;
        Thu, 26 Nov 2026 03:37:45 -0800 (PST)
X-Received: by 2002:a05:620a:2842:b0:93f:5717:e7b9 with SMTP id af79cd13be357-949ba99b091mr3609366785a.30.1795693065246;
        Thu, 26 Nov 2026 03:37:45 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afec08asm748210666b.73.2026.11.26.03.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:37:44 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: agatti: EL2 overlay and QUP firmware
 for the Arduino UNO Q
Date: Thu, 26 Nov 2026 12:36:46 +0100
Message-Id: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMz3cT0xJKSTN3UHCPdNPNkA2PLNNNkkzQzJaCGgqLUtMwKsGHRsbW
 1AAjjrhtcAAAA
X-Change-ID: 20261126-agatti-el2-f7c039f5c4f6
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b081a0a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xXV0mXPzIewK9BSCCcUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX6VBuP1E6ZNE/
 Xt6pJWAYHYc9AjlW2ENbZ4JPtFt2FZfqBEgjI/O5UoNpAn0937ugiTqYccPvXc+tR3t68sdpE4y
 Y79OoUfDu7sDauStCCyBML7GDVwoltcpATiidY1yvSHBq81zW9MfFeS/+kpqGuuJVcNADjQEQkG
 3DkjKvJHRJIssdjFMl0HBUvbp51/dd9Wc3VLlREqOdwGwhMh/4f/J+s2DgghFkU/Vqd1LZVr2Vy
 2LUvR+MqX3xO1o8nI2D93IN7bDg5Cs34uZf4ltnRp8g6848Gd/JHi/iboqpwSvABSM18OuKUg/J
 x/FZbDeEbXq0i/r1Gth4eETyJbOTlSbiWj6/LH5GxkcCnphV/zAEGTBV7jmCwkxl0tf7SW3DEQw
 DShxJ4s33P8BndVVnYRz6+Xsi+/byE7W4cRKjF/Kfzkp648hfN0xLL1zjWn3CFHgZbQzRgGIQGQ
 HksacBCMBgP/RjtxZVg==
X-Proofpoint-GUID: K_DVqlLz-zWTasDtJSa2FsCoLNdRlOwZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfXwW7/rNBbMifv
 EyLlQUe+R+VomTrwTT5qNd4YduMuyj/WTR5W9pCqvbLYZGBe1NXd1/pWh1DZ1EfhvSMBkKjTKAy
 iSvFmkW6Pp+JMzlq+WNWRsz9u2Jy/9I=
X-Proofpoint-ORIG-GUID: K_DVqlLz-zWTasDtJSa2FsCoLNdRlOwZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

The Arduino UNO Q (QRB2210) can boot an open firmware chain: TF-A and
OP-TEE in place of QTEE, no hypervisor, so Linux runs at EL2. These
three patches are the DT side that this chain needs and that does not
belong in the base board file.

- Patch 1 names the GENI QUP firmware, so geni-se loads it when the
  boot firmware has not. Where the engines are already programmed, as
  with QTEE, the drivers do not read the property.
- Patch 2 adds agatti-el2.dtso, following the existing -el2 overlays:
  zap shader off, SMMU stream for the ADSP remoteproc.
- Patch 3 adds the WLAN firmware's SMMU stream to the overlay, as
  kodiak-el2.dtso has it.

Loading the QUP firmware on this SoC also needs the geni-se fix in [1].

Tested on the Arduino UNO Q with TF-A + OP-TEE, Linux at EL2: I2C, SPI
and the Bluetooth UART probe, the GPU renders without a zap shader, the
ADSP starts over PAS with no SMMU faults, and WiFi associates.

Patch 1 was also booted on the stock QTEE + Gunyah chain, with and
without the property: the same serial engines probe and the same I2C
devices answer in both cases.

dtbs_check (qrb2210-arduino-imola, qrb2210-arduino-imola-el2,
qrb2210-rb1) is clean.

[1] https://lore.kernel.org/r/20261114-geni-minicore-v1-1-a825dd549664@oss.qualcomm.com

---
Igor Opaniuk (3):
      arm64: dts: qcom: qrb2210-arduino-imola: name the QUP firmware
      arm64: dts: qcom: agatti: add an EL2 overlay
      arm64: dts: qcom: agatti-el2: map the WLAN firmware's SMMU stream

 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++++
 arch/arm64/boot/dts/qcom/agatti-el2.dtso           | 25 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  2 ++
 3 files changed, 31 insertions(+)
---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20261126-agatti-el2-f7c039f5c4f6

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

