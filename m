Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D65A4248B2
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785172832; cv=none; b=R+/jSgPWePPeAJoEILNb0Tvmf+EgMkqhrlPv35REjT4sZeUIPnJd6WfslxtbRMuv+wzKm65Cway3sAIhrVffdZSKT49bpRhfY5AtmB5alV/Fen1qofj6E9RzJufYDALbuBj42SjQKor35DHtSDuJjXmKblMi4jJSLPcL16+A4MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785172832; c=relaxed/simple;
	bh=PDsxrt7keAbY0sXOhE86fzjNlxProfp5doOstLTQAwI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=enE+pP232JkcAopwcbCqWwBr08FqQMx+rJsZ0cJaDxIjjlB1c8oQ5TSwk93hHQ7J4wHHPGbxGZ307/Ra72DyhcMiaNj8lAyJ4EX8a24tw+pwnbgp6Fa48ti0z/TDr4fs1BTOzQhSmexpKUraueh1TAHC/EvM/zfif6URwnMa5HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzUGDxeR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EEPL9Ym7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzUGDxeR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EEPL9Ym7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlqOC3787376
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Uv3zEN9xXjNg7XDyTuERbi
	G9Y88PwNHYIN3PilyCZww=; b=QzUGDxeRtGqgLy0ZDTMo+keFTemMVJ1qOTE3hC
	gHGWlEhGUlIjHU0MMLVtsuVIaQ3QC0OdpYkQx6ECCcwIAefvqo1Ngl8oVPMxqSlV
	au9aTE7g8Gh1bvdA+O0RUAzaRevODLUzfMUdJsa+q+htInmldu9kgnOY/ZH5Pa6n
	KT52JJQTekT1NAwUHtMblazC3Oph9EbAcFCel95U4xecWqGhYmQP8AY9hNhv/PRS
	Lgbkz06Si0mlwKVTI8/6jSdIFlJn3oPB0GsG5OTwSrdt3Samn3KZJhAogz1KH1Za
	PdT/PF05ym3IYIlQlr3bi3jVrJNt++kaw3VhTRF6J0EAcsLQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2j77j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:20:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf1c86963bso1266465ad.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 10:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785172816; x=1785777616; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uv3zEN9xXjNg7XDyTuERbiG9Y88PwNHYIN3PilyCZww=;
        b=EEPL9Ym7LCBcPzVU3j+5A8knqQZu87JuG3b7evEWoRc1Dz1c0DPLptqRfm9Zi4mbT6
         qCFFiSsXFonGxY7PvH3UKIN7mEj9+zrtumNpefw/+E6pTNFjtlAcyX/4FNB9wM/yH5JH
         J473VnL76GWYUSbsJMEojS6Omweg0ZfPVgt1IV1ITRnH7WjAkNqlZdLhSho+4rEdgzeI
         J22PcJ/Jg2PW3il+HrXC3ROEi5+wWvVzMeAknAY4zqBVktniWUz22q6MHiURPKoek50+
         AWHKTvnijBHUZPAQiSQoDjerPVuFaXUorGypyvuvhLYS+Ee2D8PiG5uogH3rXNtoxAVR
         adYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785172816; x=1785777616;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uv3zEN9xXjNg7XDyTuERbiG9Y88PwNHYIN3PilyCZww=;
        b=hW53a7jtYmOukHAZpscNAKGS1HXnWYcM+euDLdJRpAa9fmAczurvTG3w0rZkymxqRq
         P2jW7nagPDnr3GcYxVMsWVZzQAlSUd9bOwO2o3Q0DJtxq899Mnsh61Em7m5j3bh832tR
         YLThkgXgaeG2RWtTDbq+0DFTilz5ZHYWnW6yFiBAy/UZq/i8PwolGVH2SjSYOVj/ifyi
         PSwlwqGqlsDCIb+vBYKkoXh8NTYsa4SpidzIfVq8wT/JwqFiSiuzZb0KQiGoduWy7dcc
         kZMRzOZts0xfB/6qsg/2j7LTwbfqVYlCFAnvU1qg8r4DvASK+bIx7gVySzxS2nREdB1E
         q14Q==
