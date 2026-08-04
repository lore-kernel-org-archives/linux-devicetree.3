Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B05B42AF92
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829798; cv=pass; b=sJE8e0QaqZwzdmmLnvLmFSsgR5svtZYjlGS0mmr+6oNB8pgGpLh6ONU9z8CgUk20yW4apLdK76aYyhVjMZJenmtb4FkaPzi+jOSL3v4d3SBw3sm60ZzpV7zT+lYz2Y9s1CwMfoM0jjAVq9/SgLG/H2hZFpvXrsycSirTqLcOOWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829798; c=relaxed/simple;
	bh=OmWlM/JGJt4Vhs83DOiTTiO0UFaa1QDbwgGwrj5GUKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7b2NkjLLTG70BriKzZtUH1N9E7dwKUp4j4qDKxlrbC6chmD60Acuw/uTmTwf8VQejiJK4UC3COnsadv7GerRyAL9kv+y9glQYRo22si9+ZvGfuTsTAtmqm81VBJwoghsh7sRBqF+A/ehT7vaEey5aqfH3VmZGIk1jAQPU0pIi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwLAupQr; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwLAupQr"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2020421077so186413366b.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 00:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785829794; cv=none;
        d=google.com; s=arc-20260327;
        b=bdBD+gttnkjxFQRoxzb9VTeXwZpIUoeYVoicdoJSykE/jDUL341+K5zWUFcAfsi7Kx
         qhcBQ9RRw5MxYwlaNC52IU6QYJtgYMfTVktQIUChoiI60ZOcNgM/O2YRdAtlH8NKmjtQ
         DrsIfesK2t5DWR6boiLhJ3xTMYbsF3UKqcH2pFIjVApYhUJuezFlxOrY+u6XbkkZH7ml
         G+bTzlcsivqa5PH++mp4vFGQ239lFFasgE9HF0MtHpmUzRVYZdZeDwL+PzmgSsrU5xlt
         yr45eTHJUb8381onGz9DnMhUBLOawf/2pc8nA+O+YwGEA5+iSCX4JpUKIrRKIa14/LvI
         NDyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tIHHVDdHYzYzDyqpm0ApPfqei6BlC/PdRs4c7TbsR9E=;
        fh=0W4w3WmkGxo5R+hP2ZsYcvcbVsD6tKwlmxNUl26+pYs=;
        b=PbVRHF+kkrPcmRth5nhTWgxi4MVZmWVzWWN39oYPjqX49ffPvadUrZXhppGdbaIgOu
         35SF0q5XLm0FDlEJA93fmwZztQnw8fT50YGXToC91lLcuRbXdtGlSA0ciO6/v/Vnyxf4
         gJw+f+toFMK6ZxsxOQlXPeoj+7Uc5DqofM7fJHuZo8SCTypFeAuHAiY1n6Jd/gWT6S1H
         Zf5qmtSAGp4w1wRY+uQ/Icw4r3kWh+8KsR/P77a+b7+K4NgiBj6hbHN5Kb+B9jJsQrVR
         uxeEqYxeregzsI2HdnN1+YMbuG/jkVia2afH7fzERc4tIk+Q40grUWJis6WH/GpHwPIv
         l0iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785829794; x=1786434594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tIHHVDdHYzYzDyqpm0ApPfqei6BlC/PdRs4c7TbsR9E=;
        b=MwLAupQriseS1XOL3IA0aaUvCW567en3TxkDW0y3zmZOgTMwMVUT8aEKbeagJyMhDA
         QbVZswQVN4acBX0uUHGkMXbyEaz19SBCK3HzDszbmxLakDi7jLU7Fo0u55pZFXR0+WJ8
         Xa7kBh5XSqFG64eP3y8Y2wLu/4QEGImzV2m2ODaNoq5dhWQrmC0smD4MSrMyM4h4oYUS
         cJ7ksMoszTcP2Hf5lYw5xYMwx0HhcNBmBkF0rOvkR+rN3DTe8Ven0bv4wVS7iSR7/viS
         4y1Kl1mwuS66GyPhaxaRDduhxcA23yAtB9hMpXb1azeyN6Za7r4zmvSJfMfn/iruTwnk
         dfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785829794; x=1786434594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tIHHVDdHYzYzDyqpm0ApPfqei6BlC/PdRs4c7TbsR9E=;
        b=ISyGkgOnVsmg3tPudiuzYW6NToGafgHVh4MhOBISnvn48AQm6b46NhEY7NE1Ia80ul
         9c6huH9s8mENomW0wKc32pijsngAafWjD/n3K2qNoTI/FIv2wXHXlp8O4tLwJ5FD8MMX
         Boc3dvL+s0DZdYFsffz9KFquXQHcJmsN3Pvgt+rHZt042urVMy3GYKzYWACgI4qzq1/W
         0AhSCCKb8ay6BMyYbrn4dSOIvAQo1EPW1IVCT26/K7tZ/pigvfiLOqYG/8cy8Dgu0MlJ
         jtyByLFaO69oEAXVE8NmpftBnafuioL+ixl6p3Hw2ksYUNgpje/Firp2A+GG5QtCOso4
         eaHA==
