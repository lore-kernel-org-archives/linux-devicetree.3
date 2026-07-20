Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F473C07A
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532148; cv=none; b=or7zvF+YkkXdcMoKNnc8RNtbXkN6f7qgfACzCdTiixmMU6KHfsVpLqreX7COM6N4MDp6MbCdwGWyGgIepFO3fHskxR1Lz0HzvUDLUNRDWNkhLGNf3Qiti2cSeDYsQlYsYlKXd1XkiwDyLJxwbZ6HwSkKVs4Ezp28deL1WC2nSWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532148; c=relaxed/simple;
	bh=1XyajoagXXF1cyqoxgWIfkPGgjkmx65YQW1n9q1RyH0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=M0Wkg/8Tzf6yIaOaFIOfcBPCx7nRjOCeR4tVk1Z4LiE8otQwbFPHrCXNzK8YF1vNN2YS0uTk9E6jRXR5n8OCh0H3omUpwL3PBjhNMvvGHgqFlRFjqL/DI73S0uVZzYgO/jomDqBckg2eUbOLfVNkUM8+1JEKiObXchQ/AdYggCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dR+q8rnQ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dR+q8rnQ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e88b60121so154152a91.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532143; x=1785136943; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nEpkUtKIjl+LLb7gWLja03h8AP/aK+y8njduXSgGt0Y=;
        b=dR+q8rnQ2wUaMyM9z74MlJ924DU/BPNhe9o+uJ8HCz/vdcAQYoAqup3+SdSsnT96hd
         NjZ1FfVK3fl8vYan3kdF3pPZzMK3fh5UukufjG5PDMeQihKtGBRbVyExfBhast/e1Q0V
         qqYaDfOpv78nq2yqc1o/D9gpGqwOYtVehLQaYtiAvw+hKAOxV+XE0N9V4/utWzfbx7Mm
         dEuYekN10AzNbsysTpMYtkswhNuDKQMfLV+DMS/1959gjAaXhUcgYjaZP1oqhOcGosZd
         jycsnPEcdm/xYBbue82hIpXYVR/zJUyhe+7A2ecEoHYfEkxiW2TqOZwJ/UtGksoMabRt
         JS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532143; x=1785136943;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nEpkUtKIjl+LLb7gWLja03h8AP/aK+y8njduXSgGt0Y=;
        b=lvx8D2qsXcWrdOiLH4UOj55rR67Y9lyFgmKh688YL5+bs88Jeyg6/O6uv02cYtJKyj
         PzAwX060lt34FUlwGwNQs9c8b99Dxv9ry79RfGEuXPFEcZc2fhfjcAnuNpGanrUHd9j4
         y/5UMMZfU4rbx6CVuK3By5gFaCuwleMohA8hjPu8lkEcZolTSXY9Yala1IcVcNiJ5mMD
         ESfs40IfT1/W6lkk92TRaHyrqbmiBzDA3Lf08n3G+nnVylt/dODwCTKSlf4EcR+U5CEu
         FBpHLIe0KQgdbtTdbinE8fybFJzeJ86TWV3KWp50cMBE+xloeCPrXtsJPjgTlUup1NmO
         U2Bg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8xS670e6K9e5X9HO3BVmot/QQsLiWN2EDc+ihLDsUW+QWhF4Me+3uXUeF6rCfua6LZIRgUJJmLEdG@vger.kernel.org
X-Gm-Message-State: AOJu0YwMoLQWc5G673tEt86QsrId4dChTqv9/+b+bdRwIyqeEJN/FI9Y
	gmtQRN+jSbbU21SvxafbWjYVITGEv+m7Rmhp79UPIGR8Lr7SIyT9f56T
X-Gm-Gg: AfdE7cmD52j/CpCltjxCyRO6tL7BSDFxBK4pUFdNY0aPEZcHkkkjcfi39aV6cC+90nn
	gzSjlyZcwDN2mbk8UDI89usb409jAj+ft8/wGJougjI3jvcKlj+wZmENRxhyi5mt/UyNWli/qEm
	s5GOO1ZbiaZpQCUj+/wrD11X1i9cQJ9x9VPBe91D3g+a3l/7Ng4PRfIh0xiltyphI7ZuNYW3FO4
	VSLs9/f/s/tWN+JgolSTEbvU72gBw9SHsZNOACI5AEOw4qvkt39AJS2z/G7VvRDeA4sSTCyuAxG
	gyEqKtSLKxwYkFrRa/sc1VqFGjJNdBKX9/rpznqfjsb8WVZCUa3DgaC+g9jvYoKLnsXrttjcXbf
	qBOMoToBNV4ejmsJgXxlprRCAEH06h1k1jkfOBgpNGiLiGEbpB1szB4sXZ0qs6y5pyllH/7acxj
	YcuvRpBA6XjW46lQWRGh3VoGCG5iKh
X-Received: by 2002:a17:90b:2692:b0:38e:79f:76ad with SMTP id 98e67ed59e1d1-38e4b52efd9mr13633934a91.23.1784532143064;
        Mon, 20 Jul 2026 00:22:23 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 13/22] RISC-V: perf: Add a mechanism to defined
 legacy event encoding
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
In-Reply-To: <20260701-counter_delegation-v8-13-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-13-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211939.543975.5882607179348590229.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=570;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=1XyajoagXXF1cyqoxgWIfkPGgjkmx65YQW1n9q1RyH0=;
 b=/MLFbEGJ3IvpPk1FcJeLIXZiS0wo7JcDujhTqTtOlA+FU5IZmLeIwq10e5fvUIQgKvN3oOFa1
 ueKKBNO9KuQC2Cd5dsoxEo+onzv+Zm5J6b8itUxDO/M/Am3bOLROYHJ
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

On Wed, 01 Jul 2026 01:47:01 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> RISC-V ISA doesn't define any standard event encodings or specify
> any event to counter mapping. Thus, event encoding information
> and corresponding counter mapping fot those events needs to be
> provided in the driver for each vendor.
> 
> Add a framework to support that. The individual platform events
> will be added later.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie

