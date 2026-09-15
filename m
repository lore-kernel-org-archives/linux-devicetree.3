Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9664B337B
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491437; cv=none; b=m0AL+FlCK8SB3smRbbzgU1eHMl/EX8hLmU4vS6WuPIVTVpYRwa5x+Jm0FLfiN8/nemN5dZgAxyQYNFS12wAVbtSQPfPl5EjrccMsEkZGEir9Bak2s7tYRgDg0FPjnsCb1o9VaL4gbyEcdDTkDVBKIdiEXlQ6rktyK8YbzB2Nyvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491437; c=relaxed/simple;
	bh=7sZXCJrlcQe6tWAnvFSzQqrjQWl6F0vafplST4Apil8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qBYBvj8cwt2FAfAYmZmy5ynCyuE176AOZdhEdAtBPkxh4UXAXmOyBjcTF+dtdJm8PXhEQ1bxREFwtzCk06oBC8fBXDJjgyqWr6nHHaxVmWI8ZjuRH0+B5da7Lc6u7mADg7pTJsa9A9mc7PCB20BTEKPzubnKxtkpcrhG6bVXoDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OjZnOgzx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U7GAPlaF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjZnOgzx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7GAPlaF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAP9a1014131
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MI9Kl7QZCeP7JVMjKmDtliZY8ZENsVTkKBw
	Bqm3AWGs=; b=OjZnOgzxB/Ny/uKwILwfTDmDBotboGiLbs5GjDZllgRDP51/nrp
	GIaviMks4eOhaIu/0bdDTfgotEs1RFidTkcSbGEa4HV+nOBqWwGuCcXeX+1dMDeI
	vVvOxDjfHMilqgx//l2LikFX+ImGINhUYOxKbOx3FJRKM4XYZXyuNQdNhx4CuMSL
	WRIZoOWB6dlHyx3OdxlnK+mcxVbQOn35gIGV76EzpvkkvVjJVaF+G/UsOXcl+DLM
	vPiWfs/r5pc3QlnQSjxmsOPwTJStpkAFX5q/Th2Ugcw0m/IxkPBunw0iKiths5gp
	1aLcfC9Kgl96yvrBrOk2fPILLY0IfW03KaA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea32vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:57:14 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-790376c9f8cso1192482137.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491433; x=1790096233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MI9Kl7QZCeP7JVMjKmDtliZY8ZENsVTkKBwBqm3AWGs=;
        b=U7GAPlaF7yJEerwi+ZDWNtGQvumHelZKPJ3MiIFdiAVCw1ZT6hDOqDq0Ynz5eCbeba
         PBF38+wy+Wwzd2e/KDl/sgltxZxCVNXiEMwFnwkjSJlEJYl53wtcQ626e+VYfkjiU3gH
         tlAnraghCb7ob5unwhkLkJSz48Meic9nGZQ+128UzYeuKy6v4YW4tEBtTgieXEuuWY7e
         Gu8/FskHki1v5y6NlfzG9aHY6AcpfPaxzplFxsdP6dlfYeRPiMM7FvN6PjwjO7oVgikY
         dP2XziQbsAh4pnTE6Xhx7nuoxii2ZNZnq5CpEoqgthUg3zlxqWxIJNCogiLU3Q4UtA/j
         Qv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491433; x=1790096233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MI9Kl7QZCeP7JVMjKmDtliZY8ZENsVTkKBwBqm3AWGs=;
        b=VXkrgDIwZRbx0H8gwAQ2DPRULr+oEHhV5F0uUTWCyTO/+hKeRKEO2cszfdAQPwvGKQ
         3RrCISIWtJMnciOIVakO/+4hBjBV5PHKT3h/RSK5JY9s+nM0hj75jKJrh6nimTr9zN42
         JdcJ34yQ+OFOcqS7X6H8aLYi5ec9Rqz9IPPsapDqZp5gcI6UWmuAs8OWy2lXnqOLMA8j
         CNZFJUkgELDj9khKWv5hHR5qZ6Nclt24beZKvh5+S5m7BtnS8JRSqdW6Sj/EM8JedJG7
         UeZxUcw5594AwbTvU82l1PImnm1gyiTZgvXj9dR2HfIqQXfNwZjHm0PO4yRCLUldsznA
         cnLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLTGdtREmiwfr0MXzz83xAXjqRkT3F7zezv+xN2PQoAX1QXifRyC1yKuQWEkVph5AKGUMi+EIhVDx2@vger.kernel.org
