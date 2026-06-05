Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574B943637C
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579937; cv=none; b=C0voRThR3dtfZ2kJTLCQyrM0FGEa2IqhbarbD9GKBk5N+qfNEnx6yqFxSDnIiC96vjU8+acdTh+/IaxdNIo0UBSIEHw8N8QaDyjdUQJV5v4sIEejIioXvpsVFFuLOnO5kZ9OzdEbxa0sUc+gcXvcfPUqM7yLTLFOt9szq8jepsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579937; c=relaxed/simple;
	bh=nu95rR029uAcXuRs570urNlakiAUvYt4SjrzMfO77F0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5uEPiGB1C+m2fIT7h7H8TSXvcL9e/5mhl52Veslv9CnqG5rXUxjL+4sbJEe8raMUErwExQ66TJilCtrigm7EPrg4iDG+0poGcjLlN+yvUo1topmdDqrvFdI2RfzIXi8GxRKFuGNwwQeOYEM5M+5R3OzWnHMHMvpI/G64EEotek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IONg/XX1; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IONg/XX1"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so5382655ad.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780579934; x=1781184734; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W7kgLmd1Eju/DnzGMNjOTAqLfs8KBtASrK9bbu61Jiw=;
        b=IONg/XX1iOViiO1nqAAKPh2YuK5AHnwOYa57zg0Ks+QDvVx/e9oWYk8opGxouDS7xe
         zvkcxS5WiSurgKTsyhw9hM1ZoqVJMfCgLhkIlH0Tn8e+PCo+4TTbTRQXrjERjE6J34Rc
         xJ+aoLizk2yhCdJXb3aoep/6UqpvUZBHg6w5swSr8wtqnqjyPnSTbMBxN+CfJDP5Yl4U
         MThtTJ4WBWZl59nOMYaQSZ3Fv3y5IpisM0svCc/VH81BDB2qUoP3rSpQ6SnBIdC0R+UP
         C6zaxEIQc/DelJF0jyVklcUt7QSwU58NoOIPBBTpFMATnxARTUFofHZ3UGbDr6qSdXuw
         tnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780579934; x=1781184734;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7kgLmd1Eju/DnzGMNjOTAqLfs8KBtASrK9bbu61Jiw=;
        b=R6HfJtx8J7WU5WF9+l4K0NYEPnQ5KzmkO4R6ctZ5UazsoRCKOdGI1cf7XJ+0izGHsb
         aVF+UFdl+mGAcCzT6OmQR9ylY6S0ECwLfbz/ox8WwrZcw/DoX05rCPlrJmWYaiGiDQ83
         wBPBaxOjlX9PiK/Z35f7TCQtDHG6LRhZV8KNRhhzHheaHu9zt106QlraRYuKFS42or6p
         FI+LxyROPkedyP1tzRdvVrcP4/xQN/dVzFYK28ExRYlZGIqy3YnCbP7HVBkTpTql/eeS
         8amr89J9q43c2+1drpSZCoPa6R2Ntni/zHB09UVW30Y+UwEgjcTUqUafGz3iHnoCSKcs
         rQow==
X-Forwarded-Encrypted: i=1; AFNElJ8718OsYi7E0e7Itr2oT04lxXL2Q4mH8IsZSkEb+9MCMJeLaxkdF2D+G/SIBBdqINMphWFbgaVYvwKI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9jZrOrTqL6BheqjNHaosAivgAaF0j/JiU/+SvttyzP0tqWTst
	5K3jpK4jOftAsXrOdMhiBZOWdDYNjOD+I8DwSjo9CSNDMpz14ARPUQ8f8rRZNk0qKoc=
X-Gm-Gg: Acq92OEQpnLL/FSWyKtBMNWzNdu8EpB+JG0wIn/GlzvfO6NJWuW6J/mV7jQB+ceZ0tq
	2WKzOMTjH8UAfcrouW3iilgiFH4vhPDxYxio5s9fec6/eIdqvTCcViHLGZbcGqwjsMtu3k+dH7h
	bB+6Uk9YMMfyVufeh5uEX6G/1hDlkc7nRrRqWvaKZBTr3XePG41wPWiNYGXRQFKPqy4x+2sZU6m
	0a7gllgx/nvlyaDFXWPXa8Zy4n7FX23E/YYBvFItKFqPUfCQX609djIFxLh+n7VtLSb8vDaQiyX
	8F/quoOR1pVU2D94DMOysLepBWxcgfWJB2yDgsrziaCEY/pMqej7PMrxRbmiAK5PK01G33fDzlw
	V1QOXzzNDSl7P36TzxwLpGsjwz+kacXZSJw9P8A3fQsOSyrPOU1irE1AqfZVrbmSn85DTzMnqqS
	8ZEWRoUQ==
