Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AC042E43D
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789905855; cv=none; b=g0FweRvNwwD2ERP9kjsEIT9vOj+Msh28lOqhPz+sx+tSZkXfQM+7+SN/Z3yUdNBWQ9T1TQsNCTa8D5gmQ+FXBlgAie5dZHa7f3l/4zxO8IsYqvO2Sak2RK+WQU1PjZkLKRepmDQ58LjPEFeSpSBsUsILrx4qZxCeUKUjpLd3T3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789905855; c=relaxed/simple;
	bh=Crjw5Xus5SLMGq0l5ZYMypUoC+WdhZ34e6FQZQRfNDE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fMu30qqPzZwiNUOrWxDrlKSqET1gcEFeJhSvjMv0LPalrZNMUipYoIMsoh5uButK0VwMrzyHo6mr6cTCifahTRtbW0kpu1F5vOT/OXySTaGUzNPYFq5gIpHfDx8/wZsagJib5Xwckau8NnEtOxkEtpfuxhNHgZl5kqbONytNf1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IzD0ZEBL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EAX8LmQi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IzD0ZEBL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EAX8LmQi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBnm3D1572034
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 12:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M74F41nUUVLcgWM+QziOZU
	0aQMN5dEs3iviwpQLRSpQ=; b=IzD0ZEBLub6pOGvZLvOAH3Uzi8qTy/ADY7rjix
	zE3HO/XMP342QkPWPCCRtF/OMU6GXzsL8IyQ18aN8Hwl1twVTwCK7EPL7Gqw5gP2
	ifjhCDH2JB6ODx776PIz+iOt0efZ9bf57hpWcyIyrlOPKbB+FfY2lbb3i83vVwzJ
	+1qlerkEzg72cRIu1AKRxJVK9tIJQ+LF8HMYeQ5MvUSS1bpp32h8BLK5ChwzJzpp
	P1ud9a5bnI28weDAFAX2HN5Bkr6ffGsYyoSEzr4cU7JuzfOmOWMwUMOWyRaoSUkV
	A2FR84mirTeLcCN5Cl2Fy6UDbVtmL2fBZGSmqd/+sf1f/T2Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskp9trya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 12:04:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so4037245a91.0
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789905852; x=1790510652; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M74F41nUUVLcgWM+QziOZU0aQMN5dEs3iviwpQLRSpQ=;
        b=EAX8LmQi5jIFerWBjIULpcAnPn6WXqtaPPHj18gKCu5jt5QcKk60nrLplTTh8cHK3G
         98XLSm6GWx0HANo9X/v29F94TGDp3Dd4AIuEehQPVnRsICUujg2UsSSdTz9iHENCbo5C
         lRwR3aerPFV5AHhEtIbgGyb6osEXM0pjPWD5kSO/R6EP13JB5kd/H0EWkBhgmLyMFyRz
         uAHIrphFN51EFOWQvWTCD7lHRezHCd3RL99IxfIiPdAZHcT2Dj2iuJ6wdXU28SRQXQHf
         4fu74pZcr3/1trsDd+6yuAdIYTcmWMBwC1A3Y3EpY5oy6Lk9KbLXcKEv7VJ8Lj3UVpQd
         x0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789905852; x=1790510652;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M74F41nUUVLcgWM+QziOZU0aQMN5dEs3iviwpQLRSpQ=;
        b=aZR7dsZh8XyzLTN0VRQlQZ0MgFWz/Eaarv5khANtqCJ6F2zhRapc6+W1JRLF5AuaD5
         +DrtPKltMZN97YyvNeInqzWyXNczd0XCOC9lE9YY9yUaIyUKzNzWE6uihHCStUuQftKF
         Obu1MJVsFZGK60Ols1vMoCo1LbuYk56NBLdRnSOoyLGi2pYNFBQYxJhBWBNqRpC70QmP
         M71T3BXdtEyFmi9sROXTM2TOe+JDG+Z3OG/7FP2eUMTWCdIgcyqY4KEQKSnKpcoKRJZF
         lI8cpdzvL4ogl8xGEz8rwEYwS1bnyvbB6X9kc2ERdYzVbdp/yiQ6cjWI8XfOilIXI2C7
         h4ag==
X-Forwarded-Encrypted: i=1; AKwUvByK2oUfvRKw/MzszvEKgBqPnzHbOTfvSOEDkdUNxMYmsNWGms9Pc74wx+lUrTi8Yj0mPCK4EsNSinsP@vger.kernel.org
X-Gm-Message-State: AFuF++n40OI4t9pe5CpqVKlDebEz1m0fLJsWXmd1WsqQOvO5hj1mVwek
	9JM6IwZdh6GJbjViGZlaS2fPwe1++wQkOUlCidrqGf7qmzWsOLfQjrHwPBLbs2Is35dnJ1RP0PK
	htPEonPa67A6NjR8UmD/e19phCUlsFn5e1mWKQkZ4Dn6H0yRz5GqmarRb3aV2R4jq
