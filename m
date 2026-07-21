Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7AA407CCF
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658623; cv=none; b=tBiOcSFeOXE1CHfxkDE1MJYUXfH07B4vBrqVI/mE+BqKh+gM+l2z8eBfQfJv2atUxHVCuZ3XyX/gaajt6rQvhWS5Y68knYuDFHr3nKaJ52poWtVTfzkNQttXHqpu40jlCoYykh7vZ7/Uf0WqXduBaifXReNPvWOADJRgReHi9qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658623; c=relaxed/simple;
	bh=1b61qAvsm0miOUwJn8KRMPbavCrI7mO+2vWxjpqZ7do=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a1OI9XHDLFmD7m7EGfOYfL0vtpqdGjP32uUA8b1onpkiU22Jxqrtw/Ko3ZbaL4kO8+LAn2hVwlgM9R+IbseYwT+2kXnr491e1wzGQ36YMm+WYXcJhWQnCKf1LZ2c1SdrBEuWVmRpY1ZQyl3iyZTXlgRxKJnPdePbFlxUc93kVr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMi6d7Kl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bU/6som+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMi6d7Kl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bU/6som+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHPOQD2115608
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iCyYsJpFLRWTeCtgdOOx5D
	rdFbsbn7oJEfvZv6H9lPc=; b=aMi6d7KlHsmyl/2tgg4byoJiBTLIAQqGKy9PjU
	Hicjg5WteTXTY2ib4bxSOhkUHKpKD/znQINjJkVCV+4uDCasSGsVOCUqUlO5BH0d
	dhLMyge9QCVNGDmqXisAXwSyi+xYXy8Q4L4sc675z+HYDOZxrHIaI1tDICTgOXyN
	ENpUyVJXhrDaLC8yPH0gt8xU8ubieVyOUIFr+SGflscfywukDLeixFQdB6lqpjAl
	BB+giDzNhWM6Uo8yPuvSwapocF0bzfPp2LJ/t8fH1/wqoNn5ZrrYeeXExo5gfD3u
	5CancAbufn8Ia06Etfe3XlQtmJEnIHXXLDCdWjIHFvZThwBQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e0a2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:30:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso282859275ad.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658620; x=1785263420; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iCyYsJpFLRWTeCtgdOOx5DrdFbsbn7oJEfvZv6H9lPc=;
        b=bU/6som+ICPrpYj+3O2ni4bDm5qJmVweqNDXLDD6mKCy+uUwEMYaC5eQn0jbOooO4s
         98sWT4ph0AYoEXq6RYF4lxASwxv+zX9ouvyw0A+91Lr4UfidMnrO/Ah+wETzZBafoqbS
         9QOjl0v5pvxoMyTP7Zi41iV7/H4BqeIt375AEEOi80KLCjvLG+sVD85ovnM2GiycUGTj
         h8hrq7v+2qdQHGrU56YSNCiL97ZpLMRrYpi5WyLpNL6cMMAvdv+12+K9im3gTPSF9cVP
         yLUZx4rCPdz0czrpB6Foc9z8vDcLsYK1IUw9Qnj5DunXEhNIqlvBoIv9L6491sDEMULr
         968g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658620; x=1785263420;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iCyYsJpFLRWTeCtgdOOx5DrdFbsbn7oJEfvZv6H9lPc=;
        b=rianLnNCQ1m/SMITPlM6CSMPkxG3LDmZvLfS9OCsNL3fdzpV2R9jL/jkLZpdxuTOuH
         G5YCuEek/g74iyCopQkABDAzHtueABhAgScFJXuexXEAWj3VOyDmkCWrG7xpljy1MSbM
         oQC3BHzhGBlgSBRiyPDGQq5RqsXiXa4QEa28D9rgKTrO/QWzHifHWifXG2Vg4A9JTuCN
         2Gqd6eubG41Oj2JcOjl+BtZ3bSGCj+dEJlVEvI1Ua8xm9umdMZ6H9jlvmxUd0C/DqmjI
         JmFRuWatoqnwR4PhXatRyEjGkBFq4PYslUhqnmmw4bKYlqx9cNais4L23VPR1qHiB0tc
         JtIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9nh4vKgdtmkAJ1orGK7NLMmGwYhiiN00hu3J1UohdixdADm2aoOdNua2o0TEylSYWtxlbFKioRtRv@vger.kernel.org
X-Gm-Message-State: AOJu0YxUSVST7A0TZkMuyo9YlUXOemSmoqK/SSOao7yBS7XF6OxU+b3i
	FJUDuE196yak9cAf0Htnw+izW3iVWRYOUS0nK+Yp9xkXwf5ld5N50rwzPcge6yQKuuhXFFfaqn4
	NHupyaOiNVZpNbx6XkZmZ113CUmc5HgH5Kk3VEbk+qq6oGhwl1vIx2HPwikXf0osQ
X-Gm-Gg: AR+sD10egjA87aWL5jyvJ0hpbfP4KCG5qUCiH558TZ64cJot78IEcp6zikULM608nTi
	iAXlwXagr99lv8amklo66yGa4fuVEhLlkc1/5fMbfDJlIY83b/owmKEX9CTbAVKEbt2pjylyD8C
	LicQxvExhJaxu6XLYnyYI0QtfE8dVUSbt7f787e+t3sespWTdT6SsfgOS08jgREns6zRMf8G8gc
	/luPkC4zkljY0R26gFoNvAP+wbJ+uPZA8ZGi/nGVH+XuibAP4WM+ClQJQzVlsKBQuIDyquYG/tN
	V0JJsqgU/95tl/MdiqYxbJebAuFgt1ipRHCXT+uCAxgAS0Z1ulncc0EzuJDwefGGadOQDODmud8
	fxuhMt6VMgbSj+moUD+XTeNPZQQsoa5EunmQ=
X-Received: by 2002:a17:902:e889:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2cf348317cbmr211901865ad.10.1784658619819;
        Tue, 21 Jul 2026 11:30:19 -0700 (PDT)
X-Received: by 2002:a17:902:e889:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2cf348317cbmr211901015ad.10.1784658618925;
        Tue, 21 Jul 2026 11:30:18 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:18 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: [PATCH v2 00/10] hwmon: Add Qualcomm SPMI BCL driver
Date: Wed, 22 Jul 2026 00:00:05 +0530
Message-Id: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK66X2oC/12MwQ7CIBBEf6XZs9ssG4Xoyf8wPQCllqQtFhQ1T
 f9drDcvk7zJzFsguehdglO1QHTZJx+mAryrwPZ6ujr0bWFgYkmKCWcbRjR2wP45hgllK4mtOB6
 cNlBOt+g6/9qEl6Zw79M9xPfmz+Lb/lRM8l+VBRIqs2fZkVFKi3NIqZ4feii7sS4BzbquH7p0i
 JezAAAA
X-Change-ID: 20260720-qcom-bcl-hwmon-6d602c195eab
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658613; l=4491;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=1b61qAvsm0miOUwJn8KRMPbavCrI7mO+2vWxjpqZ7do=;
 b=qxbyeCA/FiwpuCQAvOMPkNVnE03+Ii801GfNJw9S0YLZnYvs0+KZ1xJMKJSp0WME6AY44MkJe
 8uNnWa3++/UBsolM9qGHbVEEe3SdnvbYOvu1CPC9hvZVjMEWw2hramd
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: skBg70MVo3yLpIz0Kpo8xbKeSfCfCZdL
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a5fbabc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rZfr960RYrngOTP2lHgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: skBg70MVo3yLpIz0Kpo8xbKeSfCfCZdL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfXwlYEhp6S9OHM
 /RGCiDgFllcGggqqSX96ptGtHNDId2sWTQ5jknV069kFxD2n9UjcHr4tXo5PB50fB/vs5KDQG//
 GGE6Oxov/x1biuMwCvWa8WV7UWwwKsXmp7q2RQN3PvkWN7tkJTLWP87FKyZrnXQdQB8dIumYcud
 6dGzRL+65RjZc5LVpYIAXgLb6rqKKZJiLiDoYyDd0sYsCi/Q+rGuOzg5IjZrLxtN6S3bNrwxC5L
 1Qk2yzsWuwdIVSQPDZKm8eIaCQrdxh1eSIbnCsXLvVg5P0PlP2Eg0l7UO0CwvamBGWuMtDZvThy
 tA8rbdedHFKyQC9AMxrkdRK0i1H2gIwhh7xXgaAlhj7xMYWWcijwT12ayTKC/x/lwURbGWk8Y4r
 3ubiiwlFv1iipMqvcbJdJlFVqZfphOAV/Y8LFxKCkv6oPJtZpoIx4QUuwRt8u7LrUyPEiO0NTVv
 bWS6vfD/MKMkKJytJ/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX7Rc7OTTvgOJT
 gMR5G8T9EduhhaE8uY+YCgcp3KX8YsCMWKUSSrGC9ydC2s3l4hASWIodlFSeRv4jIUQsGxJpAG/
 2cEk7/sEsjvZaW3G0a4hwNtd8Ag/JXU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210194

