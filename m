Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792565202;
	b=P5+9v3lS9bX426zj1ddhOUZeyl60RyhQXRKE2LusVsAFQmhPZppltQUfUEqJba/gKl3k
	 gnfE4urBn/uU/3NiSqj/3FHNt6AzeRQFT4/OGzgto+PFSbQly8Qb73rFRMynoEW09c1nX
	 XgzZNb1KUgCeEnteWmGo13xhuraWcSVT97gKD5scxcKbNy+Dcv9a5bfn6GHLa/1XqxcNt
	 g5edMUP3jqAlFN0L8nYE4h4fV4UWKmD7hCjKD6vmfGMMmtlqdSP4EyGPcL41PR5SwDhq0
	 gOTH/YFlNz03P+Z/oUqscVEuDOh7g90+fIR5Eb8Ok2BYOxQGnKeZ02M3Y54R4SyX4SA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MFx6RfKZoDg30I8aWbaaH8/QBhrTkiLCB5URy2j6R9Y=;
	b=ZXL3i1Q3rkumxRzpyX2iLuYXGhW7ZaEUqRtqo7IpqUz3cRF7s1DSEoa7pOPP4W3I/x9X
	 VD2dw/YquLK81B/jpIFyARCDOJmroQkxYhb+2ckO5FKaIxOOgr2BH8W8gXX7AEAnLjnmJ
	 zvHs2j50hCho4QKe+9BoeaiPGU5yhVWJJHc6Ct5xUE3XZi86RQ0EzIjqL7kJzpqB2q59I
	 J1E1XafiHmFw5zD/y9B1D9WFhC9Q/0XJnepr5qwWzZtUPHLfFxWpgdQ1yzZkeoPC2jhhv
	 lO5QjebYAVx67mL7T+hrMbcIXlUID88EBbryxQM5tS0j+NER2/CVTnWJMDmQxd/iFfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qhmxhi0T;
	arc=fail smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE198606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE198606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qhmxhi0T
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36661f953e4so777335eec.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 23:46:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792565201; cv=none;
        d=google.com; s=arc-20260327;
        b=X0taIieBs9er1ouuGSpYrpsXn31I1zAT+ngnb0uHAF+kH5AQeQln7iF9UJu87CGa5a
         s+WUCVgm+oLYD7Z7+hJ9ytiyzO5JAz8l0zy3ofBSYGA3Vxgy3W5DS0U797CIs+SGYOAK
         RLj3y0NdfA1ahRXtSBzkUjS3gzVtffCdLwOYQ1nRWv3GgtZlP0rNI+GKZ6hSwwu0p4Bm
         IYeJx1UiGvMOUclUqB43SAPzvx9HTe1qZRElxTxy4EFMfIMw25FwTrjym+4o1HttAoZa
         Z8JUt+UKV3pjXPzIEzKZYnnMQBpwBLzlNYfR9rnbH1N8rJhKilXTFLY2/EQoy6pv7p/Z
         j0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MFx6RfKZoDg30I8aWbaaH8/QBhrTkiLCB5URy2j6R9Y=;
        fh=HiAPisdRCe3kBGOh0JO2mZSSjXHfsnpeG3bcfZ7Yjfo=;
        b=KqNzAsfj5LD7EGYZ4M+07cIXh8IxLyCJiVMoR2spg/yJT5ocgO3mhmFM/4SrSsrKpP
         IU7bIhpMJDM9SVyQ0hD9p+1ki5NQFhETYaaPLmFRN5lTRcW8GAqlNK8iv+QLRQIk/3nj
         OEgaIdXe9s2tJgONF0uq/Snmyehp5YvSytm8OjrqsgYq1X0vzpL8VIYc0e7LraCVJmrP
         CcltseHf8g9lFDDX86LxTzBPlq/4c2wXeWtPPo+gmVpWeSeCLLxNRd1KTREK9GlFnp4u
         HF+YYTrsTYfGQuPjbAq7lSucC3Le+w0XWcI66UWjCwNmBjO7+mjGimtiSFkhse0vrZEj
         eeAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565201; x=1793170001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MFx6RfKZoDg30I8aWbaaH8/QBhrTkiLCB5URy2j6R9Y=;
        b=qhmxhi0TbMwtXBvTVlFY4f2LPpHPl8poznD9dAUHw8+/Z9wZhQBqqYwfND7kTtB/dj
         BDT7fy1OHPOT3SsXcIJoCO2P5QWvHhSGsWpWrDlHwCxU3wdGdBZJo+CJDKK8hjNN6KtJ
         ZTBEpRPZ/CzppBKznbLND/WVtTUpHxpIjv8l4Dszl6GShVbqspGQMSfdEn1YLZCusCt9
         8XZUeUrLgiEXnrc9s2V2o2rhr6TPF2UsE6frYfs2vuDhFHmb1RIg6wUfaQGU2siObxeN
         QZxhnIASpBqZUpMRUn6UfJAhdRPi9Cf8ml1LkjDPLUFZ1OJH0H7A3t4eraOGGpReFZps
         J94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565201; x=1793170001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFx6RfKZoDg30I8aWbaaH8/QBhrTkiLCB5URy2j6R9Y=;
        b=k9FepLDHmdPZi/S5cKGxSgudI96eTP6enipjwtVrHLM7k3a/4jrvtQWLbdYRBBve29
         pV4Do5P7xhUJBA/cyKmVSmPShnpPjSY6nkRIJNf7Z02tdQHz3UuGaG/7Uln1mpqkZJBh
         dl3INwG6isoIuqEsNJN/vLG/hMmm+HX1u1I887zji8pCVo4sFTxK6v7X2MEG6P2pEFUv
         dhlTo2kvE1s0/Qy8omaAnE7PsbwKDjtGKknnFDWqHP5JDNmcKlHdkXw6TSPLDfiSpPEX
         XWywr15Nt8A9vBKka49wIkhurkOUMG6Njxrwz1QZGW7/VUoNbLct3uisXYzZHyXgNb87
         Ll1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxt3tCO7qqGn/XolsKEjnL/tkvExkU0iyoDTFgStqNQh44TibZJ7nIahfFPsQGI2PBZO7meJZXBKr9H@vger.kernel.org
