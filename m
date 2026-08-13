Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7F12D739C
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642249; cv=pass; b=a4Av+FbvxvJfEJvtG7XyUi5loPK8HrSGMg5ZOjXJdPi9BdBOVn+2HSx+kmu9A5sriSLVU48rVXiMbRPk+OSVCNPCCPAOzrvlnDpySxZdGrt8FU0lcf5uc4lSYDsjrUcbyzjwJRwkVcXriLQ4XcIp+rr0zLILAmCrpz7bgbmr1sE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642249; c=relaxed/simple;
	bh=j6QfLqXa8jcIwV7hSiUleBvLmTNg0gTGUTYVxXAyLqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Db7YnMPpGCx0WGCQo8K1pctzurylURafanQG7ND+oumuDH99/k2k2PBdLwBxilsFy3AZzvpwIhnzReeozbhHLLF+oRm/RLTID5W55X4owwHY4fxbf6wAUfT48vfc1GLrphk3cvLm/saQCMyLUt5lgtsjITrRnb0H4KD6yzRmWDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrJ6xBQw; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrJ6xBQw"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66807ba2f0fso168009d50.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 10:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786642246; cv=none;
        d=google.com; s=arc-20260327;
        b=pWEAXW7p8WSfldeSX1fm49NmbsEB2rdyv5aO+ptBZAh2inJNiRT33Nk8IhbZBAZqNX
         Z+GxnhR3hhaUv3iMhSSWD4yZKcScm0RvD97rqIONEP3QfH4yfhUweEMXdk8oyGF2WoBu
         57Y9rjO3uKz22Y6V+NyMomB8+/6W0uWVeT8LX/2kOxIDmsyNQ0mpPAV37fYLSWuHOeVu
         VH3sZSxNBJCgPDzzgkcngGDPdV/5jBZnwjpetxowHpHELyU5QuC7dtrDU8DysNMk97NE
         1H/ntLCIhybvEDEQG3Y/eo4QG2VFo3vWt+A3K4UsKEmiSHnsc9cn2h4mIea5NsOgb++b
         kXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lx9QfW1jBnBLne5zOp4UBd9Snkw8zs0lPJtwYteOAIM=;
        fh=6+JzjkSni5M1yyUBg4/1CtpcDRqOPZWETr0+XFsFDmI=;
        b=bIA7QOdE/RV3RtYCTh1F7mOeksRWaOYn7YMD9pMokKi5L7LGxjhBHavnU5dvrL6Xoy
         r42ctDr0y1pD8v27lYZiQYSuJgfcEpzBOnPSDa+AH+L5w5xMHnQsx5NqjnLdNt4mf5Zz
         Y23ZwV/HEJPI6C0aRLiwQp0CIKMoIvK1c6NSGIxdq1QhXePLOFjbCF5BY01EtWEVgeBS
         wycFb3ZS4Kehn3XBIBx+Vr+y21FQlZSaEFswTu4S5XBJZ2zd+sxpjpnl7MacrJt/JSqN
         CAvSOaABYxA13GVaiawhMSOCEoUULtgpubOdFZB6Zw3PngpyUIh9ZiiZSW/PazOHRgIb
         qCeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786642246; x=1787247046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lx9QfW1jBnBLne5zOp4UBd9Snkw8zs0lPJtwYteOAIM=;
        b=lrJ6xBQwLMP9ohLhH9eznjaB2sJRcCKVdYlhnI4As6qk0KoF3r+fTTn+3Q0QrbvexF
         03NABE1d1FPaNCExUyDNf10OP+ea7mh4Uibq2OGFMHfrXdYIOl4eOvfsBOSzuTna5sKM
         ZVu6BR9vTdsyPJVeU53q0apQK7r3D0/jgFb0d3KgHuJmop42vAGvuutI/000ACT841Sa
         sGrwFHM50J3Xk7/+EzZBkqg6kgS8JV2hspFfPyOT3mERtxkhBdSQbfNjvjafj1zkrqDm
         GtmQ9eQ//h/nSp0ZI6lQ6xwM8sWtyvm978QIGjV6jVU0QoU8c4Rvl/ewab4Z4kMbDg6G
         fGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786642246; x=1787247046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lx9QfW1jBnBLne5zOp4UBd9Snkw8zs0lPJtwYteOAIM=;
        b=DN4WK7KqyrOc/BPtlQWGH+mcRtBRI0jf9ux/ToJ4PMsv0pzbfjRjZ9s5alZVJzqmFC
         2J8WbADusx++NXo9OC7DJwUsdFFvGmvZ/nTEDurhe7gKr2VMaxmNPQ/x6eKjoq2hF/lN
         DumNIFkV1f6cbLfn+DuTWQIZ7tkH+31wq/xLBG6hbf+9Q9Edv46ICnegbDK2WfuWxaZd
         w2T6mfbpLanbzNPMHWfmYB2oczKnfHnMnmRjB56YKWPavfARNnZvoACAiQEY7YgH6R75
         NX443b45yX3gq9rDrgf0g8GflIKgCdKI0nHMk6+DkOTSVKfBWxFdEeJ9aKFMZ9OO969o
         rbKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5UNpD/bJ0JsziJIAie94dR33Z6LWTB9pTprz+6j7PtV6e4PkCasqhzgG09PsOTRX9SRFG6NF75on9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1+4n/ignv521QP6yuoFD/YhrwFZHUw4p4ovoJmftaSpI9SKPw
	xpxUjwO5C5BEh3Nf5RqjJ9dh1Qoglq4jTiSEhVFjMkjuEDn2ccemjq88XOUzfQ2G9gibL5wV3AI
	q0IhvBpvjWrIrd/onTlOt7BRUfmUx99I=
