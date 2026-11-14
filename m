Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794662882;
	b=s/PKIf+WnvQ+hRwfJRtVYKur4I6OTqCOP8cgeZ52mtmr/5YZxQ1zASOuMSormv+NTGNs
	 iA45udeFF+MgJ+3wZd4heeeNXAzEnED+hnRpnr+4OWTppqmhEMtLHs5D8c7e7TIOG0tXE
	 KeCESVupF/WyOMtYSM3/Dmtc9RfhwGKFUYx9Y5ihdWTOr4q5Y9+oalIu9q1gLR6PENHDP
	 6TCseh7w9mxW0xKdWcl41Bet7PE9WAEaCVpVbtc0aeEdEH3h9R1GLYatI8K6M9xt4AuVU
	 siGJa/9GO5M3gw95q4baGjbPLu+Lv/hMk9Uic40JRzLaBDph1OeT1mkchNxD3PwQ+TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662882;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:
	 In-Reply-To:References;
	bh=gT8R01frXqoIJvl9RGVpwuWi3b4gIIdQyqgCn7ucTZU=;
	b=R6zl4aRs+rmDSigOHUvUwCNkBpzISyTEUiIzX4Ee2vh5EPNns9qc7va81i1awamKBNT3
	 m4drAeAKQCFzV9+37T12Nh1iZ/nWEY7sZYSZF9PNLSlZLm0lv/7MrUj5SYe+YAe8uFKx9
	 wlzEilZwHXgAztGX2ihmmOfhmJ8q5F9Y7tPnKS/Gftm07pxGoBKfn7HPo8EKHiCcmGC3U
	 i4RdWGGApt/7vhw4J/y72gEXQMMpsTsVSqT7l6HDCbwS8o/dC8VE8uqzWqtfe6ruzOLy4
	 G1wtF0KsrxkyK4LUlY3PV7qBY40xheFnhTKxg9QzsrPOFnndNV15NMnHGptWCflyeGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wBAQqr1U;
	arc=none smtp.remote-ip=95.215.58.39
Received: from mta1.migadu.com (out-39.mta1.migadu.com [95.215.58.39])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96252606A337
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96252606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wBAQqr1U
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gT8R01frXqoIJvl9RGVpwuWi3b4gIIdQyqgCn7ucTZU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794662879; v=1; x=1795267679;
 b=wBAQqr1UDyU3stJVqU9DxG5eszmFIcq3qH+qxe9rHQHOh5WReHXL0sIEpiKTocxXHc/h852W
 Lv3v8ViWLsm8tfk8hsFZHv4fR78V47Jh8u7Es8iS50eMsSSsv83DbT+K8PeMZoV4iX9kMV5i5bk
 mE0u9rxlrzjmKBPSHY2Lj8Pw=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8b8a5b5b05980967;
	Sat, 14 Nov 2026 13:27:59 +0000
X-Mizu-Trace-ID: 8b8a5b5b05980967
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
Date: Sat, 14 Nov 2026 13:27:58 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <4427785e421caa5ceba5b64ceb7c7e4cfdb607ec@linux.dev>
TLS-Required: No
Subject: Re: [PATCH net-next v20 00/15] net: pcs: Introduce support for
 fwnode PCS
To: "Christian Marangi" <ansuelsmth@gmail.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Simon Horman" <horms@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Lorenzo Bianconi" <lorenzo@kernel.org>, "Heiner
 Kallweit" <hkallweit1@gmail.com>, "Russell King" <linux@armlinux.org.uk>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nick Desaulniers" <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>

Am 14. November 2026 um 11:43 schrieb "Christian Marangi":
>=20
>=20This series introduce a most awaited feature that is correctly
> provide PCS with fwnode without having to use specific export symbol
> and additional handling of PCS in phylink.
>=20
>=20At times there were 2 different implementation (this and the one
> from Sean) but Sean agreed that this can be picked and used in favor
> of his implementation as long as his case with race condition is
> correctly handled.
Hi Christian

Thank you very much for taking care of this!

sorry for html mail (have not found setting to force to text in
linux.dev webmailer - if someone knows it please tell me).

@netdev maintainers:
is this now in shape enough to getting merged? or which part needs to be =
changed?

Some boards (e.g. mt7988a based) are stalled because not having network s=
upport
yet in last 2 LTS kernels due to this part is unclear/missing.

regards Frank
