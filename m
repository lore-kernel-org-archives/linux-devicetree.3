Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3854EFFCC
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970697; cv=pass; b=RDT8b51tJVSALU7V5T4PfJ69l/nAx9ffnUQ4rnPm1K4ziDqMuMLDjrDikVJxugkqrmoAe+/JtXKAVGeJeiiU1ZANdHxsQL4mijt5ce9cBjJBmYaNGeoK0fWCTkoZ81hiLkU8KRO8hsfFP0KRNJrtnCz7ig6Tyb7KyLXfxjNwI54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970697; c=relaxed/simple;
	bh=g7zY5LqWbX7zCAxfbqvGmNGg5FGFzE06omeqj1uG3CI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZRzvPCVKEZTNxSk/jcr/NrC5qjzIo0RENOYg+Q41e7Zb5M5uURKfI0K/SS0ck5921/hF7mRgdkQiJWMv0gcBWY94kBGU0RJgX9tcYPuWrmQv19CdshW3Di2y0Neuv+mxL0wWuClzwsKzpiTieye2TFS1Zzutd2JJ/DHdWZKh80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q/7zgEMj; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q/7zgEMj"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso3183823eec.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 02:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791970688; cv=none;
        d=google.com; s=arc-20260327;
        b=MzyX3pfU8vHmvO7lN3g0EL5qjriwL52pDXyAhaKGPN+F0U9eeO49yNNWGX2Qzwo5bP
         zYmKKfGH71ezPl3OhwSFWO5Ui59gM9xlMlEzTSik5r4r5nsUb4Y99CBCrmyTernvadR+
         YFSj3MUWexH+82qvkUOGEPQXXUD/NRX6IHb0Yf+2reJzYKdPEXmykAIyNZrWGUO7Z6qN
         EcO5Ix33PMoObs3x9pXYtSnril229w4psHmHFFyXRSTylZMfRM0Ln0B/QrNgSpXuGHJC
         2Cd+F++4PICNmvsfXxjkttqjH9LjIc4at7kZEi6iRoukqWeGZC37/TaqhroONpMCgGPE
         pEVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1GRnJUmV5s4dSNP1R/wksRwnenMI3escdmM6c2DfrR0=;
        fh=MwA8WEjYJmVGNru5BrTdjI4rw+tkehNh+lFyaa/dDhI=;
        b=b38ZP33yMuSg/t+jJHfzs1882igmOMhvcrZHWuEBM9wwJNhHIPbyCcU8iXawnv9+Wf
         AkWtGSZLL7SPxwzbqBL4WYtyTNuYXo8NfwBymPQbbOQVLu6FrkBMOknJ6pzQLyJcjfhf
         Cr17Q5Ve9W9wIvQUk9SZ3E1M02M3FMJO1PQvi1FaV2GOH7DoN7tZVjA9TTQqGHddOVve
         TcquU1JZGDNmdsZKo1Jg8KyIZy5LqAkLWuQkwpeFACuROe66th7FEtDjFJL3AzrSXBOU
         QeKhi9+Zljpn6BCmwUX56IS8PxVdSvqmNtAzKW+KjXfEQfBG02BmVuzPbpFsrz/sfgV8
         40oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791970688; x=1792575488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1GRnJUmV5s4dSNP1R/wksRwnenMI3escdmM6c2DfrR0=;
        b=q/7zgEMjdIv8rMv8KsQ23m57DHmzEJq2oy7GHZ4tFt4b76WiF854VC3Bzrig6VVxa1
         +xpKNLBOBMBlTXcfTxuPil7xG2o9+rzaelJJh93QRuRNBtwZCiTS5LHQlNZelFzOtmXL
         wneOa9aPDmvCyOSSMSpJFWAW3+wN3o+VAPQANbh6q5yVdbGutJj7SJC4tiPANyZHhhfP
         2piH254oDxVMIZIbTKPmX+dCcrOeWz5Tw2oE9exqVur4syQBaYmiKYStfCRNd15vKspD
         +pI8Dz4UOldHz+XXtp5KGLDX0ESzbN3cE5QCWImib6g9E2AFiX0MulbZDPIERsveT1R0
         i0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970688; x=1792575488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1GRnJUmV5s4dSNP1R/wksRwnenMI3escdmM6c2DfrR0=;
        b=NlMokRAcS2rYGJ5a8BcxVdctjdLX2Khfnu1zoR/mTj/PDK7qo3maHVq6BlwnbrmyhY
         LOE+Iu4E0SvV8Mbkr1rJwGgCZ8oLSIWQwRP5axOQQvoLOZpA28ZzZnQnG5/3md/GEUKW
         DP0gBe/lrn780BaJvHsZgB1HMZUsoxpr5flVMh4c02rLWetBTaKcpmoDQqigI9wVI8Bn
         f1SQ1C2yQ74c4W1GnhwdS2pChGknOiB0ju6xFZYKnWEgwGBN6UCOfU/fDuDIvTR/qH6g
         D4tkOXVSksAtiUf32p5kQvti68Q7awWDZUKmVH2Jz8ut1rMPDtejhF3gK6zkeRFSBSJu
         HnWg==
X-Forwarded-Encrypted: i=1; AKwUvBxgyirvyBZZDSSLCcBv4PK67GXGnTeMeBlFy4JtpIsPSafJWR5bBErOYVjt2JTT1Sl6WurVdgWfTtGa@vger.kernel.org
X-Gm-Message-State: AFq9FYJeVqksA0w9SkQJNEJG20gZF3pnAIIBrRNCXNnDtLCmWSOaOK6n
	aGozT+C48PqjqDaBCFzyqjI77X7xYD8gyXSfDrlMD+Tpt9LreLifns9ssQuxzLN8IBSVd8dZoR7
	s/ML6RytVtlLEsVSfPPugqunNtuJ3vPw=
