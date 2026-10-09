Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0D74CC63C
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545434; cv=pass; b=cBqwjldHQ9veTU7PKQ8bTOJ0SGYS4gN1okJWAW2hOeeM9BblTe+reynsdawV8gvn51KaqK2rYswJnrQkpqf7IVzBcYeOze+0vXXnfJU39fBn3dHB2WXELF4U07MW9uw/5U7v5VgVnoEWvWiI947L37/eeMmZPU5BLHa2t82nwtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545434; c=relaxed/simple;
	bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZrDLGEVHlSGD6h7ujGN2uPPJJq7wv3mTCgOldaJWprbzWEDFuGv/UGYVaVhLn08aMtVYKkwcO7rJd3W3YRtGDfjBFRRMLEri5KLIahpR8ZYXjRikSf9gvjuMeKurzx6nDw4cLLnKxJrgKKpVpeK6ccPL5oMolC37/h8rWj/VSxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heV51OF/; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heV51OF/"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6790844c9b0so2770714d50.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 04:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791545426; cv=none;
        d=google.com; s=arc-20260327;
        b=PxxhHlGb5r7sAwdzm1W/6sJO4wWwqGNbrBRal7i8hgWkjtfkHm5nSaev0huaBVqFKv
         gjBo780sTg20Eqh3fs/VZ1gRh8I0Z43XElhK7JDnSCCMVAzdydRysu9I7rWm26gPOaCp
         VD0amrMLRQBD/3t4+BogkH0yDmfxDVdM0IyPZGVoHz75bm9TTcqYo3vGf7RXeafT51II
         +d7oxU2itUYmshM/L5sfxQPSQqoVGarh+hUl6ePrtNBPR9VQ8mst4zDzkw54CRYJILzh
         6r3c/xGSccqt/nmhezfxIWHmbmjusX+zcDWp/SFEtEal5/NKUYfpdMTgunANKIoV84Wt
         otCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=;
        fh=Ti1xx5oNGP0tyXZRYOf92YwJ7UQrch3Sg8p7ogaL2hQ=;
        b=A2V029TogdqvtZURGwpt4QCS8IAOtViZRaX2qNdZMeonDZBpu9M1XJQ5hON++W2xet
         jjHz8F9PUlsxPONnNUzBBK+CHzFl3Yr3DWfcOCHlrSQVw7SXW4SH+bSuSfZC4MT9U9c7
         sGcSziYegh9QkdD/71IGmTr6pxlHE6dJcnRY13zGmCgt74c2zlghJyy75W4XM5VQRDse
         bmII2P0uGD8IdIiO2fRB9e5Szjxkr5YRNHTW/2Cr9NG3VMEB+mKDm4L3cZQHZZDr/SF4
         5rhl0fmhsr8eo/Rx1avc7OzromF9uitRxl6rZBsS9cscLkxjj5SiV6rmzK52kFcZQqBN
         /mng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791545426; x=1792150226; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=;
        b=heV51OF/je6TDd7cnA4aqRFA7ufeixuPCY6OZfeY/ZhJPxY4GC8d38L1cUA+Ir9U14
         AtFl+rI0SFkyDls0E4F4Rnyj/a54yZa6jiWThn0cDF4uQajkHXtNRY7YwIcjxJMMLUbX
         8iXL0r1kboWd3J4RIe/8vMdka5inNZIQdvmSg7g2Av1DMVAqBA6JlQaoP7KIbRE8ctdz
         5puxRXOnrstfWHUMykG//7DRMYJ5unSw4Lk8bC9Vm1Vh5Vy1T4GDYQF2GMP1jMDP9wK4
         jEf2NkodhHNnRYMnQbHOcD29v5PGznM+eL4c49ujoIjM33JVRAhtZpQE5tZhbSqKobHo
         Tzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545426; x=1792150226;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=;
        b=F9V8eiBNZooal79I8omQ6Qzvpb3OI+OLEImuZxIJye+3ZznzVlOYq7hSC8T9grj+5O
         GrkKLen8u3BwrsOKP/IYWOqv+ptUM0oIB7GV+ghix3CG/MmWlcpaazlS1uhqtVk2lEaS
         ujWV6bKihaxDIycbYD6cpKpRlH3tfMT8ZwYxnLkHidKXCwNDPNgf7+qylAxioWAwxiSs
         K5poqLmMQ8yOwitUDagjy4dKPnezbyVeL5A8EHQwo5AwfzpX89vj0sadX5KMTyXsuduQ
         XVgV6ffpFrMOiyX3DHq4HqwinxUArHi0WKGzhAb1M7Vv7OtPsH7UxZqILyJev0lXmu9K
         4Uow==
