Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311E833D4F2
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 03:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786420237; cv=none; b=uWXoV4HPClNiS2I/cMKQQWbnw/lllyrMxnrbxhoUtMtcZn0abLLjxMyvF4vPpwH+01INOTBinGS39UV8QdOMnS9mupnSEm84kJYituhABHmY+8AQW7LaDWGmIevNp9Tp7XEXa8LgkEl0M06Wb7TMfP869W2yUJwCZiyWyojFIHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786420237; c=relaxed/simple;
	bh=gWBYvoXvMuR+XWw4Tsmg87T8vN6PxbDkYFOQRNHGpm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guCbG7un6CNQhIbpkxahWi2NIVmhZaoGjC6hDRTK1xBuHUv/XCchKbo5asf0y+LoHye2kOY0CkqStL4QsycYr7XCqplS0WD1do+YC46QbFpIb7dgRLeG/JcrVSjStoetccH8o956sq3aIk4zm+goTTrg3FAPWXOCa1mKXkaEyn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/GM3YyO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/GM3YyO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caea3f742bso42145885ad.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 20:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786420235; x=1787025035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UzLQVcGZ5l2XVUGPdqbb3e7Oajp0X5+/MxQRIPlN0dE=;
        b=O/GM3YyOirhrW+Lysm1oxIeHknUS6sS+gCLYJ6xtqlW1z3eupaZ7Nwu0ORc94/wT04
         9d51ml2dxk13VnFwCX1iunWpeeWYCfm0YoZ0/BSwEs1Ch2vBf54anw9hqi2Q9j9QGoXN
         F4XvLtn3dHXiiY9kNDRd/qH3VmvPwx2b1DiVQDIjBMGAPLkASjU1PJp+5HLLTQqjKux2
         johfrs9a8mgkvklLS9VQZaNS7UEMWMitmUL2incn0pR1VMuwI/pQJdXuslvijWKN70H7
         bEVL9/nzSORCBhJskRWx6refaWmUAZ7q1qMeiXAEcHhQO1HllAAzM/vhfCfWwKuMWXeV
         w/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786420235; x=1787025035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UzLQVcGZ5l2XVUGPdqbb3e7Oajp0X5+/MxQRIPlN0dE=;
        b=q5vd4Mo2yz7sNF0V5w/30r+mqiIuyCyDst06Jomr3KxBx1VxYFZE2OJEAT8PGAljQs
         KtHB86SnptafSlhKzcMBLQ8xykeJzvZckhaWpZxGpiDDknGhAnrj9K+VR6ONoliSiqZE
         vOVAb12gJfeyMExrtW2fWiIQQz6COLUJ7rB2vP5I8hwGOA6ehQtpfe/rePeB4yQpchgj
         wLIOkv6+5fD7uJYWhOoGYCBdcE56I7LAjfeS2fJq6DQ3n3NPgYIEN6+uk5ImksE2AIE5
         u0w02vNFhB5s/P8W4HRvfuxdvSMVNq70SeRLYhA9G1AFQaH/apg9XPlAE8QU18bd2F8w
         JqHw==
X-Forwarded-Encrypted: i=1; AHgh+Rr82JA/kju1kW0cW+OfEtXTkqg6i8fHSzhxPgqQNRZCG6KC4z+oZDlsAHpr2IIaZTV5IB2AuG9jYEr8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/K3V6d39ICBJgMWWslc/U8eGBudnu1ZSplKPSkCFMtEHgS+27
	YRlG9M2XFYJ+7pwy3nsvo5zwijBWdY5WaGRqrnBN9BrUMDRAZFTkEBMv
