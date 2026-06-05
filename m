Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7254D2EFA
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658837; cv=none; b=Kgq/MiezMG4Ra7H82rO8fEjIvHZsZ3e03z2rXaGXGkJbL0iUplqPF8Jwe5tRVn93Gd+KnEorUTiK7Ba5x8uV0Fwl+sX/dmoeLwoXAm/U8Rqn+rtLGM7YbtmwDGdlXMyQsEk+muhRtmXGWY3GhVGhiKGc/koYxuU5sYzdYYVKyNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658837; c=relaxed/simple;
	bh=ChvYzcr2u4Fh++LD0E7RIxSbhsNKKHhS5UcQ0qLd8mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=spHjv0bH59OeTMyNDsbNbSkL4sMIKbC+YECelzHtaXOFIBhJNjKHlW/w7bORokabD4pliXg3JOqwUrTGSurt5AT8nQYAcPS20jUfHf8PQDk6yH0vALSUzK3wFUStFvLLpKAg0QDrab1FUsgMz7bLQCA8naa1TDj6qh3aNYjXi/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5ZFMUt9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MmkmReaT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M5ZFMUt9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MmkmReaT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65562v3j3111474
	for <devicetree@vger.kernel.org>; Fri, 5 Jun 2026 11:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rhFW59SY3tfpeAz7AxtwTJfisOOYhI1T4QbgIvxLrA0=; b=M5ZFMUt90t3O98go
	EJPDoNgQ1DMDhMw9iDLi1yZ9NWv6Y/QjZvAQFZ0gXizjUnVI5W/5ech4W7orsnSg
	bZW4QT0fkOb9LRgSH/z/0jmnyd9Q9uwQPacgP3ku5Z3CPjVWK55wydNakXhceXF5
	pmS9YIteL4TSHanIGZUYWVl/o3jrpYbdgAkBfVzVwwSeoMoePCTMnaKJo8nJzBQu
	fRWJ4klzb6wnB6TWGhRnZLqVuGelauJyWyez5RMZ0w2DW7rvv6kJA8GzOm0j8WK/
	Bmkh4VK3pWFaDhqOPdAhLhTzmJYd+p6cwKMRwPeC2IBt9yJN29B76cobRulN9nKd
	l6x8jg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekfv738m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 11:27:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a298cd62so1292973a12.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 04:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780658835; x=1781263635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhFW59SY3tfpeAz7AxtwTJfisOOYhI1T4QbgIvxLrA0=;
        b=MmkmReaTfw2JAyioBbKdoJzmO/z62vZxnc6S0glkKTTnexMF2gqGWe6a3lMZYzemmh
         IV+SRy5OjDjgkujMyK9cTwp5fgnm+Gu3QPIDs17PVtWJx7M25CtzdkMlUSe6cosfNZkX
         fizz0olyS8XNBFtCR/Jgva7GOr2ABYOVwiuNk3zACDpjJP98PicRSvxF8fwT/ZBBC6ys
         imQUjM4stL1oV/+Fz6Wl6U3HklRnSU7/MNCixH8kQfkHUCC+Y2DRcaKtaHMDVIgeL4kF
         K8qzzxqdN1R09KD0AyO6dLcoGAXK2pqxlYfb0rqF8GhF6qhuomVgczTmMb2uR+GHUJle
         e9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658835; x=1781263635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rhFW59SY3tfpeAz7AxtwTJfisOOYhI1T4QbgIvxLrA0=;
        b=m2Utnzffz8xmGH3GUmYEYiNny5znp4ElBxN9SgaPF5gjtRwaIurW1qRfGF59q38Zid
         UV5pATiY2wuyEKGrRsxc3zENCTeJUH2q8lCSsJGqjVsl0L1dOkATXp71+uoPE4iN8wgd
         /Vr2blHrR4DF7gh62WuuxTfRR5KcmaBLoYQl09ws48Gbry0hwU9P9jCt7UGU4cv4SIMw
         i8yzeFa1pMDVNvBNvYzCG9khF/QTQEZd/kmJ2v/vjenn1hFxb4Y4Q+gvGlPLmM3fg1FD
         nSaWQr3dRJChFT3cSKJdT2dbkyROExfbiNm82go8wq2MFAoE50FSHQ+zsNf1OsNGNVar
         5wBg==
X-Forwarded-Encrypted: i=1; AFNElJ+iKF5aVJ/9zjk17+EnhIMy9ZduBOdVKSAovw+VojJsZ7OHDH3Ven/qkWvXXje4KP9FCLD5tMdAgSsU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0TmO7rzbaxSBlNlHE3CInAFGo+2vVGpB6QgfKLsOm03mGKS4C
	a8ekQbfgLBTGbiHxLnSkaoXG0IWuwNybrRad8cOZQ5+BxYZKzKTcHvwVg4fKVskvuY4MlYoQVNB
	bdqyeetKGTmr1uJ/Sbu9had9zO7Vw7072QlEuVwnh2/gAmNxPhxEJEi8xNgHPcCO9
