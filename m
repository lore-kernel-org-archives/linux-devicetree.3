Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7323841DEF1
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784120508; cv=none; b=mVupxnn8wwn40uIudUwY17u7LjDlbIV+s57BFwoiWzKXIPkmTu/0hFrTJFmNV6SebrHe/RGDrxN3g0jx2g5qJ6LlINvTVe1oRPrmQzk3BMgE4bdv8034WPPxnDOfHjRaPDMR46Dwuiqgv2fYtI952Jd+jP3tkzjPo2XHIRrm0kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784120508; c=relaxed/simple;
	bh=W2KrwNxFKLq1tJiXLUOCfFm1U2VhB5XaO6pzS5pKm2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L7zsoVLbr+dE+z5IHeHtlwO9FR8Mlwe86VOwKHsvj2BFGwyL/TnWfeiYjBKvvGZD2rtyAqcWwEnyyGVyzADIh+RPrXUjhkKyRE45/xgM6wY08al4KLCCywxVa1teDbWVeiuHTOmLvmyStk9bEZ+dxWG0X40HhY5Ua8K9pMjR1/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xk5IjJ/W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=foyRKAKj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xk5IjJ/W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="foyRKAKj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBchnX3707608
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DQAD5+iPQQ42jpX4PTueqH
	matnJoZe8bRwUIsSmcMaI=; b=Xk5IjJ/W0O+yG3zyfuM5YsX4gwbrLfCt8QZOPO
	W95/xXUgaEGqZxDeH16t99he1fICnPXd8XX67SpcMSwBY4JEfGopBh029HrBCmey
	wEDDgF9GtrZy6QdTfYnPxaTjfO4To2ZB6lk5WoZBoaMqJbO2cebgU3xrwL49rRJA
	AZsC3vlD1WO+67oecOSIzhakSP2McNWsjTkyWt3H7p5QCbPn9paEy5TAITXeBv3r
	sx+/6OjZ7/GRu1JUo9DWn0XwpcEWqnVPfKi36DTTFHIOKhMxP8CUIgIj6rnA4wAc
	4L2AFGeEjOK/GCK1ku76kQYK1eSUmSeUQVFKA83r8wfWdvrw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7nmgsea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:01:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cceabd70f5so49030705ad.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784120503; x=1784725303; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DQAD5+iPQQ42jpX4PTueqHmatnJoZe8bRwUIsSmcMaI=;
        b=foyRKAKjjgwWyBdPklHaj9Ei/m/BPteBEK4YddWSN3ZL8QKTkzUlr+iOVzxEaR5+wD
         hApX1SY8OEOmhqUt9PhdowDc+tOfJulIfY1cq6WtAudbiqI+VDMxFldxMINlUu5zOCXT
         3Rau7Nr+eFna4uge7eFJtfCXuMpGAbfQqdBlV/AQrz2aj6wRIL45jOIfZaN7EjnLmGTg
         HXIQ8Zb0SY3RIYgmhZDQtwujzSSEhDw5VKfoxoj2qe+MbcBUqNXmkYaYj7rp6jZlZ2fC
         kudL6TXhZ/kQb26XbQj514Y80lo4AMxpiEcpR/UwOru41GPczAPqQ4ZAIt69HjM7Vo74
         TGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784120503; x=1784725303;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DQAD5+iPQQ42jpX4PTueqHmatnJoZe8bRwUIsSmcMaI=;
        b=K6LKyuJB/PJVE0KsEGHVsb0Lu/8dqB2K2GLSIPXi2N8ru6YGZhIa6bwzWhpuk/S3NQ
         gVTU6nJF2OmmLtJgccxmv3XbCCVqlgHyJsPZHONTbO4W+LVf3M7K9ilOz6fXV+nJrRSf
         wxX0/4/2ho0NlTae7B5TwsAaiISa404hE3Fv3E00/jLei+QKyqMbgA8tNdhZO0By29jC
         DofQ3zo5ogYKSbIypWSItWShhu24f6gkK6yRvTlkTJsATZMLSndD1PB9uzRRw5ePm6Uz
         hzQRSMuZuZC3ZXg345eOsc1qHTXC2u/tOhMVNTy1A1+fSJ2fWJ0iS2shFWgTqXdHFWrP
         BXPQ==
