Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3382E3CC9E8
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555865; cv=none; b=EteB7EqJd30VCxYYMAd4sabhOmsjFRcC5pS6b2fGJyiRsLzV2KapZoX9J6PJyrMrixQTYdteftK/rwi9K13moxuYwVW2vAVHgxC0P3WAVAI0+ipR2RVrbdYnhoiw5Z7boAhowoYrbyDD5aP8U76JgiyRUAEss2O5LKxWzsR5ijw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555865; c=relaxed/simple;
	bh=UG0ZvM4vow4j04FZ0ZuaDuDoHfARFyoWZe4jipZwpNk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YYqlOYF6RIovalec0LIlHbD4sFR61qJDv44u8+MNSl7srrhJR12k9vc9yBay8ZCMs/Os0cdA7TryXvnKbnCn5TjmUPJWtmArwXrAhBAwY5PZndLtWRaOz8+fEcRoHMyARzoA0uF2UP3uR0kVbIfEZaFiBeACiyW2hrUrbG3vtZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZzfpumJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgO5crr1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZzfpumJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgO5crr1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65424qT52368077
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 06:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=peKwpELzZL6vKrTtvqgHNH
	vqCTkajJ4VLkel09qRyoA=; b=WZzfpumJslrKR8wQf/hVO+NUcgCUuTH3Z5fuHE
	aOWui3NUSnDHVETzohGpr5B+IsoN9XOuLerbTblWJmYWkEdt5c85t/f41+bdF6uo
	ibUVsky3LedchjHmCNyx2nsb2OCH28e59OGJxGTubeR/DxYeRROAqUQPkPONsvB5
	dlVmW+l2UbZoihhQ/64hIJEuOggJeKsQxRt0X/AW10FlmGpofuQg8cBiOIgdrLLn
	hhWmoASZlhVqdCC9xdJG6dkw3V7qmcIz3Lh5jWJTL0kus2FVTvsTkb6g/xXDqwIm
	8aDRdCRjbIzHIxCQnsD4qnRkRL0RPSTzh83ORwq9//FvEYYA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gmdtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:51:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8424aac207eso388862b3a.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780555862; x=1781160662; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=peKwpELzZL6vKrTtvqgHNHvqCTkajJ4VLkel09qRyoA=;
        b=IgO5crr1fCYnwnpNltaFglJLsM4W4GRwC3icKQkrmrEl2JLfJ+RBKIJb0ke57jSfp5
         +Jm51Bxhp4UPYRgur/Gb5J00U9NR7cix+uvrCNukK0PV5esV34ORPMo/EpC43M9vkwHT
         aN4UpIGaeda7iKZLsHybkRiTtOwHQKYMqu07ldIiaeU3gRIiNfuhlXShk82VpyPtm18I
         SvhJl9DiYqcDKYHsG2ySDj8gLuXkq3/XwKQCNUdqodgIiNTb/lUemSdfqCWCsor7IzWo
         18mPLziq/LPYJA5/zbWVqinDuLvquO4A1FekPC9BJrZfKosAekcIDjV20qDC1iT09rae
         oYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555862; x=1781160662;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peKwpELzZL6vKrTtvqgHNHvqCTkajJ4VLkel09qRyoA=;
        b=IsJaL4QRY/Q9Bq7qzLI02/Dxn/9szDw+DCjpOXxBIOvfsdX7Aic/CLMA0OD1cBQfok
         Yhd5OebhSH2sCi9mgIAix8TF3wcZ+QeBeX8EkzHU4OU3p2rF0ZIW3emcSgqFw5FoGHrQ
         VbKxVEQRlQBj7amIi9jkkrGItK7Oi0TQuaK01TCQnOSUdPmXUmGcg8PHCYQu7gzCzKtH
         k6oq4fufANgv7CQL5ZWS6zjlbMLhOuBRv8xLZqmrudTWWxLjFKS60ifNjmPr1MjDmqH/
         zp35ev1iAv+6yCNHxtYmC01eR5CZpiV3Qaa+3Yqdd4YwunMe2AeRlW8zfZCA0ed+7ibQ
         SlKg==
X-Forwarded-Encrypted: i=1; AFNElJ8tQ+rVstY8Bt1lGcu+lVyHVlfgVx3e5irYWQ/Yrjp5eULYXlETYfF3X1UYqKPmzTT8zjD6NePwFstF@vger.kernel.org
X-Gm-Message-State: AOJu0YzH/GgOsgA99I175x/6eEgZ4pq2lPC8Vg7UXzk0yZwvEVxl4dhQ
	ETYKWEsG2Aa5RJyuIw9kXjOp1yD1equVCbbo8s4fepdSGZgktENdfEa8jx1pm0arzp024LKZycO
	cKd5Vn5dC/ET7mv6SC19T6E79C+yQJmJRioeSi3TCvakmdHwvLwCFulNAut/nIosL
X-Gm-Gg: Acq92OEBjrX9ZQkI7XyNT80zpzs+71is1xVcNuaviKLZlz9jkf6DySOqos44hTxOzRu
	HuYn13DEUivmByRbFD1v0gMlZHH9w3ccLoPqEQ09T7jzopAQgbTWh1uGibaC5DSXFSbWzfzgohU
	Q+o3davytp1RRRWIFv8cQZ5fIm9pfHERjDhXaKwluqop7mKRwrRxysXT633a3Wx0R+A7Un39uph
	wBmesemgb1FGWNWonLkrVOzJA7D/Uzu7Gl5orNysP+gcbTnxx4r8MSjVDeKIP12k0UCF4CzFsR6
	XOwwXzgch/JMv2W+u6U3bdriJH2FQzrC861C8ILX31K9LXwWqRaG6O9pLPTmbDhimma30tgAKmY
	e/KiFn8VwcEaLeeF/Vqjz/iZdSsqayTwOHCGzMq4MPhRpnIwHn5W/lVmbMn7iI/7eJA==
