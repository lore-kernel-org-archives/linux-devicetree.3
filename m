Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553A93FBEA5
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 10:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494101; cv=none; b=oR+Q/onI581fKhea1JUJLvMp1OpCWUl2sBtCtGxNTc1GKYzE/zo9f1z75iwxd+CkOgmnBeRbPYZRfXljv+Q50NodMh9+nVpLYxb9icItM3UYyGoa9FkJUMpwFN7EbXLmknJ/a9ITyWvSB0OR58ilwyoVbGgRBJG541a06DOf/bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494101; c=relaxed/simple;
	bh=rI/lfG2Xr72NFRsRzf5qgLaHupNxEHCNQqk7ZN2yaEE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LdwW3DmoC1sRSAilWR22cq55HReleUHZ2LP2GXwH8Ve7Ht4Yhwy6WqK1qTwUS9OEOwm4N5eb+eJDmgiT9z1T6cyWhP1fvc/9kBtLJpcgtpxUKyPmU0692nIG0nTubAY4Ap/iR0VN8OdioruxuuipVitZPLVoUr8bY412stbMx7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OMYbCM6A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCjc2FCh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OMYbCM6A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCjc2FCh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VAC4M63512556
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 10:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bbZ1VYGbemv9hkAxGz8eqE
	80wo4ePN+9/sZzn85BIZw=; b=OMYbCM6ATRI9pbWSrXujxv5jBeCarwdA0rrPzA
	/7LgElmQNkQb9OaWWFEZ39+H0lP4ncafyHSRkr9ZSFoD2aPJTUoPhYEtIzxPsHhK
	ObrJO/IPgkAoIB2xXr4ID4UfuTNk3G18SLMieQnrxwxn0vf/PFC2g7s4BGmWIgQo
	ysDoWTNZd+k2QuR8Nfj5eVclq8JaXITZtGUq9zf0Alx/mp+8Fp0nSorUO5hkowgM
	bh3LEmSmmSSJQ7+fL2OWu3y4v++MwJSHz2W5kHcefacYqD3uq1CuxQIp6D1lHg0o
	0HJT0w+MOlERn3F0OwSN3yGT0EmHLmepEigvdPRP5hl5pF2Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frsf2g4de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 10:34:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so1453457a91.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 03:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785494056; x=1786098856; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bbZ1VYGbemv9hkAxGz8eqE80wo4ePN+9/sZzn85BIZw=;
        b=hCjc2FChe28Hl2EbnP+HUj8DrntLifB3TZ87F2eFLXgyA3Y/BUDmXbkVUzvWxovHL/
         vu2aZ2/ESmArrk5p7s0ul3EjZ36b1x7TbDkILxFuo9+5UGztfxlNPwcwwWdP9eCw1Zv4
         t4XwVwF7iWYoKa6GXSk7DPki76xpUL2fiXByKxdkjVVlPH6xBeWjFghtUHHWXNDOPu3s
         SsQXl9aJZw5uy0tePd5m2S4b2r4Gw42rSJ1lv5WOlGV0gDG9SQT7+Yr79+ye2HI5SWWO
         lUDjdk89B6k/IAG0XB7LK9cCxZ1Clhf3ngUCIJgaS0kMaWPZHlJRbJRfmsgBAL0fngj3
         VB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494056; x=1786098856;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bbZ1VYGbemv9hkAxGz8eqE80wo4ePN+9/sZzn85BIZw=;
        b=fcAebJH9WdkvwSEkwHLmnOhzpFE/8yb31GEQ2jltGr5wI5QWveU389XTaC/Oidk1TO
         gYqtz86Flp0WyqDnZveJv+3ZL7QAfkO49DSJX4WhtuPxaAn8yaDsVyX/EnVSZEbFosW+
         X6I/yiveK+fneME8oJKWrMKa892sxgSFVPKzLmmhJGxP4RkLTkrRO+ntDqGHXQz4F0jK
         FMjLB98wjrSbvocl0rw3Jr24HfEM0ievo3wHjv2IyjtHN8MXWlvu3upG4dVTK6MKl8Ay
         PLTBO/nw8rakOKITt5ByoWipiIZUsKjfQ9M5SH6cKMQ7hmuq3Fbb1OT8n3XJPmWTcufh
         +KZA==
