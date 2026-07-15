Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9801D435AAB
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121615; cv=pass; b=Sc66k8/OB61iMgmBuuzItJTK10KUopW0Tai80RLHYE357b8QHAboZcLVAXGGayLXGIZh/Rrxw344d1bNx1bEU1Mtc1Gwn2CvG8q5OkHN4H4TPPCKRREWD3+8Jp6Vea3G7HBmagK5BUf0n480CSwiJg70BTSOF0pITl5wtEu/3yU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121615; c=relaxed/simple;
	bh=SlSFSIWLWH2oc8UzFRnHM3yL5Po5PvliK6hlvsEAwBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ov1DeW6PqIrjrHuUwJGShl53+7i5iZJFeTOqYpBUSFy1D3Z+zexjE3C80+UwR7TceH768i/yMD8/74zOcoxunXiYsSzecQoWi8CFCq/vmwnTeoTvpqcnhO1xt0wyXR2PqmW4fsDKSjhlcrHcnb21tp3ke1fzUB4KOlnPCmZCiYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhOEi/yz; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhOEi/yz"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81bffd7daa7so5465697b3.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:20:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784121607; cv=none;
        d=google.com; s=arc-20260327;
        b=XTQ6gyKxL5G9n7E5Z+Yi0PCWGnNNSW0vD5gw6WYtVy3Db27ascwS8V9lFTIuoLYd9a
         NsDGNgSeNpwxW9i6kb9cymqmMopk+pDHjFfz2TCiKYA34RCq7LUcxCPhEKa0voP/spL1
         H10aBeDxPpce6biHyB2J7I1QLEsIdE/kHfTNBP51agqPOROSFwjLXoLu9jaOTRD832k9
         mGc9NcgFdCRpOsIjJzSyuqPz6GRLpBOxKitJHqdDCtuLE1Xt7PwKTPm+0dqU7tKE/2r4
         o9VOxFwYQw8Jd9uiR6WJvPV+7UCm3Iqv33JPIL6hPYtPRTzmKlTDV2K9En2/nOmF9d0Z
         Tjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WXY1t7E/1tBkZvLdCQEWkFucsdeDnwjuKZvuP0c9BUk=;
        fh=7kl+uq9g8Pftk0oe59gBCOjZQNwvWIbkkvsHSQqX0vs=;
        b=i0n3lp5DFkE8V3EjMLQEsWy0jUiqLA68Pe2sdorB3VEDK71xHo8r5wA0W0Rn0aGKfz
         7kqovRQM3DVX4j0x/IfAWXEcgzLzp/MVw+fcDxw+nmDapRepAPYQD2dUnf2XCsrTC/+e
         puBZuBTAN0PrV3fFpol3wc7h3VedZoPtrxyJqR1e59+bum5PXORzR52fvhh08UZh/dIt
         uCYciKE1cQI6Oi4cgYg90RbNKM38a1vVZWSozQ7PEi97z2DGLhoqUEKT/VVKCAbs/BM9
         P7fA5AHZxfXA3vBSMj1qe9VZKRjeByP7JSxcOiTls4lpH2uGkStLIUiOFyuWfG6/ldi4
         kkfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784121607; x=1784726407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WXY1t7E/1tBkZvLdCQEWkFucsdeDnwjuKZvuP0c9BUk=;
        b=OhOEi/yz+pSaw8QNY17aDkg7tcItW9V0JJA+61TrUTHyffW2ZlODHHXJGDf4lNY4Z4
         jhoIkQgoazUpdI6a7byyBNucs1MpgUXwsSzVKqLPlz6tLRMKGb01oyxhNWNZAQB4h1sj
         t7CinGzkDknimPNunxVt4SHBJYUOH9QQCbDp7RZVrN3vLHGryukTe/jA7TMC2k8darGq
         j5n+YELNCF6fL64CSmGTKHcreb2C9cjWZsl4w3YPWUvlxuSk/v6pki12V6jpThr1miPM
         Am00ele5ESc94dS0jXPlXnxJkkN+buKvR8Bz9a/Fv0RI1vU0W1r5Ezu3NqV4zDwRs2BJ
         mDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121607; x=1784726407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WXY1t7E/1tBkZvLdCQEWkFucsdeDnwjuKZvuP0c9BUk=;
        b=QXNifYkWvxoWfV+tEnhlkrKrPxdqanFKH+bWmQJuskYwsg+MvdixWzqQyOhRZmCA6N
         qo6anJnMOTnCItFO5TFc+WLaqwR95qRc99JvqT2j6G5oD7QU+wg4lFD4nEGwY+nI1CXZ
         5qZuO6xKmOaoKjBtDvtt07lP9meOBYQjQPlrg5OBP01Tj1Wh4PDf2lDs+Ec/ziFHLyKI
         5qCRrobE7EgT3dEdxTewDuGERqtwpTPc0kp1O9ybwNrFPRJ1q1PcVC94o0DNMFAOz7ga
         i7UFFw0sDe6bqGr8rZa2QCbLMLvmKdEO2Z/x+Nnzvfcdxg0DLjHRztt48ecK+ZNuw9ar
         fZ0g==