X-Forwarded-Encrypted: i=1; AHgh+RquOeaR1IGA4D06MCwA9iIPbED+6StlgpEK2DMBFfoi6vmFfdk7px9ifFr8kjAIzkZbDoeJ2XGB0ZnW@vger.kernel.org
X-Gm-Message-State: AOJu0YxpDiHhOWpxLIG6SbqoU5+A0zS4AgGm259y8D078zTkVqulCve9
	Wu9bbPURi7r+ejFqIKEFIDrpUYJ7ixqa5HN3GoB3X+X90chMxgTfrewVslWbyH2UyTtNuYvkbGc
	kC1Nc5Uwi9RRFISfGqjduQOvHkl7drJxMlm0OEBeq19BwiIKvDD1ES3UmYU6sNojZ
X-Gm-Gg: AfdE7ckPnjUnv4UPzKNoFCbqnXAh9N9xRRJa1PJb+Gd8i3I/EyttwaNb+XdGJHpItWE
	Vs186mHKkRTRhHeIQJObcrqNPMwc2nVLqXPs8HfatdfAUE08S4cOMmfIJpJOafqT1szfntSbPBz
	Ze83yykwV8juXpVMgLRUeShRbG5EChkJX3cNc9FCElspxtkj98CZC01L+2Sgvq31zOtScBKL9kP
	5rMZGA9dAThzaZgkYDxngrZUNpSAyjiVeqLquJm/cV0kLRprtHdpNMFrGcY7rALStLGhzDhoAll
	zYGagARZbHIpCxvMi6r1F4lrltulwc/SjJlKK2YwnQbrKYKXeoPX7kRrA0Us3Weu35cFalqCEVI
	DQEqKJoGtSVkMdkSc78a1lgzoDgjxNABjLwO5yI0=
X-Received: by 2002:a17:902:ecc2:b0:2ca:a03a:29b2 with SMTP id d9443c01a7336-2ce9e59e1e2mr172806535ad.8.1784120502861;
        Wed, 15 Jul 2026 06:01:42 -0700 (PDT)
X-Received: by 2002:a17:902:ecc2:b0:2ca:a03a:29b2 with SMTP id d9443c01a7336-2ce9e59e1e2mr172805775ad.8.1784120502060;
        Wed, 15 Jul 2026 06:01:42 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf106de049sm1922255ad.68.2026.07.15.06.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:01:41 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:31:30 +0530
Subject: [PATCH v5] arm64: dts: qcom: x1e80100: Add deepest idle state
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260715-hamoa_pdc_v3-v5-1-00440cfaf711@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKmEV2oC/22O4QqCMBSFX0X2O2XTbVq/eo8Imds1F+l0UynEd
 2+aIEVwuXAO537nTsiB1eDQKZiQhVE7bRov2CFAshLNDUKtvEYxjjnmmIWVqI3IWyXzMQm5EoX
 MKMMxkciftBZK/Vxxl+tHu6G4g+wXxpaw0A2+p99jlXa9sa/1iTFZ3K2P8O8+PzikKgPCMAWRs
 rNxLuoG8ZCmriO/0MIb6c5IcfrDoJ6hSkVKKhIB2fEPY57nN6XEC4MaAQAA
X-Change-ID: 20260605-hamoa_pdc_v3-6dabc845021c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784120496; l=11164;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=W2KrwNxFKLq1tJiXLUOCfFm1U2VhB5XaO6pzS5pKm2I=;
 b=l9mZJVFsDVxuzfYEXQBHQobUkDCYArgZhBLHh6vNdKY5sPmuccU+R0ImYxPqwujAL+CiE/3qQ
 3c31ovdI27dB4Q3Jmj9EeWTcHuF4v8szShcGTRwOsahAVdBHeFgxxqb
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyOSBTYWx0ZWRfXwT1vQQVzPP9A
 os8pf1sHEnJ8HjLi1aar21jpqz/qNFpXvzm9Fy12S40ArfR+KNuFU9d0B45ZC9CTrCSvD/vRa1C
 Mvy3RbHuTS9xHRHiPQDHj9dqL9shIR8=