X-Forwarded-Encrypted: i=1; AHgh+RpAk5SjOlBzFjn0wqeMMjielw82H7ZyYCX+V3ywq3sFE5wQqhQ+09vqMwvFRxMFxKme5IQhHVl+VSId@vger.kernel.org
X-Gm-Message-State: AOJu0Yya0Opdf8dGR5GTOm/ZyyDZbDOTOjv/u0AzLFLGufRet2zOnF2P
	yC8VRFx60sSSdC4QR5LNdKNuWrlkFYqTaBKm0rBJ0uAU6YZHrPeVdIt89ZSoKcynMLw8pt56tkc
	uj/CdtmH5QeNT5WPhGbWj/GBJpAUTBVv/hHTfZLkPaKO7WK/zZu+bcJyylnD/tO7n
X-Gm-Gg: AR+sD1338AkjvwAH2H5mnuPO+Cv1DTmC/wMK3m2xYUIBSZoduc7rM0PX4y0zgyNtfq7
	32aAnAzX9nwE1pBoQ24z6+cmCeZPsSVbrf5pUx41ikeu7ZSAiFYjBIl71kBrTQZiBIakJaJSVbS
	sO8LYBt1Ts7vvOZaJcrBhCsNqj69OGZ/pm4Kg0r1sHo9XvOsvt85Dl9/pwwOuf43poATR1Qd4ln
	yxWRX3dmh2RyVrx4Te2egYrzabeonPwck6AYESoQ2P6AFaqW7ZoTrHdT9NntiJ513JSlrZycYMj
	Xy0dq+CMYDdhYOvPGAf39PXh5N2E0JvG9TwehTcLknX0DQQYfreLAiHbdJ0IjfeNgGNiYmG9k/7
	XiFQqdbRB5zXhNkNOGAk=
X-Received: by 2002:a17:902:ebc2:b0:2cf:4c37:d955 with SMTP id d9443c01a7336-2d00e864b58mr2732045ad.27.1785172815925;
        Mon, 27 Jul 2026 10:20:15 -0700 (PDT)
X-Received: by 2002:a17:902:ebc2:b0:2cf:4c37:d955 with SMTP id d9443c01a7336-2d00e864b58mr2731595ad.27.1785172815300;
        Mon, 27 Jul 2026 10:20:15 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm55892988eec.13.2026.07.27.10.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:20:14 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add ADC support for lemans, monaco and hamoa.
Date: Mon, 27 Jul 2026 22:49:10 +0530
Message-Id: <20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA6TZ2oC/3XMywrCMBCF4VeRrE3J3cvK9xApbTJtA7bRpAal9
 N2ddiOIbgb+A/NNJEH0kMhxM5EI2ScfBgy53RDbVUML1DtsIpgwTElGK2d12cIgSzfSBifFtQY
 QmuDLLULjnyt3vmB3Po0hvlY982X9A2VOcalFXSvWOHVgp5BScX9UVxv6vsBDFi+Lj2G4+jIEG
 lKA1Ttj9d7oH8Y8z2+TmrOZ8wAAAA==