X-Gm-Gg: AYBFou2zDTKt51K+AKOWmUslKzAIOTwypUPm2YiVzv/5/9knOFDU0/hxT5vFaQVgaYP
	uq0+DLyZtg3ZeGWOc1k8pMuOlevHzFfZXQ6hpK01cf3Hy1otOAarcmEhGiySsY0n6Gt+roqWBAa
	Jzqy7x4TOEYBeaTdulM+ThHfjwBhIF82A6Fum9Kyezlh4diFNbve785F/XtPsZPESZnlqsVS/hI
	J0OWZG2bk1zB02PjaX76abXx+YQ4hBHmzwssy3ELJm32kXSFsX0hZQKcrp7MfDuqTh+bmPp8Npx
	qYbdX6N8zqi+xQOhPUlOldeHDFUBYe0+DWQ/K+y0+jxCs9DIDGpRXbW1dCITkgVHLTq79qrvPE+
	YePQi4pzpAEp3
X-Received: by 2002:a05:693c:41c5:20b0:35c:ba31:6fef with SMTP id
 5a478bee46e88-35cba3173b2mr5358615eec.36.1791970688092; Wed, 14 Oct 2026
 02:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007085457.98762-1-clamor95@gmail.com> <20261007085457.98762-3-clamor95@gmail.com>
 <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com> <CAPVz0n0FiT93626L3MnMCto1X0_FmWp_zzQpQ=yRBXn+ir6OPg@mail.gmail.com>
 <4abc72fd-c645-4410-9387-3f03c751fd3c@gmail.com> <CAPVz0n1YKV84J6eG9juM_V5kLCy63WY0hmicUmyEXZp2eEHKyw@mail.gmail.com>
 <f7475c9d-8dda-4dd7-9d11-4b981de1b7f8@gmail.com> <20261014091732.GH199624@google.com>
In-Reply-To: <20261014091732.GH199624@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 14 Oct 2026 12:37:56 +0300
X-Gm-Features: AclHuK8zDp7qUuUBcdJaZ9_rNb2h2tvvcSZ1LWN8ZXrMNyjbELJoL8dMw154gZI
Message-ID: <CAPVz0n3-=xn0Hy3BgPintGoONVO2NKyENYDQ_jSnM_Awxowjhw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
To: Lee Jones <lee@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 14 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:1=
7 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 13 Oct 2026, Jacek Anaszewski wrote:
>
> > On 10/12/26 9:25 AM, Svyatoslav Ryhel wrote:
> > > =D0=BD=D0=B4, 11 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 20:35 Jacek Anaszewski <jacek.anaszewski@gmail.com> =D0=BF=D0=B8=D1=88=
=D0=B5:
> > > >
> > > > On 10/11/26 3:55 PM, Svyatoslav Ryhel wrote:
> > > > > =D0=BD=D0=B4, 11 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =
=D0=BE 16:28 Jacek Anaszewski <jacek.anaszewski@gmail.com> =D0=BF=D0=B8=D1=
=88=D0=B5:
> > > > > >
> > > > > > Hi Svyatoslav,
> > > > > >
> > > > > > On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> > > > > > > Both the AAT1270 and AAT1290 feature a FLINH pin used for man=
datory Flash
> > > > > > > inhibition.
> > > > > > >
> > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > ---
> > > > > > >     Documentation/devicetree/bindings/leds/skyworks,aat1290.y=
aml | 4 ++++
> > > > > > >     1 file changed, 4 insertions(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/leds/skyworks,=
aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> > > > > > > index a65d92522c9cf..596b5e284f44a 100644
> > > > > > > --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290=
.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290=
.yaml
> > > > > > > @@ -31,6 +31,10 @@ properties:
> > > > > > >         maxItems: 1
> > > > > > >         description: FL_EN pin
> > > > > > >
> > > > > > > +  flinh-gpios:
> > > > > > > +    maxItems: 1
> > > > > > > +    description: FLINH pin
> > > > > > > +
> > > > > >
> > > > > > You don't seem to make use of it in your patch.
> > > > > >
> > > > >
> > > > > I don't have to use it in my patch. This change completes and imp=
roves
> > > > > hardware description of the AAT1290/1270.
> > > >
> > > > Still, If we don't have the use case I'd avoid adding it to not con=
fuse
> > > > people looking for its use in the driver.
> > > >
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ree/Documentation/devicetree/bindings/writing-bindings.rst?h=3Dnext-2026100=
9#n17
> > >
> > > - DO attempt to make bindings complete even if a driver doesn't
> > > support some features. For example, if a device has an interrupt, the=
n
> > > include the 'interrupts' property even if the driver is only polled
> > > mode.
> > >
> > > - DON'T refer to Linux or "device driver" in bindings. Bindings shoul=
d
> > > be based on what the hardware has, not what an OS and driver currentl=
y
> > > support.
> >
> > I'll leave it to the maintainer.
>
> DT should be OS agnostic and driver orthogonal.  So long as it
> accurately and indisputably describes the H/W, then I think it's fair
> game.
>
> Is `flinh` a datasheet term or did we make this up?
>

You can check yourself if you don't believe me. Both AAT1270 and
AAT1290 can be found freely.

FLINH pin #10

Flash inhibit pin. FLINH is an active HIGH control input with an
internal 200k=CE=A9 resistor to AGND. A low-to-high transition on the FLINH
pin reduces FL sink current to the maximum (default) movie-mode
current level for the duration of FLINH. Strobing the FLINH pin low to
high does not reset the flash timer.

> --
> Lee Jones
