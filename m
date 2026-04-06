Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B095B3264F3
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775473285; cv=none; b=OWwgSl/o6pnII8rR6mkSOJZgwD6Dnbc/Ld4UxnjkYmogs2gQvIaqxuHiYblk5o+TBGO83VTObupeAdsvRlTSEJUgzMbtZB1494P9AlMatWgEcdKEeg2TwwCsMAYl5DHMnAd1XeaTHJsgU9rW/3Sc+oJJzlv8Hb81oehwE+M6+Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775473285; c=relaxed/simple;
	bh=Z+COagVtvSY7qScaAgv0I93kzs9zegEG5ZBNHqyJMsg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=czZ+wkAR+wmw40hb2Jb1tHQYzV5Y39Rydts5t7jijdEGOe3Pwfy0hAF6vVdAbTMf4Bz5DAktl3dxwllFGUS/jAZbAz1ftp3/iLe9l87lXoJjw/4f1ff8KcA5FsQ8aDsXUvMqUZ1RbKCVz+qx0qUiW94r4AhY3Cu6oeqXYhEiT2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8KU3rVf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TD4bVN9K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8KU3rVf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TD4bVN9K"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6368Eapp3173845
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 11:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lB2MUUqhiDElsj3sg2cUgJ
	y6vxYa8HLDpforxpI+QJA=; b=Q8KU3rVfrqa4eMr8RMl0wA0k3X18YhnCERpv7p
	lx23iXVaVtNpynO5aYNIsWcE2BCD0EvMTDsQmgU/BB3JboBPkPDo9WIA+4mVNewC
	6Fwz2hoDc5YINMjxpBe+B0mJP4buJCkXZc761scjkqEoFWkCBwa1dnUbDqcY+/cH
	FDA4WeciWv1J7l7O3E22nlpPyH8SqgVwkPnV+BktIv7RpylhlnjpJPE7vtznnhdV
	7ESwYRve3+NQdmsjTf6zfy9cjVjhzVoHfpHavSn/VipH5JUaKDI/wItK6sYeevze
	V+qRkl8FhnMTUfKYJJoB2+Nnbhl0Mk6aggk/G5dgLr1BSOIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrn23m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 11:01:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2523e0299so99592365ad.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 04:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775473282; x=1776078082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lB2MUUqhiDElsj3sg2cUgJy6vxYa8HLDpforxpI+QJA=;
        b=TD4bVN9KdnmDWiNe0C3Hy5cAdcyuRgdMiK2+z4/3aajHv1s3kWTnxy4/xk14gZYF+d
         +z7YMgz936QLiirwYkj9qThLzGz3dOx5vYQm/2717QT11FKITqKSKcmAVfFg5FFgYzco
         TEJwmwRGSjXZRY+x/qssg6gVyOYEFtkiX6hW4P2dqoQxitRwrMCY28EowxHiZ8r+FdjO
         fuoG9OtO2tCU4+Eksq06ErZuogJyaMOP73T1id/0xPEi3WzzeXtPJ6TGwnC4bT2xou9Q
         52mmkveDwyURsJLpXfV1nuAodHzMKld7ODPAHrvW3OPev0DgiAUKCwy1k1pUH2382e0I
         D2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775473282; x=1776078082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lB2MUUqhiDElsj3sg2cUgJy6vxYa8HLDpforxpI+QJA=;
        b=eLhwCqYu/XNbDZ1/PU+kA95oSan2aroMsc25Xn8DDO17ZHXhGey4Fu0MJYasXumz1D
         UHmmgdEI2qSHykICeI6yQwx/XrKe0iEpesCcI5YtTNmlcCi4dEPqU7+Zqyd12kIxBJqh
         ofpw00pQdaLOQKA7UjEnJiS1crTRGTzyCJrfmipBPzwhZ+enFjJFMBtr+ThTuLP378iw
         Rpg9Otz7/fxWpvqj66OFFtcMNeCMqkzxS2m/uugyIGVL9JQOOSCJFU1EpXhENWFUaAi2
         BvmQZTzkUyiCBJeOqGaaNwbcV1x1xgBCctmofqFuK699Zrw2SyBPuVeD2veKEO+QgEdi
         v+JA==
X-Forwarded-Encrypted: i=1; AJvYcCUOK+TrqYqEwnqdyERgIZgUFhWdJXpN6GP08Fb0asH2aymxKIpevnFxGJ7pulVTGjCK7BmvT23kmQka@vger.kernel.org
X-Gm-Message-State: AOJu0YxUVd7StEi6dPhc0/JNeYQ4nXujYtZULHKi8+VHYUDyB5hSZtYP
	dn7QiSr2ch6Il9NkPLY+FTrk0cxOxyYj1GVUVkZeEjGzixdryzKyaJ6eCIQVR+Hwa/QvI2Jrv8P
	9ac7QwV1kUsrtGR4SOID+zWjupzroov4LmhEHy3MHHeVmksHG7YpUynh/QXPGesnh
