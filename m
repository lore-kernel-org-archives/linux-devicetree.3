Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE8B3AE6FA
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657567; cv=none; b=R/rQACRi+tn0ldg6rmZ9w+ugS6z2Fo1uVipp/NoPIQiREvIzqSrgtmtKUFnPFOE+tB9RQ2+vHw03aMrhh4WnIJgAWdqS8vNT918a7GxclGaepOX/8XXfJZlq33zvxNJglQ+TyNyH3ZYcrnK/po8DJE28RfS8PG2h4AP/dT9UZaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657567; c=relaxed/simple;
	bh=AZiHHq+x0W9FHol6e+Xjn43IEDJXWdNcQfLBaFTyIpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V27DC0elAe8/U4QKH3d9ZezqC/WrjEZUEq4TaXIsDjAlDZBGM5hOe/roV76v5xahOWJq9MHvrwC/rvlE1Ru1TH8K23j8m9GnklhusxGWoEanGaA5jvt/CIoEKbSzL1ZOY35iNknq8gvFXDvqWB4i02EBIHUxu3tNCv/jItJa7Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ml+yI9lv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZq6nf1M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ml+yI9lv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZq6nf1M"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SESbia018336
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9maitIXa8Sram4TCv+YQqEBCGgRKHZ283RLgVKVYdhE=; b=Ml+yI9lvBCbA6p82
	RzHlPJ3juFXHuXbvw5hvM+Xo3gfh5zMZmGOEhrLziwxFIpwiQQ8Gxq4ENSjbbYAE
	pxSg7opp87kqsQCD80PM6ePUrJQYb9U0EZd62Zn3ONWCYW/ZNsHbcqj0abjcN/yG
	AT+5VT1A+Cbtaf1kVJ0iyOSZxTLzNmgN8S7CdbeynBdO3OqmWZ8Q8cYj4MBMIYCZ
	mTMkpTrfVS4cKtEkHECZ6s58TgWZWcUc+AkQdIU0edL+QRstW0cBGJX47je+aOrN
	HMfORUvZOHehF4qqWue0cuAE2xSDOPIr7rs41uSX8Ccxju/69BvxxhRQfyhkL4uR
	Yi+0jw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7txm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:39:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c011c7cb9so5559111eec.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782657565; x=1783262365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9maitIXa8Sram4TCv+YQqEBCGgRKHZ283RLgVKVYdhE=;
        b=JZq6nf1MzVqfU2OtTyuoVhQXv88nRFQkp7q8WAWv84MwVR6EaUuI3bnM12JjeyU0bs
         133Gn94yp9qtYfejwyhwnIHEK2zp1PfeILjpChGleAcdCwI5oDmlnCZVz2PdT5525aJL
         elBZQHgvSXYSwY6jcQrPPsa+vIyz+nV9xeHlpeJ9nk2B4lCqmYXjZn6PYaa//yTt0EOu
         UoL2IzR+0Dvojd3F+MfvPaRX1cYpXeI03BGA7h0w7n2JcIPOcPq+66vUGmZZNKhKGsvy
         Ku5HRU0LVsiu7iPBtbenwXITqMS0qVvNmYs4xL+qmebliATnJZFslflHkt51MQO8/rox
         rpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782657565; x=1783262365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9maitIXa8Sram4TCv+YQqEBCGgRKHZ283RLgVKVYdhE=;
        b=S4QXTEFXcXLGBRV+dJj1D4b14KpJR6xwasXVLF2ZUnrVD6jRefLMD1iKYV3PgQxcHn
         r419fUHh3XVLVVsVMLSizrsJeT6rdqcgap8ti/ISD9aYYZP1zsQPIBKveMfcSMIzn4xi
         a/bfQGnsz7MCxZ9Wg0Jxq9mTzdqRagMDm+8k6LA/y7dpfBlQMEs95oQOAXyPsCtetes0
         JeDSj0/j9uJx1UhSktwXREMs9ffSqoVIImOeDYJD0ZndCl9lUirBmoXuVrN3X5aaPBjV
         vC4lF6vQVEKRLIBpwiaxlmUCGef80yrPNw+sSH5RNtWQY/u7yPIk6PR/n8LUDwC3RP+H
         YxDg==
X-Forwarded-Encrypted: i=1; AHgh+Rop5FSQeiNKxUYHNGiHlFlvW7tuqjwTepzpei7dBRVdZJbVuN/zC1IdoFaDtno6VepdT1/WXkU+Qed+@vger.kernel.org
X-Gm-Message-State: AOJu0YzOnBLgv82RDnncknFtKm36s9n4fG5eX49VfKE0588CW8sgTG0n
	3gg4oJWC5guxfRu8CvPNxafUoDtoCIs38R2t9jimg9EnzPyQ85A2+Z5jpER/wmpxQtcZqH4v9e9
	6wbuhus5zBl3RKFERsuPT/HP2mCqTgTZmjl0dro5K4hlRS0DKOrT4iPV4+HVwZ2Zw
