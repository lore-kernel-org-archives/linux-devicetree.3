Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A72631E821
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006583; cv=none; b=WJZz8sl1r4gJWKJCPpC/zXh/3DVIGBPn2X+7NFhqihCINDLkzKdobh//fRQ4n33i87Z0rFZsvMlBuKib15fNA75C/9E0eBjaCOWobecyNVXe6fOm2ykqgpRHLMmd29M5Zq+f+c1HXy7Yb8u2HIno5mMF8/T3bxJJe2Bmwhx9jqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006583; c=relaxed/simple;
	bh=hY84MH1T356dLuOtGk3IYq2rzHaNDOahtodfDNMp7D4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pLGl5F5MlJWsv8Z5DSiLXCk0X2C1mR+Wr1Jdo0LbbNKpsApePYpf/kt1HjRQHSri6Cqac0SWTxly7PSndp5skLoaDn5S4Uqf7oLQAOX5r6G5pn7phCC5BdcyOP4IU674LZZso9jYUpFOh8SxIZnnddHkZEfug1OgWP6xMtKwtQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muZWQFtv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCfj0EG3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muZWQFtv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCfj0EG3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E382Zo3389454
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=b9Sc3n5U5C1+CsrAALlPaG
	oyuHeytyFdQs/RjS86mH8=; b=muZWQFtvkFpvaAjHcRsgbj3q5IaYWr9RsKOIQj
	z/y2osAssN/y9Mh5rE0rvKvOQ5TL8hlpg8NLE+nf9sim7zvYn2tiDx7GQwFgpM5h
	cZ+NWspTLZLAACjFw0uHNwhrXVEt0gP5gD9pYhafIbpEcBBDjsyyW62kwBRW/i57
	KfjbgVfJBtWleea5ObOqc3ArYPY3ginjP+06R0dWpG9FLS2fRU2PZpGTZmM0EpW5
	oG4HUO1kTFGO4b76L1hM7loG33zFS/EyyUI42TBbHPntxf0tzbBF1qRUw/p/Oiro
	pQrwWY9i5tLZndogd3rWQ6W9LAqZojI5KPP+IxdbuSbN2+0w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4uv5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:23:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso1456731a91.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784006579; x=1784611379; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b9Sc3n5U5C1+CsrAALlPaGoyuHeytyFdQs/RjS86mH8=;
        b=hCfj0EG31ddrsBhLmrOPLuQXnoSPOc+9D3wZ7mgW62HVwKxllsuaN4agDpnMBnFjDc
         EXDPEwO+qlEtZXDvQ/1pq57jMzB6aZhgBw4CM3p0+z4jso5Ov44/0xqFHScpEyaf/cpO
         5egSN8UaZ/9irl7pCqiCU8gFGDcP46UzA+uVKnLGYKHODFnNNxLxOWQSAP6r8X7wGLpd
         atHlebbVlSn68Syq3/zskZ2p0umLDFbYsUGSMFcqoOlErcbcfYPbZHFjcIY5j8wy6DwT
         k1BPZo/xgvGmNwZLKCoGIRAqUZ3ZrTCj+XA2QKitj7zENTCs1sTzyXvEbTrT7QBsBRjM
         umsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784006579; x=1784611379;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b9Sc3n5U5C1+CsrAALlPaGoyuHeytyFdQs/RjS86mH8=;
        b=mbxqCQKHVz4KSDVVL81PnCNomnRsKN2HQLI6vce8UTCWiiChMZe5LgeTHaQxpqtbm0
         Xm6WzdjBujFDytsKtm3cg3cZ8Vd8NyCQHAxp6xC4GIbpaVRVF3gIWObK2eTvUafylUpn
         ehR0WAZOekR9l7P+MqYqKaqgEiNfKeupa7/BpxwqGpJIpR2AJ6dmz+B1RRTksEDhzu6F
         bezvuvxXN/wZReVeVlaPuZYBF2UU/HePnYiFcSSeu+jUDcf2wS+xko4WUKVV1AIi/IN+
         ue5ClQmQB+Bsjx1gepvdNZpBD4SuZ2TpU7tRlymDKMpo2Om4LqhuEEEDqp6bxKrluwWv
         0Gbg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+b0Cs5jr1r0wK/hn0skSNnE6gdyi4CYnJlNsY8es1XdUQlyNGRUiqc/L+eXGocM5qLN3XvkFFx+1f@vger.kernel.org
X-Gm-Message-State: AOJu0YxSmEcNLNSwDg79pI5Q+0+KPOHHYcmM+9hmUcVOb3uiX0REWoqX
	jxNIP4Bu+/xlCs3rSgOdjz3LGRKfiaYPVGLUcW16u7vuH7xJl/aCsNSTp/9UD2Y6lHOHF8PJvdv
	ExEaJqgs8z7QcrfV/CQSNfpVscpGz+tyc8Gz2jSkOy3xRVFuYKkqYXmza18jOj8Ck
