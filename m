Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF791C84AB
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 07:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410302; cv=none; b=QoPV4jsBykS4yG9qAFKr5nCVzjQ5+E6IEhge/h/ouX7yaPUV08pnyPaqBVa2qT8t+Q0+7JZWaaf9sAac3DgqXXSz9WMU/wdjZ/OyQ15qrOM2IpbjmT6NMAkZ2UytSfGrIVy6w5jC04Qo72fA9UxCpIVdSxvmtrIYkxxOPciJtqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410302; c=relaxed/simple;
	bh=8d048qK1ayKFpV5VGkXyZeRdTW+F9fS2vz873FDLuvk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b+eUoPlISU42c+fJ962hxaSAD/fafGJD04PAM6LI4l1kDKlTQEDJcr0OqpwhbwYX9XtwfQF7jD+DT5wcW3IkdnI/70j1adHj5cAQdwKFzWKJ8Cc7QDyZ4oU9rGIZYjANVJ/lqa0WsnhhHtl+h791rgZJRqPmhmRfcD6HYdHxd60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rm2ESdpV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rm2ESdpV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF1B1F000E9;
	Tue,  7 Jul 2026 07:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783410301;
	bh=52uMWC1TjayrRxxRf8MpwU6MSpaiscD2RYo0k9Jco84=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rm2ESdpVHIeES8966A7x6ZwLq6DarURbhyg5zFc0br5U/XpB9quMh0RGHLrQOyD1P
	 od8WIwiaQM1mXPxJ7n9Rfqm09R2waL6NcMt29s78+vruXf5dC1f/G6lGoO27IC3wIg
	 WtdE0i6kS0z3NmMexl9TrNuUxMinQ/pXF7b9opooUZIxuKmjrLk7ggcqT5e7gofif2
	 Sa5KkiKkLzRhiQ9GvdAcvc6qS51gyKHiFx28nn9x+jULQGOldT1FIz+WgIE202MGzZ
	 HOZSHvNHOu8m6UmD8lDivj3muZAaOjPZi4+vmfKJir/yAGJjkgCL7vcU0g62SSAsVm
	 iVoX8i/b66tHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: sn65dsi83: Add reverse lanes
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wojciech Dubowik" <wojciech.dubowik@mt.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260707070244.230546-2-wojciech.dubowik@mt.com>
References: <20260707070244.230546-1-wojciech.dubowik@mt.com>
 <20260707070244.230546-2-wojciech.dubowik@mt.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 07:45:00 +0000
Message-Id: <20260707074500.CAF1B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces a custom vendor-specific boolean property `ti,=
lvds-reverse-lanes` to indicate LVDS lane reversal. This is a device tree a=
nti-pattern because the referenced standard `video-interfaces.yaml` already=
 provides the `data-lanes` property for this exact purpose (e.g., `data-lan=
es =3D <4 3 2 1>;`).
--

--- Patch [1]: [PATCH 1/2] dt-bindings: display: sn65dsi83: Add reverse lan=
es property ---
commit c30eea01a74188461b7e527f71d282d68b885ec2
Author: Wojciech Dubowik <Wojciech.Dubowik@mt.com>

dt-bindings: display: sn65dsi83: Add reverse lanes property

This patch adds a boolean property to reverse the LVDS data lanes order for
endpoints.

> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8=
3.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
[ ... ]
> @@ -115,6 +115,10 @@ $defs:
>              enum: [100, 200]
>              default: 200
> =20
> +          ti,lvds-reverse-lanes:
> +            description: Reverse the order of LVDS lanes.
> +            type: boolean

[Severity: Low]
Is it necessary to introduce a custom vendor-specific boolean property
for this?

Since video-interfaces.yaml already provides the standard data-lanes proper=
ty
which can be used to describe the exact lane routing, does this hardware
require a distinct property instead of using the standard data-lanes
approach with data-lanes =3D <4 3 2 1>?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707070244.2305=
46-1-wojciech.dubowik@mt.com?part=3D1
