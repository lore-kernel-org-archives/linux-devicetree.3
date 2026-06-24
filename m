Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CDD30C62D
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782316199; cv=none; b=KqACKTKpB6BwUAQ4HDNfvWIsFjIDNLMbYrI9pJ+luzwpprmvwWGR3Y/c4hIiCZR2hEdlJ2ZWScAeb7A3RIpI/iAyvQeonryoo52KC36HGI29dnab7geBa9FngycVdIjjdWQy45LCMeENo3CzzUklqk4vprdKhIiHpYEPD9Pvy9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782316199; c=relaxed/simple;
	bh=vNQfyXr54v8Tk+OYTdjwqwGU7iOxWTLzE0bS1pFZqss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=twtkemh8uYvdnd70Ht8PnjpS1glemt0Uv9wxPuQVfyZ8aJ8xdfgLm5z0eMGyuuFxCT1oxMQ9BZkl6Ii/PyEHLdfwvfct01mV3ebsWNFUBJt+E5Y0Vk3DDZpHC07jqaoAveeBBhqsFZeD6OITKPXi0kupraBIYN2MxYIgrW7rH6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ak5TZPbt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ak5TZPbt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF86F1F00ADE
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 15:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782316197;
	bh=aC/Uf7b/GAdsg00FfY4IZS5rucnziWQVvcSK0EfQe0s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ak5TZPbt111EoJb9BU95jlZuJOuJO5t9ZJ0RD37bDHlkTaN8/obtOIfE0G/Pe2VXY
	 TexSSfLsfVFloB24Ss0ZRrYFqDgCTwUZefkj9levxFDC3X4inpC4y33LFTW09eLHZu
	 X5u+0oDoaegnqZ5E1O0yDvutRrMAuUohZaNPrw7rwgsj55NhBLmvWKiyEXBKHLlw+W
	 xPUu9G4FDUgtVoxH386uxOsql5AQ61lzPBbW2LgbKyngG2INyGY5Q0yd69JG5VAV9V
	 O/ZoSlc8aMQ0Eqb6MkErw871HwoDja+O4jMzUQoyztYdkaD2dKP2MYYwMNR/A1dpPc
	 ZytuX6R55F89Q==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-697764213d6so2008058a12.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:49:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+4n5eIrCPvSYkEKzG/YbgH3FbzasEtsCprlYZl470TZtMuRNQA+NzEJ8hxA61ipcBA/928I7gpTbaz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe0Zjc1eHAq5Btt52F1AJPqZvkW6KxtYGkju7E0q+eRyUpTarH
	rKN4G7OqULTXKCKKm1arrUVhv8lWILrygWhNCsTF0i8IgI5aE0J7KU68A68S9PyDZ4RRbVEEbVH
	QhUOelot/gNMyM5sJF11/XBfkDH+m7w==
X-Received: by 2002:a17:907:a807:b0:c0d:32c8:6f23 with SMTP id
 a640c23a62f3a-c119e85b98emr234657966b.37.1782316196534; Wed, 24 Jun 2026
 08:49:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612-crossbar-v3-1-266747bc2e86@gmail.com>
 <178154975475.1640860.7016352484406221018.robh@kernel.org> <42760292-3a29-4600-8676-6a79d3b5d7a4@kernel.org>
In-Reply-To: <42760292-3a29-4600-8676-6a79d3b5d7a4@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 24 Jun 2026 10:49:43 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+5-7FRFfzP9Lw2CVtnn2fyjW9M9SrKp7wX4CYDucEMOQ@mail.gmail.com>
X-Gm-Features: AVVi8CdenovRcJ6rvmw7Ja9jzUI-8RnJguKEcA7Nb49y_7QHR-k_0YiecUJQ_1I
Message-ID: <CAL_Jsq+5-7FRFfzP9Lw2CVtnn2fyjW9M9SrKp7wX4CYDucEMOQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: interrupt-controller: ti,irq-crossbar:
 Convert to DT schema
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bhargav Joshi <j.bhargav.u@gmail.com>, simona.toaca@nxp.com, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	Thomas Gleixner <tglx@kernel.org>, Sricharan R <r.sricharan@ti.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, goledhruva@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 6:22=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> On 6/15/26 11:01 PM, Rob Herring (Arm) wrote:
> >
> > On Fri, 12 Jun 2026 02:42:29 +0530, Bhargav Joshi wrote:
> >> Convert TI irq-crossbar binding from text format to DT schema.
> >>
> >> As part of conversion following changes are made:
> >>  - Add '#interrupt-cells' as a required property which was missing in
> >>    text binding
> >>  - As irq-crossbar is interrupt-controller. Move binding from
> >>    bindings/arm/omap to bindings/interrupt-controller
> >>
> >> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> >> ---
> >> Changes in v3:
> >> - Fixed typo in property description
> >> - Link to v2: https://lore.kernel.org/r/20260611-crossbar-v2-1-231d4f8=
8298e@gmail.com
> >>
> >> Changes in v2:
> >> - Dropped property name change and driver updates.
> >> - Link to v1: https://lore.kernel.org/r/20260606-crossbar-v1-0-f67f7cb=
9ee50@gmail.com
> >> ---
> >>  .../devicetree/bindings/arm/omap/crossbar.txt      | 55 -------------
> >>  .../interrupt-controller/ti,irq-crossbar.yaml      | 96 +++++++++++++=
+++++++++
> >>  2 files changed, 96 insertions(+), 55 deletions(-)
> >>
> >
> > Applied, thanks!
>
> With:
>
> $ dt-validate --version
> 2026.4

There is 2026.6 now which fixes this.

>
> on next-20260623
>
> I'm getting:
>
> $ LC_ALL=3DC make ARCH=3Darm64 LLVM=3D1 -j24 dt_binding_check
> SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> Traceback (most recent call last):
>   File "/home/konrad/.local/bin/dt-mk-schema", line 6, in <module>
>     sys.exit(main())
>              ~~~~^^
>   File "/home/konrad/.local/share/pipx/venvs/dtschema/lib/python3.14/site=
-packages/dtschema/mk_schema.py", line 28, in main
>     schemas =3D dtschema.DTValidator(args.schemas).schemas
>               ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^
>   File "/home/konrad/.local/share/pipx/venvs/dtschema/lib/python3.14/site=
-packages/dtschema/validator.py", line 399, in __init__
>     self.make_property_type_cache()
>     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^
>   File "/home/konrad/.local/share/pipx/venvs/dtschema/lib/python3.14/site=
-packages/dtschema/validator.py", line 528, in make_property_type_cache
>     self.check_duplicate_property_types()
>     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^
>   File "/home/konrad/.local/share/pipx/venvs/dtschema/lib/python3.14/site=
-packages/dtschema/validator.py", line 522, in check_duplicate_property_typ=
es
>     print(f"{self.schemas[sch_id]['$filename']}: {p}: multiple incompatib=
le types: {v['type']}", file=3Dsys.stderr)
>              ~~~~~~~~~~~~^^^^^^^^
> KeyError: 'http://devicetree.org/schemas/interrupt-controller/ti,irq-cros=
sbar.yaml#'
> make[2]: *** [Documentation/devicetree/bindings/Makefile:75: Documentatio=
n/devicetree/bindings/processed-schema.json] B=C5=82=C4=85d 1
> make[2]: *** Kasuj=C4=99 plik 'Documentation/devicetree/bindings/processe=
d-schema.json'
> make[1]: *** [<snip>/linux/Makefile:1672: dt_binding_schemas] B=C5=82=C4=
=85d 2
> make: *** [Makefile:248: __sub-make] Error 2

We should fix this to avoid the splat, but that would still be a new
tool version.

So we either need to revert this and delay adding this schema or force
people to upgrade.

Rob
