Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499C63AC0E4
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640289; cv=none; b=syAWWyUTx34gmFR0q3o3okadmhrFkWsuLckQ5/9E3BWBP9u+gtqSB6griuMTcaybctQpRVuR6y6XviOXijg8wKUIZkTBfY2eT0DQGP2hose5L6mV9/y/BQFYz15QszTXeD76leIc5Gj9sDKMptoeJY/QOuT3T0rhNd+/4r7O3dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640289; c=relaxed/simple;
	bh=SeVhrCmMMgBwYneejcSFmSVfl//DyhXNi3vDveVJ4XQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pelQH3r5GrdQuv33pphHWyWMnliksl8Lan6zGNqdSFJ2xwLwf5uR1pJkE9FMp/uOJAawQH4sQkQB5tRBYhyZQCo6c3MkVfLlg4SBgC+HW2vvTRSOiQ90asIMQFyyQrRYyk7Q0H9Kv78TdBuZZ0evXc+MnOJGT4RmKKpf/vp0kGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zswt48vO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCQq1a9v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zswt48vO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCQq1a9v"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6388rpBV2412265
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LYq4Jt+XYdQQaQAPEpxc1H
	QX+StRIGrVlzBYlaSQapc=; b=Zswt48vO0dNuieNTA2UoUtAsGGAslns48j/Os4
	2CdlH9RbT6EhZNuDzOc5F6IcnQcYSTYxYr28rAkvOlUCvsl4FYoG8NIPB/LO6H1A
	1QFzxqseSRSKEtADioXIm6jVXReB0oqfqeqb6QWGXJLZGYEJHrvQzTH1W+6Q23Ya
	3D0+Vwlzs0k8hLVVWxA9/ShSMN52rgzV8rTEuExznTskKFUrRt3xqpjEpIvwHUTm
	7ZB7ruyBgpbyIUK+7GQpAvWpEf9e9N8jQvGS4rtep0SnQoySutelbbVhZ9lRooWV
	mEN+zMQVJaiEBLGX/LnimBwCY9zgpP5CHcjzxjNQqueWkdGg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vb2h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:24:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0be75dfd4so71302155ad.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775640285; x=1776245085; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LYq4Jt+XYdQQaQAPEpxc1HQX+StRIGrVlzBYlaSQapc=;
        b=DCQq1a9vrUh5Ut0D9Rep8TPg00C6+vphc0z6Ti/eFvNdb2lbsPgNLsporgo0cLGOJO
         Bn6Ud4Y0bWtYvqns8OmvR3MQntDNc8ccFh9/+psufq7gLVcaTmUCIc5Hpxuz+6OSGHmj
         IHo/nvWbUdMYiJAW340Nm61gtHHSdTAOEP+oKuZm1Eb4p1+CFVXbo+CRGOC3IETddJzO
         u0c20K7LrEphN5XMEWmZOuJFrbY030o+fuhEPvviHSBusDoVooQ1A9OOW8qNOwlGPjh9
         c5uux1GM42KGhYWFwtr+DptauROSBXBfZhnG6nRiPPXy6H6hVnj7LmxDmjIcYaZrktpe
         7W6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640285; x=1776245085;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYq4Jt+XYdQQaQAPEpxc1HQX+StRIGrVlzBYlaSQapc=;
        b=HAisCH1UqahWOYWv140md/ty0bihasAR1UbW74nj1xrlmTo71iGhMd3T0xMcG9dpqQ
         1XdtciiyfvLNN0MMhx0SwjajWOhtU1C464g+w7KSOxYo+Hmfl41Pyq9usrxLTtiQXVRe
         tJC3nAzSvA3bEJxvyC+TSkv+3ulMT9wUdwa5Q2R4yuiODT7laFhI5AP0zstgaZ73uuZQ
         y2KiXtRMpqyehrOJM0tG4fdPqaa615/9kwpj68vLcArqwEqhEDF3hTSPBf7Uf1xyO7bM
         oqB1Zb+7RZL5O7KgVY+XcsWDFiCb39oWbaOQxIfIr9vERsS9LHCZvXXBbGGSMAi7G4QN
         6CmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCV6U/2SWiQ7ShHy0HdQSmVsPLXSHQgghm0I+swPUlUntXBgC/0YN18h3CRCSFm1uoRnMDOelToDfi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1IRxw4dcCkUSyOOz/vkf5BXfCEH4WIPhPaFFtPCwMcp3HrmwX
	9A9RcwP/44dia/rstj8aGPiXBxiAaH+pSWofztf2GrRzSuPlzL1dGn02BL5BcQVuYENpTYnX4QP
	YWhxB9sWV7cmSIpwkZ4V2WcSX/gmjGYUYCsdR5ucuYAkQ9kEnw84HFYL37dzSybZV