X-Gm-Gg: Acq92OG4V0oq5IlnRJoFElhz51vP4TTtXq4VigK997fKMKS3Xx8zsmQZAniAI3zbvE6
	B24H72yRQn5WXN3a4neLCrdg0MS+9EqrZKy2JvdLaj/EQvs4GkOht0i4DpT7BmfUQmWfZNuxCTi
	WTKE01ghZ6sclH3XIi/wUYE09n2emAgaJEuguOdklQlnRah44IpV3K2B2C5lrigrz1SwQ4MI66l
	rFT4jyAVPPiJLi45lGAKN0w/f4BwMLoSKsidHLuuLtyzTIqFEXnioSTd4qH73jEo3zq5kLNnF75
	FM8jNhyzXPc1pndDg2hiMataKmuli9d6IDJb7dyRghSERv498VCVvqKe+fubFypC539b1CSpq2n
	d0PKN3P7/4vtneQRt1jWKJo/mamfztpKNtEEJthKbmdvO8uIU3Ot+GXpfiPwEqWU=
X-Received: by 2002:a05:6a00:4216:b0:835:6388:655d with SMTP id d2e1a72fcca58-842b0e6353amr3187738b3a.14.1780658835008;
        Fri, 05 Jun 2026 04:27:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:4216:b0:835:6388:655d with SMTP id d2e1a72fcca58-842b0e6353amr3187710b3a.14.1780658834458;
        Fri, 05 Jun 2026 04:27:14 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e21c8sm10626246b3a.49.2026.06.05.04.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:27:14 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 16:56:30 +0530
Subject: [PATCH 1/4] clk: qcom: common: Register reset controller only when
 resets are present
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-audiocorecc-v1-1-7ee6b5f2d928@oss.qualcomm.com>
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: YFwC-kE2e1yMLTpdGxYQUKVc55pa4Y7N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDExMSBTYWx0ZWRfX7C7AazbRfz5d
 T0hXgONF8bDBz6umXT85OXAEa0Keg+OLnojvuXWYlGPeHWWFoVQlLoONcZbQgjxIr5APFVHsFPk
 ZrEmklBcAO+ME9pGwbQL32+UK6xnZSmW9Df5Zkrpq+wIIJMKaSC+bH8Hh1QGNviKOkEeOlun5DN
 1lIiW4BYbnHoaVhX6rKUFJOWb7IG1+RWWhzu66IiErHcVb3WSQtSHyb/AkYEdmDpkgjW2xjO/G6
 HPUvfQTw3gfzbvz7R6oPb1EpWbso9zd1xYgx44Mm1xM1lUWtz4RzziMOmifR/DMlPvHDbhL9dHP
 oRjNvRG8xhJvPNJ7ef4h5IqcaT/0hEKqCOoLgMzRhYCHJN1lRyujFjwW2yLAcqyuRAAm21w2/RN
 ISDLeHl5XGgsAf3e/Vm5b2Er7r5Ddrrt9l9UFiQv3NPSi3pdeR+fBrl4f8Q4oKkg6HG0mz371fY
 NZNJmd8StE8yIIJDC5w==
X-Authority-Analysis: v=2.4 cv=JNULdcKb c=1 sm=1 tr=0 ts=6a22b293 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OBZ5FNg4elHM4VKj2A8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: YFwC-kE2e1yMLTpdGxYQUKVc55pa4Y7N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050111

Some clock controller descriptors do not provide any reset lines. Avoid
registering a reset controller when desc->num_resets is zero by making
the registration conditional.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/common.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b5ce24bc1ca860d2ac1bbdce04524..be9b6ebb2fffde05e3f209571c53b601d823d479 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -359,17 +359,19 @@ int qcom_cc_really_probe(struct device *dev,
 		qcom_cc_clk_regs_configure(dev, desc->driver_data, regmap);
 	}
 
-	reset = &cc->reset;
-	reset->rcdev.of_node = dev->of_node;
-	reset->rcdev.ops = &qcom_reset_ops;
-	reset->rcdev.owner = dev->driver->owner;
-	reset->rcdev.nr_resets = desc->num_resets;
-	reset->regmap = regmap;
-	reset->reset_map = desc->resets;
-
-	ret = devm_reset_controller_register(dev, &reset->rcdev);
-	if (ret)
-		goto put_rpm;
+	if (desc->num_resets) {
+		reset = &cc->reset;
+		reset->rcdev.of_node = dev->of_node;
+		reset->rcdev.ops = &qcom_reset_ops;
+		reset->rcdev.owner = dev->driver->owner;
+		reset->rcdev.nr_resets = desc->num_resets;
+		reset->regmap = regmap;
+		reset->reset_map = desc->resets;
+
+		ret = devm_reset_controller_register(dev, &reset->rcdev);
+		if (ret)
+			goto put_rpm;
+	}
 
 	if (desc->gdscs && desc->num_gdscs) {
 		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);

-- 
2.34.1

