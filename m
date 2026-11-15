Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743829;
	b=elz31Eb9aOopjhhADO8x6+Q0bdG2+6iov8NojgtsRhhCo3MmKFRsI2mIqiqZUJeGxyUo
	 a75YpCPDLL44ugOyJbwb6EAgB1V5HlF61phfka9jGhlU6l/grrBFyXtuMDVjpDAf3fKbZ
	 Ve2PlX2/xBlYwaw+NrE53WZoRsMs81FlGQUJeWZx4jqM3/s9ZqWKmxitVRz2UvT8FJRMa
	 S5maD0ig6yNJjXxOYF9euAd8O9f9kVCneRRRVFBOdRkmX/gDahLkCwv28sFf2cST0QjWv
	 WpdCx7TX7icYAoBO40DWTjtDFtOOh9GqF6++EqYBc965O/oYFrBjlTNKwNeJ5owL7Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743829;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=zhhDm2qyru0LaqxksPFvsWC42WCRzYXUzwovCybxf/w=;
	b=KdMH667Ms33MKo4QLKXAF+ukQjdBlcY4+E0rVPZDjf/GGqfsZgIIV8IUl1ffRqHbVDIj
	 ra1sfRTMRrodSKmYwtWYN0go86HO9m04SRX85mSJXNOXVMukjLJR2pEKVtNtIqGTp1aRn
	 o7qnICrVD0pdwagauA56YSuMzuDrMyaGAMij8MelFC5uJ/OEjU6ohimYia0uFNCxoabqi
	 CMP1sDFs3U3SSn9+iWSHnvpybeG15+a6wXMKNxv4Njg6UCJk18OsjRHURF09KSUFjQLn+
	 PrTg0kM/ofFAdEu6GgVg9ByyaEYBU3czSNHPo/deBlAesnLD53WhJ3LBDflxZqRyO6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ijmaewX4;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5437606A31D
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 11:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5437606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ijmaewX4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zhhD
	m2qyru0LaqxksPFvsWC42WCRzYXUzwovCybxf/w=; b=ijmaewX4miP4ddwVG2zc
	FelrOxzBahZlunioU4qSakWVzoN8fPAagUD6YVAJ0ZOjcjb7/yv/V26nBnSPy/f5
	aYgQ9ONhYbdH9dKEWGVUN98pvjTap8Au+ouO1fOtBzgwrSHIxhWTWSaNXS89mdiE
	dxYYYJbHzWSkvfkdJRhHCxZRw62t5bI1k+1FtFb2PulTwIKeIm4jKvjOche8IkOs
	Q/hxqRt8wzUEEJjBR1XDrm74hJm9zznBOQBZN1TANbnnI8/KDlbMZ1ExM1ot4ARV
	l24JpZjPcT/mBTM0D/GEFmoUZCtwLC/jJiCpj4kDknMk4FuL+HKzwiqsi22ad4Fp
	vw==
Received: (qmail 906437 invoked from network); 15 Nov 2026 12:56:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Nov 2026 12:56:58 +0100
X-UD-Smtp-Session: l3s3148p1@cPS5W09g7qgujnuZ
Date: Sun, 15 Nov 2026 12:56:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: i3c: renesas,i3c: Document analog noise
 filter control
Message-ID: <avmeCELZRvJVNtyl@shikoro>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-0-b7ad60cde650@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-b7ad60cde650@renesas.com>
 <ate-aNmqsyXCAIX8@lizhi-Precision-Tower-5810>
 <64f604a7-7e70-4a0d-8164-28c5d7b1e509@renesas.com>
 <at-5E3b_wKcnuJ9Z@lizhi-Precision-Tower-5810>
 <f4b8a714-dab8-45d4-b98f-717d010806de@renesas.com>
 <auC06gqa5lGtKPjj@SMW015318>
 <7dea4022-20d8-493b-b560-ee635deb7cbc@renesas.com>
 <auIK38HPyv7PmDJF@SMW015318>
 <db1ad309-c02e-4616-8486-ffa967207d44@renesas.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db1ad309-c02e-4616-8486-ffa967207d44@renesas.com>


> In the end we got confirmation from the HW team that the SYS_I3C_CFG
> register does not actually "exist" and was unintentionally left in the HW
> manual, meaning that we cannot control if the filter is ON/OFF so this whole
> discussion and patch series becomes moot.

Interesting outcome! But easier for us :)

