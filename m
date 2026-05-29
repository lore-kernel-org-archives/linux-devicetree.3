Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746DB1CD2C
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 13:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060970; cv=pass; b=KzABMCm95pWpZGvdGwpokt+uOB4FSCSkbd0GifeaQzHcsvjSYWo1raIcB2D+k0NDi5IjAeEAVjV+w8Y3zBB78Bz5AjRLtpru6qIYvi1KKcwLIjN8D9mZK7f1rkreSyC3X/ijzjM+GwVZYg8U164yjt7j7wNt1jWBx9pZ5eBpovM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060970; c=relaxed/simple;
	bh=IAsxPFjVuJP+GW36OLLktoHQwp0GqX6ZN5zfutXTnoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uhiSRlT4Z/NwYUnKvCUXrzCoyjj7S3k8qMshC8fXu2Nw+gSk/DKNixzMr7WJ3Nod0ne1RcBZVEzmc+FSTvi9w7mETGcsN78QaWX86ju8bHFUtaCoSZ6Q+S6hiHnc70TCT/7AnanKyG256qTotijRQhHk82sV/oOck1IGH/fEvDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=bl5CXgWT; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="bl5CXgWT"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7dc78af7371so22518097b3.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 06:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780060968; cv=none;
        d=google.com; s=arc-20240605;
        b=WgGJVPs4UQQy8gXuZH8Ix/KVG1UqHqnO5q7Gk840Ri/3k1x8c1dC5eNAzJQFJ8klbj
         2xqoO/ky5HMQJgJAx5U0uCnPpd75uVSlJnVguCatRdTrOAM90L0ZUdSuiXItLFq9b9ks
         BstxVB8DXkNc45Oceeh7Kab8z9wEFPVlF6eEcimFEETmtRB6uPaF7DR3TOqzEHEazdxm
         PT5w3Og4iyhnSa8vLnPf1pFafrJzAe8b90ERfkPnz7JFLi4xHLHIyYt1pUQgSzr9DPu7
         ctO0SMVKqPZQXZV6ACCG+7ifAPOXFQSL3LK+fayurz4pFf9tyvXDef3bA++uA2x2P/Cc
         v1zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K/bBMAZzJL24oJclVZF8zBPsn8HZUbVy1gcl63SMoMQ=;
        fh=rNBwhTXC94y3w+2dmaXKpb+F6qgyOLurQx9neTS/eTc=;
        b=iblAsCWjJMlZhbW2QUXHY131iJR1MCOord6iV9lyy0lHKzGZBT7qlfPfT+Mkxqfddq
         xS6jJ1ysECgJach8V5aiSWwW5XF5Caukk1YzKBavjmATjmpM0a31h3V9yqB9bHesGs0A
         hLnuW9YfXaDSC5e+qM1NS1aKOnNDA0fsz+MoLfI6//ekgy6btQceQSk7UrIDwwP8wpvq
         Mvn8h30wpEbWYZKwkjP6XRZ8jv39LhhzppjLvkhzYkn9QOtfANOLQWwI2/63gTLFownU
         twS34Uvscjl7WH7lm1lpQlMRcyqHO2hSRobkRm+tVIRALT3bCf0yrLn/lV5ii5s2fe5e
         4SRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780060968; x=1780665768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/bBMAZzJL24oJclVZF8zBPsn8HZUbVy1gcl63SMoMQ=;
        b=bl5CXgWT5DSmtN61r1jlp5WxviMlH7USxSq1VsqrQgGX99pJw53FJEaXD8F1V4fvOw
         znsjYH1qB7uc0v5wbG6n8+N9uxNfUxaRfE9DmQAN6PtzU6N3V+kpTpxFayS93nlkMejz
         fK4mHPcB4w9TYR3CfOj64Q6SGeWZAXHXMqiemmm9Fdhr3+ePWAm8YRS1iCNJOTtON+iU
         k976YtuEpmLbrAHdg+6U7Bg9QsGfcU+/gWJw6MVvJH/XB5ZvHOydQoGPB/gJrML/V/As
         YRzVsbL8zUqHJPKB75USLLs/yB+5IpMILMLVMIR8qDla2flULVBJ6shESxlSZTbMxfKO
         TdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780060968; x=1780665768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K/bBMAZzJL24oJclVZF8zBPsn8HZUbVy1gcl63SMoMQ=;
        b=Fo/v2B9cAGikP8VBi3h+qHTgVjXKp5wvdic58coIhWnzTfzGNZnv+KCWENjyxcPmxY
         U/99JNzy4TQbOLygjTFpZfCqBqfYXis0op1D544dLWld8NtjgJbzcUNXA6qUz+kVcx6M
         rakGV3bE1WJwVal7iIk7Ycc/PE7faP5n2T3xnEIzIVSMQ1Rchi3fOa5xigOuA0KxY4rQ
         ottEb+OcwGV2z/70lSzHQPYAaQj2McgV7JBuRNigQSUw+hRrBmjMuIebVSd2n3383h0C
         0UvAo8ZHsdSnSSJYzruLxuHtxILtqlmVo7ASa7BEQ+GyufJLDSzdozv4SNRfqajZ1EMZ
         4NEA==
