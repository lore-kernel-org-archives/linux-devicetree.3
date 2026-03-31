Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A5237AA9E
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954754; cv=pass; b=dQWxFnzTsDfWywTW/e/UihJBtgnox2twD5HuBFKjPuLWKBZgLiLqgjEjoBIPkZtOwnmSNNQDmpuMdWd+Ma3g6prEtLTgMRS+4qaABJLonzVAE+/nFk6R55c3uRDMPLVQPmZt3KYVjXvnD+i6/BB7zUJfgTjV+ZPLbyYPwGkzaZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954754; c=relaxed/simple;
	bh=2VUtW0YpXM+NjDn8hDo/IqLapZK8BOphv1C4iFqDS7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EEweDW81/V0KBzkzAA2LRYxbH6qh/6gUU/zTmQoTbNJcZy2ejLI56QeHdTRckS/VqsS44nhd++m+kODJ+bllVFyEyWq042YPQTYCoBZGmkzc9i/c9Rz19HixYaPl8q+k+bKwJSis3EM1EkDozE/V8XpPVmYAmacckhKVeOqz3WE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mh1kEMZg; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mh1kEMZg"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a283c44478so5966613e87.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 03:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774954751; cv=none;
        d=google.com; s=arc-20240605;
        b=OrOpAbhEJGfeXHT1HLJPrJplb9KyuWCHK+h2Z4MZQiDE+kvydKYXOmjLZld5IqoZRi
         TLCHOpgnQuxl+9TaOEhJRFUW6KNFEW3Qmp99DgIDjcTDbFBOfZh7alN2xOCQorUXeKoR
         P+BdxJ55/1Kd06DjKJY95aZV0Fz+rp/5yawviTaUDaFCLkVtTRPmSkhv4xGeqpZ/3Brl
         sshDxgdhlqQQelgtrrDeoLJYtHb/0bX3uS/4rnAiJMCdH4TE0OC53F04DFTvgJKn38tr
         dLwjbKqC4vJpdypM4xfW0yR2AValPYk1lsgHKD/C1rcqPuZpgJ4GvqntU5ELIycaDxFA
         VtUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fL8mGMhRS7HqUOu1W0Z30JuQwLChCz1UuGa8bh9Su6c=;
        fh=0EFOr4A0k+jRMqK8EHxTnqo5I1F2C/HnoWqDpk31VdQ=;
        b=Wm6r+e8i4w7O4MbwEX8QGwJKG1k83uS4VC+zqLLkzqTYpWHcqqjsNpHq9ibzLlCRMv
         73AsBGPMr8QtnC6vGASSNMuZp1Yw1zlG3ITWj83Vv9IpDYOY2kaa6RBd4eXWUmghuKnD
         NCKegxiGXMf2RsmiQAccTTbPc+S7EF6Vz6IlU8+VxEbblOhvDbNIg07OqqdS1kDSWueS
         CsXWFVXKAhgTTMV4PaZdQ9Xa7cfd8UVCLsBCdwjAfje6NPo2F0K3W2wRvxggMJvtae/0
         5GZGdJKeEqs4lkASgTbgB77GxpH9Tfh4hYc5AP2edgHW1IZlrkILBP/gs8xldV9Vfh9k
         Q22Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774954751; x=1775559551; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fL8mGMhRS7HqUOu1W0Z30JuQwLChCz1UuGa8bh9Su6c=;
        b=Mh1kEMZgKEF4pk+ujME5vMjdsXwCDFmo7Me2lq2lUiRxMd641FPSg40y18Xi3nGAva
         zS6jlPu8Ke24OjKGnE7mumdMLw0xttB7GikIkW3dGFSg7/qY+Z22baHUUxTA2W6qwYUj
         jandTH4NL1u6PIzf0GjOUHu1/Oct/Q4yBv3l92C7TcmjFjvYMF6RgoFq5i5v8OkXz+dc
         VqbAwkNQG22P76CVL2jssoCDM/uPc4uRX3Cce/CCa1xBhY6IaqAWggE6yp2Mpx6kajSg
         sDP8CPa+1Xbuiw+7nupHYIEMYkxsC7gHefv2u1Fg7fCz6V7GILodECrQXlRpNzVWkBUn
         PsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774954751; x=1775559551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fL8mGMhRS7HqUOu1W0Z30JuQwLChCz1UuGa8bh9Su6c=;
        b=OOyY3th+vNmKxGHTgExvsEh5Sa3zf+BDvQKYBsz3up8a8M7s8923uAkyB07Pwi/zyJ
         WXZ67g+bNCg5a0iBEsJzouuMrtRWFVANRaDPM9Tc+whi6QfCdEmtyT9Jwu1vtELyKkwj
         KT7kWGPKuekXOjS4bDsZhrbVJn7No2jSfc/w7AleXAhWoMaST6RILomxA5SJRh7ourU2
         UPgIX75FX09n6AMeW+L7U2vfAEL9uEnzrWnOq1mqlOxBTRPe/STAb2J/IsWUfn/TxjWB
         BMsHP4S0bl1mTtm5B9LdQu5RuoM14/Jrjd+Jm4Tqf47PTbT/1Xx5WUOfmZ8h5qR7aKBH
         +evg==