X-Received: by 2002:a17:903:b8f:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2c16361add2mr76803875ad.0.1780579934415;
        Thu, 04 Jun 2026 06:32:14 -0700 (PDT)
Received: from localhost ([2a12:a305:4::305d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f85de1sm58805815ad.20.2026.06.04.06.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:32:14 -0700 (PDT)
Date: Thu, 4 Jun 2026 21:31:36 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 08/15] riscv: Add Zic64b to cpufeature and hwprobe
Message-ID: <u52q565xhv5s7gz3wbh4heplhbm4pv732s5kqvf4deiw6ceb4t@n4bnpzu5kabs>
References: <20260603-rva23u64-hwprobe-v2-v3-8-5529a7b28384@gmail.com>
 <20260602232800.768311F00893@smtp.kernel.org>
 <CA+Ck9FbKRM0wjJMg1fQpdwmow8cf_zTfir7V6+T=CRxU+vomdg@mail.gmail.com>
 <20260604-rice-protegee-3a0b8e4cb609@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260604-rice-protegee-3a0b8e4cb609@spud>

On 2026-06-04 10:17, Conor Dooley wrote:
>On Thu, Jun 04, 2026 at 02:42:22PM +0800, Guodong Xu wrote:
>> On Wed, Jun 3, 2026 at 7:28 AM <sashiko-bot@kernel.org> wrote:
>> >
>> > > @@ -154,6 +154,23 @@ static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
>> > >       return 0;
>> > >  }
>> > >
>> > > +static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *data,
>> > > +                                  const unsigned long *isa_bitmap)
>> > > +{
>> > > +     /*
>> > > +      * Zic64b mandates 64-byte naturally aligned cache blocks; cross-check the
>> > > +      * cbom/cbop/cboz block-size device-tree properties to avoid inconsistency.
>> > > +      */
>> > > +     if (riscv_cbom_block_size != 64 ||
>> > > +         riscv_cbop_block_size != 64 ||
>> > > +         riscv_cboz_block_size != 64) {
>> >
>> > [Severity: Medium]
>> > Will this check erroneously disable Zic64b if a platform does not implement
>> > all three CBO extensions?
>>
>> Zic64b is mandatory in RVA22/RVA23, which also mandate Zicbom,
>> Zicbop and Zicboz, so all three block sizes must be present on any Zic64b
>> platform.
>
>Where do you get that conclusion from? That's not how we treat any other
>extension defined in the profiles spec. My understanding was that even
>if things are defined in the profiles spec that they're fair game for
>independent use.

Ok, I get your point. Agree, Zic64b/Zicbom/cbop/cboz can be implemented
on each hart independently (at least spec doesn't say no). With this in
mind, the validation of Zic64b should be like this:

     if ((riscv_cbom_block_size && riscv_cbom_block_size != 64) ||
        (riscv_cbop_block_size && riscv_cbop_block_size != 64) ||
        (riscv_cboz_block_size && riscv_cboz_block_size != 64))
     return -EINVAL;

This will allow :
1. A Zic64b hart with 0, 1, 2, or 3 CBO extension and block_size 64
    passes the validation.
2. A Zic64b hart with CBO extensions but block_size is not 64
    fails the validation

Thanks for the catch.

I will fix that in v4.

BR,
Guodong

>
>>
>> And architecturally, all the block sizes are one quantity: under Zic64b
>> that value is 64, so the three must all read 64.
>>
>> Anything else is a misconfigured DT, and the kernel should not trust
>> the zic64b it claims.
>>
>> BR,
>> Guodong
>>
>> >
>> > If a hardware platform implements Zic64b but omits an optional extension
>> > like Zicbop, the riscv,cbop-block-size property might be absent from the
>> > device tree, leaving riscv_cbop_block_size initialized at 0.
>> >
>> > This unconditional check evaluates 0 != 64 as true, which would spuriously
>> > trigger this error path and disable the valid Zic64b extension.
>> >
>> > Should this validation only enforce the 64-byte size if the corresponding
>> > block size variable is non-zero, indicating the extension is actually present?
>> >
>> > > +             pr_err("Zic64b detected in ISA string, disabling as the cache block size is not 64 bytes\n");
>> > > +             return -EINVAL;
>> > > +     }
>> > > +
>> > > +     return 0;
>> > > +}
>> >
>> > --
>> > Sashiko AI review · https://sashiko.dev/#/patchset/20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com?part=8


