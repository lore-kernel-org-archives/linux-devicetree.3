Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FDD44D6BB
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 18:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535132; cv=none; b=mvba2Ajt7Z3Iam8+KZmygLsPhJbCZ7NtDlOEJ/YSGy1WZh+kC4ZhwrOjkyRiFfxlpb3hWvhpsBPJ24K0uWMLpCjfu9ueCLC6IERNuparap5wGTpkYBHAswRThAeTLXeIBcMCHQLHbvYGKTqGG7wRLIzW3q9mEJva8s6ak1H9lCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535132; c=relaxed/simple;
	bh=GK3GIZYWutGfc8Enr9Qa9dwiK5VpgXvtjqrvxs6UcmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=is1UBjrTTmECCq6M6l5sD8YT0QUvpwmKDlC5zFhK3y5GHVoIDO8QziPEW4UffMWokW7PqElDpM8EFQUeLvLuFBS9ZpZhl7P8Q3RHY+55RsNsnddJuq/xHzWzMJ6m3IhWtR83vFxvEkLcQxGpdAvvBohxQrTvlUi5QlREGrkbiLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBB3/82A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NhEvuUbM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBB3/82A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NhEvuUbM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GLWlJ3348082
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 18:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R/B+e7/M4mg3rq2ngkNGdepOfwfOYxIs/l+9FzU+DqY=; b=CBB3/82AW09dEo9J
	DX0fUroOMx7F3fUAMQT8goHLApD+GL/PPpAnN0PVb+8m3XFg3MavgeiJqBcxItrx
	R0eaIoi3iwe5RuoCQaU0Ikgu8A/nJwSkSuyTRSxw253yhRY0MUICeGFRcJrVHEEi
	+qlYwviKQHmdq7CvYHrsZMUSWDh4lIvL6jNREpv7/eX/n/KTgCVPC2sQTWqM/95k
	D3WX7fOVCEb18hVdf7iBVdzOsDPlABEYHxHOC9VNI5o3clE6epZ9XFVrYTcqeXbx
	4P39OcgwVo8w5OO6SwGdQLuuELm85dVtmWKynnre0gDc6SzQ8OcQPUo9GkIz0mY7
	n0P46Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqs8kh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 18:25:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84770f89b99so111978b3a.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 11:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783535128; x=1784139928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/B+e7/M4mg3rq2ngkNGdepOfwfOYxIs/l+9FzU+DqY=;
        b=NhEvuUbM0yQnzbl0R3xJ/Qfn05Yuwb6YrTMBO0c64HZ/Nll0KlanVXA5KggvjgIpzq
         SGtlw+vF+8o1L4eZuiy3nbGJtHXRqAKGkcbuiFex9UYc6yx0iO7cMy3639dmWx8L0EI5
         cVF3foS9rWViKkldy941NNuY8xnBwT73sZgYBLqLJsQoGjr+JRkSlhPcytuQ6dAXzo8r
         QIQ1oZgmjiCFyNzmEHcH2KlhWB211/hpDoNo+5tQ6xkV9KE0cgk/dHB5uSNOTqtLPv4o
         gTd41Zqd0pjzbMFLzCYHx6nsMxnefs1J9xvsJRIOvnnl4DJKVxV7N1VU7XnvSI3/z3KA
         solg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783535128; x=1784139928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R/B+e7/M4mg3rq2ngkNGdepOfwfOYxIs/l+9FzU+DqY=;
        b=CxOLKME0aL6aK7fbPXDSmvrWCjoYqzggXsBSKtUthZwJRY+hmkNh7C9NdlHaV4TaIk
         blVKZ38pPaSg6hD0gBpDfR9p2quS9sNKRZ5FK4G3lHnvPJHvHpxSdZJOUaf6XMxIKzD2
         FC1HhGJVy7WrV8GNUte3KC/YAWTyhxwm1T+tIhe8YGIduLs3g/W/4/BshrxGiihsN0u7
         5giNdFYI3kw7ulKR4GmfO9gRoDpRQBRxIwFUSMtOZ8qjW1FNbCaOa6JfqfQcTWSV/n9K
         IxDYAE1oEMuK1rUC9Pf3ZZ5PLuVBLBumRKRqDVe4KnsSx0HTz02XRCZCRdvjIWX+vUX+
         txfA==
