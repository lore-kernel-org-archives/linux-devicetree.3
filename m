Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFFD45D918
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981668; cv=none; b=GaZhtyDq10PFgVWBg6qwm9xpwOLwhkMhFXv2Jskd7WqCRe2RhKdLCj+n3fAJdZPeTB+m0JyJwJF0Q8pROKcZnlpP8SjoNC887BpAIIqNXgvnXct2aSNAG6+ee3lSG+IG8v+3B+JtnjBAPvxP9o++GO9K7KTx/QaCQNiEz4/Ev9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981668; c=relaxed/simple;
	bh=V+3RbJaYAK3VrAAlEI5DLvOh2bhHgNZa0FG1HxRZpSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JU00i/z7yhRoZ0obfS1pIaJ9X8bkjdiRIjYcsMmRMQOe/Gi4Mvqi4LKswlA+sIEeYJs6SGHiveY+PnlztkOhpAbLdpQlWYQcdWRoNQzkaWhEmVh37dtcR0tVgdwlQuoXzyvqUOArkFBME9pNy40y/CBby/ANJvrWBcPWhiemWSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=O7lNwxU8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="O7lNwxU8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369d18so19903605e9.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 02:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789981664; x=1790586464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0AwEoRaf4CpQfSOW+6VZP6ArOHJGwJE2NbP8zHQwxp4=;
        b=O7lNwxU8qXia6dEk1qeE0XNx48rVs6trvbDhReoZqxKUpJ86SA/0A6QgXJcGUkA0QF
         CrEOT5Sikduy39MbqsS3cEdvO6MAUjh019RNyH287RjvoGq/h8a/IFQZzaMlF3lEvoBs
         0YPpscW+UT47gVpLQcEHQTnbXjTUw2I58WA6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981664; x=1790586464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0AwEoRaf4CpQfSOW+6VZP6ArOHJGwJE2NbP8zHQwxp4=;
        b=FWOQUQ0NKee4os3IQ4gN18G2b9lujclV1P40fXO8oI6Ke77c4j1JrVpP2svuyRFb+S
         0WrvIWC8UtGgXbx1FJqRuGRssDC2uwrwY5bqeua5kHrBLiZHDt5wRU6tJyBazV2AiooV
         VYj0Gz/MQuLPfjLpM3JuLlYtye+89H6iDJA5KeiiilaGyaYUxVcXpU8OTgSuvQeHfjcl
         GgBjGJp0cTMT427LzgdiJxJBupKcui5VdVbys/PVP1lk0ApS86VWrGJKL2nBxWQrgum6
         Z/KJ0cNdEtNlBdEcvweU1AW+HOzUWcpUAcPpqworVeMPdUd+PJW47nksEVFdNl01IbBj
         PA0A==
X-Gm-Message-State: AFuF++nXyb4iZw9eSZiGnEtn7FeVK09w+HxG9lPQvvfk0gnM9g/ndkpi
	C6XHUc+855N3qXXaj5hhZwQrALV4fusSxokQtB6QbYiWcoGyHen/drLOv8jRk+1LTCCZOyqdzPf
	QuKUfB+4=
X-Gm-Gg: AYBFou2Utu67QYTJMvU9aMBYSG+z8mk/clOjP6zFul35LqlZ7DjITbQIJbkts4GP/we
	2OELQz9I1S0w1fpiJltcvhdP/JvHsQaRZ8h/rgxdkqGmA+tbQUNl8gmpDfnvUVxzwbKJlaIAJTJ
	JvtDJONAidbW6+g9xCZ3jDus8+v7eA4nNm1k/+UZ+bPc6HMvrRXri6RQBrcUFQyKep7knvr8mV3
	pWBW9PnDCiAfYxvKWRyzsIsGMpcs22gGNd05UhdLsgk2DC26fj7VeIhR71sU3R8vEM/42go4caN
	qVFRm4DPr/JwvZzkjI0NJ5BT5jHhony9uBlSMI0VI0U3xkkIucwFl5RsML12sdNObbn2SPYHbXn
	bvk3YpXBnI7vZ+BOiwy6xvzhkKRZMVhTv0n4KuwshTy7hen0Mxbk60pejfDWZBUad1TBk2hT1zr
	yYnQiOnpUXMJ5eYnJroTD2hlvyoTwnqAcEShzBLVFIQ1kFtT0jtMhN8aionT75doi7z/Wjk8CLU
	7TSEiEET8cV9aUI
X-Received: by 2002:a05:600c:3584:b0:49c:fc6e:a3d9 with SMTP id 5b1f17b1804b1-49fc584fa71mr183381625e9.24.1789981664647;
        Mon, 21 Sep 2026 02:07:44 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm587218725e9.4.2026.09.21.02.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:07:44 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v7 2/3] dt-bindings: arm: altera: add Draeger M48 dual-cpu board
Date: Mon, 21 Sep 2026 12:07:32 +0300
Message-ID: <20260921090735.3174292-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921090735.3174292-1-petko.manolov@konsulko.com>
References: <20260921090735.3174292-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..e1e4bba248ad 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,m48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
-- 
2.47.3