X-Forwarded-Encrypted: i=1; AHgh+Ro97IlEd92rHHARx71PsTUKGai2nKpxvHvOJXgtnQV5vVWGvGpd6zNrbb/1KBmdYlh9KveRAgZcWtE5@vger.kernel.org
X-Gm-Message-State: AOJu0YxLJba6SPNuKFefqvnkzNQkiNkSCRnkJH61pyNSE+EQZQMAIEMa
	vDuRyd/I2YBTwWnCdS/zAXEOBuuovZeHfdQLef/BdgKkhmgQM5vUboH6u3phEJ1BBgmL1XOCzMQ
	ffFoWz59u1TLuIQcussAKDs9CaM28tbU=
X-Gm-Gg: AR+sD12mO4koR2fZrYT6E+BUhrm9bWdLnl1zhM3Mn5Tm8GVOXh431LJIbTY6soRS90y
	469xjfG/qVaqpiJl69AnOshKN70Ba73qasYa2ILLGT2W6sFw8obpW+cOBSKta6b76j1ASZVXufr
	XQZFaLB3gV9dT53ol5tKJr8kjp/sysITdnBL6aV4d34I0Hn0JTsLrEgKlvBSvDpjtr6ObdyNAnD
	irOe8MYnWXa7WYmiEdOlSAKIvbyD5+R3mowTPGlqeBVWpISKDZlZOzH8HtpWM56y/XzIKhlAjxX
	KwQ0GdAxpfg2WkF2nl3Rg+B/k3ncSCQbZrTOTVlJQW8ve/0=
X-Received: by 2002:a17:907:3c83:b0:c1c:257e:4888 with SMTP id
 a640c23a62f3a-c1fe80d7742mr1126518766b.27.1785829793494; Tue, 04 Aug 2026
 00:49:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785480242.git.zhoubinbin@loongson.cn> <0fbb8d766b6ed33bf4ae9b066eac174f55ae5b56.1785480242.git.zhoubinbin@loongson.cn>
 <20260804-intelligent-kickass-squid-e4c4c0@quoll>
In-Reply-To: <20260804-intelligent-kickass-squid-e4c4c0@quoll>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 4 Aug 2026 15:49:40 +0800
X-Gm-Features: AUfX_mx5oxerXvL0N18GQL0cgfDF9LTPcv7Pk-z3jk4krWgDnaxFa1jCKZmpg4c
Message-ID: <CAMpQs4J+RSF+rk1RJW-4+mbaeWpAzMKeiZo1R=B-wfXnAM5ScA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: mfd: syscon: Allow syscon compatible
 for Loongson-2K0300 chip id
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, zhanghongchen <zhanghongchen@loongson.cn>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Lee Jones <lee@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:

On Tue, Aug 4, 2026 at 2:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Fri, Jul 31, 2026 at 05:42:19PM +0800, Binbin Zhou wrote:
> > The Loongson-2K0300 SoC exposes its chip ID registers through a syscon
> > interface. Add the specific compatible `loongson,ls2k0300-chipid-syscon=
`
> > to the allowed list of syscon bindings so that it can be referenced fro=
m
> > the thermal node via a phandle.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Docume=
ntation/devicetree/bindings/mfd/syscon.yaml
> > index e22867088063..18eb9defec8c 100644
> > --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> > @@ -76,6 +76,7 @@ select:
>
> There is no such select in the code.

Yes, I see, I will rebase on the linux-mfd/for-mfd-next branch.
>
> Best regards,
> Krzysztof
>

--=20
Thanks.
Binbin
