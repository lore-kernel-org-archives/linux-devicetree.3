Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864316;
	b=aQx8UoJ3iwwZa9PTr0qZhxwTlecptT9UtMeg0abJuSat6Q6C2mT2E+LKNF8bmDmxAy9T
	 zbdzi/1g/lNYMmhJn+C9qII5nsKst8ru2BzYBw9Hzb/Yp2sEP3riaGoXNopCIMQhRMi6G
	 RVNSpzYJJ6XWd7pDLNz6R3qGt/vn8ueO1zV60HrywronwDnwiW6HrLAFqhhzjSQrrTMes
	 zaKCQu9VBNnj7QjfvKtRJ/hNRh5u4s+SHv11L4Oe8PblUx04Y1KgTJ88kpvgHZP4hBNc/
	 /eUDnwMBLs7avAvCGuDDdKyL8nMIj8eqk50ZXz0aCkeZcEAUodMoIWTKVPsvAGlkiUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
	b=yR5h4b1xmLKssUk1hjSujhLQFyTozBJSM7QeYKsI6bWWqltAxHV7hwk//rb2Zg5/AZba
	 eh+BRDWl8JvHzq8liuOpX2yBgYLYgM71SQKL57fzwS6OCc20Sk/MRd2Sfr+r9RbFFOdF/
	 Ijez4EzkCYSHisngcMf1VQDeHWvnD6BESQCjmAezZwhKVwEBVKN+o7zUp6ATjgoLI8vkF
	 406KRDWZFCmZIHolqshvHK9H/bZ0vXWxKw7VKQSwZwg1Y6RK+WTrIwdDtzFK2kgRD2NaA
	 o+3Rq/vjwJr7ZH+F7K7bygCZbQcXhgF5fD41qT9Y3JROxJPU4klXrr1u43U6+nsDCYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iseyRQOE;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6903606A882
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6903606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iseyRQOE
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so43352975e9.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864314; x=1795469114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
        b=iseyRQOE/E32bBmFMCAGUZXSR/qaLS4KuLAqOaM+SdB1JDnfrcopkhfWQ8b3jLTZCD
         qnnDF/TT02D8xCrqB4uYGpagOG6wlWE4ePRpg8iEyCytXx0rLcuO5fHP96J6BIpDA9gk
         iLegNl1FcpOeWC+AHGYP8S/mBYbuBSsoLoq1b7+0p3YSyh7zfJ3Gh365uu37gQWPYdx9
         sRQ1K/GlWzE328os4/xKBsZiUoCzRXcrQhKQfvT+wt8D9oV1SyfpnJHrxcPhviF8ImRF
         nq1pKotED9Wn0jay0acJ9SaPH1qUzXlfvAzx6TQMAmwR2F+FrUQxqO1IV8FBYfMkmPfX
         W99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864314; x=1795469114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
        b=TqAdQOo6dq9KMq3971mWfAKKH7jKAAvSMUIi5t0qYbskogPPwQPPiiI0GkQU/DunYV
         VSCW7pCyO84bY6pNB0lb7jgaFxu2PPbqY7zvGq9a3yVXTSKI0A59mGdbUSkAJm/Fm4RU
         lFaMbQ1DmQgdYaD+qbZ87/GfC0AD6jJHtWPg9Pt5Zv+sBUkbEuMYmSDVtVPAPNxCLbDU
         Kxwjx90kKOVUKw0lXD0XG64vMbqUeNrfCtyAFY78baG4mXDHkyLAOGghJkHDUHbv+6Iu
         OON0SyFlJK/Ra2HH+oWelMI6IzRuK884dQMxSoarYk/MEj0HmP0xZEfXs5d1VewG50V+
         nsyQ==
X-Forwarded-Encrypted: i=1; AL+hErFXdqjKkqurXBXsobUmLopUFUiRidskbPIwnTx1wNRFSH50D4LySdvf7Oi8DVLVmN836fN8kvoZ6P9/@vger.kernel.org
X-Gm-Message-State: APuU4Z/60cB2GijGfObi2DzQI+B/cPtOi2vkA1n/wzdm90FAyRhsikhw
	ng+RLeL6Ak6h5kkeCRqMQaJ1V191+P+AU4Hes4Khdmg4BgI5SA05yC2U0MRfTOpEv6yeyQ==
X-Gm-Gg: AYBFou1jCFHoJy/k4B6c9phGr09oLgYDpyJh3sOYqC5VZprdEzpuPJ+IQV6vJYTjlYz
	tph3gBASrvrWPF1WZLRHW4ofkobxEl1e/1Czf4hV2K7s9ZMvbmwUn4623FDy7NFhR9oXkOVFQe/
	tZVeZXzN+NI3HyZZuyfxTqAhcLEukDR0Aw+Gd2NV/7E6XsFBqMtMBRnl48+Ivy5FRaFRF+Io5tN
	Y1hm00kxTlCwZYtSbPJUi5fmbUuEJI1ZM0G9Qa6D6ViW+0xEguXhdyZ9RWngfx7UI9sFxiXnEys
	SbiE+R6PtirDDtYBW+PyhPIOwu2mH8IwJiPJeVPXLCvon44Wr3fOnV1mcCDXAQi4n5b7nxYr35X
	EEVRyv3zBt5El63PGCpztj+QTy6GGGKME6Y4Mjsk42AfJnZNIFX2kuZm0dh6AaLwitQSlYCeiIX
	wjH/BL24u4M9IBTlj5t58VmF3u2O6R0UL91WcMrtBX70OMMm5yZG33glDXlF1Ymtey6oHD1c/p5
	25PUKpCFg7Bilsw/EQfedWhTbga4phns2rJ0F1EVkGL+Odlhyo4RU1rrIbRz/LIn3uPAWShdxWd
	U8j4Y4Epzm4spkoWpdx4CkA6QFozCv2iiJGcFgSQ/ikzPC5qtKaTNU2dKebfCQ==
X-Received: by 2002:a05:600c:4e88:b0:4bb:7033:c936 with SMTP id 5b1f17b1804b1-4bb7033cd72mr93163065e9.24.1794864314291;
        Mon, 16 Nov 2026 13:25:14 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783854cesm26340475e9.1.2026.11.16.13.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:25:13 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:25:06 +0000
Subject: [PATCH v2 1/2] dt-bindings: cpufreq: qcom-hw: Document Halliday
 CPUFREQ hardware
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-cpufreq-v2-1-e518cc055457@gmail.com>
References: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
In-Reply-To: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864310; l=1136;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=/5q7xJNdAtVYNP2eKqnOFRxkwGs69ZAxtJgwpCpPYPc=;
 b=Nu0RqZZ5Ivs9eeDLVKmj50eQ2veH0BxWIj/S/nAk4YibWF4bJq1xDQ9cK7u9JqZQViYI1Hn/b
 VTSNe8I5N9lCjoKUbRO4u4YsnoQGGy5myEbsLjX4rzZ50PPP5EVJWt+
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the CPUFREQ hardware (EPSS) on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff172..d6040cd293f9 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -36,6 +36,7 @@ properties:
         items:
           - enum:
               - qcom,eliza-cpufreq-epss
+              - qcom,halliday-cpufreq-epss
               - qcom,milos-cpufreq-epss
               - qcom,qcs8300-cpufreq-epss
               - qcom,qdu1000-cpufreq-epss
@@ -135,6 +136,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,halliday-cpufreq-epss
               - qcom,qcs615-cpufreq-hw
               - qcom,qdu1000-cpufreq-epss
               - qcom,sa8255p-cpufreq-epss

-- 
2.55.0

