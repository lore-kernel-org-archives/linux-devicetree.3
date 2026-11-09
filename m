Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794222648;
	b=ErE04cxLeOp7qCV1zfCtBDDfGWEf5LdMKWU6xE8ODdU8AHvSFiA89GHuVW1Z8AkBpZgf
	 18cmE7dbekik5d3FpL+XEVhcqvZUPUbfhEnZCAR8D2oWULe1ifRNayDOw+Ac4cyuwuWY5
	 5Urz2QoPflI84AKLETYm+axT0Xmenn888J3dwog0qTYP6HQL0FhuNLUTcVut6aLLNl6qs
	 IKu7AbHT1b5RHPO9OOp9m1GHhTOn6hYfPO4rWdiKelFcL67JDNwI2q7HVeZE3SonPTr+u
	 cZx1NkkTZb3MYjw2bepAiGgvvH8KaCcOls+5ZWJHL3XJDNSohOP/kmJCQIKLIaRr43w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222648;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=llvqyMiXnc/47moE8culPRvGGeNKWMoMtXMZ7VTfmpM=;
	b=Mr50DGiZGiq2KXcWbLfVjh1BqZcXL0EMekgKegLYwDaHp1cSypD6/5qMrjrV8FbEGRmL
	 06q8fjsWUePonINw5R9lMOhmu5fXzDgqsiPk39XOMkHTIlN6bcEmr19uL3FUzsZW4ORI+
	 4ThNK4/8tI+7i9LAbui+I9vKpGMhSpVp5B3WJH2MfHwmb0QSWeBexsRUyTo2Vy8I3uHYW
	 NANtRG5NmObE3FJq4lzVVLbkG3RkqOHbD+0BNZ4zUBJgB5lpg4gkl60XhMxj2fXgD12jg
	 JYPyCjpnrfq+SdbemFHTSRwlMDjYVZV2NKRqavVi8t4jL2A0M/CGtvdJXi1/jPkTPNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=gIBDzuPv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9F8606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 11:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C9F8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=gIBDzuPv
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0A67A3F342
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 11:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794222639;
	bh=llvqyMiXnc/47moE8culPRvGGeNKWMoMtXMZ7VTfmpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=gIBDzuPvH+QScNAMaxgwaVd+Mg/ehtNmKsE1qqKLNC53M4p+VBwEszBSHlJXLTc0O
	 qJa9BNDFezlzkhJfzQ3DXlw2Uy6FV2m6gRcUq+LDpZsx5BpvZz0xKmSMWWqluzVwGG
	 oYXI/E6lx7KWuebIBLaiO6RJQavGA8ljaPxYvSN4ZfLqNWhD3aGOjeoaNIM+W9JW3w
	 p5Rp5/dc8/TPUtADXVGylQggx8ABOO9lLcHi9RmOTf84WNkrrakHLWj/oTNxdTGisc
	 R0Qi6dtvJ6E/8uhCvrhB8xiYA5i3ls/HUPVwHx7ZCckBACt43g1yk36HaR93/QtQqB
	 /xQ6Mf56EI1Y3tzYW3tKgP3uQ0nS3Dbql73I9OMVoO/9A/6w6w7Yq3Wy74aRdc2UA8
	 4/0bZkSjZVU9LXTYfqUbinGDxPbj2NTQKb6w/0Fj06Emkw9HmUge5vFPdR9zpEKJ90
	 SVqtneDdZF4rRfA9LJNhP9iMj0UoRLHJIlKssTeKuicCnQRpR5fzsUDamDygsi1OxI
	 XK4kxznfqlZ7fzvp5iZjgJ8/1rKrDebGiCPrV8XPlplvS0uZVhswk2DvAgbTzv6QyD
	 PJ6DeqfNUFn5QKUxQLNHbxfaSPXWtWGYA/DLKRZOsKItzO4GQS1BIgdWYX9Y9H3Tsd
	 6Wq2npLQrXhjAr1nF1BMjd+M=
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c210c66672eso81934266b.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 03:10:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794222638; cv=none;
        d=google.com; s=arc-20260327;
        b=pg9DnBU54cGky6ijQxtKgUa7ezXBYKmp5KhxjXfGJ5/8WPt6Uf66vZThpS9w86Jhn1
         xg0qH9PhahKDooa8T68pgFhpqyLs/KqPRscsFWVpqfjXx8OmlhFUhRg45rDbWT9AdIym
         0nk8/tkou4JOLTZ8JCwLMtepvw7u/TALynekiyLFCI/5gj/jfu9xLMzY84dVbFyijvA4
         209IljJW2j8Yx9vMA0o6gJw1YQTV7MUopQl0i4BGKjQ/FcMD0D7PqqDxE5a7zYNopmJq
         Jdta7eN10Jzw+fYq8WqIzRGR/phAUfanv+0CW3Kf/UPYTpm1C7Qi57A9pi1jEV2H/wP9
         V9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=llvqyMiXnc/47moE8culPRvGGeNKWMoMtXMZ7VTfmpM=;
        fh=k9Pu0L6zj3JBMTOmZOv1ZPyMfgspzt9QOcO7NGyhRpg=;
        b=VXPnQ2ZWHcL2bdk/YD3SlvvPJRNV/RWUmFNqcPRxp7AY07DYVvwR3dBdDtZs4k9yf4
         3Q1yfi2zSbpidJoCWdL/LA98+B69GiMZoNPzhGxKx2WlzCGKH1lBtxC6hNC6EO8KrVPd
         rQBabUznGRDfMjCYV5cU9hcPOEtNBuZbCMTPoTd/EqRQlce3vctwiVjXHEoWWFryoVqw
         D9fJfiDCk9d4aZgaHdYglsbd/h1mOWSDI6aj+jhKJwtEz6jkxjDdeqIjkVXkcy0V8Dbt
         4iiEEkqWexnRnCjpWNqhZxEc4CVipRyyKbA+zbqd/e4wBRukH2G1gK3kPTyFqyu/4Z65
         xp4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222638; x=1794827438;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=llvqyMiXnc/47moE8culPRvGGeNKWMoMtXMZ7VTfmpM=;
        b=WSOEcSTlRtX0jmLLg7vLIzWhr0ObJ1QpMOuN1KQw+mLgDxVQDKDBYefp1mmghc3vt4
         KBagxpmM/uNoj/5kRaQplfW/nssnHS1nrU869nsvoaQ23oprlgbW+SFN8a0i/bsuvpdH
         Bt5eNDKRK5Et49oaHffVOiaWz5odxF+U+LRu/amie9ZDaASuaiQBWDo4KY8bUd/cWmHL
         LBBawmBBDTCrZYV0lG8tuaZOTiy4/DeoViX0Y3ZwB3dLJMF/L5BP0cPKIkFL3NdjMny+
         ojC4dmIxkpQTpnpghYxJEUiVlS37dDVurriVJUx6ZNqq+tpVzFqkSs8yvp1EwHUIwpvY
         5qRg==
