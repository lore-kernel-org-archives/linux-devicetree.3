Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBEB37FF67
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 05:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788759989; cv=none; b=aZQcbPCbDCP8rtRrw9R9J+ht4eDCPcZAYsziGMFy0Ihnvy3///UxAXBOwDdxRRvgQmFru0fb1B8XWTyWkP8LaMiPH60eXQoY5jiH/5pu8keL/ExivOhSojlHnfr4eZFSZh4HoyvcfLhw5KpNSXXmDuoZnXH9EICVGQjEDb4kz2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788759989; c=relaxed/simple;
	bh=SfJosVhKNJCy6SmyYSbzyePHCfGk8HW6DTp3hKzhqrY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t/CoOQmoXyLaqtDh9zNM2HjHyK8ODPJbmJ2GBKNvgTrfC7Dp4wEIHiNfjjU8uiAlb733anqtQ73G6IIlQ1FE9ixRcOW/90alf077TNusw8+Tmk9PauWC5e2LjaQzj/cGqr7CtXU88iZ/Ev1un0LTAdR4GC8oYUIqQNHf5lwAPE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R08Hm582; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjFiCR7g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R08Hm582";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjFiCR7g"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l1jh2276438
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 05:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q4wrn6viJ00nxDXtCMsWNJ
	V3W7jPHdI5I+YOB3g6u+w=; b=R08Hm582mcpT7ADjSwmfC9cZCZE8HA8lxJh/2X
	mE3hgAndL+JoLUcma2ad7UnxnuTKjBOy9LQf18pUrz6Hj7tZ8jJ6r7LWF14eGO8s
	Ps4+xBAtD6Nv9DbKStm1+kFUsldnrh8q1JmyPJw52O9v0xiDAJbh9RNJUryEn8za
	w1sr/t3if1JDw5Pl2beHTTQvCSjr8pdcGTnT86waTxuG37MUe2ECbKtGCS2bc4qt
	wo4wN9ETuJh6a9lc+jUHfCPJz/hqF2jMm09kYxtW/+uKZyFqYUGgqJYPDCXzOEiB
	KiUFcPlnIiRLCNPLmvAqW5jnp0FekHmR7OZwaOCw++sid+cQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxkrybq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 05:46:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d55d8cd938so54826395ad.1
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 22:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788759986; x=1789364786; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q4wrn6viJ00nxDXtCMsWNJV3W7jPHdI5I+YOB3g6u+w=;
        b=RjFiCR7gwdCnJG/16DXxqUaGNotj/XCsf8nFF3wg/52KLLcwOOSTsNLMDb3aILJk1S
         X0dPGjcgZdXdfcdeqxZMhabHGsviRy/E+9wqKutwYO2NC76oth7gW7TkGuM1llO1TrNw
         /YV5+h/Qm0sBPafG1zrb5X1ShoO3Kb564QTQsC/W+xEGKdzSXr1Y+ADkaXYAUw6C4YK+
         LDTc9nxqIOIu2CqomHrU44YcRzYlTrTJmlTNEOq8oDSq4L1fZpFN5VyO7gsUO0hxekXJ
         jDxcw0SKG/arFqBP1/7OylsNB5zSAaMW7cRUnO+SSh2RP+MVlhIKWbBN+cKNjKtuyyr2
         Baaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759986; x=1789364786;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q4wrn6viJ00nxDXtCMsWNJV3W7jPHdI5I+YOB3g6u+w=;
        b=kLISW3UzXM89MspfDuIMCgnxiqxH6vHCbGOQ6t4fG4XMseAq8dc2CqA2jvAiavFYwS
         TV8HPL5V2r+9voXpLAtFGt7fA6NfN5UJ3CPioNVZOtkHgupjPxbXglADJAyUQRewP3SO
         QByUyfnh6yoM8IIMbD2S53tECxNQV+ca6XP0X41tSosnDQDUuZ/AI+YxCybrtf4+HgXK
         8s8dcJsTI/io6IhWjdr6yaCI4K0ArO6OWhF1MzptQ3ztTW3Y87Amyy+QFgFirv+/xmlZ
         OY/xVZNomAIkLXT8emUYknS6nboksS66vS9zYVH/aDMDsHF5XYPcMezQsKEldWaFJ1f2
         K75w==
X-Forwarded-Encrypted: i=1; AKwUvBwQCaMoJtNlJSogaBCgcEnCRnIDdC1UNPzeq+8NPLj+9IeYkNEOvbty/ROEpRQQ53I4oD2e7/rZMQoz@vger.kernel.org
X-Gm-Message-State: AFuF++k0zTH6zmKz6B6nzjlc2cGHQGCfy2x0EzrKZzNZH3UVu3CrDRMh
	lbnwbx+a3d3etfE8sybgicaWEh6lBDnxQABRHgUd0zeW6ioOhL0ZkOPcfCOSAlWpI7fyWaU6eDL
	SuDCGkSylIdvOYVaMn4Jo2V0TSXgetwRyKWEaTIxxF6bIThxNAIXdHqyDh4zGDeHz
