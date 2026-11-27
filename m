Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759213;
	b=Q0b+hZ7CzO/XEPryPVr8eFplZfRjBxzm23zpNt+eH9wzoqI6wiwL20fPEhma/50/NoKK
	 0PUlppHngCozAo5/kKOXLm1rCTzspnltdBZOP5doBW9iWDcE7AtuuLWipWhdCtXbw0aVX
	 QvSwkoSQHZldt1muIVM0HyrVWqHykHp/wK5RuHXXeTf77xzo+al5yny2S1LDxhmLaZmBn
	 89jMqTvjEXQcDw98FexGu8d7oJzFYB+xvRjraB4NC8AlRhviVSdzcBy+1whqEZG9iWAPV
	 C1CENWVwg5vA9QjzcDMD/Fw8R1zSDJvo4gnqjY5hICQuKh2zR08ObucofQSMX3yMRUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759213;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=W5orpNQRwzUsBFtBd4lKgk0noKXsQvGISmKxvFmwlXQ=;
	b=Zbtw7LitbNxcrMH6CL6ZPyk2Pvgw28+N6xITg5YO9RClPyZ1BBJY4RiDy9JnW/knVyVq
	 VJm5+8M5OnqfVm+27IRCw5uztUOo4LLL59of7lXTLZIwwUjDAm34HCo51WGTJH38HzbT2
	 1ch2X1zpE9ZDpx6Zz6XTfHaQRf5Ob+KhJLilZWUA98Q/GsleXEjjCcbu88isPu2U8g5+/
	 A7MO0cI1pZTg31wC9uy8Ck/8FEAmbDyfVWbHXbCh9ExwrskviSwj2hj/mPLlL9qjUvqev
	 Afj4xZOsAvIviJX7bKkMe45s41RNYkn0HEoD/VnAbOfq7ZnOYjwo3wSMtuUjSGx7ucw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=v9oeIWlc;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40078606A31E;
	Fri, 27 Nov 2026 06:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40078606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=v9oeIWlc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795759203;
	bh=W5orpNQRwzUsBFtBd4lKgk0noKXsQvGISmKxvFmwlXQ=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=v9oeIWlcxAC0NT8FSMBK0n3+P+yfEUc7ZdFDpkfQsRpZfD4AdMTgnIsL+1IXGW6GY
	 Pop0O4GsG1LdO7uSvcdj1QlteX8W9T48A4cvfSvXvm0239BOg7Sm1wCNw8/+OZ7q2b
	 UMsQE4lKFsgpY/8FovhETVnEFqV7ZzwH8Azx4tOg=
X-QQ-mid: zesmtpgz6t1795759198t02bcd124
X-QQ-Originating-IP: CyiqXhML3xAjxSMuZRfc6KNxWUfRG9AMsUIeo1bcios=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 13:59:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5876352062716450279
EX-QQ-RecipientCnt: 25
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=d1ae752c97959d5b8d8cd87d8f8f5410d469b0ecca2088ec5a8e5567b25f;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 05:59:54 +0000
Message-Id: <DN5RI93NOUY6.2TXJX73EU84KJ@linux.spacemit.com>
Cc: "Alessio Belle" <alessio.belle@imgtec.com>, "Luigi Santivetti"
 <luigi.santivetti@imgtec.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>, "Baihui Liang"
 <liangbaihui@linux.spacemit.com>, <imagination@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: add PowerVR GPU device
 node
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>,
 =?utf-8?q?Fr=C3=A9d=C3=A9ric_Mah=C3=A9?= <frederic.mahe@cirad.fr>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com>
 <20261122184434.545341-1-frederic.mahe@cirad.fr>
 <CABdCQ=PnfXRd2=b6_yEN94RCRvPnWx-WFfHZDC+jhHv_UFZ1ZQ@mail.gmail.com>
