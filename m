Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37868409281
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525779; cv=none; b=CrYTxBaReF4jPZXYEnAdYtvATkkPVnECIN1smFgLQ/QaUmkvCcIW+B1zXJGZFW2Mwww609WGo5uLYhMTBYvShTL+n9g5MzLOPtu/nE5lu2XvMNkPasWdG0FJYpAcBjZzyy86Q7EphMeL3UGFAH3EnxVWS2F/yVoYw/MoOZsqrQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525779; c=relaxed/simple;
	bh=wUd67YiL92N1CuDQkjv30mUOlyPnJuhWDtLVGtJpBzE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qN3elbUhSdB4RVejqRPhJK+uw0Nj7AbrGujmQJzVOU6yWq5gdVJTMiUl+2JpU3H87+tfMaMqw2Co/BKpZr8Qq4+0JIa/E6dUCy3DMs9gWJWjw2tDmP6+Jeal9swIg3SdeCekR2os/8Vsm8lLsVv8JUmm3YakeE0VhGIRJHoE+18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RE5cRXpa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDF1J+jm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RE5cRXpa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDF1J+jm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668Er23m3100840
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 15:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JcG5NAumK7H9WvRDE3PWtG
	/QK2YaOaSq9r0Xqz7hK4E=; b=RE5cRXpaO9LV2ijhbIoNcQNJvwQgzzBuODHC1Y
	2pssHRmS33Engo/zx6F/Ba6LKHznhjJmvW0NxRsbg2q4vCfN5MP70DoxHZWfgVLz
	wPhh9fxOieArtu0ExLQ8KSHT33SPKvGX5ufJ22ALxm1ept9i+ufAQQPOBSsCCALO
	y5cRVb6zj/kcWW+lTzyAx4QI8NftN8cEO4VuTQl7xhakgno2cYSDrDfY7/9tpiaz
	0MuzazPtowoLc+6cq5ogkAMdlfQM42KbKiBEfmdmB+fw/QzYO4GTZyXuTJdloNc4
	VHY7yVM0tcSxMfuK3Q/556tcbFqHM9b5+fz/xiz/wG86nuHA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq308t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 15:49:37 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-44aed65b026so2408645fac.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783525776; x=1784130576; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JcG5NAumK7H9WvRDE3PWtG/QK2YaOaSq9r0Xqz7hK4E=;
        b=dDF1J+jmNe/VaD4dODWtK8aD8bIWS0NFrI8A0AWVvgQrM018UFR6UxvFeQt6kiQeRI
         EI19Aydwx/Hl0Fuyei3MiZAaqcQITY0mSAXoqh519EddYuCJQCybGRc2dhgJtLgrpo2/
         M5dZcL5Q30Rrvvp2VIb3ZW91iKRc1mhHX5AT7VxdW2bS3VMfo7JgFWVqxKdk62GoUBSf
         NBmRSEukE51HWrg63OtDUvOcyCG0JOkNDi+dE/maAqRxfpO9oD8b0kpxyXC2vss+VyU9
         9pXPlJclrwYcJ8EF8unNtdZ9XTkRYQwJ0AQnvR+Ql44k6zLHg+kD14wxsHSHlg657AH9
         Jr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525776; x=1784130576;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JcG5NAumK7H9WvRDE3PWtG/QK2YaOaSq9r0Xqz7hK4E=;
        b=b4Z8BHtIrpm1UKHPA6eqnUhN34m4p5oADXzE8EwCFOWfd6W1ByU6FPKLeh8EFh8w/i
         IfpLO6FlHeKLXBR8zl5vh0Lcehejcecu1QQt3LvBkeS4JYOTjWznQb8JVPTL9zv5bKs6
         kP0YCmQYnBhP4Gg10e4Sz/D4xcebS0NLoF79TvnAC0ckFvsqs5RFbJEJjPRzsrWqHQ3C
         1DXsfLgILwvniL1h3UTSpQH6BYOAStHyypZaoDl6Dn1Zg8gZi6quwAluYljqJVs0yImz
         K8XexGtPPx6cNKaltcnysz1ZPKRqKRsKW3aeoOV+AwKhBvSVHejXkCptwoTvYf569ZpJ
         uuKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9i3zZJAedpQk624wIUw50yImkomuYuXTIfbOqvfGjqggS0JCeD+VL96IUd8uK6fslodtZvA0ozUL33@vger.kernel.org
X-Gm-Message-State: AOJu0YxBBUXIvVOEOVWJR/kC9vlE0dA2E9BpHHpD34ABpYYpc0wPOS3h
	dy13YkGPj3br9ccK+Gh8Khlowp98+NNF05MVl9kHrSOhA/fPV/DWtdJpxwcq6TMPLVDxoObP1yO
	dDw76n0IMSpbYHH7k+PiSw7lHEAQoc1SqP4G97qOfIxFfVokEygP7gU8P+Z4ivSxS
X-Gm-Gg: AfdE7cnQhgRKKHenWPfyjw4vQL7ZZIMmM8ujB52xlMdTV7pekTq281T/2v2oJikr4k/
	XAV0w1yC1WBG2RuPbxB44e3qNvmU8GJMM7Qy84vdWMxp3+/dK2bUfJ3FyHbWTy2cvpxtViu66Vz
	9moCfoHY7Xos41esDIytL/m2AizThjRsTnl76qvUwottwcSnz1WnntkFuqg545isoesea82qcsk
	lnLNTY6dYzFQaxPsj4bvriTskqBqPVnoYbMKUUYnyvmO1tdZ6rbfQZyq0HPlQAf7JNF9ABktnXu
	SnrnOu2u/dTCtw6/UKaaYK9RcSAql+2NpZgezJPBRD2BX4vROoOkSkaDQSMhXuxIB92z6Z4OBjJ
	PVCGg84IjZIrOt6HPBTYXP6QwCvTLCU6MrNMSCq14
X-Received: by 2002:a05:6870:720b:b0:44c:5514:80ae with SMTP id 586e51a60fabf-451614c5ddamr1814269fac.3.1783525776398;
        Wed, 08 Jul 2026 08:49:36 -0700 (PDT)
X-Received: by 2002:a05:6870:720b:b0:44c:5514:80ae with SMTP id 586e51a60fabf-451614c5ddamr1814150fac.3.1783525771133;
        Wed, 08 Jul 2026 08:49:31 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb1d1ff0sm17014022fac.7.2026.07.08.08.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:49:30 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add subsystem LPM stats support for Shikra
Date: Wed, 08 Jul 2026 21:19:09 +0530
Message-Id: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHVxTmoC/1XMwQrCMAzG8VcZPduRtmOKJ99DhsSauqBbZzOHM
 vbu1nnyEvgHvt+shBKTqH0xq0QTC8c+h90UyrfYX0nzJbeyYGuobaWl5VvCk4w4inYBTDCuDuf
 KqzwZEgV+rdyxyd2yjDG9V30y3+8P2oL7hyajQQMikDcBd44OUaR8PPHuY9eV+ahmWZYPtsLHp
 K8AAAA=
X-Change-ID: 20260624-shikra_stats-3f01f136fb4c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783525766; l=2751;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=wUd67YiL92N1CuDQkjv30mUOlyPnJuhWDtLVGtJpBzE=;
 b=VqUNuVF3rBM5zgM76aTOedwTuZf2nHzAUrkIpGu7S119mOzrzhGvHgMgNc3was7IXgQPSm8pO
 IYvopsia+XtAEQKQC7vuJPAmDOW1asfmClVP+qUMhjd7m5NlqD3Zoq9
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: TVH2NclwlfZG6PKMl6rX54oZ_fyMelOL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX7tzNB5LyeVbL
 3uf2CVGYe/97aGulEV0njbKuS8U3JAucH160InfhjW0KDVkxj52xgP5Aion+Yqs57FHKf0XnNuK
 clKXh3QdU8vV6v707ttqAskYTuczpUMXVRpBw/2i3617tbPsIhPMiz+vhwJ6f1VaPq7JfnS6hQq
 bMNY8Vcuf7O3Rp0mA2nBARJuD4OWdE5GyWO3Ctk6Ze4OufBmwwAKTFi6Q4MLkarfVKdWBllHqaN
 zGL+tB4q5qdJDbdfy1JKzSrTN6usASKXLC5QJjAC7b+6RaXABdM0+0L8icx2mNlSpUtv6adsfzL
 mEihVal9rKVf84Jji1g5H+BVRp4tu3GAcCzluBGcFltFRdN6s2BFpzW6LUWKi9XufQquQZEYzQD
 umrUZehdsA7cHgqGZkrpsh4eODgJyM3Kv45Ebu9XEg/gJAWXJk8F48UuXdUaNnZZdR7yEXxpxMJ
 ny1UCSG8YVikVh8bkqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX7mKBvY7Jpwsk
 Vg0iFPLilDTyLbTxqA2Av4dycwTWUuUS1LkRDBzECGyZe/hkeR3ccyJ2ZhoLlLsnj/XFzmnnJfm
 1mhMUZQXs9dYNFEQ/32udcVa+emyjT4=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4e7191 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=feAlyiVJtFiAF33yB5kA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: TVH2NclwlfZG6PKMl6rX54oZ_fyMelOL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080155

SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are
present in SMEM for Shikra.

For earlier targets using RPM processor like msm8974, rpm_master_stat.c
was used for subsystem LPM stats since those stats were populated in
RPM MSGRAM.

Here is a brief summary of previous targets and their stats configuration,
along with the drivers used to display them.

+---------------|----------------------------|---------------------------+
| SoC           | subsystem LPM stats        | SoC LPM stats             |
|---------------|----------------------------|---------------------------|
| msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
| msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
| sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
|               | (qcom_stats.c)             | (qcom_stats.c)            |
+---------------|----------------------------|---------------------------+

qcom_stats.c supports both the configurations for shikra, reading subsystem
LPM stats from SMEM and reading SoC LPM stats from RPM MSGRAM.

A generic "qcom,rpm-stats" compatible only reads SoC LPM stats like vmin
and vlow. Add shikra rpm compatible and config to read subsystem LPM
stats too along with SoC LPM stats.

Below is an example showing LPM stats for "apss" subsystem with this
change:

cat /sys/kernel/debug/qcom_stats/apss
Count: 2192
Last Entered At: 5498618336
Last Exited At: 5498708046
Accumulated Duration: 2046572620.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v2:
- Edited commit texts to better explain the changes.
- Link to v1: https://lore.kernel.org/r/20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com

---
Sneh Mankad (3):
      dt-bindings: soc: qcom: stats: Add compatible for Shikra
      soc: qcom: stats: Add stats compatible and config for Shikra
      arm64: dts: qcom: shikra: Update rpm-stats compatible to SoC specific

 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi                       | 2 +-
 drivers/soc/qcom/qcom_stats.c                              | 9 +++++++++
 3 files changed, 11 insertions(+), 1 deletion(-)
---
base-commit: 4c9d9db1697a873f78d236b4ce304272206238ac
change-id: 20260624-shikra_stats-3f01f136fb4c

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

