Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451EA376A00
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636371; cv=none; b=GqiH4bNJrzqwnDGsSJkBOIbfkcDgKSvCo/1i7SDSK4SukjDRJYA9zG14qLXj95o9if/ofqJPcKzamrB6tLnNUZ/BIdC6iuI12SAhrUCThh8BV3r8z2A3onx5iR5lw+FScgtLx2EBqNN9/NPObbGP4GvW6ZNjXFE2kEYvlCIO2TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636371; c=relaxed/simple;
	bh=9yrDQFz6S/dApLku7e1V3pd929AC/LTh1F9Ugye0SAM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cOBgcRWglB0NU78AMRpUNmfDk5N/rEPGmWN2mX+ksBWJfjVJ1xgi2kbh5ea+jRqnchzxSZD11L8pj2zct5UgUmIoN+zIYTWakxgRpVXgnvBiYcWPffziQOh1MCHpPaguXsuc8qEygnGNpnLCVspMh+ifDp0m62/E3bqiWrdA774=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkZfb5kz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvBFGY37; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkZfb5kz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UvBFGY37"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFUJdp3501012
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=umTJuUmAPbYe/JD/C94Hf3
	Ks8JAizEzqtdK0JZEUaOI=; b=TkZfb5kzYHFV4V8UUwq9DqG8gO2duRa38wq5hY
	2bcQRwlgk179tgz2+XTePmk3IrAd+ixkN4SXwHhw73ISn8ZcyjZxqX6RW0XBu9Px
	LHrsFYxagw3fh4UV9HWlznV0UNehU+gq3ZJzILf0bdBXD4xZYvggoaFwTk9C3BIG
	Q3AEvRUzAbDeb7uB5KwzpQIxlmOxC7h7NJ3IZ6vMNx/4mREXqJGRmBuqNtZ9b8eu
	Ts5iMJ4/ormBLjfvuN7ihnDvCA0uIG/rcONN5jQxTrF4gUdZvyxdmaYD3CR3l76E
	WGZxK/CgHp7gH1cd+FsHSi/Efmw+WX3cFMv1eMu/iOpbiA5g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18182gv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:52:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso2507080b3a.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786636366; x=1787241166; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=umTJuUmAPbYe/JD/C94Hf3Ks8JAizEzqtdK0JZEUaOI=;
        b=UvBFGY375c3qhX+shAqZhBVh6xOy6mfqNrsCCn2bIbuj6hnsPfHySk/LTiaxENKXvj
         LEp5HqOdRcYVzQx1ykZjPxA9S85tkXqNfFNI7fggQN6QeDMy3J8mGR/EH/lC72L+wUNR
         pP0pSSWv1zSU2XbQ1YgvnyZK72IgfKaKGEsfnEDcqGLnAzmJOprGWgHYGyHanBzFY0BO
         GHrIVeF/RToIicJyYw1eSh/XLKvgEYDWHN1V/KzqMmlc/LAB1vurOsQ3s0zja1FPeocD
         jueds3VNfG9HUZB8JEntIkQiWCGfcCTaPjS0nKtlMRw9e+rurZyly2p/dEUL1tw4sxX1
         QtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786636366; x=1787241166;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=umTJuUmAPbYe/JD/C94Hf3Ks8JAizEzqtdK0JZEUaOI=;
        b=pk4y3kLCp3u277EyOBKNWmbUCnFkXYnUEj4c8ySYRCBoXdi1gnwLkz1NDlgr7HRwq3
         5GDxKXfPK1hqQTSlKVv32A0UJiviwftC01n6vEQTY4busMIKOszZp7WqxaBXeF/q7UN0
         Rhnp38KUwISGzYno0K6RYi3TxvuicDuA+rCdkb/zJXkiLl8WZRBPJYqVgfeAqzGVtqNw
         ALi/MmqxMyaIECB/a68NrHHE042R1R8a6eJ0ChTdVCWNURw5jWSGOuoJRH1peQnom/Kh
         6jkhrUZ3wisNjPmEYbjA36qctzM5pT1nazgrLBpmbtod9yYYlzC41Ro8oq+nz4Bbsiub
         eTrw==
