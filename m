Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC0E3AD529
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153286; cv=none; b=dforDazWghipr71Sic49DJk/9dcacoc6hvw8Wv7kuCIKkLaMI2NYg1eLZeP9XmW2J42anXn9Qy6WJlFWDRVzrWvQaKaZxqPTzKYC5Xvgg91YYS8C0+U32W1af7JWZKdCGJ9AsnjRUqO2z5KVoSgdk8t4qUv6XVCXPMW5BJ+fx+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153286; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxN7AG1Ipdv2hzUd9rAjKI/UdMzz5KSPQr3fHE9QTdR/LwTP4k31ThLAWH7spI7a0WIjj+iw+AtKVHgO8ZfOThU7J4T7urfjyFHaes3JlY3/T0yBLyxuBwbg/b0nH1j/26mnaz/eq7efeg6yHFi0lsh1i8naEOkROnlF9bX2I/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ic3uAUKR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ic3uAUKR"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d530328efbso10581015ad.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153285; x=1787758085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=ic3uAUKRMR9niHcAT2iLwtGfyJlpPhMBCt7Gs13q3RW9jDR8nxArW71ww3ATnwoUQ1
         eDXZw9kd0N66quWD5Rou44XVSfFlGoDixgKO+3A/nVFDyd6uHm/bcgS8eM2tPkrPQ0JR
         TXdW4g3qc/VY5buQ91A4rFf4Wvs7H9aK7BDLW8ugQZUSLC4TmW/wXqeNE362k+Nkl543
         vBcQaVeNo0YPk02QAUU41mH2HyBdkBmJPPTOhOmdd3GkaCw8DZ5aQvVHOm2QYa0O8wtd
         4tAxPw5nmZDyblPqi78fAEZEpDzQ9KB25TzKOdDeESazo39eKg6WoGFdrspfbzNlidqu
         j9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153285; x=1787758085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=qahGyiDYuIfWNa0QkcuT49coNYhRUtmRb6HXENUzwa3iRTPcQ/IaOaDX7OkX2fE6SJ
         g7BuRcnbeVhKJ6ORjW/18gJYtDqGUcGz9Z5UrXeO/w8XWl0qF5WQF0PIf0M1DeehbvMm
         Tf9vgr1IIyqcedK6yGCikJCPZl4uj56lOEfhwhrsihLNj042/ySOZdI7GfZRwZQI0YEf
         Yt0411pwm0sEUUUqF789LwL7WKzh/2232jgrrNPaYfGlanRAMlQEB2L3qp7CELM7AGu/
         2x4Sm82YfNXg9FrCmaNuAJNmTR+6EFKTzj+0jFwW3TKxwJ4mxWIePNORuXd0NWyjAQOV
         IZbw==
X-Forwarded-Encrypted: i=1; AHgh+RqeRKv0o5QVt9m0iWnlYLgYRHfqXoVb0GYC7PHMUZFHn+cj3MmhCIFE0yMgL0LlBGBQ3FZk+MlyQf+v@vger.kernel.org
X-Gm-Message-State: AFuF++n+2zGEXIj52ZsPIi0uBpHjG5NOMSCIhQk1nVyGNUuk61F2QTJt
	cu3cuLp2bC90d2MUpDrhhDQvY9Qt72vtbC3hVRVVEu0TtuRI2LVMnPSSIkyRwbzfVFs=
X-Gm-Gg: AR+sD11ZnUdjVPQnYdYnR++KvNR831DoLaYCSn/eLBUtr7WpHNMbnWZaK+o1Kjz6gks
	0CLKHI6Np81SfsBp4xWL80LlQIXjlj04qY+gs9cNs66u48k1/0KVq2sSKWay4TQ35kbAvFEoc1E
	rGiP9O+iqpySLs+aUUw1wPBbriWtAxrMO6Bk7NGjKrILp+gID9zKO65a4wZOhuYF4HW6Sa9FprN
	nuiOm0AYyGcuC+/0ean+4Q1OaHyotA8mOcNCWsYjZ2wlCGKeoBQGAqRqp6zjtUE3U+UpDq0vWl6
	prFT0qgn9eRoqeLtN+QgSJp6dNg1I+1DCgMpV95VJktA6ViuynA6L2o6okg++gnHkkXThjyVqus
	DehJjB7DfpA2CLAk6raoDYq2iX0pRu8sovyOuabHHi1dpsHNf8XjKVhGGxGaMiLxSq1LLrchve4
	C+/l9U397E6MssTpR54OgtQ77dWZqtKriRK1VseH72Mev+H+rC2/DD/HbRMUn7AK3F5/7n9Vai8
	kNCT4lFS09E7IgABTnINw==
X-Received: by 2002:a17:903:468d:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2d601ea52fbmr110193595ad.11.1787153284859;
        Wed, 19 Aug 2026 08:28:04 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:28:03 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 11/13] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Wed, 19 Aug 2026 15:25:40 +0000
Message-ID: <20260819152545.3934-12-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152545.3934-1-sreeshankar0910@gmail.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

