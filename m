Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A793976AD
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780572547; cv=pass; b=M9eFIftGKA5Ov0GlKfCU3btf8IhmzH3fH4ZQbxkXohGvOVDJn+1asoNgaFzpw4irxKG4kvVwM2WTEcTyZu6bEyySpgi1p56Ne4uz5OkpnnUR/j2eF4PaNk7VJP/tdY0otqo9/vfJehbyJagKAxyf7dY9F1pJPqjKwXLXIwV7VHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780572547; c=relaxed/simple;
	bh=Cs65A+JiYKTwhggzuBKtKB2P9R9J58E7uSqXp6o8aV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e53fAHe+OlRT6U0dNOdpuShmhqj+ri8cakjCJAukjz24g/VISWsulo0GZwKssdyW+9RhJJBIuHFFwWD5VhuUXUq6krMQjEdpHxNo1sm6hLLU5VWqglmOOhr5PHeITa8d8hR+eVw07gwDSo+ec4pvi3Z/7Xj9I13lwN8VIeIoR0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UN1/IL3j; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UN1/IL3j"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7e2fd65f968so5116727b3.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 04:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780572545; cv=none;
        d=google.com; s=arc-20240605;
        b=LZMrgWBEJ6XjjnA18eK1MkzAtGZirOWONN+WGecJEm7ypxnLQ7q+d1LDySMtTpiw6O
         7fBabXShHEfyKStOK++O0BC977DBX87+jTaWnEn/pq3kh+x1OonugkGYHfZCeiGXRPdR
         LRkJkoyQndnHSaAfBAJQK6vShPV7Pvr4dM2fBQU09Udy1y9wVzVLG57D5arzSNzmLqbW
         upAGPBZS4hnUirmHuxbESSByuAPpm01Eh1winyneXIsYDf0ZJY6A22a+SyeYRJ9zD4P0
         Qmun7cxn4OrSnEAI6kzefjr+iXWrBSg0FS00VsAPN2sp3cd6VGqX2k+Irx1AYXAcuDq9
         uSCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zkqHmuiBI8YhYei9Sr8euhfLvyfF9S8OG07NhMelJTQ=;
        fh=Tbh7tJPpd+8QUDn5dXN/Y+BN1kW4j46Fc5bd3Y4ar24=;
        b=YK8InVZp9HR8ncodW7mU/yXEsLfIFMfk07QyuHxbz9Qy/7TW0pF8AYvl3buPpPosjo
         pOg1Gzsn0CYg2zlXaDXnPKro9yGHw37a4t5BMUUWDlhw5rxVKSWoz32fwzPRqX6sblOB
         bCUAOEmJ94K/eQ3/YLn8Yii5NI/iwFXkSNFAEP7iVgus8l3ma3lDRpcE3zuGVHRBW1jJ
         mPF1sdsFEPBoYfR4s/I2niFGVbvl0Rfk+y/+ul2Tna6e4NtqUmT7+UG3qONXR7jzyV+c
         Qli8PjXX1pIfPQ6W4+z5NN0P4zFNaThnR1/Nh66LvQWTXmUN35e5c0m0qxlVv9wL+PAI
         Xg7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780572545; x=1781177345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkqHmuiBI8YhYei9Sr8euhfLvyfF9S8OG07NhMelJTQ=;
        b=UN1/IL3j5LZm7sW+nwmRff6Wv3jN9ve190Fjm/u1/cwXsKVK6LSABUZSPtUULvbroo
         mJuAiaVlYuX3j9kSzUGvg/xbcbsxbKW2tDSDL7ur6BGc/wq/XK49/VL8NPTV59Ydb6aI
         B0BCopC9KQtSGmF1DPxv6fSekULoJ4wCsrGgW2eG0KLLgK82R/V/SzcS5oAxNuKErQbF
         PZCzT413X5WSHd3jbRWvpscFdlw1qDiLjVqoja1vOGvPbkrsbD83wlUUHzidmGzv1P4Q
         UJXGuXge8fWfvwC29jKaKHaQPk/QS9wp50/iRB9whgZThu2Fr4MRPrDY1aaNX8EIwCt2
         BVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780572545; x=1781177345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zkqHmuiBI8YhYei9Sr8euhfLvyfF9S8OG07NhMelJTQ=;
        b=Bu7iEfkzDiboUZkkYXgR3jSYuNa7gp51cJYEuyBb6rphKnghZxQ14wkG10JgqseCT1
         oAWjWyqJ7pSxNCQ3EBOGT8rxd44d3813vvENcWvyuqaY1iJrMj6uj6PeEEnp1gdzYopV
         mi44ELwH59hif6lZ1E60udmQlZViSVLxxFjU3LETarlWv3cEXO5Erj/CigxoZnHkToDz
         yENNTciq5cyXHK7JBbXNDFK1C2jkrfeDLBnm9yFleJFd4Lfbv5pUPonlVl3tS0SGKQb6
         NmL2Zqso+UiuKY8zhr5MDd04yT82zxE1orCGpzn4rtgTop3DeCrj19neLPzI2ERTNnEy
         f/qw==