X-Forwarded-Encrypted: i=1; AKwUvByLBq7P6mDE/+s3sISOmKfsVGNUVNORPk6PF71CB9H576RJA0s2Dx+qNOTO8398+dy+FZ7WAVV2B7h5@vger.kernel.org
X-Gm-Message-State: AFq9FYKpdiRKyn7ZFuAQS8mBQiNpWxef2Ko3GdiZ4awgsR8urE2KEyva
	DApSTXC1AMJrH8FhuqHq25IocbfgPMNF+uqUFc5btb7ZYXu82TMyPuRCjkS0QHYPMiPEspkuU/F
	7rdggwOXPCQdhWJwN5+XML+yU65qPtHE=
X-Gm-Gg: AYBFou2V2CP6snVmDnxl1X/z43KBQhRK/hqbv28qMcUaQodIsy//0K0qlAuOQrVIMxz
	T0G70eRG8vmB0xqsLUBQPkOxuDQlf7pvR3KUTT3tHmjTmr8fy8gnDrKKlUKoshaAE48NBjLDmSw
	CU93yqJ1J7QcajHQ8LA1vPUzd+lM8NmIUnTpPRVwb9mEK1rgcYQ44KlIdzGpF9C7GsxN1FxbW4r
	N9mYuz4bdshErQLzSHiOSg5+qSD8Vu9t3+ODUdvtNMBCF5TlFIWlSfOz8RxyI/B5mlPfyYZJ3au
	04hxyFUBzihSdZtK0ez/kfzwSEztzVYvVF93ba+yFSWDZoHqOfy20eqNrIK5rxMV1Htt1QqW0hW
	hmU/jsqmx8yGBBLFbea/uSeU=
X-Received: by 2002:a05:690e:b49:b0:675:6da9:1473 with SMTP id
 956f58d0204a3-67936984122mr569837d50.19.1791545426481; Fri, 09 Oct 2026
 04:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908090448.3332-1-ansuelsmth@gmail.com> <6c610758-5f34-4408-a6e5-f3718218ba94@intel.com>
In-Reply-To: <6c610758-5f34-4408-a6e5-f3718218ba94@intel.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 9 Oct 2026 13:30:12 +0200
X-Gm-Features: AclHuK8eqfw6Ev6f1SKA8eu2eg8tRj5EFkf2BXzzFiX-0ipAFbVTyYej92ofmYs
Message-ID: <CA+_ehUwrzx2gLS88438mqQC=ms71kaJpoU9ib8=zAdpsrXcGeA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] ASoC: Add support for Airoha AN7581
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Darren Ye <darren.ye@mediatek.com>, Rosen Penev <rosenp@gmail.com>, 
	Daniel Golle <daniel@makrotopia.org>, bui duc phuc <phucduc.bui@gmail.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 9 ott 2026 alle ore 13:25 Cezary Rojewski
<cezary.rojewski@intel.com> ha scritto:
>
> On 9/8/2026 11:04 AM, Christian Marangi wrote:
> > Add all the patch and documentation to support Airoha AN7581
> > sound driver.
> >
> > The card follows similar implementation with Mediatek with
> > the codec present on i2c but with a simplified implementation
> > register wise and additional frequency supported.
> >
> > Changes v6:
> > - Fix PCM probe allocation logic
> > - Split driver patch to dedicated PCM/ETDM patch and machine driver
> > Changes v5:
> > - Address comments from bot
> > - Better handle concurrent irq status bit
> > - Protect enable etdm
> > - Add Review tag for documentation patch
> > - Address formal comments from Cezary
>
> You've not included all the reviewers in the Cc list despite addressing
> some of the comments. I hope that wasn't done in bad faith to avoid
> further review.
>

Absolutely not. I usually use get_maintainers script to get
the emails so it's totally possible I make mistake and I forget
to include reviewers.

If you have a better process, please suggest it!

Anyway, what did I miss? I can totally send a followup patch
to address them! More than welcome to fix anything.

> > Changes v4:
> > - Improve Documentation YAML
> > - Move IRQ regmap to mtk_base_afe_irq
> > - Use mutex for user tracking in ETDM
> > - Register IRQ after memif allocation
> > - Address suggestion from bot
> > Changes v3:
> > - Major fix to the ETDM code
> > - Add duplex support
> > - Improve Kconfig setup
> > - Rework and improve YAML schema
> > Changes v2:
> > - Fix wrong edit in MAINTAINERS file
>
>
