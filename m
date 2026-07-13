Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E8E3A7F69
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930634; cv=none; b=XmKVWG4A6cyjH9B866Q7N59lk9kx5eV+KOVAymMwdPK+axgzu1d6BoiU1HPELHjQLfbxmguSc5Ban7YwhqCK6AYPZjdYH/mITEwityS0moE819/8rXsRpBoVmrAxMdzP/lGIGhkpldDXxaq43aGRXLSHcBYtmWZHEw1ERH+K9P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930634; c=relaxed/simple;
	bh=EkS2NxhaF1JLdwk74M/0qpNfkeKcSxyAcb6Dva9JVqI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aP3YxbEKjKzst/pOGH083MRp+Lu4VbhGtPJIrsTG5/3t0JDOlzlid3wRB5rujM7OLrfFPVuY830eSwP+HS89ty1IvS7bpciHEIIl4/k04glmBaOtlR0IAw6cWNJfMmd2NXOIWafSPkGh8nidlJSspOCzrqbHxT1S/hSYoQ2B660=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmvaZee4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NKcBvTB4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmvaZee4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NKcBvTB4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NxIH674503
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GKCYIswJ1jHXrqBY3IaNQU
	AcZZL3eg2SpL6mGB+kCpI=; b=LmvaZee40QRGf58z47ZC0R9tbQGPDaYQnSblAZ
	5u7QQrbbhUn+uEFTaM6udvuWhathjdhYoiSwJQtgUFBdqV7lyjRRRmArEnmkKty5
	hSDrJ0nodL2or0C2DLjuemovqjyzF06DMFN2vJdd+3hPHue7Uz0jpfYUq9ZMNO6l
	UiVRYKT1NeHU42mTCnFSdK1LfsfwFeGVgSxpUwbyKmqOcHye0bZAGgkYVKApUyWC
	oGR3Av1Sxkk8zD2NwEa2W1ESGgEvWOVV5jkJnaTcPl3RMp3eZp4+89Df4hG0Cv82
	1dvVe2ReUOJ4Pg+8nO9XegNWrMg3o3vT4DWeiOUHcrnwcRsQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgn5px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:17:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so7571090a12.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 01:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930631; x=1784535431; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GKCYIswJ1jHXrqBY3IaNQUAcZZL3eg2SpL6mGB+kCpI=;
        b=NKcBvTB4hjbvUD3plHLC/84UlMPrTivg00tgV8nyc3RO9AWLn5FUxDTX1qH9ZXeI5Y
         Fo6Sm1N0a2kCRBG9ZR3kip/dBT3cZS279Ebd/WPH/qZLUv6EyTJ08dCps33YvRbofAfz
         fbV7pxbR7DMaKj009t6FN8EV+WVWPD0xFgXIK+fT20JniNYLconC59h6zpUKRA8qiJ4S
         LRSaiahVgOHi1tdX/EEtFW/u2iwsoQ524xAQ/kLLIoU6JQ2TQDP7Xm6LVSKy1H0L0k0u
         U6JVtrqeL8b31l60BJtXV9dR4EL7qvG/wmS50I2wrWhxrt8mgu/laNozJSv0+NACKaSJ
         o8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930631; x=1784535431;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GKCYIswJ1jHXrqBY3IaNQUAcZZL3eg2SpL6mGB+kCpI=;
        b=oAhcfSPN58ApxGbtvQQJsax1gcbZuYTrgPfIhJxNJsARZpJCUixZYmh7HCRlxyOgPF
         qMfHEZg1S85z9Ycf9XSjHXvqXvypnfJ3wp00hQMVeuMRkeo/CWcePhQXlIhjDj4OJKB5
         tVjGuuf78xS9elopDpejOsZfMhiloW2LsqjAxt7rmt3Nl+TTRwq+HY1w4vgiTmaq9yns
         xxnmAzyjHZ6M733nxUu1nl8qgmuF/B9oX/Q+UBOKAakoqftJsAceQi5EdnDV3HPsfRmb
         FBfQO3383kOL/3PQ2N7NpXs9QNrKu0nIqk190m7bB1Nra0xOtGxtEHP/0aBfgEVWVI6T
         BjFA==
X-Forwarded-Encrypted: i=1; AHgh+RrrF8d7LIUPZ6g7PR6oQC43S2AKtlMkUgCiiyQqjGgU2R3aYBis8FMEAZq7lt1C8kyso2ohWZY1pnFM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgl5bY8GkA2cgtThITzlAoS9XWChmU3jftUaUCsVwUybNbagXa
	EzyYo6qEpueFSmOfV+ts7XxH5LM6FlMwzFk5QQVIrqYNw71Gg6hvoAp/CZ7WFUbvr9bcmr2e6FM
	LUO66UfyzaMsRdSmJZSfBOLaVWo7MrYzwiQdb6yVvvTNSQgCohP0+YqIFeiG74ads
