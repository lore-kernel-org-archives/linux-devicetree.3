Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B0139A04D
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285294; cv=pass; b=RkEDop9qhGm/n8AYEoRUKfBZyCMzH4K0HUYX1+ARPeSTj2y3Xnctuv9DVRYNQxpWfb0nKyofP4xOEC+ArUKoaDQrDGm6xBPpgo5m0wMAgdiR7ihwTKBQItmM+O/pP8lVMRvA9jc80hs3Z6Y1U1e/29EtjV8fuMe474YMFCFwrCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285294; c=relaxed/simple;
	bh=lNyVK/k1mar/iYVkspzTfesxQNPzJWx/H9gGft796ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s1VZGlkc7IeHoEijctIKIVXS0kb9gk2ns7sVDdh9XG4NHhYL/3zqnfDCC6DMlZsiVovB1hJMLn90Ei91GONgiRCfslnKRUrFtYnUGkBEdp2Hepz65jppxvoW3P/M6a6IS6CtNKgGga1/G2lig1FuG1H7bqEm/LxixRar9f8z414=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1Z5jt0q; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1Z5jt0q"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38bd3bc3061so3570551fa.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774285291; cv=none;
        d=google.com; s=arc-20240605;
        b=LVn9MF/BlKuTkzFQDstmngzB5tJQ3sFkMsuykUaRjEYcBM3TxUak5TutwYg2PBglHL
         /Tzv/NgvFJ+Lrd31/1jJ2IX2jY+gBACbN23fSQxK9LX7vP/T/ojagAJW3/BTKpCQ2el8
         0fbOXX1OBUpEE5gEOn+erDfWo6uDcOs8lrXndeALM8Z2JXJa+BygqVhoUhI7l5GMjO9f
         Ug7ZfEMDp5NTYD45zFoGW/pwwssNSZxPMigPuciGLDUtwEer5rFckKvJ0SwdETwiHB9+
         lZvAKavaLygIrVUykNeNF1wSVM6MXWXmIebQRZym+L55KYlEG+jAcqLdxTNBW5svz8xD
         zBJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lNyVK/k1mar/iYVkspzTfesxQNPzJWx/H9gGft796ik=;
        fh=hKjQtHoFhOTxPey2UtzlwOjja0NIwmTqv4nmrvoql2M=;
        b=Y1Q+qybcMqjrbtF1BlPv7FVyS31nKQ4IWcvOdHet+Yb/4wecgqcJzd0iXWUgPafMkL
         FdEbdwXZ50e7I0EYRKZivTFdB+8cTGF6o4NdMM6Gw4p+4hevXeO5ZEuE0po8xAxG1s/8
         wmlBCuHsfV2oz2BKNVSDlNZT+JB83jdhFyAvTIFFsBh39F5iJendk+/oK/9ivRIYhjkl
         hkGJgN7a/wRGzqvBdF/DBcYQ/lBehAIyhQMxYn+L6pHC5G9WlOkKBkhLWsDPBRFofnnX
         SkLcOCVehhTl5MWIJ+fTw3DpF66viRss0c3cP1f2AsrMy9kvG8IZ3lmhkD9O2uoo2RBE
         yM4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774285291; x=1774890091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNyVK/k1mar/iYVkspzTfesxQNPzJWx/H9gGft796ik=;
        b=i1Z5jt0qyz2jPmWELXCMC3ilN7ESdW3XObP2mpBzb5AUBsCW7T3ZO7MBSGtuHkOWZF
         VjY41sEpNB94sQtKs3sq3JGotLNncBLFFnmGutjA/9ZbiVStmpPmgDaGVSCLlEvtwgvV
         LdI5wZ4RPu1YlMyj1Q5AJzklrfBqxK1u16nRmUIOGCoV0wYlSYiIpxodswKEnIleLRJZ
         rgsknIoORR1gJ6NvshdtUWW2xpnv4l4cQmW8Oo1clUuZzSE26bVUCi5J889l8fMfEzmC
         wfj+EIVUsCeSVMXJZmaPCQGFqz4h7nJA8pRmE/EkHtmkICvsVmCc0ZvAHO27aZyLKYLN
         J2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285291; x=1774890091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lNyVK/k1mar/iYVkspzTfesxQNPzJWx/H9gGft796ik=;
        b=EZ9YKO7yPJNS0ZCwd+MMa6M6lNojRQ9oZBZRTijprS1HsY4eR/bCTJYs8q4jqFTT0G
         qCXl+ovNB1EeSsBWQ9EYSUeH42V4Eo/c0rI9HmRZ5ZXZbCawKDkNkQWgNN/Nt1lXv2Qc
         cQ0LMAkd8F1fsvLcnoFottO9nCVGoaQ3VybciDu/g5cpdCQ24GgI7otJPXZim1AtQ+vr
         32f47QKVr+M5J+vyE2FYEoFSRMMvaQkne/2lQDIzH1lhyQWSi0k+xlJYlBhBiaN+pV9Q
         dRinZ1YiJmnfghE+l1iRo/C45uUou+798uzvR2AJpSNwqcoVTOnAgp5Da45R+r8tYFn+
         VrrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO5U+5RuIF9nDzfTKG+8Vdc/q4UVkI7efbkNvP06KoG64dnvnBQPQDXhQAG1J6he5GcukRM656n6/p@vger.kernel.org
