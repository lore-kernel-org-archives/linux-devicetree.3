Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338994;
	b=r1k9i1W9EzOs8PtlgQVfr14I0dc/3KlJjWwzAAl5Dksu/kRJd5Tm1uhAuJU1qzUbTunS
	 Gfmoqj4z5sAhPvltLR9ZKVnxWZHkkOQ/ORVvvJZHHsyXiL2aPULFcUm08hK+LMr9uX1Ex
	 Hcegojp211Mx56CBb5RFtUfVbuYe0s0lymGycVyfGZZ8jfIxXQTk/cdNimLwNLOSNyJiO
	 Hy2dqduj6AS7jp6zrOmJoRC4MdT3ZMx7J27PkB+4RGFanrUrclJGYMZD0USOizWhoF/T7
	 wNoF2Z+DdOaNdtx63BoEWJqjNEXtp9qZniwJSDpU2BbUAfhCD6Qu3GsdFaFv3ORoj0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bCWYMiBYjhAym3CK4+93yurIeQTmlbS6kD3ZxpQIRR4=;
	b=TVVMwUKIjLE0nuAGIEoZly4HkFtRJrVIcQ5pDLG17zUI0EJYNhtm693gqTGGx5yUsQcd
	 +PRF7aY3N+CQw5o9xMoC7D24fiUsDUSZnydS+xYEHptq545YSdjplq47gWEInm+rHbhp4
	 mmQBMS9kVFiCkRa1nIA/UuxpIWvMjghKgbqwwfkj4kWRzO/qwArGEaDGiUU/X1TrlidmR
	 V15Q7yDjmi5PIEfCTWEc/k09+0yBuGlrXcfrw8uNyT4viU0TDUHXKZckduAHDlQa9lJj9
	 rEOCwpvz/3724Rr29tsAg/yo5Q+s/0BlsmzvR/U3vfquBSC4SxPU7f+QnczC4k9SSuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AQTXK/7n";
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2FD606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A2FD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AQTXK/7n
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3ae08d3dd4fso182790a91.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 22:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338993; x=1793943793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bCWYMiBYjhAym3CK4+93yurIeQTmlbS6kD3ZxpQIRR4=;
        b=AQTXK/7nV7AtiXcnztdcwiTjjJrOqKxtXmR0kgdEh3k7rNpZox8Rr6/D12TY2CulD0
         1WfqOLcvFVmzKbTwxhQnWcyxSBQGbB1XTlv34xNCGfAgrNMW1dUmw58H7RBELO7BIR+l
         LUUl7odHPoXUMXr0CKwN9+WERWYMTHJhKLsM2TZL6f4y+E/9O2JmpqLhtAzgLPHgTIAT
         wbNHZGVIAyrBxenfjBNIcydy52ZAFAIcLXf/VDwRJWHt8UM/amk0XQi5rhjkFXHTZKav
         LfaZyRgtqNVumd0bSWt3fnHlCWEJ85bKglDw9Z1GOPHSPToWPvShBIRShlQmkgMw3KE1
         hTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338993; x=1793943793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bCWYMiBYjhAym3CK4+93yurIeQTmlbS6kD3ZxpQIRR4=;
        b=gm6roKcUm8LIjLosCqOsliRDcWjRfUVcplj/vALhcop5pBbVC7TpXvQC4IHsGeKuuY
         7XElP1t41m2Bx9WgxgBQM77rs6wSjYM5BMtm9alVdAM/rgycdd73+Jm1hV4V0ztLoou4
         by7F7xKT6SpSVpOZvs0wuw6CvhzR7ZVtwpH0jC+fZTp65p0r8pJklzadkPf3xbpO2U1b
         IlPCUVWI66puE6WXroasI41E3VbEE/m/zdGodSCcpuv1zAk1y1ROYOmK/bbYdvPiZVJw
         z67MxRe325PVmzkSQsEtsXzNoQTb47n1z8vfIjZOxsyrE7uuNP9etzDwF5d/Qb1lxmI7
         OGpQ==
X-Forwarded-Encrypted: i=1; AKwUvByIZBIbgDdz+AA99ayD9hQGWlLiMQ9CNrX6sC6gN6xPjT3JwQjv1neqU4wEvhTv8wsfjQBEUO08Rc1Q@vger.kernel.org
X-Gm-Message-State: AFq9FYIMMBGHuJFer3FqQ4+piVp7unHd+rrBpSKX/1kDpgEioNQOHXnM
	Ct8DzKBdpb0EftnLacw1YWGFaQBOz14dlJwz+EQrudIg1jweCHBIpXG9
X-Gm-Gg: AYBFou13wpdwUsfomz/5Xgjy+IhdVxI3TMTWPz/W3ja2H6cdTaAIWgFFlO7Y52LHJhn
	20QHPTK6Sd3ywZI1mXsWLhTJZVYvVpwOqc7wBPLyiwAo/8go03lU4/1SSsVLKeW0Br8beI965Ok
	Wwqkideguk0OACyzC8u3/94Y3SKxn2MQbPdEmKzb6R2H0Ou/eINr34dZVdjsAAG4UYLrT3TWM2h
	HH/FFKKVsu8PwvJAJ4Z0FZJslnP8TfqmaDQZNyWWf+oFgWUoODu7TIFwvqVcib8Pzqd/Kfyw//u
	cyhxQHjdO/Zv3lrwRbIwxr6J9BFLoCLQ1lxoISzGVNa12R4TJnPlmLwEdJbHJhJxTxaAy6Dvwb1
	Z/0MSoE/qJUu/vlvc7k0wrjpFw+b5xrMEGUTFCGUh8E/HUlCOfh0dsWsSqaH3USFTVNZ6SlKTYa
	dg6F2oBfqb3rGJYcTa14fDwPOfzyjMiOfeSlS66v1f2944H2t8UofES4gZRx6cN45MVm7SaD6xa
	A2Fk/NLcNQOJ0Wz/08CQdauVVMbzkueDaCCmN5u8bzr++XsYm8nnbghBBlhtmzEt8O51q8E9tXA
	6FTo2P8MZIqDC8iKM3ZYYA==
X-Received: by 2002:a17:90b:17c5:b0:3ab:413:49b1 with SMTP id 98e67ed59e1d1-3ae897c0a0dmr1047677a91.48.1793338992989;
        Thu, 29 Oct 2026 22:43:12 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm7084621a91.0.2026.10.29.22.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 22:43:12 -0700 (PDT)
Date: Fri, 30 Oct 2026 01:42:56 -0400
From: Kwanghoon Son <asdfkwang@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 01/12] dt-bindings: vendor-prefixes: Add Bouffalo Lab
Message-ID: <auQuYJqQNv4LMDP8@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-1-b736ee920078@gmail.com>
 <20261029-unpaired-viper-830e55436015@spud>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-unpaired-viper-830e55436015@spud>

On Thu, Oct 29, 2026 at 06:52:15PM +0000, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 01:05:42AM -0400, Kwanghoon Son wrote:
> > Register bflb for Bouffalo Lab Technology (Nanjing) Co., Ltd. Reuse the
> > prefix already deployed by Zephyr, including its bflb,uart binding.
> > 
> > Link: https://docs.zephyrproject.org/latest/build/dts/api/bindings/serial/bflb,uart.html
> > 
> > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> 
> Worth noting that last time this came up, we agreed on "bouffalolab"
> because that matched the domain used by the vendor - which is what we
> use as the source for compatible strings.
> 

Right. I'll use "bouffalolab".
I'll also remove the justification based on Zephyr's naming from the
commit message and cover letter. (I thought it matters..)

> https://lore.kernel.org/all/20230607195027.GA3894404-robh@kernel.org/
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 5471a06f93f1012f08e26f7f105ad846ab3629ac..24c670ff75b6f482ede1bda3b59c70ed9116042f 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -249,6 +249,8 @@ patternProperties:
> >      description: Shanghai Belling Co., Ltd.
> >    "^bestar,.*":
> >      description: Shenzhen Bestar Electronic Technology Co., Ltd.
> > +  "^bflb,.*":
> > +    description: Bouffalo Lab Technology (Nanjing) Co., Ltd.
> >    "^bhf,.*":
> >      description: Beckhoff Automation GmbH & Co. KG
> >    "^bigtreetech,.*":
> > 
> > -- 
> > 2.47.3
> > 