X-Forwarded-Encrypted: i=1; AJvYcCXi4b39PewyWp0FTUXB3QGPhRkXDgsJ9C7IRaW9Nm4ggMOJhyUuf3xo9FJXMkwizdR/FW9TBXxC02pb@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ0nVv50Q5d6HFPY6OHEwgO+Z6fBv3bjTFdrTCF1bqLrO5ZZYJ
	aqPeXrRyVPrsixXnJAwX5U+zo+Skoi8vFX1DkanLQYSApveFoCdT0MuBYPfqEJ52jq0CiW9ocEt
	NrLMXtbVM/OAjdsEKfF4CFNOk+/+G79tRvVmjTUfL9A==
X-Gm-Gg: ATEYQzwHjfmY3tkiJKOZERZ/w4ed8fR/dHS6GL2Je6keNf4iKwJg0Ycw5Ejyjt3Umag
	USpJJRwS70NelLSs2+ULYitVg7VVBWF1uzMTCWz4IREuxUEpMqIBLsooKQ8+lkvSx1f2PBA0heQ
	ZvRJMfB/5tYk4EqAfGJJkw6LUTRbCyKOPktFxF+EypDXDfpZq0qoKUyrELouxk6czYFKM3eYdu+
	dYGuMRHa4OIeb6MeW91hRtXljyA32su526gUSp0K+UzSojwr6Ndd5ifKSKwHr8mRORQixXjtSEC
	XlGeQLkp
X-Received: by 2002:a05:6512:3482:b0:5a2:b01e:5b5a with SMTP id
 2adb3069b0e04-5a2b01e5c9amr2976958e87.33.1774954750886; Tue, 31 Mar 2026
 03:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
 <20260330-orangepi-sd-card-uhs-v5-1-bd853604322d@gmail.com> <20260331-eager-kind-civet-62f60a@quoll>
In-Reply-To: <20260331-eager-kind-civet-62f60a@quoll>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 31 Mar 2026 12:58:33 +0200
X-Gm-Features: AQROBzB11zXXvkr31NXEyNIIlW6o7ZaxcYR8a2pmCHpw6-PFnrMqVgTaVeOSgY4
Message-ID: <CAPDyKFrafqhNbetL5kOzAFO526yUrJWa6mS_FPX-cw9bj2Mg4Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Mar 2026 at 08:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Mar 30, 2026 at 10:38:02AM +0200, Iker Pedrosa wrote:
> > Document pinctrl properties to support voltage-dependent pin
> > configuration switching for UHS-I SD card modes.
> >
> > Add optional pinctrl-names property with two states:
> > - "default": For 3.3V operation with standard drive strength
> > - "state_uhs": For 1.8V operation with optimized drive strength
> >
> > These pinctrl states allow the SDHCI driver to coordinate voltage
> > switching with pin configuration changes, ensuring proper signal
> > integrity during UHS-I mode transitions.
> >
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> >  .../devicetree/bindings/mmc/spacemit,sdhci.yaml         | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > index 9a055d963a7f0cdba4741c1e3e7269688dcd5f45..201ab97f0e88376a4680dcca7917e8b3172bd84a 100644
> > --- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > @@ -44,6 +44,20 @@ properties:
> >        - const: axi
> >        - const: sdh
> >
> > +  pinctrl-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      enum:
>
> No, that's not enum but list. Look here:
>
> > +        - default
> > +        - state_uhs
>
> Instead: uhs

While I agree that "uhs" would be better, we have tried to stick with
"state_uhs" for legacy and consistency reasons with other mmc
controllers.

No strong opinion though, what do you think?

[...]

Kind regards
Uffe
