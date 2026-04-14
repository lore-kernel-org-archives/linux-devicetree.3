Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3823E6DD5
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776172965; cv=pass; b=Qo7bI5s1dYgT2bztRPTzn7QCroJ/exty6Ue7MwsEfSVpqQQZWSAXrUpV2/qhClWc3AlN98izgoyijMNLj1COzZJ5DC8ZQi5oA0mzPdM4mAEStRtD3F60WR2gzkgdgMc91XeBqeoBkDmA9pFV7MhQ0DgtG2xVMVrqM7AYUP91eIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776172965; c=relaxed/simple;
	bh=SWvIA2r2vaq/SfcRSpzOMqE2rP2/EKFXRofeeTjYJ8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DS17leogxWzBS1poojEdcpbssNR89MJFi4ZFMKCCuL3oBpZAQnqSalO2FJIKmNT3odpLKeZ2H9jEKHI57nxviAaCCUM+SxMZNVKQPl7ywySjmpSj2YN40W/tXnvsa44TGC59Fz7Bm5iaiADpQSMQbAimEbj49BMj9TuN3g5brpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMOxJV5/; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMOxJV5/"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38e7d983f50so22457851fa.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 06:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776172962; cv=none;
        d=google.com; s=arc-20240605;
        b=NdJv78xlztfXawVszfEgziJFw6WtLzo66w0MlE4JpinHgZVmx3Nzrkma20nDD0fhIz
         5hEECK77EoEMNmp2EwnGcRDY2Af97bJxajv5km4z9CmfnZsOXSLot230k+z3lXVSKu4G
         VjxYf4n5OPs7yAgNqz5vWjEqpBeyzBZ9qdNBXWbhRpJTtBTYf9WuqJXYg68nRmIzd7AB
         mfDaOuPA7BKTDxA3fKO24fwLATzWLs6SZ2xTOZQyWBZeGCikR91XLP5ArwPnoZ9EQM+H
         kI+8wUFZrVnmHYDl1MI5Ne7oOKYKfa9vrEYXNy4RuJq6uIfJ65KlVyKnMBZcoZ2kZZyj
         CD1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/MCSiaVpfB7ZAykqhfSgW9zD3qZr7DmUj2mgOEXKvJw=;
        fh=61LUcsys2abp1wSZYbLvaYarhfjqYZcdM8XDQd2SQ3c=;
        b=cEqCOD+uJKGyfeW89FWshS7HPtIb4c2P1qaYH3Bx0Wt5kob/vW80KUhLJZjrWHxC26
         WhDUk+3hgCtzrofPcN1v579lkP903vfymfYtahp6zUOeuOnXhgVMELRsaiWw5PuFrmWT
         Nw8sZRiBhopNiTykOAbaByVvQetKi4RjbtQc5646z/fNq+FrTUF4uWkvdMcRAt/KC+EB
         T32IYmzKQhjWQ5rTiXgbSx5Gia7Wuac+rypxmDgyVh122zCtNkhcmKJ+Xy4v4HOC9bVp
         z1wtypH+4vO5EHwDMXblJmAeSkYVldwd8B9q4Kj+kdUBOZ8T1yxMyhShx8Ol/8pQK0FF
         WJ1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776172962; x=1776777762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MCSiaVpfB7ZAykqhfSgW9zD3qZr7DmUj2mgOEXKvJw=;
        b=SMOxJV5/48wjHJ/JGoxnQVCN8lRDiOrmH7Jqj6OJePMZjVsjhYWqqkWn22Wzj7ynbL
         pFYuvgEWCB5oS6bdIUxWUWkiBqE8wzfI/RPrlCiFz1BmfnWAp6CDzwM1A1Mavoz3zH0F
         4STAHIyxfLYjabNt0xgb5Cn1KavGI0EqPusRZiEKjvC5PdsPoknocMnvKqPjFcZkwSpq
         Q1mXf4BouMdVKkkWSKLy+G4fr26whbcgbD+O5XuQlxhASDnCjKs2fq4CsZU1MIT1TrII
         Dqf8ZCQQV5XwVs5tR3QajqRPYeJB5htObYamI0y1kw3as1SXjije+ovEBVbwrxYoyfXe
         v1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776172962; x=1776777762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/MCSiaVpfB7ZAykqhfSgW9zD3qZr7DmUj2mgOEXKvJw=;
        b=pxxqovxmrKJSaydsH4WbZcrRNxKtz8ajIAB6sceodD2YHs8P+8deRv2jRHcMCEG8Gx
         N0fWIGkKNoDtFsMl7TRC1CGupaG2GOmJmwTdRHKn459bU6Zjaly27a4RdhvjKZu6TSZE
         Jv5K3A/f7b+j90hP0CF15OrS7q2DmJR0Jb8xuXCT9DbYStzrrU3kC/5Vh4BTS8Z8E71J
         Dlu8r0or+T5BX5nqn7S/5xUOP4m8MDgviwMt4t4wXEAVKEC2iv1ueJX+wFl+zzOFIQhn
         UCUfBWJNopS54Ko6EkEhDQxsOq/uMAjnILwqkvM4MdxoiJab9nhAE65c5CF4mW042PgU
         J6Gw==
