Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F453D6CD9;
	Wed, 20 May 2026 10:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272908; cv=none; b=OAGpy8eY2s5R4GQ2IMOK4JflZFOtpdYz5N57GRatY9OqWY+PYTOUSqHStD7dDU+teCm5m/Cty4quviLEEHqwfQ1v9nz7/Uyah3p8TAp3kiwQ5QP/Y7yWCJ9/G4dTP2cOHadR2nCrQkhoiUEmdUt9RtgCWU1izjGB1nqQkOuu7EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272908; c=relaxed/simple;
	bh=h1zyB6UrjhgJNdnqVX89aB4kVmudzAKnX1hmADtRzuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADz5tLA8VmALfM1gypPBbQl+1lHBgQ/bTJrGH3aKYB2ceHFGPAiqoOc1+PKIhIfofSW2fCAfy0EBuVd7C1sVK7mYd1HIot2qiebeucl/UsxyN+Ml/YbD6ekrq9hWR2fvAKjOFjsfl5Zs9qOkgM9J8Tw9y6IKy5rmdrUHol+78lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QS8bjJDq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QS8bjJDq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F7B1F000E9;
	Wed, 20 May 2026 10:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779272900;
	bh=h1zyB6UrjhgJNdnqVX89aB4kVmudzAKnX1hmADtRzuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QS8bjJDqqJ7KI1cS2ioUn5uOsEt613ettnxgKQcCxW2G41bkTORdyvDA11epKlU1v
	 dauIaq3gJhalF8NbZlxD+sqvhBOk/ZIETIN+FhYIuIOMZtthnlftjGlyqK5bdTNwMy
	 iqakRTzmlFl4hlBinK/O6OttMvIXYUCkyrMhXMOwI5ERDZShqo4sVD2tzu3o8VKbSl
	 WaV6yDyjU1xWCl3X5SdO/Z2n71f9MaeLB7mn8hCe7t9vakeBOk5/83sIDPzkGuK9xi
	 SvdcYS2GavStJ3rxKs762IhgR0SgrEPBKfkK/uQIz9E9QXMCQhJtZ3+/G20E/mv6lS
	 E2/ayc8sRGDjw==
Date: Wed, 20 May 2026 12:28:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: Saravanan Sekar <sravanhome@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: regulator: mps,mp8899: Add binding for
 MP8899 PMIC
Message-ID: <20260520-calculating-ruby-pudu-1b6ac6@quoll>
References: <20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com>
 <20260519-mp8899-regulator-driver-v1-1-30d14421b7f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519-mp8899-regulator-driver-v1-1-30d14421b7f1@oss.qualcomm.com>

On Tue, May 19, 2026 at 11:51:05PM +0530, Vignesh Viswanathan wrote:
> Add devicetree binding documentation for the Monolithic Power Systems
> MP8899 PMIC, which provides four synchronous buck converters controlled
> over I2C.

Ah, and one more, standard comment (so you could have avoided that
easily):

Drop second/last, redundant "binding for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Best regards,
Krzysztof

