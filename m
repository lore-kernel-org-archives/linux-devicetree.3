Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A087224F3
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 09:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779010221; cv=none; b=i87cNO2P8ldrNOp9yfpKCQFh6kUMEYsjoPu+cpFspgrC+eP2triC2e2YxKGRe7gZSQf5cz2lt7fVeJF0JIgr96LP+GvuckJE8RZUsNJD/sqKLkk+gQLCD9gOXzwHiLFhWYv3K/9w9OI0GGv8ob7OmmxAsP6ODULQ5yuXPWgjY2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779010221; c=relaxed/simple;
	bh=KpkrYG8LLGGLY7peDOVKCVcfmxoFdwoPCIbQT+o47HY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C79/GnobwtiLWAnSIq7xc/eZxmoh2LIv9Mlyq9ABl46pb5gKGdlAUPsFCgWGDdZD81wzlNv/1HKAU2NWHfzt10W1aazjzddkOmTWoQR8W41Czou5ypNr9lp0HkFi4yZfNKZjD5KgOw/3shzBouclr3nUj9FPNaRaLJLzkgGkQgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bu/DrJAf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bu/DrJAf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5FBC2BCB0;
	Sun, 17 May 2026 09:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779010221;
	bh=KpkrYG8LLGGLY7peDOVKCVcfmxoFdwoPCIbQT+o47HY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=bu/DrJAfiKe3r1mvPGvqaTnKtN65ULtoQVnn80e6YKeTUmzWDIgfW3lFmYx/dQ76l
	 bJv0azkYh2hoTYXPbJDf05PIKDj2oDSxBYae6IX8vtHbIRulg7rW/+VsB14rFUv1rB
	 Y1xZ4XDUW63WKMlEnL+Uw6DnvGPQgQewcbR/Dg32GsmfqhuXDJFWzE56qvsgbVURkG
	 8JHH7X7/HTcm/+0/e/Od/CNvtiVLuCxTVDYBUolhOUidftn0YDsV3KElD99t+FTc2j
	 aB8sy3Lo5+30IT0tSBIl5skPDPVuB993TJnwxkY2ose1d7RQ8vu8wE5FpdUnzUc/Y3
	 OubDCXRU6m6+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 07/12] iio: test: iio-test-format: add test case for
 decimal format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260517-adf41513-iio-driver-v13-7-bb6e134a360f@analog.com>
References: <20260517-adf41513-iio-driver-v13-7-bb6e134a360f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 09:30:20 +0000
Message-Id: <20260517093021.2D5FBC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message references a non-existent macro `iio_val_s64_=
array_populate()` instead of `iio_val_s64_to_s32s()`.
--

commit 193968c85cf343f53a134b72d9051e73bf8ed534
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: test: iio-test-format: add test case for decimal format

This commit adds a new kunit test case for decimal value formatting
using different scale types. It also refactors the integer 64 test to
use a helper function for populating the values array.

> Add iio_test_iio_format_value_decimal_64() kunit test case for decimal
> value formatting, exploring different scales types. Also, the same
> iio_val_s64_array_populate() macro used to populate local array is used in
> iio_test_iio_format_value_integer_64().

This isn't a bug, but the commit message references a macro named
iio_val_s64_array_populate(). The submitted code actually uses the inline
function iio_val_s64_to_s32s().

Could the commit message be updated to reference the correct function name?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517-adf41513-i=
io-driver-v13-0-bb6e134a360f@analog.com?part=3D7
