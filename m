Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D38742EEAB
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 10:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507767; cv=none; b=Gp8J3B3kyPCwwH7d9fUiVYJDydBYeVdWA8mCffbZu+TGayWnUEZLffva7yZf1mkjfxILVNdVOz1dojxaJoxb7JUes2RJb3Q5oWEPjVduGNg5pdhw9NKz36QJyu9MI699gzp6GHyYRT4AzxNe68NqHp6dBxbn93+NGR8NTG9a1p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507767; c=relaxed/simple;
	bh=bXtnWV6AXMg+r7nfQP8aBPtClw5Ev15iRgabAYJ42cw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k3f+sjxbBAp1ytChSKCki54WXfJ9Foe7r9vXUTUwC2A1ZL8aG8EqyUoN195xsXqDMV161FR8+765ripbsLlRiK4rD4CqSbI9vRB6vBifwxofNGGdT9sGNEkHWjnknseoaWa7dRLCOLLIju8ine65UsC5C7/B5YkQDoQCUaio5zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NETAA+i5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NETAA+i5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29EEB1F000E9;
	Wed,  8 Jul 2026 10:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783507758;
	bh=bXtnWV6AXMg+r7nfQP8aBPtClw5Ev15iRgabAYJ42cw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NETAA+i52DhKUy6mPaPSpiJlqFp5AJr8UCvbk0pTNKE3e2CzewEp0WDMQWe+le9HM
	 6QIKZ1dKgYBTgxh8Tpi2H+RGv/lp0Y8gQmouawdQTPIiRp3IYIVjVSyScgunzrgcZa
	 mxlZAXp7dJC8RtpZHms6jGSXhNyIEKKkpzoF5nTjoBZZ8715SwPkwcymE5dt0L2xXz
	 hafwB8MdPNlUZ/BvDfOWUeo6WKMDj4anj/9nuYvPHSmSy4mR3bkgHnwnLvr3qrxFBr
	 0coDFc6eCEHNFxmg6uFB5xsdG1GqNQncxQB1tiTzVB5eExVbblFsXYWzTgxHv5Xv0H
	 LjOKsK+zkscnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to
 dual-port with OTG support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: conor+dt@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org
In-Reply-To: <20260708103606.1462960-4-a0987203069@gmail.com>
References: <20260708103606.1462960-1-a0987203069@gmail.com>
 <20260708103606.1462960-4-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 10:49:16 +0000
Message-Id: <20260708104917.29EEB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Kconfig Dependency / Build and Probe Regression
- [High] Missing Wait for Clock Stability on Already-Operating PHY (Suspend=
/Resume Regression)
- [Medium] Uninitialized variable usage due to ignored regmap_read return v=
alue
- [Low] Undocumented Functional Changes in Hardware Configuration
--

--- Patch [3]: [PATCH v3 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to dual=
-port with OTG support ---
Note: The format of this report is altered due to recitation restrictions. =
I am providing a free-form summary of the findings without quoting the orig=
inal patch code.

commit 0f7c9811782335bab86ecc4c08f7f6a17839e8c3
Author: Joey Lu <a0987203069@gmail.com>
Subject: phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

Summary: This commit extends the existing MA35D1 USB 2.0 PHY driver to mana=
ge
both PHY0 and PHY1. It updates the initialization logic to support host-mode
clock stability polling and registers a read-only USB role switch for PHY0.

[Severity: High]
In ma35_role_switch_init(), the driver fails the probe if the role switch
registration returns an error. Does this break the driver when the role
switch framework is disabled?

If CONFIG_USB_ROLE_SWITCH is not enabled, the register function returns
-ENODEV, causing ma35_role_switch_init() to treat it as a fatal error and
unconditionally fail the PHY probe.=20

Furthermore, shouldn't the driver declare a Kconfig dependency on
USB_ROLE_SWITCH or handle the -ENODEV return case gracefully?

[Severity: High]
In ma35_usb_phy_init(), the driver returns early if the suspend bit is
already set. Does this skip waiting for clock stability during system resum=
e?

On system suspend, the suspend bit remains set. During resume, the PHY
crystal might have been stopped and requires time to restabilize. Returning
early skips the host/device clock stability polling.=20

The original code explicitly handled this by checking for clock stability
even when the suspend bit was already set. Could this lead to controller
hangs when the controller proceeds before the PHY clocks are stable?

[Severity: Medium]
In ma35_role_sw_get(), the return value of regmap_read() is ignored before
evaluating the val variable. Can this expose uninitialized kernel stack
memory?

If the syscon read fails, val will contain uninitialized memory, which is
then evaluated and returned to userspace via the role sysfs attribute.

This is a pre-existing issue, but the same pattern of ignoring the
regmap_read() return value also appears in ma35_usb_phy_init(). Should the
return values be checked in both locations?

[Severity: Low]
In ma35_usb_phy_probe(), new logic is introduced to parse nuvoton,rcalcode
and nuvoton,oc-active-high from the device tree and apply them to the
resistor trim and over-current polarity registers.

Could the commit message be updated to document these functional hardware
configuration changes? They are currently completely omitted from the
commit history.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708103606.1462=
960-1-a0987203069@gmail.com?part=3D3
