Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795167073;
	b=ygfdARFO/r9HnSQT8ecSZZiaSNCApM8zBXDwNEDfzRoo9iXxh/9bQ9PfdO7/kWC8uN/M
	 CCjm6kFG3592JH8ZExgu6D7GrxZuZwUV2BhNYYsPn9r9fVrWLTPqAdcdEfEawGAImNtmL
	 NUOHVmLHS3SC9l6I5txU8DB+ckTJuLmPbdOLTpUyAUy93XrkixxhXF/GzKH512k2TsRNi
	 JnwUD3t4tDcUWLYg54858cW4/dtF2OXn0PR2BqZ8waySl0ezQJauKUNFITukPrJQC+aqW
	 manbGM54YqC/bK6/+nFVxHpSzMrv2tLHb1l8jAu1sIgAtDojdP8kksHq3votERH23vQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4i941FDPhpmYcUdo3BnCKwVlDsg7lnYxXVRnzu5LkiA=;
	b=jNLa2xhBGrBb8aPxtVahu+4iaNxQadd4duaHX28aNIGHvVxys1O8/CrTSBa8F7qZZBvG
	 1dTCAHJol68OZgZFQttXk4dazTOBWSzIbEiywVtkH1GNlFvnRCgt+1GRgM+JSN4aqJsMi
	 6U5AaonBV4Ti7Qs1WSw6laos1GEhjvefo41jx45RgsJV533HlD5Zf6Twu3hbNIL0PNCqr
	 YxjIn14FJQYH6L1uppj2BS/SgLK3tktN/jfxO6IFm6PKixKqU4Ks74O5LlZXUHEgdXuy+
	 60YYg6KLQCPoX+7oUg//Vm3EqxPUGkLbUL2fepkIHL4UCv+xgG/4l5PZfIWun11iH0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HecZDQb7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE85B606A32C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE85B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HecZDQb7
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-862b9c2e78aso433473a34.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:31:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795167072; cv=none;
        d=google.com; s=arc-20260327;
        b=qRs0oUQ036WUfGqg0JL1bEqMzthGikQdvu46hB8QIzGO1bPWudGIzf9niBKx9b01Qi
         UZsqI2ChWXdNriROtaY6WOjY3TGwQ+otM4KHJd2AJ5NGCNKVp85HgktMdogQUIwspjm5
         zvEg5zVkdI5rEteUmjs+Bjv//g+yx2sL5ATojRlyeDPb56Ga4igc4qxiwR2Oictel7uR
         dkvX6PROE+WU29me7et0pcWJ5lZ30+SJWEpYvWfSmoZkgF0T+MIDWqiTzU8WV9v32jRp
         UGeDOqT+GUfOIACxPcOgtGLA4YOMkGlGF+suQMP4Eafe9x+irIUxQdaExh39ZEsyHPSi
         BT6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4i941FDPhpmYcUdo3BnCKwVlDsg7lnYxXVRnzu5LkiA=;
        fh=rpgKoHYja33Ll5JhgZj2nPpnCF2JepfUzaokOhsKAQQ=;
        b=CWgaGJRbKpSkSyBtQliVTwv7tu3rJeTB3OVfdWjh5izpvx/HQ5UU4IbYwy86UvkI60
         Ne2MzRc7UYiZtUl2a397HrcplRlUnbkm82TGHaP59NqiSLwUZLxX8OOlBPpSdpzjN9VJ
         JTTZLDKWns7tP4mKy5yTpn6IuLbcyZsNUKt1NYsBv0qpaDV4YVf/XPwO2MiUiQOil4Di
         2ZisoRXsRa+i51Q3EfjZiRBvmvQSVOsxtIG5LuIQMRNhQ93uec7hibbm6zkB2VqDVsE3
         9y/dnGFHYpHJp2fDFjNyHQ8vzLB5wwYK/O9nKZ5ZCJoIfhJ5GDp6BJ2nXcIvq3uykibI
         BHwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795167072; x=1795771872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4i941FDPhpmYcUdo3BnCKwVlDsg7lnYxXVRnzu5LkiA=;
        b=HecZDQb7CVbdeNhyqELK8mZSGQ57dXFWoER3l0AH6+yx5s0ejZrONtGeXBWlJhLiBH
         QzLZkzyrbuTorTMCDNjmhx5b89Lf7UdN0/FvcT0do7Rhk1Mq/F3TxADF7VMlxgjT7J2A
         j8AFrO4OV/VYhwc046wuoaLGgw0tdvP/vQEB/o0iOpCjOOe6gqukg0sF0Xw5ID+7xmYC
         U4syCqx59aikiColh7/aHtpGEE93Co09aD7PVl+oy9Frc/2BRfjfg0620KYnd0IanT5D
         Py/bWFv9dl0PEqOGXJrXhd5E6mpzzDDliFUj55wl4acvjRHteuK3WWBj25pfxz0vApNr
         3GIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167072; x=1795771872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4i941FDPhpmYcUdo3BnCKwVlDsg7lnYxXVRnzu5LkiA=;
        b=nC+XO6MJtCmmJp0WltEx6FJS3nxvNUZ0jjmUig5gqH6+Ba0lvSMSOOj2XwjCMKm8vo
         o4S4eqPaiGrlXzjS+Suqcy8qFZs7FTzVc5O96xaNmNggxAiWJih1/D384+YO1z2f3dFD
         xtIv76kPtfdsDH8m13vhaTLvUsFtMA6ZB3tm9ufECuUX48zKPJ6d4+dNNOa/l7qo41lX
         qzkoLt5qx7tBxIqcixRezlK8u+Njp5cDN+cQaT+9fpR3gwTo4BHZfOZ6bBa2cCSWD6p3
         236dLplbsar9Ep6ZT96nuoiioNPjIPL4hNA+FGYM8y+TA8t5SD0WGQ6XDtWd5jzyEnPR
         iHkw==
