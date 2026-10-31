Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445746;
	b=XxI6M0u8RQPuVnsPqg20EJWdDu2SuTQKy7HgSq5Q9R+EEfZeI93HHFAyENqr6gPgRyqd
	 aJaqSVWmlvkReCHJE6BsKdWXh57hkJdMFCVrnfZMeY0bKQlXIxjHR7ZBER9n5uDXNAFZD
	 XjM1924u3ZAkwd03ZYuk0yM4/xhn7EWPGWuGm2lgSrx5fNcws8uhPBfKwubdLZGOZkhSX
	 E971XvOWXsHZjicinzYdMSRuWlUoomebyjxPeVLgQkDUHypgHUBj9jInQaYMGgrInocG+
	 GkeofoiFFgSM7tBIn0HOW9Fz/6N2ZGf7MFx+MgGVK+1nn+IHkxuiGx6EovNWmGz77Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tpErthRmnc/Sd165TRJRy3hTqpBnrdJ3knKfPzqq1g0=;
	b=cy+7cwTRLhEXgwCrhXwAG2eW24DPNhsXtwsakHOkKufDg7O5Vd5+8sl7C6/FPx8gOo28
	 78PLOk2w/0D/wM7k2SFuiQxP+zD36F1mSSl8L4W6FKwF6KepaNY9+01+Tf4DEhPp8oam2
	 6rxXfATfSYsem5PC/CQYDIBAAMvPgFnR9/gGbEwlMPhjIfPyQGspA38XwHm4Rc2W/7XzP
	 zYhTe+0kotpl6sv2H+JTwhaBDEHB7C0Ry4bVAsGcHNT/ZMOLzeiGusXQtAzSU3tf4rl+O
	 KE324BmRaUnFizdqvK47q2CrSqWksLl/h5fwBYiN1dSkbZAIaXDjAypIGVdbTgVdAFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=smYomg76;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CD5606A32F
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 11:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46CD5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=smYomg76
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be41a7aba4so191822e87.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445744; x=1794050544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpErthRmnc/Sd165TRJRy3hTqpBnrdJ3knKfPzqq1g0=;
        b=smYomg76JlBtZyAHVkitLrlxUqVrHWOxG9QTciE1UGoSL6VtHE7yoLtH8ZrLPOE3ER
         LdAI5hhpM0xD6zCf8ReZkvWqaZ/EsQp9AJw5N3C9PY61euVM/CutyRl6mutSikSNhkzW
         7ODUxC6ClmoF25ubjB0Xf1cuZPhfu8XLXSaSpP1wtEaD0pFAh1fOCj4l2B4VlHbdduFB
         V9mXBkmygJw0oY2gVtkMlCKduJrFaA8lme5PrH/4MBTh2nZzDck6nF4kPj6trRDpdRTK
         qFrVDOrC5RBZ5hzAg63fOqm2dbswqg3Tch6gWHjKeZ/TQZsIuNFY3efD4FSKglhRrNaE
         7Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445744; x=1794050544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tpErthRmnc/Sd165TRJRy3hTqpBnrdJ3knKfPzqq1g0=;
        b=DtR4S+5eBiWi5fcJfRx30F2Az0C1HdYkOfjQPKzTGV+OrVC9DR1cYlXGHCwWgrhBpk
         fEyfR0AgxAeB7juO6isnjYdskuBt0NZuSYwLg++s1ylMMyGvkdJGemw68vpr4RcBR2Ds
         I1r7kesEgyAUHwzcqhbqRtV8F6+eFbGt+n1dpS6yCRZhmVMo6axP4IZp4f3WpS58HWgO
         60YRvf12nSfKVo1lPqZAZkVHg8i5cybqgF28jP3ZpLkDNzO5HSnJ5wzNipzhjfFrbjL1
         yUyeSdV7LTgp11xOpS8X3y7YR7gnSH2PP792F7vgKYNvd4xogX45UDFAWrWSnjgX6tYx
         tI8w==
