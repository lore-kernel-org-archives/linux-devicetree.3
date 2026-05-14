Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C8D3B1034
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756018; cv=pass; b=Zu6njmr1gjf4xCKlJfVoGKTttACnBvELs90NScwF1RIJ6lh+8vKlArsE72AlBaIQJT6y6tEKeCl4aCm+e6bYgylNF5IRW711imMTw6JXKYtaoicjm0wnGveB164u3RSxIVtQrSVyHUNSI2S0iPOykeGDd5ZqjJ0twmQ6dmvpo3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756018; c=relaxed/simple;
	bh=D/hy75pVVD7xQMDMq2wQgOfcXjFZ/vnrtqqFgtLiMSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MNV5SqZtA78WPeF/ez/3MiWDcLRkbWVDdcWUUdijGyax3xrgpnJ05WZrxMey6BtWSxKbwsA4wVitPfqBXiJmNRyX1QzmSqFcJbg0iYIsKCB/3oOtI1BgcP9KI5YN4Zh+KARCGzMOwHHfY1evq/mt+qUTIKAezP6uoaD0veEQF9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V4Vc6Mzw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dIiGizWG; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V4Vc6Mzw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dIiGizWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778756015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=usImSnNOhuUJlPrs1m1jA0HT6vKRqN7utcXtdHMFR+U=;
	b=V4Vc6Mzw2ORs+z7ei7G223xfj59PMXpLvnQUW8WlYl6QAPoMH6U6pNK0bZtc4xEn1tIdRt
	zziZfjbtrQPKc2ioWBWYomfe47zx9scZ0FvsDotjPToDvbIQZDr30ODwfa7wNRUXeURNOq
	kvm3x20XzED96r+W7SFYuUBNOfrWozU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-rLJtdZZGMdKVqdMn3FDQPQ-1; Thu, 14 May 2026 06:53:34 -0400
X-MC-Unique: rLJtdZZGMdKVqdMn3FDQPQ-1
X-Mimecast-MFC-AGG-ID: rLJtdZZGMdKVqdMn3FDQPQ_1778756013
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b8704795d25so622769566b.2
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778756013; cv=none;
        d=google.com; s=arc-20240605;
        b=hBFJSTg1mrtqi0LYQdzFMXSXHxJIdgvmvYthMMr/xDXr9Yx0iZmDWqJVg5X+1YNHey
         tKZ1gtPBLY0cQ6PG1/JSM7I9DZ5cBIQfoXSyFCFlqiFN1jARyAeSUjazMozK5lP3i7c1
         +8UQY/HTifLd7QiqVs+0Pg5ltIv7JF8vBD/QoM4SzMveG76aeEmk5ZIXEAPO9TbDjDD0
         9+QCPykGi+pxkrnhYTmDFC8bhBm4CPJ6JZMaWJqWmjLD1SDjzC9YTBO6ETkksWF9voqa
         VvZQB98EdNot8Rd/aUT8mnXHbE9yKKG4clblr0mk7BsAdmRNPY5KBY7nizrmR01yt3CY
         Dwzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=usImSnNOhuUJlPrs1m1jA0HT6vKRqN7utcXtdHMFR+U=;
        fh=2FjTfoHNCRaHJSidq6sD9+BvXPjkrtmD5+I5s0ceWQU=;
        b=C0I02RP1nUahv/6yejmjtjPR45PZ/J4JNWSDVrFhy0+YTDhhk/1dfc88kIOZs8qZWr
         NA7AkpHzFnXMDoo7E58Zw5UDEEaav9gz6NuoDDkhwWWGKvUsWW+8PbqD6x2T1wEQO4e8
         XXLDI74TTxNnvqDNaMtsRqNupGuilqVCeGaqLPBgb+n2zGZAj7tapq4Jm6ETamxAVkiI
         NG/0/XV4GRM4g3brFhpSq7XA3B4rAaPRMXM4G2LAklBsCzMoS1NuRKb7PkUb3PeS/0Ub
         QK2zJRJpYNzUjb9vGJddiUBPqmD3D6rkxt1PpR4Stm2+LH1Mpl4UJSmldJmCfdBSVP/J
         PYaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778756013; x=1779360813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usImSnNOhuUJlPrs1m1jA0HT6vKRqN7utcXtdHMFR+U=;
        b=dIiGizWGSusXWy/ibbiXhxdbds2PY/AVRUG+CA2kfEG3wV7m3BIgIZcHNk36L+zeEV
         7ECQrbTYbL7Jc8BVQm1ELuXGyVcYZlKSg8Huzq48hdT3pBH12IcPdsGkseiciwN5/8xd
         M3XH91lkG4XjeDk+kIH+WR6G+BMODUx9XiEfoFXuU04cwmj0SjXg2LY+1dnzPXfrP1kB
         a0NonFwCczpuM1m098atcCwfAH8mUMuKIarOTlkg21b/1b9oXE2dYpqd41o8R1P6bA3M
         wHMdxK5VHEAM2dbLbaMN0EYTs+XU+Sm757JwIIHv9IY5M8rei4SYasnIf+e9WnP83B1B
         6EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778756013; x=1779360813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=usImSnNOhuUJlPrs1m1jA0HT6vKRqN7utcXtdHMFR+U=;
        b=rjlwCFCt6qYN9bnub1fua+UTAMxVMf/7f450Fbl5g6mBShaPBSpMAg+29Rkzwaq6Qp
         osxX161TEQFruWsLpPY0TjFXlRGGkeqYPuiPwwIfzWTfw3x+MPpR9YMuy2Qe+1H6YFoX
         lLhtE9M1HBbt4XAedfBizDQg53W8P/PgnMfPNxWmVZfz/n98KGdK+xeC9XENJIIseFTu
         O3QHF/lPRYOrPqaljyB0aTwNYFVFwe9h54vSLfCPKwV6ZSS5zb5PC2X9xdpE+c4T+9Or
         T4ThW1vLH5wBv4b22s206e3L4hN41XL6QRRbjbTDVHPwNZG4qTP8j37JzF6+Dzn75F/j
         2+IQ==