X-Gm-Gg: AYBFou1Uc7w278J/q7aGJf7MX+zYyol4zQNcxnQB+2Hw13osETZ0pe+KvoSJ33aqv/s
	4e57BWPofHX0nV/MzVXn8mBOxjRpzRNAkT2CiRncz5LXvBanFDvM5TlEMauvAMod8fZSMn6o3Li
	uu6LdvLapXnCHz3bRvyf1qxlNTjqsI7U/NGt9Z2I8fJInHCKSdFBxqcTtWmKeNEguYyMC3poPz7
	wF0oY+fjQXlMm8vgYRn3sTb/MndLp73c7qm0d0QV2BRrs1siiFDNtFpGpy6fCrYmtJQ5VpJlFdS
	zomG/UY3p3Rhl8kOqwpU/YyWhKOX5JNK/LG6/XEC71v9CpjzWVYWNIS1jDuDqNWMWOs4q65OTGP
	Jw2da6CvKjqbDgiI7ZcNG1Ymna3vsqCuvtyY=
X-Received: by 2002:a17:90b:2584:b0:39e:6c68:c787 with SMTP id 98e67ed59e1d1-39e6c68ca2emr6321882a91.61.1789905852335;
        Sun, 20 Sep 2026 05:04:12 -0700 (PDT)
X-Received: by 2002:a17:90b:2584:b0:39e:6c68:c787 with SMTP id 98e67ed59e1d1-39e6c68ca2emr6321850a91.61.1789905851867;
        Sun, 20 Sep 2026 05:04:11 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55aaf1csm12109622c88.3.2026.09.20.05.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 05:04:11 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add Qualcomm I2C target controller driver
Date: Sun, 20 Sep 2026 17:34:00 +0530
Message-Id: <20260920-i2c-qcom-slave-v4-0-f7e1020f3bb4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALDLr2oC/3XNQQ7CIBAF0KsY1mJgoEBdeQ/jgtLBYqzVokTT9
 O5SXWhS3Uzykz/vDyRiHzCS9WIgPaYQQ3fKQS4XxDX2tEca6pwJMFBMgaEBHL24rqXxaBNSJwx
 4L9GokpP8dO7Rh/sL3O7eOd6qA7rrpEyNJsRr1z9ei4lPvb944pRRUzFbOMZ96dWmi3F1udlj7
 rSrfMi0keCjGAYzBbICWhWCc+OtLv4o4kvhYqaIrPBaaAkItpb6hzKO4xNKrU9oUQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789905847; l=4250;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Crjw5Xus5SLMGq0l5ZYMypUoC+WdhZ34e6FQZQRfNDE=;
 b=hh4+H/8b2G+O2FYQrwIFVrrQpRwHQvMn12cpYGj/QmVkdBhr5Ufvwsv17P6C9MlKdu0BSWxD4
 GQjikHnGGkoBMdSv8NpiOMMBfJbxBaWxU1Ike/uLl7AzVZV+Y730cFg
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-ORIG-GUID: m8UG26m0AJgvhI0ppUgZKIWFhwwqDMuA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDE3NSBTYWx0ZWRfX4xa1aP2GoDwH
 dOKhYormjLUMkgebRRuu7Nx+WUSoBNokRB2KKBVs7YwnsCAsnVSPTJKFMoRF8jgP4pIXGhgYNNN
 D1CdHu/FAdYc+zGrdsBqGL1plFWzNXryh+MLPOHid9VBrVg6zwaGqZnIEgjRKGI6c1K6MCrs1ZY
 s7ZU7atEsHpt7yRAD7z6lFFXDDG6u+7cHpnYIqZGBJAbcVkd1jXCvlVHLwFeKyWkKvbCuC1C1Nq
 w2L08vIyg8hYrSxd2rC9uBYNeLJW78YZXjNcMY/Jkb4Ho2PjzpZbjALzHD1YNrftvXGf1NrfS6X
 q+Kg34CLZxlbJcue5K/NPtQpnMDEHH2PZYzdF01Ovic1a1/SqnVMGn0KnMKVwpw6/Tp3ULbobRC
 JVOx79sD05ByVuBkaY1F+z7UObRNjiVBvxgjtvwDXX5LqinYCgCcS9RlOybEXl6oiTH8BiAzid3
 /lK9vwTmVQ5BbB6qCOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDE3NSBTYWx0ZWRfXxSQPg84KZftx
 TqeCP2YmOeNKB336AeY8KUgd7S6PjWE25rbUNSMNzw6BqPLxlXmA3BcW+Z7jAi+XP8aCQ1bA/UX
 7SH38ffH7twDV+sAagP8tyGSxAnR3o4=
X-Authority-Analysis: v=2.4 cv=BKAmP1QG c=1 sm=1 tr=0 ts=6aafcbbd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=PrR1u7VjwFllBhuBL-YA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: m8UG26m0AJgvhI0ppUgZKIWFhwwqDMuA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200175

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
 drivers/i2c/busses/i2c-qcom-target.c               | 628 +++++++++++++++++++++
 5 files changed, 728 insertions(+)
---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260628-i2c-qcom-slave-c382ff4e8691

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