X-Forwarded-Encrypted: i=1; AFNElJ9vCEpVJj5L9BVyGlv0D0RxfC5q0zjQlDZC3duYAvfdOkgTPWu7RHKagPMXav/qiUggyv5LtC+Mgmk1@vger.kernel.org
X-Gm-Message-State: AOJu0YyKWHqrFY4URIyWn3d08wUwByGI2iXTmoC4lOxhutJK3mnUs82K
	LFFN4dxc23LHDcAWKHLB5igxgz1xw7nBPzA8o706LFe+9MWpFdJoaBRXa66uSNFs5lW7nRiH4pP
	4bNdKkD1RfcReGWTOQ0OXN2gferrOt+HmFA==
X-Gm-Gg: Acq92OFutG9/h3Of519QqbpDX3CecBv4W3Oc0BrCe+9XwYtqkwHCa53hl+EMWub19ER
	MpSJS+gowIxMJowsrE3BtZgNtMvx0gNKZtm+mlHfuqjb4j5ZaWXGauKARTpHZ8UK8OQTqMuKoP3
	a7R8ele96KbKaIqhI6nGXmXxqJ1wv0s3jtc2Cl1nL1zEhNaTHug0YGd/opWwESZa+9dF+Jaz4bZ
	Ons0F9rHBC2qDEElvmBsNfFq+GLR/Gjlzdmfco92yhL3W12ixh67vC20v+IedfTcolRN9EWIzBe
	UGMAndlm+p/n0CQ=
X-Received: by 2002:a05:690c:2606:b0:7e9:9f7e:9ee with SMTP id
 00721157ae682-7ea490a99d0mr66374177b3.12.1780572545209; Thu, 04 Jun 2026
 04:29:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603152709.941788-1-ekffu200098@gmail.com> <20260603224959.GA2317076-robh@kernel.org>
In-Reply-To: <20260603224959.GA2317076-robh@kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Thu, 4 Jun 2026 20:28:53 +0900
X-Gm-Features: AVHnY4LO6QJQipS3aUPHD8bByFhy1AUIIWVhGSjhngAjWhQfjfW51RG8Y4NfyIo
Message-ID: <CABFDxMHtBeqVRevZr8T4ZbGNKa+0OciMDM+c+yN2aaXbRH7GAQ@mail.gmail.com>
Subject: Re: [PATCH] of: reserved_mem: prevent OOB when too many dynamic
 regions are defined
To: Rob Herring <robh@kernel.org>
Cc: saravanak@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 7:50=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Jun 04, 2026 at 12:27:09AM +0900, Sang-Heon Jeon wrote:
> > On boot, fdt_scan_reserved_mem() saves each dynamically-placed
> > /reserved-memory subnode into a local array of size
> > MAX_RESERVED_REGIONS.
> >
> > If the device tree declares more than MAX_RESERVED_REGIONS
> > dynamically-placed regions, fdt_scan_reserved_mem() writes past the
> > end of the local array.
> >
> > Add a bounds check that logs an error and skips the excess regions,
> > restoring the original behavior.
> >
> > Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved me=
mory regions are processed")
> > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> > ---
> > QEMU-based test results
> >
> > - With 65(MAX_RESERVED_REGIONS + 1) dynamically-placed region DTB
> >
> > 1) AS-IS (before-fix)
> > [    0.000000] OF: reserved mem: 0x000000043ffff000..0x000000043fffffff=
 (4 KiB) map non-reusable rgn00
