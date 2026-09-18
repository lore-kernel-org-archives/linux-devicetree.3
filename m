Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27F3483BC0
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737573; cv=none; b=cfxMO7bHeZYtqQzJtRi1agKV/uktOL8Zu3/9AnVRnUUKUzeZjRRKGTHum8vbjvJ5xzXM2VxavDs/mQKtjF1O0XY8pdgmo+gYVFaas5aO5K3iva4Xk6DVKCAjItU0lpJuycRWG6oSSJP+8V3lC4gr+7clX2KCQ5TMOkpt6TQwAZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737573; c=relaxed/simple;
	bh=E7xSFqkfXWjBwE2qgXNp1xHWqOsbleGRIC95heJTD58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LPtLsile3QFFULfSbYg6/uCVapMKL5i4k6+F6l8My7ZUFG2WiKv+GnmIqDNaAOZecmhcu3vO12BMgYogoO5C6tCfpq/TD64Ve667JR3UaGTn6fNA1maMIYPDDysNiQe7DYq9y24FQTwBinlRCwV1kPAunHtkWjzT35TXlBona7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUQsl5bo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dI3bG+G7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUQsl5bo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dI3bG+G7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICuDOI1649997
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yicWu9NySxrVOc5shYeVRk0PMByyu7NiHY7
	V2FUnQbM=; b=jUQsl5boAOqle3e6o6Kxc6DkIpY6pF8xbiGD+87w16w9MDebzpp
	uI3wYKiHqiQacOztcAr6e4pBESb4BpfREXIHpfUyGZh1VkniNqCuXUmYi0qxWTeB
	tIzQMJvflm0IBU5aNxS3TP5Mi371Pz+yLMN3uBgGQxZqv97rjboxkW79KSIXfagj
	vwqrOOt0sjP38V0Kg/uyeTAFBN47ysibDj/96uy3pA2hWh2LVLwnhGB9qaQB5nLP
	1Zp1C45L06ufriWWhpDcTvbMCbiFCaYkzhR0P+DKVGV/LpJOYwO7PrtiCF3K1f4g
	ak/Zf5azFiUiAcZjwgFDmb6JAel1vvtY79Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrg43amx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:19:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9394ad7f64aso113583085a.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789737569; x=1790342369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yicWu9NySxrVOc5shYeVRk0PMByyu7NiHY7V2FUnQbM=;
        b=dI3bG+G7mcC2f5EpKS8pVEGA12FiD5ghIcqsz/3dgmhhAp8hLHMQwmYaTnDMXBNSW6
         vlqy4CHquQiLZQ0x4z9h+a4ovJ6ql8fLnVlqJosuWXgGS8zVxBtgUySHJ09o7jQaYLbI
         OJDkqkwzxMMgYwEoVjl4Yc7reCu2LUu9I1oJodpVLlkxUcaGFfvpLuWGZW9g90gYqF8s
         DT8Pd8T/q7dUCZ1f/wQ2Uv0Je7payA6PleZ4r79/MQQ94d45IDm1IyaSI36THynkkdCv
         fU5w/n6Nuh+kKya2qhBmvPqSVAZghb5hi6TUe2Q54TCNqJ12YrlHFEUla7XKLIbCRnEn
         CQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737569; x=1790342369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yicWu9NySxrVOc5shYeVRk0PMByyu7NiHY7V2FUnQbM=;
        b=FqZpsKqNcXaXhSDQNbgNlE0gzh/DZ6AaNePFKRsXv1IrFvmvXB4qN1acqsP7Z/l35o
         sMax2+7b6U+DuyeOGtOi5iyPJjo+oBh8grw3EjcgbTD0rxtFzKAfFRhIdNFf1mPDBk/r
         +Qt26+YS0h7r7wxr6z0SJNzKTMxGqEPbUqX76SDHRNnrwomoxA7IZtFxc9zn4KI8opdd
         XaZYJLztplnN1PO8pg9HoFl3oubSWvEwzp5CAYwOrMLV4L54NXcXSB9P52kyc570GZG8
         O7TRbCRg32h8VuATpbU0uiLEHpXyO5X8XT/g0RB/nG3Elz+3LWCVgTGQnYejxe9IZCdR
         w60A==
