Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929533C5837
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748496; cv=none; b=lanpxNDQAavmJ1wpMc1EEe7p1dvMrhO2RteneeCyDY02JavaeaIQZA7gJ1d+YYdkM/hQBVQuuQVMBS84cPXYhTPT0IMSOVF3/oj63drACv0XCwzDQ2Q6izA2TO35huabAXTrzNC/8YnkfXO4uzZVCwuNuPTqkyHIUloVKk0ccMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748496; c=relaxed/simple;
	bh=7kCN30YZaTtO+/kcSW8ZEQJtgK2koS6+mFzf3lGmhPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i7t8euD1B1ZpVP8NxVOoTFaKa6MNZFE2YYxtp3J9VLHzmjDZr4iMhKHWFtoranz6bDbxgxrD0Algmno6XA9h7z/ZhItdJCeaJFLh07ZpWBBNhn76aQM2SEooNF4uMYOk4saKEAH5vGeRLSBfBWgXNYqs1+z5moCzUR6OX4IA6Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JkVQdu+r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d9oqdlmN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkVQdu+r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d9oqdlmN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6737GmY43959939
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3jlF7a25JOXLzSC029jPZdxCM48HKf6MZPs
	BhRls358=; b=JkVQdu+rTWbuSiteCnQhY2oBwzGX93WnUuaHpfz6B4P1ENZlvZj
	2ipnlRVaLzncqNmfYH6693TDhz8CIvAxd7kHV0dyxTP1ckCX0tizDkg0OxjfGF4l
	MXtqbMT9w8lJS+SD8UlMqRXzHY0CpsHD5icZEKxzhfQrDCw3t1Aod3EEfTRFE6un
	UNgZsNA6q/DjC+KgfBkuc/r4Acis1XpW5WH3Qf+beUuFozH1DXsMbSs7J7YrF21H
	5WTqn8Jup+nCElR+gCf9V8Hbsop7WXK2Rp+WL9eAQYrk1VdRt43qnJ+/39AycWAT
	C/u2erVPXmcAmiS3p0br379hapiNT3J0xxQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fajdhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:14:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so4110046a12.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785748492; x=1786353292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3jlF7a25JOXLzSC029jPZdxCM48HKf6MZPsBhRls358=;
        b=d9oqdlmNBjW6EJiPvjjIC73WudsRHPYAO+xp0Dj6pYK5SajNfwGM9S9opBPfYCXtb+
         KFQBJJe9X6ngDSfnY9PodFSkNgMs6Iu1JumiEsvWEX3zAjb84aKM0KNUqfIQ7YIIMKJB
         ckwR9vk9emBzhY8cALsAW2Li+YpLTZGJGfkYaNcAcUhWBBzAn4Ez0ahMv2e2WJeFjJRk
         mmF10w7PrlneDU+p0uTYTtfSeGtWs1UuRxa/M5Aety+Tnk+gmcKn9XrN46cmtEiBSE8v
         NcIqFTUtqiWxEKocQmiV5oZRosyGYarImVE0xJqA/mqXWUt9L6ygmwepZ9Tknh4PbBM0
         Nppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748492; x=1786353292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jlF7a25JOXLzSC029jPZdxCM48HKf6MZPsBhRls358=;
        b=rEBh06MiLRhm4GR9Rr8BIxDnyIZYM32O3gbimM5+/rWhVutnhby2s66+bsSMqhXLPx
         N0NSMHQArD8xYnvYzXsNAXU5OqY80RKwLv8GSnM0eaE7rU7kGFRYdYMs1MKtEzZIDkBL
         VHxoPXySGJaHXlAeu91OoOQJj3u24Sz8h7lbmfiBQCEtve/n8ir0WxHroCBBQi8wMxS9
         dGjVDVin7f3C5alZg6Sp/14d5c96BGBVXAb25MORhRWBEfgv1uwxQwxC73QUZcBTfvnZ
         OkXD8PjyOPuasWdAMzFWYp7b8UaumY7vl9/hMb83co3ZFP7Q8S6BrBPYkgybRM9Brtqp
         NopQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEZzjyTr9CfkWJVzj1Gtq91wfYA3cKo1m2JL4531CkjKfOkD0C8vm5cXoXggDNLH8l7dE54EpiYNPX@vger.kernel.org
X-Gm-Message-State: AOJu0YwbFbiTWDYp+RUZzb5r96r0mAFoDL514hdQilY8kjY3isvlRzca
	1Alb7GX5+9g4krUDnTsOFlaDGLO8TXvMuEp64ZQQn6ZSYIg94Y0i/2GQ0f79r1HptoiqSHj7qkH
	vD3yMRAdvs+zUzq1Fs1HY2ETZmJT3YZmF0hptmScJwMPwNVEL2XC8q9ixPNzazkY/V+sTcya9
