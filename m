Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00E02D7DC6
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697222; cv=none; b=bVADrBdIKhnUV97EepCNy5rxx/SRZ6nQJ73xHdQHc3az/ZjYREXbHbXjw/H1SpS7sPzrGK06XSh3BSPdwYH9Wa5T4vsnzOIjMS+MQZJh2ty+621reYDsAm4eUc6zF9sb5OHP8uYXSbGSLyQfMlRe+nNb9Q0xfCzoclL03ktnWYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697222; c=relaxed/simple;
	bh=YA/Ye1iLd0aysmqI+nxzdN9guijYJHSSRik8bUWwy6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Biv7vJth9gE5Jb2BCGFcjDr7nfSk+OVcnFyfJZtL+psVWTPaqqytV4a7a3pL7WtaA2WVMd7wAKjoPeE/9boZAVIeiJAdQtN/ytOaWCU3E17zR1z13mOz1GtRjcyFx5Dhdvpp6KUGiSKttFdHnkLtrMf7YTteNXWygHYyVpevSHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kckhm+6n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ROT7+G2z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kckhm+6n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ROT7+G2z"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TFG19V941992
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BJSbFH5x1NFxwPEs4kTgdG+BRI6BjMAnoss
	kdwG5XLY=; b=kckhm+6nqDNSq7tFRzWlTBTIApuMNr5rVKIDIJzFCviKuSkzGjt
	WUcfHTamc/sM2de5IGX0A9OnytZe0sKA2Zf3V/5KKs+CjzoW16ZCi7hVzZMgG4dn
	NfLMPtkZ+hBAjCylYdChRemoiYwfOK+xBYSj/C+rNBlGQ2EQv7x31vY50GQCemo2
	2jBdLp9xryvKlg699upiraO5bskI4uiuXYFEDHkn7CG2aFxdqIuvddsstpzJq+1g
	MHHVLqyUD+oJge8tfs9kPMOeYI2CVG2szugzf/QAVvq7FJz12nH0RbtS/7r/cJkI
	K4UMdKrH7ZgK6WcfYPDRw/+J88p/r8e4g5Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0ftug5t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:53:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so4115626c88.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790697219; x=1791302019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BJSbFH5x1NFxwPEs4kTgdG+BRI6BjMAnosskdwG5XLY=;
        b=ROT7+G2zXLym+MsBUvQ/1tt3XNII70ZnjXuz5v5ODXm8k1JyDIYj4yq1Uac3eqFk6g
         0IBt//4vWjPGatzARMMKjwHTZ1zaGSdjwj2rL0T+nQLM4mqOL2S8QdqmHNlWVP8YqRA7
         GLTn6TlbnNf2ONZ5C64L+2K4305Yo0FoEMzOaAEwzVFPeI+POQVwa3u/20znz75ffBtE
         IlO1InTQ3Yyio4gckWINwAFqeiXiORdYSEirL1kbXl2o31P/nt3bFqjVbKiK/qa3cemf
         PzIWUdY1Z0tZ6wwGMdaw0cAUsT9ls1EvQ/1j0I6gL7z0fu6CqsvsfdxtG7My9XVeoO4+
         1R4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697219; x=1791302019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJSbFH5x1NFxwPEs4kTgdG+BRI6BjMAnosskdwG5XLY=;
        b=2xqYehS6EaCsTcFE/ZbjgeyWjzxG8aWSmzv76gB+dbDIKYTeZ/XLcFD2olHiFsBCw5
         3YvgK4REViSMYkoPrKTeHJCQjUA/fcv0+Vw1j0p/H+p3xfVgU//2xNdQMU9W08MqMFDU
         KOZeYRUnPQJvMHi1ecJKRrf8ZHt1LyRqvQKugxhCgi08jk84kNXAhuxKGHFHGqWXuu00
         5X0N8mQqZgk4uWPcuiTqHBTnUWBLjaxnpxObUyIFCx4+ye+08ifxMsOQ4+O+WmEQJnzY
         ut6b3e/+CPJD4vMtrcJ1DIkKje4Pa4ayD4yIiUrBDuiW74Ky5hi+iPk7K/Q9g5TdQm19
         gg3w==
X-Forwarded-Encrypted: i=1; AKwUvBxvalhQ23989Nr5CSNtvyzhbnGg5/elOOFqG7pzJGrkSTJvU8LnqQxx7HDZhO1fztYE2g5klut6A4dk@vger.kernel.org
X-Gm-Message-State: AFuF++lGKhN2rYDUK444vqblwF8eXewOn+Lsalz3QC4wT3obyyztJQI2
	PKJgHmauCmZp45RULxVAaxxVuwtUnlD2QCKj7Wxp6KhVtHskoelyKos8YmdnHzXeV5FYEN3xpKO
	sFKEp7wo3Abh/gF0OA1sH+8abZ52MTQVNjvJM17bgFqqRwLShR644DsaLu070Wj5N
X-Gm-Gg: AYBFou2Z1EFHWhCGHLe0yeHqP/cdOKLlMsBgMpsWMt/cjpr3lhm/WKfJbSQH2cKUOrD
	9LwGkE3dk1nat3uVPe19tiibK+dUXRZIzUmuUlx44j7MKw2uhpjq87hSNWestnG1d6QjN5d0Wpx
	beXQBL+5kjDs41htH7evmy/imdKm32itLrfO7RYzKiEYgVjusK7UT1mcljhLyYuA9nfAcB0NeVz
	hE3AaSxiPSVTnPc3Yj90sDioGr1w51tJxRJVCKXrKKd1xb9FKNQqerUZc2vuATyLlheWEq6ps4P
	3hVN3DRNqhhwXgOgtoxG21F/69mT5RlnGfygAIlCFYkbcvxt2zU3DzTkGACCdesFi1IW8tfnaTx
	3zgRmuLCdhv2dt6I7XhUbv30OWgANtxF6ZVzqjC0uLuaQsjbN13EickMd1h8=