X-Forwarded-Encrypted: i=1; AKwUvByH/I71ReWGG/MxBB1cfiG++DzFJIg9Q5khI0meYMJJxkefLEqa3A0kcsuchjAPy3Uih/s8IPaXbvMS@vger.kernel.org
X-Gm-Message-State: AFuF++kUjossXp8Z1HEFP6osXA0CcdB484XJpfpfnL/CMdv3cq/kEC4M
	m6575xogsEYlUYddUNrhCW5Hcm6a3ghMOAEebIUacnmO6lK8tklugXwTpEoNuhN3wvbXTm3Nr4z
	L1cgykez5ymH/djMI/TklsyFq8cSfQauTdu06Uztj8rvkg6jFITW+7OKVB22/MJKv
X-Gm-Gg: AYBFou0OtjEb0a1TkSu0ZMeaZpgwODW8TvEP2Nu2aXvGzxex2t2zgwNWg5hVucmNsFV
	Y9UN64myt42CbHQDhRjXNgpE+FDfyck/KYY9nKtO7L3YgRoShStYuBlSrTTG/6ha1R7AqufGJFy
	wYCcPUhZOzzpoYk4EdDYe2lbL2nQ7Bv/uTVbl6VLbellsZaCsReDK03UFrPsDb1FnmGCPHBmaLP
	W3G+yieC/WWWwx4utRJmhu9DdAtgXvoJLf0ZFDrW6r+zHuFkfy7J45/MQ44iLrTE++EjITJm0h2
	laVRCtjEugPttOTNUEHM3xsn+O5SaNX5XCzkHZ5/U0mlgbmy5+dS3G+BlkKSzDeijuvprOuENBJ
	xN8sIJ7N8RhudTA==
X-Received: by 2002:a05:620a:6886:b0:93b:d79b:9a6b with SMTP id af79cd13be357-93bdcad865bmr320849785a.76.1789737568751;
        Fri, 18 Sep 2026 06:19:28 -0700 (PDT)
X-Received: by 2002:a05:620a:6886:b0:93b:d79b:9a6b with SMTP id af79cd13be357-93bdcad865bmr320844485a.76.1789737568132;
        Fri, 18 Sep 2026 06:19:28 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cebae2sm48254015e9.8.2026.09.18.06.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:19:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 0/8] ASoC: Qualcomm Tambora (WCD9378) SDCA codec
Date: Fri, 18 Sep 2026 14:19:05 +0100
Message-ID: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sjWerV2WSj5LOCBZry3nG0pUjPzuubib
X-Authority-Analysis: v=2.4 cv=ZO9CCn7b c=1 sm=1 tr=0 ts=6aad3a61 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eAt5nrnh09IFEUH19A4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: sjWerV2WSj5LOCBZry3nG0pUjPzuubib
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX3fIaCEWXVRcZ
 2AqVTt21w+g3tEZN/BxVUIbcZhl8BnhzIRAeF+GmFQD/UYYBKgALvsg2CK3dh73TWYGNsoRnidK
 1lyCCt0D1Xa8FgAfbg5oqp10DFuXtleXuC6FKhgPSdToiTFKvgf32edR8qxf+bOZhXGdBSEUZc3
 pq6qR2mMFCb5+15qEuBqZ13XuHk9gU8IPwI/UxIIEVHM7Dx//8gIo3p1KOrV0Oqj5hoFyGOfX2N
 05gIv0ipANJ/fdOmjKfb36OXs7UTYZeJ0FalAuh7wfUIydXuwAwAHZzaTJk9eBUkq9+InqZl3Gn
 lPGAl+ba1ny+2pwsw/VD/zHeP4jEfB7UvqIV6RfcXFePYndmWXH+wQEU80crtKLOJ1T1Yb8aqgr
 VxwKrOz8vrpHfcMLumxEvxrAfkfH0/lRcF7/cX/V5jlyMg5DJIrFKonXMxp86QgwVn29OUtQe9Y
 x6SXsn87w3akXuENq3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX7qsL9t5hNxtU
 oOXmBsswcla0leZSWlS6KlKzdOR7kNlf/h28EF2/MF1lnf8zcuTkhYlU9I/CoSicheaheCJZWA8
 Pt+HVb331MjHDCRdO2xa5vANFGy6600=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180189