X-Gm-Message-State: AFuF++nSX2GCv9AvQ/zlk6p6iGPq+g8gku0zeiYXBaQqPRQxx5ct/DOf
	Xalb9UVR+OeeayuMSA/e5hD4Nisf0k2pUdyMd9XjVi1JVOprPKX+KEvJFpMd105c1AgwhiymptX
	+PlNOP6C30Z1BJDFFsTGhl3CckXbfStrQaACezwv4zGlziocJ2eWqj7MCZ/ZMMvk/
X-Gm-Gg: AYBFou3dnjZYaZ6pzZ2c91ePZYhAfWEOIpSP8wrNzjESutq/b45EqRoUXuj/4dEqrSB
	lCvsLBVdJkEknmjwyevj2JJIO3aib0EgQXtU/KFarO1YM5x+pICOanUHaZCgfGLYblhYYgaj9TM
	rnTnIleZwmqnFBWoaG5MvC2hJyOOolnPgxFk1VUUFLY2Td8ZAm+8tkCl7GM5NabjTIcXiAOi1Kv
	jUY8vBCLizUoCcNh2EM1N9NvWS+JNnQGmRLpL/RKbxQkTlLEwvubBcwtg9SxF2WjvblxaQfCKz/
	GkDrxXwd1jGiV9wRfxpKy8PUSL4ZDKK1B6SuXwKz6Y5zuCu8cYe1i1Oov2amlTrXlHsSP4sMAVc
	s9dkI86E3+oufKQ==
X-Received: by 2002:a05:6102:6407:b0:79b:ff9f:74cc with SMTP id ada2fe7eead31-79bff9f793bmr8266156137.0.1789491433070;
        Tue, 15 Sep 2026 09:57:13 -0700 (PDT)
X-Received: by 2002:a05:6102:6407:b0:79b:ff9f:74cc with SMTP id ada2fe7eead31-79bff9f793bmr8266072137.0.1789491432543;
        Tue, 15 Sep 2026 09:57:12 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm4361335e9.3.2026.09.15.09.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:57:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/8] ASoC: SDCA: Qualcomm Tambora (WCD9378) SDCA codec support
Date: Tue, 15 Sep 2026 17:56:42 +0100
Message-ID: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ISNFINXMrbszyGgGv-dJ6H6kUIe2gmmz
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa978ea cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NRmDave84CxBQQXzKXEA:9 a=O8hF6Hzn-FEA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: ISNFINXMrbszyGgGv-dJ6H6kUIe2gmmz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX0FCK8PzkiHON
 TqL4q/aK33jt+OFehzXpKDSECY0KdXBsDODFpFwABUogoJ1eGzHBQLagjY8W6ZzTHi1HH4OFxaa
 WmPs2cnjc9F/FTAHdNnScm3MUs9GwcI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX2tWF0mUiaOBH
 47/ku6g1WZYkD7864F90l4sc0LvxlUSmgi6MJw/mkzvUCRxV+mL3VCYXSOnTVocM+RaQ4xDFfK/
 77Ac1TMROUkh4wqfwfO9MGGM3RcpCW3kUBxiXg9WMdX3XZsDmQLm/C/QHUi4mrKj10QsQUlW6BR
 MlvMMMzsrc85UALD6OqxKExLVWDEXK+8zg7EKZzoEZSLfajbgjqhPDpdSNAewn5kwCH+Xs3MwcM
 1m2lVW6KVBBUucmUpZhfvq6cArOC0HDq7AHlfY7ma6cKsid2KV1XnZlI8A1ZaBO97VuzpUW6npL
 DnqfclugKyZM6jbNIGQbPvPBElVXDTtVoGMR7IOFYX+b/0dcpGVJkbxsTxibefzBVW8reH53hg7
 os1GFZ5PSjNE6qXKFEOr5UxbtHtlOddt9994PIvm1Gd/fMMSpDOjYixtETtZjAsWuv4wsPtwauc
 +/m8e4NZbf+1s2TzyXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150247

