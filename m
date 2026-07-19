Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2422F37F8A7
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 23:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784503223; cv=pass; b=tJcdJ3bYT5EqE10nLMNT/HpDgaq5fw/A3x0aHHS69/KPRtJf2fur1iThqD2F+id11u23mTRQqX+e4MDPuwAIUlxwSR9zcKGWkIpM4iIJzXz+grFUkxULPl/cNVeb35khFHfDIfyCdK5ypIXbsZxvI8j6aTeRd8FotVlkwyzOjPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784503223; c=relaxed/simple;
	bh=DWT7/MJowsj2WV+e/BvUBOitlHcs+O939V9MzG/T3iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GX3SlGCUHNEb4Bf3hXeKETEry2yW/Y/W2GGVmOpC42Z54riACiJ0vVGUfK8MlVXbK83Lx7mfgyOVmDqE+FGH7C8WP6rcbUQrHL78gy8VNCXb6piZIteODYcSwCiAcoDvEC2ys56dIpuRS8N39U5K8Tg5URSD4zOv6XVdMiWRuNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=B6Qi70SU; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="B6Qi70SU"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6682259cae6so4059583d50.3
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 16:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784503219; cv=none;
        d=google.com; s=arc-20260327;
        b=oxYuYWR7m6GmNa2KJNKJqzYlVVQSm8rwpt8hTitW0SlPMLNddlvAlYOIOZNFDLFBQ6
         wVS90qXWJohddDH6S5JzNKjM6TfKyPkamet0eMOXpAd2Jo/tLkKGAyc0FnIA5VJDUDTb
         tfQRQiIuy744eLBWgKuaFwZCj2YURjCYi7TZ5T3xDtBaeoMud69VIXzXj9O1Pve/iAeL
         JPICJpKIw1IpVbwxu29UfYDP9hC+IAIxC2BnxT+qk42Vtd0aZorgk/ARwV7lDR4dInSw
         tjEQDMO3iyb3QzJx9pzifjs3Dxb+UcoKvZKHbf90HYXAGJHdrgHdD6Wwe8Z2b7BF3YhD
         Fguw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UPqjPIJbJ4hSMkmX6fzNuKXuPBcJE4+S9+cyMi05hk4=;
        fh=ouhJz7vqSUvFpmReqlcORxyKIuF9N9iMCLkNVfI/mwI=;
        b=aCdMqEwLkL4cP7rLc2nvzpPP3oS+KK+hrpWBf0echdYbZk5n+8YOua0ZJ6t8d314a6
         PJk+iiGQ3L2u2mRT/xgKRcGFoVXlZe+YCElZF6jicRppHCgg0hppZgfeRlEgqtgIPL5c
         L2y/kAxH+8XXkxreu18dNcyA3Et3JPGHr6qtL4PQZT0v+6Y/cO3yyy2FkctFVdKL84UM
         Fdf63/K88xehLeOz8FN7jySNNO2TV+FqgZLytijjc4mwf1mVBmwmkPE9bADaX3v0fV5n
         OqvXle3EbA111M0fpA4uIwV+06u67dwCDipYdjdYHlGs2Xo+FS5T7PpCsEUw9S/AFi/r
         fxIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784503219; x=1785108019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UPqjPIJbJ4hSMkmX6fzNuKXuPBcJE4+S9+cyMi05hk4=;
        b=B6Qi70SUemhqvfqYHGv3PIEdkl5xy6wZSKEYEOcImb+l2KX0NqlpwlL4ZvRMuSSMF0
         jLZ/h82+L5fvNx8RW2HeWI8DGzkjPpI6tdOQWY7n/DeLzy5ex9DaOFp3JhLzj5uFoFA2
         lBOLaXDUNxgJLYdJxUkWiElh+D9QZ9d3i6uMn699QusxxYfo568MlWP36Y+yBm7ou6OM
         IeepW7uxmZoDj0ENjw6EyzxlQJtPAt91IbgVCg/9cZ0kiXGxwcRgpd11uLkUCt5emZNA
         vlO88bySJooJymm4eMOKF9IVHhIibwF7fBKEDq7vTAFfuX6qkvF10q/uUVeQtHmxmhns
         YPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784503219; x=1785108019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPqjPIJbJ4hSMkmX6fzNuKXuPBcJE4+S9+cyMi05hk4=;
        b=B4DcAF7KM1kh+ezDxKlS1JBjqrOxMJxEwt6mKADsxvLVSkc5h4UitKEi5Mg0a3EOCL
         uy66SfKh/OzM3Ij7jNfz8gq/rZOtojrneKTqjTBCw7LBYP8S11Y/8OlscDVgFmQZ+VFd
         hbuYG8Qu6DMMJ1GwP5WOIO2vw6LqhuUEYpJCVS/dLzQgR7kzNAg6S5QwhDhu5ZDMk+pi
         zNjFZi1tH7tfmzRxs7K1q2rsw00yd77HvGOppYWq6CaKzUjb9yx8NIqGbtRVGwOYWVlY
         FI+Ua6Gg3VvC9SXeFn32TXkx/K5FcE26hpxB7aDeHCHHhj0mB6RXX+F7gQf1fHKFpHX9
         IX7A==