X-Authority-Analysis: v=2.4 cv=cuGrVV4i c=1 sm=1 tr=0 ts=6a5784b8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=t9ty7G3lAAAA:8
 a=r-41rxsc7uDkY-bGQgsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: yHgOFgKNZQg9L7Y_wPe_eSv1taE3EhwI
X-Proofpoint-GUID: yHgOFgKNZQg9L7Y_wPe_eSv1taE3EhwI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyOSBTYWx0ZWRfXwX6SSG191O+7
 HMFh/RrLpTT7xyvCopMODdr70pLuS3DpSDMwtqjXgTbMYMYf6tz9bhdTGK5zQreEePtZR0sssA+
 3638ySTp5E4f7R57INPEVu9LT4Xnf3ZJde3tJygt5J61ukdyQ0vr9+XjO1WVIz0YGaqSfk4sOYD
 iC2OlCtTLW0FQOTIZ8ElqGz9QpJQ73xeXWt+2ypFAK6ikLfEvZJbE+7S9FCHuG8ydn0WtaWtSXN
 Pu7CMy79r9CWimvLeTbaSuzw4HJC/PdRdAqq/4voEVuj5JjYAzFv/voM33X6MsrHZMV6DId+Rg8
 uCuw6gX0MyPjfApnz2GzIZllpHW3b7iqej+siDZno7Ih0heerkr3KvLuc6ikCR3D9pz+UhekJr9
 Ck2LuqzIQFgl6UjhDTGoq10qQXSmmfZmCamtpuraoffXlf4AEJ08oN4UZTcOE4ElJXN4UAKW0ha
 7XBK3cdh91VKUSjlg0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150129

CPU subsystem deepest idle state can lead SoC to low power mode like CxPC
(chip rail power collapse). SoC deepest low power mode requires the PDC
interrupt controller to wake up the SoC as the GIC interrupt controller
is on Cx (chip rail) and will not be functional to wake up the CPU.

PDC monitors both direct SPI interrupts and GPIOs used as interrupts
in SoC low power mode. Further all wake up capable interrupts gets routed
via PDC to GIC when SoC is out of low power mode.

The wake up capable GPIOs used as interrupts were by passing PDC on x1e
with commit 602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC wakeup
parent for now") as a result CPU deepest idle state was not added so
far.

The blocker for enabling deepest idle state was GPIO IRQ wakeup support.
The x1e80100 PDC can operate in two modes: pass-through mode (GPIO
IRQs forwarded directly to GIC without latching at PDC) and secondary
controller mode (PDC latches GPIO IRQs and sends them as level IRQs to
GIC).

All the SoCs on Linux so far worked in pass-through mode of PDC.
On some x1e boards the firmware configures the PDC in secondary controller
mode, which caused GPIO interrupt storms as the level latched at PDC gets
never cleared.

The secondary mode is originally a requirement for windows SW platforms
(which could not work with all types of interrupts and require level
interrupts for GPIOs). Initially shipped windows firmware did not have
SCM interface to configure PDC back to pass-through mode if with such
firmware Linux is booted up.

PDC irqchip has got secondary mode and SCM interface support to configure
PDC irqchip mode to pass-through mode on newer firmware where SCM interface
is available and for older firmware on which SCM interface is not present
PDC irqchip works in secondary irqchip mode [1]. Above mentioned commit is
also reverted via [1].

With PDC now working on older firmware as well add the CPU deepest idle
state domain_ss3.

The newly added domain_ss3 state has entry/exit latencies of 2500 us.
The shallower cluster_cl5 state had entry/exit latencies of 2200/4000 us
which are higher than the deeper state. This create an inconsistency that
would confuse the idle governor. Correct cluster_cl5 latencies to 2000 us
each to match production configuration values.

[1] https://lore.kernel.org/linux-arm-msm/20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com/#t

Tested-by: Daniel J Blueman <daniel@quora.org>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
There are two modes PDC irqchip can work in
        - pass through mode
        - secondary controller mode