This series extends the SDCA class driver to work on DT / non-ACPI
platforms via a codec-provided static topology, and adds the Qualcomm
WCD9378 (Tambora) codec as the first user driven in SDCA / compute
mode. Tested on the Snapdragon X2 Elite Glymur CRD.

Patches 1-6 extend the SDCA class helpers:

  - Kconfig gate to build the class without ACPI enabled.
  - PM helpers keyed on a codec-embedded struct sdca_class_drv, so
    codec drivers can build their own dev_pm_ops.
  - Class SoundWire probe/remove exposed as library functions
    callable from codec-specific SDW slave drivers.
  - class_ops with a populate_function hook so codec drivers can
    supply the SDCA function payload from static tables on DT /
    non-DisCo platforms.
  - Class function driver registers SDCA_FUNCTION_TYPE_SIMPLE_JACK,
    and resolves sound-dai cells by entity index.
  - sdca_apply_default_control_classifiers() applies the same
    is_volatile / has_reset flags that the DisCo/ACPI parser would.

Note:
None of these are functional changes in sdca core, all of these are
helper functions to allow non-ACPI users to use sdca core.

Patches 7-8 add the WCD9378 SDCA / compute-mode codec:

  - dt-bindings for the SoundWire slave in compute mode.
  - Codec driver split across wcd9378-sdw.c (SoundWire plumbing)
    and wcd9378-sdca.c (SDCA topology + class_ops), sharing a
    wcd9378-sdca.h header. A future mobile-mode driver can plug
    into the same module by adding its own files.

Testing: HPH playback and headset-mic capture confirmed on the
Snapdragon X2 Elite Glymur CRD. Will test it on Lenovo T14s. 

Jack detection is not wired up in this series.

Changes since v2 [1]:

  - Un-export sdca_class_pm_ops and per-op wrappers; keep them
    static and let codecs compose their own dev_pm_ops.
  - Drop the exported sdca_class_read_prop() helper; codecs
    open-code the four lines locally.
  - class_function: check the codec-provided ops hook first, fall
    back to sdca_parse_function() only when a firmware node is
    present.
  - Rename sdca_class_hw_ops to sdca_class_ops; populate_function
    does no bus I/O.
  - Drop the hw_init callback; codec users moved bring-up into
    their own SoundWire probe.
  - wcd9378-sdca: MIC_BIAS fixed at 2.75 V via the init_table;
    drop stale qcom,micbias2-microvolt reference from the commit
    message.
  - Rebased on b-next-20260911.

[1] https://lore.kernel.org/all/20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com/

Srinivas Kandagatla (8):
  ASoC: SDCA: allow building without ACPI
  ASoC: SDCA: export PM helpers keyed on sdca_class_drv
  ASoC: SDCA: expose class SoundWire probe/remove as library
  ASoC: SDCA: add class_ops with populate_function
  ASoC: SDCA: class_function: xlate sound-dai cell by entity index
  ASoC: SDCA: add sdca_apply_default_control_classifiers() helper
  dt-bindings: sound: qcom: add Tambora WCD9378 SDCA codec
  ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA codec

 .../bindings/sound/qcom,wcd9378-sdw.yaml      |   91 ++
 include/sound/sdca.h                          |   23 +-
 include/sound/sdca_class.h                    |   70 ++
 include/sound/sdca_function.h                 |    2 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd9378-sdca.c               | 1005 +++++++++++++++++
 sound/soc/codecs/wcd9378-sdca.h               |   20 +
 sound/soc/codecs/wcd9378-sdw.c                |   52 +
 sound/soc/sdca/Kconfig                        |    6 +-
 sound/soc/sdca/sdca_class.c                   |  148 ++-
 sound/soc/sdca/sdca_class.h                   |   35 -
 sound/soc/sdca/sdca_class_function.c          |   45 +-
 sound/soc/sdca/sdca_device.c                  |    4 +
 sound/soc/sdca/sdca_functions.c               |   31 +
 15 files changed, 1474 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
 create mode 100644 include/sound/sdca_class.h
 create mode 100644 sound/soc/codecs/wcd9378-sdca.c
 create mode 100644 sound/soc/codecs/wcd9378-sdca.h
 create mode 100644 sound/soc/codecs/wcd9378-sdw.c
 delete mode 100644 sound/soc/sdca/sdca_class.h

--
2.53.0

