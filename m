Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF3339F184
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748286; cv=none; b=MBSjl3BOhWJd/j8EB/uXm6wvr3rNEtGROfv3Heg1kqe2wFdIywyMQu7Kdfl2rL3ptpH43J1UOg8lysb6YXm4ETo4eANxCYLwF9jUw2uXGuPfjiYEHQf4vASyqivVYoDsmpLUjx13Fl55Kc50SAOG6sNDtFcunvZQOIL9CqzuBDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748286; c=relaxed/simple;
	bh=JkRSRpddbxWRCraIBKDal8Cz2qYcwSuaZJOBsTkFy4g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OxJ7MZIcxhAQbwjQMjzkKZ/GHlkZ/CXgyBCd6XVT+evwRGwBjsXsk5ObjF6cwtIAC4qvWYR2fgtXecpLsduwVKSW2KgY0YVxuMv9Qb/eT0IGKvsy2L1rVOTzmzdZPnjRqmVhWFSpvL15J9o4+gnq4XD/MwGWTtN7NYodE1vMuSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUFAvZhe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUFAvZhe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541801F000E9;
	Mon,  3 Aug 2026 09:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785748284;
	bh=3AELEI/cT65N6XmJo9wOlvndEY1H2ieBkSFHYvrJIn8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nUFAvZheSkUYbgFSb7ez6XqYPmhb9KbPMg0UPByj9KHATRp4tf8+JPy0le6ogZY6g
	 Gjn8AR8ya1/bzGgYCTEvJvpbcDLbz/G8le2VAZj+WWG6EiBpTgLhzSLP4dYnwg1X77
	 IAkembAh0PdGHoOpHlQiDEiIu1hZ2taC1Rysc8zXiBVhT8kAurv0Y567oxEd+ns185
	 Q8DDfHvcy3zTqFKU4BA4CtmlKN/NGx/8BOp7kRwLFZuH3kDC2ucFGJn5lRUjgrjzRu
	 S2IWkhfdyaEF/67cpT8TKxLY0XXiT7F/4q7eyXSboFIC37JZZDlefUJbUtI/Xi7qix
	 5yU2Mq4a7kFBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/11] dtc: dt-check-style: Add test for trailing
 white-space in DTS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-9-6c9776928cea@oss.qualcomm.com>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-9-6c9776928cea@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 09:11:23 +0000
Message-Id: <20260803091124.541801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The test file `bad/dts-trailing-ws.dts` is intended to trigger a=
 trailing whitespace warning, but it does not actually contain any trailing=
 whitespace. As a result, the style checker will not emit the expected warn=
ing, and the unit test will fail.
--

--- Patch [9]: [PATCH v3 09/11] dtc: dt-check-style: Add test for trailing =
white-space in DTS ---
commit a9f7c5c65b57ce006736994c5d872356aea7725f
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Add test for trailing white-space in DTS

Add unit tests for expected warnings for trailing white-spaces in DTS
(there is only one for YAML files).

> diff --git a/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts b/scri=
pts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
> new file mode 100644
> index 0000000000000..ade160a443411
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +/dts-v1/;
> +
> +/ {
> +	compatible =3D "example,test-board";

[Severity: Medium]
Since this test file is intended to trigger a trailing whitespace warning on
this line, should it contain actual trailing whitespace? It appears to end=
=20
exactly with a semicolon, which will cause the unit test to fail because
the style checker won't emit the expected warning.

Could the required whitespace have been inadvertently stripped by an editor=
 or
commit hook?

> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-n-dts-styl=
e-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com?part=3D9
