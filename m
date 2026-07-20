Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64093B7770
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532133; cv=none; b=GBESWXr+d2HFZahOdA+Cd/fyFX5ePtHhxKZ1tJvvbIx6pXifRJgitKTF1Njk8Pl9w/3HiU6hGdLj5PAi3r3cFUhQh5hqhjhLR5YwgcFITN8h9Cc4t78QSmxk1kExXOrmt96C8fbdWEQWJnQHJzuBZcxGaLxZ6zJdcHclCt7Vu6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532133; c=relaxed/simple;
	bh=xUnX5r+Ia5wVgu4C1yKp3zoGNGvehdD6dHdKzah5/1w=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=O7+d1NNDCoIMv6/8LMXsx4NREH6itl/CxE+6m4L1FvttTnWMRxKTx6Mqx4lshCibaJskxDxyuBm3qCqhotfNlQQVtHnQM8MxtfF2vpVIdEaCcTAhjyRbp35/Gdo8CV080vS391G3ZEI71alBpcrMPt/0r4bSqKYDLvlfZvANb48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhKewdwo; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhKewdwo"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3811f512167so9664932a91.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532128; x=1785136928; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hoe1W98CSBa+YkLX38wWaTngexSk74Jy9AAITrPfnPk=;
        b=JhKewdwoC5xZ24CHuWafigdeDM9ofdxWKyhKbEVrf6jzw9wQ9kFBiuf5YtfbrwkUj2
         jlQCCEEiNDLndI63k/4XF0YD6ttp8z0SYtTZF1dMDhsjffYH3uU/PnGa3xYpal5nMqlx
         IQuPH3YTb+O9ecrwSeeQycP/cJKTiNbGVFU6HJgE1mCL30mNa7eEdWro6Xi1ck7799cW
         vRdbsnSKjaYXdQPpC5/HzvL8ARUnnj869AzNzoaBnn3Yywy1N2J660vzweVWS9zUFkAQ
         vgjTSTr8y4GC5FhMWZMmLGlM76n0P+t1rzmiXNg3Pch8uCMfXCe2DHhMn3Ku7wc+QzLo
         DmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532128; x=1785136928;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoe1W98CSBa+YkLX38wWaTngexSk74Jy9AAITrPfnPk=;
        b=VUaNCTFmzQeHXFjJGR6GNHyqirLdcgIhN4rp7nBee/DSpA+RftrxjECGPi066ZcbmP
         LjQwJNcl9alGR1Nr1V9w3wZdHpPUZ0rbKHGHhrhhFUsbq9B2jo9FCsdaVEbLVOcQG5MR
         DoQcHdwj3RQ0DY2FMxcaAAUgSYXpDbp4GUlBUYtLFx1JFXW1lb3L/FBeleR2MpuiQys0
         wFu6h0RjVmGKx4FZ+fYZQZs6tpVGkQoEX47CwDHxxvWejSFdFNdmb/oPTmhqD/vIx/Xd
         npbbCwiWfLbcDnOshWgPJeiCus16qmypBRGihpM6xZAK1t5EzqKHv/vRQqAL5zKVCis1
         IBmQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/61Jvwb8TLhogssstn/hxxq0TkPUZFQmrPW35SwxXd/k3Y06Xq3PtbPnH8NZ1JqeXQu0/YLVAEcxF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3xVo9NP/2OHI3VVBqJU0ii9F18gEXTKfPwkaRiTsg3BzYr+iV
	aR6PpmL/h+0Mue4r56Suov3rPaVeEU63RjB1M85yjaJCshWBdvCwPLNY
X-Gm-Gg: AfdE7cmWiiLqegkov87H6N2agt6y8oeKKb0zRK7jVHuY5me7vBADvZwJyEskF1hYJJk
	sG3t0REB3iiqxcKDokPMxRenn5BcTcZYj5EqfbvZub4JwgkMNw08ARLGU++pC/r7Bw0HGJvyE07
	7G8do1tjIIE0BJVHYsVCc2FITJnSXk+Lregw4sFlFDf7ZMqAd4up5iLiaodFhV7MzP6i/ijcpBJ
	hwDBDXdx4exZzutNvGiyhYA9D1DN+eHeZy5EBvwnHVb/jjvy44WRZju/ysClYYtMZqgCsCOpYxQ
	jWgofdRyyLOzk0NoGpAXc7ZwUHAKQNq/Rn9jp/8Tgyp9TXDtqBnD5b8VJQ1rZXXBqB2xo4IrRDm
	8Ggvv7GIAlahT5++u1MLt8VkMrWRtR74J/xERqnA9N/y9qePg/kLCE4elB/G7njbcz/eEEETAFs
	VuCe+iWAvnYKj03Rsd0wixnsbI7AGi
X-Received: by 2002:a17:90b:2dc1:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-38e4b3e11a5mr12667239a91.7.1784532128413;
        Mon, 20 Jul 2026 00:22:08 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 02/22] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
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
In-Reply-To: <20260701-counter_delegation-v8-2-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-2-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211933.543975.15394351403928013443.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=499;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=xUnX5r+Ia5wVgu4C1yKp3zoGNGvehdD6dHdKzah5/1w=;
 b=gaVMb42HHyFvagjdkvfaJQqBc2LDpVy6wSQthTX+5Ypqsv04XzByg2JJZ4XU6Awm8QUW1AkTp
 0CtWpu9FKJiCRPIERoLZ072mXxUjc9vgES0WvUzRignXw4Q2xPqF4Px
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

On Wed, 01 Jul 2026 01:46:50 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> This adds definitions of new CSRs and bits defined in Sxcsrind ISA
> extension. These CSR enables indirect accesses mechanism to access
> any CSRs in M-, S-, and VS-mode. The range of the select values
> and ireg will be define by the ISA extension using Sxcsrind extension.

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie

