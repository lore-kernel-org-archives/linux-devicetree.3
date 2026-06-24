Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F014F3E5577
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 21:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335330; cv=none; b=dwmlJnhKvQ/gh+Vk79V956QmHW1j4TkM/8f1xpucPNT6idPKVvbbo6KfL9J4v5e1jz7X2l9PumPLdAq4beZAx6prTqxazGyRoOCSEKZSa0RfmRHFgCan8oa/mymiKAFqTqmAc+FG6Q4UJT0hyOQ2FqqP4VsIBFYTVWVmxlm0oLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335330; c=relaxed/simple;
	bh=Pjwum7Mu37SGUsunaTWf37R6DFsb2jzx4XAajClW+OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oQjCDGBb57WgtWtcgbGpjRG4VcE7hsY8CzhA2lPPIxkOcggUEp4DWlw0IC9NfFbV8PNZuJGO4egrI9WkTJ36O/UrMf4aIRzuUubpr/29r3NQQ5Y3NsLTjFRuHKEtGTeql4JP61ma+teb5e8jbZpicZ6TrfZcLMREgcTNvjs/lsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0sSUk6Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xt/+3sIA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0sSUk6Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xt/+3sIA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJitm63827693
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 21:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NF98u5m0GQQqjMpcochC97YunhtCfm5cQBU
	9SMM1MoA=; b=S0sSUk6ZPVpbTTVHkgCEqN6NrMf86QEsRvckN6CEFqZGTWSY7bE
	SatDPG1P2jUm4JortNy62OspvSrafgfp3ojHAVsdS3yrf1YHhlNg/37a/J6FVkBW
	ald8d97dEZg02qXft2Z0Aw+qoCAOSFP23TEndFxtQhCd5AZbPTVcZtbcmVM/+/5l
	ailHfBe35IQfwLf/KL/JU0kx8iHGfp9oSQ1uUFsJ/7n4QZ2ebanJ3sXwgO29RzlE
	kDZs8sxRjBYCMXd/HGtJk+WmlujnXxhrvKQswQrIKUXi2GiJZjGnBKe2WetBNmcp
	nDOoD3d7FPbycoelp7536s7jStneujENitA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbrhkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 21:08:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-921634eebdbso176616785a.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782335324; x=1782940124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NF98u5m0GQQqjMpcochC97YunhtCfm5cQBU9SMM1MoA=;
        b=Xt/+3sIADniznDJADTMCIyylipdPmXItDJA0ivWXmTM709Rz2OZipDKJHoMTSu9vj1
         v5di1pbaVraQQaWaYzBPV3fjjhlyf9YoghcoP+QVo8RefRQ9jNDf91KGwyQ8ZteJY+BB
         Ydzvzz7lMtzN228Y8OEQrO3x7iEVKojgIvup2xEOFrz4GwXbZEnuHoQnUBqCS/t82nFG
         SyTXeLcPvkWL6hC4GWTZnQBEoJvPp+06H2H5PVcX9tFqJEyte7tnoOJmEkj5vtjA9/gV
         SH77Ehgk4ub3UdJ9F6UyqkWeivugDFu2nC8zaVK65GEnn1ZdVLr9Ts7WF3KAHXul2yhm
         a3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335324; x=1782940124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NF98u5m0GQQqjMpcochC97YunhtCfm5cQBU9SMM1MoA=;
        b=a31Flpma20JGnCTH0KVD7ii+sC8q7lNeqPYXq8lTMbpchPSIurJ7S2wuAuELtlRUwB
         Oj472bfPSdm343OFyYWLVbd+6fywLjBJLnnrMDLpre4pJlnr5gK5WLB9g/Q5nKIfz/Az
         Ru1d1SiGLoOYdBhkiV00Nz91ckVLr2AckRAtcHvEOAxYmOP5UVZlZ48g/BjNnl/MvW82
         ezrDvUfLiZbgrMOOYh+mItpE8PuExSjqlb7OP6+sg9U414n+gC9NeIW2vgwQoPbf4LGH
         bLoCQwra4xg7TZBpuy3BC42vEDE5jTvTpxR4TBT+EM9+bhaq2ixstUtNUaj7jZZbLHdS
         uyhA==
X-Forwarded-Encrypted: i=1; AFNElJ+3WBQainC2h6XHcs45XiAaHB2SjjyYqcHiafqvatQzFIWpmw1f/zu7rgHBgcDvooukg2GLfnKjfq6P@vger.kernel.org
X-Gm-Message-State: AOJu0YyuW6tjxle8PK8M4ZEl2ighW4dkFxL66LnEDPDglu5FrqUvySz8
	cp2omqPKc07RM7o7RwbyBWxXnh7Dee71CcHiFrHrTCZqJFnbRwQ1zE67fnatrVw5+PCvcwjEh87
	HSwO7+X+hfDMccnLKijm3P8NjKD9jw3P5z+TS5DBCEgrqqC09r+cuUggo+FSF81oZ