X-Forwarded-Encrypted: i=1; AFNElJ8aLiBvhEpOxqrFC/Cy1mv+6AAXlamZnpS5jVR6+CiESoeNb50qOD+xi8Xbhq/a45A8ZScbdGw6zFJ5@vger.kernel.org
X-Gm-Message-State: AOJu0YwcMvBoyD4z9Qsh2i1Lo4MzVnZcs1OWeyB3RMVHxzvS8EGuWFSk
	vmETGabBLXp8q0x/1+Drfpr9V+vDIFtEhTSlKQuvizt0vrHFxqrZmxWadKXRqIdRv2tT94KB28X
	ZdDhvNNWpN0i5K/OVlS1IIcU/RQchQtkLeziOCFJ2xtXBPh9dqbTj5spLVWWD1lHAvmnz7RRXBo
	FExyz7nZCEv16AOXusYUpAdcpyO+INVfcFsbBJ9Q==
X-Gm-Gg: Acq92OEQTejQz0pPHxRrQ8+KSYxcJiEIy6Jm4vhjMjH0H1rfJWPkDNqdHFpuJT/lvuZ
	AZ069GFnejKxGXBVOrx5c3399fNck75PHXqFJJ+eUWybi32ISCjghF8ODJdzDKT6P65zZue28TA
	kAGr54RRel7JGMhVl/miE+jis+aQYlWrEquGX+97mX5KME57a7tKKVHoog41Cj79gm8P0Kx0NL8
	QFo2A==
X-Received: by 2002:a17:907:2685:b0:bc2:1dab:3ea0 with SMTP id a640c23a62f3a-bd3bf772f73mr441496366b.8.1778756013096;
        Thu, 14 May 2026 03:53:33 -0700 (PDT)
X-Received: by 2002:a17:907:2685:b0:bc2:1dab:3ea0 with SMTP id
 a640c23a62f3a-bd3bf772f73mr441493566b.8.1778756012632; Thu, 14 May 2026
 03:53:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512020432.671-1-dongxuyang@eswincomputing.com>
 <20260512020747.993-1-dongxuyang@eswincomputing.com> <agNLDkz0L67lL0_f@redhat.com>
 <849a595.6278.19e2451f3d0.Coremail.dongxuyang@eswincomputing.com>
In-Reply-To: <849a595.6278.19e2451f3d0.Coremail.dongxuyang@eswincomputing.com>
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 14 May 2026 06:53:21 -0400
X-Gm-Features: AVHnY4I3njtjHiuEMuqMw-KgQnpWmuMTMA90SfIHx2cOdhl9yVHttXomqaAjYwo
Message-ID: <CABx5tqLDY+PVoyFeFge7z4BiHjg15tj5=y-uADOiK3sfRcTBtg@mail.gmail.com>
Subject: Re: Re: [PATCH v4 2/3] clk: eswin: Add eic7700 HSP clock driver
To: Xuyang Dong <dongxuyang@eswincomputing.com>
Cc: sashiko-bot@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, 
	huangyifeng@eswincomputing.com, benoit.monin@bootlin.com, 
	ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	pinkesh.vaghela@einfochips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 10:30=E2=80=AFPM Xuyang Dong
<dongxuyang@eswincomputing.com> wrote:
> I will update the following code to address this in next version.
>
> +       int ret;
> +
> +       ret =3D regmap_read(gate->regmap, gate->reg, &val);
> +       if (ret !=3D 0)
> +               return ret;
>
> Does this change look acceptable to you?

Yes, looks good.

Thanks,
Brian


> > With that fixed:
> >
> > Reviewed-by: Brian Masney <bmasney@redhat.com>
>

