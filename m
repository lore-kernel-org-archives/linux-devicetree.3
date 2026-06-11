Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDA7367B9A
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163603; cv=pass; b=KdHiTMhEfQVkGLjuEc3/BoZHPtLaimNjsH6Lv+omQ9lSdWwdkMTV/m351NPLw00jKrxTBXoVTo9MOSln08uYqkaJ9tQjQDFwWJxczQCljF6Re/zy4Kj3/hKCoCHNcbtYchtJKAqecTGgu/TPCTDoQP3UuX4aoOpoMdW/x6vKts0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163603; c=relaxed/simple;
	bh=DqwtAUZefULDn81NhMEIAultwLucsCv4pBvCaZeWSkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJ+Kedq7Tn4VpvVSpgY7CBB6RGoj5GmhwNuSbVaYOxQfS3Ror/Frvz+OckxuwChYCO+Gqe4GqMD5xy2pX8OlSHN1zki2C7BpyAJarMEg85NmjltaI5ZV8oRIpFMZLYly1pRhXn+iE7ZpWQgPIOeHRspodUjOhPLCF0utrrM2pmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rGwr25bE; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rGwr25bE"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68bd4aec7b0so1279573a12.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 00:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781163600; cv=none;
        d=google.com; s=arc-20240605;
        b=cniSeBSB2RNKv+Aefmr6CaUSEeRlV28tFU+cyxA2+Q7Q3n349GM2vaB+xaa5coUgf0
         bSpFWkAwu3HpjS43HF1IUr+ldADR7ecEh9My5mci/h4xnnvE79o/40zpLjBZWlqGO7un
         QwoFMZt6G3kW7s4zaFy6m7LBQVXCuY0JgcHc2Z5K5sLmZvV24mGM3cven4KkKso3s/LQ
         aaNCADb2s6BBE9v/e0MOrKwt7UbsBlG9mzXtzf/EOYlk9a1wJ8L4L0OpDj50nKXGyj53
         zJfi6dcQaiuGeMfzepsu2cxvIvxIdhBnRXF8PgXJYoQUCqgbLILRIGqD7ZFq49JvjuuF
         ypYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TcLbt0g9UahGsRa1yZT+w5QDURoUxnNAFREsUy8fM3s=;
        fh=Tf1BOYk5pqYIzzrzb/V7uVO6D5+doCf3sd3AzH/aQeM=;
        b=HLdRiWgBkchJpEK590Rk4Votyj070PLnASzzdgAP447mbt/WGPNBE92mxYGNe8+sp5
         dPUGaQzl7Z9X0NYJiB5o277Ow0C4+Vlt8YXke+DKjLNAxc8Sp9fEU8caTP7BM8K8Wgi1
         ilni2CaaVy5LJphqlNG1tg/FkI2Te8v91s2v3KLYXJ6MBLM2ZgFN6rLkfWRVegCdZyoG
         hGWI0MJUCDJtsUx4cCd0JQNUuGk09VaxzpWHnaM1P7wY2RqJDWrlCUL/EsUNF9pGF/Kh
         nBJJnJML4vMGLJdPTORZgJtDQ40EZsOZkSZGxA326vTwK0Yg/tRr+FVv4qRB86RktJsl
         vLmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781163600; x=1781768400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcLbt0g9UahGsRa1yZT+w5QDURoUxnNAFREsUy8fM3s=;
        b=rGwr25bEjq034cRetv3QNx/Z3kznfzQ7mmzSFoASBMG3S8oExo0LYmB4FyBdtJqJga
         wvYCD8iBaWAQwKbYOeEsh9EOhFVachPB//wrLLYIq0N40LjKZlqI6ZtsGwdl3BaEvn2q
         wWXDA45Mpm9SXchaqPTtfnEZYV1/y2WX4kpW/9BdDv1oJqzDWO9P/HKv9OmlRjIgXtLl
         fmMVslqKcFIPoyk89CkHaEq+EFWvEctTTZyINliDCImDDeEuspozC5WgiRggTKFgQBuh
         alfMH1RxuZ9dWIK44Ss4BgEaXPsXlujxoEIVVi+el3azvkL1xr/QfsURz6A5DBw8smy3
         ceQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781163600; x=1781768400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TcLbt0g9UahGsRa1yZT+w5QDURoUxnNAFREsUy8fM3s=;
        b=j1WSQA6gfZYPzrhDlwzfXO4NpKKw9vAZQhJ65ZXA0oosFYhPG6x1kYsp56IDL2X73n
         cqEHWcBrJZgFTnm1axp//Gm5NkMAEzQHX3P09YNG+42ug+5LSbGLNpPTXTaiw3bgukxh
         Rxae9hQaqi9HDEbd3RL6lMnaQ72NljmwDD0a/zy2m1NH4zsJ3QHIzydS0feK8XQBgW9z
         iAxMpFHWOeM3IFWccgvKtSj6SqQhMJtE+ZWNkfaMNfHeRriYIUKRsEa4hiuKKOyOdrd5
         91TvJGA5YZFQRq4aU8SlLYZbhY97Ao1R1Vbw2phebzid8/Ok9VwtbvMPXMdxeTNKQlib
         6neg==
