Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A691D42CB10
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 12:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106061; cv=none; b=Etf1jnh1A2q2SQp6roFxPgFiEn7BXOxVsy55MK04HnvxAvxF5gpLKvXha5VXbJWdhJjXhZiTYr5O+4/njd4I77RmlvpGmKhUOxmjFZHtfEtczFAc+YSPSqB6RDuggeO09RB9wSlsMSKyg0For2+/jBZqxVtghTSsKgv4OMNtObY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106061; c=relaxed/simple;
	bh=swvAJsMf+noAdjAOdgZgJcavQOiTqHlXuhgcaBqarWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YVaEfYXpl/3XJ1cEgWac+AeRoPMBMQSdtdmcf/SIW4zoDWz3RKJJ/DyZsZDQLfsbExBpgx+ujYMfNkTaA2FMbp8oorEvwosaM84S47mz3/kyeLpSsM9X7xdA4C4WSXG2fEhYdcyhzLxzUHEoHhSO9U3fL+4vfmVnCmMyhIDh3Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfX2s1Rh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfX2s1Rh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4957eefd361so24948095e9.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 05:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786106044; x=1786710844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jo5o5mj93URUeV+7YiIiV0G/8Hcjq6XVQrtqV+XyI6g=;
        b=bfX2s1RhqrVvdkhe1dxYDU6G7TaKw/m7GHvsffzYiUVhiN6OweBovMyUpLaNtKIHn3
         0NXQrMAnr5lzdomB/kY8AjqA9TZ5Iq4FeH81Y/nGpNVGFIEVcyRMRVn/p50MvVJhB7wd
         QGIAKczXzBy98jQNmRbwucCdmzkbDviBVQpOnMLMpOKJshI8/e0TR+2wrkuCieyBWa7g
         FK1JBpC6t/7CVvvtjq8Khqvlc9X/51b7tg9w8eXqDVdHcqZb5KIhrKBCC+TdfhgNnXYz
         //zZkoWuFvAthyRnSEkRVRKILMbIWxPm1obDLfI6lxQv1PzliGG1hKlb51lupa3lld+e
         hwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786106044; x=1786710844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jo5o5mj93URUeV+7YiIiV0G/8Hcjq6XVQrtqV+XyI6g=;
        b=LY8mWDEZ5k1SzTD8+t0pDW0cTxGDQ7Yze8HVHBbryQRUlFPVGqw8bJUw4tm21wCyRO
         cfckc9AWUFjA6frc5f4Uw9QbSiJ7Bw5786mBhgv4vZ3uQiHvpYYCSwCnMFPDcy58Yn1g
         8FtSbAq6DJp85jTW6WtkJrI2mnxQXPh4UgfHF7ESmcye3m+3dnn/6Njz7OhezoNVQFpZ
         gtqPzYD+YkiVDmcZBwRKnT8VixcR2Z0S5UwKkqKAPFPi2QSRaB2UsrWa8NgWdbG7QROO
         Pmmkyvl3ZzLkr6KofdzAJkSgo1PVwhGfdaAEJ6EjTZJtE3cySROewpD6Ku1mHxmdxp+a
         4Y1A==
X-Forwarded-Encrypted: i=1; AHgh+RojPMGL0SniDBmbu9XzU6rZEQBCF/ZMBRO9PKNsVVBgT3/pd1oF6e7FViZ6FgN+GHj2zgnPtUuEnsZ0@vger.kernel.org
X-Gm-Message-State: AOJu0YwP/jrTAyBS/qjhuwyvW/U4ZFxyXQgSAzoVKUqkxQ8Gn0z/Amfh
	RW+anfI66hFFHQGMVSk1Z6HrJ/tvwuHQQBnBjJUVAqnfLL9DtbwBq39r
X-Gm-Gg: AR+sD10LygK92dBxYCVzIWd9GP4/5KO8BjMdJLVWms92N5MvAa4KSs+TeDToJfx+EwG
	SmSM5J6Kba4Cwu1GmCkZZuUYzkDZAL4Y8H0K2ixJA6vryFQsH7y/yZUZ2XGwVWUsyTlaK/vrhw/
	OBL3JeoF/XgUbQp3tpCGCe6fA/+Lj6RU3Xl8F7gUSMmIaB5GY2Hg5I0kmPAX2VAWR9cAwcipLSg
	3lJW2eAGiv7lsV84WqgXrj6YheLUyEmG6J9IQAJexvoySmUkyc86e4jwDVmBDdtJAUjvC8+rp/G
	+C1JqP8/E15qtG+k88EPTU7rDx9amgqPe+a5X2BmS512zZGfRNX6end5Qc+B16MhfJRZPkqdHXh
	Yi7vM6CUO8H+y24FudePNprzSi9TthlzVr22B0JWmYE3aQPWij83aheyz2AzlYeYh0iW5tJjNVK
	xfviMl4yZgYm5va4dA9BFBAnuIvVVCRjS0hme4QuitPUrZUm/uMPMQgVmKt2Qcjau3
X-Received: by 2002:a05:600c:4fcb:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-4995e084875mr42434335e9.7.1786106043871;
        Fri, 07 Aug 2026 05:34:03 -0700 (PDT)
Received: from [192.168.8.167] ([2a00:f502:270:d465:a26c:adcb:8da8:6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bdca3ddsm49530495e9.1.2026.08.07.05.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 05:34:02 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 07 Aug 2026 15:33:30 +0300
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Document Samsung Galaxy
 A52/A72
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-sm7125-samsung-v3-1-ac0139e5c612@gmail.com>
References: <20260807-sm7125-samsung-v3-0-ac0139e5c612@gmail.com>
In-Reply-To: <20260807-sm7125-samsung-v3-0-ac0139e5c612@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatibles for Samsung Galaxy A52 and A72.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..d3746bf6a106 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1068,6 +1068,8 @@ properties:
 
       - items:
           - enum:
+              - samsung,a52q
+              - samsung,a72q
               - xiaomi,curtana
               - xiaomi,joyeuse
           - const: qcom,sm7125

-- 
2.55.0

