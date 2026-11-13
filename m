Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557800;
	b=GTMtvsK6DtV8kwaNgMpweaBDkBYpV2/MB1aZnL72YsdkKssxfokHgQjTuemGSqs5TXcu
	 bOievygFd0s9i5ou1CayUUnXSMuPQ2zBuoCxcGbuVgkZPpQ+z16JSkRuilC5BKgjwGZoi
	 7PsI8mKUTUlVJ735eKeOTpZEhx54kpiiVTrNXV6VjO1juSorvFMUKOl0ITkuQ1oGo8pFG
	 yDW6lxxPVE98mHZV9Kq+DlDdx8Z0RQctYVTI6E88Jr0l8/+lnsbUWuQ1WN1rU9JohU6Th
	 IdEEdg4xcqDQqNL7zqgEjL8PZVYS38RsylNBgdAG49LZW9GYhqQYTUfeKI2mig1lWcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=gW1TFXrxe4ATUFniHdL2t1wb8zLbd3jJ3aJxWRfHEww=;
	b=pZjQ2O4QOmcVROgRXfE0dGWhVE1Egy27+YCPC6dvNRUy2DLsTM7mSnSgXVkCfU6Z6YLf
	 HYH2tXLiFN65gmVki83tfIC1YN7+2yPFDepqCVnz0QO6VhwNPESxYAc94Ma2hQVwoNMqm
	 ZskttIYxEKF+m6jNg7xK2PQPD592TonktQHgQXthBrXrxNsKr327SWHuIO1UHnJRCAVBQ
	 6w38ftvQ4t5PXipdCusp7tyOphAxS5MS7p3Le9b0iEqHqzf6Q0vUbNEMdLrcLK/brNNFK
	 II0syQYFZ3wqms8j8D9AK3/qRIJRc1EcbjpNaUBe734Hh896/jocuqERDtFIsSseJHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=OZ0TtoaH;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CBC606A339
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30CBC606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=OZ0TtoaH
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c49c32650adso115937466b.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794557798; x=1795162598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gW1TFXrxe4ATUFniHdL2t1wb8zLbd3jJ3aJxWRfHEww=;
        b=OZ0TtoaHRNUCuyN+OfM7Jk1lrmCuCjwTTasUeeUsisIE93qvKbPIny/mIqEc1gBNKa
         tjBiklMLMkNAw6diqZ7UsW089xvDqnIlkgLwio6tCE3z8DlTjDJGhIZ/cU143aO5tAW8
         TlbghxxzGLxLW1js2cmshTxFzzXrLj0zcWHaXhApr+6OWYvYGZexYLpw6AuzIglPmbv+
         TFZEERW6rx65pCsn6OUNVolIE+o3CycNx7qdO2KQWwnr1AC3T52gsff61uYy9IlscfTo
         uUDDJJGbr1iDeegh2e6u2jthx/0HXMiN7vaV8GdRXqGJm3y5caEx8I0/5YCgwnYaZ7H4
         xKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557798; x=1795162598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gW1TFXrxe4ATUFniHdL2t1wb8zLbd3jJ3aJxWRfHEww=;
        b=FRaao2JpWDytUgk2sC+QXzRgB7fKkv7+YujC2eIwpLmrExlqhm1On+ZRm+hd4GiYZT
         /kXGhByyHM57UXdTdnZ61Dlw5vngl4bdeY/3eAWiKRxpoGV0vZMoNPYR/2R/q+td2mKf
         2HR+WbPyPsv4HiAzHIOBjNi8WbHkmeNTd71NbdBR8zQ7ZEHxudlUzlZ/55BmjXVS9Yiz
         rZn4iPiNhfLM6qOrkKejeCMIQZZUfzjTz2yJGpkM540oBrT3BWs4rDOFcsbx33c0/jNY
         nIByf2cye+lapeS8vs4b+O2GMMNexgJmUVTqdXsZ0VAuEol/y1yrVo6/Og2sNeYHCZ4H
         oKqg==
