Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726473;
	b=qSEbWoC96vsR6vxmEL3wfBtmj5/5g+P46WQXzPURd7r1L7hdD0oyTA78zbjWGhFVrWDa
	 +cJWwPUTmqOm9Xy1FjyEx3PvGCCp+NBV/oZgle06GkGkmcqAaJbPuG4JTU9Tph4/9OWYn
	 eIMDBsxW6RGJ9c8ScCcFhKyoDo87lf6JAu+o6XJDP4VSfxCsP1O+vNrUrtcCN6ZJYavq/
	 f83Rr530+cyJ//GZG+j7LwZLb5cPSQJnfBSlxduZMpMRNzRpNG6HPHn+Ak380+reARkhV
	 wNVwcitRzJN2uE1vRjAz9w+fi7D82pjZ8ZEOj8qUKvi9Xjs++GJXe1clhA/UG03DN5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726473;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wbyyohroUfJew+9PHmtpl1ZnlgURGGAWrZIJKDCVhm4=;
	b=yNtkU+eigxLt5bhyJSGMhDXC93AyLOgKwnREqt3jo4zizw6JdsqRTQCr5ZNkAdcbDEnf
	 FLpo3Zzdvqmn8c3131VLM7P6uS+5jXDowUDLdPf9gFlhZ5DWJZyAGWFpG7tc5jSgw0iZU
	 Z5pD5e1JgGXxda41EGEleQ8GNxpAO9bDHx7GDT4zdxnexu1YoXPNADom0Yf+e/w/r9BwP
	 mlJb53b6nD9Jy/r9zkCut4LCvlSM5OR+SlBJT7G7C0eteV03DwaEtezeM0BMXEYIzoiBq
	 Mxjuk9PbCu1rnVOmX1AyIR7dj6L3H0rCrQx7Rd2+jXe7wHilPEJY8B9hilXnRTux/kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OabqWhc8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209B6606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OabqWhc8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB271F000C1;
	Thu, 26 Nov 2026 20:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795726472;
	bh=wbyyohroUfJew+9PHmtpl1ZnlgURGGAWrZIJKDCVhm4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OabqWhc8Jj6H3G067D3hzwZAXb5I/JtZOw0yPDA+sf200eTRdNskHu7YI6zDaTLjZ
	 APgPid9JZ3ApNR9UrLqFVNyt97m0baK1fe8bDEgQeQNQrnRKbNoB8xEvt0gtq8ysxQ
	 XrQQzTF0FO7GZ3x6HsLQXCLhurDZbvft5P9pbeWFtn0eHTKjo/CKAD4pO5ccfURJG3
	 LU8f4uCZAjnmoisKZL9FPzH8pAb7s6rGJHCFUi1CFD1K7HWDBLiRoKOS08ottso6eT
	 d4Y9s68e66bAtA3ljrkQqQ+tD96kpV8r42msEcjkgaUJXon1a7UX09YNmDTSaH9UkD
	 1pbdkQVKlWjSw==
Message-ID: <sashiko-outbox-236176@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC net-next 7/7] docs: networking: describe the CS7542
 flowtable RFC limits
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-almondplus-offload-rfc-v1-7-703175c6340c@gmail.com>
References: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
 <20261125-almondplus-offload-rfc-v1-7-703175c6340c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 20:54:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] docs: networking: missing toctree entry for cs7542-flowtable.rst
- [Low] docs: networking: title underline too short in
  cs7542-flowtable.rst
--

commit a97b8e95530e7b44ee176bda4b18a51ea806f58b
Author: Fil Dunsky <filipp.dunsky@gmail.com>

docs: networking: describe the CS7542 flowtable RFC limits

This commit adds documentation for the CS7542 hardware flowtable RFC and
updates the Cortina file patterns in MAINTAINERS.

> diff --git a/Documentation/networking/device_drivers/ethernet/cortina/cs7=
542-flowtable.rst b/Documentation/networking/device_drivers/ethernet/cortin=
a/cs7542-flowtable.rst
> new file mode 100644
> index 0000000000000..bedb825b688a6
> --- /dev/null
> +++ b/Documentation/networking/device_drivers/ethernet/cortina/cs7542-flo=
wtable.rst
> @@ -0,0 +1,112 @@
> +.. SPDX-License-Identifier: GPL-2.0

[Severity: Low]
Should cortina/cs7542-flowtable be added to the toctree in
Documentation/networking/device_drivers/ethernet/index.rst?  Without a
toctree entry, make htmldocs warns that the document isn't included in
any toctree and leaves the page unlinked from the Ethernet drivers index.

> +
> +CS7542 hardware flowtable RFC
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

[Severity: Low]
This section underline is one '=3D' shorter than the 29-character title
above it, which triggers a "Title underline too short" warning during
make htmldocs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-almondplus=
-offload-rfc-v1-0-703175c6340c@gmail.com?part=3D7
