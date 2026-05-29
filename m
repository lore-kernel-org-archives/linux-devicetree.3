Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98FD3438BD
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780057397; cv=none; b=YlzJ7mRl90K9trhAMUR5PLorQMcqz8ZU09aHZRKuXF4adrIl2BzSI53Tmcxi69h98Ld99VB4JcRArvkyoMO7ATZQZEdrrM4lyAJHRMepsHp6d2dvlfl85qsHzoOBnYjz+fCk76ENrsD2ottUCk3K/cH2ptGYtTHN5SAhXMdEHn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780057397; c=relaxed/simple;
	bh=A2o5zXfKCu7d5NI0LUK/oIf/V6wuvDEUzAFoCeBRQa4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n2tldl0EdkmGWJNS4ozKU5z185e5Gj9joOg3xy6lrox8Fzgn3rlHbIgcFwpeKU/s15F+yIUcpgSphabM7ZloSJDwD2LcXmpHCi5BScFCMbzryGklYT+ZRjJHg5nOIspEraaXsFOZ5e499n+/5sNtncdafL5gptF1Dq3EAhK5Fbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=if2mDObz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="if2mDObz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E061F00893;
	Fri, 29 May 2026 12:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780057396;
	bh=A2o5zXfKCu7d5NI0LUK/oIf/V6wuvDEUzAFoCeBRQa4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=if2mDObzHy3AGrIiy1XjTN8DXuQuJbBy8LubkFdToS0KI5UTzx0IRrgax88Xyg940
	 960ml248rkhsPJkQTWJMlKRBP56Mhkz9Tf5sKVCmPtNxMyphlkuxYnTFacOB5dstPb
	 +gydqsaWzVexr7Ya21KnFHyugaIrsZoJvuAiG3L8b4jMCjkiljgcnUy4ytFgWQwy/F
	 TCVA4fUZBEKuI+ANYLtd+4kKeBEgnRvr5txTHM/S+vfv56kbS5z9vSzrWB0lIjHtRL
	 ZlcEWCRPT7MxqtFBtLTn30TiuPR2IXwfO8YrRe6V9BjQbwYxM3jF772J2o+vNO7Cl7
	 9DhyO8+ArWuFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 2/6] Documentation: iio: add Open Sensor Fusion
 protocol v0 reference
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529121005.1470-3-kimjinseob88@gmail.com>
References: <20260529121005.1470-3-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 12:23:15 +0000
Message-Id: <20260529122316.26E061F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added documentation file `open-sensor-fusion-protocol-v0.=
rst` is not included in any `toctree`.
--

commit 6378b8f2ea4ed104155c2c56a270addafda38309
Author: Jinseob Kim <kimjinseob88@gmail.com>

Documentation: iio: add Open Sensor Fusion protocol v0 reference

This commit documents the OSF0 UART frames and the supported RFC driver
subset. It also extends the MAINTAINERS file to cover the new protocol
reference documentation.

> diff --git a/Documentation/iio/open-sensor-fusion-protocol-v0.rst b/Docum=
entation/iio/open-sensor-fusion-protocol-v0.rst
> new file mode 100644
> index 0000000000000..80852f4cf4f1f
> --- /dev/null
> +++ b/Documentation/iio/open-sensor-fusion-protocol-v0.rst
> @@ -0,0 +1,308 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Open Sensor Fusion protocol v0
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D

[Severity: Low]
This new documentation file does not appear to be included in any toctree,
such as the one in Documentation/iio/index.rst. Should it be added to an
index to ensure it is discoverable and to prevent a Sphinx build warning
about the document not being included in any toctree?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529121005.1470=
-1-kimjinseob88@gmail.com?part=3D2
