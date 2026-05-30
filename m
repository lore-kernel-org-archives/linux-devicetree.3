Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B6C3C9ECF
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165722; cv=none; b=Yeu4FI+U4yRnMXlHxWLZyQBVIa3CIADr4RJ/tHUuJb/VRzzE/IKg9GRxYuNFYO3QTz6hpnR6vq/xI/fXuOSSse5p3SPAlNO+zmF1WCkaGQ4INyUW8Ob9n7ZoIJPTC+Li8GowgH1mD2TbS3EPusB3+4hZGzbV5WFsbzlUg/Afdfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165722; c=relaxed/simple;
	bh=17Yiv9qE2TbdWW2B+sfjsCoYrdlNtkiAjWBT3SqBDO4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SNuzQ6FKckBEEgOGR/AbsoTvN4OWdUpi+PoasqymP4spBhOqhSCEeRAHDFEsatiD/3PdS8Md9nkt4irTRj4gZfp5g8kXzOCEWbfGJMVt8u+a0oIVEfn0BF6wzX+YseTdDZM6vfxkz5hk7GRi1vnVTUHAQCzKejvUGJYtysxrhbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtDwerSG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6sjLKxF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtDwerSG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6sjLKxF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEP97s1796320
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZWBrjk8gfGrILzQzobZsj5
	BbGVxX9kwkrJPUxOT7Bu4=; b=BtDwerSGs8d1p+u/8Vjtj9QFR/VWWpehyuqzr7
	Z7+caaNqK5gARi6BZlimT83uuQ6y6lsGJkzfnyLEIEZt/TdjX4vUXYyf38UoLJOM
	DyX7jWJmmU+je3GYspk3GEWOu0PBHLzi6CVzzYdpO5b/P8QDJ1PqNPpTYsJVvGvB
	3ZKsKrVP/LaEeOEjWO8n8ZnGO/PhgcJqFfsT0qejhE17ZWJZqqUDpsRMij+abm3s
	F6PWdJygiK6YZy2ezU4UoJALCgikkmo8OPO5QpqduFsLVmvxTqBoVsYtkpvjvPxV
	ttFcn0Nk1SYTgGCd1PQ9mQlwOkZVOz5nBWkwkW9r+7BGmZJA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efpw7hw6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf55c3f44aso6312225ad.0
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 11:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165719; x=1780770519; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWBrjk8gfGrILzQzobZsj5BbGVxX9kwkrJPUxOT7Bu4=;
        b=H6sjLKxF80z8B9RDWEiiSj2wYM6z76UAv7Py6kL0pSpDIkcyze1+oDD6tJB12ISUW2
         k5l9ZFL1oiok6IHlA0ybmmrkk5WgKxBWMEkuWE/zbitsuH7tPm5Arj4ywxt6lX/r1+ce
         iQ2ZLpZC5nKggdvv6m//MgzipoEJYpsUG2HeOztP23jaaOH05RT02w1O+c+AVoqQ/BuE
         T98BGUV9nisFnvQTFEVQPtIRWC/+c9cVaq2uT2Ug8keBo9YVj6VzSWCt9zuszF18G2qR
         sjibSpOsCsIK/XLMvQN1XECZShZQzxtgDnhf5VOz1xG1PumYVO57HIUvfg3+qGK9YIzl
         iMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165719; x=1780770519;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWBrjk8gfGrILzQzobZsj5BbGVxX9kwkrJPUxOT7Bu4=;
        b=cySJW4WBTueUiXhLqzg1iKkafpjPr3I/N4h6C/N6+HEhXoQyh48bVgI6eQXhVQfP9o
         IdiPQf3l4ZIgJ91vxSu4pVhyr1QbD3ZkNxYBsr6XQDp83znWhAPivPmJkaZMX/fBCoXR
         sH9waShiqNLx21Kq/eOrTh8MBFcdeuN+BQfB4E1MGm+roXOLBNKKkCKchidwsbqGbMO6
         1Tgpxo5qbSrDlTO+EEjHGdhh/N/NQexCNvxJKR/jZEULxEGsJzstwTvh5J23LB2H33ky
         eJr8DHkU8FLfvqyXEmBR/5RnCv64LCd8wI2kKLqD2j5HM6UTcg5RNfyeriXdySMxIhV3
         RpPg==
X-Forwarded-Encrypted: i=1; AFNElJ/Rvntrke8YeeJs1qES9Uma9pTrfnL8bZOtY+b9yLQnGlq7yIs46GzaFTvIThP4BFcn3rs9Gr5qeYmE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg7R9kXOWznBxFm3hOTjbfcI6/qSeLFWbeTkh0H23kjXeXzmsB
	bkUEkOHsvmUQMhZzyEWF0POa2ilLdDALPpCAxyByleq914Yx8snt/m58Muct2P8B0af5S+G31F5
	vbhZPuP3nJeE4xxYBsv6PiNt+6ttNGVgKv8PwYOGfolpdeYO4wl5TwpOJYhQJifvv
