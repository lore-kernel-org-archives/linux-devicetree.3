Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522053;
	b=aKp0aYNlu+f6zOG1EqZSQXhfvKw5QZBRX+hqgB4lyvLriGVk4P3tNv26tmkveKyEt7+M
	 UhQ6/NbhJ7Il6CLEHeqQ93ifz2cPhkJKgMUHlSreh8ytImZtHk6n/aa8CcpdnieULtRTs
	 7L0nMpOkRUR8C73iLOWNaomxaJISRRO25gg+xeTUGxDraK5fwzZxs5gsYKdt83AWvG57h
	 TVWjfFvFhf/KkKgZJ9PvcPRFgdHGCr9jVUEvrNRNCe7hcm6/2WapBzozvxSw5GU5pXDgq
	 PSb79NjoTekGjsOVp8W2WBJppXnTHIWB81oDeeT0XB8NbAvaRA/SymkyJZhb++Y3BLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522053;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=mpprA3S6uBrKI3A+k9JU2N0Xl8rjjtK+Cdj2X3TXyhE=;
	b=QdRV4rS2YNHCusmbeMk1Wm++PhLK68g9ISAYGALiPrJ/oWSIB0La50eMzl2e0NRQkntl
	 Vb7/dctj+I7JwFRRCLxhKBkt732qxa4k2v2EFpX0TlrglCK1z7dWw2SVppaqZvnYqC5LR
	 TOsC83guw4ktUVW/s75w5D/Puq6m78qBalS3JLWS5qPBHOKuiMc5KU8z+nSYX/309lJY8
	 tkXQAoSTGnUE1NgCepZJAn9B0bM++aeUeaiaYyHW5RappMuABQfXXk+4Ta8XPf2RSGEan
	 ex3cvMODHCkl+fn1aq3+8o5jZqfHeoRS1N74xRXUvtfR5sI1jsWxIW4Q1CsSk1fyj7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=QeO99b8b;
	arc=none smtp.remote-ip=95.215.58.78
Received: from mta1.migadu.com (out-78.mta1.migadu.com [95.215.58.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDFE606A323
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CDFE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=QeO99b8b
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mpprA3S6uBrKI3A+k9JU2N0Xl8rjjtK+Cdj2X3TXyhE=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794522050; v=1; x=1795126850;
 b=QeO99b8bWnpn9F/8Ggk1UN9xt2m9As0J47VNdgcbao4xp16Eyts6kC9M1yMv04KM1IrVOeEB
 eCYEX9jzTzB2fi78WnPjavX2DL+llX+FTgC4sAnUFCMhZP4NE+NVkDrqR0GTJKwN1m1cMLwnN92
 zWGY9UauX0w2IgdGhaQ8rz7E3kOLHgwBU64ymTZBhEws6+LnW6vflt3UghMOrdj5XTV2ifsMbK5
 q2Gzr5r4FRiItMgi7RWB3BSt3YbKFAyXHiAO/vX5r7SKdVb4SqV1g5ISaP25Yax2/hHkEAEB8hS
 cFkocfTdidxrOT7r3lt4mhthQt4zpQwDJpXXJARzs5egA==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 20d835dec25aa392;
	Thu, 12 Nov 2026 22:20:31 +0000
X-Mizu-Trace-ID: 20d835dec25aa392
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 22:20:29 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <4d30540910d8af03de850769e326906550b15574@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v5 2/3] leds: aw2013: Add AW2027 support
To: "David Heidelberg" <david@ixit.cz>, "Lee Jones" <lee@kernel.org>, "Pavel
 Machek" <pavel@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Nikita Travkin" <nikitos.tr@gmail.com>, "Alexey Min"
 <alexeymin@minlexx.ru>, "Griffin Kroah-Hartman" <griffin@kroah.com>
Cc: "Nikita Travkin" <nikita@trvn.ru>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <11724004-3e85-4f7f-a683-5ff511863bc6@ixit.cz>
References: <20261112-aw2013-aw20xx-rename-v5-0-b2c5e323a90a@postmarketos.org>
 <20261112-aw2013-aw20xx-rename-v5-2-b2c5e323a90a@postmarketos.org>
 <11724004-3e85-4f7f-a683-5ff511863bc6@ixit.cz>

November 12, 2026 at 10:10 PM, "David Heidelberg" <david@ixit.cz mailto:d=
avid@ixit.cz?to=3D%22David%20Heidelberg%22%20%3Cdavid%40ixit.cz%3E > wrot=
e:

> instead of comment (which should be formatted such as /* */), I assume =
you could use #define here?

I could, but then for completeness I would want to spell out all the aw20=
13 current levels, which might be too noisy. Or calculate it, which would=
 be hard to read. I think comment is the best for now.
