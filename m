Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341268;
	b=ceoHPOOMYMj58Nf4Q4RQ4LGxPzmL1xmfxcdCjMn75T3ednpBaA5QfzDrb7gA9mIW/Y4t
	 qjyQWNiFQdeayM+KEMRs0VnTETA+veqRl8opzDZeEnrgUgo5LYt9HFu2BflgAuSQnnXBL
	 YijSKvwgQ62g3ACoGaj9qZdxS7QBaf0x/4U8HD4LHD0hoeWmnzKAozSKHbi35VBqHrzx/
	 /pfZxG4CeFfZKns2Hha4Lk+Fgq/+kCCzRX1xzaIyhEmWAfxLUkMua0EgCD2m3LzMNnT+g
	 e6k5n0zxi+A1Hm241uDuVdCOqalaFGlvzHgeIJTWpZ+2vSseEkmV5k0ZE9PPYzNyB6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341268;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2jPH5IEEnZfHp4FyLuqzT4LyHDZSoEvCM0gwfPSo7F8=;
	b=oIhw4lb0iC5f8Ea1qVbC0h6/VPPAXuN0+czCm/aMCOL0lCDdRtTE/EGW0Da3p8mwApO9
	 3elB0PtXSyMDOm/pI0PPctr5jcmiUT9+WpGTckp/h+oE+SgDjo/WpqCv6jrFaIkvxlZcw
	 tl2juC8OxRQy4aP2ruOT8YHYrgC0j4ia03cZgGkn9555/RkGKplafHF1gdQd4sDicIGqS
	 6joR1wgcy7nlBy6zxxUImQcGAOMNW8JduEeu0W9L7S3AatxDyPkdPJoNAKXQ9FvX0WCop
	 X8OZ1t+Rse9BkNF8NKXnU9kii3LOA7/xGVpuy88tlCwaKgeUGKOP7ycl8ITcycMpspw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hJwbNfE4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aIlVJi9O;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3467606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3467606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hJwbNfE4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aIlVJi9O
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F5LI3312579
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2jPH5IEEnZfHp4FyLuqzT4
	LyHDZSoEvCM0gwfPSo7F8=; b=hJwbNfE4B0B72oAOUG6oyM61n++VLVW3g0Qp4A
	efHXAzMBrqyzJb9Ob/thuaxdVqZTvDGp/inImzHf+PBAubupkCjLz9JrELnF6xT8
	0CvlMEsl+rMrvUhz7TTvzvUBst8fSEGQtKokv2kiGgeuE/79JyjR/+2ptBx2xaZO
	PNedvc3YVuC9nTbbPY3RquQ7oMhMmKBWO7uSq4Vx4T0+wyv6r0/ekAUxSxa9Q4ig
	+0kgr9kIrYtRC4oO/hS7wiUkdgcSdQU9dOpQIOHdqHYnm6vtFCKWUIze8WZpY5jz
	BX32Nyy/G7QbYEzPIfVmLsl5zp4pHs+Y2tlgZIYuOVpGg78w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rhjs3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0522cdaf3so323447b3a.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 23:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341266; x=1793946066; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2jPH5IEEnZfHp4FyLuqzT4LyHDZSoEvCM0gwfPSo7F8=;
        b=aIlVJi9Ogx/gJj5pD55YMdS+WjT+Upq4Na6mSZkA9EHCGBc+knRlZ18eAohNWeESYn
         EsiqDSGi82c3q1axbiLqC3OXjFwX8oKAzrRqMDjARAwpRx1nooQciXq3D0JEJGgOPQzv
         FNmKv5qhkWmfdbWF7yAWTv9QUgL3MYt1eNYOlMcM50ag31QBUp0pSgz/slSKzT4Q2+yI
         YsmuQxhyOqgGGCqrpIerGtyThkqCwC1H2VPwQ8qthsbngVSo/alj2sZC/Wvzo+6geB48
         fySr+8fdc7biQdLj6N2GJDyotc6kpJpic/nlwiDMw9KJbl4ud6y1Gdj9IqNkhEnNZ9XL
         XVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341266; x=1793946066;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2jPH5IEEnZfHp4FyLuqzT4LyHDZSoEvCM0gwfPSo7F8=;
        b=uzaaOw4b/WJkyf/n4Fp0CSaVa+GFD2cLHnUhTA+xyZEs2pWP2siTYI12/i6UxeVLBw
         KMtcvPzg6dTu9krG2OAMrp7gX2RGpbmXhVZqZhzdj2HA5kAj9IKET4iWXNUkvd3kHElf
         q6ftM56GBwk01lubzCgbZEx7oEe92xxvGsNJfK0di6bGHJvdv/bn+qAmVz7upOIFgelX
         qRwsJHKGy4m3q45s0jfbo2eA7/s+c4wb6eLHohrAhAHGpCmVZlICaAO2VgQZDl7gvPLI
         ZO9HW5jYtg2ZmAhxYQiJ8nXG/wgmQWNaAOF47MEIR7EgjS0mtBcNmWZCq9+9F1aqlUtF
         mALA==