X-Received: by 2002:a05:7022:f515:b0:141:4c37:a212 with SMTP id a92af1059eb24-146ce1a9977mr15547670c88.2.1790697218979;
        Tue, 29 Sep 2026 08:53:38 -0700 (PDT)
X-Received: by 2002:a05:7022:f515:b0:141:4c37:a212 with SMTP id a92af1059eb24-146ce1a9977mr15547617c88.2.1790697218180;
        Tue, 29 Sep 2026 08:53:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c64e7660asm200213c88.17.2026.09.29.08.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:53:37 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
Date: Tue, 29 Sep 2026 23:51:45 +0800
Message-ID: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfXyNDpz+408cSV
 Fr4yowqLdhGTZU0e3Llmi7eCbbuFfjELCTqUDV+6oUSVVYYzTrmI3i3RcGJ3SCsrk9cyC1kAAqw
 P69i2MKQ5maAT22gPsVV35BXcsxN5wrxZB6zDklIHP8EQopkEHKTom4uvGS69c6pUoJ0pm2iJym
 gN18z5KzRlFZsEd5FTwqKjVw7f/gwZtSeTujkFAPrfZ10fx2fbITL/BolHAUo5vCokJ8FwYVcNW
 lRWbpBgHQ2yKI7leS1+4+jywhKkSY1DJVFqLmqpTvvGXItPbwGi2VrBivVHARUb+wBrXE+2M0TF
 jh1LIGCQuspdoZf9RB9HqvFAeJEsBU6YHyQXuH//GX+LKjybTC1yNwXZQU4txu4AGj8WioxnNxq
 bqYnePlyRBZHRgVZv+caig9xOEsa/sy36jN7K+CP2IAFX+OcptZtCxtYVWLxRav6lYlvDTyM5y8
 BcDOucircPHicHfX1ug==
X-Authority-Analysis: v=2.4 cv=AoB7T+9P c=1 sm=1 tr=0 ts=6abbdf03 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xxUIrTjmZCIhaGii6OoA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX4Mqu3ATPfijT
 HSEcWCE/u9CO/nzJ0GFba015H4E4StwarC4tR8SjQt8sEOWUqwuPa5R/ReH/3miwKlfpgG41U85
 6O3xrlIQB+/H1XxLZOcmU30e0hOam+M=
X-Proofpoint-GUID: DHUA3jLcqzapZ47yFUDWqzMRs71-1Y5D
X-Proofpoint-ORIG-GUID: DHUA3jLcqzapZ47yFUDWqzMRs71-1Y5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290063

This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
and the PMIC descriptions for the Qualcomm Nord platform, and adds the
initial device tree for the Nord Ride Embedded board.

Tested on next-20260929.

Bjorn,

Due to that RTC maintainer is not very active this development cycle[1],
I'm including the PMM8654AU RTC change in the series to get it route
through qcom tree.

If you consider to merge the series, please pull the commit e484a765f543
("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index") from
Ulf's branch below to resolve NMXC defines.

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt

Thanks,
Shawn

Changes for v4:
- Update firmware-name for ADSP/CDSP to align with linux-firmware,
  i.e. adsp_dtbs.elf -> adsp_dtb.mbn, cdsp_dtbs.elf -> cdsp_dtb.mbn
- Use the same firmware for all 4 CDSPs to align with linux-firmware
- Drop "Embedded" from model string for nord-ride-embedded.dts
- Include PMM8654AU RTC binding change into the series
- Link to v3: https://lore.kernel.org/all/20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Reword commit log of 5/6 as suggested by Krzysztof
- Add memory-region for ADSP fastrpc node
- Link to v2: https://lore.kernel.org/all/20260904081619.593602-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Align PMIC comments in nord-ride-embedded.dts with nord-rrd.dts
- Drop unneeded regulator-always-on and regulator-boot-on from RPMh
  regulators
- Drop SMPS regulators as the resources are already managed by rpmhpd
- Use pmm8654au compatible with fallback on pmk8350 for pon, pwrkey,
  resin and rtc
- Link to v1: https://lore.kernel.org/all/20260831032103.341633-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/arpTJAyDAAuAzPrv@QCOM-aGQu4IUr3Y/

Bartosz Golaszewski (3):
  arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
  dt-bindings: arm: qcom: Document Nord Ride Embedded board
  arm64: dts: qcom: Add initial support for Nord Ride Embedded board

Bartosz Golaszewski (3):
  arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
  dt-bindings: arm: qcom: Document Nord Ride Embedded board
  arm64: dts: qcom: Add initial support for Nord Ride Embedded board

Dhruvin Rajpura (1):
  arm64: dts: qcom: nord: Add PMAU0102 and PMM8650AU PMIC support

Shawn Guo (3):
  dt-bindings: rtc: qcom-pm8xxx: Document PMM8654AU RTC
  arm64: dts: qcom: nord: Add support for ADSP and CDSPs
  arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../bindings/rtc/qcom-pm8xxx-rtc.yaml         |   3 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  63 ++
 arch/arm64/boot/dts/qcom/nord-ipcc.h          | 144 +++
 .../boot/dts/qcom/nord-ride-embedded.dts      | 442 +++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  37 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 907 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi   | 543 +++++++++++
 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi  |  54 ++
 10 files changed, 2195 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ipcc.h
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
 create mode 100644 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi

-- 
2.43.0