Secondary mode is supported depending on SoC using PDC HW Version v3.0
or higher.

+------------------------------------------------------------------------+
| SoC             |  SM8350, SM8450  | SM8550, Hamoa   | SM8650, SM8750  |
|----------------------------------------------------------- ------------|
| Version         |        v2.7      |       v3.0        |       v3.2    |
|------------------------------------------------------------------------|
| Pass through    |        Yes       |       Yes         |       Yes     |
|------------------------------------------------------------------------|
| Secondary       |        No        |       Yes         |       Yes     |
+------------------------------------------------------------------------+

All PDC irqchip supports pass through mode in which both Direct SPIs and
GPIO IRQs (as SPIs) are sent to GIC without latching at PDC, PDC only does
inversion when needed for falling edge to rising edge or level low to level
high, as the GIC do not support falling edge/level low interrupts.

Newer PDCs (v3.0 onwards) also support additional secondary controller mode
where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
still works same as pass through mode without latching at PDC even in
secondary controller mode.

All the SoCs defaulted to pass through mode with the exception of some x1e.

x1e PDC may be set to secondary controller mode for builds on CRD boards
whereas it may be set to pass through mode for IoT-EVK boards. The mode
configuration is done in firmware and initially shipped windows firmware
did not have SCM interface to read or modify the PDC configuration.
Later only write access is opened up for non secure world.

Using the write access available add changes to modify the PDC mode to
pass through mode via SCM write. When the write fails (on older firmware)
assume to work in secondary mode.

As the deepest idle state as the PDC can now wake up SoC from GPIOs and
revert commit 602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC wakeup
parent for now").

The series has been tested on x1e80100 CRD with both old and new firmware
and also on kaanapali. Test conducted with tlmm-test module after
applying [3] as test module needed to be fixed first.

All 17/17 passes in pass through mode and 16/17 passes in secondary mode.
Failing test tlmm_test_rising_while_disabled seems to be because when in
irq disabled state PDC is not latching the edge interrupt.

Test #1: Pass through mode on x1e80100 CRD (New firmware)

root@qcom-armv8a:~# insmod tlmm-test.ko gpio=91

KTAP version 1
1..1
    KTAP version 1
    # Subtest: tlmm-test
    # module: tlmm_test
    1..17
    ok 1 tlmm_test_silent_rising
    ok 2 tlmm_test_silent_falling
    ok 3 tlmm_test_silent_low
    ok 4 tlmm_test_silent_high
    ok 5 tlmm_test_rising
    ok 6 tlmm_test_falling
    ok 7 tlmm_test_high
    ok 8 tlmm_test_low
    ok 9 tlmm_test_rising_in_handler
    ok 10 tlmm_test_falling_in_handler
    ok 11 tlmm_test_thread_rising
    ok 12 tlmm_test_thread_falling
    ok 13 tlmm_test_thread_high
    ok 14 tlmm_test_thread_low
    ok 15 tlmm_test_thread_rising_in_handler
    ok 16 tlmm_test_thread_falling_in_handler
    ok 17 tlmm_test_rising_while_disabled

ok 1 tlmm-test

Test #2: Secondary mode on x1e80100 CRD (Old firmware)

root@qcom-armv8a:~# insmod tlmm-test.ko gpio=91

KTAP version 1
1..1
    KTAP version 1
    # Subtest: tlmm-test
    # module: tlmm_test
    1..17
    ok 1 tlmm_test_silent_rising
    ok 2 tlmm_test_silent_falling
    ok 3 tlmm_test_silent_low
    ok 4 tlmm_test_silent_high
    ok 5 tlmm_test_rising
    ok 6 tlmm_test_falling
    ok 7 tlmm_test_high
    ok 8 tlmm_test_low
    ok 9 tlmm_test_rising_in_handler
    ok 10 tlmm_test_falling_in_handler
    ok 11 tlmm_test_thread_rising
    ok 12 tlmm_test_thread_falling
    ok 13 tlmm_test_thread_high
    ok 14 tlmm_test_thread_low
    ok 15 tlmm_test_thread_rising_in_handler
    ok 16 tlmm_test_thread_falling_in_handler
    # tlmm_test_rising_while_disabled: ASSERTION FAILED at drivers/pinctrl/qcom/tlmm-test.c:545
    Expected atomic_read(&priv->intr_count) == 1, but
        atomic_read(&priv->intr_count) == 0 (0x0)
    not ok 17 tlmm_test_rising_while_disabled