X-Forwarded-Encrypted: i=1; AHgh+RpLg7qZZGm62od/m4mu4WDyJcA7a7g/1gWDmxYPj7KGYVitaAUSV5Rt/PmMKe9lKxVnS9EilZ1XhcJe@vger.kernel.org
X-Gm-Message-State: AOJu0YwiME2UcOTdTX5t0g6MYKs1yfaxYnULnEPrztLKK66pS4I3TUrk
	xxCCLVgvxLp65+U83Wfh3AWjWXWEFLnMRg9FrZzaDxVCDqpEgTuzhSsNLduu6JJVipl1gYln9Uc
	mCHonLgsTZIJ+7WzxUEMnQNi4BG4ujURgVeWF0/G4dx8T+udnFLnYG2ao3AlucNsa
X-Gm-Gg: AR+sD10+tyRG/goKZDOsBBfwWjP6HUNBU8yvcVuxWw3kjSiNZDjYGpteRpcL0+Erfxp
	nAbV3UqKMl6ZxOrQOsCou4GB3gDepKWN6ZzT8kbtane8fvHBBu9mOhYjHSSNTr22oCsp6Qbk+ZV
	M0qIGYvRiZ90pAYEWilr4nNvIQ/bPgUhZnc93qy30TB5uJAin2Y2hRgnjXN5+cGrFFE0cmVCkQW
	19y0n00p6Fc9D1SOYB5Uu4iUpldR09O0cGkkWbIVjrTKclw3nQ7iB31lHq2cSD+ucCMkv3VLVPf
	0/DWEle2dwK1DERxLIgBphkCykPl/osIEzM81tf4z0vLfdfZKFHCH1YvmOwRp9xI8ZtrA1JOIAM
	WwYrwwtLll524RCBih4/Zdv3vfRJVJQ==
X-Received: by 2002:a17:90b:53ce:b0:38d:e658:595a with SMTP id 98e67ed59e1d1-38fb10f1042mr1505596a91.2.1785494056355;
        Fri, 31 Jul 2026 03:34:16 -0700 (PDT)
X-Received: by 2002:a17:90b:53ce:b0:38d:e658:595a with SMTP id 98e67ed59e1d1-38fb10f1042mr1505541a91.2.1785494055699;
        Fri, 31 Jul 2026 03:34:15 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm8493680eec.28.2026.07.31.03.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:34:15 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH v7 0/9] Add support for Qualcomm remoteproc subsystem
 cooling
Date: Fri, 31 Jul 2026 16:03:40 +0530
Message-Id: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAR6bGoC/3XO3wqCMBQG8FeJXTfZztwfu+o9ogt1Ww7SpbNRi
 O/elAiDujnwffD9OBMKZnAmoMNuQoOJLjjfpSD3O1Q3ZXcx2OmUERAQRFKOqxz3rcNjq7EGZpS
 2tAIFKA1ug7HusWKnc8qNC6Mfnqsd86V9M4R9jJhjgplSQFVRU6vY0YeQ9ffyWvu2zdJBCxX5Z
 g50+0XkSSgKAcQQaTnhfwSxFeSXIBZBslqzEkCU9ocwz/MLi++Y3SwBAAA=