X-Received: by 2002:a05:6a00:198d:b0:842:2382:a0ea with SMTP id d2e1a72fcca58-84284e6dddfmr6738468b3a.14.1780555862123;
        Wed, 03 Jun 2026 23:51:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:198d:b0:842:2382:a0ea with SMTP id d2e1a72fcca58-84284e6dddfmr6738433b3a.14.1780555861520;
        Wed, 03 Jun 2026 23:51:01 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842823512b0sm5365894b3a.15.2026.06.03.23.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:51:00 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Enable SPI on SA8255p Qualcomm platforms
Date: Thu, 04 Jun 2026 12:20:34 +0530
Message-Id: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADogIWoC/3WPy4rDMAxFf6V4PQq2EruP1fzH0IWSqo2HxM5YS
 ZhS8u91OgNdlG4EB6Rzr25KOHkWddjcVOLZi48hQ/mxUU1L4cLgT5kVanTa4h44UN0xyOAhBhD
 aobUD7IxzTITomlrl2yHx2f8+vF/HP5ap/uZmXGXrxjnFHsY2MT39xqDZa1NWhbHoXOXAwJBoZ
 g7FSB0l/xlFip+Juib2fZHHqmq9jDFdHz/MuEb+1y31m7ozggaztdsqh9YnV756j8uy3AHAtRP
 pHgEAAA==
X-Change-ID: 20260529-enable-spi-on-sa8255p-8166eaa226cb
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com, Nikunj Kela <quic_nkela@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780555855; l=3060;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=UG0ZvM4vow4j04FZ0ZuaDuDoHfARFyoWZe4jipZwpNk=;
 b=uUF9ZSk89C79ieWxvHnLKPsaek1RNloAP8IA31omZuktkm4ThBn2/1O614O6C9Nw2CttZ1tCt
 hFgyPFtycoPAF5Bm7T0jA8kUVwfPt91mI+cjo60s1s+zRa/H/RDciU+
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA2NCBTYWx0ZWRfX3TDy7ReOZ1eX
 4A1InrVq9VtAojII8Nq8YU6J/ALZtuw/RcuebTz5q4AnCkHfhXzzDcx+W3fud6XipaLcTcW7GcZ
 +OUqqX4v/Ilnphu4PjHE+jMbEXeddqskce6PjUYai/FblS8aJaqPfBPsBoNzLZIW/sn74WmXP1R
 9jeM6Zs0RFIkAszUjuQ/9b7+lEGyXM+YqbovtnSsEv4TLvP7HWlpO1ku3ZsppTOKZGo5wijBfOE
 uNtwozeLPNwQDSVh0wo2mzmLGtjJt9+9qdc6+FSvU0q+cmjhyX3wlYKRug8wSkTdLPhmMON4x0M
 NZLrEEMpUQEwMTQvcrhio3/6wsXvu4mCZ/lWnufwKyPECYW6RB9PCYtbunJJfIiMWLE3a1QUp1j
 7DjLrYLnVtnVJvhum0oKwz7z9bWOJc0Q/8P63a+a3YDLBAww5DIDtSUiunhUZwu5SmMlECzDS5+
 6ECWMK6MO2Fj6JpZx6g==
X-Proofpoint-GUID: HrwNrHxHT_xi7tkrsHMD3j98zc4LFxjq
X-Proofpoint-ORIG-GUID: HrwNrHxHT_xi7tkrsHMD3j98zc4LFxjq
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a212057 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=63TTwLHdKWWIMIjarKcA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040064

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages SPI frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate.

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Praveen Talari (4):
  spi: dt-bindings: describe SA8255p
  spi: qcom-geni: Use geni_se_resources_init() for resource
    initialization
  spi: qcom-geni: Use resources helper APIs in runtime PM functions
  spi: qcom-geni: Enable SPI on SA8255p Qualcomm platforms

.../bindings/spi/qcom,sa8255p-geni-spi.yaml   | 63 ++++++++++++++
 drivers/spi/spi-geni-qcom.c                   | 83 ++++++++-----------
 2 files changed, 97 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml

---
Changes in v3:
- Added the OPP rate restoration in resume callback.
- Added missed dma-names in example node.
- Link to v2: https://patch.msgid.link/20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com

Changes in v2:
- Rebased patches on latest linux-next.
- Link to v1: https://lore.kernel.org/all/20260112190134.1526646-1-praveen.talari@oss.qualcomm.com/

To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: bjorn.andersson@oss.qualcomm.com
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com
Cc: aniket.randive@oss.qualcomm.com
Cc: chandana.chiluveru@oss.qualcomm.com
Cc: jyothi.seerapu@oss.qualcomm.com
Cc: chiluka.harish@oss.qualcomm.com

---
Praveen Talari (4):
      spi: dt-bindings: describe SA8255p
      spi: qcom-geni: Use geni_se_resources_init() for resource initialization
      spi: qcom-geni: Use resources helper APIs in runtime PM functions
      spi: qcom-geni: Enable SPI on SA8255p Qualcomm platforms

 .../bindings/spi/qcom,sa8255p-geni-spi.yaml        | 64 ++++++++++++++++
 drivers/spi/spi-geni-qcom.c                        | 86 ++++++++++------------
 2 files changed, 104 insertions(+), 46 deletions(-)
---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260529-enable-spi-on-sa8255p-8166eaa226cb

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