X-Gm-Gg: AYBFou2AZDiKFHRAch9RB6apY4XRiERNq5UCHWw0uLb8ufx4KeWGiuJw1v2SiFFAAnz
	jSXtpGVV01NtMPBW+CEyGr8i8PMxI6S71MtdCOh0R6AutzY0CsIQ3MTMWZxj1XCLJUe4z1lJYMQ
	0bSkF1g9n4Je13zNha85BySDxhXhcoYFyZaR/OG8X+gm9UXdWspVfMJjE8SjZIhjBh/9paVrJMa
	OrV7axDUchIa3Nz5zKM0HkE7Mn+DqfJI0uWgVvZUuBDftOchoFH4lgFw192+UOFyzAO09LQUOzm
	zqy6B6YOKAwlkcuMEcqrlx/eFmhvqumllUVKbLbeUyEqGBO9sY84PFewHfWw9emISader39S6nA
	E+inuN0/DmSeCVvwew9supK3RAsDBG/HzPKUg
X-Received: by 2002:a17:90b:2ccd:b0:398:9c00:29f0 with SMTP id 98e67ed59e1d1-39b2628fc25mr33982054a91.24.1788759985750;
        Sun, 06 Sep 2026 22:46:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccd:b0:398:9c00:29f0 with SMTP id 98e67ed59e1d1-39b2628fc25mr33981993a91.24.1788759985322;
        Sun, 06 Sep 2026 22:46:25 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm24022589eec.22.2026.09.06.22.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:46:24 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: [PATCH v2 0/2] regulator: rpi-panel-v2: Add required vcc-supply
Date: Mon, 07 Sep 2026 11:16:06 +0530
Message-Id: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ5PnmoC/yXM0QpAMBTG8VfRubZa0xivIsnm4LhAZ0hp7264/
 NX/+27wyIQequQGxpM8rUuEShNwU7eMKKiPBiVVLktZCN6oZRyFcbkx2mYatYVYb4wDXd9T3fz
 2h53R7e8cQngAE9FdLGsAAAA=
X-Change-ID: 20260907-rpi_reg-8c6885b35e5b
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788759980; l=1700;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=SfJosVhKNJCy6SmyYSbzyePHCfGk8HW6DTp3hKzhqrY=;
 b=aM4ZeAqC/OnBVtphNYrAhbU8cdn1h2Mi1mDpLrR5goJTp5yDeRgftyN1MbzAm2KFcdh1fSFon
 EW+GkhWJDvtD+bo5cMDevFlEhTzyCSYtNlUpwqgphtRM0dOghqEKZmg
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2MCBTYWx0ZWRfXzCudOA8JnJXB
 1d+skd6kGEo0tpnPSWR7L74TUJK4fxGV+I1PUgzl3VAfFIUxggwbyQVIbKq+g/e1qRQZTw6CEok
 h56mtPmqhiLGj4ODpv53lF/SgLuph1dWjXETMFu59BlujO0UKRT1jZ/bGp6Y6qpNRGpgx/cabr8
 f2uBECTFLQBueheRoQ+xNe7Yed2xYirXRExDs2qrjiOsxAlkr2+9BhipLTXvmwxiaiGwdfL1ch2
 inKlX6oly9aws5cQlV/iVZfOIisyQzMxvaes5hoEewqSoQqaSVNY/ItN4ybX3zIZ55HIx8glEW4
 M59JEM9LC27iWmbSLuRYwQL3J0y7DHv9UDqZunw+3PYIRe1N6afFNAQrsJ3nP0sMC0vHUqPIsiw
 4wbGHD/0G5oGLXCBbtEI59AEPVJqPxQnpTw4XDOdXwE7d7S/91GytXU5ANxOA+x/UzbJjiKJ2Ss
 cqA4ayzyioQlaxlvAYw==
X-Proofpoint-GUID: mv4hhOKI_RAeOQUhyzRuc_tTqwcVvRk4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2MCBTYWx0ZWRfX3N2Qnkpqv78B
 smCsVwbA+wMbWJq80x2//oW5r+QM9nWIw216I7t+3Q9gRAtjqK3Fi5eRnDs9z+DwYCFgdpEFkMF
 ktsO54Y9f5voGLaMMr3m5RkdHjLukRU=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e4fb2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=b3CbU_ItAAAA:8
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=jWvc-858a9c_bLaJeVMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Rv2g8BkzVjQTVhhssdqe:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: mv4hhOKI_RAeOQUhyzRuc_tTqwcVvRk4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070060

This series adds a required vcc-supply property to both the dt-binding
and the driver:

- Patch 1/2: dt-bindings - documents the vcc-supply property and
    marks it required in the schema.
  - Patch 2/2: driver - uses devm_regulator_get() to obtain and enable
    the vcc supply at the start of probe, before any I2C access.

---
Changes in v2:
  - Made vcc-supply required instead of optional (devm_regulator_get()
    instead of devm_regulator_get_optional()).
  - Added vcc-supply to the required list in the dt-binding schema.

Changes in v1:
  - Initial submission with optional vcc-supply support.

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Shashank Maurya (2):
      dt-bindings: regulator: rpi-panel-v2: Add required vcc-supply property
      regulator: rpi-panel-v2: Add required vcc-supply support

 .../raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml    |  5 +++++
 drivers/regulator/rpi-panel-v2-regulator.c                   | 12 ++++++++++++
 2 files changed, 17 insertions(+)
---
base-commit: bd2a0c2d8c49ffb7acfcb0c1177af355ea417caf
change-id: 20260907-rpi_reg-8c6885b35e5b

Best regards,
--  
Shashank Maurya <shashank.maurya@oss.qualcomm.com>

