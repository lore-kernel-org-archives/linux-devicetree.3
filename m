Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602719;
	b=zLg+w2WDeR231aWgFyAhPmzDf6XMeQcD7lvUIVhf7deQbBK4QPQM0HkYHzAng20TNShe
	 YFUrGpBv+Xdq0YGohA9I5uDlfQEPP5ywgv0ok76pbF44y8aoTVB/KK6WN7bXiU3rY875A
	 Ey6FMOp76VmlMmqLxeZwqpJTlrLmO1a5mFd60x1X1Wqp/po/D2bgnCKo8d90IYm+dJ4Kd
	 KC+7Ir8U/ouQUQCvfVNwExnxwq/Z2xMUqP6j7q64k86yVSz3R+4kmXx4KmpEryaPORt5J
	 W0ebNU5WXIxVBoApl5q6vU+2beq4iKeOwXVVB35PzZn+hG7vPjUcl+ROUdcStao6L1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602719;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=1tnzbTVQ51uWZal+Jth6879qYR8Xa8UKPaBRBV/R8Yw=;
	b=MUzIFIUavjmYVr09iPVA8ZgHunkvvfbyb6comVMYKKUge+8El10P7tXrpXdtHtv0/q32
	 cQ1cKwFHZeKxOalqnSuRDIu6hnO6ImxeGNBkgM7V0Vz0HsW0hYtmB1ieBJahSx8CdkP9V
	 d7K8WVStjlovLSkx1GEfblbx9wMORiUUOK9vR3D7OVHlj5m8oxdfSpUE+tWGft3J6fdt0
	 bDfRZvXL4GBMVmnAKlity+bYVrNSixm9JEeLkaZiu+yGwshcxBT0jHsCEbMuaXRAvDekK
	 prGmjfeAXLranR1YDslFvtIiEm1tB8TjGBynw59NRYIm1pT2WbM8KPxLwoZyD59naMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FFPDORY8;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8749606A33A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 17:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8749606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FFPDORY8
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BC30CC5CD72;
	Wed, 21 Oct 2026 17:12:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F01D606E3;
	Wed, 21 Oct 2026 17:11:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2218C103289F5;
	Wed, 21 Oct 2026 19:11:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792602715; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1tnzbTVQ51uWZal+Jth6879qYR8Xa8UKPaBRBV/R8Yw=;
	b=FFPDORY8amXem0dXx+KM4QkcYhR4YxwcmnlvfN5R02wk3st8BP2sBZ8EytAUMvqU7W1+VF
	cLEsbeHGkcZnXyr9i5aftrn3eLTe4nokqn5sT6sWlx+PBFv3prmA/GaOOoCJ2OrZYkUU/g
	gTGgq0sbFmKONpet23SsyVRCYY9Jt2omxtxGpe22TVUdGD8KctUAojpZYvtgJzhd/I7f5R
	rQqiUUtlDK1cnFX2u7InHqX7oPqL1L/Dk5nEE3LEHghx7jzVdzR07p2ZR3k6vC9q2+UnW0
	B+f6ABGnRsNBOXq5pl9O6h4bxvF+6klq5m5HFm982uisSC/PlHhwZEYJqSAZUw==
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
Date: Wed, 21 Oct 2026 19:11:51 +0200
Message-Id: <DMAOMKRB8DT6.2DUZQCDZW47X2@bootlin.com>
Subject: Re: [PATCH 1/5] regulator: dt-bindings: Add
 regulator-boot-force-off property
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Conor Dooley" <conor@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Herve Codina"
 <herve.codina@bootlin.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <20261021-paul-lm51772-v1-1-25f0ffbffa8d@bootlin.com>
 <20261021-wind-reopen-490475bc470d@spud>
In-Reply-To: <20261021-wind-reopen-490475bc470d@spud>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 21, 2026 at 7:01 PM CEST, Conor Dooley wrote:
> On Wed, Oct 21, 2026 at 12:27:42PM +0200, Paul Louvel wrote:
>> Introduce a new property to immediately disable the regulator at boot
>> time.
>> This property is useful when a consumer device may query the state of
>> the regulator at boot time, and want to disable it right away, without a
>> prior regulator_enable().
>>=20
>> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
>> ---
>>  Documentation/devicetree/bindings/regulator/regulator.yaml | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml =
b/Documentation/devicetree/bindings/regulator/regulator.yaml
>> index 019aeb664cae..2da8f70d7e7a 100644
>> --- a/Documentation/devicetree/bindings/regulator/regulator.yaml
>> +++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
>> @@ -41,6 +41,14 @@ properties:
>>      description: boolean, regulator should never be disabled
>>      type: boolean
>> =20
>> +  regulator-boot-force-off:
>> +    description: a regulator may be enabled by default when the system =
powers up.
>> +      A consumer may query the regulator's state during boot and disabl=
e it if
>> +      it is already enabled, potentially resulting in an unbalanced dis=
able
>> +      operation. This property ensures that the regulator is disabled a=
t boot,
>> +      regardless of its previous state.
>
> To be honest, I'm not sure how the commentary about querying the state
> or being unbalanced is relevant to the description - that sounds like
> something specific to the linux regulator framework?

Yes it is. Maybe I miss something, does this binding is used outside linux =
?

>
> In fact, I'm not sure why this is needed at all? Can't you just change
> the software so that it is okay to disable a regulator that has an
> explicit enable count of zero?
>

Do you mean by calling regulator_force_disable() instead ? I thinked about =
that
but I don't think this is ideal.
Or just patch the core to allow unbalanced disable downstream ?
My intent was to provide an upstream solution to the problem I described in=
 the
cover letter.

>> +    type: boolean
>> +
>>    regulator-boot-on:
>>      description: bootloader/firmware enabled regulator.
>>        It's expected that this regulator was left on by the bootloader.
>>=20
>> --=20
>> 2.56.0
>>=20





--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

