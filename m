Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070192EB5B8
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781546387; cv=pass; b=IUnmUoVutk189ZRP6Y83e9iTredFwCvvhdZLNhpsqUpe8T5gxCo/99bWkVL4ciyvf5BEAhwXgjpOGRV2znI2wK7HKcd0PNVjgSQhCR5L7xwY8blibq1CBgrFLgcFBj5BCPY8mDeiG2PHefBMdPfhQHskNMVtMy7DqKs102L1Naw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781546387; c=relaxed/simple;
	bh=Z04S6VNZxBeIrKrAtYyZN/BEOkXQu+9ARQV6UFG4A1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7pGItmaXR60iPTAtxhyHZREmgyR+oU7UvK/W88uBdIQOgnQoC5VKzq59Sv2j5HHL8tw1pjsISesOykv0wh6iN45KgzJr2CwEwCCoRgv5Zm8++XVIFuIqJaVYntM/ozev8XVmXCJWg0yCUKNTHOT1FuewZHZV25JhreYD7bAYhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=os+ZLkda; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="os+ZLkda"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-660ea43107fso3712611d50.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:59:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781546385; cv=none;
        d=google.com; s=arc-20240605;
        b=cSne+eYWRrFx3/xCjfwYWIcjddXm7Igcb9ghtQum2NQko9yslOsl2MJXVpDqci9/91
         D7Le9G7q74TtvZvbpJ+5wUxa5uvXM5tXGY+1IYPCtLCSTogPGSSoyyr4Sak160wz3fNs
         0q8RurQSeF60Bitg9Og7CZ4DpogF0bRi973Cz/BP9LPihfx5dTEvBwGXxce41RzE+XWo
         t0gWg+KgbrQ247wNy7CD00IiRmP/drOESy1oQLuZlk8Ro9IXLao28bkN5tfqqsAIN1Du
         6HN68EEFHeiag1+EiCUJfjOv/aZ0ToO7s3XUdNMjWABcbWuCS04EowGch4Qc5iWaQRaa
         RqNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N7DCS1FhJDnbMeFiAtGx2JiLKTME+H3qz4ArR/Ptiac=;
        fh=6SiOdMTc/qVmcak7FUizHBdx6P6mWOYPX9rKP5MrNU4=;
        b=ULTyu2ZcnQ2Mi31ifr0tMfEcmW12Goryt/xD2VfmfSCVPAgMmQ18hPwml//TKMKDeX
         Er+JKB9dTi9xmtsqZqVExUNrwI2/+O/3suoTW1RcHUjoTquRqyQ+jLaOw9CZE6ualgR1
         8K+iE207Icm+fj3zC+cInogo9zyPEo8SIhmFqrXjznXlkgOPbqK2xXo4weo8ThstUX6m
         N9V4QUgbvLkhmsUWVSKGAcoWA81oCVrtyc1bnWqHv5o7L2oC0G7BpVi6kPbWEdeSC/sA
         gpzZkiyKOtyhYiFgaNoe1yHMkc410t9VNTlt0yWNTzhFoF6Ela1Vc4eh88CPiDCCAKXH
         i23Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781546385; x=1782151185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7DCS1FhJDnbMeFiAtGx2JiLKTME+H3qz4ArR/Ptiac=;
        b=os+ZLkdaYtfa2WOgWAELkzrRBFkGa4KMATzZC5R+cx2vHZXrKrmwKUqTzshJyElwNl
         vsFpUireuh/LqiTShXZLhi3C/ckqIvlWEd2ne6/NLOIY9AQViYrdCFh4XLU92uUWLZai
         WJKlm6y6XGwJjA0jaFzXaquNHP3HOttNHNYp1crN3JnNzbGxMu0ra/K2RX+JDAyQZg6m
         NoPGyI+gUTlF+jIO1Z7vuvo/ygRIVsf0IljKQqPyrZabG2PuomEYFd0Zn9Y2NZX+zVC7
         hjYszF/Kewb2Kb1SZmBSJedfrkNip4iTRsQq+BUg9gpPRXdtwhljsBFzyKe/ONazqC4w
         i53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781546385; x=1782151185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N7DCS1FhJDnbMeFiAtGx2JiLKTME+H3qz4ArR/Ptiac=;
        b=rxjbWFJJM3+RHLtRxNFOZ8rn/Hcpg0i03p1vfCogF9IqENSvv1EXdspd7FRIh/78tk
         ereDphrXgQ/aJQvFe7jCfirhxljFLteuP1yVswSVUckzty2WNV7IGKvSpWhatEhgJUJp
         1+F+MRWHyaPocjhSkWwV0PZBaN3PFnImTZqvNw2lQzBBsqqllvmM96xNt3vXzhdXjZYp
         cf6zDwepXkqv4O2/EEoC+P7Wpi5+zT1lK3L/IscF6uzywrytWWRPHiykqN3hTmAFQ8cf
         jmd1eh9Fs+7XGJ3xIBJKRI66ZypuXISfE+Xyy/fGmuf6LK2pa827hN/7VnyrHL4akW7g
         bGew==