Add support for the Qualcomm Tambora (WCD9378) headset codec in
SDCA-compliant mode over SoundWire. On ARM/DT platforms without
ACPI/DisCo firmware, the SDCA topology and SoundWire port properties
are supplied as static data through the codec driver.

Patches 1-6 extend the ASoC SDCA class framework so that a
class-based codec driver can be built on ARM/DT: allow builds
without ACPI, expose the SoundWire probe/remove library entry
points, add class_ops with a populate_function hook, translate
sound-dai cells by entity index, and add a
sdca_apply_default_control_classifiers() helper.

Patches 7-8 add the WCD9378 dt-binding and driver. The same
silicon can be fused for a mobile (non-SDCA) or an SDCA-compliant
mode; the two share the SoundWire class-ID compatible
(sdw20217011000) and are selected apart by the new
qcom,sdca-compliant boolean property.

Testing: HPH playback and headset-mic capture tested on the
Snapdragon X2 Elite Glymur CRD and Lenovo T14s Gen7.

Jack detection is not wired up in this series.

Changes since v3 [1]:
 - dt-bindings: sound: qcom,wcd9378-sdw.yaml -- drop the
   qcom,wcd9378c front compatible so the schema plays nicely with
   the SoundWire class-ID compatible; introduce a
   qcom,sdca-compliant boolean flag to select the SDCA fuse; drop
   the fake top-level wrapper node so the slave sits directly
   under the SoundWire controller; drop '|' from qcom,port-mapping
   description (Krzysztof).
 - ASoC: codecs: wcd9378-sdca: gate probe on qcom,sdca-compliant.
 - set SDCA_NO_INTERRUPT correctly on controls, (Mark)

[1] https://lore.kernel.org/all/20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com/

Srinivas Kandagatla (8):
  ASoC: SDCA: allow building without ACPI
  ASoC: SDCA: export PM helpers keyed on sdca_class_drv
  ASoC: SDCA: expose class SoundWire probe/remove as library
  ASoC: SDCA: add class_ops with populate_function
  ASoC: SDCA: class_function: xlate sound-dai cell by entity index
  ASoC: SDCA: add sdca_apply_default_control_classifiers() helper
  dt-bindings: sound: qcom: add Tambora WCD9378 SDCA codec
  ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA codec

 .../bindings/sound/qcom,wcd9378-sdw.yaml      |  102 ++
 include/sound/sdca.h                          |   23 +-
 include/sound/sdca_class.h                    |   70 ++
 include/sound/sdca_function.h                 |    2 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd9378-sdca.c               | 1058 +++++++++++++++++
 sound/soc/codecs/wcd9378-sdca.h               |   20 +
 sound/soc/codecs/wcd9378-sdw.c                |   51 +
 sound/soc/sdca/Kconfig                        |    6 +-
 sound/soc/sdca/sdca_class.c                   |  148 ++-
 sound/soc/sdca/sdca_class.h                   |   35 -
 sound/soc/sdca/sdca_class_function.c          |   45 +-
 sound/soc/sdca/sdca_device.c                  |    4 +
 sound/soc/sdca/sdca_functions.c               |   31 +
 15 files changed, 1537 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
 create mode 100644 include/sound/sdca_class.h
 create mode 100644 sound/soc/codecs/wcd9378-sdca.c
 create mode 100644 sound/soc/codecs/wcd9378-sdca.h
 create mode 100644 sound/soc/codecs/wcd9378-sdw.c
 delete mode 100644 sound/soc/sdca/sdca_class.h

-- 
2.53.0

