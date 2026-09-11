Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01386450909
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112073; cv=none; b=j/0ZdQ/Kzau1WIJcCa6+vYlSuZa5RShfcyjn6zADZfsRL9Rn9Z+QogfXHec70YwB0sixVQp6JDEg3N5hEHFhKiSm4ic3YorZqHU6xpGWxtTIv6kKSQAT+wkTl1JDjwFW0P3t1Ft5nQ1rFKjY04a3pU8FgC3axDS82YAYj4WUufM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112073; c=relaxed/simple;
	bh=/XV4B/ajZbMtzz75c2d90DGyrSxX/X4ZyRUZt/hQ2UU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g56ApUS5C70cTs4FoGOipzSOCm8OIbQ94kmfkeW3x+J6/jPkI2t3yYYt76jMvW1xRzhmN+rU2g90UWahrfvB5+05/q9yY0D8sxDq3hlRA1pAZGAOMvnkdALD2ekohoDD8KZAYsMCxb1ACVNRIAEDkGv2sNkFztkoX08G57/Zl94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2eChdZI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BuFafCik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2eChdZI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BuFafCik"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kCdZ286206
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BZWIut35apgwu/A34S2lk9HsAvN9vo1ftL5
	tIIoGheA=; b=U2eChdZI4measUgiayoO7aIxmlc5D7onlACYoSWpmfuuJMAdOmG
	s3CAHxiG3NLop1T9LhRTzuucmj/vrjTjrdkWYL9Uj+So4g2aiBAZPvoyVZnOxEuQ
	Tdd3BMjVO3n2ChRiQv5VeT2mI1HfcnG/oMMrSqSN/sE2MmB8eklGLC75W0yDanSL
	k6/KjywU+nco8X+eUGHXaRUKP2iOf+cKmkCtb8xjEN/pvvy0vSJ7Y0xzn69eTufb
	zSbShNOnfW3yiML6l3rM2Qi0GShj25KBftUatGbK5cgfODaF+qoI+062wS5kXXLG
	XyzNmBZRWJO34vApv2v6fawYmUtyxToxGqw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbf8gg87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:34:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-399311947f6so1226800a91.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 00:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789112066; x=1789716866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZWIut35apgwu/A34S2lk9HsAvN9vo1ftL5tIIoGheA=;
        b=BuFafCik+Gbo7qLQyhageFIiXjda+NBZGwQ2A/EQqI4ohG70hQTjLrxqY4MmtRlRPc
         iHPWSMBwUi3rb6INK0aX7EYS2UukrVeGltVwhw6K1kbT7RxPdD32zNggghrk6wBZieYP
         HVHoWCf3MpM0jMyOxxHhzQYP5kCdOJSsbUfwL4/9ZUSS63TT6SJ0zkXrfsFmcPp2Fp7W
         ncy45PvMfdlmEymoN22q6gypiw+e5mX65JLfQ0+hCLt0yzmSft9cuVrEKrgfRTCk+71U
         BiQdMGxpigCo+PJ3DuX/ghk34CZJHMEEV5pNGhZHsLuLuxaPd5dK1viP8bVQMA3Qbovr
         inyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789112066; x=1789716866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZWIut35apgwu/A34S2lk9HsAvN9vo1ftL5tIIoGheA=;
        b=PMASTCSRxL2gd7DBLflxejDKUD9oyxlOMjwIJN4h32KFo6d9G3CvBKbP5ALSlHOh3/
         xKBlsQ+qI3+0zMbMTUdxujP02EMsnuS87p1LkJk/P80I4hCPYosQS+qgWIjRoj322Vig
         SpBd5KsUiFJdlcBDtdPtPXlpor67xk0LMt780JKVeVmt7oAdSxBd5uB6yebvN/jKTLq9
         6FoODYU+o9RcDOlJzJwoI5Ehe/tZZSfK+969F1/S9bFIjfCcWoUpCLpdyfhbO4IHpsuZ
         Wbn5NiDdvcR+hv8+PQZwlV2VK27X97Yc97PZVMq5u9zE1f55DTkUBHejhJhzUxxBPiV5
         E/IQ==
X-Forwarded-Encrypted: i=1; AKwUvByeA1UHIrH29R0t5jbqTZO1GCqSgwcL2kbEq7o53lBqPFlmqgNK/vom/fB9Gd220UHuccUgioQ8SIQQ@vger.kernel.org
X-Gm-Message-State: AFuF++kHTeZlYma4vukXpewnVkCogZPFb13OJQnkukftNC3uqzcf5YtW
	6YGTVsK5Vu3TbOt6IRDr2H8HHC12CbNxyQMG44KvKrfgBowcrdFGDo4IncKMP7pGP2LgZkzPAY5
	+CYNEnj/tCUZCmOFW5ld1p9oEB+6bZRmwvAPkDO0gkme1aF6WY54SwkO6PSLQpTz+
