Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE5D367B76
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223920; cv=none; b=NaXYMtW7FTRXiqo/S1udT9PQeuhwxz9uO059EURe51jwBgSy/8FREvLdCdKojEN5lRlNUsS803uKiBOlA/mGGHDhSbJ+Nc4vdlkPY1YGIum4oiY7yrYuy3qNJafNtJyMMTWk01DaVlfXl8IgKR17usvFnNp66juEnHJfSbm1DKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223920; c=relaxed/simple;
	bh=uUsxPFclkeG2visal3G9DOyVuTEjaGw/jbvnJw8zjvw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NIm4QPiX4R5XKV0xMTHTB6ncTXHW6PZViNkqHOUI4FCHAzl+QSGjQNVHzG6VeJzxjcjO5/nq7hmIOAzSrv2vxs7aFHFSKb5wCMCHEYu47mzcWEKez2YTks+2ZlJPvVgLv6CfVG+KkP2QHoU9ZOVX1rcjmemdun9PrV11Ff7tdWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5Ntz5a5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5Ntz5a5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FDD1F000E9;
	Thu, 16 Jul 2026 17:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784223919;
	bh=uUsxPFclkeG2visal3G9DOyVuTEjaGw/jbvnJw8zjvw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U5Ntz5a5aenf7i29c4F+S8hlB1ddtr1Axkb+3EBr7y+otyKYEY7xFlf5MhyHatx8F
	 StKgIMOTxGs4cEudq9olbZyj43ZIOv09TYeaSv6gbXgcfqZTrQhfOybE+kB+ies5QT
	 Gmrnb9/EBgstR7U2ZRomrxdIBBo/sCL/UtPhkh1wNrQiEpXSKflarv6yacviSWpX4Z
	 so08r615daf/+U9zs28Fng+841s9rzZDCi7nMyi4U6HaPIMupokDiZuoaChwaec3p6
	 cw0i6Oa4BMtDeOWpU5/fMA+QAqG4QQ5Q1+J0CujVEpw1CXV/p5cnOpBF7yClUzrf2r
	 DQypRDA/dmiow==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/3] dt-bindings: iio: proximity: Add Cytron HC-SR04
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGF3ZcWCIFdpxZtuaWV3c2tp?= <pawel.wis.me@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <bb79ea1b842e062dd47bd1fb31fdd15a9ef76c29.1784221074.git.pawel.wis.me@gmail.com>
References: <cover.1784221074.git.pawel.wis.me@gmail.com>
 <bb79ea1b842e062dd47bd1fb31fdd15a9ef76c29.1784221074.git.pawel.wis.me@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 17:45:18 +0000
Message-Id: <20260716174519.08FDD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to update the trigger GPIO description=
, but the patch does not actually modify it.
--

--- Patch [2]: [RFC PATCH 2/3] dt-bindings: iio: proximity: Add Cytron HC-S=
R04 ---
commit 319a9ebb7272df447013bc727d4e781b829dfcb0
Author: Pawe=C5=82 Wi=C5=9Bniewski <pawel.wis.me@gmail.com>

dt-bindings: iio: proximity: Add Cytron HC-SR04

This commit documents the Cytron HC-SR04 ultrasonic range finder by adding
the cytron,hc-sr04 compatible string and a reference link to the existing
devantech-srf04 binding.

> Add the cytron,hc-sr04 compatible and a reference to the product
> manual. Update the trigger GPIO description to account for the pulse
> durations used by the supported devices.

[Severity: Medium]
The commit message mentions an update to the trigger GPIO description to
account for pulse durations used by the supported devices, but the patch
does not appear to modify the trig-gpios property in the
Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml file.
Was this documentation change accidentally omitted from the diff?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784221074.gi=
t.pawel.wis.me@gmail.com?part=3D2