This series introduces support for the Qualcomm SPMI PMIC Battery Current
Limiting (BCL) hardware monitor present in various Qualcomm PMICs.

The BCL hardware ensures robust battery protection by monitoring battery
conditions in real time and triggering interrupts when predefined
thresholds are crossed. These alerts allow the system to respond
proactively, preventing battery degradation and preserving system
reliability under adverse power conditions.

The driver integrates with the standard hwmon subsystem, exposing battery
measurements and configurable alarm thresholds. This design enables
seamless integration with existing system monitoring tools and thermal
management frameworks.

Key features:
- Battery/system under voltage and over current monitoring support
- Real-time voltage and current readings support
- Configurable threshold-based alarms (warning and critical levels)
- Interrupt-driven notifications for threshold violations
- Automatic threshold management with polling-based recovery
- Hardware-specific scaling factors and threshold representations

Voltage and current monitoring can be independently enabled/disabled
by firmware, and the driver automatically detects the enabled features
at probe time.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
Changes in v2:
- Reworked the binding from the generic qcom,bcl-hwmon.yaml schema to a
  PMIC-specific qcom,pm7250b-bcl.yaml schema using exact compatible strings.(Krzysztof)
- Dropped the DT-configured overcurrent-thresholds-milliamp property.(Konrad)
- Renamed interrupt names from "bcl-max-min"/"bcl-critical" to
  "max-min"/"critical".(Krzysztof)
- Limited the binding and driver match table to the supported PMICs:
  PM7250B, PM8350C, PM8550, PMH0101, PMIH0108, SMB2360 and SMB2370.(Daniel)
- Folded qcom-bcl-hwmon.h into qcom-bcl-hwmon.c and removed the
  macro-generated alarm mapping helpers.(Krzysztof/Bjorn/Daniel)
- Reworked the driver around per-PMIC register descriptors instead of
  generic BCL generation/mode descriptors.(Krzysztof/Bjorn)
- Added support for 16-bit voltage/current input registers and
  SMB2360/SMB2370 2S/3S battery configuration based scaling.
- Build hwmon channel information dynamically from hardware enable state
  instead of registering static voltage/current channel sets.(Daniel)
- Improved alarm IRQ handling with per-alarm locking, wake state tracking,
  shutdown guards, and explicit delayed-work cleanup.
- Switched probe/error paths to dev_err_probe() and tightened BCL enable,
  regmap-field, and hwmon registration handling.
- Link to v1: https://lore.kernel.org/r/20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com

---
Manaf Meethalavalappu Pallikunhi (10):
      dt-bindings: hwmon: Describe Qualcomm BCL hardware
      hwmon: Add Qualcomm PMIC BCL driver
      arm64: dts: qcom: pm7250b: Enable BCL sensor node
      arm64: dts: qcom: hamoa-pmic: Enable BCL sensor node
      arm64: dts: qcom: pm8350c: Enable BCL sensor node
      arm64: dts: qcom: pmh0101: Enable BCL sensor node
      arm64: dts: qcom: pm8550: Enable BCL sensor node
      arm64: dts: qcom: pmih0108-kaanapali: Enable BCL sensor node
      arm64: dts: qcom: pmih0108: Enable BCL sensor node
      arm64: dts: qcom: smb2370: Enable BCL sensor node

 .../bindings/hwmon/qcom,pm7250b-bcl.yaml           |   64 +
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |    4 +
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi          |    9 +
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              |    9 +
 arch/arm64/boot/dts/qcom/pm8350c.dtsi              |   10 +
 arch/arm64/boot/dts/qcom/pm8550.dtsi               |    9 +
 arch/arm64/boot/dts/qcom/pmh0101.dtsi              |    9 +
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi   |    9 +
 arch/arm64/boot/dts/qcom/pmih0108.dtsi             |    9 +
 arch/arm64/boot/dts/qcom/smb2370.dtsi              |    9 +
 drivers/hwmon/Kconfig                              |   11 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/qcom-bcl-hwmon.c                     | 1443 ++++++++++++++++++++
 14 files changed, 1604 insertions(+)
---
base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
change-id: 20260720-qcom-bcl-hwmon-6d602c195eab

Best regards,
-- 
Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

