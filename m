Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095A6388E53
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 17:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782234514; cv=pass; b=A3wvj3xKF5zf2AevXm7KOaUhDYUSTPv3hKVXhkuW0VlegJsUQsDCM3RYhuh2TFyz+gNXs5aU8bO5pkWsGnSkvevYCAD78IwBqvtM6soUZ30vs5bH02x/hnqqBZ1+xHfBaqEnT6ZNOc8dW4TaFL36f2DgblwdBoLdjLIniuL02iE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782234514; c=relaxed/simple;
	bh=am6lXt4mpcE2RMu2bONNw2ib5hRZ5Im/zPY1P4ssZLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fcbvd8YFz8UGMi/ESIcQ7lCjMDuBi/v5gaBw1rh9Z7skH8jdcWIrXzdo/ngp+mgvYREwRcVVfxzJRtcK26VzLYxfgjbK00nHO+/aLdDlr03VS4cg+JU7bL5qv9ou2nWSsD0uwq42QUPnYkFcuaUXQUggGSo1CFObgDUXjfq1K8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enaajkQ3; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enaajkQ3"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66058b880e9so17641d50.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782234512; cv=none;
        d=google.com; s=arc-20240605;
        b=PRKYuzRYNfUrN2aXDUxPayZ30gcqsb0iv+jA6m4plmuewV9L+N4P9uPmA/XI07VsCK
         lSkkWD8WCDA0s9ymRIp4hCzafUVEGrDghJ/dUjJFyuvETro7rX4kezetUglSID7Qg0T1
         qO012unjiM+uS5zaMRiKgvyWOqrkaroi/MKtHKP/hbJ+wsEQWww589LihaYwuR1sU62q
         yNlQ3JbgIOwSmqUT2mNE12pBC5IrOh/XBagMPBEYh0dc16ksF6Kjwg7tCOt3egkKzOzP
         MDBWeIGwGdgI3KvM8DkTQFWc/5/GLwbH9QBVJnJmZ6nZWNTihGRyUzPOpOFsittBRKNo
         yAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=am6lXt4mpcE2RMu2bONNw2ib5hRZ5Im/zPY1P4ssZLI=;
        fh=cnJjVePd0G/BVEzjCz6x+0wad+f2z2mgVYjfo7EoXAE=;
        b=RysBV8sL1/l7i3SP5KBDEzEL63KrvcyZjHwSF+x23pm+iGkfWPKfMj3REdEQGpyY9h
         k3xkhMhNrk+xy93gRLRNzGC6MVYfWxuLu9hwhLfDeN42Eo17KP3497uK6CjCXvO2ZMdl
         Ud+HShYNftxOu155qpCzmyiWkGH27DFQD7vLOsUmlSLRbM9GqCnqQnoLNqOAuFWyQz7E
         zJqNxmO+BXiwjSJSHb2dNoPDY8oFKFkMn0mfRgFLOTcLX3lsMJkzGUTx3X4rAZ+xSWNQ
         WtyU7fTE8zJr4BRCMZDfUZgUxDrBqbFLzVY5Lj6XMdnFih2hGFPkEmxaAR+seLIDecIv
         FflQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782234512; x=1782839312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=am6lXt4mpcE2RMu2bONNw2ib5hRZ5Im/zPY1P4ssZLI=;
        b=enaajkQ3HPFvHvSDHrQGzxC8wV5vE5OWOh29fnzOJ8dop8ofiMzh4ENdMG2pUwIsTw
         LHyKFgsNcxy01fereeUTMZVmRjlaymETCLHunJmcBuXLsiZA41K4VFTbSji7dtvpO80/
         iPMHGGNaol2r2/AzjCsIxx2/bb9OQb1kjqU5GShXBKjYi7MYXuyqA8IAHoz6ZmEh2FVJ
         hNcKQT25vJB9kg9ndfswZAZgcCZ8I04+VgMOz3pMT8f9mfdjZeQcWWGE864uP0BjwMfk
         zKhVq2rqJ4Xxd32/Pok3FaLZYn15k02lll/dJC9mmN9N2GQmDfiYJ1lBU4hpuu9PwqxY
         Og+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782234512; x=1782839312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=am6lXt4mpcE2RMu2bONNw2ib5hRZ5Im/zPY1P4ssZLI=;
        b=XWLbZ4ncnZ8mtV6PjA5MhBkGLnTvfFuiZs5bvxDn2Gcv8D5z2xcsHn5lOgRfvXn712
         iPLbINp6vYijMqcpThDBU5l/pCMCBJ4WhFcl+Y5EHNaIskPmtM/d7IblbL8+2JHiONYc
         OUsMRxal1lzAAQ1x252rnuDBO3DTvjH0IsNvLPtYLXGITIjsoSG8ydEqeJbSTVp6MPkt
         lJrd0JD2eu2glHbh+KQ3iOPxxACDlU3CMeteFtu6FfKqg73+6mSeXXb1KinjUwFUZn5B
         M9Q0wqaHA+kg2ft79byUzbYxkOpLtzvPC0HJhjIAj3I2emYTAHFcOhGLkpnauA4Lrwot
         A4Ig==