X-Forwarded-Encrypted: i=1; AFNElJ+v1tGKuS5Wm7k/IKYhgePnzXgDGCQGf4rHYg9IzmQzs4fmF2MWF1fnJakz5uuvjLRv2dbOBEb86Ffn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7/rC7C+twG5520RIGhlYR/ZkKgsGNG0nJhYKPKxYP1mpPBZ4G
	jl5OT72KvwgwvwE6hoa6cQ+oA16JUU/B5f4DfRslQ9yBen7Guuj9LgNe2vqZ2YFHFES+s7gEB1H
	SVyYUkrNg+qr5OgiLnrtCaH82Epnifds=
X-Gm-Gg: Acq92OGUjB0vscAr0YnQK93L+77DiTEDYonaEi8WA7QLT2p80gsOy7yc8OK54NGMkS2
	H6tM2rcD5mJO1XM3zlqJHd9V1RAARd/PdFcFg3aHZHWintZh3pukA0+TG0iKKAEBbcvzPbXxj+V
	ub8V+YIJFjiQXIjeokrzoBh56txWXN1ZMGPmTAOkwagfhTIvPqVKvX/1q04OsqsruKk9zMJk/LV
	2p0x3nT+ZeFkb27XLmVctRJKGPuQXGO2TZysQtLKeYqCQrUKkzIvC7K26t5zgDPOnt0SNJI3hRg
	T8+HSLSeAsrceX8=
X-Received: by 2002:a05:690e:124a:b0:660:5df1:f243 with SMTP id
 956f58d0204a3-66278346bd2mr13188710d50.50.1781546384795; Mon, 15 Jun 2026
 10:59:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510171353.1406018-1-ekffu200098@gmail.com>
 <20260510171353.1406018-3-ekffu200098@gmail.com> <20260601220346.GB54006-robh@kernel.org>
In-Reply-To: <20260601220346.GB54006-robh@kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Tue, 16 Jun 2026 02:59:32 +0900
X-Gm-Features: AVVi8Ce3VjKsZhdbSUBBzYGD6PwF3j2b4jhtEgG1brsSGXPufZKHeAEi0A9pCcg
Message-ID: <CABFDxMHRqNDg1TmuYSWFuF95rYgDX2SpThn-TvbTGMTen8kx2w@mail.gmail.com>
Subject: Re: [PATCH 2/2] of/fdt: make early_init_dt_scan_chosen() return void
To: Rob Herring <robh@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, saravanak@kernel.org, linuxppc-dev@lists.ozlabs.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jun 2, 2026 at 7:03=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, May 11, 2026 at 02:13:53AM +0900, Sang-Heon Jeon wrote:
> > Since commit 064e32dc5b03 ("of: fdt: Honor CONFIG_CMDLINE* even
> > without /chosen node, take 2"), early_init_dt_scan_chosen() always
> > returns 0, so the return value checks at its callers have become
> > dead code.
> >
> > Drop the return value, change the function to return void, and
> > update its declaration and callers accordingly. No functional
> > change.
> >
> > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> > ---
> > dt-test result
> >
> > [    0.684136] ### dt-test ### start of unittest - you will see error m=
essages
> > [    0.685849] ### dt-test ### EXPECT \ : Duplicate name in testcase-da=
ta, renamed to "duplicate-name#1"
> > [    0.685870] Duplicate name in testcase-data, renamed to "duplicate-n=
ame#1"
> > [    0.689496] ### dt-test ### EXPECT / : Duplicate name in testcase-da=
ta, renamed to "duplicate-name#1"
> >
> > ...
> >
> > [    1.693384] ### dt-test ### EXPECT / : OF: resolver: overlay phandle=
 fixup failed: -22
> > [    1.693386] ### dt-test ### EXPECT / : OF: resolver: node label 'thi=
s_label_does_not_exist' not found in live devicetree symbols table
> > [    1.694968] ### dt-test ### end of unittest - 405 passed, 0 failed
> > ---
> >  drivers/of/fdt.c       | 10 ++--------
> >  include/linux/of_fdt.h |  2 +-
> >  2 files changed, 3 insertions(+), 9 deletions(-)
>
> Looks like this is dependent on patch 1, so I'm assuming the PPC folks
> will take the series.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Thanks for reviewing, Rob :)

The merge window is now open. PPC folks, could you take a look and
pick this series up for 7.2?

Best Regards,
Sang-Heon Jeon
