Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9103A8FF6
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495729; cv=none; b=aHbnv6mtJvokPFCeS1AIV5WZ8CdF9Var1x5Ww6Yd1Ha60Jz4h9LU1vXHeztbq5wApElG/qZ9NTC3R8B2udYSbxLisAtKJhUlpaPlk+CHaxvxK2NttkLIeAoVaDdkR/MLRLoBPpJ54mYw7+aF5Ygm3d4m8JOBuKYvccb1GJeIRbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495729; c=relaxed/simple;
	bh=TeUe8xBkT6d9cm4wG3uRwDCdbb+rN4QrP1F6fWpCbQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UiH+M41DbSI3z3Db+y+GDFmLUQ5D9BFWmef3tB/lzD49PuYi4wRg6pjlKiBdBbddz0mstj5vimM4QOfaaPv9FvgPAWNWVqUKVa8a1ws0iAZBUg86yKcQU+J3IPjoCZ7sg0FS63YJj/F1UMWkxrCWYDX/uUG2lNl19uU3LPZiHO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luSqSbA6; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luSqSbA6"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bebc80100efso459397566b.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780495726; x=1781100526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeUe8xBkT6d9cm4wG3uRwDCdbb+rN4QrP1F6fWpCbQM=;
        b=luSqSbA6GWgvP+ZJeChBiZEW3lkNyjkLMkocx15wYGOfb8ScfBimd08IA2eILWLLsc
         pfYhYa4nYS48OXmAHqL+dV1ZLL4Bucyucssa8+5QG+vbjcNPPp5iOl2X8VFTgCwDy9ik
         vsKFtrPVeCsVz8dM49Zw4WFeQFhsNscdsfX/V7jZNhqcNV1BCh5XJ9705kGzGoS9zXAQ
         XxW8/4pkSXurTKu0R90ANdIeFd1ThsMBHM1yEp960T2f1TRNcY8InJXC9Ib1mUW95Nj8
         aM8HdCnADuV83b4x0Mt6aKR13U8MtsMiw5a/tEy6sCG4Xwu4jrzuSji8/eX5lUCuToPH
         qoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495727; x=1781100527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TeUe8xBkT6d9cm4wG3uRwDCdbb+rN4QrP1F6fWpCbQM=;
        b=L/ZIRcx9+ZqboCKijBJIrHTQncV7E3uWRDA9oO/xNvIzmD2jYBA0VJlCdY3M+Chii9
         vdmLimvZGO/7kw9gwJaAmhfNKFBQKucJBkBSeOQqMdNtyB/a6OgKy0l168s7IE9CFTVU
         ZyZflGTVUw5DYaGiBAAb1qNvhnnAc5FV1+UaBRYKHge3xMkvX16u2gqOwHm0/uL2EUi0
         eH1GK5omCY+pJ4sEtzQH/d/yiVHKVNeuqMdIx3444WdZTDYnFtutnPdS7lODr1zqgsiH
         TWU0quE+Mpg/vyi4Lqq0o4AfA6qQJZmgqUwDXy7mof9ClXvAVjUAGrMieoHtY+DgMDd9
         ktvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1Yphs6nQBno483GpMGYtc7ClHJ5i09dbaSduCUQkVydyyYTmWhsCRyNQK6Ou12pNY3U4FYCGfBzom@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5eH4/MHEAwEvJsXcIHnO2Zx+U2fhyWxo9Qc3GtjgTweFZnXCf
	TbrPbLGTXIbvWqMOGk6TJB57+h+/P31U1qbAxrdzCbAgm6OPlTFQ5wFz
X-Gm-Gg: Acq92OGoL/TwlZKpZsqapnAz4/aHL+xF7sX5CkK+ZOhgds3CR8U0QOEFmSIAOQh+Joj
	sLyto5L7Pjd2jWVMsQvymduJhXkt6iFKNEXpyQPF3jowRjHBPodE6VOFkH7kXUdZD0doCktELhM
	inqHyz4i2KU48V7EZHBpE4+e4Ds5f+fkyb457d0/SHC3SkQO3ZIkDKJRXa3ShQr74lVstnQjIbA
	5DUR7d245VshouG/EUpu/CR31G6wNpf2GEJPIY+nOe5Z9zqxZT1wzMj2mrrrsAdu2IatZSngSnl
	1CEKKNoZ0ybabweNHprcpBJkBaa9id/yLijfWYG9nRj8vzuwD6wkwc4HErDyEu9+LScAdnUNkze
	6rN+AvyDeaORYtFV2t85GbZ92srptbhJXKqm88DaiKAvF5VqpnNZgzsVkbFqkzWlSGeCJ62K0Qg
	S/tKDgejEYYtPTrL+XwCUs2yqWWbgOjULrfU1va6MELGBRNWOFv0LwnA8CmlySTewaWvL03b9nL
	FVbKEs=
X-Received: by 2002:a17:907:9627:b0:bec:e6ae:2f6a with SMTP id a640c23a62f3a-bf0af0fe85amr195437366b.36.1780495726173;
        Wed, 03 Jun 2026 07:08:46 -0700 (PDT)
Received: from fedora.embedded.cmblu.dev (p5df027fc.dip0.t-ipconnect.de. [93.240.39.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1ac0sm162062866b.62.2026.06.03.07.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:08:45 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wadim Mueller <wafgo01@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: iio: flow: add Sensirion SLF3S liquid flow sensor
Date: Wed,  3 Jun 2026 16:08:32 +0200
Message-ID: <20260602-slf3s-v3-reply-01-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260601150959.49bbf125@jic23-huawei>
References: <20260530205435.37326-1-wafgo01@gmail.com> <20260530205435.37326-3-wafgo01@gmail.com> <20260601-banana-narwhal-of-music-0b4d3a@quoll> <20260601150959.49bbf125@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 1 Jun 2026 15:09:59 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> > And here something else. Confusing. Didn't you say device variants are
> > auto-detectable? So you have only one compatible sensirion,slf3s.
>
> And then future fallback compatibles can never work. [...] this is why
> generic compatibles are almost always the wrong way to go. If we get a
> future part with an unknown ID and don't have these existing specific
> compatibles, then we have no way to specify which one it is compatible
> with. [...] Note for this type of device I absolutely expect there to be
> future parts with different IDs and same ranges as here [...]

The scale comes from the detected sub-type and
there is no real feature discovery, only the opaque product-id. So for a
future part a generic-only compatible would give the right driver but the
wrong scale. For me the per-variant compatibles are the safer way.

Krzysztof, is this ok for you, or you still want the single generic one?

Wadim
