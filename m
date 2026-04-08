Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2582E8DEA
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640286; cv=none; b=Rlc8IEmxbHHu8DvagbuIRonjQJQWZMQOVRLaQAubZp2zWVPschcSBYbk/vtr6RQvepNvPpweLATU9NWWUl20RBiZ7DY00AIyj0enHOphmWL881XNOgfz8BkLgdllepB1WcnTQejLaKjU9DuQ6iKHp/WKGC8kCn1M45s96aT7fm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640286; c=relaxed/simple;
	bh=JpFBtANlHFLqTT9JbgLXyc5p9fBDr1N+c0sFD/XXXzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKAqyqyi8yROsNp4RnqUKKg9SVqqJwmKxPMvfjmEqw5C0B3IvefPcEP6cWLXIm8MRxPo0MtgoWgvhc2OYgKx847WlrsC2O6e4zZkslkwt1vxWS/JKvAxlM3ifzvd+NnLjNfzeR9MH2LUoHQlcfg+sNQcb6XfpUMAJpeNBLHqn2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hA9eY2sK; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hA9eY2sK"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso3899170a91.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775640284; x=1776245084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HGv1dXjup+3rq4irDVbSLxpx15FcV/deE0cr/bXJZ2A=;
        b=hA9eY2sKJMZua6qbtQVS6ENGTjW2RR8C3+zUVvV5vGzMVlSN879Eb2ozaHDHxbFJbe
         LTXrT2nLpL+U7cu+qgaHIGjPxk+K8imR6KR3V5+z6bOsvjeiFgL1KcNVBvk8Hm6QgeIQ
         txwzq+2f6lQAs67lIOck5TgqfjXKMeAkCqo8z8Rot4VhqMYTKvuB2zrKr9ATUH496fBi
         JYn2uIR+ObVlANRAMNDypARNvXSwxxjcF6pjMfEUNyVKApMxqgbIFY4TrxuJvL4LC1Tb
         pi2x7O01BoMjg2QnHPfB2NTfvE8Ej6JMC1PGPR60TeZFRv6MHytyaYfv2jjo4KcG9j23
         ACJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640284; x=1776245084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGv1dXjup+3rq4irDVbSLxpx15FcV/deE0cr/bXJZ2A=;
        b=B4NtcY76f+d8n9Y+AsYj+rjPNSBi00U+kVNV1Js+GEJivg/vnD7c8eevUPC5h4sdKy
         DMqG3Lpm6CaeHgIdiat6dDXLi46+MaHgUkPhYO5Cj3a4CSLFmWctp4QOUoa/1hU0IkM+
         z3JvGZN/TVyMsI9Jhql/jUdCovMte9fWc1vPYcxeREIpKOSkWZV0OMVHyZN26jlgAXkZ
         1Q9SBRYgtteC4S9wYmNY5jjrVcT68Td2GLRX/9eZXDG9q+69KZrDWSt/dLARR6n8wSR+
         UhcRZ6CN5ISP5bXBI/k27+AYAsoEpg/fW6mkYMNZM1N9mGxVYVWGuidPaGDb+7mjP/LG
         vqvw==
X-Forwarded-Encrypted: i=1; AJvYcCUY4CqXsoQO2pCFWCimtMKXO6ElKGjk6SD7cE/PiyTh1g7HLp+mOE/HI8gjL/yvbQFRApxo49lf0erh@vger.kernel.org
X-Gm-Message-State: AOJu0YzOCrREUKlNezRTgH7UOwqqJ2Q8jqqT5v3d+g4NyT1RUJhQHTmM
	bVcdxianqXGrIccVsxaPsproQNwT9mozaAcLxTDAoD7QkfavcbU2LsGj
X-Gm-Gg: AeBDieum+NPJ/QVOf/nP5RhJzH/0i0pa22651bMj3NyW176QKOvIb9t+IgEaJWfSz2g
	o1YyrvjzSHTJJ0LApEp3Dvr9mAzZfEUqCCg3slkQsHKVP7I6TJkXqNVHa2X7YlSAi/swDPjdfYs
	28b8AeELk1cXMhkTsKhDtnVgvFf78Mc7zWtFch2Z4hOTMObU07bVmkcDFXsYpSp0p0HJ+iwTpE0
	Yry9kAo7vT4Vawc3NV9C8lWU/mE0KP+LybkLaQbvjSMGI9wKRER3CvxaEMcd1UF7y3rr1HlYa+7
	0rxOjPCXsbUHvCbgSVTWkreUxWIRQnWtFglxscsyrau4XN7lXrshfzJbnY1/K0Ea/aJpJE8Aryn
	AvUYwRym3SQU9XP2S2kUNOx+cZk+xdTg9XavVAIa5zJKUfMJ8AByl0a8RgENpTFI4rEHqcxC2j1
	2ukPWoNyoZlbycp5svveJK9sg=
X-Received: by 2002:a17:90a:c10f:b0:359:f6f8:57b8 with SMTP id 98e67ed59e1d1-35de67d8a5amr19185815a91.1.1775640284172;
        Wed, 08 Apr 2026 02:24:44 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35f52c8sm18754408a91.5.2026.04.08.02.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:24:43 -0700 (PDT)
Date: Wed, 8 Apr 2026 17:24:11 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
	Nutty Liu <liujingqi@lanxincomputing.com>, Guodong Xu <guodong@riscstar.com>, Guo Ren <guoren@kernel.org>, 
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: sg2042: use hex for CPU unit
 address
Message-ID: <adYdiH4Mj5l_Sd_Y@inochi.infowork>
References: <20260406232655.144043-1-inochiama@gmail.com>
 <20260406232655.144043-3-inochiama@gmail.com>
 <20260407-shine-distrust-0546884c2535@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-shine-distrust-0546884c2535@spud>

On Tue, Apr 07, 2026 at 05:31:11PM +0100, Conor Dooley wrote:
> On Tue, Apr 07, 2026 at 07:26:55AM +0800, Inochi Amaoto wrote:
> > Previous the CPU unit address cpu of sg2042 use decimal, it is
> > not following the general convention for unit addresses of the
> > OF. Convent the unit address to hex to resolve this problem.
> > 
> > The introduces a small ABI break for the CPU id, but it should
> > affect nothing since there is no direct full-path reference to
> > these CPU nodes.
> 
> I don't think node names are abi anyway.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Hi, Conor,

I do not fully understand this. I agree with that there is no one
use the device node path directly for node reference (especially
for the CPU node), and they prefer to the phandle. But I think it
is a thing that should be persistent, right? May I miss something?

Regards,
Inochi
