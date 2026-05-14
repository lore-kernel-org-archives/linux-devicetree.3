Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D3F407599
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778770856; cv=pass; b=TXfHl1LIb1HSOt2ZY/74+xP2VWHJ9glclKVR+TosQ9fIf3un7s2EJ0csAJQu8F726zLoHlT7Tc2PvdCBC5eOVELkKM+GJmZeNpG7oQAb1XR6z7CJYDBcpuzAbCTUctLvakOJt0+5GmA5z41Kmf0fLrlIvIdsNGjeEZhqv27E7F8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778770856; c=relaxed/simple;
	bh=93DcpqUrrQy53jqzjaoGf20XgLdTeD3S0fyJqO+62YM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TDx5nByqPJbnjfWzavY5+/JI8GCa0mm1GfK2GAMvWp43FWN7NfLZcBTAeJqvLf31IiAci025c42VR8UBT3KvNoPX4VCfEPkMWjhBFbOvJ0ylJ0pPtt4wzxH3yelMsFI582fLF0g+mElr6DMdK6o+l59EYn2nZfRjRvQmdQNdaEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQ2oUUhU; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQ2oUUhU"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f7020a928eso11304290eec.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 08:00:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778770853; cv=none;
        d=google.com; s=arc-20240605;
        b=R+8Pj/cPOAA7BkkDoeYVcqCpcgqHFDhWp2JAMBbEy2QtAZf6cxC1sTr0a4ls4DXiMn
         Xk/Pcp1ryF3L1tZdzaTjkrw6qRBLM1yNpNO5UPxkUEZ6oLgqKZ1bnpbeW6nTe01J9n4E
         lSsrgUv5JDFBaqGuuRZsNctkHwIJVHDSTX8AIfhmleHd6I2tRY6N30I+biNLgeb0Upf4
         ACHWfixJpLOrVo6SDMEq72Ey/Uk8xsHqGCZtSyM/BQ6+e0/1vmb+h5Wq/5hJ1GI+CTe4
         51yIqrqe3mkxyPvPRTWRTTketsVnxooUMMYQq3JepleJaMANhFUWpzP50l/I8Ugce5W1
         fSQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gYE8+9FvfLSVbf4nQgrf6hhDRemavqQW+ej9r6AR/Hk=;
        fh=Jn9kkB02dh6c/Rh5iR2FxMWebC/NBEqL+HdVQqKekGI=;
        b=lDdx9lz83XPXf1Jyl12l4B0zruVPXpIEbQ8oR8naFzmuFcNOkPT+0fhqVrX4C67kjR
         UT8IfBCyhWQEBm9OCrM+XNrj0I8t5dpTqms+u5DA01gN92ZmsgCzMvZ56j6JcKPm5faI
         5rvFtWF7Wfh7a2S7RGLJB6QJ271T6HCTOrVF1tbg+KoAHE8wPtQFhrQIwYdn6uPxIJv0
         /85J4ch3zSOR5IBVPoo/cSK73z/vLKOr2GxCB6zb5xXD7v+07TSjGCUIbAnVITxxbxr0
         eSX0fiBztTEPLboGcH95int9lb/YV/tl3VrBSMEwFcbZsZpRc2TI4bwAPvJohdj96gPS
         SmTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778770853; x=1779375653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYE8+9FvfLSVbf4nQgrf6hhDRemavqQW+ej9r6AR/Hk=;
        b=VQ2oUUhUBTmgMzOS2UcnlF6x0o5Ihs3yZURI1TpWUybDGYjIgISZU5lVs45N5qiT9c
         Ka2BNB8vw1Bn5iySjsiNYoiGozmFpnKwyvz7Q00wxnEuWFSMwsVRfZlzeOMwWZaa64hp
         ciQof+sARZuwCNj1TqnDKCcaHXwwZdicDAqPyraLdHOt21+TH5OyTR199Oyc1aoSo/q2
         atDqpElbHz923dLXZsBzpbEeeH6Izatc01M/ObCYo4/sKRE9ZFwbrbdxDfZcali5d+wF
         ZYGigFAxITAcaUcJkZe3Oy+DIfhd/UBZ+p4KNgssbr406nkCMR/MQOWL5+tNbfNUiquD
         cQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778770853; x=1779375653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gYE8+9FvfLSVbf4nQgrf6hhDRemavqQW+ej9r6AR/Hk=;
        b=aheg4euw9r5XTfAFlpkP0/jfjKVQOH0m7uMwzqLi3jks5cySISQfNDhckXAvI1nByX
         JOJjZZTrxFV7c5ZfilPfYJKkBBrLavbamX6PjHtnKoPmK8ORVJIDM/dALHTttTZHPJ7V
         Tbpx+fASPN13ZYKTakjWl0mfaWNXilInEJjVKeiVPLDY7Qw5VVPzKjTTSNqFimSB3uaZ
         ETeu5z5p7nxTql6l6ZsWlg3bwcRXGs2I7Frav+w17r9fciVNWdoqk5WvFtvn7L1kpyLE
         9o4oDzWhwlCTDpOU2dNV+xUA5y1qUTmWEHO3g174ce4M3j6n3/b3sFw33PsRD/QGVtF0
         4Alg==
