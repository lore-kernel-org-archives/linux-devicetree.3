Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78064C9579
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 16:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791218593; cv=none; b=GTMmo0B8kJgl3HQrlfOgy/v2yi6FPmWV6FmrgeqDvkH2ORVf1MlKBakTA13Gjyn2bNfNTXw16Ui8BwFVJSlslIW0wRmSlZYXhNxbxqvTTVvw+EjsrOhEaF/KZPNkeHGl23cpa1CqzV+hYzIlmMUG0FlohVqpaDE5WHvxQS/fhCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791218593; c=relaxed/simple;
	bh=onxGFw14UdaCBzTiIQKMoS6rRAkkOewNhWFGdGfRBEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KaUNSlIWsavD0OQEojlVM8whjrWHjXY/xa7f1+cntd7D2ONgmaSTCL5bqyWuJyoJf2zW32EDEOKUNYmD6vc+aNZrd26wZNr/iQEekX5HlITAwXHPEVw8M6LWXtc8uVmeu5t8dyOLwlojZS7D04sBZLBhCA52WsqA3zx78EP6RcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JliO+Y7A; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JliO+Y7A"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6af9befd04cso2800722a12.2
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 09:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791218590; x=1791823390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5LtuU5mJBEJmnwj1dJT2uLQm/24d8PsdO+wylUidO4=;
        b=JliO+Y7APYbEJ8bVIkDO2piBfvD3E5p9/AAmIpbN9Xd3X8nvl0k6hiIdaDb/hM4txK
         RRh8NcoEUkq/0dUyB30UV6KjbhATlG9xZuO1w7REhfsTTazdV7lo4GTgRHEUKOGW3vGH
         ItDpt52Yu9wErwJvCwtLfQIHF+TQVvxImLdn05YDF3Wl/OpGBQOUT7zdWJhTs2H4dltv
         tqo6PZf2w40IrUTb4rZK7mXR70+9tTM5n1g1cMdCvi8Sa4aaXnwL+A+5Jdj6ENsyVWBK
         MIzkw0zh/CuB8rAVIuCBWJjqZXuUe2k9GPJUfBYN8tGbKutJ1LcSNFkJdwRwAxwUFsZU
         2wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791218590; x=1791823390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5LtuU5mJBEJmnwj1dJT2uLQm/24d8PsdO+wylUidO4=;
        b=t2SoXVZyT7tKMLBeeUkegjpsqTEQGn7aPVO60UxFq7+53U6IYRk9lpNoIsy2tyOWjw
         kDOip9HngY8eKmDbYbxvnt6Zsgg0DDrYZEqkHOH/EIa7YTf1mHRW5LvexlkF8EDfi9e3
         zKVwxZS+qtnvsbjEq6tg5i/dWDRNbgojEDCsVOtAOZpgGnONBEgqtV3Ppn0EJZ0EgHeN
         Kusrb345bgYhXFbYzztS9vmlO804gfZQ9SjgPWMWm6apAO8zWp5cPWYSJKd2BJBZFWXQ
         R7gjx6tlogoV1CeoEMnqSYa6JFyeZPaJ3LZShrPPHRjS/OMvr5WfvswMXg/drlbQ0IkQ
         cllA==
X-Forwarded-Encrypted: i=1; AKwUvBwGsTje35nFoW7K0/Vug3YGsdbwq0HIplPHLqAtcztuU9NIOj+Vvmgyr/qaDkXP00JjUt6W77r319Qm@vger.kernel.org
X-Gm-Message-State: AFq9FYKoekcVmU42P0t99DH4iHf6i7d39rZhvz1KQYSc4aV+4IHPZB03
	xxDyWFlCr6WmSpvRAx8Nx37+2ELqt5+YxBq2/GZGytfiv1Sbq3bNC4V5
X-Gm-Gg: AYBFou34vaziE1M3+JYAE2W0vsyncgWO1h9dj/FoUIMh3iLHaWYTeh9cbdk13+k7D/w
	kpx84ob8ckKrgrfKm85Y/YWOusLiqbZHhaAWXtJdr06JRzAHd+c9ZqZ4DXo6S3nOCx8CjtXIPp/
	EvY9wE9jgWwKUzIVTwNIzjcfUOegFYIjxf6Zf0q9JEA0U+8eqxU+E39zXrmS8WxNEa9JJ5S7Yyn
	acltSjMIuKwjPRCmCesgWcK/4OZFQXWPNhYZqcDM7fsFYKyoohPV96qNsI0P7uzkEJCh6hNAclU
	syffUqj5oky7eDbOrVJfzfPyrC0GqQo2Pc8YwqdcFR6D712gx+YZSnFjeRX/pqPJrDhoHpr3mse
	7asqtOJm3MHBt0VNiHBtyAfWoRe82+L8bYMKcgeZsLjF9adPMFq8TQkhyTli9xEjvBa21g1CjwT
	O50zD+N1nIxdb97xPPbEZosG3+6R5EsGEo3Ot7wRdXalNrS9rlEE+v3ivIO2odmCUh3eZlBpNom
	eEAHRCeyApBDuD82+UELkg=
X-Received: by 2002:a05:6402:2b99:b0:6ae:fc0f:e19 with SMTP id 4fb4d7f45d1cf-6afada35bf4mr6868392a12.42.1791218589731;
        Mon, 05 Oct 2026 09:43:09 -0700 (PDT)
Received: from workstation.home (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb021af56sm3485851a12.31.2026.10.05.09.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 09:43:08 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v5 1/3] dt-bindings: soc: qcom: qcom,pmic-glink: Document Xiaomi taoyao compatible
Date: Mon,  5 Oct 2026 18:43:01 +0200
Message-ID: <20261005164303.1208127-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005164303.1208127-1-zstaseg@gmail.com>
References: <20261005164303.1208127-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The taoyao is the device compatible with the QCM6490 platform (apart
from battmgr). The device also requires both UCSI_NO_PARTNER_PDOS &
UCSI_DELAY_DEVICE_PDOS quirks.

Document the PMIC GLINK firmware interface on the taoyao by using the
QCM6490 bindings as fallback.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 16ad4f5698fc..8ca057c4e3e6 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -41,6 +41,7 @@ properties:
       - items:
           - enum:
               - qcom,sm7325-pmic-glink
+              - xiaomi,taoyao-pmic-glink
           - const: qcom,qcm6490-pmic-glink
           - const: qcom,pmic-glink
       - items:
-- 
2.55.0

