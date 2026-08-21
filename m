Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20168488D91
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 11:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312209; cv=none; b=KGWs/Q7jE4YSyS0Uo8Bxs21p00GbrVYChtFs+5gnfhm1IaSOHVbickZ6O44LShAAe5CfHnq5dmjvYSxPTPSAx2ri73yNwLWcuq3lV9Ecn8zrW9dTjWZWfDtKOMTI/HvhSz6IBREInL9KKpMCX35t0Y+xBrgDRzrEQrK9X6Rm+lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312209; c=relaxed/simple;
	bh=GtU3BwmWr5r04fdNMr2P/dLekVQQQO6qKHal+CTJ5SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H25J08H57fajxeEGu047ltY17Ez3/fiwzrNGQDaf1r3P8xK7Wto0wGl7p14kExoz3oJkPl3OB1N09T67yISXz2SmESFbWpZJqkVRs/XHAa93JgIdjPBYDmdjDNxcyP4V9DhcuJnko/jxH08XdDFnVlaq5NpAeWe0Sgr4wtFtqSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cY1BR8Ow; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cY1BR8Ow"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so1814083a12.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 04:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787312206; x=1787917006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fqnhzBAbwr00r53ZE/i4Zlj1u/RNPOU76CLxr9WNMu0=;
        b=cY1BR8OwL7JRO+eF0OsNMGYgpnT0+gX5pyB49TKjGotM+IcT43LYWnjSWVU2pYXBwl
         +Ykjo867/GzDLZT+L8bOjInFel1BjgH71NRZvBjs8dLXOIEoc5UFx6p+dJlo01wQDn/2
         3zb5ZWP0v6Lrgo+73hhvAaRe0Gnsjr0dzNv27mmRWvSL8xICuePf5DkmgczeHdRGZcPi
         YWOQfXzO8g/eWIMgeMdx8BAcNIDPLo5KMDh/BzAiiTnnFjfVPZ5ztV8FJzUA+aFhPrgD
         fd/Nsi68T85WrDndghAUFyEp0ggVWwbIzQbsxJtGCz2iziajM0H/QMUqnjC13QA32LaB
         QIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312206; x=1787917006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqnhzBAbwr00r53ZE/i4Zlj1u/RNPOU76CLxr9WNMu0=;
        b=Gs7I6V6csnM0KfwhyrJVoXt2aJNrU3Fkz+Eq/WaeWKujIw9Bz4wqio81L3j6Cgr4NK
         R58dWMqcU0pGzB6Zl58ThcUI/2Eb5it79iozj6nkWxLdEooswj/YFUmSs89cVL+nRJX3
         z2Db/7L+eCGc0npV2c/ha1+PiqCMXCGO2X5EEarOT4HyXAMfk3ZdwzBM9yHX/CgNAbFN
         tM2yB0yeqPyOQo5yAOMWgMJASngDtguwZjwKThCHayy6c+KaTt0vunxIE9Dv6JeK+Na0
         SHaIXRBX5rLH1Nx63i4wgvpPgy8S+aoJDToeZ1ytYzcw2G9AMLewN6NvexWSCkR4j42q
         f0Mg==
X-Forwarded-Encrypted: i=1; AHgh+RqjtySO033mzNlb4d5DXnyY3QElL7hztO8kMEfHKBrRxbMU2MaBhbyhD9gPD7U8byrx8oktohu2NTCa@vger.kernel.org
X-Gm-Message-State: AFuF++nT7teSZl1ls6cmxyGNGyHp0Js8TUzkpxnLqSLwuL2KCQwhsp1R
	qXJDioa39ldi/imTZTKtQm3whWRQX5FD0j6+S/uek6KqIh0kZz/psAYP
X-Gm-Gg: AR+sD12uRIRbHvSLpbjjhXpmOO5rXlMoabP7oAalsLITfpDJkilok+fm+k4ipQLpCQs
	GG9fEuF6TyxlaMAx/2H2aKGsMgxKQHE/bA3RjXfRsC5rz4BraT4eauoTHAN8wMDksJJWyRkuz6I
	2V7Beix+LUzVZJOdJy9CVXNOugGbgi2Q87U0DYgrgULZhNg2r/Drxw82JZVF6f4yKXxg20h3G5z
	vzfW6oyzP0Nc14XuuNqzckt6VpDr3G7C7lFJ4q5KhEJhBcMSkRQX+aGi+5q2i5ujb0rYukwT9xN
	Gfytey/KPUjGrJFKJkkmaBxjZuCQwJ+TLJ1hLQTmC1bBpIJ8a3P5PYeWX4veA3Mfp3A2SAqlPGm
	0pnuc1RW7JfIEmjyHDQl3FlGg0n7oqYYPOBoRjpTzymxNT7N7TxraxyNrmZN9G3WAubp5R0pFkY
	wQE/i76zrFVzJRXYPZDkeLE6bas8ep5XwXuKds32LyMl2YuEgaBb6ZFhIe5RHfFPUbTICRZUmOv
	UQA1/g5fuH8p0PirX/mtJH06o223NC6oxA=
X-Received: by 2002:a05:6402:3818:b0:6a4:cc9:c8f0 with SMTP id 4fb4d7f45d1cf-6a42f16302bmr6103267a12.1.1787312206351;
        Fri, 21 Aug 2026 04:36:46 -0700 (PDT)
Received: from [127.0.1.1] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c3491sm6204661a12.10.2026.08.21.04.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:36:45 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 13:36:29 +0200
Subject: [PATCH v3 2/7] dt-bindings: arm: qcom: Document Motorola Moto One
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v3-2-cd64bcef6e21@gmail.com>
References: <20260821-next-patches-v3-0-cd64bcef6e21@gmail.com>
In-Reply-To: <20260821-next-patches-v3-0-cd64bcef6e21@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatible for Motorola Moto One(deen) based on Snapdragon 625 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..289a3de1d24b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -292,6 +292,7 @@ properties:
       - items:
           - enum:
               - flipkart,rimob
+              - motorola,deen
               - motorola,potter
               - xiaomi,daisy
               - xiaomi,mido

-- 
2.55.0