X-Forwarded-Encrypted: i=1; AHgh+RqzFL5NJ8RG10pYwFxQipdSIkrPc+vwQ+rJxTin446xLxhebSbcf2J07u2naTzulpwbKJAGzAk918vD@vger.kernel.org
X-Gm-Message-State: AOJu0YxSQhbi5inow9ndZsPw9Ber94NaB+ycKaxW9i+n6/9NE4xbYD4j
	D57d6gkwW231FX5JcZHmsLMXBkQ6igre8yNZ0hLE+wNnEzdnvj20vnq1l4zEdZlaKcgDyJj4BAr
	O6itDh1X6A2ZEjYKh0xWTxIkYDxzNP35P8TNnIwFvhGBKh7QRRxHl6yH4zQnva0iP
X-Gm-Gg: AR+sD123oYGXxsxrDPVmsOfoG8rqdpWn1yipSSjA9BCQr4PkEiVUT+KCUn7I1+Vkxlc
	2MZ0mo5OqP6lHgg6J8rE2YK1PPP+qfcWVW4UD9W3lYhH/Xjs18du3PygI1JwTMXwkd96F9k/FFD
	VCmvkl7crZuoLSJcJ0AeOSMv3CAx/ocS/951RNLWef+rMF3bXPItUJ+9mNHRsSya5+vGsWATMTc
	ggg4BQT/h+sgon7Nq8hFL6q+v9PXOlpOlomYV0uiZMMmst4+bJ6+SFyqoZKX+UryjAMAFQBdih6
	qp2Wy7af00O/3D4eCyFW6QfcMQf2pvTDx2M9/6b5qrf1sAZ+ZydahnQ8EE2/HYKmu24JpswcLmn
	adABXeoznLZ+QKX08DLDiabegJXymQ6UWaoqB
X-Received: by 2002:a05:6a00:391f:b0:847:7010:f3e4 with SMTP id d2e1a72fcca58-84fc7529e73mr6928344b3a.25.1786636365955;
        Thu, 13 Aug 2026 08:52:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:391f:b0:847:7010:f3e4 with SMTP id d2e1a72fcca58-84fc7529e73mr6928288b3a.25.1786636365500;
        Thu, 13 Aug 2026 08:52:45 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc45627cdsm1156401b3a.5.2026.08.13.08.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:52:44 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add Qualcomm I2C target controller driver
Date: Thu, 13 Aug 2026 21:22:31 +0530
Message-Id: <20260813-i2c-qcom-slave-v3-0-1d3742e2ad47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEDofWoC/3XN0Q6CIBQG4FdxXIeDYyJ21Xu0LpAgaSoJymrOd
 w/soovq5mz/9p/vX5BXziiPDtmCnArGGzvEUOwyJFsxXBU2l5gREGCEAccGJB6l7bHvRFBYFhy
 03ivOaori090pbR4beDq/s5+bm5JTUlKjNX6y7rktBpp6f/FAMcG8IaKUhOpas6P1Ph9n0cVOn
 8eD0kaAj8IJfCkQFahYWVDKtajKH8q6ri+Be9+ECwEAAA==
X-Change-ID: 20260628-i2c-qcom-slave-c382ff4e8691
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786636361; l=3530;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=9yrDQFz6S/dApLku7e1V3pd929AC/LTh1F9Ugye0SAM=;
 b=7HeauKWU7MVLSJYXdFWRQEkAnJuagqocPk2j7FEWNID65tigjKRLSLV7AD+6h3qFN9shpbqBJ
 ZIyR22MIE8XB2LXpQU7xtztQ2aAyXH94bpz4x97Z8hPcPpjYmYgqnsE
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExNCBTYWx0ZWRfXxYj7YzenQ8Hn
 IhAHnxdlpYUVndTlWIXa/DsoSa1uhzEleSO/1SQUms643AiyZl9gkdwdMQy7Rg+4w2sL3Ov0nBD
 KuZwvbgJtObqlIemrHYyOFXBe1OZYSw=
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a7de84f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=iqZF6DzoM42cW1rsEecA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: hY_L_I3i7zN--ghBvNPqHjHQxLC_SGOE
X-Proofpoint-ORIG-GUID: hY_L_I3i7zN--ghBvNPqHjHQxLC_SGOE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExNCBTYWx0ZWRfXw4HObSS+cVDa
 qqJ4Q1OYCWjn1gX58lfPvts/GSwCY55IKQatfty5jn7T3G1bIMxqhLKtOBYPMZnufucsmj+grdT
 eW7jVQWUED6GuP0RuBSlHFHxYMByv1VwJt/i+Azidb8sWU5HRggplI0Dm5NkECN4RBmYyw2Fk/X
 EbX5kDLevb/bgHqzcYfQPkOf946TVkDsyvwq6UaJRKdwsQZNgysIEWX2GZx/IEQkothXqxP99LS
 k5cjU08cqz3BVvgE4rYBPh+gUk86WTdudMbs5ZTWhjPSowbDZ7fvL6MQGFRCt1qeqWVADDa1T7c
 JkI7LLyvyj9hWGF/9zCdAVyh/6xpZI1v1vrK4temfs8JI7g04Kf/3KzIftgQMPjb4vFy4YzGf2+
 W9OSffGLu+1I3s9Gp68PmOKed85/etqeJvX0u5rGY8xG4cRhjtLsQ76zbhdLnYuv/8ABx5IMN4R
 o6d81ILpNpiRXU7mM0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130114

