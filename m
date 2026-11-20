Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199129;
	b=QIexexwl/1c4gDEEQQTw7yAaIrwUnBN5Wop2uDnalr5KbTZMN1x/97WPuSTq6Jrxvz8z
	 tpCJyy+RtirxTTzujhzFhwlwapvi1lEazM/QY/2ubHa0GqciJgMCD0p9uIL4vYZoT3c+x
	 hFUSV8MA3YjWpQKEy+uRMLyFO3fNW5nxbONCuXm3wipQmhZQDV1EAr0iN2YOgkfXH2dNa
	 xi+Z+wyXoZCGEZA/tePP8IOvcqQJvSaf8ar45zT1onb40JgxWiOSGJZgCfUcDrSllBQPS
	 L7Jmx9vjyBTth5My9UrivmxwP0iBiFNiCXj6v/D64rB4cxxIAacspdpkfplD57DVDkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vdsl3Fpj96ajho6n1JE8US+G3gvmCNGH4Zwy+J1ofWw=;
	b=Ofly/vnq6sK4YYWG+L3zFDATiEs+GzQGu+UVYD/k21GeoqdWC/JOWhJxP1ic0Kp45FBk
	 Rzf7dZrTTmwj58Xr1LVrtf0gb5p9KC4ky731/G4pX5QAhOXXNxJP0utq+FKu6HRXJmbMQ
	 J9xAU7rQFuTr1f3q+zAzHW1MrxbzlfCM5CuxV29oqXb8ruuQ+v1vKfEB34/Wd3DlAUYmD
	 ADfRO+1K5nkOjW9l9Phz5zmhyPSzNvaS8UY4eBYXtJGkprDFt+zTFRtpbZx1serJaQcHl
	 Mn0Aw26nMSaGppdwN6Kq5fBHqmpU5cBHW673nc+CPLB3Y2DIdOq5M3eB2YNUU1ymGMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q09dThmH;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E051606A331
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E051606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q09dThmH
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso7132765e9.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795199126; x=1795803926; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vdsl3Fpj96ajho6n1JE8US+G3gvmCNGH4Zwy+J1ofWw=;
        b=Q09dThmH+AfeATpANJTL84Inm6iYWArhWDiibkRE935RvaUta54OpB8h9ocZUlmMrq
         ///onBpV0ngantSEkrqsIVWvU0cQY0/t5H+JqEbch+9tE0vWGfK/GDvZXyf8/Ng6k8Hx
         Gm6UyDSt59Edfky74CyUkF4Ec8m2jwOC7XIRZLhYrI4VsdaSGVyP8FyUGFiJdl28NXFg
         NwQjsOJjt1ShLPXjthsxJo9KOIlOZTjTeFXK+7WdtV6WKMToHolFaSoCx8nGOC3uEXGT
         LZAlbwxbm+BKohETc0ZxaW+59vm6/ExDRfWuR2MYrMnXMbnYz3Xw0M2RJiWPQnJ9xKl2
         XyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199126; x=1795803926;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdsl3Fpj96ajho6n1JE8US+G3gvmCNGH4Zwy+J1ofWw=;
        b=gFSZZLPfB6Az/D5OIEXb9ocFa0Asyf33KkXxz3kMhQP/9GujZtxTYcg2Vo3a/34Rxz
         PekUGoXSy1XmKGLg3YwmQEfsHxK/vnOa9IMQcI1Wly1EXTOsO2gj1lcsbXA8CqBUSUH2
         JZ6pYG3Hxe6UDLNIPNcUB0EHuxD/1+u1Ap1hXzGSGeZsgpMJ6olXwPZWKprCBxg+Wq3z
         Cq9d/2sjcKbP/rl22qe7MpAgvHgTSmnXkBDqPyYS2N81WcJaYnmG4xXUmn1pvghatOyE
         cTWyQsNxuCqcbnJiMb885VcWPnIWhxeM+P8d4CeUCkTR2QND+MSXdImk6vhXQmA1aEwp
         5c1g==
