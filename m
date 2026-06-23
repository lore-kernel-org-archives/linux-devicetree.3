Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D1E3D413C
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226373; cv=none; b=YDv0ls+wUPPipFyWZk4R0NBe+VMMg6YvmF4Gqch502uEhcvtEtk5sCbUDjbZTDFBlKXsl/Dfi9jFnQX6BLe3RFcsb0lFOTat+3BvS0UnM4QOKL3lBJThGoJxhMWoBFBRC1fVfKLH2kvoF3MAR1nTnuwVUiPGDgYuQlZT0B+jJ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226373; c=relaxed/simple;
	bh=jk4R28uvXSQqop1k+QCaNKg5KB45fYcvAdlsM/pEbt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CtVlGos3zmMhD8kNNZeUEUPqlbuby5wYcjhS4pR+ZGpgGgRTfLNKB7f/6GNKmLe7SAz2LKsU1c3KaxMGRy4vQTdDju1udqq7kZmPN3fx7LDZ6I65R4drXJi0UOYNy9WnLK2pwXe7ldGNCYjjmir5f218dSHO1farcvrt4+jOIBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o2z7e8J9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7wOrpxV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2z7e8J9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7wOrpxV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZLZp4017099
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1zp4v9I3As9
	YSSPlxKI4iiJuA8JmYN0Hz1Nxzf/1u0c=; b=o2z7e8J9azfbhqDRSzGPXA5q9hT
	kCTUoPNbFevxPnpU8jxf/J8tahuGILguBwg89f211D6D6cItyC4icbmPL46Ua9R6
	jRUSv61iZyTwmIyF9Ag+B+UqFeBCB/ufd3yy4eNCnav832o3TJZG0vj/zOEETzRt
	tTL8SfWR3zPnL3EmvAX63TbfenHPo9T4Dkl7TylhpTGRCiCs68uuabmnO8Uj9Exs
	eh17kky2w+0n0aiWQPLrACWfIDZz95ARMhNDvHg4nVve1i97nOBLf0HMOAoHU2SV
	J40PIZPxFjYLdfaM48es1XZ8XbBzz/7WPS5IpO6y+i2oj1wPdh53vH9y9RA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjjw1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:49 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfc719d238so3569116137.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226369; x=1782831169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zp4v9I3As9YSSPlxKI4iiJuA8JmYN0Hz1Nxzf/1u0c=;
        b=c7wOrpxVhFFl5W/VLMCdPeGnZD0Hu0fkyNaPVfGiwZHrsLBWjrciG9cOwHCtofk0af
         uExqhlpFFH2fZLLlvAqY4RKFU+HhSXiOeq/1bgIXoMgoHjKm8HHa9E/ZZqh3Wbyoi4qR
         uyPS3puWkttiIiga4uaG/XpAGDvpnG4RaHgGwU4TX00BAQ5Teo2yS5Lfz3jEZCa7LlYQ
         3TBek4rmjKc4Edn8RVUYsFI4sqZBclt/a7V8SRA1POMiGBzpLHt8g2FkkWcbr1fA6sye
         F2NgNGXlrYeYxF4OsxbOY08AiogTA7f4ykdQg5VMnHfx1MM+r5gZMXYsItiTd0i/IUpq
         gllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226369; x=1782831169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1zp4v9I3As9YSSPlxKI4iiJuA8JmYN0Hz1Nxzf/1u0c=;
        b=CSLsoSmrDcRDlqbd+Em1Rn3Un2y9XZrPUht980r3dtTMCsyg2uAoOFLhHKrun8WEaz
         hljbSoCdaEZLQQ9O5D2zBNLlI8eJvtOBeNU793HRoqOAPfz88jpuBraeHhCdVAOZrJX5
         0aI65f57ni5HtQDOI55AE4BwsKVaQw5py4udyKZwn/IW6sXm8QmpjIR00FFbv4K9bJ9l
         FsSRZ7U+utSW39XDbpZpqGDWMru9FmgZ+1ifT0+gZwmYxQ0tUBEsvIAp17FYAa8P7qgI
         MffwtbQlBkKjGHYg40IJ3sfZarDsw+MFJJZ8l3ybHT3ijc7ThnZpAIYhUzKY7Bq9MXrC
         uDMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bvlNP8veOYm2GFyZmIvrUDTNW6JTzDlD4zg79Bsyzim4WY4NaUgdeSMxQYRE358dkYhA3h6WWUar7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ZlbhA25k445DKHfSiB/GMwCkL1B/vhGqNPFtbcHc51UaK5lN
	aBGuFVZVGPfZ6ybKCVWtIlIFr2Cu2pmYht7LGoLGVfZsX+rHIUfUoZX3TVm0HRn/Wo9BUQZU/cd
	eNvlrelSJUsBcIxsKpPEydkfi+040TCHDF0CLLN+8f62zy0qGWCJlwfUJmFB356n+