QDU1000 and related Qualcomm SoCs include a dedicated I2C target
controller that operates exclusively in target mode and is not supported
by the existing Qualcomm I2C master controller drivers (GENI, QUP).

This series adds DT binding and driver support for this IP. The driver
uses the standard Linux I2C slave framework (reg_target/unreg_target,
i2c_slave_event) so any slave backend (e.g. slave-24c02) can be
attached via i2c_slave_register().

The series is structured as follows:

  Patch 1: DT binding document
  Patch 2: Driver implementation including Kconfig, Makefile and
           MAINTAINERS entries

The driver has been tested on QDU1000 hardware.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Changes in v3:
- Rename file to match compatible (qcom,qdu1000-i2c-target.yaml)
- Remove interconnect-names property
- Remove allOf reference to i2c-controller.yaml
- Remove #address-cells and #size-cells from example
- Add minItems: 1 to pinctrl-names
- Move I2C_S_CORE_EN out of hw_init; enable core only in reg_slave
  and hw_reset
- Add usleep_range(10, 20) after SW_RESET before reconfiguring hardware 
- Fix RESTART_DETECTED dispatch order; handle before STRCH_RD and
  Rx data phases
- Use test_and_set_bit in write_requested and handle_strch_rd
- Loop drain_rx_fifo until FIFO is empty to close post-STOP data race
- Disable core before clearing slave pointer in unreg_slave
- Clear target->status on resume
- Switch from devm_clk_get_enabled to devm_clk_get with manual
  clk_prepare_enable
- Remove unbalanced disable_irq from remove
- Update struct kdoc to note I2C_LOCK_ROOT_ADAPTER serialises
  reg/unreg_target
- Link to v2: https://patch.msgid.link/20260802-i2c-qcom-slave-v2-0-27653118fa75@oss.qualcomm.com

Changes in v2:
- Rename driver and binding from "slave" to "target" terminology
- Use SoC-specific compatible string (qcom,qdu1000-i2c-target) instead of
  generic qcom,i2c-slave; add allOf/$ref to i2c-controller.yaml
- Replace SMBus layer (smbus_xfer, I2C_FUNC_SMBUS_*) with native Linux I2C
  slave framework (reg_target/unreg_target, I2C_SLAVE_* events)
- Remove qcom,slave-addr DT property; slave address taken from the
  registered i2c_client at reg_target() time
- Remove staging buffers and spinlock; bytes delivered directly to backend
  via i2c_slave_event() per STRCH_RD/RX/STOP event
- Use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS; PM core quiesces IRQs at noirq stage,
  removing need for manual disable_irq/enable_irq in suspend
- Simplify clock-names (xo/ahb) and interconnect-names (i2c)
- Replace icc_enable/icc_disable with icc_set_bw() vote/unvote
- Merge MAINTAINERS entry into the dt-bindings patch
- Link to v1: https://patch.msgid.link/20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com

---
Viken Dadhaniya (2):
      dt-bindings: i2c: Add Qualcomm I2C target controller
      i2c: qcom-target: Add driver for Qualcomm I2C target controller

 .../bindings/i2c/qcom,qdu1000-i2c-target.yaml      |  75 +++
 MAINTAINERS                                        |   9 +
 drivers/i2c/busses/Kconfig                         |  15 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-qcom-target.c               | 588 +++++++++++++++++++++
 5 files changed, 688 insertions(+)
---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260628-i2c-qcom-slave-c382ff4e8691

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

