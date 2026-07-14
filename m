Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7D137DEAA
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010516; cv=none; b=l51+ICJqf7siX6YHdkrVMviUaHEgWbDy9JFseUhihq8w0pTqZM/kCwO3kKAmqvhUPE2Et6zkXn+Gq3F6gUesbnnT5tdAsYrpvPmVG3knCWzMpJz494ULx/HoiVIoXwt81DyLT74Xiz5It/AFPRUUE6P+I/QrZMKFuoMwAUp4Twk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010516; c=relaxed/simple;
	bh=V+frO5wk0tnXRPBZHabpKOBw5u16aJAV7l/JMbUCB+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RjpJSsTbdzpFH/Wc9IEHoxK0nmtFTptNPp8LO+ROwmZDxpHSAUEdsfONUzgZQ8Hb3qLDaJKu7HTAG2tk+7fDXpoZ3EL1okeDCbFwSijOcGoGTStEE6A3A9TLzkHtavPqSwB+HlkWbSpWC7mqG/BxIp5Xhirj+AEzUywR92JfMSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pD1JGTb3; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pD1JGTb3"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc97653887so44932325ad.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010515; x=1784615315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KojOIw0/7VKNeIbp9mqtjfjXLwzayJpBCU49qrDmgzw=;
        b=pD1JGTb3HJScsWXkn2xO7xU9ysLiARMfjlAiT2JcZ9gs3CDkYXCDiTwGVoobJ4Ehy0
         4zUZNSLjOiW26+rG+y2c9pW8BZ9Zw8rZUmci/pc67fJlztCnMQAeoXbnBaMhX7WUlZsz
         XJoL9g8gjc3WUzLN6AucUyCKGGzdL8h6OEtQ1JLU7Us+Oi1fssvYjbv4aI/vt9PENqfa
         PBgcycjj9NDGGPpTAMToJ5135p8ndwGC+ZUj+kUk4rtsSX6+cFwsFJKQEhUAyIlK81DV
         de90vIws2Yv1Y2EUyr1Dg7V3KKd3ddgNUsqn/NVCvFjptf7j7aHKk+eH0Ci+cbDvCRQ9
         Pa9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010515; x=1784615315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KojOIw0/7VKNeIbp9mqtjfjXLwzayJpBCU49qrDmgzw=;
        b=qFknQRiu7hpi/7vm3vIspoBAw2VRpBm/s+pvysdbbspT35hYrGonFl6wYnxPe/UVx5
         d9Jtl+UBeMdzbhpJhKNAamgzfNUjmnhjlmxPi9DiFhbrHt3bzeSgB8pOqEhqIiTTsuUW
         5xkcYL/CaeqNI9BIrYwqfJeolzios8HcBsz3SeoHZI/Um0fC8K6ZW0qyysz2NsPT0cfk
         1NTP1FApUyEyB5/S2Kx17PbB4QuYaZpjURvIAGSWxoSie75cM4mPp3lm7E/t6mH08nof
         kNnPHTha+sPIr1/tX9/gokBAfP+Xnunzv7NA7SrkEBlpC250fE3F2W8fQ6hgHuFZ6qXS
         pm5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq7h59Gknc/9oYR1nte3AAdzb1QHY2qhzMYsXADzerhxwOR8cKAU+8Aqh31TiUlGsC6X0XRwTXvs4p2@vger.kernel.org
X-Gm-Message-State: AOJu0YwhaFrNOaXoXQPfAECKySs3rs8pblGkVjMVsD3l8ZihyD0XLfMj
	aYSaFD+NIdJfYcAD3ciWN5M/Is64w5bj9LCBfzASMZo5TReKI+1mOmJtohWdrA==
X-Gm-Gg: AfdE7clA7sBY6Gz5t1Q5FHYPPup4OXoUQC4Km/B0mYDqjW2WByCf6SY52xI+9JLggPF
	Gj7sDmeYsDbas6SFBlKlMkhbamacgG5M7OWdsWd126/+PEj3Fu1ODuqCaTrBM4nIpS0NMuC5qBo
	GJNl9CaR+Tuvom201Py6uxeSnXEZhzjYiJF02xLjIhsXXqr9GVozr1mx8c9XMyW9kEOOHMG8ii1
	BJMr2atltrVT+CdyZlPvYJlH3TQrKT0eQv7wrvytg73XSjEmSTBgYHl4UHEEeRkqIWJLhaJmjXV
	8qMUcq7UgAdh5I90PV+VtikQ5BuUIUlvcltZdm6KDn2NPrPgkUqGiFTcCygf2bQhaXQYhGwerbc
	U5AOEB0AzNntTBYFI7amOlUTh/SWuyTEiqzNBTGFTV+D4bLk+fmg38L8JQrklr6MUe//0GOdXmu
	ESTI4g7ykQ5BOye7qg81StmmNSKK0HFfMYwOwrgR3sS8Usx3nK71Hsde85SccvWqhTF/YSL+GBO
	jvlEWHjue7kf8x5MPWseZrfiRPSaioCjwtqTN30TiS7Xy3pYxUFIH+WaDBkRoe0
X-Received: by 2002:a17:902:cf0e:b0:2cc:fa08:eecc with SMTP id d9443c01a7336-2ce9e9a6f67mr116750585ad.10.1784010514891;
        Mon, 13 Jul 2026 23:28:34 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:34 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:10 +1000
Subject: [PATCH v2 03/12] arm64: dts: apple: t600x: Add SMC hwmon node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-3-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=679;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=V+frO5wk0tnXRPBZHabpKOBw5u16aJAV7l/JMbUCB+M=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xn2GO+oUtwUPDfxJPsqHbZ7FXUVp91WfJrde0vt5
 EyG21zfOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFN9s47hv8ePw0tWnA88ztt+//J9hQ8JR3uaCzP41+9U3qSToBzBkMvwV3LThsY
 372YILlXN7Yh+XRF5V/FY3uZtOusY7F9N2mxvwAQA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index f715b19efd16..17db8d7a850c 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -45,6 +45,10 @@ smc_reboot: reboot {
 				"boot_error_count", "panic_count";
 		};
 
+		smc_hwmon: hwmon {
+			compatible = "apple,smc-hwmon";
+		};
+
 		rtc {
 			compatible = "apple,smc-rtc";
 			nvmem-cells = <&rtc_offset>;

-- 
2.55.0