X-Gm-Gg: AeBDiet6QoKBYGkW/ouHzwBj6EL9QK71M9AxU/Z053raehrzCwc0qJm8rMtSKaBnV4Y
	XX/ZIHZlv4xnDMD+9fDP54VNB6fttVFNKF9FJIAVm4wO3aaAqToM6KjnQ1Bei03qHoGlujyv6Vo
	mN7tew2vxS1by70mZQ4bibIMhjHXN6RT1eHTErllAccPYBsy1s3/jM8+Q1VEDfkPuGDvS/GhQ4V
	CYc1s17PhVRW8NOsoZ/o8MnWO6hOdgOIgf2kE5+M3oWmWgj88QLlV5G/ay7j2gGf8SQoO8Vhj17
	p5ikegzV4iwxf2CqDgd+UQsvVAHbxkkQNj1foQPu7Jh9v+iJPhevswDG1bSsnPzZh5ycfyuCShH
	cbNArsg3VVaVd+Fz8LoygYqBlGCheReUcKNRDpi4Vr+N3IHrt3qnGtZU=
X-Received: by 2002:a17:903:3508:b0:2b2:50e1:f104 with SMTP id d9443c01a7336-2b281706efbmr134201975ad.3.1775473281070;
        Mon, 06 Apr 2026 04:01:21 -0700 (PDT)
X-Received: by 2002:a17:903:3508:b0:2b2:50e1:f104 with SMTP id d9443c01a7336-2b281706efbmr134201435ad.3.1775473280560;
        Mon, 06 Apr 2026 04:01:20 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27475bc2asm141696075ad.19.2026.04.06.04.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 04:01:20 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v8 0/2] Enable secondary USB controller in host mode
Date: Mon,  6 Apr 2026 16:31:11 +0530
Message-Id: <20260406110113.1709886-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d39282 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8zYQ9h4_9WEeR1vsXXYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: agvwaZ7Q1WXubc_uuUhNnc1a5x-ZNSkJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDEwOCBTYWx0ZWRfX6ORkUQa9/wxA
 fqsEIel/RpRrZqs5l9WdzDBdHVSDrBmWaM0nSiQZ/fz1lOg6W/2el3i7xy+tFwxGYt0dBjcu2WT
 JJ74qgEf3xKuoK6FI26+3VpKAOKwcd22K7V7r54hVNTjIf0QFcelEn363A12lVuxiX9PsKQ0jxv
 JTVZ7NkOHIpMZ/RONy7xM7kB8DzSo8KlZe90Ra1az69kxV1ozDfn1P4y1d4Ww0qEPTc4L8YA3Z4
 qyp4oT9Cd8PQoHD6eDW4IZgZlNFA02HrQWwozcJyMkT5Qhy16s58vpO5EFFihxmcFNM9bQUWLQl
 2kJ6OjfGfl3AckSZeaw0K5Cun45W7q+WoWHzQ3O9mMmuJqtELYdq3noJtdcSKx3WaJFYUJno/Un
 btTmDIdEEV48xKR8/NxifBHAhDyOue61wJCA48PBL6IsVxM1vSYQottVbzSZXapBFCvPYJ5d7Sq
 6Wo7VbWgf0Gmbst4eNw==
X-Proofpoint-GUID: agvwaZ7Q1WXubc_uuUhNnc1a5x-ZNSkJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060108

Enable secondary USB controller in host mode.

Changes in v8:
Removed unsed nodes.

Changes in v7:
Split Driver and DT patch for USB1 controller and USB1 HUB support

Changes in v6:
- Removed vdd12-supply property status for all hubs.
- Added connections between genesys hub, HD3 port controller and type-C
  connector as follows.

GL3590 USB     HD3SS3220 Type‑C  USB TYPE‑C
   HUB         Port Controller   Connector


HS HUB                           HS con

 |------------------------------------|

SS HUB          HD3-out          SBU con

 |--------------------|

                HD3-in           SS con
                |---------------------|

Changes in v5:
Updated comment description in DT.
Updated vdd-supply status for other hubs in bindings.

Changes in v4:
Updated power supply property for hub.
Updated details for all 4 ports of hub.

Changes in v3:
Updated binding properties for genesys hub.

Changes in v2:
Add Genesys Logic GL3590 hub support.
Rename hd3ss3220_ instance for primary port controller.

Link to v7:
https://lore.kernel.org/all/20260403100753.3477925-1-swati.agarwal@oss.qualcomm.com/

Link to v6:
https://lore.kernel.org/all/20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com/

Link to v5:
https://lore.kernel.org/all/20260122092852.887624-1-swati.agarwal@oss.qualcomm.com/

Link to v4:
https://lore.kernel.org/all/20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com/

Link to v3:
https://lore.kernel.org/all/20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com/

Link to v2:
https://lore.kernel.org/all/20251216120749.94007-1-swati.agarwal@oss.qualcomm.com/

Link to v1:
https://lore.kernel.org/all/20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm.com/

Swati Agarwal (2):
  arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary
    port controller
  arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host
    mode

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 176 +++++++++++++++++++++++-
 1 file changed, 172 insertions(+), 4 deletions(-)

-- 
2.34.1