X-Forwarded-Encrypted: i=1; AFNElJ+W0KIms+IT90izgpoWZFqDcVA+Ov2xBCUe/clrMSKhO0DKq39buyvLNfRonyxwNz39Ik4VXnpEGc48@vger.kernel.org
X-Gm-Message-State: AOJu0YzwsfgtpBAEcKwoPrVeWK6HM2tqUMJXQeOvpDaybB8RysKzg3xB
	o3e4VvScWbkF7KnKK1MydX5x5jU0uZPbRHr9KQjZEyWJ6nxXjVCswzKQ9EtLA5U0712p+q3n9fH
	uad9kMYTiF7Sl6SNrrAR6HvEJg30KvDlA7TPYKjwy8w==
X-Gm-Gg: Acq92OGBbbxoeWcssYMjRU3yzE57McV0Y9EkAqYWAg57r4YaGY45lk09/Ayc7xKFaYM
	1hguF2UcbVczcOmCu4gk2CVtO4eMpWW/kF4HkRIdgeWcLjTv/MspTjDHuKRu8aK6ebTNZYR+r0e
	OJtM1T7TIVSXX3OH3jFi7VGY/dc1JBa+6pePOATD4vSgyOPfs/THoMWEbpY2JBdNi2fcoI7MKWr
	h/Si4oWXJMabiP4Yxah3pQeJW2N0/BzWxXn3EXujx4oSqm2we8YG6zBp5rDCuQ6wjE10uxmaxx9
	H5q1K5v0kO+l+dr1Rz8ft9n2x7ARVelB9AQgvSbSrMADjLRZdXp0svcJTIjH+Kt1uK1Dbd/Xwui
	fBA==
X-Received: by 2002:a05:690c:670a:b0:7bd:69b8:f2e5 with SMTP id
 00721157ae682-7de44db875amr23947297b3.3.1780060968349; Fri, 29 May 2026
 06:22:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
 <CAH1PCMa_RJ0NVNyxkqsXPfrF4tz_69ZbWeqkh8xRCu7bLDkr-A@mail.gmail.com> <20260529062159-GKE3748271@kernel.org>
In-Reply-To: <20260529062159-GKE3748271@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 29 May 2026 21:22:37 +0800
X-Gm-Features: AVHnY4Iab8wgmxmC75EDPrBfu1KDkBxpc0a7EJvkUE8WSVNftvwon2aew66vIo8
Message-ID: <CAH1PCMbNv3pGNvjhr02fiibRS3mt929+C3jwreWePN-3O5eLOw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Add Ziccrse extension for X100 cores
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Guodong Xu <docularxu@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Yixun

On Fri, May 29, 2026 at 2:22=E2=80=AFPM Yixun Lan <dlan@kernel.org> wrote:
>
> Hi Guodong,
>
> On 13:18 Thu 28 May     , Guodong Xu wrote:
> > On Tue, May 26, 2026 at 3:23=E2=80=AFPM Guodong Xu <guodong@riscstar.co=
m> wrote:
> > >
> > > Add the Ziccrse ISA extension to all eight X100 cores. Ziccrse
> > > provides a forward progress guarantee on LR/SC sequences in main
> > > memory regions with cacheability and coherence PMAs.
> > >
> > > The SpacemiT X100 core supports it per the SpacemiT K3 hardware
> > > specification.
> >
> > For the record, I have tested this change on SpacemiT K3 Pico-ITX.
> >
> > The stress test is run by enabling CONFIG_LOCK_TORTURE_TEST=3Dy then
> > boots the kernel with:
> >
> >   locktorture.torture_type=3Dspin_lock locktorture.nwriters_stress=3D16
> >
> > driving all 8 harts. It survived sustained torture [ran for ~10 minutes=
]
> > with 0 Fail.
> >
> > ... ...
> > [  735.588947] torture_spin_lock_write_delay: delay =3D 25 jiffies.
> > [  738.015096] torture_spin_lock_write_delay: delay =3D 25 jiffies.
> > [  739.204713] torture_spin_lock_write_delay: delay =3D 25 jiffies.
> > [  741.195211] Writes:  Total: 714319420  Max/Min: 45946599/43679876   =
Fail: 0
> >
> I appreciate you give more info about the test, just want to make sure,
> for the kernel config, the CONFIG_RISCV_TICKET_SPINLOCKS is not enabled?
> so it will fall back to use ziccrse implementation..

Correct. Thanks for double-checking.

In the above test, CONFIG_RISCV_TICKET_SPINLOCKS was not enabled.
And since X100 has neither Zabha nor Zacas, the runtime selection in
riscv_spinlock_init() falls through to the Ziccrse branch.

BR,
Guodong Xu
docularxu@outlook.com

> --
> Yixun Lan (dlan)