X-Gm-Gg: AYBFou2xZUUMEigYth/UnyYYc30oQVvQ7wbT7Z8kBo9S9aMJ25bW1gWe1D3rtmteyHM
	cJJbur/7gGdv4eRxRtYm+ldzQXv5pNxeMKfxDXIciDZ4IujHnDDZQ7z4SXrAU/q5VUKVXk+WohQ
	AWrrgI7RJAsV4Anws4fImtFlCW9Ay2OHHKJexLMJTYpYfyqdYLYXPMnW9JzCRfChV/1YEof6N85
	8/4Tj46dPVTxb9wpOXlLiT7ArFpCMj6/ALh5NFe9cTqF17Qf3QSLg7CENpVspoMGEvEuDNVW/9A
	uZIKOI2NO6qx/AiAq0PV/2Zb9QvuwrYVR/NrskRDgdvH4dQmPvOlOt0j5gKB5huEF9Y2iQhGl5k
	tTq5RQfehE+OeZ84p404V+7yM1/D901f+YPK6Qd1qCGGD+5pvOWxsyniqeV2u
X-Received: by 2002:a17:90b:5287:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39d9c22e224mr5177688a91.20.1789112066305;
        Fri, 11 Sep 2026 00:34:26 -0700 (PDT)
X-Received: by 2002:a17:90b:5287:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39d9c22e224mr5177632a91.20.1789112065734;
        Fri, 11 Sep 2026 00:34:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365ba729dsm6163058c88.14.2026.09.11.00.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:34:25 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 RESEND 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Fri, 11 Sep 2026 15:34:12 +0800
Message-ID: <20260911073414.16711-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Pn5k2vA8bq-cl3ViQm-5T5KtFIigJuwz
X-Proofpoint-ORIG-GUID: Pn5k2vA8bq-cl3ViQm-5T5KtFIigJuwz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEwNCBTYWx0ZWRfX7F+7pyG1HJdi
 4LifLAiP1SkPdkV9K+E/8DoV44tkcU/+thF7xScbTXAZLXF47W2tWcyovgpVvvznYhd9KPRofSm
 TWw4bTV15jzcR+Ms2fR+CIow5G8wkUMvSHTN90I8i6Z3mWqlHrjEmsGmYH093zVBsyq1adRTW76
 S73tMOvR+BwHvp1twWNir21/5VsmgV9Gl9ogPnmZ2dKntGCelG76m1cZMjhF8w7Nwqhh2YSE3sX
 748ZO7XDc9HKsBaYQV05ULM5YXbJN5YKn9Vp3Zpl8X9c1CzQafIQabYR0QEY4+nqNS2AuI30Uht
 7Q+ZPHhRyYMk8aM7Y6WF1JdvZPQookb1L3wRt5yawthmgA5rWTtP+GYMMyunrlmMfOaml94/6AL
 ruwyHqiUQePG3W0B+W+lJugFaRwkvTB/P0fGALyAuO5D0GGJAxHshUWIeiJuOV1626i3L5G2d3h
 Y5vPscOuNUSOpHMkRiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEwNCBTYWx0ZWRfX9bgk1xz5zDDF
 gzGt+PZJ4oc2vB5+DA4a7XkLNq/nwPkBS4VDcdyLgWYLEy+b6y6svmkr39xUICeaav8zJi5E9pe
 72PoqFi0ji+ZU8CGNAFJ1U65rpKLAlc=
X-Authority-Analysis: v=2.4 cv=UJFIjyfy c=1 sm=1 tr=0 ts=6aa3af03 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Sth0529Ve8dJX5Jf890A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110104

[ Resend to drop v1 Link tag from both patches ]

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

Changes for v2:
- Drop include of <linux/mod_devicetable.h>
- Link to v1: https://lore.kernel.org/all/20260902045938.184221-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (2):
  dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
  usb: typec: Add onsemi FUSB15201 driver

 .../bindings/usb/onnn,fusb15201.yaml          | 152 +++++
 drivers/usb/typec/Kconfig                     |  17 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/fusb15201.c                 | 580 ++++++++++++++++++
 4 files changed, 750 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
 create mode 100644 drivers/usb/typec/fusb15201.c

-- 
2.43.0