X-Gm-Gg: Acq92OFUkMYkWtQWrpWoW6eTScptTQNEqvHXHUbqEfkAAg//sydbYsF+rr+s9my4oU/
	RnN5p9SatFrVu5mfTa1O2+dYrVtS13UOJcMQgkTJYjSKGAeKxDBuiMnunRHs5+jhVezqSO2kAAP
	u2UCeQQLnam1LHGI5mZyizhFOARxudrJAkBqg+Qs9fbtbI4T4Ji9PITT3KF9aW2NSvBRMBgewd0
	/3gWHJzS7SyVFgF0lZNl4Szsxsh8vKZJToshfG1cMP/D0D3pDXH9B83FvvAKvy11/z7NFnbtbG5
	LekX6whRXTmuZiffpNrU5K4a3wmRVWzAsL7MZMTpOG8w/ndvE7PhAFRGyQeaMgxDAfLhWpXLp2Q
	V/3+mmhbu9+9QmTfDtHsUbhCZRqSKV9t8qxe087AH9iIQpivuDHaNVaGSqvwonc4Dbw==
X-Received: by 2002:a17:903:228b:b0:2c0:af09:f3d4 with SMTP id d9443c01a7336-2c0af09f567mr21537775ad.27.1780165719163;
        Sat, 30 May 2026 11:28:39 -0700 (PDT)
X-Received: by 2002:a17:903:228b:b0:2c0:af09:f3d4 with SMTP id d9443c01a7336-2c0af09f567mr21537565ad.27.1780165718591;
        Sat, 30 May 2026 11:28:38 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a27ee3sm56879635ad.36.2026.05.30.11.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:28:38 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Enable SPI on SA8255p Qualcomm platforms
Date: Sat, 30 May 2026 23:58:22 +0530
Message-Id: <20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEcsG2oC/0WMQQ6CMBBFr2K6dggdaQOuvIdxMdRBaqCtLRATw
 t0tunDzk5f891aROFpO4nxYReTFJutdBjwehOnJPRjsPbPAEnWpsAF21A4MKVjwDhLVqFSAWmr
 NRIjatCK7IXJn39/u9fbjNLdPNtMe2x9d9CNMfWT696VE2ZTyVBVSodaVBgkh0sLsiokGivbiU
 ypeMw3Gj2ORR2zbBzdenGvEAAAA
X-Change-ID: 20260529-enable-spi-on-sa8255p-8166eaa226cb
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nikunj Kela <quic_nkela@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165714; l=2558;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=17Yiv9qE2TbdWW2B+sfjsCoYrdlNtkiAjWBT3SqBDO4=;
 b=XXkD/QKdjaNZgz8iLvCtJTsxJBYT9ET5BKXWr9oUONBTDMdnrZOS24FOCTb0bfArZqET2uJUW
 Zzqz3CAS4WSB3fe9o6QA9MqDQcQYV4SEEoN7JLLNKSv9W54V941+xIG
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: bzDThCDAuvnbZ837Lpp21l1PrB84SUL5
X-Proofpoint-ORIG-GUID: bzDThCDAuvnbZ837Lpp21l1PrB84SUL5
X-Authority-Analysis: v=2.4 cv=bNIm5v+Z c=1 sm=1 tr=0 ts=6a1b2c58 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NeO65QaY_C3oiTlxhukA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfX7tjYpU0dVPqv
 rUOvWLkJg/dQ8UZKYdm8NzwLDWh0McprgPnMLplgh8crAzkMOPZeJLDBoixN+Oinvs2oEcyu3FL
 1gSArPehWt+hBO9vK3cqASLoHZuzPsQnaw5q5sXKKlpOyzCvnBn2pG4PCX9+p0LwGllmc6ejeJ+
 NoWyaS2zOgcuNOkOMiM0zr1gFuTDkmPAinLOwcDUv01pCWo8HptNmrhEt5DVS470IY3vcIugogB
 vixnLqCBKdKR7duRvpa2ecJkxagEcQDCC68WMjT22lPYO3pMjEXYtT1dtS9pi6SqE4XctNvmy2Y
 3quGl4lCgDGRN5IDEKgO60DpgLsnn5c1wP342xdyjqAQxmAhqUtvB0/VsI4E0DY7Zv3MYSa43eA
 sAWk6NvA/5yeOnb3NFIIbS/YypeKUYeTpCE6OZx9raDLSjdn/5F46I9NarKPcqhEYzGSj/TlngR
 7dRc66e+TJ3J2xNMbEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199

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
Changes in v2:
- Rebased patches on latest linux-next.
- Link to v1: https://lore.kernel.org/all/20260112190134.1526646-1-praveen.talari@oss.qualcomm.com/

To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Praveen Talari (4):
      spi: dt-bindings: describe SA8255p
      spi: qcom-geni: Use geni_se_resources_init() for resource initialization
      spi: qcom-geni: Use resources helper APIs in runtime PM functions
      spi: qcom-geni: Enable SPI on SA8255p Qualcomm platforms

 .../bindings/spi/qcom,sa8255p-geni-spi.yaml        | 63 ++++++++++++++++
 drivers/spi/spi-geni-qcom.c                        | 83 +++++++++-------------
 2 files changed, 97 insertions(+), 49 deletions(-)
---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260529-enable-spi-on-sa8255p-8166eaa226cb

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