X-Forwarded-Encrypted: i=1; AKwUvBxUBmeW1fDaaI+zY64KpM1P8J/h46yIlrJFSy5EpRgPPWMZW/cODCAb/6b/byhW7QjkyftLjt7MuXrv@vger.kernel.org
X-Gm-Message-State: AFq9FYKq8AefvBHQfRflO7lENo/ho5hZn0ts7rEIUEHduqPW68S2UU44
	fHWORPROu+XmXLfvIk8sOF7uH1fV3+bnnOgeIBnGpeXCcvpVvtXXfsdDKwU94gvdbT8be7VEWD9
	vBWIVvFbfQBdH3c39ZkUqi38lxVWeH9Y3xXGP/L8uEGnIUa5mbbHIm1JzIQEaGrpQ
X-Gm-Gg: AYBFou2stil0RYodYyYmAxlFGg4Nwa1HBdpCvpGpQw1GJkxlyquTxVAkohu8/R/sS2O
	5SHAlXD8af6ERhXnmkBp0KBicQeBw/mD3JcL3I2eJIwi87F4NfePFMBZ2lIxVj/Z/AC3p+kV5GO
	tbQsjWymVF2s+gEI7xNLHTRZGRQlO28Ouq6899YI48hiHzfv/mIwgAx20OvmVq820rvEzYxy5wU
	6YuzBPIGGbsDdPgP68vuqJoxbfTifoupyTUTyH5q81df8QQSIDRWLTGZPlxGIMjKz+ALoguWrNV
	gMnGuHo1WnPhPPvueE/DDo6LDH/ZuCxRH61RDncJuq6rcT+U+iFQxO3cD6rooNFrNwyJxRBzLWg
	va56CGE8epF0PYAeTkGsW7C+5Lv4XEGX58TG2Zkh4XzjN437/U09LZ/gWgGG/Hrjxr+8=
X-Received: by 2002:a05:6a21:6190:b0:3e8:b7fd:626c with SMTP id adf61e73a8af0-3e928df4b08mr1373553637.20.1793341266216;
        Thu, 29 Oct 2026 23:21:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:6190:b0:3e8:b7fd:626c with SMTP id adf61e73a8af0-3e928df4b08mr1373539637.20.1793341265757;
        Thu, 29 Oct 2026 23:21:05 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:05 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v3 0/7] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Fri, 30 Oct 2026 11:50:48 +0530
Message-Id: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEA35GoC/22NXw+CIBRHv0rjORxc/IM99T1acwqYtBQDZTXnd
 w9s9eTL3c72u+csyCmrlUOnw4Ks8tppMwRgxwMSXT3cFNYyMAICOSlphseeE0oqDaJy8zgaO2F
 GckiBsgIEQ+FxtKrVr016uX7Zzc1diSma4qLTbjL2vVU9jbtfgO8FPMUES8WYLHhby1KejXPJc
 64fwvR9Eg6KHQ9/EyU03TVBMDWszCQ0rM1zvmNa1/UDu3uswhcBAAA=
X-Change-ID: 20260915-pm8010_i2c_support-3062421372c3
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=3226;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=3NpmJ00rnG8DyBULcr5JZZHRbARR1VK7xLOxGL+7IFA=;
 b=/vJGQOS5qpLtuieD0HdMKPT5yZCZYaakmgVb/mxMetHXtqSQInFlAwSct2xAEuf++Cl+6XLKP
 Sikm8WVVrv3B5IynI3PwMLOI/0dI2fR+vsdoAno4MVqoAFyk46bQP4B
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: 6-91wVrZOg8u0-61o_G4wgZ6OA6DTbE5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX/9r8BtbcoOjB
 evaupJsRybQSUqQiM9nHDOeZXiO+GB42aLJnK40K1SWYEXM1Nadq9gCfDp8DR4kLtWRmQLnxsn2
 gC6EZwIkKRQAkFNcsGKNVEKhTFD7//A=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae43752 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=jA20YhC1vE42qShcUG8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfXx9UJ5z74r8L6
 Lma7MOypTPyyEYByUrZvBRcXLnI/88cTJniILvm5rAYbTg/7WWx7Uexj9VKHrovaI2MKc6+BnsN
 GRNNtdDalLA6sb9vN6dEACYPxgJerb7pRtIiI6hNZWxlipAN0IWcwHBsHCo1BMDXGwwEy2g/37p
 ulQKhbpptg5WgixnOB0hOdLsW2OobvJfF/mCvnHr7C/fYIacyNVS/QfHnReSOio/yfsAfgTvwqp
 7KpFAFHBJnnBRAoa9hlEyHlQ0LAvvvY11mAXZ/mdYEUVlOwQpcidjdEDUlRNoMD9yn+uqtBg5n2
 KFUelVkdkDx6nWeaD/02v+EHB7RuNYzlUwFtmAER4tfLd6nnfQKcae+asdoh5MD1Q0DCKTBPAyo
 NJOBpiYFtrCHEe9wHDid3zqTW3nDYoc/CwMrwRdrEf9e8M76cxILyhHM5vzXLKkVevHJWOT9Xgs
 DPCD0yFeEWl4en8Jo5g==
X-Proofpoint-GUID: 6-91wVrZOg8u0-61o_G4wgZ6OA6DTbE5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300025

PM8010 is the next generation PMIC following PM8008 and has similar
functionality, providing 7 LDOs that power camera sensors and associated
hardware, with some differences from PM8008 LDOs. The series also adds
support for skipping interrupt configurations which is needed to support
SoCs where the PMIC's interrupt pin is grounded, such as Glymur.

Patch 1 adds the new compatible string for PM8010 over I2C

Patch 2 adds PM8010 LDO support

Patch 3 adds mode voting support for PM8010, which is not supported on PM8008

Patch 4 drops GPIO support from the MFD driver, as the GPIOs have fixed
functions and don't need SW configurations

Patch 5 adds PM8010 support in the MFD driver

Patch 6 updates documentation to make interrupt configuration optional

Patch 7 updates the MFD driver to tolerate a missing interrupt

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v3:
- Updated commit message of mode support patch and added regulator ops in match
  data as suggested by Guru.
- Updated pm8010_regulator_get_mode() to read LDO_MODE_CTL1_REG instead of
  LDO_STATUS1_REG as suggested by Sashiko.
- Added NULL check for of_device_get_match_data() as suggested by Sashiko and
  updated TYPE_PM8008 from 0 to 1 to avoid confusion with this function
  returning 0.
- Link to v2: https://patch.msgid.link/20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com

Changes in v2:
- Simplified of_device_is_compatible() call in mode support patch as
  suggested by sashiko.
- Added a change to drop GPIO support in MFD driver as suggested by Konrad.
- Replaced match_data parsing in probe in PM8010 MFD support patch with enum
  identifier and switch() statement as suggested by Lee.
- Moved interrupt configuration from probe into separate function in missing
  interrupt support patch as suggested by Lee.
- Added MFD cells for no-IRQ variants of PM8008/PM8010 and updated probe to
  use them in missing interrupt support patch as suggested by sashiko.
- Collected Rob's Acked-by tags on binding changes and Oleg's Tested-by tags
  on regulator driver changes (not on MFD changes since some significant
  changes are made in them now).
- Link to v1: https://patch.msgid.link/20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com

---
Dhruvin Rajpura (1):
      regulator: pm8008: Add mode voting support for PM8010

Jishnu Prakash (1):
      mfd: qcom-pm8008: Drop GPIO support

Konrad Dybcio (5):
      dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c compatible
      regulator: pm8008: Add PM8010 support
      mfd: qcom-pm8008: Add PM8010 support
      dt-bindings: mfd: pm8008: Make interrupts optional
      mfd: qcom-pm8008: Tolerate missing interrupt

 .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  10 +-
 drivers/mfd/qcom-pm8008.c                          | 172 ++++++++++++++-----
 drivers/regulator/qcom-pm8008-regulator.c          | 183 ++++++++++++++++++---
 3 files changed, 295 insertions(+), 70 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20260915-pm8010_i2c_support-3062421372c3

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