X-Forwarded-Encrypted: i=1; AL+hErFM7XlyrZY4BYK71sF9T+m2qUOkVfG7Kxs3UFCZU1crn+yTegOV2q41Q0vFTSLGOQzfBrsMaD+Q8my3@vger.kernel.org
X-Gm-Message-State: APuU4Z+iYNldZd/zI5HsfLH70dPO1P5KVpoGHKj/ANJsWPv8mOOmKz9f
	UaW1a+u4y11DgZP4jgGCXtWMM3AL7bV3xdTYLADF/tka/4QXLHg3vv2sOghFQ4eacWZ7FCAZ3gd
	2Z9skIzA89gZ+T/8r7UXZe/A9AGsr9FDUva6+z1FbEAsrEEtHXM3ymWPjzmqzvlqzfwXKQuV+VT
	UVCnOewX4G9Ucd9YNMQGnwtnzkxJB6A+d9MwucgnazH5EmEADPqleGF+UrloTSa8DIxYU=
X-Gm-Gg: AYBFou3KNSyyhE2enR4JFYEIki2SovSinO0UlRVlyAN4YxfR1veb8RgC/9OIEwxiwNt
	+9prlOxoe7cqI+vs2J+pvj4AD2E6Z1EoMaz8ov3WZjzb7PyZxllQNUYA6dlBDaSN8JCx3Z+cd/y
	DJ8TblcDmid/n2mhz0QZ1FotD+nt5df12uTjO5DzXBnZPvpZkDgs7x+8U=
