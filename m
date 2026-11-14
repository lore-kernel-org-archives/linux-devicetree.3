Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794662234;
	b=t2HyVspFC6EFAU44hr1VbAsWs9PlLIkYYE5Xc/wDgD1f3WcF0vvnlrNuIe2boNY+WjKw
	 peijntyU0iI2ZPBk3jSoNoNVgSv2JMnQjdMMkUPJG50nMr7DR4xggxDPH6SS9SfRiOgRp
	 URF76Mp2IKonWxso4yQ+gfCLTdPYG10EXkouczIwGO5Gn/mCOb3dVEBlrQBi725xaB14k
	 Udi7RuYcdvutqPIW4D3rwc+qsEdPKEgfv/8h814VHx/BV/Fzz6TbPJSg0tQ80i9qnKHx+
	 g0qq1ISB+B8HkpcFUZCvgE2wMtXhzaSdGpQXM4QE7K2gF37yr4O5Rc9DqkCso2gU43Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ITM4+BMzeI3EvIOixDqTXlM4tReFquWP1v2DgL7ZSL4=;
	b=Yi3NnNWZd15OhUPsiQyNxVR5gZ1SFpHezPk5VRTHWxL/TAlRRjTCS5ORdCWTPTUj+phH
	 tFLuSBjmGzzgSH0yfrmSkvhXtdR3ZZ9LuG2bGM78UK+t4TJTzTZ3i8RUdVwZ5Dbq/WCbl
	 imcXW4NxuMmMYRITc2hnTpjLNahBEfjuYZb7ZXuhu7oGdPXRzWS0OcR0Sg4yu4K3z3urH
	 yXess29jV14vYVRwN7fZzk3q3d/D0ho0wPPN5VP7WDUS4+/zVdnnu5Nfa9VsoLIYXz4Gn
	 liGxZndYJf9/AN09cUAlpukxorkc+bI54U0QPUmh/3uL9BfFymPeoBpurFtX5Dgd9sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bkBiYsFf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3B5606A8AC
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D3B5606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bkBiYsFf
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so325077866b.2
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 05:17:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794662233; cv=none;
        d=google.com; s=arc-20260327;
        b=ClmGXzx9z+N1TNV5XzcUfhwKD7JF9PB1MwpRWkU8HIPvb+Zd1rO9JCd9Yu7dK6DwNg
         +VIjx0U8H4a1i9kBTKWmmLwVLuydwkZrtgXLCjS49P/MZhQxQGRQdnFP9FBTt1w3+lEv
         IncWl4qXhHL673Mv0wRHLsIfDKeiiNNtJJDLwlynvYKipIfCncIbGzueuyFidoUHQ98P
         PJQQIYg+kkjtd5BmvjXGwgHRezs6tPP/bvcibemOtSk2qhWLtg6n+PHGY8dcwTQsfTfg
         +NocCdwfnoQ6ny6Ide8nf1BkJit9fxzmi1xboNPLBoYd8phBYlJK/x+68zfGYzhvU/uK
         98vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ITM4+BMzeI3EvIOixDqTXlM4tReFquWP1v2DgL7ZSL4=;
        fh=6LXHFQY7EkZw2Q/PjZvouWZZZxw3IqRxf7i64CwaxwE=;
        b=ClYzTBNHlmEtrZMi/KHXLya4V14N1UzGWSdEa1hI+eBjbTcS9rlHAEOvA//2u6YXVo
         3vsplPdvGlsTx6e/J2p7RKWMEi6Du5dD/2O90Ch8Od6hdr18QHsSnpT3mn85wA06US61
         q4gp6axfnI1/SAV1zl+8qOcf6+ODX+qalUciWN+mtFaLzhLlt/DGyobAH5RgpKQon3aw
         qzwjCzUGFOxH3QTYGmbyO4ckHNQJJxAsli+JKdRrzec62pxdKGZjnvpYa1b5fhx24t9Q
         gbPBXs1KOTYD2+pk+DtbewMUlIyvXet2nwpfPbpqcbEAInr2DRgRnfvvFmeegx8MrwbQ
         84EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794662233; x=1795267033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ITM4+BMzeI3EvIOixDqTXlM4tReFquWP1v2DgL7ZSL4=;
        b=bkBiYsFfmEtp7IJKvH7hEn7KTFWusZlaAuAdlpmYXF803sUqFCC1KYxa9tyrf34zN1
         XEF5zkbgkyIS48qvP5a5GB3ex7t7UtUZYJboxL0XL4tLGHUYaONVZb6rUO8eATYZ1QXL
         8+UQQA+DM8uDBp6Hk2hDrEFaQbRoNXoI4sdU/oLAIoBHSwdiO0Ay272h0WfUXQYhiEyJ
         e2QaMbc1FuXjzS/yNEbZqG1YlIpj/OsymtVLBErLFBFscJ/L9ut44gQSUhbnqudxfjKt
         sK7WJvoJ/AvY0cJmbn/C2ArMEwRPABus1HpWmclIlurEsjmpX9yiYldYqDoxhrn8mpyz
         4Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662233; x=1795267033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITM4+BMzeI3EvIOixDqTXlM4tReFquWP1v2DgL7ZSL4=;
        b=vPlJufJytoQrdVdloj97Qu0w9fHTQaMcr9+oo1ikhRFXTPZkAcX01YiEnF1MUPU/3X
         qHDROINsxN9WuBRM/erycdRkWwZuX6vVqJ9EUBPnbcXbpLUzeEF5X8TmglVfl7lquNcF
         10yu4bcHK/PlqIT7SN8TTL4gfu8bGljvaG6fXXiQs18BPg6grRS4oKjgA2Hz925SXTbs
         RSUMIULFsjvq5hyqUEatNKy8M3+vbXGsrfVbFJtyuSHfSB2QpvnM4UsFiGrgqNcNk/7E
         nDbGstSvSLWSVf5vKMQ3t/6RUFu3MXqktX0BerNeNusIPx+846naBtkIwY6deyO2RPZz
         Jv9w==