X-Gm-Gg: AfdE7cn3k1CrcYHLUOPtqiLhH/otWuRGT8hDRwAq29mFYVQ5UnrfFhssRjulwjJuTm7
	tbS3fNmTVKoN0+GOeBoLIr0OQIQHl7AQtCeOineTA8vj/MD3rFBCiHM4x5uJt3dfCNKJ7v7MLi0
	94TG7uOpQsgcpOKkrPfp5bl5/KTDOoWWVu6JT6Kgr0r2t3Q0LifaRD5CrMrxBj6wDtPi+I0BlpO
	GD+ljOXekEjxO4/wLVgnMg9w7QmOQ/HchiOTIKIFgzo5rRA21v00KAaSpgUexu6UxFF5Y5TS5Z/
	rCXWt0U3et22I8WTyZyUEbykrGUVQxzyos5YilPSV1/cOqMDcka5Z6eAvFFTN8PxvcVspAmkhQg
	Bs4Sb2eeyw7Jykp/lNaZvDjtt0LUZcMrNrBczeg5k6InMOqI=
X-Received: by 2002:a05:7300:538c:b0:304:e865:f7d1 with SMTP id 5a478bee46e88-30c8500d8f5mr13533538eec.25.1782657564958;
        Sun, 28 Jun 2026 07:39:24 -0700 (PDT)
X-Received: by 2002:a05:7300:538c:b0:304:e865:f7d1 with SMTP id 5a478bee46e88-30c8500d8f5mr13533527eec.25.1782657564472;
        Sun, 28 Jun 2026 07:39:24 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm39300591eec.4.2026.06.28.07.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 07:39:24 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 20:09:06 +0530
Subject: [PATCH v1 3/3] MAINTAINERS: Add entry for Qualcomm I2C slave
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-i2c-qcom-slave-v1-3-8b0a5c01f9f6@oss.qualcomm.com>
References: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
In-Reply-To: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782657549; l=1075;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=AZiHHq+x0W9FHol6e+Xjn43IEDJXWdNcQfLBaFTyIpY=;
 b=U27u8RfTIriLBtUO4FkPELhA7v4mOnfzw+CfAkZqQHGrWLNASvvYHcj3ZEd07+OvOqcOhlGSg
 0QavU+5J/mdAEbN++LZMFV+eYcQpEdqqa34AvSX7MMgMUCU7gI1i369
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDEzMCBTYWx0ZWRfX1C9VStPWr63V
 HPjIQl5n69DtFJUDXb132wgfEc0iNC3DHoar4aZ6oUhuU6c/HHp5tJVuBRaUOgSRO5YZmgpIacm
 UVhqm9OaGW2iW+JEzAsTLS/zOow9PIZCbqxNHoBIB2ocgGLoryUH7BeukgCEW8VPlZZzq8MKHt3
 nsNgXeBJGBPjkA5qD9hL5cGbRSXwnQpWCrKR2PP7n7nOIx5nz6QRz2hosIUUr/nX/KRgWSxzD/7
 9R6ty4zGnUq9JbwtqPGY1gmcwDydrNTW0kkFgQ8NbBvDmciEQOdwCkatXn9UhwE1QJCR7Hmcda/
 gSQB0lXtSZAROldS2ONtivucJOCfk0xNzLdwtOJRGcGxOjAlHora3KFw10X0WxwGqkda1Vjzi9L
 e6+Hb6e+SacRIesiTO9YloQubn37fCtmK8x2cybgXj4e8UNN1OITpX+dcVaIGWuVcHrgWjGrTyM
 Xj3TjwDXtCyrBvrv1Dg==
X-Proofpoint-GUID: sR-8b2JEkELFu30q4MktsemGf7EpFIrv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDEzMCBTYWx0ZWRfX+aBrUMJS+83H
 si7xyiFyiYNmsDy0CwZRYfTDgOoEKReHzmd6aN1as2ha7/hSqwlY+E5WT72p6M5CAmsNsYaSHgD
 PzzexUFamyxIT/0mgzp+eBC2LpfZJTQ=
X-Proofpoint-ORIG-GUID: sR-8b2JEkELFu30q4MktsemGf7EpFIrv
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a41321d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fuCEp469c-Jm1kTzFMAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280130

Add a MAINTAINERS entry for the Qualcomm I2C slave controller driver
introduced in the previous patch. The entry covers the driver source
file and the associated Device Tree binding document.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1705eb823dd0..645bef228593 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22231,6 +22231,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
 F:	drivers/i2c/busses/i2c-qcom-geni.c
 
+QUALCOMM I2C SLAVE CONTROLLER DRIVER
+M:	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
+M:	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
+L:	linux-i2c@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/qcom,i2c-slave.yaml
+F:	drivers/i2c/busses/i2c-qcom-slave.c
+
 QUALCOMM I2C CCI DRIVER
 M:	Loic Poulain <loic.poulain@oss.qualcomm.com>
 M:	Robert Foss <rfoss@kernel.org>

-- 
2.34.1

