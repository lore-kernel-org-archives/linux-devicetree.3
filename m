Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438037;
	b=g3GgfYBHrOU0kETxB6AFm1g2MFGO0KIqZf2N2RuD6O5ucWA34Mzq+21FPAsOVN77Fa+y
	 DHrjTBlvdPzWJ6e3jevBkqzmsfTCdwPd1IUgBdZ17ijBzQ75hvthIS3ryLspy/0OEFW/Q
	 VnbpWEMSbwOOWpG7yltmW4Buk2Y5fcaEkq0x4KMSzKfGYwGcewg2rHY1xMebnc7JBWuRv
	 1T77M4Y7gt8kZ5WTJAaXwX+oDiDw2jdt26PX0MLF1t4KVsky0G2nIB+/Xe32eizo3eUXd
	 YOQ9GjUZV/WBQ2fyq5ytMGKjb4UD9RAEtTlrKGa0Xgj+5OP1pcSLyG/unawBarUulRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZVO8QU6aaInlhKIohIqrjiN9QqnCTSKNv3BTArRdkBM=;
	b=TC+Aj66FDeH19tlFnizzG1GDQfpF8+EURi6vqhRn3XY5gLQNv/IiHW8OdhdoVFwS4ePm
	 3Yk1kfaOtfnFds53Y1+qMTBkcr2SJZhpvwigd7eCNFcaSUwV10bH+MtHILzLjCqWp8yD0
	 OBpjrRmVhBxC9Cay4SnoUv1FKgfl5Jb2uNuFZisPH4voDyqBm9gWjLyU5syST7BihaZxD
	 Ng8DqUI9N8ZTd1oWTS97+iMXanJP1LyioNFTRIzPEeU8QuqEE2jva6QNktukl3QK7/D8c
	 i1+0t6lGLI332gyflzGCzHChtXYqp1ywHIWiLnjea2vyZE1YZWh6UXbxCDXPuBGPZ7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QdoBDMDk;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE53606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEE53606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QdoBDMDk
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-57309bd40b1so1755899b6e.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438035; x=1796042835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZVO8QU6aaInlhKIohIqrjiN9QqnCTSKNv3BTArRdkBM=;
        b=QdoBDMDkTwWoMibB3nGc13HUaEw1mJUf8C6D9sn0HZ9pF0FF9+4RhzNOJfuASXfJGt
         kO5ApXyzdXHZt/B8kOaM33uSKVhfGbcnAKjknpbIHTp6Yo0ReVwFvkP1Is0PhIOhKdUW
         aw6zak5dWbkxOgTbOQ1qFPvy4ubuzll/J/lS1mXegS0vtkVm9ED4CDhLlDSdHbCc8lhh
         6dG8bG1pl4ncJUjQG6k7Mdd5lJYv41jZUdvoGkfdvcm15Pui4xgeZ2isuenrj6pKm/x5
         WRuKxiAEGQwMe7Cjk72p+Dfid1g8TUBmpuO4k4D9gyBQg5YosHKOCusGgfrHjJW/cWd7
         TXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438035; x=1796042835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVO8QU6aaInlhKIohIqrjiN9QqnCTSKNv3BTArRdkBM=;
        b=0pkG4W8WcC6NvxnkDLILXk9d9wZoJDrwW+VuU+C/xEeF+yO7AFTxErUBwzIU6JhdG7
         4NrQPClhzLvIHeVDNjslyBJPNn3eiI7Sinj4eqJNVrZYD20jZYBAJhaDGkMN6IosvAmH
         D2So8Z+whjAQFw7gdjCj72jo2HyOIHwqGKXCxLGucV9LmGw6c9d0haQVQE1rjTPWevFP
         bBPeZ2Rr5thw3PcZs7TlgES4X/11Q0mPbcuTbYKFyBESyBi0W+oOO4g0MQ4AAjAabAV7
         ES4NckjoZGBVXFAFXLVKiI3BHGbOESqchAd5MTBJlHeQ8Nncjc5BDPj2TV/tK9UI/niO
         BAwA==