X-Forwarded-Encrypted: i=1; AHgh+RrGX2cQPiPmOnxAlzcraXg+yNEuXxzDlFhu2meMX8hQYMFyLvvfZMdK/EBco2hyylm0q/BpNOFukta6@vger.kernel.org
X-Gm-Message-State: AOJu0YyrHAqZYGRm4HIZUgJNyYm6JYEjEAmgYbEjw7tmh4J0KNqUZSL2
	f7C+EitBx0rU1Vdyl3xIQnrRht5nunpRQDxzGDYUnj/A/FGxpvhQnDM1d6fbBalVg9aA7ZUemWA
	BmkAXzTsDcON7M6z4Gt9IHLejWDaSn85Ek9LlU/3MEw==
X-Gm-Gg: AfdE7cndld3NojqCw5luwBZzu2hXTBTK09TJzR+JlxbtJVhj245lBtcCrrhCXgpky9i
	TBaMKLXsD3QKFSTsYhTMxrVqgF6VWw5RvcN9D6KCmxAjnPyWoUWnibhztGD7KLGzioxY3d55L0+
	3sCy+x4zd0oyfLiXwXxDnoz1EXU8Doi0P38BlvIPmTkSXCzXqKkm7oY/m6HxgTIZVOlHH0GPOj1
	2b4S0vrTv8/9LXu9u5/ontNyMQPiQTDYFORscesyGpLX1r7Mdq34C5VVxKTe+WpuK3kmApyU9op
	Kum2Iv/H5pFHmI2G85hrao40sgqO5P7P4FrOIZadI9dtFRct8bk=
X-Received: by 2002:a05:690e:2504:10b0:667:c15b:dab6 with SMTP id
 956f58d0204a3-6683be6aa35mr2695296d50.95.1784503219030; Sun, 19 Jul 2026
 16:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <wjbz5tp7vjrsjwjaiu3n7du5ksbrlsduuxhwg2wriyxshkrqd5@t3sdxr6ua2sg>
 <20260713123759-GKD106000@kernel.org> <CAEev2e-g3bZcohFf_7b5CaVyi0BeWi5uwLGj6MuhQXp16jiyEQ@mail.gmail.com>
 <20260713235742-GKE106000@kernel.org>
In-Reply-To: <20260713235742-GKE106000@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Sun, 19 Jul 2026 18:20:08 -0500
X-Gm-Features: AUfX_mxUPpHWs2hIHbiNCUZT8v6smWRhuvoQSN4l0SVoBHHrNzCPKAS_FyVfPXc
Message-ID: <CAEev2e_hmQBrk3Vfv4WmeH+ex_gMwW_9mgNKaUjFaiCScxAqTQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add UFS Host driver support for SpacemiT K3 SoC
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