X-Forwarded-Encrypted: i=1; AHgh+RqVaoeMAwR5CGr6yKoaxdfqt9/frCb8KAr+3ZRUttxUXEEwSyOIfJIGuj8D49t/Z5Ld8HsAdquBU4V6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9KgGG4c39jvDHJGW/6by+e92AV1HfN7WOTc6GUArUb7Qnx0Go
	htD9V2nGEIvehfYPQ1NLr8AXS8F7XTTcK6KJ8jBtTvy+Ud5LeD8W/nFSiJi3/iZV1BSbzrMDbsq
	0kqmdwCbQR58mBe7epmm0+EMEcE5lecePU1vY
X-Gm-Gg: AfdE7clg438X+zZZobbDx60bMIaoKi/IgfVej4DUGzDhRH4R1B7DKEqYg6mk1hNRroE
	zKoB3TLduDqpEETd+Cr/yPRburN2uzs4enYqODU4kCZQaQBJMYRHbEWrgrLJszWmSalkjsnDpMl
	T+5uynoF9/LZDrwv8JnAVbjHjBfdL9GqkOVkCOLn7y9eHno/r7RTtc+nPlGWc7/TpKarngz7Q5s
	Bbta/uM8lAySF2EPTX/D4MlBFE6ehWH0s7zNAd89m1uLvLn3QOLEo37d2+4UMN2yGCX+F37Op5+
	yI6N
X-Received: by 2002:a05:690e:a4f:b0:663:2376:b7c1 with SMTP id
 956f58d0204a3-6635d46a499mr2882878d50.8.1782234511852; Tue, 23 Jun 2026
 10:08:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260621143919.4176646-1-ekffu200098@gmail.com>
 <20260623014246.GA3897146-robh@kernel.org> <CABFDxMG2ysTYPwJxg8Cq-uWxc+LZzfo_3_S8WwG2wtXMcwo9sg@mail.gmail.com>
 <CAL_JsqJ9Aedo1HA7mrb=99eAQPJ2L5G7P9inL5D4AHfqrvuxBw@mail.gmail.com>
