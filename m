Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.125.188.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793796214;
	b=JqqTE7knylsxKw2SLvtaRu3fxfGCCQOI0Q1C5nIABDQfE4auDZPY44c+G2RYTryGmmTm
	 xHWM7fLKIZ10BpKvn+z17sWqK51hvOxZrFTfCczvE1GesjGuJRJVS7bSX4tyJDk5VFLuI
	 ybfhLdw3p/O4we0OKpLrRvgmbjtQi+9hw3YdsJBYDl5T+76F/or96opZRC0JfTMmMNvte
	 z8VwoSWkVJUoNnXaGqpnbPsLXCUoUvm/O2AsfjA9V3OlsXGQAEl1yFowQw7pjtLGsYzUn
	 y697frcd64Hx340ucJzBOFhQSijrypDuKx+YHCDYNRIMmU4ab2bQgbj7C+/fN+3fyew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796214;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=KGzmHEtMcujY3rqdKLq4G+eIWN6ovjCAqdXSAfenRsE=;
	b=NcyVFTam65hWOhpVx6LhAbtvC1wNfoGEKE5mVfsa/f4u8zmmn0D3U1k+Rn+d79ijQB3M
	 AdxaAhxVmn7cyo9CJju6NuvEzgNeyx3zM5UtczNCKUImCX/YCtj617etbC3DabgJ6vIW3
	 OlbL3YHleklXbIM2BmjsV83OhZFkX46Lmx5Mj86dp3oVfvZ8JIY4kfiuRoGQH8vOOci4W
	 8Q/goWk2LlvchgBXzylABefwGevllprEWs4DWYGwJtniUXxeOskIREfSDDyPOvaL80i+A
	 lG4yegA56BFFj89R0cXJZ2jweGXYeUlmHoE0rVBixppaTDbTJuehW4rtXMBwbu1PTKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=hXxZf016;
	arc=fail smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B298606A329
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B298606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=hXxZf016
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A68BA3F698
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793796210;
	bh=KGzmHEtMcujY3rqdKLq4G+eIWN6ovjCAqdXSAfenRsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hXxZf016eSpDLt2Tj7WemwTlgaYoJAkq6Gnn4YR8wAPGuhCc+DaizT+tFyH5FtiwP
	 4yNQ8o/4FWDplsPakemx50DMT29VDiZkDd9BJqKKne8N7NV5O53bS2CX615y52/Jge
	 Yu3T/n82kd7ZtvUv7VgzaWNDL8iWRANQ+nElMcskVKWxS/H3B7trM0SNLLW9gdD3yp
	 2+VHx1lf8Zuv9EptTCY8/iFUY0NIuVYqwitq+tRZErxXC+7AoSEg9yY4iPMGuRyi3n
	 LogNavYInIaRxf4jI+m//5nIIL1h4jWCbjOKxVbMNlqtkiB1xeBryqSGaeV5XPM7EV
	 CkPC5Y33prVGPJwW9sFZUTDaX0yEF0rsGzkswtNgvnWuZIIXsgof2LuzOKFBc+8EXd
	 ygJVRQjXuEqQi/kpioA+mVrsN4A1V+RhkRwQEQNFa/5fYnruPqNl8WtapgOE3cYl3d
	 K21dtAPA9MVslCuTjnPYv5wc8bScyhyYbB6WQvTO04/37hhKTjNpoWNodlHwE4Zk+o
	 n9dxpNKaTc4axn8y7H/MaNnv2ylzzZv9EAHeSNO5XmuKYzNLEn5f7PoFPtTzKv/nke
	 oAmSeiXFTqlZ+OmWrOo/oCPS8eSdxCNEHGRXt3dt4+ZvPyu+Oo6o0gDmQUZsEjszrU
	 Fl/gzuqZEr5HcLMdtNI9ZkQ0=
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b56a350f2aso368029a12.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:43:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793796210; cv=none;
        d=google.com; s=arc-20260327;
        b=CevSePYikETrlBvtC/u2dlWmewY6MA7XmaajKO/Oi6XWeqDB5ss1zuWRAqu1ZMoKPE
         /n1itLLO0TiOQoTacL+gy16aTaVTNsBmtmjAdUxypyQn1Sm4X4zNHu61JijxxpbOW9Wf
         698Hl8a3qWcY3VnRP0Y1e4wU8vjOfJ55+PuXbW+oaAQYSmuAVrF7/DEpqBStGQ4DiNth
         ByAo/VhtZIsyS6ATO9G8Vd7J+Uyy4M36fHVyue7SiqM294sD8UzBYiDs/4NObMJ0Srrk
         Zm3udklw3MwTBxEz8Hb3SxCmD3c0xlNF5ZT/aoe0YkS1xDP+tLnu2C7tuOOCqCGb7tsB
         iwUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=KGzmHEtMcujY3rqdKLq4G+eIWN6ovjCAqdXSAfenRsE=;
        fh=6Kmq65275EMeftbaRDsr+7XbAZ7EPuH+mJdh5oruz0E=;
        b=Yl5n4gQUctO5nF2ArXR0+US2GYX+m0VZFi9zd3q1oZ1RsAxQZ1/EuoCKA0MPHrILEj
         xfgaVFPSvg/zGaUyNJMr5a2vR0wBxZ+Tk0Rq9F2KWO1fiHRWezF4n38KNiYRT2Ap+tVO
         1KKNrifQaHSNj/sMRqajHt26hcBabx//Y+h3ZYRzr/HztidyRlybOSQmZNnIX1MuI+Un
         /OprqLDx7wm+hh1iDSqUdLhFMHLOogAkOP4ENEbpTAyTH96B3cYXfG4b8baS36LREHhy
         nEvkfOVGyd++m+zuDc3EPvM0rcasOzH9xwfSTWpqFRlG++eIUW1HTrSBn1joNne8jTvF
         gGxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796210; x=1794401010;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KGzmHEtMcujY3rqdKLq4G+eIWN6ovjCAqdXSAfenRsE=;
        b=nnqvFqQrnNgasZTgYgcgvQFubqhSJR+Kf0ilTvLIU9dxeMjZSH4mdbuUxLUwGB73fo
         KWT89mcOsvZK9HBh1OKGubBIKz1IKTUaYwAIOGUIyaUNhdHr9HAwlayknULH76krSSZ/
         +19e6IT1uN19irDS7gStOnySyPMOiC44wFx2QTnlXvH7OpQuTPx+fD27UtfAKDSUp1Ey
         xNCfgCh1FWIcEV+Se/fuJSxZv8msg2QE9HbeM+V/rSB/Z1Ug2e5PUKrwhtGr37I1nuLe
         6ZUvrYAufRPzba9R75dQ07BEDSH9i+TTqHQZpD91uFdUnbGt5wf6lmREXthtk5oAPkfm
         zXIQ==