X-Gm-Gg: AR+sD11cTDIly+d5ncyhn8dwZpuXRUhVN4FAc9wur9vviH5ZAPw/xJjRGk25ZAdMsyr
	pArZzwRn0LcCjHkEpeTTxGCZXMCfk2uY08KOMu6Z2TjgV0M6GJ9ZpPK8xgMe2GmXWArezWsJR8R
	EXTIzuutiJdgtFC+JGf9yJTIq6eMGn7Zd8BTQs4P9KpadHTRuLTLuU2akxKInen1q1q4T3m6ria
	CrtyKtCC6y0nkvP6nH54PFwJ7GRC3/7wXsXkpQNx/0zf6JXJ4kx46C8BCNK30ts17eIveAeE94M
	aFsl1GvR2ETM1OdHvi1q0zOV6vGJUNsS56+4jbOFCkv9w3rQ9HBvmB6eiuQ5oQHstbFE8q75oFh
	/SvFfyl/9V5EuB7dCrVRLcVR4+u0=
X-Received: by 2002:a05:6a00:ad1:b0:848:2f2c:b2c8 with SMTP id d2e1a72fcca58-84ee4821879mr8717663b3a.24.1785748491841;
        Mon, 03 Aug 2026 02:14:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad1:b0:848:2f2c:b2c8 with SMTP id d2e1a72fcca58-84ee4821879mr8717633b3a.24.1785748491248;
        Mon, 03 Aug 2026 02:14:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe572d1sm3516376b3a.18.2026.08.03.02.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:14:49 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 0/4] phy: qcom: Introduce USB support for Hawi
Date: Mon,  3 Aug 2026 14:44:37 +0530
Message-ID: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a705c0c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=y5t-mIDxVrGwD0Vs-1YA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: YsQFkjYRKQu4K0Wp5shwzSaSzrdrYJ34
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX1kq18RVaqxLj
 YXrxVeb3hdEcmF1+KDnHdvCJuxo67SDGukt1Avvn4FETVNTZZuTj77aQukaKoiI3fwyEeV1fc+d
 WQ3ymYw+4j8vkCizaQb2wU4qdwLRwGw=
X-Proofpoint-ORIG-GUID: YsQFkjYRKQu4K0Wp5shwzSaSzrdrYJ34
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX+SdzD7rEOSIp
 mnw2bWx3O2HyAxkNFREhXjjTFWzOHUeHW/hE5pkJda3Bc5g/whvvGm5NEtrKy6zk7LohS68HvVV
 t3Ik/Jz7phEwOeyovjHP4sscEHlB76MMqaBY21O33S+TocihRCBsBQQ+/mHz6SMVxuJOUBVk5k6
 TDEmX/0V1Jpl3mfGfSO5UQNunsHO2Zyb5k6qqMzw/G6QLC6Ba+CeB2n2Rvz8qAHdgCgMUM76sUW
 50THI2VKYnX71C8gruepFAiJmCq9IPvkAJG/QGGkA9/v6rIIUPgt/RXE4f4V5OzTXc09xbOYDJB
 FBre5/NyPN4sMZBtwRd5zKrn9KHOlNippRHuMevjL+ykXDE6UmlS4N+BXCXW0mdnLt68ZjAOqfx
 DxCfy109jxjGXv+3nZ8oVUlUyOg99Nud/rwzKN5DwKiD4Hn24S+039SqIadnL/P/RMTcw3uY8Gs
 L3lcuEwGSy8uiVTQX+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030081

This series adds USB PHY support for the Hawi SoC. It documents the
QMP USB3-DP combo PHY and M31 eUSB2 PHY bindings, adds the Hawi
compatible to the DWC3 USB binding, and adds the PHY initialization
sequences to the qmp-combo driver.

---
Changes in v4:
 - Rebased on top of next-20260731
 - Resolved conflict related to recent merged common phy headers
    from pcie.
 - Link to v3: https://lore.kernel.org/lkml/20260508213234.4643-1-ronak.raheja@oss.qualcomm.com/

Changes in v3:
- Fix missing version tag in individual patch subjects
- Link to v2: https://lore.kernel.org/all/20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com

Changes in v2:
- Clarify in the QMP PHY binding commit message why Hawi needs a
  dedicated compatible string vs previous targets
- Remove stray blank line in hawi_usb3_rx_tbl
- Link to v1: https://lore.kernel.org/all/20260425070002.348733-1-ronak.raheja@oss.qualcomm.com/


Ronak Raheja (4):
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
  dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
  dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
  phy: qualcomm: qmp-combo: Add support for Hawi SoC

 .../bindings/phy/qcom,m31-eusb2-phy.yaml      |   1 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |   2 +
 .../bindings/usb/qcom,snps-dwc3.yaml          |   3 +
 .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 231 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  16 +-
 .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   | 116 ++++++---
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  98 ++++++--
 11 files changed, 459 insertions(+), 70 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h

-- 
2.53.0

