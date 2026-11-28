Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795872004;
	b=ZsyXXHz+o6vI6xfrt8eP3z4nxaih/1jNsKAEegD/+tmMbGLeInB7r6IyJjFQVUsBO8XN
	 jkpr0syNfrfr0l5tHFAFZp3Fmj9TrnX+eeZgfwiUybjxhLhKSrdmF1ndRfuCfKXdrR4zg
	 aBaFgOoNE2V3VdLgTS6rRjq1T7HDrxkC/i2ZdclJ6l3kwVyexnJVRWkg/agFbgeHv6fU9
	 tQHeDRaX34G5xm0MlAtfeslSC3JNwmmD5DguaIxp9vXUm3eU7FMcb+V4joCUmh7AtJKH2
	 feW6ue2zqwopjsZl/YNy56ue1YC30BIc3jqglrzYn7Yj4dWocSSvBG78HILchjMbgsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795872004;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=m1rJYGaETJoIt4vHS89MbOH+bFiOGF3Tj2iPlcPve+Q=;
	b=JKQMi7UoaNlyzTALOwa26dx7izi0CKlQgHSfkMAwu80nAM61goQ2uO6zKhXjl1mzvsqH
	 Ik4VwEsPmYUBrQAFfxjZS6upAfKc7STP3fuzwoTZjsll0tMaf0JC7Tvmhr06Qv1IRJKS2
	 B+mNuKHAVp58xUvpANED8qagiGDCl0KpIpeTIuPOBDG/WC+23EwB6OGjAnJVLwjVilo6J
	 3keYcQFl6ZZs4ioHIJQI8kqpfpGCb2cT2MNc9hi3O2IJNgbgSDZXYsSmXxJxSXPgTPwAM
	 X8DtxqBC5P85USYEW2cmBU92dePxCJqBwsBCp+XNR1RzZ5MnVGmro2qwmhAVnypsNDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=hendrik-noack@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Uzr5uWx8;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1534C606A324
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 13:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1534C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Uzr5uWx8
DKIM2-Signature:  i=1; m=1; t=1795872001;
 mf=PGhlbmRyaWstbm9hY2tAZ214LmRlPg==;
 rt=PGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:sG5WUeYEcby4FVjPa3t9wz0dgHHz
   0S0RWJSjfXpXAOz3B1SFObuxl3pkdQd23GjLayz1lhV6BBzIN30CpW6cuO3D02/DNzBn5/Z/Yet
   wiCGYvb1P4nVtG26PmBRKuhkf63zMpsakg3q2eFw5+YtU5gF24xNpjaJ1WulsaHvPqDTxNZswGo
   KzQ5NwmOGj/0qc4bcHsqsb2VxXZOB0JrvTEZN93AalR6uzvl9zgMuJpFDeITmgOyOgw+Q/kvWiC
   dmlS2dMVuBYkXqrgHjfNkGhEoxXekT6vJz3b58ezkUFpfE5DrlVEgVbqgLBxQPvHieXBdJJlusz
   nZt+3JVczTXBCg==;
Message-Instance:  m=1;
 h=sha256:
   5863fzWWGEWxSVNKjzVCIa/s15yMJ7gk8bZ/1ucfbhk=:
   m1rJYGaETJoIt4vHS89MbOH+bFiOGF3Tj2iPlcPve+Q=,
  sha512:
   mMhdFnnaEYVLPVCheG2NSmoaQymSUvI2D/kJ5uJIRffOwpCWLEu1CQ4rNuetMbzB+A8hkXGuCbm+yVVWYEfU5w==:
   +Qo7Wu+CnP27wc2JP0NR2oRbIqBA1P2oeA/ZCLNz/vLNZ0gsfjx0qTfj52PNOyOQg3Vqj7F6iDA6KQ/3BkRnuw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795872001; x=1796476801; i=hendrik-noack@gmx.de;
	bh=m1rJYGaETJoIt4vHS89MbOH+bFiOGF3Tj2iPlcPve+Q=;
	h=X-UI-Sender-Class:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Uzr5uWx8QQacBj47Z1c608zg5LC0HpFVUnEchzr97fghvMCZYdJ+4mhG84Xp2ZJ3
	 19Kg4cmo75ar5kBQm/YuQ2xYMik4RqjnYmNOqWTjGoCQZTaZqzOagrCyiBOHK+Wq7
	 ichaeSvedjrwWGCI2j/aZmrN0M055XIJbuN2Z7hixmsc9k1VplidKOR5viRQub8Td
	 1e1GYPKjjFIKSwAn6xVfgdqjUqLaOTSF6oaWHXU+6eIYUSbz024SEaCzorP2KgFlM
	 TbsOM+mEgScKDSCHlrGfCPWkdhnee0sruF7pzrNlsca46EKCFvCkcWuMRIVN9RdD8
	 0dJ0IlLVX9sZ+WOJ7Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MryXH-1yKwS51Son-00ZnLv; Sat, 28
 Nov 2026 14:20:00 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] Input: wacom_w9000 - add support for Wacom WEZ01
From: Hendrik Noack <hendrik-noack@gmx.de>
To: Nizat Mikayilli <nacht@dxdmail.cc>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hendrik Noack <hendrik-noack@gmx.de>, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261108-b4-wacom-w9000-wez01-v1-2-c2b5e3466187@dxdmail.cc>
References: <20261108-b4-wacom-w9000-wez01-v1-0-c2b5e3466187@dxdmail.cc>
 <20261108-b4-wacom-w9000-wez01-v1-2-c2b5e3466187@dxdmail.cc>
Date: Sat, 28 Nov 2026 14:19:41 +0100
Message-Id: <179587198100.69147.18218538382840865336.b4-review@b4>
X-Mailer: b4 0.16.0
X-Provags-ID: V03:K1:K4rsE18hJXrolU+CU7tk880ZhJonto/6qLYmyD+wKgJyrfGW169
 5Z0o1z1jbFyRCghqUKmr+pQDmAhXYNFnUeFjHwLvcMo7M+sR0C0O7tOKJcATLWzvtr7uJA3
 lGViREa8bhtFLQJxWe265IEpHi8Too+QNBPmeSsvzZjx1DadqDBtOjJoivQCe7vJk0i4z5/
 vnlBiKzseSs6EXDFv1Mgg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:18vSrmzTbRQ=;l6fgaRPzmNwdJsztCRX+dhSHQAa
 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

> The WEZ01 uses the W9000 query and coordinate layout, but it is queried
> with a plain 32-byte read that returns the query at offset 16. Its
> messages are 17 bytes long, with the packet type in the low nibble of
> the first byte, and only coordinate messages (type 1) are handled.
> Pressure is 12 bits wide.
>=20
> The protocol comes from Samsung's GPL driver for the Galaxy Tab S9.
>=20
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>

Reviewed-by: Hendrik Noack <hendrik-noack@gmx.de>
Tested-by: Hendrik Noack <hendrik-noack@gmx.de>

I tested it on my n1awifi and v1awifi, both of which have the Wacom
W9007A. It still works on them as before.

Best regards

=2D-=20
Hendrik Noack <hendrik-noack@gmx.de>