X-Forwarded-Encrypted: i=1; AL+hErFs9xQr9n0GODPXfnnMjAe5gCFk7oTt2+WdfPdOpkvHRo7eoftOg5sSBN9F5mgzGcbIPMgVoh+opdwB@vger.kernel.org
X-Gm-Message-State: APuU4Z8Qv885NaoSU24qYTmvxt0RUk0w9pmRWvRro1YOPhDXRtN9kdCY
	hYx+AISqxQcUq5yqNrP3Cjk2LPgy/LCvVvNoSiTGjY7iz2A0erbA1cFa+PwEtYvyxTQ=
X-Gm-Gg: AYBFou3shV0LMT6JxMZt5sb6o+MkioMIp2Ys2mSXUZo9Dgl1tDVWJHiU5kTO5OdSkld
	FRaYoXVrBwgUjHHxAhZSGkdVjxwUWtVlqH9Hy+vF3hj0DXERqNT1ciPC6nakCSqyScJ47eALBqn
	Sy0W5aE+U3pgdoOQ7cBJ/ny8Ey1TxlOuYgqYaylWwcORNbji1YQ2CTrsHwyB09FIqYV1dw/RwWZ
	etmDKOVRzWmvcGqmApq0zrxgN6f+Yq1opqt2kWej2qQHGKV6KV/aphl88JWzfAdW5659XIlt7+c
	8dG5O/Bn8/E6uTjYYJtqplUQZQsWUvcesyzF1JKR15jlIiwRp/QkQJu6QjrM4iLzShGR/iG6Ivr
	MgbWRXTjP5lbOgT8svcRHDx3Z0nQKebanupvoCzONCJGlSvlhcZzj24NpYdMpOnG09HMB2vXNfF
	5DY3oUjNaZebkK6RsCdM9dpctUncgcTKek68ce/sUz7CBjTQVQ/zhMe6DWIGZFvHeTvm4r0+041
	POPOPkQl2r9KabN0hvJL4yogvD+M2LOrA4JUFetaORNNKJV2nflOpmV9XsbpIikOZ+HzkUPRnq5
	Np6D6/V1rty0rC0BYHI30ofOJr3gU+3892T4M+4nOyH4S4be
X-Received: by 2002:a05:600c:5395:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4bb8880ca2fmr90364855e9.20.1795199126650;
        Fri, 20 Nov 2026 10:25:26 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm150583125e9.11.2026.11.20.10.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:25:26 -0800 (PST)
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
Subject: Re: [PATCH v9 1/2] dt-bindings: gpio-enabled-clock: Add a new
 binding
From: Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20261120-oversold-enlighten-48e6c36e74de@spud>
References: <20261015-feature-clock-guard-v9-0-c1c05a498d9a@bruker.com>
 <20261015-feature-clock-guard-v9-1-c1c05a498d9a@bruker.com>
 <179519084920.3795820.18319787881002052092.b4-review@b4>
 <20261120-oversold-enlighten-48e6c36e74de@spud>
Date: Fri, 20 Nov 2026 19:25:24 +0100
Message-Id: <179519912461.3795820.175908509395869639.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=TlQ1YVhRz7S/iXBfoIv2gcjj5oVi9Rudwy+CoiFSaI4=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkME6bwFoXnX+DeqK4aoN0p2Gxx+cTExA3xGSl60xxL+
 t4nzLPsKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwEQyfjD8j9i87bzj9ZfsxQY6
 TB8/z0ryqrvybO9FRaV1mdbuOwXOHGX4n3f276w/f/99zBWq2zyloKY8/0HCcf7JxdK+p5Zs0FD
 8wwgA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-20 17:18 +0000, Conor Dooley wrote:
> On Fri, Nov 20, 2026 at 05:07:29PM +0100, Jerome Brunet wrote:
> > > Add the binding for gpio-enabled-clock. A GPIO-enabled clock provider
> > > exposes a clock (can be any type of clock) whose availability depends on
> > > a GPIO status signal.
> > > 
> > > Some hardware designs provide fixed-frequency clocks generated outside
> > > software control, such as by FPGA-resident PLLs. While the clock rate is
> > > fixed, a separate GPIO signal indicates whether the clock source is enabled
> > > and producing a valid output.
> > 
> > On v5 I pointed out that the input is not fixed in general. It might be your
> > specific use-case but it does not generalize.
> 
> Does this mean you are asking for the commit message to be reworded?

I would not have asked for this only but since another version is needed for the
driver side anyway, I'd like that to happen yes.

-- 
Jerome