X-Forwarded-Encrypted: i=1; AL+hErHowTZMB/O0quX8bfvw1c7k68z8RpBFcjmd3gh8JcERf7rIxtWjBy8iQSR24ETXtwcj/qkEkB2fKPK/@vger.kernel.org
X-Gm-Message-State: APuU4Z9B9FiDOhrcx7jiSWuqDq8M20UcliuprH0Tjo4aCmSNSaZ6i2Rp
	xX7z9tXp+fw0L//lo481XHarkCIeqBoYH5P3/LtCZLPKmyCca2MoXbuG
X-Gm-Gg: AZFdTZeVjLgm4lVNO6oIxulJSZ2rO7ZnSj7zZhDRdLhxcQnmznLmih3UEIunlmh/lRt
	2CLS6pgk3GrzFgkpJAPClvvIPwJlp3WAcqgg5g4IPJtA2LK4uOJljagEu11N+Z3JKekc43sEdwl
	aI9gxVt3mPPNw3hHdvJ6QuD9EKSmRMU3VQ3LTezypfXhx6XADc61IOX5Av1R//7P34WRRS7or63
	LeTflCD9gKxJHxPD2pvzN6Poa9dTKzxj2MiDORell33t4/VTKqt74Z6YT9mmvVzRvx1FsBuRXrx
	KK6dFMbyLsPYGnu8Qz+sEPRj+P2qJaGYBm/JlnoFhPgMj5V8EmH2KLM6DIbVALPwQuqyEJOrJYU
	i8JbQwj9Wc+KxXgU3RbT/4EZDFpXTqDQs05KJlq9ZbRw5/n8qx8O1NiQvqVdOtS3JrUOtXYkpoM
	zV6/nKdJchYa4KAiNHnKgglGw/+ffczMxVb7ql380DZCBKObm0UrYegSqQEAuVwPDRzWIVizeCO
	2KTJ86SRixG5OP0ZYc5WfV4UbsGueGbhjXnoOVUnVIEpUZ0psM1NX7mOpH8BqEPUMHqrMQJF22b
	tj1U6LxL0iJ7yaSTm6RuqY/JxTZx
X-Received: by 2002:a05:6808:2224:b0:563:e8b6:c5d5 with SMTP id 5614622812f47-57a0bd98885mr12866171b6e.44.1795438035324;
        Mon, 23 Nov 2026 04:47:15 -0800 (PST)
Received: from duge-G3-3500 ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34250ef2sm9385288b6e.3.2026.11.23.04.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:47:15 -0800 (PST)
Date: Mon, 23 Nov 2026 20:47:04 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, me@ziyao.cc, aurelien@aurel32.net, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <nke33b3mdeut4fmp2noqf3xknpfvujesco44va3yamecdb722y@u66rmnx6t6gk>
References: <20261122173810.2409146-1-duge1256@gmail.com>
 <20261122173810.2409146-3-duge1256@gmail.com>
 <DN2HD0L9B12P.2EK0R922TOV3U@linux.spacemit.com>
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
In-Reply-To: <DN2HD0L9B12P.2EK0R922TOV3U@linux.spacemit.com>

On Mon, Nov 23, 2026 at 09:24:52AM +0000, Troy Mitchell wrote:
> On Mon, 23 Nov 2026 01:38:09 +0800, Jiayu Du wrote:
> > Reload the shadows during probe and cache the data for subsequent reads.
> > Use a 512-byte NVMEM space with bank-based offsets and keepouts for the
> > other banks.
> 
> v2 said why only banks 0 and 7 are exposed, here and in a comment
> above k3_efuse_keepouts. v3 drops both. Banks 1 and 2 hold the root
> key and the SSK, so please keep that explanation.
> 
> [...]
> >
> > +static const struct nvmem_keepout k3_efuse_keepouts[] = {
> 
> The comment belongs here.

Thanks, I'll restore the explanation in both the commit message and the
comment above k3_efuse_keepouts in v4. I'll wait for feedback from the
other reviewers before sending it.

Regards,
Jiayu Du


