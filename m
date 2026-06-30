Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB3E3988F9
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782820117; cv=none; b=pyT4sGJOsd2SqSciL42Kj7TeTxGGB3Kh9yjuN2tTkZk0pSBmCJ4PDNnKMJ33270Do4EAvJN5b1jtr8Y3Jm0zUzg2U2jrL6s6h/GFNc6XvrQxJPRRu0cUNJMCCF4mngpWc+m3iG4aw7gZyV8SetJvGO79gjicMnyPdwH0Hhb/IO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782820117; c=relaxed/simple;
	bh=yT8gmhVcNkXe/p++7bZmmPQbajYO/rNnkUXeBEww8Hc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QXbheCjdvk1F3MKLEMtVRVTOW78NttHwQbuuJ1sqpDBn0fiqgchnldWz5GdSjfMI20Ty24NS+UXUDpp7eFnbT2f9NG0Z7XvnNhYDGKTcTFu6dhqkZVxn/7KvC8MP0Lphrq032br6EVpjjRkNy5LJzohyHN6ylOR1+jp199Oc5F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IqS1T4mF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IqS1T4mF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77191F000E9;
	Tue, 30 Jun 2026 11:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782820116;
	bh=yT8gmhVcNkXe/p++7bZmmPQbajYO/rNnkUXeBEww8Hc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IqS1T4mFmJVL7ym75TOr8dh//vyFaklSZHjvjaRxyaPbMflcHxV8SiRzZhi1tOTNZ
	 hm1EQ4LBn+nFOmQdsbrHdGCGLpZFA3MGwOmJRlyFMY0j9uogLkfre2JSLOLwI1t/Ub
	 vcSo+yUj3Cy0IJAAEfK48AT8Io052lo2u/RD/0CWnlaM93MerxOfjyfB3wY4GkAX9W
	 Ojksm83J7h1o+slXH1PUH2aGiK427ID1AkqTrOKIv96ayKmBlgGby30XmjUeOj7ay4
	 K0VKfxwODFv9HxCdD6kgyTC9QiOzs5HZEWR3mR2lH9V724OdDSp5wVYTSwmir9K5OE
	 pQtDG1ThWWqLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: ls208xa: describe the Lynx 10G SerDes
 blocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260630110459.516364-5-ioana.ciornei@nxp.com>
References: <20260630110459.516364-1-ioana.ciornei@nxp.com>
 <20260630110459.516364-5-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 11:48:35 +0000
Message-Id: <20260630114835.C77191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Grammar typo in the commit message.
--

commit 12366d243aefbb596eb3d107281f15d8b29178c8
Author: Vladimir Oltean <vladimir.oltean@nxp.com>

arm64: dts: ls208xa: describe the Lynx 10G SerDes blocks

This commit adds device tree nodes describing the two Lynx 10G SerDes
blocks and their lanes on the LS208xA SoC. The nodes are left disabled
at the SoC level until enabled by board-specific DTs.

> Describe the two Lynx 10G SerDes blocks and their associated lanes found
> on the LS208xA SoC. The nodes are left disabled at the SoC level; board
> DTs will enabled them once there are consumers.

[Severity: Low]
This isn't a bug, but there is a minor grammatical typo here ("enabled"
instead of "enable").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630110459.5163=
64-1-ioana.ciornei@nxp.com?part=3D4
