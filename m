Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FB626CE32
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 16:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791218762; cv=none; b=KTBuNGDJGo0JSXZnHXxY81/XUtGhBwJ6F8Ug0HkPhN2/ShORxk9R/wrawEMTmB5guQwGzz5Va0/LhytbdvBWcSATimJx1HnU3ekKrhR8Bgzak6HccKMKysStMnbRPSOUXtbF4OLHvW+PEQF/SqxfbLqxarpvHRuoIfwbeitdFco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791218762; c=relaxed/simple;
	bh=Qdttc+Uull2B6NlHs+W5t+MNibElOhjui4YrHJLoqA8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fKsq9uDLJ7NUOzwWFzEN3JeQhQrv6JXo/JZhWJpSAxqMWeC80RuGYYSQSBcDDWGNZvNJt0sb4I/sD/BfelLauLYP0fKjGxFWyGXVaX1pAMN+TxsmRG5Exa7QttWNJK0Qk7Msz/pvkuJbJjgfg0D0FKS+/lqDZlV2Xc1QiJkmicg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXCeWGWU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cHbtUGrQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXCeWGWU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cHbtUGrQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EPHEJ3141754
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 16:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=06UdcohYwj/NS7PUtyFuZZ
	u3m1KXSF55e9gfl1wyMec=; b=SXCeWGWUE6r4bD1/qw07uFOmXfQtmhA58cnlBG
	MXWOhCa5Ax9xh5GXi+JUqSC6kuBa4GotSB6b1c/KRkTj67ZCYx8R00Rp7HsbUUEJ
	Zfrey4sIfR9Ad49jz7bw1B4qNoI3oWiWY0fUHSca1iT52dt48VgqYyXKaT5QiN8N
	KWMkPtxMHbs0CK2OHHHANbfCUxj1cR3a9lIhOx+GkLeWrTGoEEgMD221OpIkZ/wV
	sQhFN5hYR6bAzKAR/ZbvVjahbF83SA6gsMwkgdDjrfaYxnZlbFN6lB2lgWZUr4JI
	eHgbzFgh71S/X4Z4awdMNHLiEmp8u85KvKXEyJQwZ2NfeIBg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49u41h2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 16:45:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f75c1219so28816495ad.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 09:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791218758; x=1791823558; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=06UdcohYwj/NS7PUtyFuZZu3m1KXSF55e9gfl1wyMec=;
        b=cHbtUGrQjGU3B7D+9a9tAQSIqCK7ICx8WjIelf/0oz7VREtCfziUmqUinBrTkoekxB
         UVd5z0AxQ+uc+ZceQLcotKNEuD4rODIYuljZs0BgiaRt+we4fUzENWERACBNB0Ar+f46
         WDCyU00DiwxEDgY4yY3Vz5hKqyMmqPpcu+B9QhTMclqeCDWIgPUt1fw0cn46x7gkkITN
         fljg//1FSp7EOBK9Xf5ZHC2GcLzuZUyFZfHa0ErIHyex7myisusQ8Qnrk3DmZQamiuzY
         dTxiTw195bs4qs7UWKM1Zn+6CzSiCsVTKFRaC6TKS5qwqmbs1h6uAgPJRy7fnTOYzNXF
         DEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791218758; x=1791823558;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=06UdcohYwj/NS7PUtyFuZZu3m1KXSF55e9gfl1wyMec=;
        b=rItSANAWYRzRi4+hZJmMYEda5nWuuW4RRFkrBukgw9I7mFB3CyVDNMY0w2xeNzbw+a
         asUjfcmlKgC3n60jw2UvAHNw4+i8CgeZzolHU6NdvefTzkMPpPBpmXYvTrN26EDpOTN6
         j97Illpxi+LiTx0y04uK8DkJy6+eNQZpoph83wFQrn/fnX1n3kwxuFf0G5x9EAp+ChVo
         vhs3vZxwDCVrD6voWt1GN0sCZXmraN1a4iPE4+XTs8kWpmmo+qB8rqN29rN1Fu/r6a26
         +TROSzfpwXmXJ4AZLMOnT6EgT4GN9ADuK/adnyfOe5q1X2QUQKtu6ssUZ6QPoF7prlHI
         FGPw==