not ok 1 tlmm-test
root@qcom-armv8a:~#

v2 series is dependent on [1] as mostly all changes are already reviewed.
v3 series is dependent on [2] which is already merged in linux-next

[1] https://lore.kernel.org/linux-arm-msm/20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com/
[2] https://lore.kernel.org/linux-arm-msm/20260527095426.2324504-1-mukesh.ojha@oss.qualcomm.com/
[3] https://lore.kernel.org/linux-arm-msm/20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com/
---
Changes in v5:
- Drop already merged v4 changes 1 to 6
- Add detailed commit message for adding deepest idle state
- Add Tested-by: Daniel J Blueman <daniel@quora.org>
- Link to v4: https://patch.msgid.link/20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com

Changes in v4:
- pdc_setup_pin_mapping() use dev argument and use dev->of_node within
- Merge v3 patch 2 and 3 into single change
- guard pdc->lock for all pdc->enable_intr() function call for HW v2.7,3.0
- Move lock init before pdc_setup_pin_mapping() for bad spinlock on v3
- Removed unused num_gpios
- Add comment in qcom_pdc_gic_secondary_set_type() from v2
- Modify primary case in qcom_pdc_alloc()
- Remove pdc->version checks from pdc_unmask/clear_gpio_cfg()
- Formatting and commit text updates
- Link to v3: https://patch.msgid.link/20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com

Changes in v3:
- Add test results in cover letter with tlmm-test module
- Fix coding style and struct defination
- Convert raw_spin_lock to guard(raw_spin_lock) and remove _irqsave
- Use bit number instead of GENMASK() for single bit fields
- Use __assign_bit() and __clear_bit() APIs for single bit modifications
- Use devm_ioremap() instead of ioremap()
- Use devm_kcalloc() instead of kzalloc_objs()
- Add separate irq chips for pass through and secondary mode IRQs
- Add IRQCHIP_EOI_THREADED flag for threaded IRQ on pinctrl irqchip
- Link to v2: https://patch.msgid.link/20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com

Changes in v2:
- Update to mention SoC names along with PDC versions in cover letter
- Drop devicetree change to remove scm interconnects
- Use qcom_scm_is_available() to wait for dependency on SCM
- Drop binding change mentioning qcom,qmp and PDC config reg
- Restructure version support and move all statics to struct pdc_desc
- Remove pdc_enable_intr() wrapper
- Differentiate direct SPI and GPIOs as SPI using PDC IRQ PARAM reg
- Add changes to make PDC work in secondary controller mode
- Rework and include Stephan's change to invoke irq_ack() for edge interrupt
- Mention dependency via b4 prerequisites and cover letter
- Link to v1: https://lore.kernel.org/r/20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 09527dcf9576..f01eccb67ee2 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -300,10 +300,18 @@ cluster_cl4: cluster-sleep-0 {
 			cluster_cl5: cluster-sleep-1 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x01000054>;
-				entry-latency-us = <2200>;
-				exit-latency-us = <4000>;
+				entry-latency-us = <2000>;
+				exit-latency-us = <2000>;
 				min-residency-us = <7000>;
 			};
+
+			domain_ss3: domain-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x0200c354>;
+				entry-latency-us = <2500>;
+				exit-latency-us = <2500>;
+				min-residency-us = <9000>;
+			};
 		};
 	};
 
@@ -462,7 +470,7 @@ cluster_pd2: power-domain-cpu-cluster2 {
 
 		system_pd: power-domain-system {
 			#power-domain-cells = <0>;
-			/* TODO: system-wide idle states */
+			domain-idle-states = <&domain_ss3>;
 		};
 	};
 

---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260605-hamoa_pdc_v3-6dabc845021c

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