> > [    0.000000] OF: reserved mem: 0x000000043fffe000..0x000000043fffefff=
 (4 KiB) map non-reusable rgn01
> >
> > ...
> >
> > [    0.000000] OF: reserved mem: 0x000000043ffc1000..0x000000043ffc1fff=
 (4 KiB) map non-reusable rgn62
> > [    0.000000] OF: reserved mem: 0x000000043ffc0000..0x000000043ffc0fff=
 (4 KiB) map non-reusable rgn63
> > [    0.000000] OF: reserved mem: not enough space for all defined regio=
ns.
> > [    0.000000] Kernel panic - not syncing: stack-protector: Kernel stac=
k is corrupted in: fdt_scan_reserved_mem+0x5f0/0x610
> > [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.1.0-rc1=
-00022-gcf5d7a55d3b6 #6 PREEMPT
> > [    0.000000] Hardware name: linux,dummy-virt (DT)
> > [    0.000000] Call trace:
> > [    0.000000]  show_stack+0x18/0x24 (C)
> > [    0.000000]  dump_stack_lvl+0x34/0x8c
> > [    0.000000]  dump_stack+0x18/0x24
> > [    0.000000]  vpanic+0x47c/0x4dc
> > [    0.000000]  do_panic_on_target_cpu+0x0/0x1c
> > [    0.000000]  __stack_chk_fail+0x20/0x24
> > [    0.000000]  fdt_scan_reserved_mem+0x5f0/0x610
> > [    0.000000]  early_init_fdt_scan_reserved_mem+0x50/0x124
> > [    0.000000]  arm64_memblock_init+0x188/0x2b8
> > [    0.000000]  setup_arch+0x24c/0x5f4
> > [    0.000000]  start_kernel+0x70/0x848
> > [    0.000000]  __primary_switched+0x88/0x90
> > [    0.000000] ---[ end Kernel panic - not syncing: stack-protector: Ke=
rnel stack is corrupted in: fdt_scan_reserved_mem+0x5f0/0x610 ]---
> >
> > 2) TO-BE (after-fix)
> > [    0.000000] OF: reserved mem: not enough space for all dynamic regio=
ns.
> > [    0.000000] OF: reserved mem: 0x000000043ffff000..0x000000043fffffff=
 (4 KiB) map non-reusable rgn00
> > [    0.000000] OF: reserved mem: 0x000000043fffe000..0x000000043fffefff=
 (4 KiB) map non-reusable rgn01
> >
> > ...
> >
> > [    0.000000] OF: reserved mem: 0x000000043ffc1000..0x000000043ffc1fff=
 (4 KiB) map non-reusable rgn62
> > [    0.000000] OF: reserved mem: 0x000000043ffc0000..0x000000043ffc0fff=
 (4 KiB) map non-reusable rgn63
> >
> > ---
> > Hello,
> >
> > I found a bug introduced by a previous patch, so I am sending this
> > fix as quickly as possible after testing. Although we are at the end
> > of the 7.1 -rc cycle, I do not want to rush this patch.
> >
> > Thank you as always for the thoughtful review.
> >
> > Best Regards,
> > Sang-Heon Jeon
> > ---
> >  drivers/of/of_reserved_mem.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.=
c
> > index ce1d5530ec0f..4efd521adee0 100644
> > --- a/drivers/of/of_reserved_mem.c
> > +++ b/drivers/of/of_reserved_mem.c
> > @@ -346,6 +346,12 @@ int __init fdt_scan_reserved_mem(void)
> >               err =3D __reserved_mem_reserve_reg(child, uname);
> >               if (!err)
> >                       count++;
> > +
> > +             if (dynamic_nodes_cnt =3D=3D MAX_RESERVED_REGIONS) {
> > +                     pr_err("not enough space for all dynamic regions.=
\n");
>
> It would be more useful to print the node name(s) that we skip.

Sounds good. There is a similar log in fdt_init_reserved_mem_node().
How about printing node name there as well? If you agree, I can do it
here or in a separate patch, whatever you prefer.

> Sashiko's analysis looks correct to me.

You're right, I missed some cases. I'll fix it.

> Rob

Thanks for reviewing.

Best Regards,
Sang-Heon Jeon