X-Gm-Gg: AfdE7cnAeMOtg6W0eRr9rkfaZewbtPeZJmmuclGj4Pm5BBermsOlt4fmbWmsa7eWp9A
	5AaMA7x90yEdMH5eSXEldq8zd3/qnfOjCwAGpgwFEJBExYkfrzeIka1Xk7c7U+MeNNbV4l4m89q
	QyZiec8Xru0j9GYWEtLxLfVyfU6Luf43oRktZMLy5mm9H/UDsQK3hJ4oOH44ct776XevPc1ThEZ
	ZF73ajPGl4BwR1nLS+9x/glwtMVhtWHSlHoNJengdOk/2dYjJ4Q4KGzJtutXA+TGH8BggnCGWmC
	kQiuHl00DSCd1EgNi1pvf6BYYKQDdAfodmfBx0NFI0IZPz3d5s4baXS8TU+DmMJFme3gkOL8x+3
	gxn+n3oWkTZWJhIbJrrcfeA3ZFpZfGSMqzBEYWmxrcR7PXstC13LIEyMMqioLb2E=
X-Received: by 2002:a17:90b:1f8f:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-38dc75eb7d7mr11774140a91.16.1784006578970;
        Mon, 13 Jul 2026 22:22:58 -0700 (PDT)
X-Received: by 2002:a17:90b:1f8f:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-38dc75eb7d7mr11774088a91.16.1784006578434;
        Mon, 13 Jul 2026 22:22:58 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm78609864eec.30.2026.07.13.22.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:22:57 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH v3 0/3] input: misc: Add an initial driver for haptics
 inside Qcom PMIH010x PMIC
Date: Mon, 13 Jul 2026 22:22:53 -0700
Message-Id: <20260713-qcom-spmi-haptics-v3-0-c931bb7cb94f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK3HVWoC/33NwQ6CMAwG4FchOzuydcsQT76H8QCjyBJhsOKiI
 by7g5MH4qXJ3/z9ujDC4JDYJVtYwOjI+SEFdcqY7arhgdw1KTMQYISRhk/W95zG3vGuGmdniSt
 rywKLGhQgS3djwNa9d/N2T7lzNPvw2V9EuW3/aVFywRvQqAEaNLW+eqJ8elXPVO3zNNiGRviBQ
 B9BkKC6lPKMRrQK1QG0rusX1633AgIBAAA=
X-Change-ID: 20260616-qcom-spmi-haptics-3cc97e7b232e
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784006577; l=5077;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=hY84MH1T356dLuOtGk3IYq2rzHaNDOahtodfDNMp7D4=;
 b=kSe3woW3aqDqRhqg4D1BvQ2tKoN8uXea77QAdXAxfyRIKK10fiwZuVT3cEKH5JI4pJ/bM+bby
 rSA6tIWoXXhDcP6xdS9FgVRjp7JnN+GPuQnlUdByQvmLdrbWQPCylka
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a55c7b4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=BfAra4sw-YzvcMA48iEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1MyBTYWx0ZWRfXxbce3ng7LnEg
 lwXY0f16uWENKeZ59NMEdOG8+mWnp0jTSGCrY044rjNvEwbH0jDqr8wYeNGAhGcUajvBQQRbo0J
 YYmE2mf1B0g87i3Pyt8Unv4n8dxkiRQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1MyBTYWx0ZWRfXx050e5n5v8kW
 l9Yx1+pGxdtnNbRZzr22ZSiFJgeFG9Nv63z1xOPuAH5W5DOZtEC4AV3siHukOKaPkv3eSrW9Wqf
 tsvZjxMS1mEr4wQOL0CVO/OitUs0sEaAK8abSd9GLKCyNrNoKvDZo25/whpK+wkQ32FvgzIOzto
 U9DscoI4K9jyqSKADM4K6MdvmhCgjLAEljq0MblukFwdqo8AOcRO7Y8ELVsMw2nOyQ1cMBB3nF0
 ONN+orTZLkafvHXNykHmNeSJ5nNpmryCMZk6xwCab64DYMGws1qW3y7XKCM/FqL5/tsZX8QpoWt
 y1yCK6h3yJMdZtvewp6Ct4qkS/S002l84tGFmIDwT/zuqYRtUbq2pV7Io1xILFFBjLJrslEHuum
 XAOb+yhB/lNfDZEKqYBZuWiU/83Y1NHNL3RZvaC7hDL/bgvEsF6AO4h9zwWZCQxcM4xj9c+h6+z
 Xq0OwKd0UnULsKfoPVg==
X-Proofpoint-ORIG-GUID: xN1NlHX6ci8PDlroYJsqv2E-v8Jpxp_6
X-Proofpoint-GUID: xN1NlHX6ci8PDlroYJsqv2E-v8Jpxp_6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140053