X-Gm-Message-State: AFq9FYJtnBX0brIlnME7hLKdlewYac6B8ayoz6BxLHA40zEGZiypEjNF
	sJRsY5lAmGei26eELkni3zfwaKQ0feoACP816vJEwUMwI+aOhEkzCEQWWwXfgF3NCcmrRlK59t5
	UI7upJhaD7TeMMuGbk1P3Mq9Y5Hq/9Fc=
X-Gm-Gg: AYBFou3JnfNIqT0a2Ih+PnZ0vkoqDwiSlaAMkKBxfZmi484aMGauRMSCcQSXt5ny2y8
	96FhMyeqLsVte4MI+aGAjyQSIavtY7OEQBSPRSEuodKaCjwabFCrzSPk9hMNTLP5R6lL3F8MYxI
	xR3mH/hP/z185t121KDmThQpuI90ewc3RVdiyuLDkhmnX6fA6KWNPoh+Qh5RA3Asn5NLh64+ktD
	xhIWZgNFg3704gSTM0URCVxkSEZWcPiLf4A3wW9Vwnsm+ouE5YcubHPZrdzj/gqaWGEh8GvOpez
	O4+IKAbPWPJ9i19ashnhjBVG/lCr7CoBzNJWBBOYAVS4XbfFaQT723Uy/95hpDuoe3NADY+YLA+
	BzPuWKO/b7E5L0d10+r5AThLV2dXWcuJDyOaPqQ2Oc9JjNvSE9bOYuIXJXlGa/4IrfaE0vA==
X-Received: by 2002:a05:693c:88c7:20b0:366:703c:5f0e with SMTP id
 5a478bee46e88-3674ef1f33cmr2092100eec.35.1792565200654; Tue, 20 Oct 2026
 23:46:40 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com> <20261019100406.103687-4-clamor95@gmail.com>
 <ate5K6ZdrSoBUI08@google.com>
In-Reply-To: <ate5K6ZdrSoBUI08@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 21 Oct 2026 09:46:29 +0300
X-Gm-Features: AclHuK9vSBGobmYgXVnmsJbAb2zJc_kKp_DYHLaIwx6A0bp9NGDYceSKiyk9FqE
Message-ID: <CAPVz0n13NFbY1ChZRkc8_2CQd8HfjahA-gcRWzxsv7KbAxf5Ag@mail.gmail.com>
Subject: Re: [PATCH v12 3/7] input: serio: Add driver for ASUS Transformer
 dock keyboard and touchpad
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 20 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:0=
4 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Oct 19, 2026 at 01:04:02PM +0300, Svyatoslav Ryhel wrote:
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Add input driver for ASUS Transformer dock keyboard and touchpad.
> >
> > Some keys in ASUS Dock report keycodes that don't make sense according =
to
> > their position, this patch modifies the incoming data that is sent to
> > serio to send proper scancodes.
> >
> > Co-developed-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> > +static int asus_ec_kbc_probe(struct platform_device *pdev)
> > +{
> > +     struct asusec_core *ec =3D dev_get_drvdata(pdev->dev.parent);
> > +     struct asus_ec_kbc_data *priv;
> > +     int error;
> > +
> > +     priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     platform_set_drvdata(pdev, priv);
> > +
> > +     priv->ec =3D ec;
> > +     priv->parent =3D to_i2c_client(pdev->dev.parent);
> > +
> > +     error =3D asus_ec_register_serio(pdev, 0, "Keyboard", 0);
> > +     if (error)
> > +             return error;
> > +
> > +     error =3D asus_ec_register_serio(pdev, 1, "Touchpad", I8042_CMD_A=
UX_SEND);
> > +     if (error)
> > +             return error;
> > +
> > +     priv->nb.notifier_call =3D asus_ec_kbc_notify;
> > +
> > +     error =3D blocking_notifier_chain_register(&ec->notify_list, &pri=
v->nb);
> > +     if (error)
> > +             return dev_err_probe(&pdev->dev, error,
> > +                                  "failed to register blocking notifie=
r chain");
>
> I think sashiko is right that we need to register the notifier first,
> and in it check if serio ports are ready/registered or not. For that we
> probably need a lock and set pointers or flags in serio's start()/stop()
> or open()/close() methods.
>
> This can be done as a followup I think.
>

FYI, Sashiko likes to hallucinate. Initially notifier was registered
after ports, then sashiko suggested to move it before. Then in v10 it
fussed again and suggested to move after. Then v11 passed without
regressions and now in v12 it fusses again that notifier should be
before.

> Thanks.
>
> --
> Dmitry
