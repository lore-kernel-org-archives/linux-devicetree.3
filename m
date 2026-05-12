Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9047E26C39E
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 21:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778621355; cv=none; b=pcHDX+DJZo8DaU+dU0gUymKrDal1s0tJ5Qsy0I2P1U3o8uZKjM43s+UHy/cSKq1IgAcO+fMvQ+Q17aZNgRffJW/INDmHc9U2KjDtQwRUDc0n8FL2b+Jx9Ki0kskW5KVrZxXtq/50UOkzOWXjVE04E14XsbDh6ip9mUOcfaUCdr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778621355; c=relaxed/simple;
	bh=Uv7Xo9qwihUD1rxgEBpYURZAat5atWHbjBsan2Jr5tw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FO9Tujq7ksXMeL8oeSmLx0jl4jst9Kz072Xqf40lSM2Rij8lqBiJFa7/K/FEDDanJRgr5/3YTNVfwAHnsLytdtMOOzJPVGeNAtv0SbCRPZQP8kzhsQLLAjXd8PW8G4ML46UBhvVsw4loNpb8j47pzm4oremkujbtRFDHQuSS03I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Em7y9gU7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Em7y9gU7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A34C2BCB0;
	Tue, 12 May 2026 21:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778621355;
	bh=Uv7Xo9qwihUD1rxgEBpYURZAat5atWHbjBsan2Jr5tw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Em7y9gU7bOXnFOoW6hFuKDkid1ZHZXB9tVZKO1IC5yR/HJX7ii1SoiNek4ayET6Jc
	 kP2I2cOY8YvpwWXqJAclU6KWcm0FugRT6ckF58G/ZUNASSUD45SlfYxsISWQPkM7tJ
	 xy+o3CqBeECRsSN+lt1nuTAYoX91LWkSpajo3+5c3WLaPjt9f5ZK8hFfbfiELF0tMS
	 zP0o0vYtl5VXqJ9aycua1IvBmY9EUu89NZCJcrswfD5MiOPEXISXyKKcJXreiWZebq
	 uy65aNT+H5+UJ676KGD0haEgO8cHeOvkMluwWMyhdKVWcK+1y1M3oO5mdAQQW/BitQ
	 pEldBNNXCzuDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 6/6] docs: iio: adc: ad4691: add driver
 documentation
Reply-To: sashiko@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511-ad4692-multichannel-sar-adc-driver-v10-6-e1fbb1744e38@analog.com>
References: <20260511-ad4692-multichannel-sar-adc-driver-v10-6-e1fbb1744e38@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 21:29:14 +0000
Message-Id: <20260512212915.05A34C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to include documentation for the 'buff=
er data format', but this information is completely missing from the added =
RST file.
--

commit bf768cbe74081c6f8c0f23dda3ab5e9fc4930fd2
Author: Radu Sabau <radu.sabau@analog.com>

docs: iio: adc: ad4691: add driver documentation

This commit adds reStructuredText documentation for the Analog Devices
AD4691 family of multichannel SAR ADCs. It covers supported devices, IIO
channels, operating modes, and other hardware features.

> Add RST documentation for the AD4691 family ADC driver covering
> supported devices, IIO channels, operating modes, oversampling,
> reference voltage, LDO supply, reset, GP pins, SPI offload support,
> and buffer data format.

The commit message lists "buffer data format" as one of the topics covered
by the new documentation. Was this section accidentally left out of the
patch?

Looking through the added Documentation/iio/ad4691.rst file, there does
not appear to be any section or explanation detailing the buffer data forma=
t.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-ad4692-mul=
tichannel-sar-adc-driver-v10-0-e1fbb1744e38@analog.com?part=3D6
