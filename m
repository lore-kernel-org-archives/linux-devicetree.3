Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66F11A9F91
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532135; cv=none; b=uTi7+zetq1xYSQ0GXylXNVU4yrL8LahZ3laODZFhgDDtUqXPK3dsAqp5FPnn8TzDxUlnNxAs7n2tjRhPpMcmXXA9f6yYFpRLj3jDW3ZNLayLF21oko7BBlVS41yvKBfXcybHIe4ilG/2VNFu+DRaDTc7e/GfwOjNqG2CpZW0gL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532135; c=relaxed/simple;
	bh=DaF1WA85q36ajkUp2wWjzs8vEjfcfgQEKe7dAK+cruo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=AJ7h4ZGm8HftiyEmN3sktrm1m6e23OBaZwk+VIQAHtcYhKbmTdzsXKUWmq7R2riA4V0y2l50zHwYi6ehdzr29CGKW7oZ21AMq9Zqdz7h7EaLe+0CbxuM6RFiP6EY6iunY/OlNJvJV+x38/eQ/hAnsCJ397Woa9geKZ6FyVdspWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8ya+zOI; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8ya+zOI"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e347638adso4853689a91.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532130; x=1785136930; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T1rQiWC4b1Qi8oqfTxdLB8xh9GtA5nvI8VX0/xhDq6k=;
        b=c8ya+zOIEKjFGbDfM7wiYgIpuMb5c0Ou9CrW5QZKkr56wvyRScRxoKFke/+62MAtNS
         R5gxQJ4bvwOhwHaexwAv91lu8SAiEhkEaa/tg8yOfKYMpjrN2V1ahgQHkkXzHBshluxv
         206HCpDUU4lJRvTvavnFlbMRtaX0nbSUD/7pKgFMt/0uk+Gr9KLAl9sltcuUUq9Nj5Xg
         b4LKmWPnSrpmh9+ncvbCeetVbwqMN62S0gZqYvVCTo3T7HY/tb9+G/JoReTBGNGB58tV
         lzFVqQ/2TVClLtYCqpcEUSSqVq3FaBBJMtPGmtjwtysHVG7Q0TosEbfv8lfk15xceUgJ
         v2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532130; x=1785136930;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1rQiWC4b1Qi8oqfTxdLB8xh9GtA5nvI8VX0/xhDq6k=;
        b=GLdZvSiaUsuZPHm4rzZzm8ozzckQNa0jv1W4wHopsHACficNPOIKV4qeT2uIM4juny
         yEKKCaKa6t630xSMw4CfjS0lgdnOugDH7zCVP9BFU4lhhF5PfvAzJzPyrpqNAChkzhmT
         UgimiZfhnLatRkho01Z1ou+bLgji7c27utQx/krXs808ALZ7vUPougFrrLXBiOpzkqE9
         BGS+1iMTg3GPhpUlIEOGXBK+jYUdBbX1x6uKZpfVL0f8c32dolTu6QJvx5LCYi5mr2LT
         bwsGwFcwLlc+7zkOKyBhgSTCpZAtX6FKY8NlHh9yrJ7fwFj12rKjd7WBmlG4Aeo10NPr
         ZGbA==
X-Forwarded-Encrypted: i=1; AHgh+Ro6BFWdUKuxAOdP5GD2ZH8RhT3b1rifSMWbx2ltBTwvvmStJM+rLUAHMHIFVs6CzuceCGI8vBi70mf4@vger.kernel.org
X-Gm-Message-State: AOJu0YwPxb2qyD3NGBMwk2GfS09B6nb+Z0YuSDWpwBcTgD0PBlSTkmxV
	VBd4Iz+P6sJ8LL7JMDIp9CeHh6wDaZNK4t5Q49nDaqzxJcvA5UUXHM50
X-Gm-Gg: AfdE7ckA+pAOBzpftwl0AZCS99aCz0qqQrNxHRa0fZyobULG35p11JFAWvFwYjzoPZi
	NP9ETZ8zTql1oObpBIxbInFa1EfM7el818hNwtmNOM0Thw3cTrc02ITKhRyV8uS6ZT8E9R0D/5K
	GcEfoeeDfSK45twTMxQin7Xth/juQS0e6OPDlSFCWMKf4lp+eIVqZDqoy8nwyhTKJ4Tr/Pwpgzj
	+YFXv7Hi2yrsLAPGU1oAQb0TFhMUHqXexMwCjGiR3swOfY2t7w4zNORTFNOd4nY4o1Y4RNzLRn5
	Dxh5XCLg3OInFpCaPcQA3XMZrBf/J3b5XAPegTLHitX6KZvf8APE3j/JqL+QIKofiGhF+ZeLq4l
	g6VIO0cziKqhJONwcKDZ+lVwPBZUIeyuZ/aRUN/J1A4srjqAI5wP39bbhKATNAUsfee/AegGYKt
	tsxmaVYtUVldEe5S3xsbuSwOoKHCgQmgnHTjIJX7g=
X-Received: by 2002:a17:90b:2691:b0:387:df8f:1408 with SMTP id 98e67ed59e1d1-38e4b5ad2a9mr14741701a91.41.1784532130478;
        Mon, 20 Jul 2026 00:22:10 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 03/22] RISC-V: Add Sxcsrind ISA extension definition
 and parsing
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
In-Reply-To: <20260701-counter_delegation-v8-3-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-3-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211934.543975.9634665501136926362.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=387;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=DaF1WA85q36ajkUp2wWjzs8vEjfcfgQEKe7dAK+cruo=;
 b=RXEmXx3bUlqTR60e37EoLeCgujoBbcJb1A9/syNgqmenEp+jMQ5zhL3lYU2n1ecg3AztUmOp0
 223x7CuCQiDBG4mckQKZidh3U7VcQ7UofEjiHekyrNNXCwnACr4Cm4W
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

On Wed, 01 Jul 2026 01:46:51 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> The S[m|s]csrind extension extends the indirect CSR access mechanism
> defined in Smaia/Ssaia extensions.
> 
> This patch just enables the definition and parsing.

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie

