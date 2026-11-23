Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437425;
	b=AeDoP3V5LD31sPk3MIHPPnWLPSvGe16a6wI08J27oBb+FWC42Ils5tC6IGkdsOhOfvxC
	 JjHiLHGoQ3a8prZs/dGlW5MO1PDx/+aBkHfjIdkBOb1EStNB9T9wxaCD+rYYJxOhcIwvM
	 2GSC9GobGxwee3ImeCN+UFzqAygAToXJJ9TD6PeXKyvY1uQLSaM+faGqnj4wfRJLrKTDD
	 DdWZ+y5+A3/NbEiEmkYIPRjXlzkVVLDd0wDrIT99JUQ7gf8yIMUMcVT5u0MzuO6O/Ubcz
	 PhfAIAj9zqKAhJGhrSLghnVIOSrVGJ54G4uM40BKFHGMozn3RklAAdq2tVd4hVN97cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437425;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=l925ZWGbqN1yJ3oYRddUoTyEflV8xChX7JXyYMyuMo4=;
	b=xSZ93xKhpEQCWZa5CbFIeJJH4TyCD2u7jOeRo/c5gJRDhq8gs+KD7IpR11+/tJZRM8HC
	 vNv8uN9a/LbKmG6MV1JvyfdoweZSHz/Zawt9uDu8UZSUvLkn+sUKiVgPAKFfTK5R3yqV3
	 uamug2V7E/eV8kOXIKYR/cmna9ZyvtuxX/QFlsvZo5rSxOUqX4YW+jENejLB7vcqgteaO
	 J8FdxASYS9L3tM9Xx60hQfxI2yxH/JzC3bDlMq4f5KuWdfLG0SESRS+dU3F4HMMYYkqpE
	 XuMIKCAYEcgZG3ygl/xhSzDi/zsh6kSW/ZO/u7EsRIKFiMT3M9ht+9qV2rohignW9hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jonasjelonek.de;
	spf=pass smtp.mailfrom=jonasjelonek.de;
	dkim=pass header.d=jonasjelonek.de header.i=jonas@jonasjelonek.de header.a=rsa-sha256 header.s=s1-ionos header.b=wZN5i8RC;
	arc=none smtp.remote-ip=217.72.192.73
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03179606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03179606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jonasjelonek.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jonasjelonek.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jonasjelonek.de header.i=jonas@jonasjelonek.de header.a=rsa-sha256 header.s=s1-ionos header.b=wZN5i8RC
DKIM2-Signature:  i=1; m=1; t=1795437416;
 mf=PGpvbmFzQGpvbmFzamVsb25lay5kZT4=;
 rt=PGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPg==;
 d=jonasjelonek.de;
 s=s1-ionos:rsa-sha256:myGyhvpRZW7AVaYwpkk6k3VrzYg1
   tLPzlxqC6SV24ffJv6qDfAR0bXjPlQXCYbHWCn19y3o3VDMzZFEPj4HocFTu9bHCv8/Zos2E2GU
   HrFEypbVFgRJ1CuznZX8qJhcEYA+Sv1L47QysCTunwCK2p57liVCEJ+D/fHqzpBdlzmjmwLEtnC
   F9icmIc0eSInK+FVGlymBmYrA6wyZlNL84DGEAi86IAt0gQ/M79tqTS1o9EKp8e6kbT0svh1Wlx
   tg9DWMqc3Lw6L78DL8iaUxq4ZsN/gzGVizDW8lNVVjLzE5QPrL6EjizHW/J/FIqEwIoLLmf1+Jy
   X7oYveyugDBBJg==;
Message-Instance:  m=1;
 h=sha256:
   qCggyGSepEfwd6Ws17fS0jgkH06TMthdsnY7dniNvbk=:
   10qJieUpEb4nI3vpsi0Ab0qPkuyKz9JLg1FBgTO6Cus=,
  sha512:
   7N0/k+/wlEJ2cZaevImKMqfMpI0Ngy4gE50xyrW8ZPA1Ko6mZfenVjADCDL1l49JixnjEcjCQ0sfv6zA0koXHw==:
   2D1sQUisp1i/mbcx3Qd1m/5aZZoUE7UliGWDbQdeSLcZdCFSm/WBthHQlLOzRU2cOphrzlUeTuLVoqK9EV95Fw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jonasjelonek.de;
	s=s1-ionos; t=1795437394; x=1796042194; i=jonas@jonasjelonek.de;
	bh=l925ZWGbqN1yJ3oYRddUoTyEflV8xChX7JXyYMyuMo4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=wZN5i8RCk3un1ss/rNJE+6mE9hblNLFvVdLMi4JcWjpSTmQofpcZbZ/WrV7pyi2L
	 fMnq1xHlLbpBxlOdvvy/xMcCM9xn3ohDM7Vf8XKOQBjZUaKdgAM5DAR2/HPfEJQrY
	 BRmgWjK2TtITeEDyLd/b3uiVCm8tOmPNMYZZO0t1Z7ntRVRGDTFF5oaSxpY5hNI50
	 I5Kllocc2CPZ8EFaoMuW5alZOZwxCrIaKSTxpArwqmMNbQqI40OjPG3leM7itenzL
	 M7f9QTQ5xoku+LvAT096gIRGPTPkWWlGQiSIiR8b0S+uyImtT9YO2l6GTh7y33I8I
	 8MEAuwoGUHZn4uTBQg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue108
 [213.165.67.113]) with ESMTPSA (Nemesis) id 1MYvPq-1y0HoY0rEu-00XfeH; Mon, 23
 Nov 2026 13:36:34 +0100