X-Forwarded-Encrypted: i=1; AL+hErHqFGnjQJ0I2kLgzPa1ZQExwX0oL1fNjiHiuWL8zokH0jaWg08lB0XvlG57RrrjCU3SU0yJb/R+j/Di@vger.kernel.org
X-Gm-Message-State: APuU4Z9qz4sFWpkhJ4nVqZQyxXFReYCfvByZEsQVtXkEyDoC7JY6P8+3
	Fri1RD84kxQR957pgA617b7/GGziTvm9tmZL7vCdlwBCG41nP9fNaA0fKN71opAZAY2BMQ9QZpA
	Oo4ID1mF6uasWKmgYycoaTUErLRGZ8Sma4Eb7ecGDDQ==
X-Gm-Gg: AYBFou0EmJoQfvwBZRXVi5fTd+EXboF6DLFMvgD4eG2cv7eIBTx9GURw5j8nlVSf+Cb
	4RcQLH7ZDbUhkCXsshiWECht66T4TmHF97JJiH60t9d9U2EsbxewKFRBtO7CWhy+paXximgoKR5
	wzImK6XBvYxHtO+n1EX650rRXEs5aE0ot841AaYOYXvXh/GhsfxLLyKQwRYr2u2xL7cJMJhbhmo
	NmrsFt/xTlu9uYpfB4kzUSBtYHZGcF2vAc0oNdqnozWniR0MDN8UJZSdk4D6pUaFTJJ34jFegi9
	EOaOSW7Fzk8C5bet3EOPt43dFg0W8TXJGlWLrZhPZ0wKAEOoa7P442Vdeu8iS1DIyIQ2vTczdXg
	ll2Qp3CErCOwCNm8fH5hVCshiJV4WB84/uI120V8evWo=
X-Received: by 2002:a05:6830:6814:b0:862:e9e6:6297 with SMTP id
 46e09a7af769-86315985934mr3086650a34.18.1795167071723; Fri, 20 Nov 2026
 01:31:11 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
 <20261114-dfustini-atl-sc-cbqri-dt-v12-1-6ef1f627072d@kernel.org>
 <20261119000846.776930b3@jic23-hlaptop> <CAEEQ3w=voZYrfcMuKC_SQG9U8hYN_thcc02nf_PgMu5UyuG32Q@mail.gmail.com>
 <av-WvzoxSv7QpMhQ@thelio>
In-Reply-To: <av-WvzoxSv7QpMhQ@thelio>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 20 Nov 2026 17:30:59 +0800
X-Gm-Features: AclHuK-k8TRNXUVZzhRA9w-uB92JwpYAjGJmp8KpAUe03HieCcNAOF5c9k-Hbw8
Message-ID: <CAEEQ3w=zXTYjAoWcBZB_CSVYKsbOSjGvp4JW63HET_BwLnW1Nw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v12 1/5] riscv_cbqri: Add capacity
 controller core
