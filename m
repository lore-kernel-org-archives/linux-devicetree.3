Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C4D3D647F
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 22:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789078340; cv=none; b=H9Hh5ZAHKSmTNMisTOw1c/zBXCx+Bc0rrBrInf+Jja7eU6CluFI6N22DOPWtqshiMHrYfxv31vuwIbItJ5N2ODq9BzWGy1DSVaOn3CB6UYhynzyWKFA5smJMJUCRLjlosp7ZtdgA52elUb5NdFTx2m4TVFeNaxlatL0GytJ7OwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789078340; c=relaxed/simple;
	bh=7eZ6MGYrn7UuTOMdMokn5OY5P6XozBWE80r9RYz8pa0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mpHZZcbH4bhYfqrzsUUYEj834q4T0zyu6nDz7oUI0EwWrRhP5xk2cF5X5ofn5UFaN34LhJBTqueKejnxu08FZ+KyT2+f61BaK3QZWDJHIiy1G0xZfu988sfqaQnmm33U8g92+bcGqIBdkgPDGlKl+DCJE4UJFhnUflJKC0VNrxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qgy/Yiyj; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qgy/Yiyj"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-86b51649c7eso13908b3a.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789078336; x=1789683136; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rIxoez68u6cYjUY8xm3+9MUMr1Da3TBEKdq2C8N2mec=;
        b=qgy/YiyjHbP7NT9NwyzQYaXOgwKg07ngmehhevd/YTY7OIrMZqWsdRnRuOlisuqk4D
         26MAi7C4V7qNia53Y+e9zzzCTXawzazS3zfPPoT1EieIWwxt7NZjPw8/F8UdlAZsKfw2
         UhjhK4Sf7nc/UKZhUFU5bvz+DrFsrq5kZyHqh8r8N4S1pkhR7X22WNZ2tLZuKs7ZU1Cx
         AqqL3i0g9SgM1TPHC8dfnql4Vt8cRYNVutJzAozEys2qDV13lzuo2zT4D46q15V6YBCE
         UKeA5gH8zQUcB0m6rLPdN0APchAvjj43zgxDYrLTvjaCmOTNscRXUw7Pnav+ZXEA1230
         vpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789078336; x=1789683136;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rIxoez68u6cYjUY8xm3+9MUMr1Da3TBEKdq2C8N2mec=;
        b=VcnaYBdzn3UvCf0AToUezWLsLKiQjHMRHlxNJYb2PuW14nRIiggdtDRK/lRgzlzLS9
         6ZpFdjZR1/HxSrqTtB2Fz/EU+BhfvhFnH67MtXPMIYqm1XAREG3M0e8YoQd22x+MfKpM
         Kw148hciIkKgh7rmgZUmnJzhfdZoV6buqO9fo00b/d6spB3ZP1Yl6JuqgJacI0YtAeBQ
         5oFtRcszTTngPUUbZFLf/7Ard7M2x5bVcHeBn+mGArNcYGg9XlqKx8/pkiGBVeWs7kpi
         PLey7CNfIdkVpRJbE5xYSirCSzjt41PTpazTA2OAXj/vY0KEuWP3W5iRn+ixl0tNthPZ
         A1cA==
X-Forwarded-Encrypted: i=1; AKwUvBzR6Xq/pM6FkYbtZsOX5XOvUORtynb8PvRpNkW6GZTj6a7C8mQ7MLOU49eg49KjvP/F+pmKBeYvfAlE@vger.kernel.org
X-Gm-Message-State: AFuF++kGLOsrNOnSeSz3GZ0CI6BMzcvcRXktUsNIZUX/ZkwAXrWBouxT
	fHGeQgSX2z8G5yHMZ0QXl6RxKbNXKwLmSkkpoKXwaaqQZqOW+KqlDkYl
X-Gm-Gg: AYBFou1s+8FYdFo3qQPR0B7jVlCFC1S0uG4G/GNJb7m0Muq4gjfy8LQUwkPoGmDvoPV
	21abA7F7f34Es0Hf6oaNACEaRxsaE7GyuBtvMCE794aosYlrKfw0YA7DBHdm2j5/ONzd1MXUFlM
	TTF+93Owcay/iWeVQeljwqL/azgVf+9VKRtM0oz+SU0aP6aa8sCrg45zNPiEfZzjh433vVUUMpA
	iPpd9+6qlgC7SDFDXPTzJ6evlgEIu/oysZoF7b3OYT5ahSyVRxepmE+eTbpIUyt9oo4dsWeIqU+
	1sKVFCWMYpDrsGoUsWhfT/fZA+kmD9iLZN77ROMmcII8CMLsfHCa6CAvoSyZPsh3h9VTZHdRRgE
	Q6qfjy7QfCZV50oondl7euMPSYA1Y3bxLkE1uHrYRxu6ng5k/deWpHcAmVatWdiYFnImjBOEhnx
	tZ9b9frkCqNwV09ttah7tAwMcurCN8A7+YQ6+mxLsRdzL4STeehHwHBPc+HBtrF2BEGDqbygIlf
	WvabcBB9CT5
X-Received: by 2002:a05:6a00:4708:b0:862:ff57:7672 with SMTP id d2e1a72fcca58-86b3160fde2mr616320b3a.2.1789078336410;
        Thu, 10 Sep 2026 15:12:16 -0700 (PDT)
Received: from [172.29.212.252] ([2409:40c2:5426:e355:af9c:7683:e7ab:273b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b291bf622sm171875b3a.27.2026.09.10.15.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 15:12:15 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH 0/2] ARM: dts: ti: Clean up OMAP crypto bindings and dt
Date: Fri, 11 Sep 2026 03:41:56 +0530
Message-Id: <20260911-ti-dra7-omap-sham-fix-v1-0-c430f01b4e13@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bkGNsvpKdNhqqz2UohGB9Pek4
 wzMJIgchCP0RYLAt0RxZwZdFjDvdG6MsmQGo0yjOq3xElwCWXQHeYw7HbjKg1Xbkmpsbc1UQW5
 94Kz/7zC+7weBa3bZZwAAAA==
X-Change-ID: 20260911-ti-dra7-omap-sham-fix-388a067572b3
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789078323; l=844;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=7eZ6MGYrn7UuTOMdMokn5OY5P6XozBWE80r9RYz8pa0=;
 b=0GW3lQ5bVI6HMiNuEB6pRZEm6cBmM2Hx90bycEmsXp0jnGevSiA357/A7PPohTL4EXCeHrTfM
 LePfyEqWG9tDQTNk09aVTB7wgKgUA19zbRwzZJ8NvDgs9oMbdpdlepm
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Patch 1 removes redundant "clocks" and "clock-names" properties from the
DRA7 crypto dt nodes.

Patch 2 updates the ti,omap-sham YAML binding to add the missing
"ti,omap3-sham" compatible, deprecates "ti,hwmods" and removes it from
the required properties list.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Bhargav Joshi (2):
      ARM: dts: ti: omap: dra7: Remove clocks from crypto nodes
      dt-bindings: crypto: ti,omap-sham: Add OMAP3 compatible and deprecate ti,hwmods

 Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml | 3 ++-
 arch/arm/boot/dts/ti/omap/dra7.dtsi                        | 8 --------
 2 files changed, 2 insertions(+), 9 deletions(-)
---
base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
change-id: 20260911-ti-dra7-omap-sham-fix-388a067572b3

Best regards,
-- 
Bhargav