Dependencies:
 - [patch 2/3] depends on [patch 1/3] and they should be applied together

Qualcomm PMIH0108 PMIC has a haptics module inside and it could drive
a LRA actuator with several play modes, including: DIRECT_PLAY, FIFO,
PAT_MEM, SWR, etc. Add an initial driver to support two of the play
modes using the input force-feedback framework:

-- FF_CONSTANT effect for DIRECT_PLAY mode which drives sinusoidual
  waveforms with fixed period and amplitude, which would generate
  a constant vibration effect on the LRA actuator.

-- FF_PERIODIC effect with FF_CUSTOM for FIFO streaming mode, which
  can play an arbitrary waveform composed of a sequence of 8-bit
  samples at a configurable play rate.

Also, add the device node in the existing pmih0108 dtsi files, and enble
the haptics device for several boards by updating the vmax and
lra-period sttings according to the LRA components that mounted on each
of them.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v3:

In the binding:
- Removed the ref for qcom,vmax-microvolt as the property with standard
  unit already has a ref in dtschema
- Added 'qcom,pmih0108-haptics' as a device-specific compatible

In the driver, fixed Sashiko AI review comments with below changes:
- Added a list to queue and serialize all of the request, which helps to
  avoid the races between playback(), which is protected by evdev's event_lock,
  and play_work(), which is protected by play_lock.
- Changed to use guard(mutex) or scoped_guard(mutex, ) for cleaner mutex logic
  usages, and update protection section to prevent race conditions.
- Added runtime pm control in haptics_stop() function, use it as an unified interface
  under the guard of 'play_lock' in play_work()/erase()/remove()/suspend(),
  to ensure the runtime pm control correctness in race conditions.
- Removed unnecessary stop play sequence in fifo_empty_irq() as the HW would
  automatically stop after the FIFO samples are played out.
- Added a common interface haptics_clear_effect() to clear the FIFO data with gaurd
  of 'fifo_lock', and use it before upload() and in erase() to prevent race
  condition.
- used __free() for safe memory cleanup
- Checked play_rate against negative value when loading FF_PERIOD effect
- Limited the custom_data length to 48K prevent potential OOM

- Link to v2: https://patch.msgid.link/20260624-qcom-spmi-haptics-v2-0-b9118e60f3e3@oss.qualcomm.com

Changes in v2:

Dropped dtsi change and I will resend them after the driver and binding changes get accepted.

Updated haptics binding and addressed review comments from Krzysztof and Konrad:
- Extended the description to clarify the 'PAT_MEM' mode (not yet supported in the driver)
  by comparing it with the 'FIFO' mode.
- Updated the compatible string to 'qcom,spmi-haptics' to match the file name and removed
  the PMIC wildcard.
- Simplified register names to 'cfg' and 'ptn'.
- Corrected the unit naming for the 'qcom,vmax-microvolt' property.
- Added an additional clarification for the 'qcom,lra-period-us' property.

Updated the driver to address review comments from Konrad and Julian:
- In haptics_write_fifo_chunk(), separated variable declaration and assignment, and added
  comments explaining the 4-byte and 1-byte FIFO writes.
- Replaced manual 'x * n / d' calculations with mult_frac().
- Switched to disable_irq() to prevent late IRQs after device removal.
- Replaced property reads with device_property_read_u32().
- Remove the 'INPUT' dependency in Kconfig

Updated the driver to address feedback from Sashiko AI:
- Guarded pm_runtime_resume()/suspend() with 'pm_ref_held' to prevent runtime PM reference leaks.
- Replaced spinlock with a mutex to protect FIFO data during playback and avoid calling
  sleepable regmap APIs under spinlock.
- Adjusted suspend/remove() sequence to stop playback before canceling work, and freed
  FIFO buffers to prevent potential memory leaks.
- In FF_PERIODIC handling, allocated 'fifo_data' before assigning data to ensure its
  consistency with 'data_len'.
- Registered the input device after enabling runtime PM.
- Unify to use 'h->dev' pointer in probe()

- Link to v1: https://patch.msgid.link/20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com

---
Fenglin Wu (3):
      dt-bindings: input: Add Qualcomm SPMI PMIC haptics
      dt-bindings: mfd: qcom,spmi-pmic: Document haptics device
      input: misc: Add Qualcomm SPMI PMIC haptics driver

 .../bindings/input/qcom,spmi-haptics.yaml          |  136 +++
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |    4 +
 drivers/input/misc/Kconfig                         |   11 +
 drivers/input/misc/Makefile                        |    1 +
 drivers/input/misc/qcom-spmi-haptics.c             | 1160 ++++++++++++++++++++
 5 files changed, 1312 insertions(+)
---
base-commit: 66725039f7090afe14c31bd259e2059a68f04023
change-id: 20260616-qcom-spmi-haptics-3cc97e7b232e

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

