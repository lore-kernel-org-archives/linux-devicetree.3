Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870182;
	b=YF3e+76oF4e+ghnowOFzR4zkCKAwbajU19sjSn1WaCNfHWAQu4tVHT23J7Z4GlQckXa+
	 wYQ4Gu5maGXq/m7Fcm0/c6zrHb2wXY2TUifIPjcGCVWdME+PiOap+Tn66wmSEjsySpVQ9
	 SXm5xkDeU3lnj/oqcKaTyfYx26uJ1pooGv5uCtRWM7ilS8WPYORIM7Wl/roPiUt4vOwKC
	 WT5kMf+tuLn+S5f9AOO1Eb6g+OhVjjOdu9jw/77yOsxMLm6U9zXE5PE0JBHtZq5fhABB2
	 ELQ4lqzM9bp48HyqbZ8U2QDIvRzyrkjILID1y3A5RpUDbxEo+uyfn6LU8VH98rQuT6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870182;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wpk3Ypurmggg9iK2k6sIEmjNtTljWEYjQF8mHG4sbMY=;
	b=0wvQUVwhmoldoA5P/pNaXAgsaVPPBIuWjYulS+h9ViRo02CllHP5tq0iHxFBA2PNbvpG
	 vhX3SXhLgzcSbGx5cQ/ujUVhLZ5RE7OSaGNPv7VnnGaej24zCgT4TUHvAcSpzElmb8NgL
	 ffQbcnjFQOm5x4n40NZZMDVYScdmTE+iqYV69eUXV8mVAhSU7zelfravLNsLEMgx67dF1
	 7dCoqmHNlaxK12Ah+8SM4vImGcjy50zZg85A+ewf+42os4lpJgJU81Cabs9KYWA8nQbjY
	 6Y9gnvzIeBPabQnwtIIEz9TXlFH9RGg0dHPUy8Y2F9CXvvXzhmH5wJaYj1gdvBlnKQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lgpy95vn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274A8606A33F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lgpy95vn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809951F000C5;
	Mon, 16 Nov 2026 23:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794870181;
	bh=wpk3Ypurmggg9iK2k6sIEmjNtTljWEYjQF8mHG4sbMY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lgpy95vnlFf7Mbye8LpOyA5jYF+ZFrHaWYRHrwfcCvhH3vNfqj4s4VlwraS2rNXph
	 taKnb9/I8oUpN9bolMqgHyXeLSyDjGTkO3N653sWI0VQ2xvut3tWs+06JNJ+NyDUbU
	 BLu9wi/y+bUdKgVs/5VQuKrnliKWjid38qNS1W00MddZ07hJSPzyFNSJjWhdkNPzYz
	 TS/jfoKOEKR7o7oH3oONwht6ci8g5p+mxy6aeOkmcnzQkhEy3qOq3B5gq1TkB3hR2f
	 jdqHv55nWDOKTfUFyCHkFMcaiDRfzH/ROvZl2TAiw4K1Mv1UCgIr4O4B991Z8dUH83
	 OEYI6hFF6/3sA==
Message-ID: <sashiko-outbox-217839@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/12] arm64: dts: qcom: sm6350-lena: Add PM7250B
 thermals
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-pdx213-upstream-3-v5-9-7318a19806eb@erebion.eu>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-9-7318a19806eb@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 23:03:01 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: handle used instead of real name in
  Signed-off-by trailer
--

commit cb7d77f20d3e8fe16d92844a1db347a543c4c968
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Add PM7250B thermals
>
> Configure the thermals for the chg-skin-thermal and conn-therm thermistor=
s connected to
> PM7250B.
>
> The trip points can really only be considered as placeholders, more
> configuration with cooling etc. can be added later.
>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
The Author header and Signed-off-by trailer use a handle ("erebion")
instead of a full real name.  Under the Developer's Certificate of Origin
in Documentation/process/submitting-patches.rst, patches must be signed
off using a known identity (a real name, not a pseudonym or handle).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pdx213-ups=
tream-3-v5-0-7318a19806eb@erebion.eu?part=3D9