To: Drew Fustini <fustini@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Adrien Ricciardi <aricciardi@baylibre.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
	Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dave Martin <Dave.Martin@arm.com>, 
	Fenghua Yu <fenghuay@nvidia.com>, Gong Shuai <gong.shuai@sanechips.com.cn>, 
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn, 
	James Morse <james.morse@arm.com>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Peter Newman <peternewman@google.com>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Sunil V L <sunilvl@oss.qualcomm.com>, 
	Tony Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>, 
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, 
	Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Drew,

On Fri, Nov 20, 2026 at 8:39=E2=80=AFAM Drew Fustini <fustini@kernel.org> w=
rote:
>
> On Thu, Nov 19, 2026 at 07:00:21PM +0800, yunhui cui wrote:
> > Hi Drew,
> >
> > On Thu, Nov 19, 2026 at 8:09=E2=80=AFAM Jonathan Cameron <jic23@kernel.=
org> wrote:
> > >
> > > On Sat, 14 Nov 2026 14:06:21 -0800
> > > Drew Fustini <fustini@kernel.org> wrote:
> > >
> > > > Add the core for RISC-V CBQRI capacity controllers: the register
> > > > layout, the capability probe, and the allocation operations that
> > > > program a capacity block mask for an RCID and read it back.
> > > >
> > > > A discovery layer maps the register block and describes the control=
ler
> > > > in a cbqri_controller_info descriptor. riscv_cbqri_register_cc() pr=
obes
> > > > the controller from that descriptor and adds it to the controller l=
ist,
> > > > which stays private to the core. The core owns the controller state
> > > > after registration, so nothing in it depends on how the controller =
was
> > > > discovered. The caller keeps the register mapping alive.
> > > >
> > > > Tested-by: Zeng Heng <zengheng@picoheart.com>
> > > > Reviewed-by: Zeng Heng <zengheng@picoheart.com>
> > > > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > > Signed-off-by: Drew Fustini <fustini@kernel.org>
> [..]
> > > > +     /* The resctrl glue keys its domains on cache_id, one control=
ler each. */
> > > > +     list_for_each_entry(other, &cbqri_controllers, list) {
> > > > +             if (other->cache.cache_level =3D=3D info->cache_level=
 &&
> > > > +                 other->cache.cache_id =3D=3D info->cache_id) {
> > > > +                     pr_warn("CC at %pa duplicates the L%u cache i=
d %u controller at %pa, skipping\n",
> > > > +                             &ctrl->addr, info->cache_level, info-=
>cache_id,
> > > > +                             &other->addr);
> > > > +                     return -EEXIST;
> >
> > A controller with the same cache level and Cache ID is not necessarily
> > a duplicate. A distributed LLC may have multiple physical controllers
> > managing the same logical L3 resource.
> >
> > Matching controllers should instead be grouped into a logical component
> > keyed by (cache_level, cache_id), with the physical controllers kept in
> > a linked list. User space would see one logical controller as a single
> > resctrl L3 domain, while the update path would iterate the list and
> > program every physical controller.
>
> Good point that it is not a duplicate. However, I would like to keep the
> scope of this series from expanding, so I would prefer for that scenario
> to be handled in a future series. The domain id is the cache id in both
> cases, so it won't be a problem to add later.
>
> Do you have a platform with such an L3 that it could be tested on?
>
> For v13, I could change the comment and the warning so that they say a
> second controller for a cache is not supported, instead of calling it a
> duplicate. The alternative could be to skip the whole group if it is
> a problem to just leave the first of the group enabled.

Keeping only the first controller could expose one logical L3 domain to
user space while configuring only part of the physical resource. Requests
handled by the remaining controllers would not receive the same allocation.

This topology should be testable in QEMU by creating two capacity
controllers with different MMIO bases and making both RQSC resource
entries reference the same PPTT Cache ID.

One possible grouping model is:

1. Initialization
Group controllers by (cache_level, cache_id). Represent each group
as one logical component containing a linked list of its physical controlle=
rs.

2. Set
Let the resctrl domain reference the logical component. On a schemata
update, iterate over the controller list and program every physical control=
ler.

3. Get
Read the configuration from the first controller and verify that the
remaining controllers report the same value.

4. Monitor
When monitoring support is added, read the counter for the same MCID
from every physical controller and report the sum for the logical
resctrl domain.

User space would continue to see one logical L3 domain, while all
physical controllers behind it remain synchronized.

Until this grouping is supported, it would be safer to skip the whole
component rather than enable only the first controller. Since this is a
valid RQSC topology and can be covered by QEMU, supporting the grouping
in the current work would be preferable.

Thanks,
Yunhui


>
> Thanks,
> Drew
>
