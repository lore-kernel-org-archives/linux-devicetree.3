Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8082C156F45
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660715; cv=none; b=YWU2xu5+1ZYU7OUi/DtuYpOyUuwgknGeJ8XKbWWjKa5GgRuTEX2I6K6WlU9vPheVlr/QYjxiRJQOqUkvD2SuU81ilxUwz7u2IpvcY82KNEacvZ0vRzl787Sy8RdIe8KNcXNeZZmd8EI4HPekoYtcfkFFMZxKEt5NyBm73uqtB+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660715; c=relaxed/simple;
	bh=fiBbHbNZK68TYusIBgUWxnZBh1D+EPa0kIL6oD8mZLw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dBa8fzbFJFv9scBgpgaNwsRlPvfQydtR9NtiWktTY04Lwo4eSlM1udUql+1+dLiMnR3n7ylWEJcnW30Ol+DcjGQ++MM1+kwsK5gB3qWLG8W+sXSNdJTqykaUGIzzwnEMx3+civzRddW3iUj2s0/SliuPxB5+ZxAI/+Y2sqRjywM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZ+DOdyY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZ+DOdyY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15A11F00AC4;
	Sun,  2 Aug 2026 08:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785660714;
	bh=jc731b5SJ6WhTvvU5CpPUqmU0g48wr3BFrgIXLIq/y4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TZ+DOdyYIVvHylWxgT9x10rbDwnaRnnNmCYantgbEmNnfsAVS+816fC90DumXd4Mf
	 U3/NtL8CNAMdXP8O/kzQuTRD0EWNXrESeBzZcpYD5Q643SCmCxEyPfDjGM9N2LRnCp
	 GYoerL9UlRB83H5xWcC96icnHArKUXxWTqFQzuQBEuGqylOKQ0FuA1GU3d6BMLN5Z/
	 pr7iht+Baj4RovsfAiGYI0Ow3QCfu20ZHiI5ICOtI9q+lDjmsl+buYEDbpj5ZqwhEW
	 58JHopMfWEloQB9j7dWAUM3hvtHLH/uzLlkfnqhDmIup3SS47FL1ph86KnLoSLsP2q
	 BAHHwaIzmnXHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/11] dtc: dt-check-style: Add test for trailing
 white-space in DTS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260802-n-dts-style-checker-continued-v2-9-6c5dbd1ccfe4@oss.qualcomm.com>
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802-n-dts-style-checker-continued-v2-9-6c5dbd1ccfe4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 08:51:53 +0000
Message-Id: <20260802085153.E15A11F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added test fixture `dts-trailing-ws.dts` lacks the act=
ual trailing whitespace on line 5, causing the `dt-style-selftest` to fail.
--

--- Patch [9]: [PATCH v2 09/11] dtc: dt-check-style: Add test for trailing =
white-space in DTS ---
commit 3e2aba218fb9c00665540524f4c175b2ed9b26cd
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Add test for trailing white-space in DTS

Add unit tests for expected warnings for trailing white-spaces in DTS.

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
Will this cause the dt-style-selftest to fail?=20

It appears this line does not actually contain trailing whitespace in the p=
atch.
Since the expected output in expected/dts-trailing-ws.dts.txt demands a
warning for line 5, the test suite might fail when the warning isn't genera=
ted.

Could the trailing whitespace have been accidentally stripped by an editor =
or a
git pre-commit hook?

> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-n-dts-styl=
e-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com?part=3D9