In-Reply-To: <CAL_JsqJ9Aedo1HA7mrb=99eAQPJ2L5G7P9inL5D4AHfqrvuxBw@mail.gmail.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Wed, 24 Jun 2026 02:08:20 +0900
X-Gm-Features: AVVi8CeWRZazimSjrzB_MHx6B4a0UdomFZ7uj1ADcPqVonttWx89V4neChZxCMM
Message-ID: <CABFDxMHURMAjrpqLpQ1q-V_855=vP7ABQ1R57nE0O_LUp=xMnA@mail.gmail.com>
Subject: Re: [PATCH] of_numa: fix return -EINVAL when numa-node-id is not
 found in last node
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Dan Williams <djbw@kernel.org>, David Hildenbrand <david@kernel.org>, devicetree@vger.kernel.org, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 9:53=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Jun 23, 2026 at 7:08=E2=80=AFAM Sang-Heon Jeon <ekffu200098@gmail=
.com> wrote:
> >
> > On Tue, Jun 23, 2026 at 10:42=E2=80=AFAM Rob Herring <robh@kernel.org> =
wrote:
> > >
> > > On Sun, Jun 21, 2026 at 11:39:18PM +0900, Sang-Heon Jeon wrote:
> > > > When the numa-node-id property is not found in the last memory node=
,
> > > > of_property_read_u32() returns -EINVAL, which then becomes the retu=
rn
> > > > value of of_numa_parse_memory_nodes(), even though earlier memory n=
odes
> > > > were parsed successfully.
> > > >
> > > > Commit 7e488677a54a ("of, numa: return -EINVAL when no numa-node-id=
 is
> > > > found") meant -EINVAL to be returned only when the numa-node-id pro=
perty
> > > > is not found at all, not when it is found in an earlier memory node=
 but
> > > > not in the last.
> > > >
> > > > Check whether at least one memory node was parsed successfully, and=
 return
> > > > 0 in that case, -EINVAL otherwise, so the return value of
> > > > of_property_read_u32() for the last memory node no longer corrupts =
the
> > > > overall return value.
> > >
> > > IDK, it's arguable that an incomplete DT isn't valid and something we
> > > need to support. Is missing numa-node-id valid or it's just better to
> > > have at least partially
> > > configured NUMA nodes?
> >
> > You're right.
> >
> > Since the first implementation 298535c00a2c ("of, numa: Add NUMA of
> > binding implementation.") skips memory nodes without `numa-node-id`,
> > I only try to fix the error case introduced by 7e488677a54a ("of,
> > numa: return -EINVAL when no numa-node-id is found").
> >
> > IMHO, if changing the logic is acceptable, rejecting DT with an
> > incomplete NUMA configuration also seems reasonable.
> > We already call memblock_validate_numa_coverage() after
> > of_numa_parse_memory_nodes(),
> > so such an incomplete configuration would most likely fail from that
> > validation anyway.
> >
> > So, would it be OK to reject a DT with an incomplete NUMA
> > configuration? If so, I'll make a patch in that direction instead.
>
> Reject? As in panic()? No, because why would we make a system that
> boots not boot and a panic at that stage won't be seen because your
> console is not up yet. If you want to add a warning that the NUMA
> information is incomplete, that would be fine.

Sorry for the confusion. Previous "reject" meant returning a non-zero
value from of_numa_parse_memory_nodes().
When of_numa_parse_memory_nodes() returns non-zero, NUMA
initialization from DT is considered as failed and dummy_numa_init()
is called,
which leaves the system with a single node covering all memory.

In conclusion, the direction that i meant is returning -EINVAL instead
of skipping no `numa-node-id` node,

> Also, are we sure it's not valid to have some memory associated with a
> numa node and some that is not?

As I described above, we already call
memblock_validate_numa_coverage() after of_numa_parse_memory_nodes()
success.
The threshold bytes of no node assigned memory is 0(arm64 / riscv) or
1MB(x86, introduced for e820/SRAT mismatch, but shared with DTB path
as well),
so in practice existing logic already doesn't allow no node assigned
memory, which corresponds to a missing `numa-node-id` in DT.

So as far as I know, the only case that passes
memblock_validate_numa_coverage() with a DT missing `numa-node-id` is
when numa_cleanup_meminfo() join two blocks of the same node (same
scenario as QEMU test case). An unassigned region exists between two
blocks of the same node, and no other node's memory exists in it.

So, in my opinion, at least for now, partial existence of
`numa-node-id` DT is not valid.
But maybe, somewhere, someone might want to skip `numa-node-id` for
the memory in the middle of the same node. So I can't be 100% sure.

Since neither of us is sure whether such a DT is valid, I'd rather
keep the current patch's direction because it doesn't change existing
policy.

> Rob

And always, thanks for taking the time to review.

Best Regards,
Sang-Heon Jeon