X-Forwarded-Encrypted: i=1; AHgh+RqgphEr87R4nUyOGUo27Qlp7uGi1emyzUBSgMSpQrdGWqOvC+c5XnAoq60SFFr7B62ObG7lIUUjqtEx@vger.kernel.org
X-Gm-Message-State: AOJu0Yywb2ddAUvUpQqx4YuVfPpEAtMm4MKNJVq3YTTmf9mmr1raTJMz
	bkx5paNXQ2q+9d/F19ZYIZvZTzQ+wffVngGFMcud9HnopDFlw/MpmVW0nKKGGfakgfKegBfKbxA
	0VUQeBUwjGHFXS2E3p84imcUmSEMkBH4=
X-Gm-Gg: AfdE7ckfXYbZ9cNj1TiSHxzf4tz50TIm/uEG5J1ZioBo+cTkD6mvvihWHjMzxe7jXCL
	0KuJCqcuBvN7cN4SNuFv52uJnKhM3IX1i8iKqSzGNvGRdsQRsDQ9M5kKQQDZZSt/huuNvC7v152
	suTFjQkz3fzO6E1YwYHF/vWbacx0tS4Ier/xvYBBa8lVqpoWdvOIMZngg+xyUY3+qBaNsYzkv8a
	dGXOUVMce+laxY5nTF/hX/F5MAWJ/VejSYQ0jQW+tEK55uLnp/wwRzNQ/o/iqSSj0L6TtUIblvM
	OQqSfSFCR2AzixBb9CnAAPxj10tVqYpYq+8UVy1e9A==
X-Received: by 2002:a05:690e:408a:b0:668:f57:890d with SMTP id
 956f58d0204a3-6680f579a70mr2837584d50.6.1784121607296; Wed, 15 Jul 2026
 06:20:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715051939.64652-1-royalnet026@gmail.com> <20260715051939.64652-2-royalnet026@gmail.com>
 <20260715055448.AEA021F000E9@smtp.kernel.org> <CAEWPSH7OqecBKvxUVtwFe4B9y0-=gsQ7vy6kdBHx-Nsne-Ct1g@mail.gmail.com>
 <aleBPE5YHlC7pLpi@venus>
In-Reply-To: <aleBPE5YHlC7pLpi@venus>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Wed, 15 Jul 2026 15:19:54 +0200
X-Gm-Features: AUfX_mwfTO8e_VPJdfOPse4or6ggrePK7Jx-SNC6g2Ok5lGwy5jpc5Cegi2PMVo
Message-ID: <CAEWPSH4AYfSR_DBcLFr6a=SJxnAAcjoK612v+g-TpP046qTBmg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, kernel@collabora.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Sebastian,

> It should be 1 from the start as the DT binding is supposed to
> describe the hardware and be stable.

Thanks -- keeping const: 1 then.

> But in the next version you should look into updating the commit
> descriptions to be less about the kernel driver and more about
> the hardware.

