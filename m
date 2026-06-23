Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99B520ADF8
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219199; cv=none; b=Bt1vIoYl9reQW/WWdMb51864jip7aKqZItQI4u74VscZ5xiaN6Vbg62CpDWISGZeAhHW3AlSEF12IBPKG9yXosjN8IkQFgHG/pv07YKgPnfbBHS+GwLTvpCmb6z29W34zAFbH8LzCoszf0G14iRh5yBAJPGu9i0v8qYUSuhq3Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219199; c=relaxed/simple;
	bh=T/xm1V/QyZCGnE+lplzCYaYTI/gNvoJU8fHAacDtQbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOI28dsht398YLUWrl/bNkLgc9XWNodJBnPanwomrQCiz+TsGChUNk8XljM3on+8Rw16MzQuZfmOnX+W5MI2T3yt2k4pL51gMCvRbxU6NF6jFYPWyAKkK8TVAl2x4K6rScqPxyueD09mT4cG17th2E01zww0sovBf+jK8U/MuMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sz3QA82d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sz3QA82d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7A61F00A3E
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782219198;
	bh=T/xm1V/QyZCGnE+lplzCYaYTI/gNvoJU8fHAacDtQbg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Sz3QA82dyoA/AAkkQMZJ355EwGBBGz3GXmV8+0ddlEaYvaVRMN5EWMlCAn8Pg0Exx
	 n57YXY2CqjwwoCGVfFlh/OylfEJiP7F1D8LmE0SSN3SGwbMccGoFKLmUCDeTv9kMQt
	 h4Mjq8TBT4GTJePy10yWtQerQWFJfKE5YoKtkKNtvyAYPb0ziDR4kK8XKsjhga74Do
	 iWeBpkqmRhQtQx0/mquDtlqzYhdKpT7N9yPVj/CS3FWDDQ2O9LTTbHos44i5TLSzd7
	 c71cPcUYKZrO8tQAfawgJkJYqDGJDLlmRCDjbVSrQHbXIxE20sNy2tvAhJe5X1+urF
	 ptCDVvy0KQ4qA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6974a6e54dbso7514203a12.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 05:53:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+vOjuig+Ej96RufU7otG8pqr59H4j84II3aSk4JUks4gZ8CQcdSUHrs3d3s6sbfhfcD9Jj3NhH16EO@vger.kernel.org
X-Gm-Message-State: AOJu0YwqrTKw/c4XvcNZPXtVCr6/NBTRNSEQUF0uZhFk7AS2kBOg+UVQ
	9ULYdLXjrNr3Yyr+KXxK7B7U+WgnYSXjB8mZhH5FZN/76rGZwbxdHE0bGUm4QdLxZUlZcwNe48i
	LEHO2ucFem2kNAe/lsZ14CRfk2tAbxQ==
X-Received: by 2002:a17:906:6a29:b0:bfe:ed74:523 with SMTP id
 a640c23a62f3a-c098f12eb0emr1081202666b.50.1782219197266; Tue, 23 Jun 2026
 05:53:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260621143919.4176646-1-ekffu200098@gmail.com>
 <20260623014246.GA3897146-robh@kernel.org> <CABFDxMG2ysTYPwJxg8Cq-uWxc+LZzfo_3_S8WwG2wtXMcwo9sg@mail.gmail.com>
In-Reply-To: <CABFDxMG2ysTYPwJxg8Cq-uWxc+LZzfo_3_S8WwG2wtXMcwo9sg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 23 Jun 2026 07:53:05 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ9Aedo1HA7mrb=99eAQPJ2L5G7P9inL5D4AHfqrvuxBw@mail.gmail.com>
X-Gm-Features: AVVi8CcLcbKYnww-EHfpPi-SIVDIwBgc05B_b0SBWSJ8_F7sYXaCC385wxjgkYA
Message-ID: <CAL_JsqJ9Aedo1HA7mrb=99eAQPJ2L5G7P9inL5D4AHfqrvuxBw@mail.gmail.com>
Subject: Re: [PATCH] of_numa: fix return -EINVAL when numa-node-id is not
 found in last node
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Dan Williams <djbw@kernel.org>, David Hildenbrand <david@kernel.org>, devicetree@vger.kernel.org, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 7:08=E2=80=AFAM Sang-Heon Jeon <ekffu200098@gmail.c=
om> wrote:
>
> On Tue, Jun 23, 2026 at 10:42=E2=80=AFAM Rob Herring <robh@kernel.org> wr=
ote:
> >
> > On Sun, Jun 21, 2026 at 11:39:18PM +0900, Sang-Heon Jeon wrote:
> > > When the numa-node-id property is not found in the last memory node,
> > > of_property_read_u32() returns -EINVAL, which then becomes the return
> > > value of of_numa_parse_memory_nodes(), even though earlier memory nod=
es
> > > were parsed successfully.
> > >
> > > Commit 7e488677a54a ("of, numa: return -EINVAL when no numa-node-id i=
s
> > > found") meant -EINVAL to be returned only when the numa-node-id prope=
rty
> > > is not found at all, not when it is found in an earlier memory node b=
ut
> > > not in the last.
> > >
> > > Check whether at least one memory node was parsed successfully, and r=
eturn
> > > 0 in that case, -EINVAL otherwise, so the return value of
> > > of_property_read_u32() for the last memory node no longer corrupts th=
e
> > > overall return value.
> >
> > IDK, it's arguable that an incomplete DT isn't valid and something we
> > need to support. Is missing numa-node-id valid or it's just better to
> > have at least partially
> > configured NUMA nodes?
>
> You're right.
>
> Since the first implementation 298535c00a2c ("of, numa: Add NUMA of
> binding implementation.") skips memory nodes without `numa-node-id`,
> I only try to fix the error case introduced by 7e488677a54a ("of,
> numa: return -EINVAL when no numa-node-id is found").
>
> IMHO, if changing the logic is acceptable, rejecting DT with an
> incomplete NUMA configuration also seems reasonable.
> We already call memblock_validate_numa_coverage() after
> of_numa_parse_memory_nodes(),
> so such an incomplete configuration would most likely fail from that
> validation anyway.
>
> So, would it be OK to reject a DT with an incomplete NUMA
> configuration? If so, I'll make a patch in that direction instead.

Reject? As in panic()? No, because why would we make a system that
boots not boot and a panic at that stage won't be seen because your
console is not up yet. If you want to add a warning that the NUMA
information is incomplete, that would be fine.

Also, are we sure it's not valid to have some memory associated with a
numa node and some that is not?

Rob
