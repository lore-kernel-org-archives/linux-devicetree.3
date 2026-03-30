Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6539423FC41
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774903160; cv=none; b=FQGKbxCxVhdtf5BPQfmxiuSm99OJYWUvNscDoak5gzP+lg0DREDpn+0gcVhS3wfEJ9WB+oMtRNy2G73DgCnAlMkDrFU8UJv3MQzK8XX8q7APSG8rkNKu//bdXpERvgI9d2OUJLaqCXsnWZq0FUtmGhutavWG8Ucac3818s/kK6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774903160; c=relaxed/simple;
	bh=RBM74awl7F+jck5gUr4QiFYYj0CQwMI2sS4425BBhGg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pjEDWsfW1k66IgMwHBkJqLX+H7wKp0M/60AYt9J+d1eSlZaoT1LFaZlItYmXe1Ntkti2gxLyj0cZtHnJSPkTxEjBAxjma7Odc1xDYaiXRnQW4rFfY/AzyCJt3ke345A1SPwRk+qZhK/Gfz8Z2R6BSq4LtMajvYU0zZlICN/cTcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fv7oSYJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsbK9+Sf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fv7oSYJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsbK9+Sf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UEOK6h1557457
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j38a35G67aNiYuFO4syzf5
	Rj5+1OXxDU3StCqGCqLKI=; b=Fv7oSYJ81D81LYlOITs3d988zFkREgiMaolNIg
	RtMbK88VUw2xvp6RmZOMV7zF/mQQA7ibIqXm1XDQW4GhzTlWAw+A4DfXayW4mpIK
	QtRZX4kUvAB6VYbuq0q7OE6p0/OhQCG3XfMXqAcBBmZgIp2oWSsEaMh4hnqtgQAb
	iJ+aB+Rk7BPB8W65WnNonttNwjQikbQt6bdhJnxxWntqbrzCG/4nttziYVpcxdRM
	EwGYIwE1gdj+R2kZlEDPsqastipx91/NxTP4mK5IeHQXoTyMPrPZABdta//eMUB0
	dc2iOZucHmYaFMcbBAW1qC4G20JrXC2rDNd81exNsQ9iau4Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7twm1e2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:39:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0f4e632caso46495885ad.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774903156; x=1775507956; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j38a35G67aNiYuFO4syzf5Rj5+1OXxDU3StCqGCqLKI=;
        b=BsbK9+Sfzs9B8a5kZg3jT4g+8EOM4AkRtL51PPgSTlAutU+xRhEWgYlfubYo5S7MrL
         lP6tS3gNCwyTmN+hCHBC2DWg56BSdxG/si0NQZp05QA5JKmMikA3nSs4OYE05rFi1a58
         R/wMUi36/ch3LzZRs2MVRMVSW51CFGNhgwlWoCCUi8NrZpP5p/PTGi1+sj92NsqEnYRH
         pbsvYYWgh4bG+dcbqJsi5UawTUKeCxyT4TK/MlZ5Xu1aNVbmDHMNRqZPHN/Ek1W5MS4h
         pk5+OxgNgTo/wVt18Y/oM5rJKgR61zXP0PIXE9Sln9O12QSLeqZ41kJLeI90Uqqe6uRL
         D4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774903156; x=1775507956;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j38a35G67aNiYuFO4syzf5Rj5+1OXxDU3StCqGCqLKI=;
        b=fsJVss8IInDR0jBwpBsX7lIFnpaTDOUQH+o0iX3cBk92LnQoK+Ita5/EBxe2d/BFLe
         5viDT6VmJ4CRX9zd1E8rRFqWsPw+7Qtg5TecJuaoPaojUT0befGlsU6NaKC0q0oBncJ6
         0VBTqFnWji1upAZby51lbUHKNTEczLNncvKS0lusnAFdkl7wbIU1h6prdesjjo4yqMxk
         S81iMMASEh61EY3I/vYwTaeAYHabokPLGrS7RjDBB6ylAB+dFuU+EFCMUjQ6e851/PvQ
         rv3CBVqqcQJ3Pg97o605Wp0k1GUHtiUvZpW7PTvztHwIFasSy2gt0WZfr17rQy8ku5D3
         E+AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOdzIe52kMadsHXwWXuWI0LrC6CuAxnfGzvcMM5a7iHHe712wfLoRYAkdr5DYvU40jvMPD6Nzq7DB9@vger.kernel.org
X-Gm-Message-State: AOJu0YygXG/fwRmFPB3Br59EZbsmzyL86JxfmJINH7yYiKLGNK4qjyKM
	vjNLLXtr+2I5Hq6jAuimxCa/S7QaABu//1+B9oWibO/yr7TXIGbwtLo28pzxnaX4pzWOHc/bwTk
	6LZkrGu3saiPsGk8cARfPr3jC/Qkmang6SmeN589S/3bHa2E4BRxOcYOAkoRWTkNG
X-Gm-Gg: ATEYQzxRCpitJlAxyNhXdBAD3+iV7w1+Jcy4G2DNazi89a/r78QIwCfwDrHY2h0O5Wx
	7+PspkbhXMecnMgvZApY75hR77++X9OUgX/QP4gQ0K9L5j/9JZ7/BBiklO/uxMDJBqReC09W4F9
	ksyZcqDpODOznHRzvr/zi5rMDltWzlLtxq5b3MqGCC7dl7yCKLvY1s2o4v/OxIybCZVnb2TOBbd
	b37Ittl3sVQwG+/sNyVrYN+8gNa3jNbS4j62zMnu5RTRZtR4FDK1PeoXok2w5F+zBgzKqNnr0N/
	LKz/MEoFNMQLQWzZ9Oboa7TCDFQqc/IHQ2FYUgnpAbknMQGiTNeh2IN3wob8qZX8ek/rZbChOVv
	ZaLTKFsjod2TCweVPihg7kMPmiIBLndfG371evdszpvCQR1l2kX5deBuv+p4pMJR6PXtyn0++AB
	pyPHBlvalc7xzknKkCNVnGUeAX2wr3Dv5SMsm0a/U=