X-Forwarded-Encrypted: i=1; AFNElJ+tw/zltm/OEep2mgSWnXNsjeSmD1Q10J94g1IpYtgRieDpVhKTH7RF8yf7j+/LupIg1Uki0ZsSwq++@vger.kernel.org
X-Gm-Message-State: AOJu0YwKS8OZZ6PV68iw9i3/yJfHBvx6NATlrbVTZnqKcmuW/vD9jnaR
	KCFm/pNazYvd88M5nTb6UN7bauemkM6MIDzvppjSTTbWexyBnAkd8Ab+3kAz9ZAjOw2wS+gevAQ
	PByuWopXMAB/ed74ShzNY3XPDs42ri8I=
X-Gm-Gg: Acq92OGyfCpJw03XKhqpdc/xMrkFjibpoXlePC78nN/aHA8RGaW/P7xGFx9hsF2sRyw
	bGjbQmhMegniBpf2vHOoVWauqbV18502jDSLDINuW5Ce6F4zB8y1oNhghLEzkc+71pFY6cXYUxZ
	VZvjN/UsS14gQN+Yu887iwylNxjdGmxRA6/qmMbUB+QIvJrKQKSnu8j1Y4cquiWJH2s7Gnq45Gi
	6JgoZID5aHFLdVkeeJWFEvF4G+HglqpzFBb4Q+M/XBmo+7KKQQTwXIFMlDJNejU+a5/kX7qmnaO
	hM13tdeWFSTBHB0iBbFtMfK5WU26QYqlGz5FIY5s5Ley71rS9Mgy
X-Received: by 2002:a05:6402:388a:b0:68e:4c0:f59a with SMTP id
 4fb4d7f45d1cf-6930e27297cmr366088a12.2.1781163600105; Thu, 11 Jun 2026
 00:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606-crossbar-v1-0-f67f7cb9ee50@gmail.com>
 <20260606-crossbar-v1-1-f67f7cb9ee50@gmail.com> <20260610195658.GA702518-robh@kernel.org>
 <CAOWyW_4kRcZWCyOjJrWvnZ8meKT-ryJuGozuPvKJgPSUStB3Pg@mail.gmail.com> <CAL_Jsq+G83JxXLCL+4jhjTsTKpDSqNde=X2Yzjsg+VSS2iGxtw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+G83JxXLCL+4jhjTsTKpDSqNde=X2Yzjsg+VSS2iGxtw@mail.gmail.com>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 11 Jun 2026 13:09:48 +0530
X-Gm-Features: AVVi8CdnUt3uOjKqkJfLs6WOn0yxwHv2m9rjL3Rv0loY7VpF5HQWmcaa5aK8fcg
Message-ID: <CAOWyW_7L46_MdPGHHrVzdsVKugXnBuXm8qkWE4sUHf-vi7WP=w@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: interrupt-controller: ti,irq-crossbar:
 Convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Sricharan R <r.sricharan@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
	daniel.baluta@gmail.com, simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 11, 2026 at 4:32=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Jun 10, 2026 at 4:12=E2=80=AFPM Bhargav Joshi <j.bhargav.u@gmail.=
com> wrote:
> >
> > Hi,
> >
> > On Thu, Jun 11, 2026 at 1:27=E2=80=AFAM Rob Herring <robh@kernel.org> w=
rote:
> > >
> > > On Sat, Jun 06, 2026 at 02:26:10AM +0530, Bhargav Joshi wrote:
> > > > Convert TI irq-crossbar binding from text format to DT schema.
> > > >
> > > > As part of conversion following changes are made:
> > > >  - Add '#interrupt-cells' as a required property which was missing =
in
> > > >    text binding
> > > >  - As irq-crossbar is interrupt-controller. Move binding from
> > > >    bindings/arm/omap to bindings/interrupt-controller
> > > >  - property ti,irqs-reserved is defined and used as a array but oth=
er
> > > >    binding ti,pruss-intc.yaml uses same property name as a unit8 bi=
tmask
> > > >    which causes erros in dt_binding_check. Update ti,irqs-reserved
> > > >    property name to ti,crossbar-irqs-reserved to resolve duplicate =
naming.
> > >
> > > Defining a new property breaks the ABI. We will need to fix dtschema =
to
> > > handle it. What's the error?
> > property irqs-reserved is defined in two bindings with different types =
which
> > causes dt_binding_check to raise following errors:
> >   - File "/lib/python3.14/site-packages/dtschema/validator.py", line
> > 522, in check_duplicate_property_types
> >   - print(f"{self.schemas[sch_id]['$filename']}: {p}: multiple
> > incompatible types: {v['type']}", file=3Dsys.stderr)
> >   - KeyError: 'http://devicetree.org/schemas/interrupt-controller/ti,pr=
uss-intc.yaml#'
> > dtschema version: 2026.4
>
> I pushed a change to dtschema main branch which should fix this.
Thanks, error resolved on 2026.5.dev11+g0d16008e3 , I'll send v2 without th=
e
property name change.
>
> Rob

Best Regards,
Bhargav
