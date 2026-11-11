Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794373479;
	b=Wj4l+vCm0v/dmlMwhB5hYslR+mhv6hO91CrC7ueIrXyknZSXTLCCPk33asBt0n5tbhzl
	 lqjqBWKnwXnQe1HlbfHHf1V1LdW9G+tLsWu/o+JazBKR5+ua0F9gUqk5ZDrAw6JWpgGSp
	 Ld19NMjyX96p/pH23MIupHdxci3Nxx7OCl6askA5rp2E8AgRL6ngfQ0E4mrBNrP9pEVSO
	 GZbkpthn0N0udNh8xG7jzq4qk2c0O+fko8sF4sx9jTZN99ZXlgQ9uzr4jZl8ZfzDlJLL+
	 xSWrGs11c71k4vQyP60fJ5vQGIxjR9nMy5xGQuFhvIn8D2m+7S2AM2F90yuYWjsQlNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794373479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dzo9dmdNDZyvRQ9KZAx2Ucn8n5volg9HRvYG93blfog=;
	b=q8W5XoY8NuGsYHnGEHPbZf5KytW9vZDzrEwivNGAHxHDOE5JH5jLldxEdvP/Nv8ZER5i
	 BFJQsv5xHO8axcXp2Y4Z5V2tdwkuYAziLVf9uYdsbS5QKEZUIILwSN44Yz4IPx/Uk2cqH
	 FqpvWqVmvWocS7ZrAViDjP4vMZm/zcSBJDDyp9ATcQp70+MQw477zd8bxUZMNUMsxDWZ2
	 93gsmQo8Hnkn4LyAE8gms3TRA/c6OUUJC2ytI53mYETgsYFvHpU+soh9fkBtmDNfkcpKO
	 iNQQrlXVIslA6vLEw1XJGYb1CD9FucNK+nycngYgWeDeQYDomT1mwbBbokXVAAzfQbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=jms.id.au;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=A7WperUo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731CA606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 05:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 731CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=A7WperUo
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b309147589so30656107b3.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 21:04:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794373477; cv=none;
        d=google.com; s=arc-20260327;
        b=I0iacf1646SXnfDigCTXltzPqXYVksiABhmIdr0/dwz3DsHs+zSGsqHB0QlftNS7wz
         bTw+Es8VQE9xndL+Ii81h1JVLFXSwvVI3jzfYzMcpAlWDKWPQlut9K2CmebTP0XS4w2c
         j05qSPOyyYMdEL+3soqjcNQ420AOUchNTn1pjTKupc7wdVCmw8whdkvYnYg+YwuFUKC/
         FTWNFEVcKqsQQTNJt1WcCezQCEuseFYdhd5GFODHdzO0KGUjxyEXsQiR19S6Jpn2MzH/
         0sFI1Q7PbsobAGAKm6iyNMkkvGe9gABSCmjES14ZVPFWMVmYL5G8faK1p/GLWM4C7JRz
         cuQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dzo9dmdNDZyvRQ9KZAx2Ucn8n5volg9HRvYG93blfog=;
        fh=EvvAuIqdN6z79MiWyP9eBgNQNhh1e7mFxY4QyT6HiOM=;
        b=HeNPLyIeauRbLvcZdaJf73wJdGHTJu21Nh9UfdFYzSeyQwxUz5ZzNQX4ja0sNBuCDz
         40O6ZgRxBGuXUIOShwiRvVLSYcJswl4xt+mU+nSTq+NIlyE38OQ6SDEkarXlg74vCKj1
         WcSMPgZAhQpFMO4czQMx29NuY3U8k0+K8mh8rKEf3yrh7toj+WIOaBMrgYJHUn0twl41
         DdNkoPgjVgl3iRGKDfuCP8f78U3KES/PG4UvGvxfbCaQJgRf5yhGks63NTLeo5M+FSeG
         c2zL9Naf+ENDDy8R6ztX1o5F9iUdzOkHwUYzK/wioYa9n6cDj1q8sO+vuVvUbQDiyMPl
         Jzdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1794373477; x=1794978277; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzo9dmdNDZyvRQ9KZAx2Ucn8n5volg9HRvYG93blfog=;
        b=A7WperUoDYEvKK0LL86ETC43o88EhzlhpZ8Q6JHj8Y7Xixv/8KDHB82xg7sxHVQUHB
         ZvjtSUZi8E1TGlMbnfrTwamHux97JZdaIjcOhJOLfgqBUulZQ6mfdmPuxO5OyWTzxF2t
         WFH17tdDaauLRMlW7CaojpActAXufV6rVI270=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794373477; x=1794978277;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dzo9dmdNDZyvRQ9KZAx2Ucn8n5volg9HRvYG93blfog=;
        b=0sUPUYTOR1zKvNvlWGdKCWywzIqirTT8ev/TleIM012KSPCEFwNygV2pD+7+8T68tA
         Ruw56ov2Ah+8V0aVf8rxs9cVJD3MNLTA4YSGT9q6EIO+iEgCQYgGN1pEJFtao0h1EM81
         1sbcrtMWgKy7SQZKDfVafphIdTWweAu7oJUqSuClvEm482dri23Hmct1gv8oCL7KiceV
         cb2K1SQFND8vJYRr5jVL9xJNzmK8Z5DPP0kvImZTD6yCctkBM97UvcaF/zjn5jf2Uu7R
         e7b1hoKdr5gv6bV5h1lwyBbi0KvyjZXN5oSgXroOmOOX08LDqYQ8FyUPbx8QI/sKa/fc
         npDw==
