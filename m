Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A923FCB2B
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777469199; cv=none; b=Hddkk8XamXX1+BgWpSTOysFW1usZaZiFM8ddT/zNbBbL1JJnBeOmbsq5xby4rnBSdMceZiHUaHh0nMA2ecMrqJRetbhE0LfvLjN9B9Vfnahu1M+9ff0MCfvrB9c7aiVC0LOoOug3vfqke+kmWlz5i/V+H0g4YiniJi8hlZPOIt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777469199; c=relaxed/simple;
	bh=TWsNgda8GiieojfxzNTcmRnGDRqgLQYd5wH99psLaIM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b8gxZdfPlv9lDKyurrbUFjXOP5e5xhG1GgDUH9rSBHpTcycoD7Jsgy9/YgZm4mEHXUz4HuUlep775Of/5XNaW3nfxOMPCa/Y4vsluv1AHCOVMjVvkClIQVgA8NkkQtwne/zF0vDhty7gnes9GA5WPgVbaCqecmPz8Rvz5mfsol4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ayMAIMsX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jX98IpDq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ayMAIMsX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jX98IpDq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pxwi963214
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YWh6Om0xoJ4At8QhzIxPWK
	s+4i1ye3iHifJMEwjvT78=; b=ayMAIMsXtPUmZHF/zTuGtjwwzZsLu3AlOMapBJ
	syLs4ua5I3XC8fm5m8IQpmdJk9Le7NHFBVuNKQiJXaS+gmbn/NDOiHd16/WFM1KN
	T4qTY0Lqpb7v+2n/122cQ92Rl0WaLUfQn435zkkJ3WwfOMpYkNAJzqw+mSF4mOZX
	o1RaI+r2YNvUOowrfvX1fTNo80c67QElUKieicSpCfKJbguF+dyB9ES0rD/PXQzr
	p0zzEYj+NFQNlRq7gsqcORCAcCiXP6GrNpbHOvdEPLlDwJzDFLWFo5xzvkLOb/HE
	Clz3TV6Add4nkeLOYdyATZvV1d9e4HcWBlfMptLHuCNuCUVg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4uhtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:26:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-362d9dd9a49so7194867a91.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777469195; x=1778073995; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YWh6Om0xoJ4At8QhzIxPWKs+4i1ye3iHifJMEwjvT78=;
        b=jX98IpDqZNqGbXjJzEhQxmzJmE+upuJl8TNIf3gayXYyzZGdl70Gd9PpO7A+lpvjH0
         tUL7x580v55zyvx5eT/mC7CMqx7MxnNV83tx0b4iu9RDIsm+NgYF5EFqkRXbx+BFLQAT
         ebB4wOyXBPk14OQt5T+LjnjWjXIyi+ZYzLwAUXIIg2iAFJY1ztiePKaS74BStOCWyjdF
         BwVGNCMnqAHTvdcVE/HhM0idO6HAi7gmXVoSWcydRKRGNPSQOYr5w+C3pdq1FIpj8B82
         e99Zbs8kaZ2Byv8H2ImwQlxMFif43wD13ebeXz8IfWz/pqkwSjkBy9USS7S6Iz/uvp6q
         bSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777469195; x=1778073995;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWh6Om0xoJ4At8QhzIxPWKs+4i1ye3iHifJMEwjvT78=;
        b=iMrRb0+UYjXWgBOBJfAUvPmRFUzKjMFPHjD95RbvvDm2eHBcWFGu6HVPOjzCSQ3Vhd
         YGomMf1huHAy8vpjbfC3R598MtLcEoQuiNwevjWMHiJYN4OJchS30DMrnHDCKxnBvutd
         PGKCa0GQbxCm3VAQKyfeDc07tE2X66D260Wv8TjuIxss8D1C9admmh/SP9hzgszD3y/E
         vudZ7X5pQJQ0O9hlAnMpXMmbzd367Z2J/ane8ku6e45VT16sQhpvScG5INMt/L9ln1OU
         shlKUF3XN0H1skEQ8RI1+FiKH8d8PjdNrWIpAymyTKAKLOrbReJJPW/0pAINJxhBtB50
         fXeQ==
X-Forwarded-Encrypted: i=1; AFNElJ8v20S7jrlPeKLxSN4YiSQTowbh4L4Wuc8Z4DM/aqyVgv4xK6QNcw6kaYMPkW4BaWWYzGXsEO1qw59o@vger.kernel.org
X-Gm-Message-State: AOJu0YxgAhbbhTazNyqy1egpWlKG0sZbxR0eutsVD0QckVscw/uBOTi2
	aJj31yFxO8qw6zUCCMKQ6g+bVBDCuJ+12SujFaDvT06jjxFZVIoWnCXHLXhu/rhrFrzKggxGy2Z
	m47cW8qZ6HHwcS5MPVyPo8AyPU0FuKDkZ0s22C0x6n5hoQCP1Vc6TYKvFuwmPG5I=
