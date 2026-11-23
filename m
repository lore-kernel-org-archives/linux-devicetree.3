Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795407531;
	b=yuPP0JsK7DAk9iiNS9aDLxwJMHZJOKU6wPt468IoDTve7KHfet+XRKd2btU8qKL8wP5W
	 LUnrkgxO7rSgxX5wbcYl8YbVB7tw7f8pVVNNh1efjkBnuoc7iL85E8iEKfTHSgV6NtmC+
	 4v5I1iT9syyOUx/GQVjrJW16D9XIYREehmG3cx0AKIgs2mTb4lS7S9LGDelE8p/u0FyIS
	 G2V4JvBROTstofrq072GWn7lUk7D9xD0GXYDr/qhxdihknxFWFLsZu+LRa3A8wOd+uNzs
	 /LdF/ti3QUoaC+xPtEmkIApTO1xqszE/hvXmNwCyBzq/XBM7WK2RQfOQMDDIx/MF5zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795407531;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=MGZTPWp2i4b94VE9SMcXmz9d4hQmCYdTz5/vft8xoW4=;
	b=sksfkUfYh7ifQojngkLBCjZK2xXjRzh0n0PgMpn6ntyi7gSZSIk6XX+qu1qDX37AMhpR
	 XExtqEzVYxrHH2x6ooQWaJnJFMaarvZ103Ob4RDi3hIpTHPHoqoqvPC4pdgM5DcVsTf0K
	 Wg/RcCgmU8aWYOhU4CGJLJNndHeWrVIkIahO+OQ3ZfB8ZPXdbCgqjC6MhMqqmBp1NMJG7
	 d0lPzDpnNbIDwTdoEDHEzpvtFl0l9szIBMfsx4GzgxHCbQYuQ7IX86H3sVmH5Tb/C7jSp
	 5dlNOlosQgULF7cPY8hujfRKh9QPvZRnuZHRvj71O8I3zFPSMgcaqdb0r4oi18TVS3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m3oxTjVF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F9F606A31A;
	Mon, 23 Nov 2026 04:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m3oxTjVF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0721F000CA;
	Mon, 23 Nov 2026 04:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795407531;
	bh=MGZTPWp2i4b94VE9SMcXmz9d4hQmCYdTz5/vft8xoW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m3oxTjVF5biHPKVWTSY79juLWKEZ0+RTPYDlJ5CJmY9SGsdu0TOngsvFoxhkls/EP
	 BnvYHwP1idyvXSmvcGwCoMcH5hrCdQ4+dGxoN4bMBLfluGN9WNgkeFdPdpuRyz65lg
	 iTo7NEmXEld3M/+IFXsPt58MeIEk3pztNAfEKdKXrUgj69z+rvLSvtvjCkzI7eu2As
	 zz5kyhXI4Xl4UfrcrDiMlFrzhgpISf/3LqB/eMjEB9bNewn02JTdkNIGibC6HrL2oW
	 JmvcIXYA8GXMMgdUO+NWqR+sBE9dz1lQ2ETl9VYVjvwXFjRNwt97Op9plcGFNjXQhE
	 cM97/u1q8+sPw==
Date: Sun, 22 Nov 2026 20:18:49 -0800
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
Message-ID: <awO-qQe0s0Jp-142@thelio>
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
 <20261114-dfustini-atl-sc-cbqri-dt-v12-1-6ef1f627072d@kernel.org>
 <20261119000846.776930b3@jic23-hlaptop>
 <CAEEQ3w=voZYrfcMuKC_SQG9U8hYN_thcc02nf_PgMu5UyuG32Q@mail.gmail.com>
 <av-WvzoxSv7QpMhQ@thelio>
 <CAEEQ3w=zXTYjAoWcBZB_CSVYKsbOSjGvp4JW63HET_BwLnW1Nw@mail.gmail.com>
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
In-Reply-To: <CAEEQ3w=zXTYjAoWcBZB_CSVYKsbOSjGvp4JW63HET_BwLnW1Nw@mail.gmail.com>

