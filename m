Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3607F47CA64
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315246; cv=none; b=HZJiLHwAbIi/ddRbvjPlGimqMx0Bn8Ty++DAU7gkUPPchX7TvNKJijfDMJ8rkv6TgLfuKV5ZCzjQeFkZA5gotrkBJDda6zmCnS1ub52yFtZ9opjefvDrE9o6Hw4qqwpNEmnqlnbCWCO8aADADkg2OY970Oi9OB48+gww71j+vEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315246; c=relaxed/simple;
	bh=aRikrKedr8rRD84dJqfsSjKHfSLi0ROhZlN789CUbJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mfv1hbiQ9GdLls/W8Pp6i0Bi7UazZQ+G2YDDbODIFFRDa6WywFZdoWqMvHbUJBddvvNYlLSeZrfbjMTOFquSAr5M57xaqDQ6dJdG4JSKuqOg0xg12mINoB2kQs5lw8SqjuFSKYkHyCjzpalhPBs4vsMFdfX3lADlbjVHlku6Tzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyHo3Q68; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyHo3Q68"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a3e145e1bfso1315151a12.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315235; x=1787920035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/a/K4l60N8ZYR9C9kOGDnGGvsCsbHCt+W0MVudFPQc=;
        b=QyHo3Q68WhsfgHv6ExsGYFjMBTWH/225oSsPXZNSIGy6HP7JrgxcduIuJwOedH23p+
         U60gRWi1Q9odTZuBfADIApozwglG2DWaopqdiTS3XaRast+KKrg3cu4jwSzdRw/mMtpY
         HadWE/UWOFrLJj2O66pCPXqdR3/oqnvAZz0LAvcUyiHGorkXCaSLvKrHXfsDRvkqNW/E
         QT9YY+3WcYxHLa7IIZc96i8PHzdDwBlBd9JekxjncEC3WkLFLPrSgwY+gOQbdgHUMe1l
         zC0hn6ianheu2qN/BtLagNksR35loz6lbPdWZOHvG7mOKWdIcFMNPsNIcU5dhyV0TA/o
         HfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315235; x=1787920035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/a/K4l60N8ZYR9C9kOGDnGGvsCsbHCt+W0MVudFPQc=;
        b=LPnnKvqrtQjVmaeu2zuBbQXFX64KOzQHnikGT+BZTeI5nWxMHppOy7JIdxL95YUmkF
         3N6FAqudJyt4MhJY9lWEIekvIJ0lE0M//cEXx/mCpy4L36OLez0Su8+BmFMan4BDAvf6
         MRUoLBC0HZSGXdqIKqWhjZJEzwGugA4guzeH6BwV8vQmHE0MgBvHmF2bS0uZPhzQ/6Gf
         45aNLDVdKyjznLG3HzzFpy1VkVqQhkXstzLICbb3eb3jbsov4og4XSmYiBLITd5HqQm5
         svNdAbcGrHab9YmkmQ+NJaJmxuQxCYBxKoLP8vb0RjlS/+wiJbQDMHtUVIixd5MsT+pN
         XeiQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFF5zJAKOkkGp9hMnAa6RdXS3VywxEMHH+j9ba5KXwTFsR88XTMWUZ5fj0bCL6TtT5rZ3vnlDo47Hr@vger.kernel.org
X-Gm-Message-State: AFuF++mQVBo5bYr+suDg0cvkEnSbR/48dEcEEGGz3O2DpeRwupsmzpoS
	rJKKjz0szb/rGbNkIBh2whIgGsgld5SYZyqH9urbok5PAdPWoyglfg3y
X-Gm-Gg: AR+sD13xmNyc+0MuRaouEBV3Z7FNORKp1nnXUG1L2ZBDrhcTwf4jT9KXZJAKq4LiG2T
	T1NHy+eAqO9iuLjyHKHGQxxdNgEQ2OaLYOM4hNXRa8MvkfbA5FK5Ns4U/IJFz2YWFTy4hTYyPVn
	kiRXaWSukCkY4A+sQ76BqiA7tNusw+ZkLIEd7NMqDeFbBu8vidy4ih7EBuW+4r6K5s9cn9vaRHU
	d8eKJGVpRaYHybwaUPuUse6VwGMfOWEjvP5d6bhyEzzOxA7qKNIvyFMrF6GnNJxWc6EnqZGiOBd
	7WClO4JmuA6ze7kltbr/+4YUWD/zzloePD9B2O4RAW8ozE5tIZfnN2+cPwJif/F7PxqKs9MkOGL
	DHxq8vyQ285u5nfoBLEdlmSGpwGqvPrY6uBKT5hvUGtzKl8XwA6NIu7Dsqc/jJonjZt8hrx8Hh9
	Eget9ukNcVb9kd3H3Kqyh1kDEkzVWQOTgTcNCO5a0UYi+5xXO3lsUgHjsIl1oMotDGcxX4MWIlP
	OV1z3OB5x1iKR7jca5LkNaqmu7od3452oGmVA==
X-Received: by 2002:a05:6402:249f:b0:6a3:ebe1:c2c2 with SMTP id 4fb4d7f45d1cf-6a42f14dfacmr7250121a12.2.1787315235036;
        Fri, 21 Aug 2026 05:27:15 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c315dsm6220262a12.9.2026.08.21.05.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:27:14 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 14:27:05 +0200
Subject: [PATCH v5 6/7] dt-bindings: arm: qcom: Document Xiaomi Redmi 9T
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v5-6-ec81cee63e09@gmail.com>
References: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
In-Reply-To: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
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

Add compatible for Xiaomi Redmi 9T NFC codename lemon which is one
of variants of Xiaomi Citrus lineup based on Snapdragon 662 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 68542f76df30..5363efadd4ee 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1035,6 +1035,7 @@ properties:
       - items:
           - enum:
               - fxtec,pro1x
+              - xiaomi,lemon
           - const: qcom,sm6115
 
       - items:

-- 
2.55.0

