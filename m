Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021863DE45C
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 20:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785356805; cv=pass; b=YI9m71gw0E6ekG+iBcAQwzpG0G25MBk/pCf7ebOFIwPkskIfI2C4SDcJoxOlQ9l4sfQfaH8D27brVQOtnzV8Fg81nQaotRjVcaxFtI7pdu1eY+2J5+pbJKoy41jud62bVWceZzlUq6RHa/GNhODsjSCFrl4b1AbYJ8uMPeRgS/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785356805; c=relaxed/simple;
	bh=Cm2CpQg6vqMhCdk/ESknVF7+UXIvAD3hVPBjdumD5XY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qbwyy5XHCXO5pfq6sD9sfNg49kyt+0Hl8WYrzd/NGKtGjr1jjJgwQdJWRwz1OS7A+MJP023u5XQ6Y/hrE8ge8GATJ17bqdkZmvuFYKqm/8WPZl1xc/1eEvycyZ+WS2UFcDOd3OgAS6Sym0W7KvjxtLsfy7Bz40b4ssHotF5CFb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHnQ7GrW; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHnQ7GrW"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15d111ca99so159497666b.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785356801; cv=none;
        d=google.com; s=arc-20260327;
        b=s9LNCL7QbDt7SFZDPCNOiFS4MvgDMqpagKIbdQzh1tiLCyD4wgL9sANm/4mgqPnWQ+
         VQqNBvuDEgb2yeUDOWmikEA8yzB+s+IK6BmP5NiK5mj1Ki5TYoKYNY/aCMWDQTTUNP9M
         BtUE17ya8J9l4M16LL6PltfuCyk5m4lpPEomQmxJnZYQeCGRNGZO0SX7/nbHE0EZZymQ
         bmb6XjnIgD4ndQNlHWrqSLSxJ+wUpdUJMniAp3b7LN9nvyZM6DD46JKfgaSsLrBHMKS4
         OFDRxbsJWx3GqJh+NKQoaqRXeBlkeZ7xntoxWkDJWZOrlgEsH7cowf5+H2yWD69zArxL
         Iyaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tWhipNQFQXej/O38PkqRLXjVEfaFmVqdc8EX6rwHmTc=;
        fh=iMRQFd/58FEsFSHAlLPcS8G0qET6OEJgmTZd4UYU4GA=;
        b=SCLFxvAR/T1nOlgKoX6wUod5G8CouMe1rbnEGnScaFujYbNzRfghv4M5Csblm26X6Z
         I0Q4med0gcA9DF8kEbkOtifNMr5ReUNaSpXV4HtXBaAMDtZUAOz2i4t38QVYxZ6czfSm
         gp/USO5xxqfK9b9yH+hYClnUeCr9jabFLagKbcnpL+cCtqqgDuNwxEuNZ9EvteV4d3TI
         5lc1I8sUs9u4HBNaRUvHNEACF4OE+TCK8/GrQVh87ROCmB0jjIo9m58piTHODSvRi/um
         zX6ZQq1Y+20QU6D3ClJHKJqrLfMLkIpxTKjS0cwAx4ZwmcLO4y+AGaEcBKyObBeBuCW+
         9HCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785356801; x=1785961601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tWhipNQFQXej/O38PkqRLXjVEfaFmVqdc8EX6rwHmTc=;
        b=WHnQ7GrWXyG+ZRsa9N35Go7/xmwHvFj0L2JlkcoFDEGD+tNUoG7BxdP1XTRCrDzf4n
         AFbOTk9jpxDBnQ4Rq3yB/TwViVFLKVv6l0AVLR3NU9BnsOBBN4IyxRcRAtDgnKwDyeRm
         D4Ef73P2GB5rVQRivUTQSvZbP+lijyHBEhdPQ8acDFpv40UVRfrZufb9FEF5uGvGhp0u
         0YOanhYDBgPjQ8ZDx9kSVBcxxKsWP0qmOXRWsYZizhkGIGihL/yTO6eEF2rLxcQ1zMYQ
         fZMAd0X9N/dvEevId9C0OadcR/TKF060+iByc93u/49Y72DBwOfVVj2Zs+FolIvxvj/S
         YS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785356801; x=1785961601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWhipNQFQXej/O38PkqRLXjVEfaFmVqdc8EX6rwHmTc=;
        b=ApWuAGYaah46U1zmDcO88DMPx1fwxY1CtcncaEtIEVjGSCj8HCL4NHxjRdz554tAxv
         IZwZTpoitnVEwu0vGZx8corY/eo00u6j5x5vt0mHHLvhWpQocsWr+n5hs32PtwNfAHWu
         k+1smWftjt66cXFwn73JrDe98CokAJ7wiXypdz0BaAwPeRSAaUHdAgXfqu+/mp5FDTqn
         QZ2TYAlTKOgq3MgKtIXfrevAF0yqe876Yqcba1Wrgh2sV5XHdb/mpsREGsxkxZAzw0bE
         bFV+i5iK7ldskdiFX3d/4yuNZYmkTwIAHenj2cLTSbDSj+s/0q9KYcQj+q8MfCt0S09j
         Oi/g==
