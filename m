Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC66649362B
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 07:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787383145; cv=pass; b=EW4VZhlbsi8/vW6sK4W0Q2k6XQ/W6ra1SXIpNlN/5TFKeSUxr2m+WBl6R5G/UIX6baTgjJo2ffoIG2bdYdRks5aTDieOeEv5fQALx/qiBlXT1vmUYzbG+n169t7yKNTuOi6rjMlEp7xmWNWTt+M07jXj7wLEWjpsxhsQAL5FZNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787383145; c=relaxed/simple;
	bh=oM02a2mnkQuSYdKv1ayoKOy9Qu4BLdImQAtdLtY4ruA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZdcSws5gLxzQmGh4sUXnTJetZjbk/lMbJ/QAjHO4IEyqtP14msTkZa7rdkYCbgo5+4AzLwxGaYnmKr3Jmk82zcXDtLNC7HsVEyTKm4NDhQVXPaedOYqMY+OJL4lX16h+06RS75R2XoMLtC3TMLM+CKlUVQkPUOkokoM1vlSnY90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJY2sAlT; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJY2sAlT"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-836eac5682bso32720057b3.0
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 00:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787383143; cv=none;
        d=google.com; s=arc-20260327;
        b=K3oyfiz4JjfMjzdhp4uY4K2m3Jipz3MuhJ4vbsNeNBRhoEaSV15v3C/NUJmZRvoGfx
         YEuckuQJmGbLU/tQE7APKyRcxw0gVwZzLiHqn4RxMYoeJ2neMYcI9GyHAw5QeaFXhC42
         Y/n9m8q4PhnyfJxC8OxZuFVBiV0Pybxe+ol+2UEL46Rn7UETEJ+c25zKoeMBGCl0TqFD
         8CbiZgF4W4Y6pZJmMeqkSi6Hwa9xcFHCUpiBs3Q9cs20Cf8uvuLqwWIwlAPi3ObQnYNR
         OjjDLuPjtdpnc/lpgK239cUKAbRdInPqjEse2zA7dq5Mei2LmfO4nCxGXzY5VJFI3NVU
         J+TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2EyolxnGOd3oJbXQjfAMl9517AL75MOEE5l1MmMpyIc=;
        fh=+UN3HtrIpZ4LkETRR1zGCC75LSbhS46RFit2ajazvG8=;
        b=OYc2jbM3HSFJxuuNks/b974PtrYAXswzvgweO5Sn91pKRN+08m0YZH6zgvhVxH1/UC
         YM5NUI1UM8i/e5o3Plx51MxouoEgTC2gljkpqrucluzSd4BrtBQ/ROz+OJx8e3u6atRk
         24vGU9oaa7GrfzCxc9Mlpvst3ncduvGcsaCgX93XwrZhQyDr/XxynyOOTv1KC+MIcqDD
         Y2KQacteH/VbKzTJljZXid26QP0TzrX3WubfpK49YcFeZ67fs1L6LNi5r4JIAuDJ5U5w
         EHSRK7C3Jm3t1YgcM5SR8NCsCeS2xPsP+T7QL3rN6BaMh5hDfuGxzjHYWT0IqIYUTdU3
         5VhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787383143; x=1787987943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2EyolxnGOd3oJbXQjfAMl9517AL75MOEE5l1MmMpyIc=;
        b=mJY2sAlTpZn1zjmBzaDPA89UsIN5jMIwwuo7mtIUBfjTWcXD20Qfi3O4LruCOSI6JT
         1G2DGQscIZPLFdCFdHwf5GMwZnlbfaJCYPQVQyIcr2O4q+z/UWaPfWvWScTsJ9RjaqhX
         wznidl9JLkk7N3jwcurHGfUszQdAt0chMSX8SI/iQEmbIgPl5Drlseo7k+h192PwWBGp
         7h7HFEj9apKSwg719N858csjs9e5oVXxso/rVLQn215LXWW6lx+bxTx2l71HOsxgiehn
         W7MuREeuxxWJgi1dtTxO8ymQ4P3/uJDP3cxw47oXRpukSFhg/NdoarBlYGZ61//qOFYz
         FLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787383143; x=1787987943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EyolxnGOd3oJbXQjfAMl9517AL75MOEE5l1MmMpyIc=;
        b=Nq1mnL4DDhd+YRI0n/d9aNeFy1jI2oaNUCaWWijYI+gWoSfCuH0frype9YOdUDj4+b
         UYfQtBeZVma/nxb2mfa5p8xSENVIqY1PQRHm4/agTBecMeUKOROIVdOf1lsI6H7vSMcF
         ifECYJF4dXVsnmaoIN9pnXVtcfam91kRwjiN5qbx63WUo+Cdxk/ZD1Y9bVtARmR7DjG7
         a1+rWpxePjKMlj+j8oO9kTWn3rzX6ozQC9nfhNc9T5peMN2aovY51A5H+OigioH/3ues
         Fl9mfVzDc0R6sVsO4gXf69B+s1cEQ7ENv+w6pz1hIM9GAt6yRlYrt4jPE2K/UBbaJFw8
         m6qw==