X-Change-ID: 20260430-adc5_gen3_dt-f0434155ee25
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785172810; l=2379;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=PDsxrt7keAbY0sXOhE86fzjNlxProfp5doOstLTQAwI=;
 b=Zd8hPdARyoOyofHX8tnW3qk3Ymc6tX8OGpE0XjpzgvBhYZqVYfv+kp+5bRsaZn6m8Ce8wUPw9
 nZEC3YgH+bkAiig87T/emwd3WYNcstkUS/zz29IS157HgKOgPx1CSE0
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE2MCBTYWx0ZWRfXzYZFtvxhJ8yv
 CXvl5FCwUmkq3upKkiMMn2IVpp+oqydUWNZu5CfMfSaW0GV2APey+lZM5ZDZCSw4H/YDOXsiGmT
 upDvPjLGS2Caa0tAonN4LvJErMWhwD0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE2MCBTYWx0ZWRfX7IUKQkWH442b
 y+YZxrOB47sbOtMb2PeQ5o7aK4bjrWdm8aBH8k1hOXlUkdESEZoIFu2KJMTw56ZUo3k9KkAWhP2
 Dy4Qh3Soi/OkQ7Ldx/bGwj1Q9+f8TdewixMiqkjBfXdyZBdy0BDm7uPuVPNInxdrkHOtslD0/Us
 5LNDLaRjcjprKUCwNWuhke3a91qtzjlxjSZlv71lnpGhk7N+EPDbJ/1/5PhytUIZfMngKXa1RWE
 e9qQkxZLkdZ1iucMpYKTkwhh7At23IR9Y8gt/PNbeIsbxw+pitHWhelZfXi0bCB0ti1eXMVCjqb
 Z5MjYXm12QmXVwY5srLhbWH7wEw3gpjKWPYVf17Dy82urKob852tQxf2rsuqK5HcyhHWMCJhL/U
 insQANGPUHETFZcl1r7kcS4ZikO9nIs0sxqLfc3wOmBYTTFY/+LFgRH7In9zZvXUa26t5E61bv0
 i7fMzHB+Uh5Mt4YLKhQ==
X-Proofpoint-GUID: ZuVh_pksWJhuLDOQ5qM1d7tvxezOr8Wr
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a679351 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=ispjFfhwX7dSH34Uv1IA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: ZuVh_pksWJhuLDOQ5qM1d7tvxezOr8Wr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270160

This patch series adds Gen3 ADC channel macro definitions, with basic ADC
support for lemans, monaco and hamoa.

Patch 1 adds ADC virtual channel macro definitions, which are used in
the "reg" property of individual ADC channels and also by ADC clients
to reference channels. These are a combination of PMIC SID and HW ADC
channel number, which are parsed in the driver to identify the intended
PMIC and channel under it.

Patch 2 adds ADC nodes with channels under the PMIC instances on lemans.

Patch 3 adds ADC nodes with channels under the PMIC instances on monaco.

Patch 4 adds ADC nodes with channels under the PMIC instances on hamoa.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v3:
- Collected Konrad's Reviewed-by tags on patches 1-3 and Loic's Tested-by tag
  on patch 3.
- Replaced "interrupts" with "interrupts-extended" and moved it above *-cells
  properties in all patches, as Konrad suggested.
- Excluded PMC8380_6 die_temp channel on Purwa as Konrad suggested.
- Removed all ADC thermal-zones in patch 4 as Bjorn suggested, and also
  "qcom,adc-tm" and "#thermal-sensor-cells" properties to avoid thermal-related
  errors.
- Reordered ADC channels in patch 4 based on node names.
- Link to v2: https://patch.msgid.link/20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com

Changes in v2:
- Added ADC support for hamoa.
- Link to v1: https://patch.msgid.link/20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com

---
Ayyagari Ushasreevalli (3):
      arm64: dts: qcom: lemans-pmics: Add ADC support for PMM8654au
      arm64: dts: qcom: monaco-pmics: Add ADC support for PMM8620AU
      arm64: dts: qcom: hamoa-pmics: Add ADC support

Jishnu Prakash (1):
      arm64: dts: qcom: Add header file for ADC5 Gen3 channel macros

 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi   | 158 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi  |  93 ++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi  |  43 ++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi |   1 +
 arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h   |  88 ++++++++++++++++
 5 files changed, 383 insertions(+)
---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260430-adc5_gen3_dt-f0434155ee25

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