X-Gm-Gg: AeBDieuFVNooQ+aHNBgTRqOu6nYMtytgaip8zoc8xoJcy0FBdwdpzJfBVEIcgkVSQCX
	PafEGHe62nEJBMNouqcH0MmG/InoXdn32FSnIesKf2dVthc6J8gfTwLiYkCfnlgdqqmS8dx3iEn
	RGFONi0PgR9ABqW7kZC4nZzRB+pwH2mc+Kj6AKj2HkcMqlDN8SHavnCKuGMJzcIHpKFr/uq0Lix
	JXcI/2Gom4JVPlepqTgSL2/NwDOI5nTv0KEx8owLRnC0YnT5/HSKqvV3D+6bVzHcwbU4lCw+myE
	pq1N+cXWBEdhIP8QbqN8vSfaQze+Q+DQYlTYRUsuVR6Sm7zHF29HD0LdvEVaKVlmIezjzh7LxUf
	UQtQpR5vShyHpn+DryWmAAlGPlw1mOrtYinpDuPaTfoOSgE+UF0gO9ZOGWll7l/l0ABbNFMJDlC
	yHqPEKskdTRdLN6d4PQzTfAywOcOsC9nUwlrkmiR9N+zwOu/efMcsyimjl
X-Received: by 2002:a05:6a21:32a1:b0:371:8e6d:27e1 with SMTP id adf61e73a8af0-39f2f07fdc9mr22171962637.36.1775640284522;
        Wed, 08 Apr 2026 02:24:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a1:b0:371:8e6d:27e1 with SMTP id adf61e73a8af0-39f2f07fdc9mr22171941637.36.1775640284012;
        Wed, 08 Apr 2026 02:24:44 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65a3f08sm18274413a12.31.2026.04.08.02.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:24:43 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v10 0/2] Add support to read the watchdog bootstatus from
 IMEM
Date: Wed, 08 Apr 2026 14:54:36 +0530
Message-Id: <20260408-wdt_reset_reason-v10-0-caf66786329f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANQe1mkC/3XNwW4CIRAG4FcxnIsZWGGgp75H0zQsDEpSlxbst
 sbsu8t60QNe/uT/k/nmwiqVRJW9bi6s0JxqylMrAl42zB/ctCeeQhuYBKlAC+B/4fRZqNKarua
 Jo1MuEoIEVKydfReK6f9mvn+0fkj1lMv59mLW67piGsTQwWbNge8EuhGN9cHiW651+/Prvnw+H
 rct2GrOeHekVB0Hm6NVUCPSQILGJ455dHTHMc0BIfzgjB91jE8c++iYjmObE60O6HZGqjB0nGV
 ZrpXiaFmQAQAA
