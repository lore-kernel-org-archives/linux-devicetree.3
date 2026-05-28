Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9103FC5D9
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 18:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779991845; cv=none; b=T+A/VqIzxBU7Ic4VYRnZP6/P0g/6XxcDFqtJfWe5lBGGyj8p5yHUNhEdo0Q2/PYQO/wNO/aeX6y/uM9m63hoMZfmrMesSuKhF/YiQsWvvMq/tScvxgfSB4BSWYBOCOSuq1G7oVFx623TYTQFbId8k3md2mIxiA//9AcRxIgg7r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779991845; c=relaxed/simple;
	bh=B3EmYrjDHbx6LqCvnBSQB5cT1GXmGtuBMMbLJyNVc2M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aewrwt/l0V4y3gzBKMbRRe/v5OOCrKISZQEYbGaFVEQ01DJB/QjxZ51IfqWmTMMJrIOv/tTb6JjHqSDz7EqbzhgelL8i4coCsvvndypKVKev4IOSjDtrYOJZM65PJ5HgoSzTNxDzTTh0g8Y9y7vH6W/WXKk5moLK8iFAWs7iw40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwg02qyX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwg02qyX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA8C1F000E9;
	Thu, 28 May 2026 18:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779991844;
	bh=B3EmYrjDHbx6LqCvnBSQB5cT1GXmGtuBMMbLJyNVc2M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jwg02qyXLuk3RyL+EiN2nVIsmuGcqv1OhArmWJkQZPL+ENhLHojCpOWfoFnwGz2+N
	 XC4I+w5G07S6twMg20JMFNnar9IDvrohhBpHWOvdp5mQyCutQMH5KhuPa+5dDtGtLj
	 pfeP6tPecZbQYVh/6tvbxozzFiEoH+VVVF/8tSsEI3OdA7ZYhjXiqGN6Z1Zx27dBhu
	 Aecm85pa/dE6oqul0Z832yilw/NzNcyJC3h6exaUFZQgp6BbdIBiRAURcv+QtJN3w3
	 d2uosYHh2DVIc3ydiyxqzGmInV5zKBna3bzk9+qG8USSmSkgnQh5jO5frwQF+hLe4N
	 RpbvcB/Odf5Vg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] ASoC: dt-bindings: Add Airoha AN7581 AFE with
 WM8960 Codec schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528174840.28644-3-ansuelsmth@gmail.com>
References: <20260528174840.28644-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 18:10:44 +0000
Message-Id: <20260528181044.6BA8C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Typo in the commit message: 'WM9860' instead of 'WM8960'.
--

commit 2e862912f90e2fbb165cf085da96b1e3501d00ef
Author: Christian Marangi <ansuelsmth@gmail.com>

ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema

This commit adds a YAML schema for the Airoha AN7581 AFE with the specific
WM8960 i2c codec. It provides an example of how to define and connect the
AFE driver with the codec for full functionality.

> This gives example on how to define and connect the AFE driver with the
> WM9860 for full functionality.

[Severity: Low]
This isn't a bug, but there is a typo in the commit message where the codec
is referenced as WM9860 instead of WM8960.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528174840.2864=
4-1-ansuelsmth@gmail.com?part=3D2
