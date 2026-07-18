Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689B33D524D
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784385979; cv=none; b=JzAJUKLCHW2qVQDe+rAKnC4v7mKkF8PYuWL8ca4MyoktKZfPbFSOyjTuUq3Fm+3nEzI44i1guEXXs8yRjitrihtFxoVv60UaeQEh/mhUjQhSCA3APrTFad9XQsqgskF6ZAFQcEvdc9/hjV6CLkhZCi+Ld0juC2M96m2IurrSaog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784385979; c=relaxed/simple;
	bh=VapJVpk7Upuq/4IsumhznTZhjSgCFeW/dRXr+/nOOSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IGsHmwqyUi6CrKpsrkSMSAbP/Sne1YQZ5V5cRvNbDreYKXiWKUSC/4IHrOhOu+InPhA7EoHjfaiyXG7BExn4BIJ4TKAhpzPU4aveUMmsSuNQgHU/yd5bfOYMMSlXZtQNA10uCnOyK7Qcs7uQKvzXr9ddXi4XorHkg4f1ACzQM5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFqISbMx; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFqISbMx"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e5d6f35c1so744264485a.0
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 07:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784385975; x=1784990775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VapJVpk7Upuq/4IsumhznTZhjSgCFeW/dRXr+/nOOSk=;
        b=aFqISbMxMeI3PBTbzZ/BF/w0TUAlJCIGydRF2mEipa0728ypSkZIUtFrBK26dyvcHw
         q4fa2swkTV9CBHsomPBL4/l5dHXU0XwKV0BMq1XlKinMCp+a2BRVWcT2cw0IQ3udqFDI
         nSU/R18gbHvDC49Xw2G8A7xPhuSwfsA+OdMmDQfzK+Uj66WZFy2vGFZI/bxpECWPxCbe
         8ESHBY7c83ZmfUw+Q/rh8odVQV/pTKL4uj/ZBVr7jYvMElFotc1x2dFWtyNYWA6GMkZW
         BT3++UWtp29+i6MA3jIhoEwH/2KwzjwJyyLhFRRA6sB8r3CI5VjJ0X1kesecxnqnjHA6
         RHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784385975; x=1784990775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VapJVpk7Upuq/4IsumhznTZhjSgCFeW/dRXr+/nOOSk=;
        b=KsLco4uWHo2Afd+F+rBFkiDmWrnGEiP8t+H3BWWNGgixcdI+dzJDvB6uJ2bfCImJxm
         QMTSuAUV+dFpENRCsw5xRUl8rYrn6CunKsl8HxUwH5zREjhw05leoIQ+GiZ8S11vXrE3
         rbG2+87ypiM/K9nEACvOttCM4iI1obyoMIlZQ6lBe5b+vZm00x9qKVknDeRIVcRRf/WO
         NU4okBJsoSH5rjvCZumle9ZlgBwHqEYLP4EzhzvzTd926gjGJ1or7qIPEHroZ/8TdrUa
         RJWbYtyPHrONUCktRz1rILHZzMWT3fkIcx+bqk+A4FxMq6GYzYrAxNsOTlpNdfosRr79
         9dkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzXvXxeGJqrnzRyskMj9ktqXHg/zcqOI/BAnU8kPeP92FKSsHOQBKADr0lNjh2BxwhvYa10oZzz6rI@vger.kernel.org
X-Gm-Message-State: AOJu0YyQgwjDbl0kZ2ZbCq9wq4aj7LuKcOisgMPuLEtVujT5M0rkUbD2
	5m/C4uIBcPc14UD+9qXcYYossVRn7UjwFV706VCtHSKMhSZoIt5ODEoR
X-Gm-Gg: AfdE7ckSI4EAG/lK5tbkHsy8d80yWWyVPykHoe5SfK7+G/dd9wHzrUScdXBt3g5ckIf
	NBtD1JY085ftYpU0e8El1b6DEUlr4CEORxafruJHqo3BQZlBWUhuAPuiLqtK5KWdaMmoX2Hr2Po
	+bVGMgJkYdPIMaHSfC2J9Zg6OcpFYVwMga0bFgaIWi21fuqSRJhE2DgpRUAFQ/r9twHgzdoCYi/
	OLsNT03HPUk4i+8UWD347KuISyB8KWHYxwTI3yMAG7L++D2uaHNlaPTFPW/npjebpgRpauTtWJq
	vKRj5Ysz4AKlOLtJ1bOg9e6V8u2LeaWnssIlp3A8U9tDUzF6m1h66rU793DLWLXdAW67zGkbMTp
	LDL8lPT925ZuG57zAAvnR7exbmHktweqbuCrTdt1AJ3PjztCe4/EfRFzYuRp0UqRwTvyrs3QViw
	OvX6Yn8mlGdxOAyNdYkXnMddkORlwlyveMRHu8+x5LlhQoeVrSf99s5Q==
X-Received: by 2002:a05:620a:400a:b0:92e:e252:bb43 with SMTP id af79cd13be357-930b4381a6dmr700628485a.77.1784385975182;
        Sat, 18 Jul 2026 07:46:15 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545ec44sm418682185a.34.2026.07.18.07.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 07:46:14 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Sat, 18 Jul 2026 10:46:11 -0400
Message-ID: <20260718144611.1523567-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711-a733-clk-v2-3-974d188cbe0c@pigmoral.tech>
References: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech> <20260711-a733-clk-v2-3-974d188cbe0c@pigmoral.tech>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

I re-reviewed patch 3 in v2 after Andre pointed out that my RFC reply lacked
a formal tag.

I compared the RFC and v2 PRCM drivers and rechecked v2 against the Allwinner
A733 User Manual V0.92, chapter 4.2.5. I checked all 11 programmable clock
definitions (register offsets and divider/mux/gate fields), all 18 bus-gate
definitions, and all 13 reset-map entries. They match the manual.

The RFC-to-v2 changes do not invalidate that check: the four R timer clocks
move from the MP helper with no M field to the P-only helper while keeping
their offsets and P/mux/gate fields unchanged, and the R PWM identifiers are
renamed while keeping their offset/mux/gate fields unchanged. I also checked
the gate-only BGRs for R-TWD, R-PPU, R-TZMA, and R-CPU-BIST; the manual defines
gate bit 0 but no reset bit for those registers, matching v2.

Reviewed-by: Enzo Adriano <enzo.adriano.code@gmail.com>

This analysis was done with AI assistance and each finding was checked against
the cited sources.

Thanks,
Enzo