X-Forwarded-Encrypted: i=1; AL+hErH6lliwIluFxfsedpiWULVMBTNzzeowmHKN2fDHGA88zr/buyXRaoPGOVki7BUGf4uLd+dRuFOqaWWp@vger.kernel.org
X-Gm-Message-State: APuU4Z+L3mUwOANuir2e9VVuDmDgIbOZMjhHHrDqboIv3DXCi9ySAQT5
	a1my3iS7HN4PZ43l6o06RYLt9l3MpFSZpiybuQAbvbtIHA1l7DeHqqPW0xsLHy3gW864+zlEOII
	HuLfS8UqAq0J8xgOmTZY+C3QMqYZh6c0=
X-Gm-Gg: AYBFou20x8D5k7zEt6vqBnG68l73Lz4NCxIEzviT7J5zx5g5tFmtSPbO3WDjKFtrHH6
	2pQTkMnBnlaWlhzcpqhaL0HQB0vtE+b/R8aSvF5Glwylpxt/VNPZO41+pYFRhNMy3Nv1P2elBJj
	ObkQCvE/y2G+N0xqwfTGFLCL5Ilys+ABYdGl+Zlk4QWhv7Iuit3hiitwQFhk/Xi5iFnZtmd1gXd
	C1CTEpSb6GLMC1W813fbd30+upPV1wYJv+pNSoQR8+6aJB2ut9oUD6ctp5PqD6bKCo2PKRaNcuj
	/zuszVxdxc5qvN2jFJDjp5eME3EJjT7OrVOjTc6IL7L+CuX3N/5XeflsB/m9wk+aAQA3hjAnFpo
	q8AxlbP35gJRpxtz44aJ/My8bMDjdwY8Oo9kHnXNX90IUj70E9QwlPC3NDls5JQLqqjAPiYQmww
	YGNsZCDQdaFZ6SxFQG+Ge18mHNKx6tgs3zA3ghJuPRLOk962dFmKm7jxQL
X-Received: by 2002:a05:690e:1918:b0:677:c18f:7257 with SMTP id
 956f58d0204a3-67c67f1c881mr1305926d50.23.1794373477351; Tue, 10 Nov 2026
 21:04:37 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109051050.105623-1-joel@jms.id.au> <20261109051050.105623-5-joel@jms.id.au>
 <20261109-jester-zestfully-a664203cfbd1@spud>
In-Reply-To: <20261109-jester-zestfully-a664203cfbd1@spud>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Nov 2026 15:34:26 +1030
X-Gm-Features: AclHuK-i1zsgez-5VzJXCYD7r7Wts_rzqoCdOsoACfNxyvK7FbXBp92FnWrhYDM
Message-ID: <CACPK8XcnPb9oMQq4YpNFG+RznroP-647E-_O5j84OW_YQ7P=9Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer bindings
To: Conor Dooley <conor@kernel.org>, inochiama@gmail.com, junhui.liu@pigmoral.tech, 
	aleksa.paunovic@htecgroup.com, chen.wang@linux.dev, dlan@kernel.org, 
	guoren@kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

