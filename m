Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9371D5CC6
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 02:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775269366; cv=pass; b=nlbQPIkJq9WievFtkKzHAUab8X6rl86nk4JwTzKZL8gN5F9jI52LldWBRp2pQRkmSvYL0Qx3J9euP0DXF4B98l5OdnrpsILGxLlgAgCgggFUaN8K7XqQZ90NDQ9fJFTEGFVZv3hxugI8R6E9A1q80gcGWxZDwG5tPW5Rea55cgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775269366; c=relaxed/simple;
	bh=/hWhENbGx7zICTQg6PDtChhg2P/n5TmOwT8urHL/KaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W5dp5fcaE08KoiW5KxffnN5jlGGsyruhM4JF4jej6/w8TD2JPMYjJBaCuqvkJw4ZuVJwbPCaJu0ccK7GrcCvAuF815LFF/e3lGTsNEWW0dyhqhbhFo+MCfKVpbvldj7g8/hmTUs3sroX/gK/BGTI0tS6KXokZjIMO1oAl3MfLiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=Okp9vbCb; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="Okp9vbCb"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3591cc98871so1036313a91.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 19:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775269363; cv=none;
        d=google.com; s=arc-20240605;
        b=Y+iqeUvJk1UDTVPnq9cC1x6qBAbn5UYjh17UOUVxnqwIKLTN4r/hQ+bjqsz/2Dl+5S
         6P4nw0nUhH3Ohu7H1P9zsJDHyP6AqiDdLvEEsBzPvc5+gbVwQkXOhLvOVaqfIHDD0GXH
         2GDVYFZENWzwIusP4fI3SQ+NJqYXSyv6hOwrgO2QhTniaMQVl9whfgTAbAQPkuDaFzF/
         8THPDckm3GAAMJHroRZqIpMlZWntNtJWNJkG6CI5XmiT/Ca3jS+q0EzwWEj/7MlKqMpV
         LgfR/J+tP3RjmcENYtyeCS0re0bgk2wnYFa8s+wVSglAyVb+GzT7DJEzSLb4sSb6j3VQ
         oG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/hWhENbGx7zICTQg6PDtChhg2P/n5TmOwT8urHL/KaE=;
        fh=V/Xva3s9OgtYcMXZg8j83qo+1lGO8KXP6ztUyocbkvw=;
        b=hk4hiZzGU0phrQ1GTXQbqBYPDBfZfSfEe6EkNH+iA2eid5PeApniJTssm0MLtM52jA
         WgPNaaclB5IfVoHUcee+8D4F7fujwk2pPEYDI1ErPIMSr3o3SSw5aGlAme2dquK7/SV1
         TJYm5E2lVJcCnYfcwnP9AlnUJF1/2DkStKRvgH2nuzrFDhYvWi8G5cYP2Gs/3MRB7VxT
         aP+hGros6mMBcjNex57sJqIHgCCZx7w7YNVOA3oSQK5nckpndGfiHeA+KglEILL+aocF
         hUzJC7trNSFt+loyyDy6YjwrirIIdakKfU0ZLn3upxDPpyzFtnDgrFGmNJirKj4KUn+9
         Weeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1775269363; x=1775874163; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/hWhENbGx7zICTQg6PDtChhg2P/n5TmOwT8urHL/KaE=;
        b=Okp9vbCb3GJrCB4rz3pEygTvIK8RRWiFuWrYA46g4XIi9m2s6Pk5rl9FBn3nkUYUoy
         jeBrmnjvM2dlkfsZwqyhALrNl2f8W4BHCaBW8b1tPyQHI0qoffPe1MPTQchbDEIB4/8P
         IkJt/kjap+h27zdmZdPXwkctqaI7peXBX1iUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775269363; x=1775874163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hWhENbGx7zICTQg6PDtChhg2P/n5TmOwT8urHL/KaE=;
        b=sMsKvUuZdRVuHldKs1FLC9T01ELOkDshDqmz9W/Gl1wr7JUIeY4r1v4tIU2YM7n4GS
         WyXSHzEq0+iolKexFvVBZv0cVuFoOnbPxInYIFS9er7IpwKgH6ELaGFM1BBlHD3nLBKg
         EeIBzg0KLHM32ld3Yf/z7t6C+DwO+4yYfqYgDOjt4AHVaYFeeg6SxQWbKr7XsMbjOpHG
         5Ub6x7Lw2R9hK6W8I33OTFN76h6aW/1QZELnDzcNn5TTldQd5i93DdbqsdSoAgpVvWzd
         otRPFovbf7RiUGg1nsLnT786HTMgJc+iLA3cztEg0ddl6V3/FIVFhFUTD+REzv6c3Af5
         7M9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpZG2tsSm4iaIMlX30zCJwGT0xURZDSRtPFUhrag6rSTeyIeo7gT57J+wzXiamDVckI9dYH0RkuWmR@vger.kernel.org
X-Gm-Message-State: AOJu0YzzaZa6M9QWa1z6bEqdg1Wy6SfIs17r7DpFQf5XmADu3VUTI6Jn
	pxM1x9dV1S85d9ttIPCj8eYnxi538GUbrvGrC6c33dUbAvAXWvoFB54ot5xfW6tOinnJzHJbQ/C
	7hhYN+LjGNHASQrPBHQoiaqo1qpqa35iX2Ad9sTpNfA==
X-Gm-Gg: AeBDieuiCoTLlC0J2VEM5ecdht/uUXMpzfGJUP9zTnnxuLSYewM/pPRtCECNjBG1zP5
	btSJj+jyAXW3ZllL++hXiZTTyoZH9WT9/1pVTuBOw2hkXWC4oJXB1ysimolJq2xuFhbH+P+q3R4
	ISNo8Us6rxmjqWcvc7NFgzHdh5LnsCdzRzRb7dqoyFWCgmXUfdOQ7rjd9zD+VIA1kdBVnUnQkEx
	4hrjM9nwhIEIjLH9xo+9XNlIF4VQD0pBAZzuUQXK26j/IKvzUlM8AzoEq/5Dek1LIOiKrVMfskg
	tsMJ
X-Received: by 2002:a05:6a20:3ca1:b0:39f:2c98:27d9 with SMTP id
 adf61e73a8af0-39f2e9f5f45mr5093358637.0.1775269363601; Fri, 03 Apr 2026
 19:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331215735.2783770-1-daniel@thingy.jp> <20260401-rousing-stylish-toucan-44bddf@quoll>
In-Reply-To: <20260401-rousing-stylish-toucan-44bddf@quoll>
From: Daniel Palmer <daniel@thingy.jp>
Date: Sat, 4 Apr 2026 11:22:32 +0900
X-Gm-Features: AQROBzBaNfA_9-Y-7BiFjIavLb5ftRVK0Uv1krSk6e1bjdkjGAkXTdWkK_iGrt8
Message-ID: <CAFr9PX=F3Qvyo25HwB139Jk4_+5Rw50GBg=3BJb6bcsk58tL=Q@mail.gmail.com>
Subject: Re: [PATCH] of/platform: Don't include reserved memory compatibles
 that aren't needed
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, saravanak@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 1 Apr 2026 at 19:54, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, Apr 01, 2026 at 06:57:35AM +0900, Daniel Palmer wrote:
> > There are a number of very platform specific compatibles for reserved
> > memory that the vast majority of people don't need and they waste
> > 196/200 bytes each.
>
> We don't want #ifdefs in the code because they are more difficult to
> maintain and review. Following your approach we would need to add such
> ifdefs in multiple other places, so I am not convinced it is worth.

I sort of disagree here. At the moment these compatibles are not
coupled to the code that uses them at all.
If that code gets deleted or moved for some reason, the Kconfig symbol
they belong to will disappear but since these compatibles aren't
coupled to them and are in a file on the other side of the kernel
it'll be easy to miss them.
If they are wrapped in something that links them back to where they
are used grep or whatever indexer can spot them.

> And this file should not be having different rules than rest of drivers.

There are other places with #ifdefs in match tables. It would be nice
if there was a nicer way to do it in C but there doesn't seem to be.
It would be nice if vendor specific stuff wasn't in the core code but
I don't see a nice way of fixing that either.
And if you want to see some of the more crazy examples of match tables
take a look here:
https://elixir.bootlin.com/linux/v7.0-rc6/source/drivers/cpufreq/cpufreq-dt-platdev.c

Since these matches are not the size of the compatible string but
actually 200 bytes on 64 bit machines the two megatables in that
driver will consume about 40K. It doesn't seem like much but DT is
being used by systems that have megabytes of RAM like a RISC-V
softcore on an FPGA. I think they might prefer to have a 40K of usable
memory over 40K of tables that don't contain any values that are
actually used on their machine ever... and it could be cleaned up
easily by wrapping each of the vendor specific chunks in the Kconfig
symbol for their platform.

Cheers,

Daniel