X-Gm-Gg: AfdE7ckHvpMNa4XWp/OfaGrbVFURnjMAuRP1cXRJHuR/v+myIU8YsUdV2TkWkuE2UM8
	9VOFkwVnKhjvj3Unyafg3Ctq7OjrP4jQ7XEYgMv8TeajFUJc7tUAgut9pQ8/811RdupTVoatVRW
	SBh/zfd+f7O7yCOkwlOEFIzzKB+ab/dBMa89TNJTHuS1dZ7zW7WZUwvirVQ15hBL9iv5JvB+8bu
	lfJsqPa7THO1Kp+KFgAhCynVE7QqxbOC6m8rJRJvFyHEq2Mo/nqhy4mCv91PCKrmLlbXFM6aYdl
	Rnbl1KcR/Ra+ZrgiTZxzaWe4o5FD9baiivevqIuoezQdI0zbypIl3n7dsk7SxtGAauVHV/VvzPs
	zMZVw49OuqNC39pI618lg3Qej1oB11J4oK/T/g2cD
X-Received: by 2002:a05:6a20:939a:b0:3bf:9fe1:c27 with SMTP id adf61e73a8af0-3c110b4566dmr8834342637.40.1783930630621;
        Mon, 13 Jul 2026 01:17:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:939a:b0:3bf:9fe1:c27 with SMTP id adf61e73a8af0-3c110b4566dmr8834315637.40.1783930630186;
        Mon, 13 Jul 2026 01:17:10 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca79aff904dsm6283954a12.6.2026.07.13.01.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:17:09 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add subsystem LPM stats support for Shikra
Date: Mon, 13 Jul 2026 13:46:53 +0530
Message-Id: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPWeVGoC/23MTQrCMBCG4auUrE3JT63FlfcQkTSdsUHbaKYGp
 fTupnWj4mbgHfiekREEB8S22cgCREfO9yn0KmO2Nf0JuGtSMyVUKUpVcGrdOZgjDWYgrlFIlLr
 EurAsTa4B0D0Wbn9I3ToafHguepTz9w1thP6GouSCC2MEWImm0rDzRPntbi7Wd12eDpu9qD6N6
 sdQyaihXitUBUps/hjTNL0AuO1kcfMAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783930626; l=2924;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=EkS2NxhaF1JLdwk74M/0qpNfkeKcSxyAcb6Dva9JVqI=;
 b=4ZCjN/N83A+u3npQyJdTtNl/C14XjtDFuMlH4SdU9cI+wFC4qMKdm+sMEiMR30VbodD75i9yp
 JFcfPuBfdpFBcW45qIiiqFlDx7YNeMU8HCR3Ka0ly0jhogJ8AbOnRtJ
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfXxcVvUuHBnRhA
 K3UWEfvW5fpx2dZ0s5M01vcJ56MwwzUj1ErpB12rGLfWpMLXfyMKhn553hCQObdUONYAYUi+Lr8
 6J81qMvFvm9kL+qSGZevBgmOUJ3xgfo=
X-Proofpoint-ORIG-GUID: ZjLjt3UKOfkvr4xGQP1-c9i2mW8g_Cxa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfXw68vr6s5URQb
 fJx8rGMRegfdAf0hmM/vY8JEsx5KuMS09FuRW6diNZBWoP08vx3U8tgk6diB1JtPlX99ZnbPzC8
 6heosc9x3piA+5DL9vwKZV1foTAg2G7ovkt+znt/d9gPnu62qflLErVtdcNMWbRFUdbYO5dkOIs
 jCyAnU4QM8HHbh6v3J/oFVpMLKfxQGhh2T0vmxj2nh4D1IXmc9XWMwLuNtG6F6buUF/r/oSHy2E
 BqKFckrac1xy4LzxcExR/l+d9K+sWJdZ7fSXAKujUiYGAvMckQVA1oxZiI4aus1mCLADDCtqvIY
 pHoW517P6s4ll7d9PsFurQ0NuF1oQJSVLu6e+AQZS64fQrDJ5nJgJtdAuC3WcfWqjIISoKoJU3v
 pD8gVHEP8MoD2KbdU4GUyzv8R8IxA6hukUi/minwd41HmHE6rNgEJv/R+xV8OFI6sV2G0LGScGH
 Hc65ijbh/WEV/iRfisQ==
X-Proofpoint-GUID: ZjLjt3UKOfkvr4xGQP1-c9i2mW8g_Cxa
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a549f07 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=feAlyiVJtFiAF33yB5kA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130085

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
Changes in v3:
- added back "qcom,rpm-stats" as a fallback compatible.
- Link to v2: https://lore.kernel.org/r/20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com

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