X-Gm-Gg: AR+sD10snMG4P2r2w9pplIn0DWRZ+g04Aobl6tWHN/b58wUjbe9MxjZEWUHGFoRSBgZ
	R/Vq++1EGXjjK5AIp8zp5r2lnL6uq21LVeJaSXzS8bL5FrpAf9MrmeCXxQT5ER0aloKGj+BnMNE
	wyC4QG/yv1PWy79SYHrA6FNPAskAMqt0tim+DIr2eNEorlQBF8b8ZKa/mE8nPi/5tLS4vurRrGL
	mA3jnC0YaKodZkQsA2aGSenFSR8cCuMv4SOeVaRMUFhl3u9BtYFTHwejsIACHLeszqvHx44LDbM
	stHusrgqPvMFSRKSUpq4dwElxRAZQw/ElbEHYz2mcyPJcVZistLNYXL2dMlyDrhzSnkhBAdBvt7
	O
X-Received: by 2002:a05:690e:a4e:b0:664:f064:f65f with SMTP id
 956f58d0204a3-66c72be335fmr44263d50.23.1786642246132; Thu, 13 Aug 2026
 10:30:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731174551.86367-1-challauday369@gmail.com> <178579584771.736715.6031577704790719107.robh@kernel.org>
In-Reply-To: <178579584771.736715.6031577704790719107.robh@kernel.org>
From: Uday Kiran <challauday369@gmail.com>
Date: Thu, 13 Aug 2026 23:00:33 +0530
X-Gm-Features: AUfX_mwXdyvwqFkMfTSB4bW5XkPxnXQPKGMGnB_Yh8wf4BAqLLqwT8ujk06-mCw
Message-ID: <CAAj-GBmvcG62NddVS3UMEK6tQ2UKBr+=KCXe15jhCEtB+JWXKQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl:
 Convert to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, me@brighamcampbell.com, skhan@linuxfoundation.org, 
	linusw@kernel.org, linux-gpio@vger.kernel.org, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 3:54=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Fri, 31 Jul 2026 23:15:51 +0530, Udaya Kiran Challa wrote:
> > Convert Microchip PIC32 Pin Controller devicetree binding
> > from legacy text format to DT schema.
> >
> > Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> > ---
> > Changelog:
> > Changes since v4:
> > - Add reference to pincfg-node.yaml
> >
> > Link to v4:https://lore.kernel.org/all/20260722123243.341346-1-challaud=
ay369@gmail.com/
> >
> > Changes since v3:
> > - Drop "|" from description fields
> > - Remove '#address-cells' and '#size-cells' properties from the schema
> > - Consolidate repeated pin-node property definitions into a single
> >   $defs/pin-node entry
> > - Replace the two patternProperties blocks with additionalProperties
> >   using oneOf to allow either:
> >   - container nodes holding nested pin configuration nodes, or
> >   - direct pin configuration nodes.
> > - Update $ref to use the absolute schema path
> >   /schemas/pinctrl/pinmux-node.yaml#
> >
> > Link to v3:https://lore.kernel.org/all/20260719183431.124061-1-challaud=
ay369@gmail.com/
> >
> > Changes since v2:
> > - Add container node for grouped pin configuration sub-nodes
> > - Correct regex patterns of direct and nested child nodes
> > - Fix interrupts values in uart2 example
> >
> > Link to v2:https://lore.kernel.org/all/20260707144223.120417-1-challaud=
ay369@gmail.com/
> >
> > Changes since v1:
> > - Add interrupts and clocks to uart2 example to satisfy uart schema val=
idation
> > - Corect regex patterns to accept standard DT node naming conventions
> > - Add function property to top-level pin configuration nodes
> > - Remove restrictive enum from function property to support all mux fun=
ctions
> >
> > Link to v1:https://lore.kernel.org/all/20260705132521.159522-1-challaud=
ay369@gmail.com/
> > ---
> >  .../pinctrl/microchip,pic32-pinctrl.txt       |  60 ----------
> >  .../pinctrl/microchip,pic32mzda-pinctrl.yaml  | 109 ++++++++++++++++++
> >  2 files changed, 109 insertions(+), 60 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/microchip=
,pic32-pinctrl.txt
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip=
,pic32mzda-pinctrl.yaml
> >
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>

Thank you, Rob. This patch has 2 parts(dt-binding & dtsi changes).
Can you also please review dtsi changes?
https://lore.kernel.org/all/20260731174751.86819-1-challauday369@gmail.com/

Regards,
Udaya Kiran Challa
