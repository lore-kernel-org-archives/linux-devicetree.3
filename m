Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29403998B4
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299080; cv=none; b=uXd1MooLvc8nDWTMS55H7UyJEonSz0+Sz8jUm6pP3L0Juu1lViK82Wu+myHPDIp1M0zcLcMfgMco7IB4kfxmZXAezTGUe6kdLAXJodw85d2AIK+yB3xqgEnVwOuE0S2Y1Ud2wCimsY0KuF4Q+EK7Rbbd4IuiQt1bA+jFDPn9r5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299080; c=relaxed/simple;
	bh=X3MH+R5v/qXlFDCXfbXldRgr0OyBZKAdbht5rGYr3y0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nZKby+3GeMmIzK7gfUYahNK5kZqVt3sEHg66+A00fXMlTV52FAIpOwQAD35zygcJhbnLuvB4Pfqs0HOHIuJtn6aTjhYy4F6Q0tJWW9C9ESagpeWudjQcZrskTnEHufqK+pTUOn6p86zZ+RjxCkv61DAqkq3NQRkuG9hKZIacxcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhpKF5Ge; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhpKF5Ge"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF551F000E9;
	Fri, 21 Aug 2026 07:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787299078;
	bh=X3MH+R5v/qXlFDCXfbXldRgr0OyBZKAdbht5rGYr3y0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XhpKF5Ge1bmRVpYxB/8RIrhHnNt69CCQzDr4+WfcK2nLwkSucyVb0k2AuPw5tQ7z7
	 jqY4Mvc3y/5La/CBpY9+qr/NAtdzd2Kaw2IKSB3Rzr6q8ijKZegGpagblrP7ruYDHR
	 HNucC3gOkTfUDKdRkYhHefFrg8xF0hbK50bXkm1Y2/POVes797Dk/TJn/ZTUmcfd4U
	 vOlbrioUaakUKmRA0FKmgQWMv1Lcb8EzMSmRLW+0dNOprIq/oLCCkKVq8vKiyoS2wI
	 R/VnA52d5L1uX8nrN0PTxAQVeMfqT0sEgoA+B5tjdRlwf27+Sf/MLtdmiv0PEMaR2/
	 e8rfuvwuGKJ9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: thermal: amlogic: Add A9 thermal
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260821-a9-thermal-v3-1-0e7abf3941e3@amlogic.com>
References: <20260821-a9-thermal-v3-0-0e7abf3941e3@amlogic.com>
 <20260821-a9-thermal-v3-1-0e7abf3941e3@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 07:57:57 +0000
Message-Id: <20260821075758.4BF551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message contains a typographical error, referring to the=
 clock as 'plck' instead of 'pclk'.
--

--- Patch [1]: [PATCH v3 1/2] dt-bindings: thermal: amlogic: Add A9 thermal=
 bindings ---
commit 49a4951362b7daffa63163bcd033f80c3c836b83
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

dt-bindings: thermal: amlogic: Add A9 thermal bindings

Document the thermal controller compatibles for the Amlogic A9 SoC. Describe
the required core and pclk clocks and update the schema constraints for the
A9-specific thermal controllers.

> Describe the required "core" and "plck" clocks, and update the schema
> constraints for A9-specific thermal controllers.

[Severity: Low]
This isn't a bug, but there is a typo in the commit message. The commit
message refers to the clock as "plck", while the binding schema correctly
defines it as "pclk".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-a9-thermal=
-v3-0-0e7abf3941e3@amlogic.com?part=3D1