Message-ID: <6fecc631-e493-4e05-aa3c-61a8b0d2d1cc@jonasjelonek.de>
Date: Mon, 23 Nov 2026 13:36:26 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next 0/2] Add Realtek XSGMII interface mode
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261117084748.2387647-1-jonas@jonasjelonek.de>
 <df35e0d4-9f1f-4882-bc6b-257add4e9fb1@lunn.ch>
From: Jonas Jelonek <jonas@jonasjelonek.de>
In-Reply-To: <df35e0d4-9f1f-4882-bc6b-257add4e9fb1@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:neKmgYZDofjCZsVDLf+n7cuzeb01P8X804PywG8qYRSDgmuIMNh
 ofB4XQ2jgUHIbyzj3lsIED/SkDHi7PbRJDVFl2R8oQcYmgoAo7J0BBMvLjRNUAl1kUXpOnj
 arGNHV5T6wiqXqylmDQacAhn8CW8eDb2jbgIMKMs40q2LQpbz5JdfiBdo3VGs+GbPTv5bQg
 rxFLmPLI20zTx41NAKHTA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GX0+nk2N86Y=;XTifLCGyDObhAk3n7MnmvGsdWY8
 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
 9Fw==

Hi Andrew,

On 22.11.26 22:24, Andrew Lunn wrote:
> On Tue, Nov 17, 2026 at 08:47:46AM +0000, Jonas Jelonek wrote:
>> Hi,
>>
>> This RFC adds an explicit PHY interface mode for Realtek's proprietary
>> XSGMII transport. It carries eight 10/100/1000 Mbps ports over one
>> 10.3125 Gbaud SerDes lane. Each logical port remains limited to 1 Gbps;
>> the aggregate serial rate is not a per-port Ethernet speed.
> We should be careful with naming. We have already have QSGMII and
> PSGMII, for Quad and Pent. X is too vague. So we should somehow
> indicate 8, Oct.

In principal I agree, the naming doesn't really fit the others. I just use=
d
Realtek's naming for now, they use XSGMII everywhere for this.

> But...
>
>> Protocol identity and naming
>> ----------------------------
>>
>> XSGMII is the name Realtek uses for this interface. Calling it simply
>> "octal SGMII" would describe its capacity without identifying its
>> protocol. Existing modes such as QSGMII and PSGMII already distinguish
>> multiplexed MAC-PHY transports; the PSGMII introduction is an example o=
f
>> adding the generic mode definitions separately from a driver user [1].
>>
>> Cisco USGMII is a relevant comparison, but equivalent port capacity doe=
s
>> not establish interoperability. Cisco defines Q-USGMII for four ports
>> over 5.0 Gb/s and O-USGMII for eight ports over 10.0 Gb/s, using 8b/10b
>> coding and a packet-control header [2]. Linux already represents the
>> quad variant as "qusgmii", with its own control-word decoding [3].
>>
>> Realtek documents XSGMII and O-USGMII as separate RTL8218E interfaces:
>> XSGMII runs at 10.3125 Gb/s and O-USGMII at 10.0 Gb/s, with different
>> hardware strap selections [4]. The SDK also distinguishes them in
>> phy_8218e_macIntfSerdesMode_get() and applies separate initialization
>> tables. Realtek's O-USGMII is therefore the candidate for comparison
>> with Cisco's octal USGMII; it is not evidence that XSGMII can be rename=
d
>> to USGMII. Compatibility of those O-USGMII implementations would need
>> separate confirmation.
>>
>> This proposal retains the vendor's XSGMII name rather than assigning an
>> existing protocol name to a distinct hardware configuration. It does
>> not assume a particular XSGMII line encoding merely from the line rate.
> https://deepwiki.com/lotusmomo/airoha_sdk/3.1-sgmiixsgmii-drivers-and-ap=
is
>
> Airoha also seems to have an XSGMII. Is it the same, or different?

Looking at the referenced code it seems to me that this is rather used
like 'xSGMII' - an umbrella term for SGMII, HSGMII and USXGMII in the
SDK code. Probably the deepwiki side summarized that incorrectly.

Overall I found no other usage or naming of a real XSGMII mode apart
from Realtek switch SoCs and PHYs. Those PHYs (mostly RTL8218D
and RTL8218E) apparently are exclusively used with Realtek switches.
The RTL8218E might be used elsewhere too but in contrast, it explicitly
also support O-USGMII as a separate interface next to XSGMII.

> Adding Christian.
>
> I hope we are not going to have vendors introducing there own
> variants, and we need
>
> PHY_INTERFACE_MODE_REALTEK_OSGMII & PHY_INTERFACE_MODE_AIROHA_OSGMII,
> etc.

Doing some more research on this, as already mentioned in the patch,
there is O-USGMII: described by Cisco, being compatible to SGMII and
QSGMII, using 8b/10b coding, 10Gbaud rate. Though, this should be
totally separate from the proposed mode because it uses 10Gbaud
instead of 10.3125Gbaud like XSGMII does.

Apart from that I occasionally saw some vague information about an
extension to USXGMII, allowing 8 ports and reusing the USXGMII spec
control word and format.

There is no detailed documentation about XSGMII, so assuming it uses
any standardized frame format would be risky and very likely doesn't
apply. The naming of the mode - given it'll be accepted somehow -=C2=A0
should reflect that and not conflict with variants like 10G-QXGMII.

>
>        Andrew

Best,
Jonas