X-Gm-Gg: AR+sD10iVd+oy8jbMcOuKrNVH9/tK8JvdFWWg6Htm6ULbCjeCsz7VIUJIarp8yxss2Q
	AwQBAidQ8TD7QUrMVUQtx9PsDwQ/b2obKulYFVSBquwFWI25UmVNWU5KZfwjYr+Y/DPwwPOZGsr
	e5stOn4pkG9S6DQ6MCqvlT3CApNyKsjsJ3pVlyJHO2T4Duv8KK7V6SmNs9JpQIwXPjypIkK9GNL
	flfXSyemV5icPnikLDgFqtS/FZS5Y/ynvz93IgtvPUJ5mGd5nk2IIQN+SdCIT0mEP8FYpsfBplR
	VEy2+FXs/hNW3I939f8luvqWgO0YM/rFUBNFrs8w0tO5JOp8QDDrUjPbhFzTS1OUimtEnTelEqc
	mrgV8fbMZmENOPl3NLOXmN32whDEIPnPErYvlUhoQjuCcLKAony7EK0rvBhplwZWN+jNFlICsdL
	VKgvkyxuTlY5vdO2gKj9aBJUyZSogoywTn+6FZeoSsKMnnMQaUjYPLJDKoZ6EdT1blLZ/NWyJ28
	zfEUsKmBXhSPxEkEbG8EDo/8wY3cAbkuA==
X-Received: by 2002:a17:90b:2541:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-392ec2fc235mr451558a91.4.1786420235511;
        Mon, 10 Aug 2026 20:50:35 -0700 (PDT)
Received: from blinky ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d4050557sm1740457a91.3.2026.08.10.20.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 20:50:34 -0700 (PDT)
Date: Mon, 10 Aug 2026 20:50:31 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ian Rogers <irogers@google.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v8 12/22] RISC-V: perf: Modify the counter discovery
 mechanism
Message-ID: <anqcB37PywQpMhkc@blinky>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-12-7909f863a645@meta.com>
 <178453211938.543975.7016109597042850635.b4-review@b4>
 <ba053fa1-9df5-406b-9f92-df0dcc76ff68@linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba053fa1-9df5-406b-9f92-df0dcc76ff68@linux.dev>

On Fri, Aug 07, 2026 at 01:08:31AM -0700, Atish Patra wrote:
> 
> On 7/20/26 12:21 AM, Charlie Jenkins wrote:
> > On Wed, 01 Jul 2026 01:47:00 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> > > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > > index 74d934238821..c20f1e33c65d 100644
> > > --- a/drivers/perf/riscv_pmu_sbi.c
> > > +++ b/drivers/perf/riscv_pmu_sbi.c
> > > @@ -1599,13 +1658,23 @@ static int __init rvpmu_devinit(void)
> > > [ ... skip 15 lines ... ]
> > > +	 * in S-mode via Supervisor Counter delegation.
> > > +	 */
> > > +	if (riscv_isa_extension_available(NULL, SSCCFG) &&
> > > +	    riscv_isa_extension_available(NULL, SMCDELEG) &&
> > > +	    riscv_isa_extension_available(NULL, SSCSRIND))
> > > +		static_branch_enable(&riscv_pmu_cdeleg_available);
> > This needs to not only check that smcdeleg is supported in linux, but
> > also that it is supported in the SBI implementation correct? Trying to
> > boot this on OpenSBI before 6bb6b61c27eb ("lib: sbi: Add support for smcsrind and
> > smcdeleg") will fail on an illegal instruction in
> > rvpmu_deleg_find_ctrs() while trying to access the scountinhibit csr in
> > the patch "RISC-V: perf: Implement supervisor counter delegation
> > support". The proper mstateen bits need to be set for this to work
> > without crashing.
> 
> Yeah. We can do trap/detect to identify if smcdeleg is actually available
> but that is bit ugly.
> The firmware should make sure that it doesn't advertises an ISA extension if
> that is not avaialble
> to S-mode but that model only works for newer firmware.
> 
> if you are running very old firmware with new Qemu/platform, the default ISA
> extension may have
> smcdeleg while older firmware may not even know about it.
> 
> In reality, I am hoping chances of that happening are rare as OpenSBI
> patches have been available
> from a long time and Linux kernel patches are yet to merge. I have not
> addressed this in v9 as I am
> not sure which is the best worst approach yet :)

I had an old opensbi binary laying around and ran into this. This
unfortunately crashes the kernel, but since there is not a good way of
detecting it and newer firmware has handled it for 2 years now, I think
it is acceptable to leave this as-is.

- Charlie

> 
> > 
