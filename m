Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B1F3D0BFB
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928552; cv=none; b=KDcSQ6wrTUOyf5lWFvD/u0vqiuVep1txrrM+TLAAjdnUmtlUfDQmCi8CSzrXD2S0EX1R9UgJNEiezPa9Xg+DiqqEMOjwd90oBlMFbBlJtfaszbtFAUODU/Sfz75hGWi24DTzDhMLnlqSsSeyTgEhuuxWnfkfpOWexufLWEZlwNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928552; c=relaxed/simple;
	bh=OG57HJ/X8FsDNKo9Qs/33vDw2WW45F3gfVYNcHLuzuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hK8RZjAgkFJdS/B0B2nQSCuuKalmBTNVB5IScFldWHzhbUo1GHYsYQIL/HtN5EfXiApU3T9MkRzgkBvYCVK3jeIVgMHnAf7/eM/BnnO4eqpV1UTrn8NluQrcPc78IWCKWTucplcoEyPVuZZsPVNaMiaWgHauS27HQCVm2LwXOMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=cgKZZDHu; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="cgKZZDHu"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-68cc6c7df99so6281858a12.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928550; x=1781533350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOAhsbik0AVMh4szXNhMifsdGs/22DvtJLvQBea9fqI=;
        b=cgKZZDHu7UYoaAQjmHP66z541c9fpk2VL3pjc7IyUFl5XHRk1VfIaYAlL9KDqvR+s9
         JSZG8bKtNAbmlEKWFkcPMRXv5fqaDAKw208J6BpW6Fkh7S/0azYnLz64tYh1qV2wB3nO
         rQNkF8XZhwLvrjas4yzNp1EG3B91lds+CKULg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928550; x=1781533350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dOAhsbik0AVMh4szXNhMifsdGs/22DvtJLvQBea9fqI=;
        b=BKJSpLbNAOHclxiptk3Wq3UMOo/N3SMMl3v0HeigKGNYNUtY5WAcYpSczFml84V0j2
         DBMhoh4P3CwdfznfpfPvoIYGTNqoNkaedXFnNlujrDnNvBmBLNppTJZJlye9QyFfrTUT
         INXzTgXg7fg856EDsCliKnQE2/GtUajNkB9vkVVbWTUh7mpDw6i/t79IQmQV+LunptC/
         3xSdlhksuErTUw/RbYkAjGKX4tSjlM0nhpQSoRdfGFtpxkxCQRj8yQEJJ5gsLbnrPW4/
         hBoyGfeUfbr+WZbG6bnALYXPsUdk81goUs7ZWNc3nOXbDaJ/ZlYr98vGbDjpK/e7Hzlo
         ASMg==
X-Forwarded-Encrypted: i=1; AFNElJ/kCxaVBd2kQz3UKzmOMSJb6a9t119RWtl9zLPAIcu5iFjkfxwdc8JlhOPEB9SoTTC18/6fHNl6DWAA@vger.kernel.org
X-Gm-Message-State: AOJu0YwFDDkh/GGzyHKAE4zGOLeLfslWSq3ndqgFYMrqk9akTUqfxa5c
	1MeX5MyDrF6XjsR1WZF7qdZ4UKArSJgQrHa6zAQFUuujzDy7E1uVlgeZ8TOAEWqlK9kjE63Sybg
	ww8Vh
X-Gm-Gg: Acq92OEx8geCWwzsNlYem88xh8UgPHVrx+d3vGimApgU9FLbrrtv9ORn54IrToZy8d+
	lF02B3jTXg5x6mWfnqtT2S4rnRjo98QPnJMfeWbijdtr+C91RJw0FKCPElYtPGfBie2bZ6JnoT5
	XUDs6bKi4jBoxa+wapNuKVSyxJrM+4lmDbzphBQU5xG7SCH8cCkwFdRi7H34etGHQ9X4nwSnIGA
	aiAhxRf+Me0F2IhEbFTzaRnDt54KyDoTjtzDA9ZewfEBhOP8ebQMf8+QA5QGp1MjKQoNvnsvGuA
	UbJiDKiQ1yebCgZfX+RlUO94OQaKXcFlEAA1d6VzKA0hKyMpWf5cr9OTiODs1N0gIkterxmfJe2
	PHMypPvmCG8Z9uad03bhrbpuO5L3hqqNwhBo2m/YU9Pz4e0GkQFzIPaSmJ5aS/RJWaGh0gEw52T
	Ffb0YYkYUJWQ7PvOrSlDZ2vyK2BXqLIwfglML4ovIJJbJfSycsDANJOR2lWEDMg03DbM/HoIi4t
	4aKXTb+uv4mQLMALwTdFLCuFqUNf4eFu43VbYBZav8P725r5GsyAYbElZE=
X-Received: by 2002:a17:907:6eac:b0:bee:e2a2:bdbf with SMTP id a640c23a62f3a-bf37234cfe1mr764589466b.29.1780928549603;
        Mon, 08 Jun 2026 07:22:29 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 02/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
Date: Mon,  8 Jun 2026 16:20:19 +0200
Message-ID: <20260608142221.952245-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- Added in version 5. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff..0feb8943efae 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -727,6 +727,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 
-- 
2.43.0