X-Gm-Gg: AfdE7cmhi3D3JYapmSmtXxYWvrN+3zBgJ7xFn/RmEN6li6uBoygpDmZWbFA80FybzmB
	A+maWQnBveywjDU78Oe70RAob3E9Q9aOKqOCvJ3cC//NrNNmVFx54AQbJvFoAOhaWqki2TX8Uvh
	ziaEIt7mcKGoClpe3xyDAyamVAISYEYtl7WyzP4vAAyCILZ5Jf7D3YW8uUC9kiU/Pp2t8PlhzNK
	7n6NxLsIHICeP7CREmoqAyiuFZWUr/x48LFCc/x4TfwzR/SrKullqdJ0aD1D0PD+3/rQjUiVxDV
	ZOY7a6Y8Y1E3e47sVh0QSKoriQ/OH06MHajrmGe4K/xB4fN/IBMsipnopX0ZlSV+fEDySq+EPZ8
	RzptZ01E35+/mqA6xg0qvuGRpUhLxcYajPFyEjci+ZIjSFQxNVWDkPyI5D9ICe5J6UA9EIILnpJ
	wMnBchex2dhQnhvdmlRL9yOfKmUg==
X-Received: by 2002:a05:6102:e09:b0:631:26f6:7016 with SMTP id ada2fe7eead31-72ff5b88ac9mr1736723137.28.1782226369130;
        Tue, 23 Jun 2026 07:52:49 -0700 (PDT)
X-Received: by 2002:a05:6102:e09:b0:631:26f6:7016 with SMTP id ada2fe7eead31-72ff5b88ac9mr1736696137.28.1782226368762;
        Tue, 23 Jun 2026 07:52:48 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:47 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [RFC 11/12] i2c: qcom-geni: Fall back to i2c_acpi_find_bus_speed()
Date: Tue, 23 Jun 2026 16:52:24 +0200
Message-ID: <20260623145225.143218-12-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX/Fj5FbL93Soj
 l2zZ/gmUrEl/p9Z4pioDwpgXUl9qRGLhXDO1PIXFlemrj1L4/FE6WhVYV8dvTfzqm6Ui2fVX7Rn
 GAIs0U4nRvs2BJWs5qIPTLFXWLnlyUtgo0wO7ffyE0BInm5ZQcPHIfa6nxKPjp8iJo+EPxQM0AC
 JJIz8Jyf+wajfyEN5/nJxvHODzsRIUmSNF4SLsH/KZGU6ND59GpXfEJErlK3qpMahp+FL+um8OQ
 xXv8sd31v1OSdMtOliNPbbWdt9Uf0rydPUdIeAxA81DlU/Ks5TWY8toIu8Rzi+6EKD5BGjgPMJU
 Rmvw20Q160YLUM7dQEdKADRjqhdc4Q00uNPpgnZtkyNScDC2vVeJuVLu/dN+fM1zXPaEKxwJb3m
 Kw/IvUfvC5twbCnnZiAg+KbAU5kbR+OAkXeWgdJbbTEYVt1TUnU0XzPEll20thIQuMH8r4WUm6C
 uS/DzaRsmz8u1L8s+lg==
X-Proofpoint-GUID: wU1Yg5llDp6iIAEm8gkvYoK9GuAC9uts
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a9dc1 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=ebSNtY053JYnNN3LUkkA:9
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX6FUkNVm+5deq
 ItnlX28wZ8zaP1Y1ouMmecdJF4PKt+b3R3qrZW2aD4utxH65LiWXCC5CIxh/NTxIBdJ5QOPSdHh
 TGPHfZcCVfBGSX/gmEvdUmS+ZbuQ38I=
X-Proofpoint-ORIG-GUID: wU1Yg5llDp6iIAEm8gkvYoK9GuAC9uts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230122

Fall back to i2c_acpi_find_bus_speed() to get the bus-frequency if there
is no "clock-frequency" property to get the bus-frequency from ACPI if
available there.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 2138fcffdaf3..97a538cd9455 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1024,8 +1024,14 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	ret = device_property_read_u32(dev, "clock-frequency",
 				       &gi2c->clk_freq_out);
 	if (ret) {
-		dev_info(dev, "Bus frequency not specified, default to 100kHz.\n");
-		gi2c->clk_freq_out = I2C_MAX_STANDARD_MODE_FREQ;
+		ret = i2c_acpi_find_bus_speed(dev);
+		if (ret) {
+			dev_info(dev, "Using ACPI Bus frequency: %d\n", ret);
+			gi2c->clk_freq_out = ret;
+		} else {
+			dev_info(dev, "Bus frequency not specified, default to 100kHz.\n");
+			gi2c->clk_freq_out = I2C_MAX_STANDARD_MODE_FREQ;
+		}
 	}
 
 	gi2c->irq = platform_get_irq(pdev, 0);
-- 
2.54.0