X-Forwarded-Encrypted: i=1; AHgh+RpTuDOn7tkliX7bby+i1pPtjazA7YdnfgZynTV5rIGi3xFbmjnIHsW5TR1wrNNTZcXhm9jo6bXAUHtk@vger.kernel.org
X-Gm-Message-State: AFuF++lF4QSwTSsf8ysWTT8+/uAxzvwP35QeH7L6ekC1ASGjOzOiA/1t
	OCiHzaU7QzHgrkkd+okXDbDBWaFYx+8zGpGIXbPQ+4+5E7238ypvwRfsPfA0hIRszMlNs4bZUJQ
	p1GEb6e7CmRDsx/EqyKpW0+yPbhh7X/Y=
X-Gm-Gg: AR+sD12BxTjo66lehbGmm6Ib/lkUQMbCaHy5gLtXKjQkqKFiZ3OvxsuJwETP+m/zaep
	lz1NQvvD7fRCkeSHtznzmfOBxh0oJLK4p7G0Xkyhg5ume/mkCq5LS5e/TN7AqjI34w2y+BHJ6pk
	kSTNMAdlqoaEM175nk4IvTpYFrGZM7v5M5RRjULb7TGlrhaSJR02hf+p/bdaMGVFft8XbfR657d
	Kw/ep2XNpsfpNctsrYaeMltXdsyhhssIlko5COlvhAYKGYCk8JYcjZnj0vCbQFKFF+R6wXXWhdl
	EqgSVEjmjbEgftvQ6Wt6YpX+TTyd9CnXGe6X0/ImOYy/+J4eOcoqZXhmCgyYk4BXDiFgjIfxzX8
	=
X-Received: by 2002:a05:690c:6512:b0:825:468e:e0eb with SMTP id
 00721157ae682-84a1ac40605mr45066577b3.15.1787383142939; Sat, 22 Aug 2026
 00:19:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814083221.34606-1-challauday369@gmail.com>
 <e7efc91b-9d8f-4344-982b-c2b5014985b6@sirena.org.uk> <20260814190759.GA2496807-robh@kernel.org>
 <20260821143242.GA3830037-robh@kernel.org>
In-Reply-To: <20260821143242.GA3830037-robh@kernel.org>
From: Uday Kiran <challauday369@gmail.com>
Date: Sat, 22 Aug 2026 12:48:51 +0530
X-Gm-Features: AcwNN1Uis6UfIZ0co-b-UtUGD8A07GKsu-HIrWVBLcEcN-_X7pT5x_d88yjoLbc
Message-ID: <CAAj-GBmHCUb-ArgjHLZ2mxc9261eJ2Z4jL8ZaAaG1d8w8ivGPQ@mail.gmail.com>
Subject: Re: [PATCH v4] spi: dt-bindings: microchip,pic32mzda-spi: Convert to
 DT schema
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, krzk+dt@kernel.org, conor+dt@kernel.org, 
	skhan@linuxfoundation.org, me@brighamcampbell.com, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 8:02=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Aug 14, 2026 at 02:07:59PM -0500, Rob Herring wrote:
> > On Fri, Aug 14, 2026 at 03:54:55PM +0100, Mark Brown wrote:
> > > On Fri, Aug 14, 2026 at 02:02:21PM +0530, Udaya Kiran Challa wrote:
> > > > Convert Microchip PIC32 SPI controller devicetree binding
> > > > from legacy text format to DT schema.
> > >
> > > > +maintainers:
> > > > +  - Mark Brown <broonie@kernel.org>
> > >
> > > Try again!  :P  I think the DT people had some default they used for
> > > cases like this, but ICBW?
> >
> > I'm the default, but really I wonder if pic32 could just be dropped. No
> > commits from a Microchip person since 2016 on arch/mips/pic32 or
> > arch/mips/boot/dts/pic32. Almost all generic cleanups otherwise. These
> > chips appear to max out at 32MB (SiP) or 128MB DDR2.
> >
> > Perhaps I should send some AI patches against it...
> >
> > There's this[1], but no updates in 5 years.
> >
> > Arnd, Thomas, any thoughts on this platform?
>
> Thomas agreed to be maintainer on IRC.

Thanks, Rob. Understood. I=E2=80=99ll update the maintainer to Thomas
Bogendoerfer for microchip,pic32mzda-spi & microchip,pic32mzda-sqi dt-bindi=
ngs
and send the next revision.

Regards,
Udaya Kiran Challa