X-Forwarded-Encrypted: i=1; AL+hErEbfdrdVF088+bb70WhyJ2UZDa7RkbnO0XvnGYtv7odnfutsgNXnLmBSl4LUOz345OwJnWNMAFa20vF@vger.kernel.org
X-Gm-Message-State: APuU4Z/x47bHCeaXkM0hFhMFsncEjFFXS7i5sRPjYwLLR19TcohdftaD
	s8GsNJ+YF5193tMLA8nTdoS9uCBEcWGKLskpUH6Q67kiZLAMRnKLeYbm8MJTR4UR0tw=
X-Gm-Gg: AYBFou2CUTg3FRTDR2ActzcuPJI5iO+0hwLF4t2F6z517XxYYrXYtHHZhNPbfzVVev8
	y8rwZWF4CN8cCRbv7iGLtUgV02Iy/epMI7qD5F02V+7Zd2WZpbkHp0C2VGCePteKIw0LH1z3FCk
	dZ+w3wptWP2/tnri9vPIjc//z4i7r5/JsnexD9wncBYENJ7uQJRQKZMXHD4Gj4E0ayn+pAqRKp3
	ehCalHJQ/b3Tc9UqfTpLnbf4PXlfO+bPzqxZ1RA39Pft9sBgGJyn3r3d8QMiwKCcueAsmOiMuMR
	yy5hBQyNM8BPbkOVVhj3u0lEuKgOAuhavwM8tuPFDt7mW2K4R865ZGWNX0OWfwqGxUOYN1Zs4KO
	F46otAflErnK+YPuWEs1GrxOsH9yolRUfJ6fBO+NaxJ+6WlcwG9cHqFcUUDcTTOmATVchtgTFw8
	VhF0Vl5qnP0ZNCDrujPqlCx315lOj+zhskcXyJMFykNZJ9paEGuHexCiJoCL5CipcA0PI2hJVQn
	81Ixb/dZgiwbBd7vGDcMYnCb01ABA0GPyvBz/O8x9X/gN8PH9qf8fuPkNOwHAtM6/3nNHdAXUUP
	p2XwWhI22Wh7HpUQYAC/jFL3pvANzvVRx85kmpEiJ1Ly8pg1XfUfFDezSKJU8bcNZRpKawzJBFt
	h3P9YIkc=
X-Received: by 2002:a17:907:6d06:b0:c41:26b8:c49c with SMTP id a640c23a62f3a-c50963dc6aemr131877966b.10.1794557798644;
        Fri, 13 Nov 2026 00:16:38 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4214fsm65243866b.35.2026.11.13.00.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:16:38 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 09:16:35 +0100
Subject: [PATCH 1/4] arm64: defconfig: Enable Qualcomm LCDB regulator
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
Message-Id: <20261113-lcdb-enablement-v1-1-1dc40b49ed82@fairphone.com>
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
In-Reply-To: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Val Packett <val@packett.cool>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794557797; l=687;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Cb0jzf5yf7B35q4+LHh6E0ES6V+yP2TAPYPGLiJwWJY=;
 b=lLzlMM1LJlgxpG9XLQ5KkHczWQw96AMoeuDzzlMaFbyaG/5se576a7+MKM21WHa+mdbYWI9NR
 DNnaD8ufsFdAdbbFAk0sCSK/641WYpPGX+6bVv4C6lJUq8Hs3VquxKu
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the Qualcomm LCDB regulator driver as module, as it's used on
some devices like the Fairphone 3 and Fairphone 4.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 898f4f1d5952..d0869b08a69e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -910,6 +910,7 @@ CONFIG_REGULATOR_SGM3804=y
 CONFIG_REGULATOR_TPS65132=m
 CONFIG_REGULATOR_TPS65219=y
 CONFIG_REGULATOR_VCTRL=m
+CONFIG_REGULATOR_QCOM_LCDB=m
 CONFIG_RC_CORE=m
 CONFIG_RC_DECODERS=y
 CONFIG_RC_DEVICES=y

-- 
2.56.1

