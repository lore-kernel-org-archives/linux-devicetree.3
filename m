Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4D037EFED;
	Thu, 21 May 2026 10:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358893; cv=none; b=FRSRQHl+OK0h4ljq35UsxGFgt4fAd/f52IrdKt32Ll7m5gEZkoLaxnAhDOzWRSw5RX4wzkvEZ9rawCchFJqm7FBXa0lFD5c60ZYsNV2BPwjqqMbo8nibbhB/bAcx0ZsggF9I2vhQ7928zWFPaR/lYcS1IumXJw6r3DmLC+Xloy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358893; c=relaxed/simple;
	bh=VA8wzPj58SRKibIfDqQJr01ZU1OlQnyAh0yyRLm8gCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jm3q0dmpcpGUiBjyZp5drjJp5BzaJzfx8Fvf3O0xI78xzqYJvovlg6s+ltorCM7TXsdr7LbdTFJupCc8UNGmt0/TWcZc/bn0+eAdFHUggbqHPLSfTfDKsJOB/COYfTCuDDbsdX3Z5jpG6tdI/eDxYI4yhRKrkkAdc/DSqxVlqhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2ax8VI4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2ax8VI4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E1A1F000E9;
	Thu, 21 May 2026 10:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779358892;
	bh=GBXrZPNiMDVsw3q9wX2k5zBLLAeHEN5wlkqpavyNudI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K2ax8VI4spSfopJjH3Yx9Bq4xKpqd+YzdUEbuNykumMaLG1ueok0WGWl4Az5oEpHL
	 435dqkdWCX9a98hkzSJBQ2+tKv5g8xdEUn0xMMvPBen+zgmJSJYZyxkaZfR4yAi0bj
	 h9xuoqmD2GbZykfq5D1gFs21pDCJvjmONzrg7gJdvNuYfosgh/opuV1vVhOHDFX+E/
	 E0L+wS6y9O53/yT88IQiOH1ERH4NUxMCNnAPPaWEGGtyE9RxujhhdXg/+aOaP0szZ4
	 4IeJUg8D3ONn+qhEuq/2mSOFNp8iiYiGJubk4rpgP/ZwUvxfOXxI4rG724pKdV5ZP+
	 hZe3oWErJv+AA==
Date: Thu, 21 May 2026 11:21:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
Subject: Re: [PATCH v4 2/2] regulator: add SGM3804 Dual Output driver
Message-ID: <6689f2b6-b369-4048-be65-4cee6d653533@sirena.org.uk>
References: <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-0-7495e7905693@linaro.org>
 <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-2-7495e7905693@linaro.org>
 <91ace2b7-a0c7-485f-a464-d7db397e0df7@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kYhjOXVScMN5u1qL"
Content-Disposition: inline
In-Reply-To: <91ace2b7-a0c7-485f-a464-d7db397e0df7@linaro.org>
X-Cookie: No shirt, no shoes, no service.


--kYhjOXVScMN5u1qL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 10:17:16AM +0200, Neil Armstrong wrote:

> I checked the Sahiko review and the reported issues are all false issues that
> won't happen in real life.

> Do you see any parts I'll need to improve ?

I haven't looked properly given that there's two drivers for the same
chip in flight, like I said I'd like some agreement about the way
forward between the two submissions.  I did see you follow up and no
response from the submitter of the other driver.

--kYhjOXVScMN5u1qL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoO3KcACgkQJNaLcl1U
h9BHTQf8ChY3m57LRkARGDNtrR4lTR3StdC154K7c9WZGrBS4z8BAkDL3OSO2Kw8
ilplppTsmaTenJt2rbvHmXiHdY5WtuzQN1Ex3B9cVFbSvgF5rZVC6df3TR17FnCE
Ah/rvOVP5pIGMExhbiF+A/N957Ph2kE2LbytBCG7d0Ixa+1mAQUcTKUy591cG49u
pY9lb10vUDh1xJCp88ln239KVf48ZiBoGTul7X2IoTgtOev+bnYN8mHdEARoDWkH
Ahms8Ye+7lJIgoiCm9l+gWDpSxbnB7Ix6wb94O5jWk8BJpL7T37sUH7Dn8+RAG/j
cwi94yKk3On9XP3vg/vIcQqSi7GUQQ==
=Opcn
-----END PGP SIGNATURE-----

--kYhjOXVScMN5u1qL--
