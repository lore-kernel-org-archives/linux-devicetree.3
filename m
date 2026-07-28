Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE0D448D11
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 14:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248974; cv=pass; b=cAqhBHigiaECLo8N/oA4TuYaimd2oefB5xTUb6nVCjvCJCbkcUwqr4LXKg+RSJ605WFlx98gnP7VCa9xgkdJ2WzIj1KapwPC2I3uevW8MSWp7wqdSHT6HzJOglXoYSF1peF2Pyc5iYhMsgHaRk/J3uyn9wK+hwNIOujJWuq5I5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248974; c=relaxed/simple;
	bh=aBO/20PF/cbepZ0EQf/uUevfGfIQ0Byx0XwsWiHsoHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RbO5ocB7k3zrgrFtCg1Lo1RI0tXXHYK7PUJqH4sFnaDv5L4FjHK4yOGibs41Ud4yl68/6CrBvTMNgqfSR+hgGqw9YdNWD2xYktYUd4C/+ZMGhy9OfCIsDTYg4+n86uRKynUwER7OY3Y2C2zOBr0ftBFv2MChrs//bjzF35Td04U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Buq5xcD0; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Buq5xcD0"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1712a04ddaso631046866b.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785248970; cv=none;
        d=google.com; s=arc-20260327;
        b=RbklnJVb8MU0s6cLOFofJUrq90ATHNteevy3f8ZObL1i2R09xE1tcMggt62ZnB16fp
         e3ojeO7o0Pjrq7fZ4FUlE8OE85A9oK/lMomu6MVc1iDwI/Q6FOaU6oUPECellVNKRRZQ
         mws4aK9ByKlHugMgr35KQ41tlBFlNUAAXkhXHifV4Biu/qofz7TjvnUTZvjTFsH3R5+4
         TmK2NMZOfnsmNvNoTc1k1IdQ8GdX18IJ1SoHol+zIy99YRYRE7aCkfdwnd7foBKanHZx
         3aGamCd5exn6fqe4fLbjEDn9DkZSK6/7N+gvtKwtgzjbKlZBbcz4lwnYgGNIJfQC+v1S
         uxDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gfPUbsImxlUHQ9/cY4ABZiuyT2n9U6cBlsKn2xcvoS8=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=eJKd55JXaMJMBili4VTk3HOn5pvA1G74QU1H55I6JmdPSu+ax6sXjbB0BxJXlUiT4M
         ZF3cCFOZtGdHH4NZuv1jswbiL2TGIugyxlTTjifewxohC+sEWRPLBo0030iQUlQhpgJP
         oF4yzg+cyFzMwfTr3KVAuV8/n+YmftzgRd7zHdDqip3CF+fJdkMGwpggRcAxnqEVcfLF
         qX5c5yhgA4OJU0lkdKI8bk1Bmk+kmGwr20b1zsz/+VKsPvxiTOJsPGi32YA8Rxi1Nicw
         hbufeAL/kjtoql6wonii41mP3LE+ynYQhdeSjLoQM67pV+jVInEggTRSWFQIOH3FHk5c
         WhBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785248970; x=1785853770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gfPUbsImxlUHQ9/cY4ABZiuyT2n9U6cBlsKn2xcvoS8=;
        b=Buq5xcD0rii1gf964b9qHQkZUFJl6jhE3ZqkbXF9+kFJttRNd2OK7HwdDQu2AxbSar
         3Py3cpqsdkpz5BlRUnFz58FP5lF5uWtzq8GjP6yGZuKgCkSTdteRibGM2HfjvWY3BxHy
         PKxuuINd30LyA14Iyax/+tlGSQU4Zdpe8py3iTwVOJFuQrMy36Svt6Ji8MS6woXVb8SM
         dVNL9I68aa/Nk/SDrE1bK/mC1yFnCC+I7HLhNOCsrx+HPDChtp/Lk0wm5vWKwtqt/tJI
         2uUuJkjZNI3ZTyOrXEeh6AZUiEiL24/oCCLmKFpGV98x+U+z9gbmJhv81EGmCMMbFmAu
         wcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248970; x=1785853770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfPUbsImxlUHQ9/cY4ABZiuyT2n9U6cBlsKn2xcvoS8=;
        b=DJx7wEmEAwssZlS5f8a9rD7eXSMf4SFKT+oLbQqcjyUb/RDZ8XdoOc/6WLAAYmrwhd
         bXjOiBYccK+EvAmrsFSpgGp2liloNEc9tDiirMFaTVJ4JH+Bz7ea0j1ukmD34vfxPz+4
         RHmXC8UsEA9Tf6zm872Mwb/At6CgPRMaPT+zTYeLUdkaPxChm6EBdF2nJFYvfgOnmNub
         DOnLqFnDWVeAyCgITR5TB4Jtb4HPb5T2xt+NejLKSV404kLJV+l0BalKJa0N7JwVADGB
         JKa6BO231QoRIfNPrDyWWx2zR88Wd7RKuXJZbQ21i++Fj1HeEPJWB+VVb3lPIAuWNtM0
         BbjA==
X-Gm-Message-State: AOJu0YyYoFtigmv3kzLNZB2LkIPO0B+N57b0vrdd5ysJkxjEXot5rtbp
	B4SSaMzCRc0Md+1ZqbWcEQLYxz/ZZieSjHbFdUdlVwtIE0lW9sSpvDVIfADD6Oyg1QVr9ACTJKU
	u9UeYgYn7Gz4L5ybx33BIbhPBHQxUpUU=
X-Gm-Gg: AR+sD12dDNtex0V3EZE03MFYqkNQJ+gu3RKcXkhqe4Uku5f9uhm6NJU5cE7xh45iizk
	9yE1+Iu2+2jMFKv4+8xn3nlXXCRl6l3jcrDGdU1o775XkkIUuDuTMtJGpOikSclp/GByT0nQD3Q
	11ST0RJWG3v8uA8LlyVulu1JsZzOs+85ozHOoaAApKzq0NVrLobc3QKaXdWT71PV7xtfuk1HJMM
	iLeTkH9o/njrE0WemELXO+qCqN0u4lZg3mMtpkd0G9eHGau/W3ARy9nbFei6h4=
X-Received: by 2002:a17:906:fe43:b0:bf0:2253:ad67 with SMTP id
 a640c23a62f3a-c1f72151da2mr161409966b.46.1785248970263; Tue, 28 Jul 2026
 07:29:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727075324.3555446-1-a.shimko.dev@gmail.com>
 <20260727075324.3555446-2-a.shimko.dev@gmail.com> <20260728075338.1402A1F000E9@smtp.kernel.org>
In-Reply-To: <20260728075338.1402A1F000E9@smtp.kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 28 Jul 2026 17:29:18 +0300
X-Gm-Features: AUfX_mx705K6NE-AFVqtwXxKZSb3RkvcFnGpOcbTZc2YdsMjjKYQTIoskIK5A4E
Message-ID: <CAOPX747K9QrHdNy0Cn7bh3grWfi9mv2maEyo9RfVpVdA5B_4eQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: net: add DAPU Telecom
 DAP8211R(I) PHY binding
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 10:53=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> [Severity: Low]
> Does this patch series also need to add the 'dapu' vendor prefix to
> Documentation/devicetree/bindings/vendor-prefixes.yaml?
>
> It appears 'dapu' is used in the filename and compatible string, which wi=
ll
> cause make dt_binding_check to emit warnings if the prefix is missing fro=
m
> the global registry.
I don't know.

But it seems it's finally clear how to use yamllint =3D) found the issue
$ make dt_binding_check DT_SCHEMA_FILES=3Ddapu,dap8211r.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  STYLE   ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/net/dapu,dap8211r.example.dts
  DTC [C] Documentation/devicetree/bindings/net/dapu,dap8211r.example.dtb
$ yamllint Documentation/devicetree/bindings/net/dapu,dap8211r.yaml
Documentation/devicetree/bindings/net/dapu,dap8211r.yaml
  63:1      error    too many blank lines (1 > 0)  (empty-lines)

--
Best regards,
Artem