On Mon, Jul 13, 2026 at 6:57=E2=80=AFPM Yixun Lan <dlan@kernel.org> wrote:
>
> Hi Anirudh,
>
> On 09:56 Mon 13 Jul     , Anirudh Srinivasan wrote:
> > Hi Yixun,
> >
> > On Mon, Jul 13, 2026 at 7:38=E2=80=AFAM Yixun Lan <dlan@kernel.org> wro=
te:
> > >
> > > Hi Anirudh,
> > >
> > > On 22:40 Sun 12 Jul     , Anirudh Srinivasan wrote:
> > > > Hi Yixun,
> > > >
> > > > On Thu, Jul 02, 2026 at 02:31:34AM +0000, Yixun Lan wrote:
> > > > > This series try to add UFS support for SpacemiT K3 SoC, the contr=
oller
> > > > > components consists of System Bus Interface Unit, UFS Host Contro=
ller
> > > > > Interface, UFS Transport Protocol Layer, UFS Host Registers, Devi=
ce
> > > > > Management Entity (DME), Transport Layer, Network Layer, Data Lin=
k
> > > > > Layer, PHY Adapter Layer, and M-PHY Interface. A more detail func=
tional
> > > > > block diagram can be found in SpacemiT website, chapter 9.7.3 [1]
> > > > >
> > > > > Please note, in order to test this driver, the UFS clock driver[2=
] here
> > > > > should be applied first as a prerequisite patch.
> > > > >
> > > > > One known issue is that the device will occasionally raise BKOPS =
interrupt
> > > > > when doing some high load test, log from dmesg shows
> > > > >
> > > > > [  806.710763] ufshcd-spacemit c0e00000.ufshc: ufshcd_bkops_excep=
tion_event_handler: device raised urgent BKOPS exception for bkops status 1
> > > > >
> > > > > Link: https://spacemit.com/community/document/info?nodepath=3Dhar=
dware/key_stone/k3/k3_docs/k3_usermanual/09_memory_storage.md&lang=3Den [1]
> > > > > Link: https://lore.kernel.org/all/20260630-06-clk-ufs-support-v1-=
0-cf7521d1d0fe@kernel.org/ [2]
> > > > > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > > >
> > > > I see this during probe on a k3-pico-itx. Does the UFS chip on boar=
d
> > > > have an RPMB block on it? Is this error of any concern.
> > > >
> > > It's probably true of having a RPMB block, but not used in K3 platfor=
m, so can ignore
> > >
> > > > [    5.957864] ufshcd-spacemit c0e00000.ufshc: ufshcd_scsi_add_wlus=
: BOOT WLUN not found
> ..
> > > > [    5.963319] bus_add_device: cannot add device 'ufs_rpmb0' to unr=
egistered bus 'ufs_rpmb'
>
> Just checked code under drivers/ufs/, and couldn't find where ufs_rpmb bu=
s is registered,
> so this kind of warning/error message is expected, or could UFS maintaine=
r confirm this?

Seems like both of these are bugs with the existing UFS/RPMB code in
the kernel.  The dev_err("BOOT WLUN not found") print should probably
be downgraded to a dev_warn. And like you mentiond above, the ufs_rpmb
bus doesn't seem to be registered before the ufs device is probed.

>
> > > > [    5.971155] ufshcd-spacemit c0e00000.ufshc: Failed to register U=
FS RPMB device 0
> > > >
> > > Maybe disable CONFIG_RPMB to silent this? I've not tested this option=
 locally
> >
> > I'm testing on a distro defconfig, so it has this option enabled.
> >
> > Is there anything we can do in the driver to have it ignore the RPMB?
>
> No, but why not disable CONFIG_RPMB in the first place
>
> > If the error is a red-herring, we shouldn't be displaying it at all in
> > the first place.
> >
>
> Either fix the code or just ignore it..
>
> --
> Yixun Lan (dlan)
