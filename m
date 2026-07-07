Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600B930100E
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 11:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425389; cv=none; b=nUy226yHaar7mOCh8fyaXKUFOCw093a0ZNn9nR1fZbEJd4GFK8m8ynGrvDVG1TZqg/TUk8lIU6OF8jd1pGZ9WTqnKHXxmtGKBOzay4x+4P2EO30AoAIxvOTme8O2Tx8BoSXNk8REWnF7mmon/Vx7aRqOJofkYTpQwNKrhASvJV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425389; c=relaxed/simple;
	bh=nnvK5OyVStyB68ojaRbHyRT1K6wfBsNB9/88lNM7q3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rLrrI55fqPLBFqebJWkZHaUmLmk80nOC1oVPbNcqUCFcUU9Yrggbv7K9Tn8+r5Ko7FHT+9q6Qd8FT7UZZP3vNQ5JNrcnapSpHo1ulwUypSFeQtEX1+GD9O0SzvtGXGrhIkN35wgfQh2JX7S27y4XQpILqyrQ0B8c1J3W16nZx+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=waVWNUPp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="waVWNUPp"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b1710405so25942555e9.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 04:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783425384; x=1784030184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BRFTSXmxEyf0zn6J40dawyzSU98C1I44YPIDxQ+qYw=;
        b=waVWNUPpnFKFd5HsJlat7safSw6ScvxyOW3zlTehKGTkSB6+bZKmH0hE1tFrpSmvOK
         q3EUOYoHlgNFxyQPW6RtfBjmWQHJ09QXL8buaT4+PgfBHJ32nw+SlJKVIUGYM8yhflsn
         jDwPg3JZ3OqkPrtpacUwYkGNBFp95x7yOwUG97fb4Qy0m3ylZ8knW/79eBP/NWpmGu6E
         hoP6CH6Eq49/kUA/SCNXPutGJ47MKWV2R/N6R46ZZIDuepE8cDZOtO0cCvJa7z8fFrDi
         CP+1vSZbkFHQsYUkyVG4PNZCUsZAtNUtabe4XwlKpiCWDRMPh6ZMqmbAWv4lxIoXtiHM
         xtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783425384; x=1784030184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+BRFTSXmxEyf0zn6J40dawyzSU98C1I44YPIDxQ+qYw=;
        b=rs5UJyLEw71Gs7PqkMArJhYCmWQE4GT4KkjdKZ9RML1qi5XOXj9ZJAILAzpeRNbz9U
         er2MlBxIsv5j4eDQaoZljkS7NoEnaz30KxFtM+CSfghwXs08aBCmlZIlE8nQ0bU7ILgE
         2VhZp7VTxUZuYsiy7N27V7QkoqzVzjMKEJAzJaJ3z6+prhFwAUkYjvrUnsab8Y+Q5hX7
         FPm+9gHbydrJQtrL5/9X60Ck82QRDVKs35npI9SAtM3p7yS6G7ZMix1Tslbtae3hVVFL
         8+6azsv/tR4Pvm/spQikBfQxf45lepmI5lxR9awOu2jlGakIyA9ToOlEVQLzFvY+7cY3
         Z+1g==
X-Forwarded-Encrypted: i=1; AHgh+Rrme9ooOjKsnUz6xdxQ/aP6kGcE3ZDdxHUnCM5LcURsHhJfRdzomwsgKaSRufwfWGM8Yd/jh/ilpJSJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ0A5XRce6s74rRrMoVVUizTs3KQE/0r5rQZ5qRG9bJAvxCuzf
	mnWRTO63/5b0wgO3OjAMUucNZhgf5TunmL/RVygJuveD9EZ3KdODnTmSUZpSGwLQqztuQ51F8Kh
	rU56Xiv0=
X-Gm-Gg: AfdE7cmT20GnqpJhM7eG9ANwEIgjQUvjsxIpCWNayyARrNzH30i/Tc33OP55NClwWsz
	t1Ci76775jDi58Zvq1DZT0lTaoMe2eVtzBybOquEptVjpze4RLbkk+k4frO9a3/3/UTdgFluI+s
	//lOlWx7mZZs5oM9toyviXROBdkU3yYoy2WgmpuPhKLs2SdNQL2KGdpKzzwROz5K2ko9phyzY68
	grjimOsOBifkFXrIWY3pejxmhmhaS7vq9NS24rZb9nsg403y4HWLzc5atfX1g8Rhrytmz1N8gXt
	zKryt/kMIaXVcfVYMGs/UyaPTwhnGiAK6jezJntskg+pAWjLYHif3+A1WsvP9IpD/pVoWOCo40g
	k0ezaeFjePMjmkGORI9ABvHVuROgJ6CJI92s0iwL/LjN6C5Mt0YdXrdOs8dLr7xljU50zlkQ/rj
	E06TlzDHglFjyN5VIcnU3lAYknHg==
X-Received: by 2002:a05:600c:548d:b0:493:c76a:2363 with SMTP id 5b1f17b1804b1-493df062bbfmr53504795e9.6.1783425383827;
        Tue, 07 Jul 2026 04:56:23 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:adab:817c:53a0:8f31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5ca1fsm55401235e9.15.2026.07.07.04.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:56:23 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 07 Jul 2026 13:56:02 +0200
Subject: [PATCH v2 2/4] mtd: rawnand: qcom: Make "aon" clock optional
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-qcom-nandc-mdm9607-v2-2-d906f7e8b814@linaro.org>
References: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
In-Reply-To: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Some SoCs (e.g. MDM9607, SDX55) have only a single separately controllable
clock for the NAND controller. The actual clocks in the hardware are
managed by the firmware and turned on all together when needed. In this
case, there is no separate "aon" clock that can be described in the device
tree from the OS point of view.

Make the second "aon" clock optional to avoid an error when it is missing.
For platforms that really need it, the dt-bindings are responsible for
validating that.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 4b80ce084d9a..0251dd591d40 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2280,7 +2280,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	if (IS_ERR(nandc->core_clk))
 		return PTR_ERR(nandc->core_clk);
 
-	nandc->aon_clk = devm_clk_get(dev, "aon");
+	nandc->aon_clk = devm_clk_get_optional(dev, "aon");
 	if (IS_ERR(nandc->aon_clk))
 		return PTR_ERR(nandc->aon_clk);
 

-- 
2.54.0

