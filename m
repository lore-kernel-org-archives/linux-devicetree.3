Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBDC43DA47
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383566; cv=none; b=DH0U9uR0G5rJYoUJJzGMblOjUATA+dhA27qyHmb9it0gEdORv0EmOTUca9X6bKNkluuglJDrbCaKD7KIkpjVM797CRsewTSX58ZxDEvHJ6sBsAKCt43CEFSubnY24AQcbYwJHhQ5DkvWNLOwQTx1OE91pDml3QZxl7Rm2yK6OkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383566; c=relaxed/simple;
	bh=2Nntu3egbUh/u7IpfDHTCoOFDbjKhMadOhI4rtSRJSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfAZuPN16I9QeBP6S4RxAAkQGSSXClvsjxrAOCOpIlvv+BPC7SbZNwcVHJvmQroYEk3wyqzbBBBkmmq9HQKyJnzNubqzmnaO5IdMJwdtKa4Rm4hADGq+qoAGOD8tdDQur54b73mKgVpAzxcdl0g1XlNQYb1mpiJPtOnZNINjPpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UB9F3WIX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oVicnqVs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UB9F3WIX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oVicnqVs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777383563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SPYMWkvIrzN3gEn5sFq2jPlLqaoi5Nb4/O/19cEGdcw=;
	b=UB9F3WIXcOLFaqSw0/HMA+Xl4mn1G752dfxeBcAWpdiTppotrIEAQ2yB2Woq7URWqV6yTr
	CwaYhkKiyFmIf5hPXaWhGv2SSNNFuIlXUdaEOkRJtx0GQ9yKpcpm8jJX9PtpERaXZVBwAW
	nZRh6W8FZ0RNfDvC3CcfIhTWfknC+/k=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-h0Ueo2-SP_i9EBc3cCCQvQ-1; Tue, 28 Apr 2026 09:39:18 -0400
X-MC-Unique: h0Ueo2-SP_i9EBc3cCCQvQ-1
X-Mimecast-MFC-AGG-ID: h0Ueo2-SP_i9EBc3cCCQvQ_1777383554
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b1f4478ca7so158496656d6.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 06:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777383554; x=1777988354; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SPYMWkvIrzN3gEn5sFq2jPlLqaoi5Nb4/O/19cEGdcw=;
        b=oVicnqVsG+lyiFj0Yjq0uF8U3N+rTwrMcJeVtJqAk++CBHc9x+hXVzXSuY4tt88n0n
         OTHW9MxwbpsjjItpqON6PeObfv30zSk5MUsVD0bchU7AxkKP1pewdxtbKCr7HSeMPWYK
         bNVzDOGMLbNeKbC6PapKn6nxDakstl0He63FHeXMwQuuyB+pKNOv0JYhBQptUyBhwB/E
         mC2uWLr4oen9KpFk+5Uv2YbpdX2Ie1J5eJlG3lh0CFlotSZ93aZi36grg46JkDl7Wh6m
         QKgve9JZ+OIBRWU1Bzd/xranytsXiqkICZ6xLYQtq3ZS6dZ76IRBxsOy54HrbVXIyv1s
         fmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383554; x=1777988354;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPYMWkvIrzN3gEn5sFq2jPlLqaoi5Nb4/O/19cEGdcw=;
        b=lYVrk/nKvSOm5AxfNcXGiltihgxEjHtvVab5FKlCotS4zmFND9v/wp/3A2gNUA24bM
         Nrtd1XmNpv8Ls413Dm94KavLMNgUYZxhR6m8+uT4SWTtHWNuRZ+O/Z+e9bC/t0TFabVP
         9/7sHTVVjRX23vOPDubzRs9N5B14U3jcnqUjXfaedCMCctMSC1IHZ/YANC6WVOopqtww
         ofAU8sFfBjch5OrBmw2X/PBFVRWYXDC2/LmD5o1OyeacAfhi884CGDpgGyTKHqTRtIEt
         U4xaUlHxsxSu21ttvpzJxFjXdgyzRfRk9qF/MXwPlZHTIOVwNMfSYjZKsR4goyD8ZIXf
         T/iA==
X-Forwarded-Encrypted: i=1; AFNElJ+PAgn78fr8cu9lX8j422TPfVn8qyUrfv3IeuZJEEORCXfcOFsQzZx7BShowO/AVApZqM64ThhLUdF4@vger.kernel.org
X-Gm-Message-State: AOJu0YyqN7CF+g8x1IDhAAylAyrXACL4+OVoV7+I0MCUusoIpwV2hANx
	4E9O4wJJaSmhfFdGexBUe2IgG27TxUe4pEdIweCnHZLDnYnorJ7amptvB4/MvD1JFuPn3brU9nU
	dSKLqvY2J8ZKVqWUkFSRzeGRnw7Yvqj/rbnViiaOayJCGXWzrnzEQFT4iIsX/eqs=