X-Change-ID: 20250610-wdt_reset_reason-7a5afe702075
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775640279; l=3771;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=SeVhrCmMMgBwYneejcSFmSVfl//DyhXNi3vDveVJ4XQ=;
 b=3Ixz0fjpayAy6gvEgzSoITkCKWktYAGZdJTmtvbMxuW2ihh2I85r+/sbG1LVA6IxdfEyM+hq/
 XGhoeoX/+1hBP4N10qfL0muRXYReBMFtuvh64vLgb7cloT8q7wpyAaf
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NSBTYWx0ZWRfX8eJ/JUn+aApA
 jqjUbBfiziu+aix4nf2Amhr0ciIO9AwyYG7zbPs2pCnPqP+19I+RUlzJ22jq/w9ng7Hch7F13nN
 PFJKKeT4T37Q5pZl82X0T/w7yjwrE7pBXoQbim1QX6TGWzreoi+Z8XdLfJp0vhinR9hW82pF3k1
 C0B+q1dS0J4gGLl3N0bEXgNlY4Fq2YhjFVSh1GHhO7nTJrgLfTB4A/Y36MXjlErGi7gcKQ/j6k5
 mgoAZZbOXYQIBZrTuzQ8Z63IrNW4PgJyRpozUHnJNueAtFSnbCAYkzqkpTOvWgAnP/X5uPsLd4J
 Y/JP0Lya/9kUKtaq6LvFm2ZNdPoCmfsJEILnPtEf24s2ctnrZavrPnKqsUY6i5MWo+CVcuTS+/D
 CLRGMmIG4fIRqKTxKBYrlYDDVzzfUNC2fmsUSDcUu/3t3gVOG0j+4uJHTVXJKKBUlUOXwnEvA7K
 1HWBXPlFxN5uR7x+5PQ==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d61edd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3xu3cfvniY9m67ySxx8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: b8s9w5OnsllurWEe58ZIMFZngWg55990
X-Proofpoint-GUID: b8s9w5OnsllurWEe58ZIMFZngWg55990
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080085

In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
timeout, there is no way to identify it. Current approach of checking
the EXPIRED_STATUS in WDT_STS is not working.

To achieve this, if the system is rebooted due to watchdog timeout, the
information is captured in the IMEM by the bootloader (along with other
reason codes as well).

This series attempts to address this by adding the support to read the
IMEM and populate the information via bootstatus sysfs file.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat
/sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v10:
- Rebased on next-20260407 tag
- Dropped the DTS patches from the series, so that both wdt changes can go
  through the watchdog tree and once it is accepted, DTS patches will be
  submitted
- Link to v9: https://lore.kernel.org/r/20260228-wdt_reset_reason-v9-0-f96d7a4825d3@oss.qualcomm.com

Changes in v9:
- Picked up the R-b tag for 1/5
- In 4/5, if fetching the boot status failed, just log the error instead
  of exiting the probe
- Link to v8: https://lore.kernel.org/r/20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com

Changes in v8:
- Collected the tags
- Updated the commit msg with reasoning in 1/5
- Updated the comment in 4/5
- Link to v7: https://lore.kernel.org/r/20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com

Changes in v7:
- Collected the tags
- Added the reference link in 1/5
- Added the flag 'no-memory-wc' in 2/5
- Link to v6: https://lore.kernel.org/r/20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com

Changes in v6:
- Moved the IMEM compatible from qcom,imem to sram binding
- Updated the 'sram' property in watchdog binding to point to SRAM
  region and update the watchdog driver accordingly
- Dropped the Konrad's R-b tag in 2/5

Changes in v5:
- Rename property 'qcom,imem' to 'sram'
- Use dev_err_probe instead of dev_err
- Link to v4:
  https://lore.kernel.org/linux-arm-msm/20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com/

Changes in v4:
- Kept only the WDIOF_CARDRESET and dropped other codes (Guenter)
- Renamed qcom_wdt_get_restart_reason() to qcom_wdt_get_bootstatus()
- Dropped the device data and describe the required information in the
  DT (Konrad)
- Link to v3:
  https://lore.kernel.org/linux-arm-msm/20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com/

Changes in v3:
- Picked up the relevant tags
- Dropped the fallback compatible handling
- Split the driver changes into 2. Introduce the device data in one and
  extend the same in another for the use case
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com/

Changes in v2:
- Dropped the RFC tag
- Reworked the driver changes to use the syscon API
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com/

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

---
Kathiravan Thirumoorthy (2):
      dt-bindings: watchdog: qcom-wdt: Document sram property
      watchdog: qcom: add support to get the bootstatus from IMEM

 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |  6 ++++
 drivers/watchdog/qcom-wdt.c                        | 42 ++++++++++++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20250610-wdt_reset_reason-7a5afe702075

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

