Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF311A9F91
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532157; cv=none; b=L806s6mPron/7fQn98yB69uPUAToNHT0V2IQrIlhS1ZuXbA0vVEA/pHVy9/seWcctuYEPMZPNwZIB6I921mrJG//74VARQvm4qcuQBR10rs713yPQ27nWD0jG9Z0NpafkjeSIClhL7jGjIQgDX68aEKt/cVadMJ73tqADoKUymE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532157; c=relaxed/simple;
	bh=vDMk1wbG7BpjO3r0gVy/Hpmtm/NTf4pFWtYcM8bSSl0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=si97jqDAm+B+TlzSr93H7v/OBMdNJUpmL6Lhpmy5EENqKA+094yspq6Kq8CljldeFrwZ8o87c6TfsjhNghrTqNBghK0ZSJuU+/QfJ+avbHSzp7xWEzyfpPsbopHFT5BbtrzyEiAsvYn1t+4KwCiAqteblQP498dRnRpo08PyYgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o5qGY2I1; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o5qGY2I1"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38deea72eebso7682466a91.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532151; x=1785136951; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BreNlZNT5ZTae8ushLrJu7lRuJzqIG3wpbhbbx2mYvM=;
        b=o5qGY2I19m2AGEHvxtvMezd1ggzokInkuupggNTiuaD9mS4QNzL2JP0m4kOebJvFdS
         ckcUr00/Fx9+ZgH9Cm7IORWJbtDR97iyu0hkSEi/1OD5r+E6xAhEsj4UGMEk5E4syUW/
         hPBs0zGik5XFLlMOH9TeNcWEaTXqMRhu1UhPgMlOsJRHfUACvy2x4QKLP+/48hoQ6y0e
         fYbyNlK0+JEp1b2P5a2HFSaScWMACtrI7ewKnJYiaOqd2IP4f1Y6t7p2sFTdA/gpZ8kd
         LcKzjLXVbdEKk8MyDHfk7YxdcChMuRsl+w8oT3JMCzy5fSLhQ5BBSD6AhPFygV6MEFX+
         Le0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532151; x=1785136951;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BreNlZNT5ZTae8ushLrJu7lRuJzqIG3wpbhbbx2mYvM=;
        b=iCMgprsv7CP9k3UJGO9fZHF/a2yxJKQTfAQNm8jAnX1fF8IHdLr0wdWR1F51sTwmGN
         beNbpZraoKRcnMW4v3LL6GgQuGc1w/2lcJNQOIkx4QTHoqlIch1W2tf3fjQkTSGi7yk5
         ZTFi4B6v06W1y776aO5IiRV0I2XDmG3ux3ckJjmryqDLdGPbsA/vB9be4MmuQZKQBo1h
         KCLqVV3/fzULDAFO8PG0QABNFmccZDBODPqmZdpUJOoxMaoa1XAz0S0Pkz28EGz7qv+a
         8NV4K/U2XDuA9Y6tpycm70JGquH+gy38yXOMcvKJKGZk5/Ik+PAZXJtuQqHe+H3h/qgX
         JrKQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcptJbqjYX7Cz9mBq6V1mTXtxiUV3QuYW/7XwSQJrtc5k30YOFHA5SRbveaGefnRF6bxGFZtA3on7J@vger.kernel.org
X-Gm-Message-State: AOJu0YygOxDOwG+9Jh9RY62omsyJtwhLSJ2g9mlnhzqq7vX3wdagEP2l
	H3DdDiKv5S7lFQDgu1cg/BDy4s34bTbMEuH0i5u53o3A7bjJVqazJ1yY
X-Gm-Gg: AfdE7ckO8qDGBis4dIgDJZ6+uCAVbe4ZIXmebsVZOppzRiKmmmurknFvt4RgxVDMc/2
	yKeDIG/KPL7Fe2EWWFfIMqEmIyu7TK2QnUkZCTScKKl0uaSNDG9ZOakKxnasONVRXQGuGnu3msz
	Kn7ZXjemKGF8X1UqPkh3WgKYIxrDhZXa3j5tGqfp0T/wYRm1q4NG+CRlEyDYWYG5CJC4lY+L2tB
	tp2vrc4LBFV58MyAWCP65rm5wefPGRvpHB+ci/Tz0cQP9+4Sd3fI9qWlT1lP16i+2BaVX6mV2On
	Jrfh6QH3wZ9uqeGlHx9fvI9JXmoRskAQWs9THSnjS3ShvAtql6tdlkJPfwpkO+hn8ZDOp/8cMiy
	sb3cN4VC0yFO/V8umvY4J77G9g4CQ2gdwEVF7jWSu3aMvdYghd/ZHd1YbRxa3gahG5T6ZEL2NR1
	FxxMzhIBwgZ2Nc9CJFXWA39Bx07Ga1
X-Received: by 2002:a17:90b:5288:b0:38e:3542:212 with SMTP id 98e67ed59e1d1-38e4b4462f1mr13603782a91.13.1784532151069;
        Mon, 20 Jul 2026 00:22:31 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 18/22] RISC-V: perf: Add Qemu virt machine events
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
In-Reply-To: <20260701-counter_delegation-v8-18-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-18-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211941.543975.9634559400279652785.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=763;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=vDMk1wbG7BpjO3r0gVy/Hpmtm/NTf4pFWtYcM8bSSl0=;
 b=dmChx5rGUuDAMnuQtfGv9m5CW9Vq2JsgbQMCPFYlQwlS3eI3VeyPYIFdDGrGWQEMegLQ9tc8z
 K8oWm1FcKBQCC0SbvGetMGFrcPiKGQMa9ah+iJXURfEGhOJ6+spv4/0
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

On Wed, 01 Jul 2026 01:47:06 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> Qemu virt machine supports a very minimal set of legacy perf events.
> Add them to the vendor table so that users can use them when
> counter delegation is enabled.
> 
> Qemu is identified by its marchid. Older Qemu reports all-zero
> mvendorid/marchid/mimpid, while newer Qemu reports the marchid 0x2a (42)
> allocated to it in the RISC-V ISA manual [1]. Register the events for
> both ids so they are available across Qemu versions.
> 
> [1] https://github.com/riscv/riscv-isa-manual/blob/main/marchid.md

Thanks for doing this.

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie

