Received: from mail-yx1-f98.google.com (mail-yx1-f98.google.com [74.125.224.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CC9488DA9
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 18:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832851; cv=none; b=hZe1RH+5ujsv8aHtplApbM9X0K4bTocTRFDtJ+dyHxiAKUcVGnVMAHHQYEx6RQ9BVx0cz0UsyNsZSQHFStWyH0zu+dMzEzD7nEyLuOEPR/Z/rY3oKJ6He2cAVOR1DosafDMaJx1GDCYUNOxa2EAu7U+9Gbgi5daAQ3F5jSHD1qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832851; c=relaxed/simple;
	bh=knnhgBvmCcpwsm4sGIfYu8umY5oDxKEs+Me45ILCtVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lgJW+5X7pfvBq+PSap9/NM0/+VsRu4/TFw0VLvFoc4gSFHP40Q9nZ8XQQ1VWnvJfOWc2Ahs9H1hdGX4Lmi/wx3wbTMNbeCco08xP+6AUpltpkaHl7Xtt5iiB2ebEHpAZU1v5eA7IYnv5BTq6WXsES7rLjjE19SB969Y5RyEBDyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Je5KCKBh; arc=none smtp.client-ip=74.125.224.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Je5KCKBh"
Received: by mail-yx1-f98.google.com with SMTP id 956f58d0204a3-6685483aad2so835885d50.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832840; x=1785437640;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+WYYInix3FtTZWsyC9jQCEaLFxb5exT8JjDtTER/rA=;
        b=gzmjHMLcZrs15wLmFtSubigQf90BzT+CGxREM6q4hyWSHsS5pVCpGK+EfYsfGhjbXX
         JsbBymjIXGNF0wYY+QuRkigVKzSuhQZq5FSSaSGtVIOcd+OneS5PxV6zR22Sas4W+dmX
         YrIarPypMz+xI5/Gvq4mMRqXAZot1pJn9f37rqGTi7S5lnCHhAVmCt6BrkePh108aqhM
         Wg14T0WQg+dkt8rW+S8cyrTrkKHXuZErSFR4CByh4RPmlfaMp7DpcK0DGkRNdQnGIXIW
         vZShktjf382OGqlK7gpeIhC6soSnk4nQC2epRTPLzBZ6lnGj1zfTRibKapIf59lvGfn9
         XoRw==
X-Forwarded-Encrypted: i=1; AHgh+RpRuYlW0goh4frQfGEMWdz1gzFIWxcoH0E9w0IYgqgpffIdDzZoJNiTmkj0AYgwjev5gOmMVdwRxyrt@vger.kernel.org
X-Gm-Message-State: AOJu0YwLggF2UAaVhiU/F7LBUqeMN6uPIrClGWrbldGR6ILpjiFqpSdX
	Dvu1ejooqUoyaG45eeqovjNoeJgXs32job3Uab7sqotv96hJyqe06mkjpI3w09YSWGUq4mDY7hV
	Ty6AULakX9j2uDlBm8roCsfh7ocf0n+mPETvgV1yQX6TrqfxezoJAsjRbKwok5vb3IJ5LKYwaHj
	cBr9bTrEmPmyQozBQlKhPSlloRk7wiDGHK5JbkEvWOiD7QFZn2BF4/s7mKmyvIs9KktGSkYaNFU
	pdrQFqXS7r7eQ==
X-Gm-Gg: AR+sD114DWlpIACnWWvKh37wyffrFTwdmeyuBZ8ylRn14YgmNobjvc2YpkXEZYKyvH4
	Fev57FvsRE7UVvvQephVb3OTldJ1/0TxpIew0MOwzKbf9yV1K9DPnwkjjf/Gv/8k75qVz1NmtNJ
	sMJoHEN7zCpZUJgx/GbEcK8+9ySejKN7el1W0oPFwJDBWlQWgPkJsYFE5b65AEWgM5MLcEFViQv
	7lO1O5KcVvHAsH2MS5H7n4/3UVmEfmPJy9xisvyXkYutqmvsKpNEIxE+hpi1PSvpYkOeTo3N7fh
	4q2Cex9MsMauKsjZMJMDxXM7qlOhBU6q0vvYP/4hI5Jm8D5LCZHbkdlBDsVr8h1/IvymJ4scdef
	iCdAgdp2nbQ0FAUdq9Yk5gJHsWS7DQL2MhnG0MXfhzlz2AD+/N3ZxetbXP5uNaDv8H8I0L4mQkD
	qcfir/tSU05J6Hl5gFs5unz5VRPBBqN720
X-Received: by 2002:a05:690e:440e:b0:667:bdcb:c5c0 with SMTP id 956f58d0204a3-668a4f86c29mr749429d50.77.1784832839728;
        Thu, 23 Jul 2026 11:53:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-6689073044asm392970d50.21.2026.07.23.11.53.59
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jul 2026 11:53:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so1031089a91.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1784832838; x=1785437638; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+WYYInix3FtTZWsyC9jQCEaLFxb5exT8JjDtTER/rA=;
        b=Je5KCKBh5dnDAUEF35sFDy5OWV0ama6ojpkveZT7eI5NIs4NkGM4eaKKQv2tKVvPYT
         d389YfTeb0z2Ow9AsCDEBAnF2wsmy4NzUFtBOOHYbn6t3D86GBQHVuEMkAdJDBuP73Hr
         aAEd01vwhxtoVyZL+Pi0ApBJ2CM1ticGd0koQ=
X-Forwarded-Encrypted: i=1; AHgh+Rr72O6PWpYf0bCFMubRyiOvAm4ro85hktXxDFBE14NnFGhRnG6dGN5poKHkDy/5Br0l+d8r/ru+Rg6M@vger.kernel.org
X-Received: by 2002:a17:90b:1b07:b0:38e:4b60:e01 with SMTP id 98e67ed59e1d1-38ec6429847mr4086134a91.12.1784832838282;
        Thu, 23 Jul 2026 11:53:58 -0700 (PDT)
X-Received: by 2002:a17:90b:1b07:b0:38e:4b60:e01 with SMTP id
 98e67ed59e1d1-38ec6429847mr4086112a91.12.1784832837779; Thu, 23 Jul 2026
 11:53:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722211417.3702709-1-kamal.dasu@broadcom.com>
 <20260722211417.3702709-2-kamal.dasu@broadcom.com> <20260723-venerable-infallible-oriole-434b75@quoll>
In-Reply-To: <20260723-venerable-infallible-oriole-434b75@quoll>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Thu, 23 Jul 2026 14:53:20 -0400
X-Gm-Features: AUfX_mxp3MbXhsuXZkwkR_YeR5hlo0zFxX3WR9zpys3NZWSXcgnR-VOmZkh8Yp0
Message-ID: <CAKekbevxiN=8q60sHkRLKzEwc75PYHO7nJtMEahLF+u39g-FBw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: mmc: Document no-mmc-poweroff-suspend property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Avri Altman <avri.altman@sandisk.com>, Pedro Demarchi Gomes <pedrodemargomes@gmail.com>, 
	Erick Shepherd <erick.shepherd@ni.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000558c1106574bc735"

--000000000000558c1106574bc735
Content-Type: multipart/alternative; boundary="00000000000047ac6d06574bc76d"

--00000000000047ac6d06574bc76d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 3:51=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> On Wed, Jul 22, 2026 at 05:14:16PM -0400, Kamal Dasu wrote:
> > On some platforms, firmware accesses the (e)MMC card directly during
> > system resume from Suspend-to-DRAM, before the kernel's own resume
> > path has run, in order to load boot code using hard wired logic that
> > is not field updatable. This requires the card to remain powered
> > and responsive throughout suspend: it cannot be put to sleep, sent a
> > power-off notification, or have its supply removed.
> >
> > Add a no-mmc-poweroff-suspend flag property so affected boards can
> > tell the mmc core to keep the card powered across suspend instead of
> > sleeping or powering it off.
> >
> > Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> > ---
> > Changes in v3:
> >   - Renamed from no-mmc-sleep; dropped S_A_TIMEOUT framing per Ulf.
> >
> > Changes in v2:
> >   - New patch, replacing v1's card-level quirk, per Ulf.
> >
> >  .../devicetree/bindings/mmc/mmc-controller-common.yaml | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git
> a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> > index 3d7195e9461c..5f7b3f8ef1dd 100644
> > --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> > @@ -232,6 +232,16 @@ properties:
> >      description:
> >        All eMMC HS400 modes are not supported.
> >
> > +  no-mmc-poweroff-suspend:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      On this platform, firmware accesses the attached (e)MMC card
> > +      directly during system resume, before the kernel's own resume
> > +      path runs. The card must therefore stay powered throughout
> > +      suspend, and the controller must not send it a sleep or
> > +      power-off notification. The kernel re-initializes the card
> > +      after resume, since firmware may have already reset it.
>
> Isn't this exactly the same as keep-power-in-suspend?
>
>
Not quite, though I see why it reads that way from the description
alone.

keep-power-in-suspend only takes effect through host->pm_flags, which
gets set at runtime via sdio_set_host_pm_flags() -- an SDIO function
driver opts in from its own suspend() callback, per suspend cycle.
The consuming logic lives entirely in mmc_sdio_suspend()/
mmc_sdio_resume() (drivers/mmc/core/sdio.c); pm_flags is never read
in mmc.c, which is what this series touches.

no-mmc-poweroff-suspend differs in two ways:

  - It's a fixed platform characteristic, not a per-driver runtime
    request. There's no SDIO-style function driver to call an opt-in
    API from for a plain (e)MMC storage card -- the requirement here
    (firmware always touches the card at resume, on this board) is
    always true, not something decided per suspend cycle.
  - The resume-side behavior differs. keep-power-in-suspend without a
    wake IRQ does nothing at resume: it assumes the card's state
    survived untouched. This flag needs the opposite -- keep power,
    but still fully re-initialize the card via mmc_init_card(), since
    firmware may have reconfigured it while the kernel was suspended.

Given those differences I went with a host capability following the
existing no-sdio/no-sd/no-mmc/no-mmc-hs400 pattern in mmc_of_parse()
rather than extending pm_flags/keep-power-in-suspend, but happy to
hear if you see a cleaner way to fold this in.

Kamal


>
> Best regards,
> Krzysztof
>
>

--00000000000047ac6d06574bc76d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 23,=
 2026 at 3:51=E2=80=AFAM Krzysztof Kozlowski &lt;<a href=3D"mailto:krzk@ker=
nel.org">krzk@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Wed, Jul 22, 2026 at 05:14:16PM -0400, Kamal Das=
u wrote:<br>
&gt; On some platforms, firmware accesses the (e)MMC card directly during<b=
r>
&gt; system resume from Suspend-to-DRAM, before the kernel&#39;s own resume=
<br>
&gt; path has run, in order to load boot code using hard wired logic that<b=
r>
&gt; is not field updatable. This requires the card to remain powered<br>
&gt; and responsive throughout suspend: it cannot be put to sleep, sent a<b=
r>
&gt; power-off notification, or have its supply removed.<br>
&gt; <br>
&gt; Add a no-mmc-poweroff-suspend flag property so affected boards can<br>
&gt; tell the mmc core to keep the card powered across suspend instead of<b=
r>
&gt; sleeping or powering it off.<br>
&gt; <br>
&gt; Signed-off-by: Kamal Dasu &lt;<a href=3D"mailto:kamal.dasu@broadcom.co=
m" target=3D"_blank">kamal.dasu@broadcom.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes in v3:<br>
&gt;=C2=A0 =C2=A0- Renamed from no-mmc-sleep; dropped S_A_TIMEOUT framing p=
er Ulf.<br>
&gt; <br>
&gt; Changes in v2:<br>
&gt;=C2=A0 =C2=A0- New patch, replacing v1&#39;s card-level quirk, per Ulf.=
<br>
&gt; <br>
&gt;=C2=A0 .../devicetree/bindings/mmc/mmc-controller-common.yaml | 10 ++++=
++++++<br>
&gt;=C2=A0 1 file changed, 10 insertions(+)<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-comm=
on.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml<=
br>
&gt; index 3d7195e9461c..5f7b3f8ef1dd 100644<br>
&gt; --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml=
<br>
&gt; +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml=
<br>
&gt; @@ -232,6 +232,16 @@ properties:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 description:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 All eMMC HS400 modes are not supported.<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 no-mmc-poweroff-suspend:<br>
&gt; +=C2=A0 =C2=A0 $ref: /schemas/types.yaml#/definitions/flag<br>
&gt; +=C2=A0 =C2=A0 description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 On this platform, firmware accesses the attached=
 (e)MMC card<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 directly during system resume, before the kernel=
&#39;s own resume<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 path runs. The card must therefore stay powered =
throughout<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 suspend, and the controller must not send it a s=
leep or<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 power-off notification. The kernel re-initialize=
s the card<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 after resume, since firmware may have already re=
set it.<br>
<br>
Isn&#39;t this exactly the same as keep-power-in-suspend?<br>
<br></blockquote><br>Not quite, though I see why it reads that way from the=
 description<br>alone.<br><br>keep-power-in-suspend only takes effect throu=
gh host-&gt;pm_flags, which<br>gets set at runtime via sdio_set_host_pm_fla=
gs() -- an SDIO function<br>driver opts in from its own suspend() callback,=
 per suspend cycle.<br>The consuming logic lives entirely in mmc_sdio_suspe=
nd()/<br>mmc_sdio_resume() (drivers/mmc/core/sdio.c); pm_flags is never rea=
d<br>in mmc.c, which is what this series touches.<br><br>no-mmc-poweroff-su=
spend differs in two ways:<br><br>=C2=A0 - It&#39;s a fixed platform charac=
teristic, not a per-driver runtime<br>=C2=A0 =C2=A0 request. There&#39;s no=
 SDIO-style function driver to call an opt-in<br>=C2=A0 =C2=A0 API from for=
 a plain (e)MMC storage card -- the requirement here<br>=C2=A0 =C2=A0 (firm=
ware always touches the card at resume, on this board) is<br>=C2=A0 =C2=A0 =
always true, not something decided per suspend cycle.<br>=C2=A0 - The resum=
e-side behavior differs. keep-power-in-suspend without a<br>=C2=A0 =C2=A0 w=
ake IRQ does nothing at resume: it assumes the card&#39;s state<br>=C2=A0 =
=C2=A0 survived untouched. This flag needs the opposite -- keep power,<br>=
=C2=A0 =C2=A0 but still fully re-initialize the card via mmc_init_card(), s=
ince<br>=C2=A0 =C2=A0 firmware may have reconfigured it while the kernel wa=
s suspended.<br><br>Given those differences I went with a host capability f=
ollowing the<br>existing no-sdio/no-sd/no-mmc/no-mmc-hs400 pattern in mmc_o=
f_parse()<br>rather than extending pm_flags/keep-power-in-suspend, but happ=
y to<br>hear if you see a cleaner way to fold this in.<br><br>Kamal<br><br>=
=C2=A0<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
Best regards,<br>
Krzysztof<br>
<br>
</blockquote></div></div>

--00000000000047ac6d06574bc76d--

--000000000000558c1106574bc735
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
H0K0rs+X8O45xZIUJlxzf5UZex3BLi1f/H+08rSQULWEtO/ECwkFod2DIzSX7fZdz5RQ1PpziEOp
goo/JZPYIeCmgt3rIyvMuupj8Ymb0J/velhpXfQuYUM52viw2nmqVcxCwBqyM3Iq7eI4xtEOFRmR
wxSizd3MSQMf6GCHA4/B/6ttnxhGAr3utaOU+x/RnzG0gPLTW1XRAQ0+GVc/tGFdI864OG1cyrRl
GvBnHJQSAFOIKwYrUk2oFpgMbafQ6osCAwEAAaOCAdswggHXMA4GA1UdDwEB/wQEAwIFoDAMBgNV
HRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYt
aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFww
CQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRw
czovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIgYDVR0RBBswGYEX
a2FtYWwuZGFzdUBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAU
ACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFOV9h+N/T9ZsJ40qRxh7NYYD+N6MMA0GCSqG
SIb3DQEBCwUAA4ICAQAKtKh30wv1/30230mCimgUjMWQE/LImRmyfDgrp2IhBVS6mDun+wH8thEB
WhBHQMz3gsGixU4ZBJG72eWi39IzQ7CGnisJwA0+hsGaGg03AVtFtqo1rXYRZ81MEDOb6BPYLigJ
RsHbNmrUGR+LsGeUwOWUeRXqBrYaYFrkgHKvVK1NEewv+vUY08n4tsezO3jq0HKhVDY46bMbf8vL
oQqqhtcQvu2+5FK2jpUayeubpzPwobjEG61RIhBvM0KivY4CB2s9A7qgjL1XBycAybIvG03BbFoT
t282FqXwk9JU6YihLlt+hpzO9UF7E8GZYlQlVIZOLOvytqilhua+2h77Yy8Jz/FJyIXKuaLPtvb2
SC2shL7jF28kQbP3QUKwAig+cxwbpngnUkd9D9cXSHVq9PPwYm0A4eAO0YQ/80Uq20+gXF++g0sy
NKrrV3i0T1dbCd86miGDKvarGzjh7pdsdwNY15liGP6Orib1tnWkJcbtP1rJty4r/mbbxcK8ILO4
IvTGFG6BfjJ+La0aRt69i1fQmjUWHLwzkLNpw9cJH8/MONZcEJeDkq9WELSyy29bagStk5KHu7NO
TH65sZg+i/4qmj3DEeEGTr/Shzp4YWSNn4W7NEelr0VgDlwa7xqlwZjXxG4MIJqy0SsQlAwEXtqd
nH2FpJfzgAetkuyU6DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2Jh
bFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIwMjMCDEca
ZUGCu6d0oT1M+zANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgSQeBk6NELo/mdWND
hbhCrWv8rkPxB7wN66pOMunUY6IwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjYwNzIzMTg1MzU4WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEw
DQYJKoZIhvcNAQEBBQAEggEAUfW8HEwQrjGeLEyOhRyHZJ4dt282qEXK91NxU1buZ78ttWyUmBLG
6ghWoIxpbpdFofbAcb2PDXEoBOmdhSwVPubIeW01UjJCkD4ZInfkHyzUuApl2t5pr8RG975dpY63
NxME6UebDx4mYuBcFaz6v0iBd0qOT6FqhtTnKyJ7i9S01FaXwS9zxjxxHFy7eJ+o539obRhBr3U8
HNNFEPTR7pPtj2A+RCXfQpX023sitdQUgIzdOtf0c5o6UMCdJuoaGWH+oSUYsJ/PChl1SHPBtgq1
BSpMhKUHy4rEyzQFxA+jrpWtrUXrVOS0qmAXVVT6xV7nBaNOZez7EI2HYpceWQ==
--000000000000558c1106574bc735--
