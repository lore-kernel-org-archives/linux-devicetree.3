Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B43440D560
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801370; cv=none; b=bf7GSStBxHYxVpwDMHb5qga6YbQGraR1wwHqOPrxuY6duYOOHe76UBR9PolRztp21XiT881J8jNJk9YAhB8Q2WfY30MSUEhzerU6MHcUu5uf5sMjB3bwl3eOoMvvl67yGRKpAvR1He1igj19+g4j1xIzv2ZFfc9TSQby18C+9jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801370; c=relaxed/simple;
	bh=a69kjkIIViUodFnPw0NaYXONt06N+M/bG8zS/oigeTU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hvc5keBfV/gCCK9YnBhNWpNAiR+RGHG/05o1tH23VJ8GC2MJGePST1qq4icA6poxne/f0oacE1Ug2NWzK/EP5FxR+3CIMvzVWxj+2RrAarTKUezUVZy/QtcaKGs4InNqt16uUWvd45Gyugv6rbJsjBNiRc4P/Ef17vAFNzbIxlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSsUa+kU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSsUa+kU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAEAB1F000E9;
	Thu, 23 Jul 2026 10:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784801369;
	bh=a69kjkIIViUodFnPw0NaYXONt06N+M/bG8zS/oigeTU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aSsUa+kUyM84Pe5g5sDZyhnYmETOslFij3H5k4+pHBJHYNCAqCL0B8hQaV+0KEMhr
	 T+tc9nr1rrPD5XB+s1Ari8IwadxpPp6U5ngVHQFoXx0l7F8NDO6m6JBiG8e1nnHnqZ
	 Va1+uwlFtoJK5jLGz2Zv5MfTM9mxt46auMglELDgikXGXxLwltVLicPJkfYWEq88D8
	 qUjYcZiR6TcaGF93CTKIxgYa5jg7NbQUjbXym3ejy9fm7uHrc/GYl6jOlCGG7NZ2Kk
	 O/YoRREVlAIRTKmMk0diWR5sJgl2d/xuhqlclvIc0yJz3zH+f0fUAIUYpIyBgWSBUc
	 NYDal6gSyQkKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: hamoa: Number usb_2 HS port as
 port@0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Deng" <wei.deng@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723-hamoa-m2-dts-v2-v2-1-82254ac101fb@oss.qualcomm.com>
References: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
 <20260723-hamoa-m2-dts-v2-v2-1-82254ac101fb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 10:09:28 +0000
Message-Id: <20260723100928.BAEAB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message establishes a broken Devicetree API contract =
by promoting the use of `port@1` for a downstream USB root hub physical por=
t connection (e.g., an M.2 BT slot), which violates Devicetree topologies a=
nd schemas.
--

--- Patch [1]: [PATCH v2 1/3] arm64: dts: qcom: hamoa: Number usb_2 HS port=
 as port@0 ---
commit 26a61b5c5bcc296d009783e2231b6c4b9b5fd3ef
Author: Wei Deng <wei.deng@oss.qualcomm.com>

arm64: dts: qcom: hamoa: Number usb_2 HS port as port@0

This patch assigns a port number to the existing high-speed data bus port in
the usb_2 DWC3 controller by wrapping it in a ports node and renaming it to
port@0. The commit message states this aligns with the snps,dwc3 binding
convention. It also claims this reserves port@1 for USB root hub physical
connections like an M.2 Key E Bluetooth slot.

> Adding a port number also reserves port@1 for USB root hub physical
> port connections (e.g. an M.2 Key E USB BT slot) that can be described
> in board device tree files.

[Severity: Medium]
Does this description conflict with standard Devicetree topologies for USB
devices?

Standard USB downstream devices are typically modeled as direct children of
the USB controller using function-based names (e.g., bluetooth@1), rather
than being modeled as OF graph endpoints.

If board developers follow this guidance and place a port@1 node inside the
ports node, won't it trigger schema validation errors?=20

The snps,dwc3-common.yaml schema strictly defines port@1 in the OF graph as
a Super-Speed data bus, which conflicts with this being an HS-only controll=
er.

Could the commit message be updated to avoid suggesting OF graph routing for
logical USB bus topologies?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-hamoa-m2-d=
ts-v2-v2-0-82254ac101fb@oss.qualcomm.com?part=3D1