X-Forwarded-Encrypted: i=1; AHgh+Rq67FTyjv1DDTbUW4nf3BSzcWwvUEfhteLSEbyQMNpmQQ6RY0Nmz/gxYGl4YYHzbRsvLX8Rwy9HeDzM@vger.kernel.org
X-Gm-Message-State: AOJu0YxIBD2TUlLnp0zpN+rTAjYQ2+/20UILqorzLvcOlrG+OJ8/R9i6
	pD0wccKtmc4EKjb1NK74OPQU0E7jNVu5JcWWCsXUbGe2tR3C7ykO8q5Jk+55HrrGFmAKOX4Lp3C
	t8iAxFZg2+4oeUsobQEobfLpVmaWcSiaMJXv8ZluHafBhAm4aQAQVC29SF56Umqsp
X-Gm-Gg: AfdE7cl6DEyyTT/CTJGyn7t9FWss+x+T7FPgDAxBWShxr3OgbEcmeg2IdqQFDrEenSr
	agTXksHecElIG15bKIbSf3+hbIqOWXxl9s/rsswMKbVdZZdQwF42TZ5nJUo0NlixavUrZ2zfSsU
	oa2HrWhN9nljeSdEr3Gxc9chRAugqRy0m6Y2xusjLx88X4i5HX4kvyBLmJbSsPD7HI9UtQ+nduK
	kdcpeQ7dj4IoC3F+yfyhgM6mqEZZz5Br76uob0iTlkeY2v0SyaVWTiVFiPsIeX1nPfKFRHMTwX+
	7or/IDRBeJy/FXLnxnAudi99devoh674Lv6TAmcnZ6o7hfzhFks5paZOa2dYfEDfHlGRBxVBXDr
	RKI/CwYvvQ2qbWTiInzn701kARVBKkxlkIpMvgfmg5A==
X-Received: by 2002:a05:6a00:2350:b0:845:dcc0:1f5d with SMTP id d2e1a72fcca58-84842fd4889mr3766626b3a.47.1783535128395;
        Wed, 08 Jul 2026 11:25:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:2350:b0:845:dcc0:1f5d with SMTP id d2e1a72fcca58-84842fd4889mr3766578b3a.47.1783535127822;
        Wed, 08 Jul 2026 11:25:27 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5946sm2671098a12.7.2026.07.08.11.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 11:25:27 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 23:55:05 +0530
Subject: [PATCH v2 1/4] clk: qcom: common: Register reset controller only
 when resets are present
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra-audiocorecc-v2-1-b320d822cdd0@oss.qualcomm.com>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfX/Yo94jJlwcv8
 MTpAX3aoO5w9prhQGDSO2ARKhNMPMAFe8ugZXH8R8evbQwUP4lQR2XfGN9VylxDQ1BxFfOX8epN
 VbBv7f4zXRvsK5jhzDVqyScZMBn6u5c=
X-Proofpoint-GUID: TOzBQBN9XfBXD8ti0czXLRiIdfTrnzwI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfXydn7GFAfUV9e
 KaZUh4FjoaxQTYx3lggSbInkiD7eTcLa9xhW7j8vFbEnjNlLB8L1ZZqNTeN4IvHghKKif25lKdg
 qrf/ZybL2ufpEM37c1zcS3/kpgT5YulsFug88JcNdPJkPs85zyTGPafLJ0oUehiA0r+elGIeTtI
 Zc7AtI0yjOYPfTMAaxK+V5wQXSRBN1XgZAl7hOljnKsep47SzOd6yT3hChg/7kXcKhsO/+BYT87
 H3ZwNaZ+rdtqcIJrFbgHMo9I9nlbU2qfYPuyFUQLDMQ9hXyY6hZX5BokAstzs+YcEEnJRY/gtX8
 CxPTdCDWEIaTPpc7WC75JhzHnGFIEhOwObgyJC8x9d4jgntRBq7/Of/3P8w7dGKb6ogAS4h2BWK
 TRCdYZdJaxcJ+SsCkfn/ehhCFAwK9Q4mlEeAUn39DXxvMkts7GbruZjkFkOCXe5TW8hhngZCwpb
 w/yOrD5HVDJsPU1CbEQ==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4e9619 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OBZ5FNg4elHM4VKj2A8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: TOzBQBN9XfBXD8ti0czXLRiIdfTrnzwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080180

Some clock controller descriptors do not define resets. Avoid registering
a reset controller in such cases by checking desc->num_resets.

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

