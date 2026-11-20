Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135169;
	b=SsQqWv6I6Mj+xPvCuFUtsfUnZ4365Pxkq+fdzcaTpPCNtht4mkPSgAPKNBntEOZfTOsH
	 kVs3hN4V36fL0SKheUGfv1zUWUagKCG2VZRETplrAOkunIn2BBUo3qymz+ucWLJ+dCNDF
	 CDOGBmQzN+bJb475GtY0pUq9Ub7/yR5sdJwHkISj0juXdc56h64U5IJM0NfQbKHX9JJ4f
	 q4rrRLx7y3vOlo6KsCIGjHwNuMGa4L3oT/fLx6L9v6j9fuJe2fqjl8GcZDENef0EXhzid
	 VB2IYNrkCJdA/cazAS0aXd7vPwPkemfvzj6mwLY5KhN/ZUex8ZV8X23yMkhZcbGOYxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135169;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=15vPBWuJO4ML7J1IqfBjScec+aNHdtb9jbP4UwbOc6A=;
	b=drN80zbq8zmyJDi7i6bg4rk+ysmHlpykJyFHTnFCxuJnu0TY5XEAXqjxGM2P6WvllH5c
	 +EvT8Rnfsl0cq8blJ/GVXkiC4OXTgEFQJSigprrkcVp2U/SHiBCcYpXm9syLZ8yuDXsJG
	 aFZ9fAnOISeqGYAKaPjII0zCtJzJ/ZrL2ZhWJYMDAcDBmFQOvoG6LXSAEUKUP9BSeOtM9
	 Lufy751lQfWYVMwbQagwObOqlWzOhKzFlptJLPysX94iQVrLSaujNJ2KJybA+DEKSkwfu
	 bl+auz5gtp+cJ3p58Xozf4etMIHaQMmwRJIENJ0VhBIYb1IcZyzkM6hil16PG7LtO2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fWI7sRTP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5DC606A320;
	Fri, 20 Nov 2026 00:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fWI7sRTP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61A91F000C6;
	Fri, 20 Nov 2026 00:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795135169;
	bh=15vPBWuJO4ML7J1IqfBjScec+aNHdtb9jbP4UwbOc6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fWI7sRTP+d/DvV1dwLK/WyIn1NKJ8h8dEePpuE1WOdxrdr2xlU0g2uzheW1nD6dph
	 fRcFZklRjfdasJ1e0BT6Bp1Mpvi/RPi7cWTtQf+C/LMPJbWpvgekqc1qAVK3YognT3
	 sQdzWrdwqOTLlx16eoPFpAsmRqU0Kjt/y5mA2iWd7ImFReHUkwyJiWC6rSox842JZ8
	 4ALT2B1tdA6+s6qeQHVtnydN8Omn+MFxh9DWkMpzdlo9uFPVGOVaYv36ZbAJnPyn8l
	 TwXQ82uO1HXzJ9q/bXixtTdprJNqYC0k7TIg8PECi7//g1weKZ6PGti1GAzMAws9Qz
	 RvC3Jvv/k3JvA==
Date: Thu, 19 Nov 2026 16:39:27 -0800
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	Tony Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [External] Re: [PATCH v12 1/5] riscv_cbqri: Add capacity
 controller core
Message-ID: <av-WvzoxSv7QpMhQ@thelio>
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
 <20261114-dfustini-atl-sc-cbqri-dt-v12-1-6ef1f627072d@kernel.org>
 <20261119000846.776930b3@jic23-hlaptop>
 <CAEEQ3w=voZYrfcMuKC_SQG9U8hYN_thcc02nf_PgMu5UyuG32Q@mail.gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEEQ3w=voZYrfcMuKC_SQG9U8hYN_thcc02nf_PgMu5UyuG32Q@mail.gmail.com>

On Thu, Nov 19, 2026 at 07:00:21PM +0800, yunhui cui wrote:
> Hi Drew,
> 
> On Thu, Nov 19, 2026 at 8:09 AM Jonathan Cameron <jic23@kernel.org> wrote:
> >
> > On Sat, 14 Nov 2026 14:06:21 -0800
> > Drew Fustini <fustini@kernel.org> wrote:
> >
> > > Add the core for RISC-V CBQRI capacity controllers: the register
> > > layout, the capability probe, and the allocation operations that
> > > program a capacity block mask for an RCID and read it back.
> > >
> > > A discovery layer maps the register block and describes the controller
> > > in a cbqri_controller_info descriptor. riscv_cbqri_register_cc() probes
> > > the controller from that descriptor and adds it to the controller list,
> > > which stays private to the core. The core owns the controller state
> > > after registration, so nothing in it depends on how the controller was
> > > discovered. The caller keeps the register mapping alive.
> > >
> > > Tested-by: Zeng Heng <zengheng@picoheart.com>
> > > Reviewed-by: Zeng Heng <zengheng@picoheart.com>
> > > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > Signed-off-by: Drew Fustini <fustini@kernel.org>
[..]
> > > +     /* The resctrl glue keys its domains on cache_id, one controller each. */
> > > +     list_for_each_entry(other, &cbqri_controllers, list) {
> > > +             if (other->cache.cache_level == info->cache_level &&
> > > +                 other->cache.cache_id == info->cache_id) {
> > > +                     pr_warn("CC at %pa duplicates the L%u cache id %u controller at %pa, skipping\n",
> > > +                             &ctrl->addr, info->cache_level, info->cache_id,
> > > +                             &other->addr);
> > > +                     return -EEXIST;
> 
> A controller with the same cache level and Cache ID is not necessarily
> a duplicate. A distributed LLC may have multiple physical controllers
> managing the same logical L3 resource.
> 
> Matching controllers should instead be grouped into a logical component
> keyed by (cache_level, cache_id), with the physical controllers kept in
> a linked list. User space would see one logical controller as a single
> resctrl L3 domain, while the update path would iterate the list and
> program every physical controller.

Good point that it is not a duplicate. However, I would like to keep the
scope of this series from expanding, so I would prefer for that scenario
to be handled in a future series. The domain id is the cache id in both
cases, so it won't be a problem to add later.

Do you have a platform with such an L3 that it could be tested on?

For v13, I could change the comment and the warning so that they say a
second controller for a cache is not supported, instead of calling it a
duplicate. The alternative could be to skip the whole group if it is
a problem to just leave the first of the group enabled.

Thanks,
Drew
