Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793983500;
	b=jIbcbGCk2l32QPmxE4iANbIIx6irYpaByRcZ0c3TulMwu5p7qV8tKrpN0ZmPIeq13mYc
	 o3j37hfH+F/IhGRdZwnhjZ4lffrc2QRxdg/2ydSWS3a8yoDd79ocnSAJtsetzaWBlQtNe
	 WYzmM8O2jD0U72kPJNH3xL2nF0z78YkoY4+4+vSWeYkE0mW3BxMYQuEJEqTctDz/3mkXP
	 wHqn6Yk3V7Rle7i39tWK0ktOwil+l2nsVWPrWQ7tKg4ygNlLcXYSwALbh4PRs2kmLTbcj
	 YsPIEI01h2cb7JhATzFFt327UkN1WTpE6OS4pjiqQBsmNmCVSKnuJGdnGbXF+MpBlYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983500;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=S7vUAwurxcIsMKz8lL//wcXwplYnwUYMhp7eqi+Ugh4=;
	b=VuFllAbRwsimND4cm4IYwZaUGGG2o4slsQTP2wQEuUe8nVPY7mSDrUrHR1TUboPc3fzv
	 fD/qa5e1b+lnHslIFChHIkXJxRYoqIJJ2q1aobml9d4fVyzv18EC53l3gUA4pN0CufnMM
	 RtNRlH3Yhz4alWHXQxTZ17zsMhNpyeuU7ids86SvvvPSo5zZ1+iIPdZR6xDmtk9FSd5+P
	 S2LMc+UBRwuCTMW8jQ3nN6x9mOztnNDfDq9N6qPs/+YKigAlwiSmB8/ZiMb7BA2oaZaBT
	 smn5NUMOY4BRZfi/2dcJsHbb8xzHJfaH9BnQ7yVuMvPQFaVbhLwzkhRq/3KwRJdvK+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F65C606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 16:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F65C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8E1D81A14F1;
	Fri,  6 Nov 2026 16:44:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6388A5FFBC;
	Fri,  6 Nov 2026 16:44:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D2AE103292A9;
	Fri,  6 Nov 2026 17:44:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793983485; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=S7vUAwurxcIsMKz8lL//wcXwplYnwUYMhp7eqi+Ugh4=;
	b=OhZRLBkk+O1BMe8P+J4i5GoJBspPU4NrG0q9MBrII3RGhTWU2Z6ae8P80w/F7xdhCYhCbP
	n9JjvluNh0XQohTGnmgfMKwMI2xSFFk8OKoBQyJcawTTqzzqTdA/hYFln+fQ9h7MZLI+1T
	CfIaypE1T1gMLyacw0mWH+xT3tCq4SdXIE8JpQbTsPU6yRYz3YpbvlEFixc2eJWK+Zx6+w
	c+0eeINpRNDMCwS/+JsAeFHqdY5xx1iNFoeimK+A/+ZA9rX3hVNkondbYgyzgldp8liazC
	SQ5GYeBUe3kR5r67UZamicrIhsTs7KDhJ7A+EbG56e6L2R08oSMK1vfRgSm9RA==
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
Date: Fri, 06 Nov 2026 17:44:42 +0100
Message-Id: <DMOA2IJB4L56.1AIE3BMYG9QJJ@bootlin.com>
Subject: Re: [PATCH v5 3/3] regulator: Add TI LM51772 support
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Mark Brown" <broonie@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261106-paul-lm51772-v5-0-0e83ac9711d9@bootlin.com>
 <20261106-paul-lm51772-v5-3-0e83ac9711d9@bootlin.com>
 <DMO344BLD9UQ.2X4YL7T3UZOWL@bootlin.com>
 <ba06d540-e971-4e18-99d0-16f8f4530eb7@sirena.org.uk>
In-Reply-To: <ba06d540-e971-4e18-99d0-16f8f4530eb7@sirena.org.uk>
X-Last-TLS-Session-Version: TLSv1.3

Hi Mark,

On Fri Nov 6, 2026 at 1:22 PM CET, Mark Brown wrote:
> On Fri, Nov 06, 2026 at 12:17:40PM +0100, Paul Louvel wrote:
>> On Fri Nov 6, 2026 at 11:12 AM CET, Paul Louvel wrote:
>> > Add driver for the TI LM51772 buck-boost voltage regulator.
>
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.

Sure, thanks for the feedback.
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