X-Gm-Message-State: AOJu0YzGhPdKDdBsKKwEzHwE0/7uR176hTRhfDHzZLrZQcl97kx0IPpp
	mwzk/bupq9Ryyhb17knsdhfmzDaNr+53uJ+r5rVhMdqzPeaR1vmpRH8ThwWNUF/bjotXv1zUDpu
	++cMIaMSMeJdx9LRiRmBN8HLHisD/UgA=
X-Gm-Gg: ATEYQzxTAwDtAglJuqY9Lyd5Lb/h4xuCaUcaH7H06/sKU/kc0v4xIzqvXr9wTZF4TSJ
	PoiXa8uXqhTVuIDn4mqutC2Tp9ht+/oW7PXwtNagoM/XGQ8TQuST7u7FbwYOZ22cZbBPy8LYsOW
	3+EUrdVuBg4xvLsM5mHByXTsoO5CsH0ubvE2B1StslqzPFk6lT8EGRyXfOtHeGmqu85EtkxI2Rs
	IckgGDPMrG6O3M9bvAk0nwwVMwF/+2WBhRt9PgBSGV5+3y3sWWIVxwJy1SrcnIloAAaBBFNsQNs
	iFFLt3zuT2+xizPwBDXBzKqqHDOtOp6Q3reMOudr5nlQKeywtjIEP9ILefYY+GDBLy9xsgsIGkT
	1YgsZTvUzzWdNrfmZ95Oth1kyWA==
X-Received: by 2002:a2e:8a87:0:b0:387:799:17f8 with SMTP id
 38308e7fff4ca-38bf96682b9mr44321801fa.16.1774285290946; Mon, 23 Mar 2026
 10:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220-ayn-vendor-v1-1-292cbbb682b3@gmail.com>
 <20260221-proficient-eggplant-salmon-5544cd@quoll> <CALHNRZ8JT34J024TvG77LW2vN03q9te+xXmR0e7DMOz3GqouEQ@mail.gmail.com>
 <7a96a82a-f856-4bee-b4d5-2d1e71b92f23@kernel.org> <CALHNRZ9zzY=KW-XGqvGy1znF5tx0vQRLafXjc=+8RjS90GCQ2g@mail.gmail.com>
In-Reply-To: <CALHNRZ9zzY=KW-XGqvGy1znF5tx0vQRLafXjc=+8RjS90GCQ2g@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 23 Mar 2026 12:01:18 -0500
X-Gm-Features: AaiRm508j6GGTKEytP7WBsEhf-pMmAORn4CFJM4tt_FfMwLz4RlImemxzW9t26U
Message-ID: <CALHNRZ8GWUE6j-Dv8R=ENe=Vrz7Ya==mvXREp2dXKKQHrxGw2g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: Add AYN Technologies
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 21, 2026 at 11:22=E2=80=AFAM Aaron Kling <webgeek1234@gmail.com=
> wrote:
>
> On Sat, Feb 21, 2026 at 10:56=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >
> > On 21/02/2026 17:31, Aaron Kling wrote:
> > > On Sat, Feb 21, 2026 at 4:55=E2=80=AFAM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> > >>
> > >> On Fri, Feb 20, 2026 at 04:11:11PM -0600, Aaron Kling wrote:
> > >>> From: Xilin Wu <wuxilin123@gmail.com>
> > >>>
> > >>> Add an entry for AYN Technologies (https://www.ayntec.com/)
> > >>>
> > >>> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> > >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > >>> ---
> > >>> This was originally submitted as part of the original Odin 2 submis=
sion
> > >>> [0], but that series stalled, so submitting this separately. The pr=
efix
> > >>> was renamed to ayntec as per the review comment on that patch.
> > >>
> > >> And why do we want it without the rest? Answering: we don't want unu=
sed
> > >> binding and nothing in the commit msg explains other options.
> > >
> > > You have told me repeatedly to not do monolithic series that cross
> > > subsystems. So I am working through support for the AYN qcs8550
> >
> > So why is this patch not with the rest for the same subsystem?
> >
> > > devices and splitting that into a bunch of different series. Several
> > > of those independently reference this vendor prefix and may progress
> >
> > Which one? I see only one in the patchset pointed by [0]. I really do
> > not understand why you are doing it completely different than every
> > other upstreaming which you can find on lore.
>
> I literally just said they're not ready yet and that I was trying to
> get ahead of them with this. There's almost a dozen new drivers,
> several using this prefix, that have to be submitted before the device
> trees can be submitted. But fine. I'll just pre-req this to whichever
> sets of drivers I get ready to submit first.
>
> > > in any order, so this needs submitted separately. I am submitting it
> > > early to try to get it in before the rest are ready, so I don't have
> > > to list this as a dependency to all of them.

This patch has been superseded by [0], as required by [1].

Aaron

[0] https://lore.kernel.org/linux-arm-msm/20260323-ayn-qcs8550-v4-0-33a8ac3=
d53fa@gmail.com/
[1] https://lore.kernel.org/linux-arm-msm/c7fb3f89-6574-4761-9ef2-2fdf6d480=
1b5@kernel.org
