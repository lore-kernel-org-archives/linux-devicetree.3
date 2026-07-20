Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90F33B7B70
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532137; cv=none; b=UskIbV5WU49RMPLu3SKMmWUe3Jan36kpznaugIPe/uCvIARj31D7bo4gzBcAit9uL09O+2aN0I+hC/2uSAlXh+2hdXfLFk+1T3PPnze25wzNxgA1ra1cKQkhcIaGaragpyZRzgL37TfDznWF8Xb+DFA35ItpxMx0663x0NtwLts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532137; c=relaxed/simple;
	bh=WLNuylhDoT/T1nhVqbXxx0oK9SVpgxKx6NkmkPvsdCI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=cryHM89gokaunFQdcFK546YXyIhKik7qEUXQ5dX7fIM5vQr5WGjQpEnv5q9c3/H3omj+JK9KSw4hoXjYtyPskfikIS2iPsOqkSj8nLCCtF4HAh99CDwrH+CkUkHdwe5e4yfKebEXR6E3cpsOxUEDkCSaykl/2413/5x9rBlPhag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0VTaK3p; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0VTaK3p"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso7410150a91.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532132; x=1785136932; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VOacMlllEAiItNG+TLG1ZIDGtvtY1fzk11Q/F1WHU44=;
        b=M0VTaK3pc953NSA527OcsiY8dPWjJjGBfobxDGht4SucD1iVha9gRX9z6Rv+uvjB7Q
         SVuTd/vINkjIiGpYjYPWpw0TFAVWSGjewgxSumRFnImfFZZMc6R660DHWa79DDhcFaOj
         xGGZBaO/ND6VSgbH1L3tQ5NEVr8AodKeJ63ua1x8UBDQuOVVxJwiWayP/bcJqs2wQhGp
         ku/q7LwMLpPyrFF5KQcwTdh/1Svi893tgsATmC6OGHIto4iFHtjmuL3Ux87/gBdiTqAj
         N2TiyGx/P1b/ojgS4LWV3SINCKMxSETCpGQVO3LRkwjKzYi6QSVvSGHRruomzMuujBhc
         OIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532132; x=1785136932;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOacMlllEAiItNG+TLG1ZIDGtvtY1fzk11Q/F1WHU44=;
        b=LNy7tlBVfH0+3HTo92rUbsQJMwznwRt/a8WUEcKhzhs3ifs6B1RrasRgsQZXcCmbrc
         bz+dKDMMm4t6Mnhtr+Cv2X8x+/gsS+f0VymKFqBJYWhmBb3aeB6pI6ZZ52Vx1v3AYY2Y
         0CTyQuy1D4khxUxvjLv0ttOPXD5hJQU011dYlrjLG6+LCPWFmsHYtg7qYV+TJl4FqaSw
         5gNBUQ6VTFzIlGoJ5UGTb9UR3/4rFDFj8+6Cph00vE6jS62eWuKTibzofSMo0emT3a3w
         TuXf/ZHhsx3qXADFkR3UHQPkJRCl6qai95sUMUwEdMsc3RuA7YA9OM0BC4cDsIHfP6F6
         5xFg==
X-Forwarded-Encrypted: i=1; AHgh+RpJPsADEnGgbAys1erv+EgHISY0mO9gCe1qSp/rwECu7x8MId+r76FZkMia8Ax8vx6ZwXDdVnEn3E/Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz701iOYhr1JeWxoxu3M8+GKmEv4OMLnXh9LMLJu8J1UJGrXiAn
	KbZVSvuy8qrQSyXfl63Gn3nz5ieoJWBhHAmDbOeYPN38Qj9BC3i1MgCJ
X-Gm-Gg: AfdE7ckiaoNr57vvApO491YBe69UONtYrfLMe/76iTj1vtrHkzv96zSNVJolY/WEI/u
	kQnMbA5dCPOEm8grpHN3JcvFknc4k7bgy/aqVmghJH2Yun8oJhbdjBk0FPetGf0k7TSkXP59OY4
	KZgptpXjFuei9U31+xX/godlWIK4LoRfgXJMrKHsrECSxbHzl5zo2SHXefKE/M619hp6dMEU0z0
	X5UzDOzV/1yb9ylkb2ST+dmjZIxgVjdZhFZ3Eds2r1fUvL5W5ZHpedbZf0QZo6c969bLNrsEoEx
	0HvzILgEymgzqujqXJFtPtIOSNosj68swuLjefg9V7pmobI0c+dYUQCpBCvldoZ+vz1ovAntWd3
	vyBijX91jypDHXquLaSDA6Lh70ceV5S43Eu/UKV6zJ00+LzIz51JFBwfz3XIR79j8q8ze23O1t9
	6ocDE1ag0apKfU+QJ5xQjR7Pp6KpiO
X-Received: by 2002:a17:90b:2f0c:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-38e4b431074mr14088269a91.8.1784532132492;
        Mon, 20 Jul 2026 00:22:12 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 05/22] RISC-V: Define indirect CSR access helpers
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
In-Reply-To: <20260701-counter_delegation-v8-5-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-5-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211935.543975.13003104709969920617.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=337;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=WLNuylhDoT/T1nhVqbXxx0oK9SVpgxKx6NkmkPvsdCI=;
 b=2xcWmRRAqDjGQXqwGbJnB+31tbqeAGCjzKohhI1vIvF8YponJ3EW8uJz4jNw+WI3VgGyavSGl
 gtdiuG9MO6vCHj8LYZ52PlJfVOl0LaepzbRROI9Qgxlnq4ieSx45ld+
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

On Wed, 01 Jul 2026 01:46:53 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> The indirect CSR requires multiple instructions to read/write CSR.
> Add a few helper functions for ease of usage.

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie

