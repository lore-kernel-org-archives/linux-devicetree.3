Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524493;
	b=LROeomNJpLbiTUrQlgnmXgSG0VkmnuhwWjnmSm28VT4fUca4iQ9WCXL6DnK7UXHtmxkV
	 Q50rvWIKG6AeM5xzna2J05R0ZW4ObADA0RLUbnXtGNgUcI0f4W2dExZI/ujQW/hdQlcbD
	 Hp7pvAGOim8H/4Nr+V2sQnLsUOZgFhr1M30Hk8r6dPV1pglfl88/M0OcC26yJBBd+vswI
	 4FiKKJb+crwAF4ox1IWHp4YmIek+9hM5KfalEJWnOkljOtwSyJATfofp4bBsgCoAyBpH8
	 8npOYdeZWab5uf+EedxssPuga31nne5Azgq7zVpS077uhn3LydJ8Fugq90mUtt6ghLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524493;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=nhw4NeSU454BOKwhnUyqxz9y3bQlniVFV2xnSR9NZew=;
	b=ARP0fxiLn9OqS1S5QjFMnBblleYpzx57+58uWtTg/Ib5H49hlyGbEB63TA61pDpeJMKL
	 7PgnSoc0WDezVPAXQ74/oXqCfU/dvGryajGCX4k/xV3uBqpz427JqUaGwWHRwLN9+N4Mz
	 PeOiv7Zc6tX9eVKeZo89OpEloPiyBFrW5GNZgDSPf/BF3I2MOoUvcDuoPX7VrTecv7RyU
	 +tOyKiNKDpe7stRuFqSBlS9/ZSy0KYZHHthMnSmXkU43MWIjVxthCBD+VSsmVEozHC9oa
	 UAFbeVosg8IH/PWDWw14HlU0D20VKZszYp0i9RurchS0jkKWgNuODRrFmCLaZUin/0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=aE7p0YAw;
	arc=none smtp.remote-ip=95.215.58.103
Received: from mta1.migadu.com (out-103.mta1.migadu.com [95.215.58.103])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF95606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 19:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DF95606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=aE7p0YAw
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nhw4NeSU454BOKwhnUyqxz9y3bQlniVFV2xnSR9NZew=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792524490; v=1; x=1793129290;
 b=aE7p0YAw+as7Xca7qxj1PFyCXZH/6PMfqTFoMsmKByNBawbEKO39gV1rHSbijQR9J6Cm5Sye
 uWez+Yep/7mfxb6MP7l9TBvANeEaU/37/EgSYkz/PBHiKYl3jzHBO25kN78CJ53xBdIeU1kbMk/
 73nlKT4L8BDoMJnZOZ+D7BAP97ZBpSCfh+ecWcd5ibZADv0qI+s7aGOUgkMQ+FkmtOPyzFuZAiI
 qLCDO+Tw9CUlBh3sKXDP7PHbRXyCgAnKAUYNXQlN+c14IKtm1CkQ72w5kwjdY/Xgf0593QzvNEd
 OyevAN2A+M/EtELC1txBMF6tIo2c4MwuQQO1z9wtb6R+Q==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d89a57325dc7bec0;
	Tue, 20 Oct 2026 19:28:10 +0000
X-Mizu-Trace-ID: d89a57325dc7bec0
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
Date: Tue, 20 Oct 2026 19:28:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <338bdb9dddd9cf502a05ae8a79ccf5bb368b37a7@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v3 5/6] leds: aw2013: Prevent writes to unpowered chip
To: "Lee Jones" <lee@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
In-Reply-To: <20261020101654.GF1206986@google.com>
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
 <20261012-aw2013-aw20xx-rename-v3-5-cab1fdd050b6@postmarketos.org>
 <sashiko-outbox-169017@kernel.org>
 <20261020101654.GF1206986@google.com>

October 20, 2026 at 3:16 AM, "Lee Jones" <lee@kernel.org mailto:lee@kerne=
l.org?to=3D%22Lee%20Jones%22%20%3Clee%40kernel.org%3E > wrote:

> >=20
>=20No more reviews until Sashko is clean or everything has been reasoned=
 about.


Thanks for the review, wasn't expecting anything until I fixed Sashiko, j=
ust didn't have time to circle back yet.