X-Forwarded-Encrypted: i=1; AL+hErHdDYDAL9j90qTV110FI/8L7Z0gq+R3e1jVwkrJdpNj7n5SpLzA8PnydIcGpzs0Iiulb7W2bTDVlxdd@vger.kernel.org
X-Gm-Message-State: APuU4Z+n8QXW67qt+wkv2Anm0BPrGasIXWLAL/CwcKPSI5CGrlFGYKe5
	VQJfyiCOwOWMLmsXCWFTNa8vAcTopdkB4veIK2+syJR0m/3TIJ0cSQvX+2bSb6Si4NSzTxwEmat
	Jo8mmXogmP7982BKc5kVljaQQEgjlclU=
X-Gm-Gg: AYBFou3R7PKTyP5wf4l/AGG8Ly8fJHdR2s7Y01FJ/0PlShHG3jRsIx2pjL4e/zJD2tn
	Hi4U/2SeeUl+K05uvYNEjkE9Uv4SWQ9+4B3RUlY8cF/jINYHz+GaO0E1T4P78imJ/ts8XJQySTd
	1mB3wwe7Kh9MeeWnQ/Ga6niXH+5/Sp/ogR2z0rnN7d6l9p+L97KAceSV5dqfopCTql4UgbcRI9N
	jXSQC1Y5GtLKj+bwm5CXal0lteReKuHu3XDJ4ufsyZUfH5gIxcwkMUcory7V28hBf7uTCOo7s9L
	zYgNq+U2N5ItPdGBe0XUj6N2oK+C2I4cjyofDv7Yfmbu0+S7e4dadMEe73cyHbLl3lKgt2drGzz
	vk0w1WxvDKYMMjLGb8WJ9aYQhpJLMfO7v98Oovw==
X-Received: by 2002:a17:906:dc91:b0:c50:5a93:3bd7 with SMTP id
 a640c23a62f3a-c509614d52cmr448037466b.3.1794662232406; Sat, 14 Nov 2026
 05:17:12 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-2-a.shimko.dev@gmail.com> <20261113-good-renovator-99924ca0d55b@spud>
In-Reply-To: <20261113-good-renovator-99924ca0d55b@spud>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 16:17:01 +0300
X-Gm-Features: AclHuK8rhFfFvkBwbKflVQt0QnoMak0rCeWcBpwf3o6KE4ySn9wUi4t5_Sc9CCY
Message-ID: <CAOPX74613tpMONAYkvY+6=UqDtJ7h8r8FmHmnodmNZ3Zi3RBbw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: dptel,dap8211r: add led nodes
To: Conor Dooley <conor@kernel.org>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	maxime.chevallier@bootlin.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Fri, Nov 13, 2026 at 8:17=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> > +  leds:
> > +    type: object
> > +    description:
> > +      Optional node describing the three configurable LEDs of the PHY.
> > +      Each LED can be assigned a color, function and default trigger
> > +      (e.g. "netdev" for link/activity indication).
>
> Please add some blank lines here,
>
> > +    patternProperties:
> > +      '^led@[0-2]$':
> > +        type: object
>
> here,
>
> > +        properties:
> > +          reg:
> > +            maxItems: 1
>
> here,
>
> > +        required:
> > +          - reg
>
> and here.
>
> > +        additionalProperties: true
>
> This whole leds node needs to go down below tx-internal-delay-ps, child
> nodes are typically sorted after regular properties.
>
> pw-bot: changes-requested

Thank you for your review, i'll all of the above.

Best regards,
artem