In-Reply-To: <CABdCQ=PnfXRd2=b6_yEN94RCRvPnWx-WFfHZDC+jhHv_UFZ1ZQ@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NmzMINE5aCWaH++TxAmk6l5K0MmcNDkKfBp4OUP1HEMc1XB9iK4T5ATg
	D2K02oQV+rev2zcgHDgvjFtSphEugLtwR9wAc4c7VFcmkvM4HgkcAgVWLUOAFaIjSHltRLf
	09d8iOc6f+8mAFKtnzsaknX+zWKJ6DOrcAqoAUMn3qz4jMx6DT23rT3ikor62Yf06rrDZUT
	WGo1kfA9WtoReEuf1PaDlgd/TNfwp1jjPxCdmz64M6SGZEONAdlSVDdESIpWq946euCbqvu
	Sm+Ra44Ych+TXTbS8XwBAhM+9UJyX0fLOjzNuzuu6tghrLegIRTLlhjeyqiLB5ZDiYhVM74
	kA72Mq5ehemR0myVGUYX4/h5Td5wrqjd324dBhZTVl1OZw6yRhbnXlc+T8Skvhipns/IuJw
	DjIGH5uT/wZbNdVToPn5IA3HwhCT0x56FXr/q/pDyzwb6GGadreckZ0g1rY5qYnz012lKMt
	inpGqaCUyMMy1jvQ1kCxe1rAa06MSfaZf7c8FcV7HObgG12Aa+8BenAL6o3fAguyujh71hv
	HpMrQAQNLi9fPJHdGggl4XwvxeGl8b4CWSWRX7ir0lb9Zf+ZREkiGm4F/8P07+EwmFrCwXJ
	DPmKcRBjeKnGJjggKcrKSs6lnbNgnYPHKbqHboRMEGFWi5Gad9CmNBCqUK2iCh0jsHyNrTQ
	nVvNmqzOo00TCfavAEbjUS8AdkCXm84lanfNlOdGX192fWJc/8s6BI31PjJFMnMCYrVZ+Lr
	4KaV7b/f3u9f73AiGImWxTtXW1iW2eMm2zc2/jh8NTUa9gVAYTdjn77K40JNSntjykHxtmj
	mAi6VIivMNaF/PpLnD/p0iotm7rexBG7FcaU4mTPXfsvbmtMn6iNGlpobPzDVzvTpAN3tBr
	3ZXS/INMEzjgo7WHBqP6cMX3QYzCzMlwYfNOlj6+pnyHB6FUgCXinUVq5u/r5whKCAB8Jo2
	0owU7Vg9z7rZ/LuWBqI9QOezA+GT7PRbL/eKjcZDDEbydfmqE3N45FGKkbIPJdMc9Wa2iNP
	YJxndIDcQXMmfMnvuuUKWPxdy3RalXQ7wUI00OrHlZRI01N2GvrLCgC1AmJuFPfqcRTN7Jn
	Q==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

--d1ae752c97959d5b8d8cd87d8f8f5410d469b0ecca2088ec5a8e5567b25f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 23, 2026 at 6:41 PM GMT, Iker Pedrosa wrote:
> Hi Fr=C3=A9d=C3=A9ric,
>
> Thanks for testing this on the BPI-F3!
>
>> Two notes:
>>
>> - On v7.4-rc1 the driver refuses the GPU ("Unknown GPU! Set
>>   'exp_hw_support' to bypass this check"); with
>>   powervr.exp_hw_support=3D1 it works as above. Is a driver patch
>>   adding the K1 GPU pending somewhere?
>
> You're right. I forgot to mention in the cover letter that I was loading
> the module with:
> sudo modprobe powervr exp_hw_support=3D1
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--d1ae752c97959d5b8d8cd87d8f8f5410d469b0ecca2088ec5a8e5567b25f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawkcWiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC9jPwEAkEDYQ/DUZqdM
7fO73JXCHzzyxH2RSvNzzjPHVh6TJCAA/jY1bbDX9rE04bGONDjWVzwEHNrfpRKP
pCll1aV1PnkD
=NZI6
-----END PGP SIGNATURE-----

--d1ae752c97959d5b8d8cd87d8f8f5410d469b0ecca2088ec5a8e5567b25f--