On Fri, Nov 20, 2026 at 05:30:59PM +0800, yunhui cui wrote:
> Hi Drew,
> 
> On Fri, Nov 20, 2026 at 8:39 AM Drew Fustini <fustini@kernel.org> wrote:
> >
> > On Thu, Nov 19, 2026 at 07:00:21PM +0800, yunhui cui wrote:
> > > Hi Drew,
> > >
> > > On Thu, Nov 19, 2026 at 8:09 AM Jonathan Cameron <jic23@kernel.org> wrote:
> > > >
> > > > On Sat, 14 Nov 2026 14:06:21 -0800
> > > > Drew Fustini <fustini@kernel.org> wrote:
> > > >
> > > > > Add the core for RISC-V CBQRI capacity controllers: the register
> > > > > layout, the capability probe, and the allocation operations that
> > > > > program a capacity block mask for an RCID and read it back.
> > > > >
> > > > > A discovery layer maps the register block and describes the controller
> > > > > in a cbqri_controller_info descriptor. riscv_cbqri_register_cc() probes
> > > > > the controller from that descriptor and adds it to the controller list,
> > > > > which stays private to the core. The core owns the controller state
> > > > > after registration, so nothing in it depends on how the controller was
> > > > > discovered. The caller keeps the register mapping alive.
> > > > >
> > > > > Tested-by: Zeng Heng <zengheng@picoheart.com>
> > > > > Reviewed-by: Zeng Heng <zengheng@picoheart.com>
> > > > > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > > > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > > > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > [..]
> > > > > +     /* The resctrl glue keys its domains on cache_id, one controller each. */
> > > > > +     list_for_each_entry(other, &cbqri_controllers, list) {
> > > > > +             if (other->cache.cache_level == info->cache_level &&
> > > > > +                 other->cache.cache_id == info->cache_id) {
> > > > > +                     pr_warn("CC at %pa duplicates the L%u cache id %u controller at %pa, skipping\n",
> > > > > +                             &ctrl->addr, info->cache_level, info->cache_id,
> > > > > +                             &other->addr);
> > > > > +                     return -EEXIST;
> > >
> > > A controller with the same cache level and Cache ID is not necessarily
> > > a duplicate. A distributed LLC may have multiple physical controllers
> > > managing the same logical L3 resource.
> > >
> > > Matching controllers should instead be grouped into a logical component
> > > keyed by (cache_level, cache_id), with the physical controllers kept in
> > > a linked list. User space would see one logical controller as a single
> > > resctrl L3 domain, while the update path would iterate the list and
> > > program every physical controller.
> >
> > Good point that it is not a duplicate. However, I would like to keep the
> > scope of this series from expanding, so I would prefer for that scenario
> > to be handled in a future series. The domain id is the cache id in both
> > cases, so it won't be a problem to add later.
> >
> > Do you have a platform with such an L3 that it could be tested on?
> >
> > For v13, I could change the comment and the warning so that they say a
> > second controller for a cache is not supported, instead of calling it a
> > duplicate. The alternative could be to skip the whole group if it is
> > a problem to just leave the first of the group enabled.
> 
> Keeping only the first controller could expose one logical L3 domain to
> user space while configuring only part of the physical resource. Requests
> handled by the remaining controllers would not receive the same allocation.
> 
> This topology should be testable in QEMU by creating two capacity
> controllers with different MMIO bases and making both RQSC resource
> entries reference the same PPTT Cache ID.

The QEMU RQSC series gives each capacity controller its own cache, so I
could change it to allow two controllers to have the same Cache ID.

Is there also a hardware implementation that could be used for testing?

> One possible grouping model is:
> 
> 1. Initialization
> Group controllers by (cache_level, cache_id). Represent each group
> as one logical component containing a linked list of its physical controllers.
> 
> 2. Set
> Let the resctrl domain reference the logical component. On a schemata
> update, iterate over the controller list and program every physical controller.
> 
> 3. Get
> Read the configuration from the first controller and verify that the
> remaining controllers report the same value.
> 
> 4. Monitor
> When monitoring support is added, read the counter for the same MCID
> from every physical controller and report the sum for the logical
> resctrl domain.
> 
> User space would continue to see one logical L3 domain, while all
> physical controllers behind it remain synchronized.
> 
> Until this grouping is supported, it would be safer to skip the whole
> component rather than enable only the first controller. Since this is a
> valid RQSC topology and can be covered by QEMU, supporting the grouping
> in the current work would be preferable.

I would like to keep the scope of this series limited, so in v13 I will
skip the whole group.

I will add support for multiple controllers per cache to the Linux RQSC
series instead. Your grouping model looks like a good plan for
implementation.

Thanks,
Drew