X-Gm-Gg: AeBDievnVwRegBxMFHowmvAHUJ8968ZB84a0Q9DqMVSnuDhdNPVPs5bVvDg9OqTvIVD
	iHhC9/s9kfHkYb3zH0Nwwu1ecABb/F9xOYg3iVKgODQoUEqbW/JDRN/5jYAtSwqKJ12DVSWjmHM
	LxMVoz4ZLszjHTi2s65B86LIu7XZS+qovABboVxlkcvoMDeznAdg2T1hYyCt5QxDcdDEgYgM1bB
	OJxD0ioHIbx5IsyCh9Qj9rgPDsyBcOf6TN8gKrmg466uW66RiPcFBjt4fSE2vtgbMf2ShDGg6Fv
	6c4qe9KUwMdzvSsh7tBBIqAy1ORoGV/iZMUv7YnRya7E1Gv80jX3ah7aMsjqCkuq2/SCOkdY3WO
	zhfG0d3iFB5CEgJnh05koQ+2SRBJf74SInjO+YthTP036ubOmRQyg996bFOfueA==
X-Received: by 2002:a17:90b:4e86:b0:359:fdc0:4621 with SMTP id 98e67ed59e1d1-36491fcd4f7mr7751004a91.11.1777469194692;
        Wed, 29 Apr 2026 06:26:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4e86:b0:359:fdc0:4621 with SMTP id 98e67ed59e1d1-36491fcd4f7mr7750954a91.11.1777469194052;
        Wed, 29 Apr 2026 06:26:34 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a02c5347sm3066513a91.9.2026.04.29.06.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:26:33 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH 0/2] Add PM8150 PMIC support
Date: Wed, 29 Apr 2026 18:56:17 +0530
Message-Id: <20260429-add_pm8150_regulators-v1-0-9879c0967cf0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPkG8mkC/x3MSQqAMAxA0atI1hZq63wVEak21YATqYog3t3i8
 i3+f8AjE3qoowcYL/K0rQFJHMEwmXVEQTYYlFS5TFUljLXdvpRJJjvG8ZzNsbEXRhfaZRr7tHQ
 Q2p3R0f1/m/Z9P8VvR+dnAAAA
X-Change-ID: 20260429-add_pm8150_regulators-a373f53eb48f
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com,
        jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777469189; l=634;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=TWsNgda8GiieojfxzNTcmRnGDRqgLQYd5wH99psLaIM=;
 b=kw/pQYmSeG+EO6iKlZA5+9/QwPju4/NLPHsXJk5SIWDp67HE4HeOyn46PAJaV5GWw2Tf3SDMo
 3UB8CtOQDPMBPyqlICyzslbURaDL3B2vYwO202PgsRwQUvkwZYRNmqg
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzNiBTYWx0ZWRfX1lTZe36HJ64J
 Uiik6aaDmc9XerQNeYJCO6VZvPy2xa5jKri0mlj4jNNVx3qmDReS3tjh8J7sA4T/1BmyyXlr4Wu
 FVJxXR8Hzv2FecI2vmIZXOF8OuCVLXOBqvlq8YmTs+QKAIsdWlgbf5ojdvbvoGUCSrii4/dIU9F
 bax7rN3HnIeuGT7WkNdiYDPbqbfFFjPxHiaz9yrS8Xv4UAiLhuaWHCheH+rbBY/fZMQwg9w45W8
 vZ6zXEL+hNNRsIDOM/EVutju2T8jPiwKOnqzN7i4F9DryEb8gsYXDCX34fekW1m1+Go9RscWkGl
 b5j4nE0l9/GPWLSqj4ixV5u8iREHEZvT1lBP7NWT7ivcGtl9e82JDfmK5A07sN2Vc6cIuybRa6q
 60mC26SfJNSYn+F8CoSeuENI2ZKrhRZhUj2hIro3vmSMpDA6wzdIULzuY5pYP9VhB65R5MF5XaQ
 Ger+ofrF/ESEn74cq3g==
X-Proofpoint-GUID: xQGc9VOPscCCmISdBhxLLC_y77brJ-1x
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f2070b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=N4TP71FQdQvgXifosQQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: xQGc9VOPscCCmISdBhxLLC_y77brJ-1x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290136

PM8150 is a power management IC. It is used in shikra boards.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Rakesh Kota (2):
      dt-bindings: regulator: qcom,smd-rpm-regulator: Document PM8150 IC
      regulator: qcom_smd: Add PM8150 regulators

 .../bindings/regulator/qcom,smd-rpm-regulator.yaml |  4 +++
 drivers/regulator/qcom_smd-regulator.c             | 33 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260429-add_pm8150_regulators-a373f53eb48f

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>

