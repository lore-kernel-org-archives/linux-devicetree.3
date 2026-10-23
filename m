Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751471;
	b=JOC379q87Xz6PapZcdVQOhEQTcExbB+T2ZtYiNB/7c0vr4vcl9OUTekOiv5hI9YKh2W/
	 H5jRYCdNkgABHX/K3AcMBhJM1jNVx6IZuF2ZSNkycSmojObRqZ5t+Pjlx6QZa30kbW/Tc
	 7JcbQoCYlF4FwvyCth2FOjwK01H7rWF+ArdiHCV4OAAhHjXFLJmaDD5XYT/83E7jv+IOp
	 lxe58/snQPTwKST7RBN7/dmLxwzAU2oJykXqijBN/sOjDm8tMBmTzaaHrrp5nehT4UcOV
	 Fgnub7Ukxdg36vFbLYxzUwFwmWfy+wsfjOIszghN2D2hTZwcTTU5G6HUtfccEejqLUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751471;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=FFNqFEwFgmTg1p4Fk7JuIP0CoJmYr6GfqhYnioUfpek=;
	b=ubVaR6dC46RFaCyHHv3I5F3SJV9ue9LYjjtgNFFyZ8JKM6L2OqCBgKhND7A4v9CnNUEr
	 b/2Vb4RH0cmpCaYllGVlhonADDVVLC8scRKkzhKKYjZeVyw+EZVSJ8PE1KlPe95rouWtR
	 U+bczRoR8+kPF3CUEqhNK5wQHNjEuKNH6Loi7fwaqgl652zyM0VtdbGQteWKe2AgvLVWm
	 9M2oVpP8XR7KAAsP5GNq3xigLMsNIJTxHjIH6pY6xy5vkGN5TMpMvPWayJVr2G7pAH/Ej
	 62LlK2mflEOx3F61nuRhgvtrSOu4176S5r1Nl2rVaGdEqV2Mf5477TjducLh4QMEchQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nemdAz46;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E85606A31A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E85606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nemdAz46
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C51D51A12F4;
	Fri, 23 Oct 2026 10:31:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 75F1060398;
	Fri, 23 Oct 2026 10:31:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5022610328E3F;
	Fri, 23 Oct 2026 12:31:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792751466; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FFNqFEwFgmTg1p4Fk7JuIP0CoJmYr6GfqhYnioUfpek=;
	b=nemdAz46S0wvbIsJF5IHrk7GnmqiwlkKubA/vyN4/7WPoWSRDeyLwqlXlST+DKI3P62vIm
	rqbMsVxmGXFrb5SVdTZkPsvLOAj66gZ/bzv8ucDjIaJld64vBWn6w8sHYMLH9UwfwoPyBT
	TjjfZh/aAtrHJoteNmJntWlyPmp5WS9BaJf7ZvBd7zDxG+hEd3nggBJ6Kni4DS63hz4Pw8
	K/FPcNCvzd7FXg7qREUELBX18UqmXouGnLJm+mEG46yiXu3tF5nU+uaPAmYYxvuXiNecIT
	/rNCGYCGJ9eXVarbyLc/EScAkmFF0U1o49b7bXQ5EqZKm3IzuV3/IfBLoArQ5A==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Oct 2026 12:31:03 +0200
Message-Id: <DMC5CSRL5BQD.19J2TWQM88FX6@bootlin.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 0/5] Add TI LM51772 buck-boost voltage regulator
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Mark Brown" <broonie@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <atoS4Rrxw_UIH_np@sirena.org.uk>
In-Reply-To: <atoS4Rrxw_UIH_np@sirena.org.uk>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Oct 22, 2026 at 3:42 PM CEST, Mark Brown wrote:
> On Wed, Oct 21, 2026 at 12:27:41PM +0200, Paul Louvel wrote:
>
>> static int ptn5110_tcpc_set_vbus(struct tcpci *tcpci, struct tcpci_data =
*data, bool source,
>> 				 bool sink)
>> {
>> 	struct ptn5110_priv *priv =3D container_of(data, struct ptn5110_priv, d=
ata);
>> 	int ret;
>>=20
>> 	ret =3D regulator_is_enabled(priv->vbus_high);
>> 	if (ret < 0)
>> 		return ret;
>>=20
>> 	if (ret && !source)
>> 		return regulator_disable(priv->vbus_high);
>
> This is buggy, if the driver is not using regulator_get_exclusive() it
> has no idea why the underlying physical regulator is enabled or if it
> has the ability to affect that state.  Even if the regulator is held
> exclusively we still do reference counting for the driver so it needs to
> be certain that it never enables twice.  Outside of bootstrapping your
> driver's internal state you should neve use regulator_is_enabled().

Ok. The PTN5110 should take ownership of the regulator with
devm_regulator_get_exclusive() then, because there is no reason the regulat=
or
for power delivery should be shared with any other consumer.
Then making sure the regulator is disabled at probe should not lead to
unbalanced disabled because the core would have incremented the enable coun=
t to
1 [1].
regulator_is_enabled() can then be removed because we own the regulator and=
 its
state should not change.

The pattern shown above is used in the MT6370 TCPCI driver [2].

[1]: https://elixir.bootlin.com/linux/v7.3/source/drivers/regulator/core.c#=
L2521
[2]: https://elixir.bootlin.com/linux/v7.3/source/drivers/usb/typec/tcpm/tc=
pci_mt6370.c#L77

Thanks.
Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