X-Forwarded-Encrypted: i=1; AFNElJ/vYLqePbF0qTfX3ybxsVymkY5y55HRG+UKT/67YkOdbvH8At7GPGstXxjniFV03nS5xvD7EXqKvmCJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzcSEXW/J68qw0a7MZpqp5j/Wk8N/wSSseFmYfYF1ahmAh8JjHi
	Dr74ylsUXpqLzdA5HhxcZUq/r1amNuT7xya++9enGEsjrx+HZhGG1TXGn3rmXRwwG8XYJVDg6RU
	eMXnK1IoEL1LenKD8/KMiXvrbLyDohXI=
X-Gm-Gg: Acq92OHQ0+TCEdaump1SOH4FYBQETOvrq6N+DPjMqKnVrw4RP2MWlX/7k1D4N3LtBS8
	eqKK26CkR/63yLbGF9N5/H4DI3+1oO2O7a3mugLD4rmapA7iIMpcSxKVwcCJEmEF/Pebolapdxa
	MIVX+uHnhnPdgM0lm1wRCB6yjc3qzetoJphEF5kGy/zgfbcCZRDgtdvkqaNz6cCbXd4uMpl81k3
	YdEuD+Ho3xrEs6ekT5niBLg460H1BKDxFlQ/3uWD6oL44ZBS1HfU4ox6Exm4x93wKriVtUAFOfe
	6PDVfTRe
X-Received: by 2002:a05:7300:6c28:b0:2b7:38cf:c2fd with SMTP id
 5a478bee46e88-30119f59550mr4891365eec.26.1778770852303; Thu, 14 May 2026
 08:00:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512102445.55372-1-clamor95@gmail.com> <20260512102445.55372-2-clamor95@gmail.com>
 <20260514145541.GB472306-robh@kernel.org>
In-Reply-To: <20260514145541.GB472306-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 14 May 2026 18:00:41 +0300
X-Gm-Features: AVHnY4Kxlgcuop2UxuHVvEYceHjbSEBsXZDcmFkiB8-pvvFXvr2T37E9jTAUG7c
Message-ID: <CAPVz0n2JVUh+5aLwDRNpuT4HMznz0XrDZ-aB6Xvm+1UibPjrBg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: input: Document Imagis ISA1200 haptic
 motor driver
To: Rob Herring <robh@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 14 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 17:5=
5 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, May 12, 2026 at 01:24:44PM +0300, Svyatoslav Ryhel wrote:
> > Document the Imagis ISA1200 haptic motor driver, used primarily in mobi=
le
> > handheld devices and capable of supporting up to two motors.
> >
> > The exact datasheet for the ISA1200 is not available; all data was mode=
led
> > based on available downstream kernel sources for various devices and
> > fragments of information scattered across the internet.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/input/imagis,isa1200.yaml        | 140 ++++++++++++++++++
> >  1 file changed, 140 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/imagis,isa1=
200.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/input/imagis,isa1200.yam=
l b/Documentation/devicetree/bindings/input/imagis,isa1200.yaml
> > new file mode 100644
> > index 000000000000..bbe6f99d39c1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/imagis,isa1200.yaml
> > @@ -0,0 +1,140 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/imagis,isa1200.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Imagis ISA1200 haptic motor driver
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +  - Linus Walleij <linusw@kernel.org>
> > +
> > +description:
> > +  The ISA1200 is a high-performance enhanced haptic motor driver desig=
ned
> > +  for mobile hand-held devices. It supports various voltages for both =
ERM
> > +  (Eccentric Rotating Mass) and LRA (Linear Resonant Actuator) type
> > +  actuators. Thanks to an embedded LDO, battery power can be used dire=
ctly
> > +  in handheld applications.
> > +
> > +properties:
> > +  compatible:
> > +    const: imagis,isa1200
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  control-gpios:
> > +    description:
> > +      One or two GPIOs flagged as active high linked to HEN and LEN pi=
ns
>
>        minItems: 1
>

In theory there may be no GPIOs and both pins can be hooked to power.
This is unlikely scenario but since it is possible I did not set
minItems and did not make control-gpios a required property.

> With that,
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>
> > +    maxItems: 2