X-Forwarded-Encrypted: i=1; AFNElJ/jnWsPxb5hGgh/IJUKS/x/YDzGuL67r1f+CXkNkkNMtyieAdZ48V+a0YN/nwh1bvO8C4WYcTwZyikC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7EqAA8BaDhRSbUNB0Um8Mns6SjnqacJOhDjx2H2U8WssJgXap
	N92gKaDGc0uhMnYJqiq/X1Jku32Z6icCAhwjmvjzOj42mYvAPbfaDxZapxot12d5jrk0frIGvJW
	JRKWq67HxufX++TPvA9567/D/V6fZJWo=
X-Gm-Gg: AeBDieuPQgyLsv1oyNJVpurFNu3retCveP85shjBxKCtUmciuqvWcq95hnOwIcp15V8
	XZaun2Q/aM/nhvwO9xh8/KR6CZuSP/aaH6JMMjpZM9ayemuESJxJoIVypFfgmgtsxr41cf5eV6q
	Q4yaPSDWyzEoignZoKVNvrPUFMoNfzypmkHnFFlIvlSAnOt/p2eWfPs0kEtEuLDkrx9BRzfBzDA
	LKNE0D94Jwy3G96pjL3nptgSd2EcgHieaoaYZtDomAcv4qMxRFcLlWSmkAv9eY28qSc4Hrwvo3b
	xh7ikTKol6kPpn9MnfIb77l6VW1uhCjujZPthxXfEw==
X-Received: by 2002:a05:6512:39c5:b0:5a4:4cc:7a5e with SMTP id
 2adb3069b0e04-5a404cc7ba8mr1091703e87.14.1776172961827; Tue, 14 Apr 2026
 06:22:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327121919.603768-1-padmashreess2006@gmail.com>
 <20260414034854.461661-1-padmashreess2006@gmail.com> <20260414-tentacled-mantis-of-control-cb08f3@quoll>
In-Reply-To: <20260414-tentacled-mantis-of-control-cb08f3@quoll>
From: Padmashree S S <padmashreess2006@gmail.com>
Date: Tue, 14 Apr 2026 18:52:29 +0530
X-Gm-Features: AQROBzAamjBepLaGzfepWzXv5uB5hMqT-b7vwoR6-ZTaIr6csR1cziFGQxKKLFY
Message-ID: <CAEjBr-bdNvgBWjHei4K8LLH6QjkgHXCwtmW5qGoeh_36Vy8kWA@mail.gmail.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: ti,pcm3060: add descriptions and
 rename binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: k.marinushkin@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 12:09=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Tue, Apr 14, 2026 at 09:18:54AM +0530, Padmashree S S wrote:
> > Add description to reg property and overall binding mentioning that thi=
s
> > driver supports both I2C and SPI. Rename binding to match compatible
> > naming convention.
> >
> > Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
> > ---
> > Changes in v4:
> >   - Rename binding from pcm3060 to ti,pcm3060
> >   - Add binding description
> >   - Add description to 'reg' property
> >   - Remove unused label in example
> >
> > Changes in v3:
> >   - Remove description from 'reg' property
> > ---
> >  .../bindings/sound/{pcm3060.yaml =3D> ti,pcm3060.yaml}   | 10 +++++---=
--
>
> What v4 is that of? There is no such file.
>
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/s=
ubmitting-patches.rst#L830
>
> Best regards,
> Krzysztof
>
Thanks for pointing this out.

Since this is a DT binding patch for the same pcm3060 device, I linked
it to the previous version. However, I realize the subject changed
significantly, which made the threading confusing.

I=E2=80=99m planning to resend it as a new patch in a separate thread. Plea=
se
let me know if that works.