+cc people who might know more about the various hardware this binding supports.

On Tue, 10 Nov 2026 at 05:59, Conor Dooley <conor@kernel.org> wrote:
> > +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml

> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - tenstorrent,atlantis-aclint-mtimer
> > +      - const: riscv,aclint-mtimer
>
> So, what are we doing about thead,c900-aclint-mtimer.yaml?

Once we agree on this binding, I planned to submit a change to bring
over the devices that implement the common binding. I can do that up
front instead.

>
> > +
> > +  reg:
> > +    items:
> > +      - description: mtime register
> > +      - description: mtimecmp registers
>
> For example, I note that you have mtime and mtimecmp in the opposite
> order to how the mips folks have had to add the mtime region to that
> file:
> https://lore.kernel.org/all/20261103-p8700-dts-v2-6-3ac5d49f2c37@htecgroup.com/

This is the order OpenSBI has used since v1.0, when support was added
about five years ago. It reads mtime followed by mtimecmp when there
are no reg-names:

 https://github.com/riscv-software-src/opensbi/blob/v1.9/lib/utils/timer/fdt_timer_mtimer.c#L79

QEMU also generates a dt with mtime followed by mtimecmp, and without reg-names.

The MIPS ordering works because it specifies reg-names. OpenSBI uses
reg-names to parse the reg property so it would continue working, but
u-boot takes index 0 as mtime and ignores reg-names.

> > +
> > +  reg-names:
> > +    items:
> > +      - const: mtime
> > +      - const: mtimecmp
> > +
> > +  interrupts-extended:
> > +    minItems: 1
> > +    maxItems: 4095
> > +
> > +required:
> > +  - compatible
> > +  - reg
>
> You've also not made reg-names or interrupts-extended required.

That was intentional. A mtimer device without harts attached won't
have interrupts (opensbi supports this), but I haven't come across a
system that uses it this way. I have no preference here, what do you
think?

> I think we should swap the regs around and make these two required at a
> minimum, but also "initialise" this file by renaming the existing file.

Bringing over the other devices sounds like a good idea to me. And I
appreciate the spelling.

The nuclei/anlogic boards document mtime[1] support:

 - nuclei,ux900-aclint-mtimer
 - anlogic,dr1v90-aclint-mtimer

K3 has a mtime register (at 0xf181bff8, by experimentation on hardware):

 - spacemit,k3-aclint-mtimer

MIPS has it, as per their patch[2]:

 - gf,mips-p8700-aclint-mtimer

Note that MIPS have mips,p8700-aclint-mtimer in opensbi.

T-Head has no mtime[3], just a set of mtimecmp registers. Sophgo are
unknown, can we assume it is the same design as T-Head?

 - thead,c900-aclint-mtimer
 - sophgo,sg2042-aclint-mtimer
 - sophgo,sg2044-aclint-mtimer

There are two options for T-Head:

1) Leave it in its own binding, because it doesn't have mtime registers.

2) Use this binding with an optional reg property for the mtime
region, which means putting the optional part last.

If we go with 1 we can preserve the mtime, mtimecmp ordering, matching
u-boot, opensbi, qemu. If we go with 2 we put mtime last and make
reg-names required.

The current K3 and Anlogic current device trees would need an update
to their reg property to describe mtime when adding the riscv
compatible.

I lean towards 1 because it reduces churn in firmware.

> My ~assumption~hope is that all of the devices in that file have
> implemented the aclint spec at the -rc1 revision that we're citing here.

(-rc4). Yep, we can move the majority of the compatibles into this
binding. The T-Head family might be the exception.

Cheers,

Joel

[1] https://doc.nucleisys.com/nuclei_spec/isa/timer.html
[2] https://lore.kernel.org/all/20261103-p8700-dts-v2-6-3ac5d49f2c37@htecgroup.com/
[3] https://lore.kernel.org/all/IA1PR20MB4953D36ABE26822B62415500BBBBA@IA1PR20MB4953.namprd20.prod.outlook.com/