X-Change-ID: 20260715-b4-qmi-tmd-d23e8df1b282
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Casey Connolly <casey.connolly@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494047; l=7054;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=rI/lfG2Xr72NFRsRzf5qgLaHupNxEHCNQqk7ZN2yaEE=;
 b=i99GxEoIfZOfUqHz2WNhBqqfw38MMxZtwFhJ8GwF8O7CQ2b9kegIRBSObWS367F/7p3AN756+
 a6szfamOdrJAoBfD0F7cuv+LCI3DP9NaR9HkFA2UICW9fXP9TwCoJwC
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a6c7a29 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=myz9wP-PkEfKd50XNCIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: erS41rMQWkidI1rd8oZAbqDoX_zBqJ7n
X-Proofpoint-ORIG-GUID: erS41rMQWkidI1rd8oZAbqDoX_zBqJ7n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA3OSBTYWx0ZWRfX9ThNiafE0w72
 lrS25ofzDDv6aMlyRVKEuaSvqgbzSPGzIXOiAVOqqinf4MvIyLR6epD2uG0B1gj7n74FpyumKFl
 g8+n+qcR5mAfFjg60++EH365DMxIKtI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA3OSBTYWx0ZWRfX99jDoxLYNJn9
 AnkLFlkcysgHXOrOxiVBYgiHF5eVPuV/dvsrS3D3PqroAb8NR/v0yE/pOxOg3OefeybpzOscd/m
 rNTgnV5zKTN9t0g79LCD3tSpyv1Nt8YSLMYuZ7B5f4cgfVGADYscVPMYV7mQZDM+zVeqQ5mrL7c
 yj7kL4e34FNnB5SOZ1Xs5mBDPehAQebFJAk8JE3LBHp9+Ig7t/QT/nS25CyHCzv7J4Hl56st1wL
 xoMNMGYoi9tn/3t0G9xNynn5qAdtFRwXT+px007ktL+FFSayWEDnYF6APpLv0GtiyepBy5VRP0T
 /zUlRakFLcnbf/RXZxxWB11xR7Z9U9PcqmIniT8/pH3H9lMxOFbx80hLgbM6og4DkIp0iUndd+7
 pS5++M73vTUNbOpwOkMMQDvoxlN6OcUODHkHrVl1NfzRmA7P59WklY7VFpzsAz+EDVsEutpLkqR
 olFvI50IzA5qAC+3CVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310079

This series introduces Qualcomm Messaging Interface based Thermal
Mitigation Device (QMI TMD) support to control thermal mitigation
on remote subsystems such as the Modem and CDSP.

The QMI TMD is an interface that instructs a remote subsystem to adjust
the performance level of the devices it manages, reducing power consumption
in response to critically low battery charge, overcurrent alerts, or
overheating conditions.

The series is organized as follows:

 - Add a shared dt-bindings header mapping TMD device indices for use
   in DT cooling-maps, ensuring a consistent binding between the thermal
   zone and the QMI TMD driver.

 - Extend the remoteproc PAS binding with the optional #cooling-cells
   property to allow remoteproc nodes to be referenced as cooling devices.

 - Add QMI TMD support in the remoteproc PAS framework, hooking into
   the probe/unregister lifecycle to register and unregister cooling
   devices with the thermal framework.

 - Enable CDSP and Modem cooling on kodiak, lemans, talos, monaco and
   hamoa platforms using the new binding.

Not all TMD endpoints advertised by the firmware are wired into kernel
thermal zones. Endpoints such as BCL (battery current limiting) and cold
temperature protection are handled from userspace via qmi and do not
require kernel thermal zone bindings.

The constants defined in this series cover only the endpoints actively
used for thermal mitigation in the kernel thermal framework on the
currently posted targets: cdsp_sw (CDSP software thermal limit), pa
(modem power amplifier), and modem.

This work revives the earlier QMI cooling series by Casey Connolly [1],
with the following key differences:
 - Uses an id based API for cooling-device binding
 - Integrates QMI TMD directly into the remoteproc PAS framework and
   hooks into the probe/unregister lifecycle.
 - Removes unused code and cleans up macro names

This series depends on cooling device id support from Daniel Lezcano [2].

[1] https://lore.kernel.org/linux-devicetree/20230905-caleb-qmi_cooling-v1-0-5aa39d4164a7@linaro.org/
[2] https://lore.kernel.org/all/20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com/

---
Changes in v7:
- Added Daniel's Acked-by/Reviewed-by tags.
- Serialized cur_state update with QMI state request. (Sashiko)
- Link to v6: https://lore.kernel.org/r/20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com