X-Forwarded-Encrypted: i=1; AKwUvByH0ODLfB2Gqx8OIQCMPkHnKz9gpDQnLwj7mJ22HxQdX8P8l8dFAQLVLU7cDaE6iBHJiDGlep8P3Ghr@vger.kernel.org
X-Gm-Message-State: AFq9FYIzBCBfl2VOypxOUl/4tZQQHfAYeLhX9rRFaTQv6b/CxW2eNU9T
	xi2j1JEPnpHlmOXekx+67awyJiN9ZTc2wTuqFZqhXVO1mRGhSVf6GXbEMuyMKhSEI8idrZ5Cfy2
	LXZi4XGNHuRvJV9Yfa3h4L9+hheKxescOWj2T5YQW7Uvw8dBZf5RVZFFmqGUzrclY
X-Gm-Gg: AYBFou1b9C4YomI9+RenuEBGnHGWUctRBUsl9b/4c613jCYhP7sC0iPiAOxEnG4YXk6
	jIXk6Kz6UK/MJZykVZAicjjNYE7W7fV6awtog3WflpbY1/N0Hzk+ab8vsgmj9Kvrq97NMjcJdGl
	56JZVxqxxflxi7qt545jR374DY1t2AqsLaUla0BvPaAVL5OLcdVe95mSpmDDLgPWPl8l469vwcl
	CSOcAVLr8Xw4Xp+Tkxph/ZLJbdf+Ni17a2irrZEvXQO6yQSXkjPXkDON+8MB5lqmQZBi2hVL8xi
	MNXhmtb6VivfZJzaLb8HikGpW+0d39ZNykC7Su1+T3MRrSs0KsUEeHyDVzR3aWrE0nTSNXW5RaE
	uzb3sZbKXXYN+X5JgTX7NhuZacqjb+dLyt5A=
X-Received: by 2002:a17:902:a701:b0:2dd:c100:313e with SMTP id d9443c01a7336-2e510684ff0mr53210275ad.58.1791218758114;
        Mon, 05 Oct 2026 09:45:58 -0700 (PDT)
X-Received: by 2002:a17:902:a701:b0:2dd:c100:313e with SMTP id d9443c01a7336-2e510684ff0mr53209965ad.58.1791218757430;
        Mon, 05 Oct 2026 09:45:57 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a55b6161sm10665605ad.1.2026.10.05.09.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 09:45:57 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v5 0/2] Add Qualcomm I2C target controller driver
Date: Mon, 05 Oct 2026 22:15:43 +0530
Message-Id: <20261005-i2c-qcom-slave-v5-0-6254cc7c08d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADfUw2oC/3XNQW7DIBAF0KtErEs0M2DAXfUeVRYYDw1VEjcmQ
 aki3704XaSS681IX/rz/l1kHhNn8bq5i5FLymk41dC8bETY+9MHy9TXLAjIgCEnEwV5DsNR5oM
 vLINyFKNmZ1oU9elr5JhuD/B995vztfvkcJmVubFP+TKM34/FgnNvFS8oQboOfBMAYxvN25Dz9
 nz1h9o5busR80ahp+KAFgpVhaxpFKKL3jYrivqjoFooqirYK6uJyffarij6qbQEC0VXJVpGIIi
 q6/Q/yjRNP13t4iyXAQAA