X-Forwarded-Encrypted: i=1; AKwUvByNxB1VCFPL7JSoWx3EFfh5LcNC+lApQfYkMGxMit2Q3yecskLbDo5x5AYssaVPwSSr4a4+SDU88I+k@vger.kernel.org
X-Gm-Message-State: APuU4Z+68xMsr7IT+mMmvGyDw2JbFGQykeF6dKruTz8IP6JpP2pVbv70
	C2lTcoodCTIIRlDzQbAHSjMOLo8A+J/ngMNq2KNx1BPLhxv5OMiOB4A5QfgTt7r/gdlGx7BYITt
	bY97kwou/tpsRHxYoEIVHp2cSUSeEybdIK9UCKKNUhn26yq66Ar3FQSPhPv+kTY4FBAjZsx9vuj
	nV4mmLA7hTh3YmNeGGLQaJ8eK+VegkrvRA/gnCh3XMZcI+MCaGHFqQRNiLZLnVqwC4t1c=
X-Gm-Gg: AYBFou1ubKBLiAzq3EDi4+bcn9J6CoeXCYS9fD6T2UaaCx9MWhSBNK4qk6FwJJ3Nnp/
	jNa5mb8JYKcBVk3LAtqtzHmMgvInBVLxr8d1uM2l3+qEdQftFSmCsf8CAIeFtPXxc25MqeemfjJ
	7kUGQrbsa6imYpzrXIE+LMQUM9s6PEY1Sngud0cvN5MgVypfNUFoXEJSVvze+5YZi/V0+G5VoTC
	l9FclgKV4toSA==
X-Received: by 2002:a17:907:9098:b0:c31:c767:ae0b with SMTP id a640c23a62f3a-c4cc31d0c6amr700109366b.0.1793796210248;
        Wed, 04 Nov 2026 04:43:30 -0800 (PST)
X-Received: by 2002:a17:907:9098:b0:c31:c767:ae0b with SMTP id
 a640c23a62f3a-c4cc31d0c6amr700107266b.0.1793796209840; Wed, 04 Nov 2026
 04:43:29 -0800 (PST)
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
 <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com> <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
In-Reply-To: <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 4 Nov 2026 07:43:03 -0500
X-Gm-Features: AclHuK9NNW0S9qfwpVQn7uKkEb-AwCUJMy4Mu66BWXEGz1K_BfAONgexdW5Tcwk
Message-ID: <CAJM55Z9nuO3MneQqBm3K2V2SjOXqXsZcDx9pMzVhxMJJ73xc9Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 BS01DCMA support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 13:21, Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
>
> On Wed, 4 Nov 2026 at 07:24, Troy Mitchell
> <troy.mitchell@linux.spacemit.com> wrote:
> >
> > K3 BS01DCMA is a board equipped with a SpacemiT K3 SoC, 16 GiB of LPDDR5
> > memory, a P1 PMIC, an EEPROM and QSPI NOR flash.
> >
> > Add initial support for the serial console, EEPROM, PMIC and QSPI NOR
> > flash.
>
> Hi Troy,
>
> Thanks for the patch!
>
> I just had a talk with Dong from Spacemit. He tells me the BS01DCMA is
> the name of a module similar to the com260, only it has a different
> form factor and each module consists of 2 separate K3 nodes. Similar
> to how the com260 module can be used in a small carrier board
> (spacemit,k3-com260-ifx) and in a 10-node server
> (spacemit,k3-com260-tq), I'd expect to see a
> common arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi describing the
> module itself, and then an
> arch/riscv/boot/dts/spacemit/k3-bs01dcma-<something>.dts that
> describes the extra peripherals that can be accessed when the module
> is plugged into the server.
>
> Unfortunately Dong didn't yet give me the name of the server using the
> BS01DCMA modules that they showcased in Shenzhen.

Ah, it's called the Cluster Server RV2768
https://spacemit.com/community/development-kit/cluster-server-rv2768

/Emil
