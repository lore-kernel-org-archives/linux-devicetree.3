Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE09C3DE45B
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792934; cv=none; b=oLdz60XJFKlqt4zB94MGCvorhrd66SLw2qOOIdvFSSi3b7r6Sy6NzB3w29LCUJI79EnpKNV9ImtbwTl+zPEL2gi8il9Y/6nxoneQ899VDSnlcBs0QKv6kBOkK1gMfBe5srnk6+J3K7n6hAwwz0plS/qOC8v1YtBEYrT98Qkirbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792934; c=relaxed/simple;
	bh=zb4Ff0vj0Rip79kK/H2K8PJcwVDoHRmqjopw2ShHmHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qcz0Fy4R2YCCQfOtMk3OI0ITfZPmI+XaJ5YquKgDf8qhSSpTua03iYF/g3qSgCk93DmhD9SOizdLC14eK6YGzAC06JiDsSuewRKxwmTKdnNItqNf//Ut+ZSmoC3e/M5cYMYSXe00AcfKeuYVSnQiT4erKXk/GQ27GfWKYirKcQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bPnPf0rG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X6Z2kjPM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPnPf0rG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X6Z2kjPM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5PqpV079206
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=; b=bPnPf0rGhspbwW5h
	o9qeX3i0Rg0PB19aQmDANBSIdOGt6PvWknTl7nGFwuzYGG1loUE8Br6XM2aHJ78U
	6IaF+PeQVcPSTposAj3Loi2h60Yhx3So4K0GQZ+ZrUGSEbbX046L2lR99vBYkklW
	RThFYBAh+BpT4F8SOjdUDbiGk23uvM0bctj3en1LcSiNCu5gsq3qjKyt0xGWS9XN
	lfoCW2fL7k5cZYMRl2NRpNsKANVkogksll2+Oc1I9+VIk6LUbw/VP045NW6EB5em
	h6vjVMSht6e+dzowqHoWXyr/VJvSKqZwy8lMaOWQ3mYegWna2dyQ1mOGXdYxajmW
	2hNiIQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckmacaw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:55:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b458add85aso114595585ad.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792931; x=1780397731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=;
        b=X6Z2kjPMUgqaNucyuCTQOcGLg3B3+vzl4/TzS+n1ZCX4N9lE3GLrrVGIqk5mB0J0KF
         jgvqO21JfRzoz9WIHwZI5hFeBX2NZaIG4fO4/pIzP2TgEOLYBAPlKHvZdyIiXXcK2JvW
         lf9NIWSWnTk51vb+adlcde0M32/9Vx9Zzew+4Y8g0pMABYEqslDALcseVHf+0lfo+SVB
         CREbisK09Zx3c4wUZH9hDEKFQcAKbQbQ4cKXtJgDKsP5WjUMN59TcGqU8zj1L9i5Wktn
         NCYlzzpVghiHUY3Q1PRtesS2G3idoOwZzbCGRVLJRT6mheO5Y7ygx6/esxSkbln3c4xa
         45Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792931; x=1780397731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=;
        b=L/v/v/Ac4vCE8MoYfpDi55slydvQrJU7XH74jvUqcN+/5gquYv0RIdx3gF+e6xKDmg
         tfHFKe7d1HQV3N6gfsL+ooU1deeeCY/etOxgq3yu/vJPMjiYJbxbmXMeqvOUHmfgVx/T
         X2iyilVshxCW4AOdQl1EHXlSYA0eqyKophAaha68UpXoWxIfOV5yG3L9ofw14mz/99ic
         a+OT7F3yK6LGAZBr4UwRKI5K5WnJxTm9h3Xt5msH+fxvBN3GI2a86UyUvwWzLcQeOJ6D
         Ibk+h4QT4JVbh9k4tPJ3lDRCtS4eKcS8I4rjoS9SSjIoF3eyIwCKHMsdWHOG7H5nD5ES
         m0qA==
X-Forwarded-Encrypted: i=1; AFNElJ/7QPw0TskESn1vioEuALsH8PiuEkSuyw/0etujGUEQ1CvsbaN55u4kgXZsJM4D7zmC9J8OhZ5X28kl@vger.kernel.org
X-Gm-Message-State: AOJu0YyObwROe+a5U2oV4MK5m3HfpFOGU3UMFN+xxUH1BqGzXGL2C83o
	0fD9ucLmY6sjof7vCnRV2ghF5r/7v5xTRj2k6R56Vdu3R40uNswzyLwodofR1WIL5vTa1f29hjD
	MbrrAxMGazklLQbnvhek6i1DYRAO+Y4aBjzG9ej+qBEOMKdYgg56gi66CguMjwqOSv6Zyx/S6
X-Gm-Gg: Acq92OFfcpDyO58AOpAslsFb2rUWtxUI1Sbpn7uy8s7uGeWgCBsTblAp6iohf8VDMvl
	32l0kcC3R9fihqpejf6DdKVNhpdyhmuP27RCV/ejLLXU3OsYjSrpjIi06ig9MUuaLe6ptMmztcU
	KzFduLNL99kMYc3oMf5uiY0u42nvYeNeKLwRkwA/FKNfla2Cmyqnf7QlOGuKzu9a+QttHL2oi9a
	sPapSYp7X7pB2cqEdDQn26kWew4TP0zni2dzBI12ozkQcZ/3ymvo9K1Rmu/N8Cl1nb49N6cYa+b
	jmZmJMvwF6aH9fr7/WfGvT2ncf+VT5bQLYsHwS85CXqkO7NKZpF2N4XBG8VoydlA4qr7niIMlZu
	uSUbhfY8OKa7xnnjNIlt8AqB7+9MLp75Y9YzA6q96Kpg0x0na2KO80rLwu9zD
X-Received: by 2002:a17:903:1ac5:b0:2b2:4fe3:7b89 with SMTP id d9443c01a7336-2beb070c102mr199593965ad.38.1779792931032;
        Tue, 26 May 2026 03:55:31 -0700 (PDT)
X-Received: by 2002:a17:903:1ac5:b0:2b2:4fe3:7b89 with SMTP id d9443c01a7336-2beb070c102mr199593775ad.38.1779792930557;
        Tue, 26 May 2026 03:55:30 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f3dsm120890025ad.1.2026.05.26.03.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:55:30 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:24:43 +0530
Subject: [PATCH v2 7/8] Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup
 parent for now"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-hamoa_pdc-v2-7-f6857af1ce91@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792895; l=1077;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=zb4Ff0vj0Rip79kK/H2K8PJcwVDoHRmqjopw2ShHmHQ=;
 b=J51ReIPmh2xekMGenUCwxLHQPEGCIhE/PrGpb8IamhqtLDYXmm1faChJov1QrXC50F6DXUad6
 FquiZjYXOFeCV2wXYieJUsa/2XWgDEwvc2U/MQyFZyvBDgU4j+4oRXm
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a157c23 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TyWXDXqlpdzf1xDbr6AA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: OJo1aU2UGGwVybi3HvIz6AA00gyMyURz
X-Proofpoint-GUID: OJo1aU2UGGwVybi3HvIz6AA00gyMyURz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfXxXxPqJztzdOB
 s3Zb8kCtBlQstElQejVLU+HBLC1Dp73T9DsU2kDWi+MgOidzTWNFe2X9wJVxlq8WsBkaZRRDN7h
 7XwTxzOAWdlf7aMKpK8f+6+wQgmMsG4B/kWUoTPvN8iuf2bU+UftExhz7lzMCLQxZEGJY0XGy96
 NWQy0hM3Ij02l8eSQWLvae9UPPA2TbIiHcru2Bb6El82SEe5tFA4Nxxoxm5iQFRTz2tYWXCYC9F
 sYaMTrJmG8fNUQV5hMlJupQvVMUN796Psp+rGhWdq4I9h0LqK4xx3Iz0u8iznXltkiTLAFswCQF
 eVedMKMYSRwegVGen611PlGHvARf0YRlQJwc+bw1XAxCwzGk3RBDnffdm0yI1gc7A13Y4JHCJn2
 i40j6qp4LuEi5/WnGwvZVkwmDccjAJ7TKM0Rr6nrofWspbrhCkuOVj8Zb1bht2DUC9zBFKg0t7k
 tBg0uuwIRmdblSVGdDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260095

This reverts commit 602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC
wakeup parent for now").

PDC interrupts no more break GPIOs PDC irqchip is updated to work for
pass through or secondary mode. Update nwakeirq_map to reflect the GPIO
to PDC irq map size.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-x1e80100.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-x1e80100.c b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
index 8d2b8246170b..e4c0abcd95b9 100644
--- a/drivers/pinctrl/qcom/pinctrl-x1e80100.c
+++ b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
@@ -1836,9 +1836,7 @@ static const struct msm_pinctrl_soc_data x1e80100_pinctrl = {
 	.ngroups = ARRAY_SIZE(x1e80100_groups),
 	.ngpios = 239,
 	.wakeirq_map = x1e80100_pdc_map,
-	/* TODO: Enabling PDC currently breaks GPIO interrupts */
-	.nwakeirq_map = 0,
-	/* .nwakeirq_map = ARRAY_SIZE(x1e80100_pdc_map), */
+	.nwakeirq_map = ARRAY_SIZE(x1e80100_pdc_map),
 	.egpio_func = 9,
 };
 

-- 
2.43.0