Changes in v6:
- Added Reviewed-by tags from Dmitry.
- Kodiak: delete MPSS cooling maps by label on non-modem boards. (Dmitry)
- Renamed qcom,qmi-tmd.h to qcom,pas.h. (Krzysztof)
- Made QCOM_QMI_TMD tristate to fix unmet dependency issue. (Sashiko)
- Removed redundant negative TMD id check in qcom_pas_setup_tmd(). (Dmitry)
- Fixed QMI_DATA_LEN type issue by using u32. (Sashiko)
- Link to v5: https://lore.kernel.org/r/20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com

Changes in v5:
- Added Reviewed-by tag (Daniel Lezcano)
- Squashed dt-bindings header patch into the yaml binding patch.(Krzysztof)
- Renamed constants: QCOM_CDSP_TMD_CDSP_SW -> QCOM_TMD_CDSP_SW,
  QCOM_MODEM_TMD_PA -> QCOM_TMD_PA, QCOM_MODEM_TMD_MODEM ->
  QCOM_TMD_MODEM.(Krzysztof)
- Replaced dev_err() with dev_err_probe() in qmi_tmd_init() (Krzysztof)
- Fixed qmi_tmd_exit() teardown order to prevent cancel_work_sync()
  re-queue race.(Krzysztof)
- Removed only MPSS maps instead of entire cooling-maps node.(Dmitry)
- Added cover letter note clarifying TMD endpoint selection rationale.(Dmitry)
- Added NET dependency in Kconfig.(Julian)
- Link to v4: https://lore.kernel.org/r/20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com

Changes in v4:
- Drop the tmd-names DT property.
- Move TMD instance id and tmd device name into PAS platform data.
- Add a shared dt-bindings header to define numeric constant for TMD id. 
- Add mutex documentation comments for get/set state callbacks.
- Link to v3: https://lore.kernel.org/r/20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com

Changes in v3:
- Removed the remoteproc-cooling abstraction approach.
- Integerated QMI TMD with remoteproc core framework.
- Cleaned the macro names and removed unused code.
- Switched to index-based thermal_of_cooling_device_register() api.
- Link to v2: https://lore.kernel.org/linux-devicetree/20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com/

Changes in v2:
- Update Remoreproc thermal config to tristate and removed unnecessary NULL checks.
- Fixed dt binding file format and added generic name support for cdsp.
- Fixed memory leak and cleaned up qmi-cooling driver file.
- Corrected DT formatting errors and commit descriptions for all targets.
- Link to v1: https://lore.kernel.org/linux-devicetree/20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com/
---

---
Casey Connolly (1):
      soc: qcom: Add QMI TMD support for remote thermal mitigation

Dipa Ramesh Mantre (1):
      arm64: dts: qcom: hamoa: Enable CDSP cooling

Gaurav Kohli (7):
      dt-bindings: remoteproc: qcom,pas: add #cooling-cells property
      remoteproc: qcom: pas: add support for TMD thermal cooling devices
      remoteproc: qcom_q6v5_pas: enable QMI TMD cooling support
      arm64: dts: qcom: kodiak: Enable CDSP & Modem cooling
      arm64: dts: qcom: lemans: Enable CDSP cooling
      arm64: dts: qcom: talos: Enable CDSP cooling
      arm64: dts: qcom: monaco: Enable CDSP cooling

 .../bindings/remoteproc/qcom,pas-common.yaml       |   9 +
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  32 ++
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  63 +++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               | 125 +++++
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 125 ++++-
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  99 ++++
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |   8 +
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |   8 +
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |   8 +
 .../boot/dts/qcom/qcs6490-vicharak-axon-mini.dts   |   8 +
 .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  10 +
 .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |   9 +
 arch/arm64/boot/dts/qcom/talos.dtsi                |  19 +
 drivers/remoteproc/Kconfig                         |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c                 | 117 +++-
 drivers/soc/qcom/Kconfig                           |  12 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/qmi_tmd.c                         | 592 +++++++++++++++++++++
 include/dt-bindings/thermal/qcom,pas.h             |  20 +
 include/linux/soc/qcom/qmi.h                       |   1 +
 include/linux/soc/qcom/qmi_tmd.h                   |  36 ++
 22 files changed, 1298 insertions(+), 13 deletions(-)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260715-b4-qmi-tmd-d23e8df1b282

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