X-Change-ID: 20260628-i2c-qcom-slave-c382ff4e8691
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791218753; l=5289;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Qdttc+Uull2B6NlHs+W5t+MNibElOhjui4YrHJLoqA8=;
 b=hnjQMLMOM8wUBifhNFQMQno+41Ug05NC6OVqt6iZ/cVDdgpR/VXgdGZEMKj4kPtoP29wohG89
 ah/KOby22FbDcgCN0Wn3DTT+pI8KH4pmkeW8yI8Lqz92CReHLIlBSHD
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-ORIG-GUID: 1IOQDRzmH2rLJ5rEvfiQLgZE2xbF56bf
X-Proofpoint-GUID: 1IOQDRzmH2rLJ5rEvfiQLgZE2xbF56bf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2NSBTYWx0ZWRfX5zNH5KCF77ng
 Vt7dCFPWFzRRBe0n5bJYCgl1ijAbwcFCaMKaUPU2IQgU7y5k0cySnj922m52OeOdz9z1lNnRAfI
 i6ZnVpTeI4VR8Ejc59erGZwyf7jj58U=
X-Authority-Analysis: v=2.4 cv=LuEHWXdc c=1 sm=1 tr=0 ts=6ac3d446 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=oWxMlBoAAk1XZI7vwbsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2NSBTYWx0ZWRfX97FyvWkynHMB
 Upmot1gG7Up52SjPrN3FjxiMT2UvbbGS/MeA/W1qfpgF7UpdgJ1hUHB/sydhLTp9nGuenv0AY8+
 joXCnF2AWxyZHHaPmZIAD2MbHJyDw2SnVMQ4QKNvdrJUHoyUAvw9MOIz4rbzrQBEn2ufr7KtUmo
 TYt29ZAWxM5N4ULvMb0akKuFIB3ybQXWQJ6ShxKxPnUnynUVZliM1klSChJYfPeOuRenNWjntJP
 Tg6T+ZEJffKNh32PuXW2iHFe8vmpxDuD4jkQt9ppztFyh+Fw03r2k7XLC+vCcNtPT0yKdV35r04
 wW5veHQvXxkAMDl55YZlaSPOpzgKdVF1LZqthaVhq2ObDFyJgXb47b/g0Pc2uK3ygz4zXjc9Jt2
 Nb2gcBZPnr4Rg2nXgaWT1JPXMUSHY2KD7trkY9NHCYRvJi7dte/fYv0x9KSGu6BYv/cpC4TaYIc
 XEO2WLEQ7+SsakxPX0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050065

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
Changes in v5:
- Handle errors returned from I2C_SLAVE_WRITE_REQUESTED and NACK
  subsequent write data until the transaction ends.
- Use target/adapter terminology for driver-internal structures, members,
  callbacks, and comments while retaining the existing I2C_SLAVE_* API names.
- Initialize the I2C adapter owner with THIS_MODULE.
- Express the interconnect bandwidth vote using the ICC kilobytes-per-second
  units through Bps_to_icc().
- Make clock enable and disable ordering consistent across probe, remove,
  suspend, and resume.
- Keep the interrupt disabled when resume fails before the clocks and
  controller state are fully restored.
- Mark system sleep callbacks as __maybe_unused for configurations without
  CONFIG_PM_SLEEP.
- Reject 10-bit target addresses before programming the controller.
- Update short-write handling to use the common write-request event path
  before delivering the STOP event.
- Link to v4: https://patch.msgid.link/20260920-i2c-qcom-slave-v4-0-f7e1020f3bb4@oss.qualcomm.com

Changes in v4:
- Replaced usleep_range() with udelay(20) in the reset path, since
  reset is invoked from the hardirq error handler.
- Avoided releasing clock stretch on RESTART_DETECTED when STRCH_RD is
  co-asserted; TX FIFO is now loaded before ACK_RESUME is written.
- Added cleanup for both clocks on all probe failures after they are
  enabled.
- Explicitly freed the IRQ before clock teardown in remove(), preventing
  IRQ-handler register accesses after clocks are disabled.
- Replaced noirq PM callbacks with regular system suspend/resume callbacks
  and quiesced the IRQ while clocks are disabled.
- Link to v3: https://patch.msgid.link/20260813-i2c-qcom-slave-v3-0-1d3742e2ad47@oss.qualcomm.com

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
 drivers/i2c/busses/i2c-qcom-target.c               | 638 +++++++++++++++++++++
 5 files changed, 738 insertions(+)
---
base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
change-id: 20260628-i2c-qcom-slave-c382ff4e8691

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

