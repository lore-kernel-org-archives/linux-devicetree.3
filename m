Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5296246AEE0
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843034; cv=none; b=eyitu287K0kR7cTPBRzzJiAG6NlH66m/VLdHGNwHpi1cNccX94P/Db0bGNGtDx8vLz+b5vpCNeZw2T3OCvsHYTbx9m951as0zRm8Ti4YZllhIIyZPv+IHjh4GbENKHhluQAukOei+IZauPL8NmZVS/ZGI9dG+duFo+vscyCPGOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843034; c=relaxed/simple;
	bh=17UL+rO//Pn0zZTLnxBMJ4OwuoY8QnqZ5efcU6m3p2c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qFNzaq7hp0E3fbF85EKZiJ0iFv9JzyRvu/d3vq625ofsYwjmG59S7Xek1egbFS6Kp0wM8/eIDuzlA/VhewlysTLH+7gO2Mb8EvSdlZNqKB1xHzxLD/Wl099bKU70mRA8wWoz/Tr2mM1yOkiZSh3g+KUaFiXqVRYRK7VpGRazjlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+6mUQ7K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+6mUQ7K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76B1C2BCB7;
	Fri, 15 May 2026 11:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778843034;
	bh=17UL+rO//Pn0zZTLnxBMJ4OwuoY8QnqZ5efcU6m3p2c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=g+6mUQ7KY2nu5HoArPmd7o3MaB+9ijI6VrwcWb11BOcwogg/C8i3vMZTq9SgMpbx7
	 gxODjIhB9hKO3Zj8zCcAeQD5TmnaA7MUZdzokZYtdb+WHb6PecB0JpXCTw8fVKAJBZ
	 QsBL0WupmvAKNO1W/RduQYx3kO8yCpE8CMSqp+LOjNZaiINiM8H25WfAasBtEOtVtb
	 GEsVzELQFvHRxAtBOvzNODa9d6It3JIRvC6XV6DEqnr8iz+Fee3wi6m5W3lVgy5QuA
	 Csu6C9tCxLykZJUfCKqx1LFHzTZF0mjTRUtZyVCDn6AjbBAcoNhi5W/BzM+WO2hr6N
	 YBwOkkJ5EJUkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/11] Documentation: leds: document pattern behavior
 of Samsung S2M series PMIC RGB LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-s2mu005-pmic-v6-9-1979106992d4@disroot.org>
References: <20260515-s2mu005-pmic-v6-9-1979106992d4@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:03:53 +0000
Message-Id: <20260515110353.C76B1C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Commit message incorrectly states hardware patterns are defined by =
led-class-multicolor
--

commit 1b79c23516198cfccba5ce3380153d7da6c041cb
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

Documentation: leds: document pattern behavior of Samsung S2M series PMIC R=
GB LEDs

This commit adds documentation describing the hardware pattern behavior for=
 the
Samsung S2M series PMIC RGB LED driver. It details how the hw_pattern attri=
bute
parses brightness levels and durations, and specifies that only indefinitely
repeating patterns are supported.

> Add documentation to describe how hardware patterns (as defined by the
> documentation of led-class-multicolor) are parsed and implemented by the

This isn't a bug, but does the led-class-multicolor documentation actually
define hardware patterns?=20

The Documentation/leds/leds-class-multicolor.rst file covers the multicolor
class grouping and brightness control, but doesn't appear to mention hardwa=
re
patterns or the hw_pattern attribute. Hardware patterns seem to be defined
by the pattern trigger documentation (leds-trigger-pattern), which is corre=
ctly
referenced in the newly added documentation.=20

Could the commit message be updated to mention the correct documentation fi=
le?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-s2mu005-pm=
ic-v6-0-1979106992d4@disroot.org?part=3D9