X-Forwarded-Encrypted: i=1; AHgh+Rq4YXnncJ2o9AJSpBg0bpm/C4bn/zrZkZlBwuDC90bD8+cpFWldGHwQmKbWqFyQWiYQEqAPlpsA2TPM@vger.kernel.org
X-Gm-Message-State: AOJu0YwNP2NvC9t7WXMj3jHxlxlPN/gQeJ/DmE9vt64IDB8hw7Lh0ohI
	2HjwrgoPS1fcNT8V/F6Xb2xWhxE1OsOXsU8Jehyl+r+ssEGjc67u+h/d9PX6zAfVFGnEn6WEQzi
	e4x+iFnPYMQ66YmAu7Fk0RCuS1RCNigI=
X-Gm-Gg: AR+sD10PP+8Zt+R0HZR5A7mkYiElsJPFvOtn50NHEf4oiJi7EOQ5q51+QKzfTZx4GJx
	HHgvUUzQ7azAKNAUdlZqoBa/0WWX+GM1VahHj/9RR13czQ00ge4A0EyYlvGV0zoAFchG6I2G9K4
	Gb3XpaIULPFMou0YSObyvXjuP0d9z33zYO19DyD282SVH6dK4E8L3Cp61f7rSLWl3KjgdHEpvlu
	XIWAPhDi30M+e0AB3moTSBy1RoDqIzpfDr2CWdju0dlTVCzMzwKDtdYs6yPMtgw4Q4uuZfubxVk
	W8eiCMF++FIj3ATxY/OMPyW0Itgob4cjJG4rKW2KqlqzixLyF3AcSHXexUM0FxRXb6L1Lo1eN2p
	H9SvXNe6DC+hQ2knUryknQzSFDxZoU6gGwiq/sDYV6A5CGseGQyM2sdTaKIJSgpTwrZqDeSMEyU
	GVoHtB7mkATB1eGHbcZN5FrXz0kz64SK01ljdlCJBTz/Ywo4rOSBJjK50=
X-Received: by 2002:a17:907:960a:b0:c1f:1520:4de3 with SMTP id
 a640c23a62f3a-c1fa53ad2f4mr287866b.7.1785356800911; Wed, 29 Jul 2026 13:26:40
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260628231156.1254012-1-rosenp@gmail.com> <20260628232714.BD9581F000E9@smtp.kernel.org>
 <CAKxU2N-3zVUM6A-fQnYWud4O7M55Ghc-wnTCG+8DD6_nh2827g@mail.gmail.com>
 <ba56ee70-9702-4b11-ad04-d63322ab60b4@app.fastmail.com> <CAKxU2N9Nt+HF-4TzB3+_5ta=28wb0xCCLuUVO6Bm=LW3ZnNmHw@mail.gmail.com>
 <d05ffeca-f289-42dd-b454-5a7c7741c6d5@app.fastmail.com>
In-Reply-To: <d05ffeca-f289-42dd-b454-5a7c7741c6d5@app.fastmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 29 Jul 2026 13:26:29 -0700
X-Gm-Features: AUfX_mzAAzLz-CN3JXCsoYNE_H_HunaCmfqznY42yDJmShDSNw2RihF7rX2dsB8
Message-ID: <CAKxU2N8Akw0+dc=wHUmLrqJe6d6rrk2O-BqeRB7D55iU-S_uLA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
To: Arnd Bergmann <arnd@arndb.de>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 12:31=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Wed, Jul 29, 2026, at 20:13, Rosen Penev wrote:
> > On Wed, Jul 29, 2026 at 8:40=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> w=
rote:
>
> >>
> >> >> commit 4f061464281d4964ce46dab60d36a09328f14862
> >> >> Author: Rosen Penev <rosenp@gmail.com>
> >> >>
> >> >> ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
> > This patch can be dropped.
> >
> > https://lore.kernel.org/all/20260727140939.389-1-strst.gs@gmail.com/
> >
> > is the proper solution to the problem.
>
> Right, that looks a lot better, at least as a hotfix. Could you
> respin that one to print a warning in the loop for every bridge
> window that is not bdev->addr_s[0]? That way we can also fix
> up the DT to have the correct data, which at the minimum helps
> avoid nonsense but may also be needed to avoid future problems.
Not my patch.

That patch effectively ignores values in dts. Needed because of bcm drivers=
.
>
>       Arnd