X-Received: by 2002:a17:903:240c:b0:2b0:bed1:46f7 with SMTP id d9443c01a7336-2b0cdcba093mr134968795ad.37.1774903156253;
        Mon, 30 Mar 2026 13:39:16 -0700 (PDT)
X-Received: by 2002:a17:903:240c:b0:2b0:bed1:46f7 with SMTP id d9443c01a7336-2b0cdcba093mr134968535ad.37.1774903155765;
        Mon, 30 Mar 2026 13:39:15 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c3a4esm113517195ad.78.2026.03.30.13.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:39:15 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Subject: [PATCH ath-next v3 0/6] wifi: ath12k: Enable IPQ5424 AHB WiFi
 device
Date: Tue, 31 Mar 2026 02:09:05 +0530
Message-Id: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGnfymkC/yWMQQ6CMBREr0Jm7U+grTV6FcOitF/5mlRsqyEh3
 J2Ky5eZ9xZkTsIZl2ZB4q9kecUK+tDAjy7emSRUhmqVbbXuyJWxU0+S6X00ypAPYbDaGevOJ1R
 pSnyTeQ9eUb8UeS7o/0v+DA/25dfDum5aiqeUfAAAAA==
X-Change-ID: 20260331-ath12k-ipq5424-cddb63a46a97
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=IJoPywvG c=1 sm=1 tr=0 ts=69cadf75 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=gShIAut8tMQcv_q5NMcA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: nwIoZCb0j2Jlu27QqoZZBu8F3aVrwwUl
X-Proofpoint-ORIG-GUID: nwIoZCb0j2Jlu27QqoZZBu8F3aVrwwUl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3NCBTYWx0ZWRfXw8VIeNNXT4Qt
 I5Zg7g/lqiT9GFUUzocnDnVAcU9EpJPyaJMBAGyJyuwuQH9ggJlBn6x+Y9WWj4aiZ56jsD86/v7
 Mkq1jIpcAGfoqNZQcgLcpQH1YQMLr2gU7CR7Zpktv0MQFqPvIKyKt6Pb6Xa3jQMx5s8cr6i5+lO
 IOfw4a9n5wxZvZPtFemj472vFrKznpfmG7ershGZ5/4iHSxyD8DCnRJ0Qwww4yYeOKSdEFHgEFs
 2dAbN/TnJ8Pci1SwHGRDhWvvvuV6Vs4DNv8hts7zpMfhS7RTszba4NOH1/xx6ajmDYSMaWVaVcJ
 /lGvI1kDzAd/9n17f6WuTFyd30HyUsENP9eE70TndwnJc95PgA77v596xI9WoG1Lrx/cXr2VElN
 Jpb6BWudJphfU69I1DmIRxNhW0HiI4UwARSykrzprhzEx7g+EhhyHdCcmaYJgW/BCnChhvSvUe7
 R0T8Y27dUa9RnVdhhYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300174

Add support for the new ath12k AHB device IPQ5424, as currently, Ath12k
AHB only supports IPQ5332 WiFi devices.

The IPQ5424 is an IEEE 802.11be 2 GHz WiFi device, supporting 4x4
configurations. To enable the IPQ5424 device:
- Add the necessary hardware parameters for IPQ5424.
- Modify the boot-up sequence for ath12k AHB to accommodate the
  requirements of the IPQ5424 device.

---
Changes in v3:
- DT binding: updated copyright.
- DT binding: Dropped Acked-by tag as copyright is updated.
- Rebased on latest ToT.
- Dropped ath12k_ahb_ops because qcom_mdt_load() and
  qcom_mdt_load_no_init() now have different number of arguments.
- Link to v2: https://lore.kernel.org/all/20250518-ath12k-ipq5424-v2-0-ef81b833dc97@quicinc.com/

Changes in v2:
- DT binding: Removed the redundant example for IPQ5424, as it is similar
  to IPQ5332.
- Added driver probe data structure to eliminate the redundant switch-case
  logic in the ath12k_ahb_probe() function.
- Validation completed, hence changed from RFC to PATCH.
- Link to v1: https://lore.kernel.org/all/20250130051838.1924079-1-quic_rajkbhag@quicinc.com/

Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>

---
Raj Kumar Bhagat (2):
      dt-bindings: net: wireless: add ath12k wifi device IPQ5424
      wifi: ath12k: add ath12k_hw_version_map entry for IPQ5424

Saravanakumar Duraisamy (3):
      wifi: ath12k: Add ath12k_hw_params for IPQ5424
      wifi: ath12k: add ath12k_hw_regs for IPQ5424
      wifi: ath12k: Add CE remap hardware parameters for IPQ5424

Sowmiya Sree Elavalagan (1):
      wifi: ath12k: Enable IPQ5424 WiFi device support

 .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  3 +-
 drivers/net/wireless/ath/ath12k/ahb.c              | 36 +++++----
 drivers/net/wireless/ath/ath12k/ahb.h              |  1 +
 drivers/net/wireless/ath/ath12k/ce.h               | 13 ++-
 drivers/net/wireless/ath/ath12k/core.h             |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  8 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  7 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  3 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 88 ++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 93 +++++++++++++++++++++-
 11 files changed, 232 insertions(+), 22 deletions(-)
---
base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
change-id: 20260331-ath12k-ipq5424-cddb63a46a97

