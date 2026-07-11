Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AE825393E
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783789256; cv=none; b=Z1OHwOqt7LdHo8DZMrHHvyNsOT/yaAfGwUeayas1KOElIT8UugpUapbjmPMnLlkkYyShybRWOLa/2Vz7YJzGP/jBCMMvZ6eIJ9arAUA+j8JgWTCFSpvczoxXdubqeTeMgBAb5E0FIkwZ5DlYkxQhRjYA0BIqzxKDsuOqoEQPMgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783789256; c=relaxed/simple;
	bh=NYXr/Zymyb9NIOnymw6OygCU1gJWUA6GFpPDgwT8Z0E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qRZCvzCxtNmt6ZiMj6zJb1X7hvKKZ+kwDncVCnHlMsSLrPofmrmpcjazdKs91/+fU7H5og6piBkN6vGeNRbQiYY0yDbn6YzttLrj4GAqHNhk9jGKZVOEoDiKZ11gFOO6uJSTbZMYVGneKT5kt7hNQCKVCjHkEwcEP7l0MDqqE/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJiF+pTP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJiF+pTP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785A31F000E9;
	Sat, 11 Jul 2026 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783789254;
	bh=NdtVT8Hj2MpX7its900+qFkj9HjahZIZyiXH+xTsg7k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BJiF+pTPL4obELx8Ts806003X3f6J1wzSFgOiS9XDQQxzI00wOIREzYtA/K/TmFsg
	 dKOQjQohCwKk4y09xb6eydB9f+FwBteXxZtkU3cSRhxMLPyO98NUxtDMvGj4Ap3yod
	 7NbaaX74pz17M/7qAf4OZtVJeAEpmnZf2146j3U5O9VyKj876jlLgq45+u325nBhwL
	 lG9tse3ay2VQOvGw5yPZtVjDWBYkncKT1UKHQc6dWkiMi3mpTv3Rwgsxv4o9sWD6EQ
	 xtpKAhm1dyMo2a8AD46K+LdbazK5zi7BulIltWRawSk3ftaQRT06is2uO5hAqrd7oR
	 GvNrlc6mLYhLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/6] dt-bindings: phy: motorola,cpcap-usb-phy: add
 optional safe pinctrl state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ivaylo Dimitrov" <ivo.g.dimitrov.75@gmail.com>
Cc: conor+dt@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org
In-Reply-To: <20260711164754.185565-3-ivo.g.dimitrov.75@gmail.com>
References: <20260711164754.185565-1-ivo.g.dimitrov.75@gmail.com>
 <20260711164754.185565-3-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 17:00:52 +0000
Message-Id: <20260711170053.785A31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to document the 'safe' pinctrl state u=
sed by the CPCAP USB PHY driver, but the driver itself never references or =
uses this state.
--

--- Patch [2]: [PATCH v4 2/6] dt-bindings: phy: motorola,cpcap-usb-phy: add=
 optional safe pinctrl state ---
commit a9d2c62cbbf0fb6ec2341d2c0459bff90670c671
Author: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

dt-bindings: phy: motorola,cpcap-usb-phy: add optional safe pinctrl state

This commit adds a new safe pinctrl state to the CPCAP USB PHY device tree
bindings.

> Document the optional "safe" pinctrl state used by the CPCAP USB PHY
> driver.

[Severity: Medium]
Is this commit message accurate regarding the driver actually using this st=
ate?

Looking at the driver implementation in
drivers/phy/motorola/phy-cpcap-usb.c:cpcap_usb_init_optional_pins(), it
appears to only request the ulpi, utmi, and uart states:

	ddata->pins_ulpi =3D pinctrl_lookup_state(ddata->pins, "ulpi");
	if (IS_ERR(ddata->pins_ulpi))
	...
	ddata->pins_utmi =3D pinctrl_lookup_state(ddata->pins, "utmi");
	...
	ddata->pins_uart =3D pinctrl_lookup_state(ddata->pins, "uart");

The safe state does not appear to be requested or used anywhere in the driv=
er
code.

Does the driver still need to be updated to support this new state, or could
the commit message be clarified to reflect that this is laying the groundwo=
rk
for future driver support?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711164754.1855=
65-1-ivo.g.dimitrov.75@gmail.com?part=3D2
