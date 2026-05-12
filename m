Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0BF249EB
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778547707; cv=none; b=KDjIOcZSsijdD2i2KnDNx4cqFNNOuMm/wZNjYDnTYbRpbxomwmLYqBFIzcy0uRDTy602QAuSN98WLCajDpk4jpBrKhAmcgnvy4QYH6ecR7dQ8+NQxKd8W+4YrGGIWsJasi1gx9OABXZJCm515/UdiJLKrovxCR9/EcykxMCEWns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778547707; c=relaxed/simple;
	bh=ZIRiAU70JB32C+/ATezcfVcoDyHQi4En2IMRySdmCfw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hhThtOTEEgdXt7QTJS8CaoNUu0olD0t+qkQEyt/9mJP34DXbvnipPbSlfX70Ht1sua0kJU12U5+ma9l1NOtiEwg8jpmwGX9fVO9Dfsy/QGNjuOW/jmDkrx2Eu9aF3VN0K3sfpbce2Ywj7g4u7/M26x5BgGR5leOh6s/5XfVXiDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+XrbRdU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+XrbRdU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AFD3C2BCB0;
	Tue, 12 May 2026 01:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778547707;
	bh=ZIRiAU70JB32C+/ATezcfVcoDyHQi4En2IMRySdmCfw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=R+XrbRdUR1lnOj6C7fTzLnl/Hl5HIizAUC7WyESVFqntx568P1BX/yqfING0p4K9v
	 PTp01DZ0240HebHLcVdXjXnTdM2qCHkmiux2o/eYMzn984tIJLGcWb7wGDoATqzPrx
	 N6EoiJTed2EMAipcWz0K4Oyaw2tCrVRJqf4weQclD+WVRHzKRxnsQ9t2jS+KODLjzn
	 oq22oEVo9ZwF5tqRDWLkGIqvUWjQJO6lpv0oc6WLoow0CkJGs269ALsOr6on9t2Ofe
	 w98fIQS4Rv0Jva/nHJM3ZnUEyHq+kBnElMuayJUbbwL4Inz63iTMIPtzYhBciVdCr3
	 gUyy1/FpBEzDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/8] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
Reply-To: sashiko@lists.linux.dev
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-1-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-1-ae48c0b2b2cf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 01:01:46 +0000
Message-Id: <20260512010147.3AFD3C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message documents the UHS pinctrl state as `state_uhs=
`, but the YAML schema defines and enforces `uhs`.
--

commit 9737b985fb2ae6422b14964720c1ea756e86a00f
Author: Iker Pedrosa <ikerpedrosam@gmail.com>

dt-bindings: mmc: spacemit,sdhci: add pinctrl support for voltage switching

This commit documents pinctrl properties to support voltage-dependent pin
configuration switching for UHS-I SD card modes.

>     Add optional pinctrl-names property with two states:
>     - "default": For 3.3V operation with standard drive strength
>     - "state_uhs": For 1.8V operation with optimized drive strength

Is state_uhs the intended name for this pinctrl state? The YAML schema
introduced in this patch restricts the second item in pinctrl-names to uhs,
and uses uhs in both the examples and property descriptions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-orangepi-s=
d-card-uhs-v9-0-ae48c0b2b2cf@gmail.com?part=3D1