X-Forwarded-Encrypted: i=1; AKwUvBwjk4WWY4cpTWdV/lHwSICempIHwo7BdQtKjE//dO9aEzax0oPHzQX3BTf4OZ7iiGglteMtktzg1s2W@vger.kernel.org
X-Gm-Message-State: AFq9FYJsMW5Utq9a+LIhBZrHxm2oG5FIlNRDAUfF21lM87PpNxqKmO4i
	iFpsO1Ck/wfL6d6RIeqL0pE37q3AZ+9BoYuWrQeQMoSk9AEpov8Q41NRvyihwVeuJUg=
X-Gm-Gg: AYBFou3TbMbNrBXJ2C0E+hOCSp9+2UjBXQoJjGTfNRioJN0VGsCrOrEI9G/SMScgq8F
	bFSVYxoJBFh6g8UDz7Xm1xSTjBH8sUF88VaAtJpxWEqqUdOcFFCFqLIOvMl5d98YMoesTilwST/
	5bKJObhDnZDr0gC7U/xoMb39OXHYLWqNTLtzAptujMoo7y7SbNnYiwSZJOQ4REh16U0aAHNB5AZ
	6p79wUJKTMjZRRMrdtzd0UTDSVFBmJKzAEIVPWd4oVfjdidnn0D/OTOibEWbN2T7JKlrfLpepqf
	MNMhQwT8HxTyu/nGJEFR1O1xTTcFrgt7bdbCuzAM/jHAOwhW9+imUXThf947FbLziZD4KugHusk
	w0y37FWbo2LRymd4Nqh+9RH3SNAD7HtKFC40ELsKRPaBz2XBW247mM4dLgXh9zD5ydJdAJjkzxA
	KGcEzioGHNtCb12D6VhMHrW5rFurvnQivyIprO7vuIa8oTJEtaCoiETPgr9FRKq3UUHvHiV1zL9
	biUvDz3ZAelMIZ8r4Y1UQhsBPEtiGw5hKPjnZXYEggm8+ucwuttKJ+FQJzFXVX3Mhk/FhxaEXu2
	MbcTMnNFCPuqFG5VrodxAX/jGmg21t7XcrdljmPPHX3smVMjjjAeZ6wEUrfU3CITUG4oXGk=
X-Received: by 2002:a05:6512:3e20:b0:5bf:d237:449d with SMTP id 2adb3069b0e04-5bfd94c8826mr1847404e87.0.1793445744234;
        Sat, 31 Oct 2026 04:22:24 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:23 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/6] media: qcom: camss: Skip TPG if its registers are not described
Date: Sat, 31 Oct 2026 13:21:59 +0200
Message-ID: <20261031112203.545319-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If TPG is supported on a platform, CAMSS probe fails on a device tree,
which does not describe TPG I/O regions. However support for TPG can be
added to platforms with functionally CAMSS at a later stage, thus
registration of TPG subdevices should be skipped for sake of backward
compatibility with old platform CAMSS device tree nodes.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..cf4687a20dba 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4965,7 +4965,7 @@ static int camss_link_entities(struct camss *camss)
 		}
 	}
 
-	for (i = 0; i < camss->res->tpg_num; i++) {
+	for (i = 0; camss->tpg && i < camss->res->tpg_num; i++) {
 		for (j = 0; j < camss->res->csid_num; j++) {
 			ret = media_create_pad_link(&camss->tpg[i].subdev.entity,
 						    MSM_TPG_PAD_SRC,
@@ -5434,7 +5434,10 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss->csiphy)
 		return -ENOMEM;
 
-	if (camss->res->tpg_num > 0) {
+	/* TPG register spaces may be not described in old device trees */
+	if (camss->res->tpg_num > 0 &&
+	    platform_get_resource_byname(pdev, IORESOURCE_MEM,
+					 camss->res->tpg_res[0].reg[0])) {
 		camss->tpg = devm_kcalloc(dev, camss->res->tpg_num,
 					  sizeof(*camss->tpg), GFP_KERNEL);
 		if (!camss->tpg)
-- 
2.53.0