Will do. I'll use your wording as the base for the v2 commit
message, document that argument 0 is the I2S and 1 the S/PDIF
interface in the property description, and move the consumer
reference (sound-dai =3D <&hdmi_receiver 0>) into the example
section.

For completeness: the driver part of the series currently wires
up only the I2S interface (DAI 0); the binding now describes both
interfaces as per the hardware.

Thanks for the review!

Igor

On Wed, Jul 15, 2026 at 3:00=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hello Igor,
>
> On Wed, Jul 15, 2026 at 08:55:37AM +0200, Royal Net wrote:
> > > Should the constraint be set to 0 to follow standard device tree
> > > norms?
> >
> > Fair point. The current RFC wires up a single I2S DAI, and for a
> > single-DAI provider 0 is indeed the norm -- rockchip,dw-hdmi does
> > exactly that for its one DAI on the TX side.
> >
> > The reason I picked 1 is that the controller also has an S/PDIF
> > audio output path (the vendor driver exposes both I2S and S/PDIF
> > DAIs through hdmi-codec), so a DAI index becomes meaningful if that
> > second path is wired up later.
> >
> > Unless the DT maintainers prefer keeping 1 from the start to avoid
> > changing the cell count if/when the S/PDIF DAI is added, I'll switch
> > to const: 0 in the next revision -- please let me know which you'd
> > prefer.
>
> It should be 1 from the start as the DT binding is supposed to
> describe the hardware and be stable. But in the next version you
> should look into updating the commit descriptions to be less about
> the kernel driver and more about the hardware. Maybe something like
>
> > The HDMI RX controller has two digital audio interfaces, one for
> > I2S and one for S/PDIF. Allow referencing connections from audio
> > codecs to these interfaces by documenting the missing #sound-dai-cells
> > property.
>
> Apart from that it makes sense to document that argument 0 means
> I2S and argument 1 means S/PDIF interface in the property description.
>
> Last but not least drop "A value of 1 lets a sound card reference
> the audio DAI as <&hdmirx 0>.". Instead you can add this to the
> example section at the end of the file.
>
> Greetings,
>
> -- Sebastian
>
> >
> > Igor
> >
> > On Wed, Jul 15, 2026 at 7:54=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> > >
> > > Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> > > - [Medium] Incorrect cell count constraint for single-DAI provider.
> > > --
> > >
> > > --- Patch [1]: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: a=
dd #sound-dai-cells ---
> > > commit e6b0bac0b97f568ce749084e6c1e728bcd258b10
> > > Author: Igor Paunovic <royalnet026@gmail.com>
> > > dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
> > >
> > > This commit adds the #sound-dai-cells property to the HDMI RX control=
ler
> > > bindings, enabling a generic audio codec to capture incoming embedded=
 audio.
> > >
> > > > diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-r=
x.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > > > index b7f6c87d0e06a..83c10d9997c8e 100644
> > > > --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > > > @@ -78,6 +78,13 @@ properties:
> > > >        The phandle of the syscon node for the Video Output GRF regi=
ster
> > > >        to enable EDID transfer through SDAIN and SCLIN.
> > > >
> > > > +  "#sound-dai-cells":
> > > > +    const: 1
> > > > +    description:
> > > > +      The HDMI RX controller registers a generic HDMI audio codec =
so the
> > > > +      audio embedded in the incoming stream can be captured. A val=
ue of 1
> > > > +      lets a sound card reference the audio DAI as <&hdmirx 0>.
> > >
> > > [Severity: Medium]
> > > Is this cell count constraint correct for a single-DAI provider?
> > >
> > > Looking at properties:#sound-dai-cells, the hardware exposes only a s=
ingle
> > > generic audio DAI. Requiring a cell count of 1 forces device tree nod=
es to
> > > use a non-standard syntax like <&hdmirx 0> instead of just <&hdmirx> =
for a
> > > single resource.
> > >
> > > Should the constraint be set to 0 to follow standard device tree norm=
s?
> > >
> > > --
> > > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026071505193=
9.64652-1-royalnet026@gmail.com?part=3D1