X-Gm-Gg: AfdE7ckGp7E5g0KMEnPCdNGKbepplHls7U5Tr1JXCM1Uc2Hc9xCu4dv5tHulcWWdoVq
	o7ellLJSlboSOnQd1Gi9hXAx67IhPoLaR/TzqZILc4X1D1Z6g3O7k2H4oDUHiFgynuiU7dqRQKD
	kk/zAlrQ9CAsjHekf39P0ZQ2cqsgKc9i6QfSsyhpSx0iggWB3ZjxSYw03D/2bjXWVs7Py9F0O9k
	XppttjQehUgNRsBt0CXU+FAJLoNL/nkvVEWKI61yOqNN+KJHa9B9J/wdmVqG655x0LwiUwCbBES
	nWjRjmPkPnVgE/mE8jG8H8BF3/c6C4lhw9k5m/ifRv6lv+zNSlQnTUuG4zI1NXpMH85t2sj9/wv
	w5X3ATLr7d661Km9kktH5dXhlp4nl80Hpse4A8HvQ6ytx4g==
X-Received: by 2002:a05:620a:170e:b0:8cf:c106:faca with SMTP id af79cd13be357-921d29f8690mr3323305385a.36.1782335324224;
        Wed, 24 Jun 2026 14:08:44 -0700 (PDT)
X-Received: by 2002:a05:620a:170e:b0:8cf:c106:faca with SMTP id af79cd13be357-921d29f8690mr3323299885a.36.1782335323714;
        Wed, 24 Jun 2026 14:08:43 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:91ef:5c1f:e854:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840efdsm9455767f8f.5.2026.06.24.14.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:08:43 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 0/3] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Wed, 24 Jun 2026 23:08:22 +0200
Message-ID: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfXz+yLNc2UG5RG
 p5gjbaXpRQiwI6JokUn9Pka/QOVlWzuOOV7zruWIExDxPihK20hnldCGD1lTh/hhu8/k8JYZuY3
 UzjJzX1q5kWPz1nqt3MTTtBbwZRW2ZU=
X-Proofpoint-ORIG-GUID: 2F9QOVDA5hmf14_J4IOYYhUVFLU5mbwt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX1/6GVm7uGWup
 Mj3PUIa7e2KlPKEun1SNoyUmhzxmFJKR7qoMDMHUET1zgh5Dh86jxsjhPoPLlcWiSFIfRgZWTQu
 xZLj2vdYzuNztptzJj6P1G+yGfzHmZ1Cc1WzVsZPly9jxYcQCk/adAiWAji2fA+9CMcUjgPjvSm
 vSfe8253EBB7LmiVYdipXqWGrMDqCXKGYeNx2Ssv4gf/CrE6oZCVGxX+WB9SqnV3O+QqiBLPL/4
 k12dU4F4YZCSdCyqdfN04ZthIfZu2SWvOM0eL9cYnd1hITSe43VtKYsPjSVwlXH7/k/aOwGPezi
 8ZkXweO2dGzKOFqCv9ZPv7cgburn7sf1R+M4r6k080MVHOQzw22LTIb4x1N9z1Dyo1Kw8hz81NT
 PtVF+SMsiNTwGtuIgNLHueiip6ABLbFhF04/9VKqGSbCNCLGdeap1UB0SPYsW7xTfyGYdYQKieP
 kxMAkpZxzeTdQuyuC6w==
X-Proofpoint-GUID: 2F9QOVDA5hmf14_J4IOYYhUVFLU5mbwt
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3c475d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=kbYhDkqKViOJv1L1JOIA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240177

Hi,

This series extends the Lenovo ThinkPad T14s embedded controller driver
with environmental monitoring capabilities and integrates the exposed
sensors into the Linux thermal framework.

The EC provides access to several platform temperature sensors covering
the SoC, keyboard area, bottom cover, charging circuitry, QTM module and
SSD, as well as fan speed information. These sensors are currently used
by the firmware for thermal management but are not exposed to Linux.

The first patch adds hwmon support for the EC temperature sensors and fan
RPM reporting.

The second patch wires EC thermal notifications into the hwmon event
framework, allowing userspace to receive alarm notifications when the EC
reports thermal zone state changes.

The last patch exposes the EC as a thermal sensor provider in the device
tree and defines thermal zones for the keyboard skin temperature and the
charging circuitry temperature. This allows the generic thermal
framework to react to EC-reported temperatures and apply standard Linux
thermal mitigation policies.

With the latest patch, this series fixes thermal issues happening on
this platform where a kernel compilation leads to a system reboot.

Tested on a Lenovo ThinkPad T14s Gen 6 (Snapdragon X Elite).

Thanks,

Daniel

Daniel Lezcano (3):
  drivers/platform: lenovo-t14s-ec: Add hwmon support for temperatures
    and fan speed
  platform: arm64: thinkpad-t14s-ec: Wire EC thermal events to hwmon
  arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
    and charging sensors

 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  68 +++++-
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 193 +++++++++++++++++-
 2 files changed, 255 insertions(+), 6 deletions(-)

-- 
2.53.0