X-Received: by 2002:a17:906:f591:b0:c41:960c:8c62 with SMTP id a640c23a62f3a-c4d6daf39ccmr262302666b.30.1794222638456;
        Mon, 09 Nov 2026 03:10:38 -0800 (PST)
X-Received: by 2002:a17:906:f591:b0:c41:960c:8c62 with SMTP id
 a640c23a62f3a-c4d6daf39ccmr262300066b.30.1794222638061; Mon, 09 Nov 2026
 03:10:38 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
 <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com>
 <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
 <CAJM55Z9nuO3MneQqBm3K2V2SjOXqXsZcDx9pMzVhxMJJ73xc9Q@mail.gmail.com> <DMNTD3S9CNW1.1H4CMNHDJM69D@linux.spacemit.com>
In-Reply-To: <DMNTD3S9CNW1.1H4CMNHDJM69D@linux.spacemit.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 9 Nov 2026 12:10:10 +0100
X-Gm-Features: AclHuK966um7PTpChOfRAdNHmU0xq_O_8ADd9fyC1m0kLv_yr1nWEQyElP2Eazg
Message-ID: <CAJM55Z_HOuvxNmAi2m3kjtQ3tuYEDNtfyvrcb=F-Z1p6K1VSCQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 BS01DCMA support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 04:39, Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
> On Wed, 4 Nov 2026 07:43:03 -0500, Emil Renner Berthing wrote:
> > > I just had a talk with Dong from Spacemit. He tells me the
> > > BS01DCMA is the name of a module similar to the com260, only it has
> > > a different form factor and each module consists of 2 separate K3
> > > nodes. Similar to how the com260 module can be used in a small
> > > carrier board (spacemit,k3-com260-ifx) and in a 10-node server
> > > (spacemit,k3-com260-tq), I'd expect to see a
> > > common arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi describing the
> > > module itself, and then an
> > > arch/riscv/boot/dts/spacemit/k3-bs01dcma-<something>.dts that
> > > describes the extra peripherals that can be accessed when the module
> > > is plugged into the server.
> > >
> > > [...]
> >
> > Ah, it's called the Cluster Server RV2768of much
> > https://spacemit.com/community/development-kit/cluster-server-rv2768
>
> Hi Emil,
>
> I've checked with our hardware team. BS01DCMA is indeed a module, so
> the "board" wording in this series is wrong and I'll fix it in the next
> version.
>
> I'd still like to keep a single k3-bs01dcma.dts though. The module is
> only used in the RV2768, and that carrier is essentially just cabling
> to PCIe network cards. Those are found by enumeration and there's
> nothing else on it for the K3 to control, so a
> k3-bs01dcma-rv2768.dts would have nothing to describe.
>
> Does that work for you?

Honestly I'd still rather have the k3-bs01dcma-rv2768.dts. It's hard
to predict the future and I think having the extra file is a very
small price to pay compared to the confusion of having
'spacemit,k3-bs01dcma' describe the RV2768 server and then something
else to describe the module, that's actually called just BS01DCMA if
someone ever makes a different carrier for the module. Also it makes
the physical reality of the RV2768 being a server of multiple BS01DCMA
modules more obvious from just reading the device trees.

/Emil