X-Gm-Gg: AeBDieu8y+YAZVSqpP4VxiEDoYHHgnP172ThPEWtJg0/Xbl4ZNjIr93rDUzWx4hYOXm
	CCD/pAiB794Hd3my1BGKPzRZ2vdbNsMc7qk7oN+1Q/XQeEbP1uZLxxdqiW4NELL9AHIW0v8rUyV
	+YTklNeGaI7JfGey41Q8bRa6r2YJZu4BDVI/EswQdRHjk+Jp7SuqsEBlKMH/2WTA9TWQ7dOq7uJ
	KZ1B/3Z86S4tTzKm2UTIUwpBcaTneqCTbDmAtcpsuSo3eLr6p4ivn7R25loepIu9atrKqF8FiH4
	WE2tfRk6J1OgXHOWL3K8Qqy+WwvRNTi7MBTUtbdJOgjj32QUwXokSIw7mTJukV+FzPSOb9J1v0O
	b9a53oYPYm0ruMS3S7tXV5Dtuz7ey8b2d7dyEwJlvxnqcgLSI/oyAIoLBH2o5WCSoOnw=
X-Received: by 2002:ad4:5ccb:0:b0:89c:4cac:74c5 with SMTP id 6a1803df08f44-8b3e30828ecmr51378386d6.25.1777383554105;
        Tue, 28 Apr 2026 06:39:14 -0700 (PDT)
X-Received: by 2002:ad4:5ccb:0:b0:89c:4cac:74c5 with SMTP id 6a1803df08f44-8b3e30828ecmr51377366d6.25.1777383553408;
        Tue, 28 Apr 2026 06:39:13 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3e2956b79sm24018236d6.29.2026.04.28.06.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:39:12 -0700 (PDT)
Date: Tue, 28 Apr 2026 09:39:10 -0400
From: Brian Masney <bmasney@redhat.com>
To: Xuyang Dong <dongxuyang@eswincomputing.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, huangyifeng@eswincomputing.com,
	benoit.monin@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: Re: [PATCH v3 2/3] clk: eswin: Add eic7700 HSP clock driver
Message-ID: <afC4fqX_6eeE97mB@redhat.com>
References: <20260423090904.2108-1-dongxuyang@eswincomputing.com>
 <20260423091114.2326-1-dongxuyang@eswincomputing.com>
 <aeo8nn-eigzlojWx@redhat.com>
 <4e5c887.5a31.19dbf179fb6.Coremail.dongxuyang@eswincomputing.com>
 <CABx5tqK7p_XJHfXZ70gXhR88PzAteV7cVSFPoRzccgmjanADMw@mail.gmail.com>
 <177733570840.5403.12558106273673899411@lazor>
 <7a76d8cb.5bab.19dd3645d4e.Coremail.dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a76d8cb.5bab.19dd3645d4e.Coremail.dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Stephen,

On Tue, Apr 28, 2026 at 05:21:03PM +0800, Xuyang Dong wrote:
> > Quoting Brian Masney (2026-04-24 04:15:46)
> > > On Fri, Apr 24, 2026 at 6:45 AM Xuyang Dong
> > > <dongxuyang@eswincomputing.com> wrote:
> > > > Thanks for the feedback. I did some research based on your comments.
> > > >
> > > > lock_ctx is a local variable declared inside the function body. It is not
> > > > in scope at the attribute site. The attribute expands to
> > > > __attribute__((acquire_capability(lock_ctx->lock))), and since lock_ctx
> > > > doesn't exist at the declaration point, clang's analysis cannot resolve it
> > > > and silently drops the annotation. That's why you see no warnings from
> > > > make C=2 or -Wthread-safety.
> > > >
> > > > Why -Wthread-safety produces no output
> > > > Two reasons:
> > > >   1. The lock_ctx->lock expression is unresolvable at the attribute site,
> > > >   so clang drops the annotation silently — no acquire/release tracking,
> > > >   no warnings.
> > > >   2. Even if the expression were resolvable, spinlock_t in this driver is
> > > >   a plain pointer field (spinlock_t *lock) accessed through a void *
> > > >   callback — the analysis can't track lock state through that indirection.
> > > >
> > > > The closest correct expression would be:
> > > > __acquires(((struct eic7700_hsp_regmap_lock *)arg)->lock)
> > > > But that also won't work: arg is void *, and clang's thread-safety
> > > > analysis is type-based. It can't trace through a void pointer cast to
> > > > determine which spinlock_t instance is being acquired. The analysis
> > > > would still silently ignore it.
> > > >
> > > > For void * regmap callbacks, there is no clean way to make __acquires()
> > > > work, because the lock is always hidden behind the opaque pointer.
> > > > The annotations should be dropped.
> > > >
> > > > Based on the above analysis, I suggest removing the annotations entirely.
> > > > However, I'd like to hear your thoughts on this approach.
> > > 
> > > I agree to remove the annotations. Before you post a new version,
> > > let's let this series sit out on the list for a week or two, and see
> > > if anyone else replies with the proper way to do this.
> > > 
> > 
> > Why not use a regmap instead? That would enforce locking on registers
> > and then you use the right regmap APIs to update the register under the
> > lock (like regmap_update_bits() or something).
> 
> Hi Stephen,
> 
> The common gate API, the HSP private API, and the reset driver all access 
> the same register space.
> Therefore, they need to be protected by the same data->lock.

To add to Xuyang's response: regmap is already used by this driver.
These annotations are for the lock and unlock ops on the regmap.

Brian

