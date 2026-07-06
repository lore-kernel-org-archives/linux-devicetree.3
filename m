Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F2C399348
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353546; cv=none; b=lGA7cc8Ax+5hRCuB+XYIPIxGPo/aVbz48+wpXqeyU8p9yYdUfPTQxWVv3qBNOp9gMgWNxEnntMavm2VbhipOfZOZI1RkVc+lMHCPzpkpEyyTOcwlgSw/Q9epDUllE5QL7zYodR37tKg7JCytHJ20NcfLY+qzxIJ1D12gixaKgEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353546; c=relaxed/simple;
	bh=BLESi/Vhd/heeXYo8MYxDa67U4i7kjvAse+ziJHEycg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BgL8LVlJjTuuNgoKtOP7XjbG3Bs5/J2FlEH6uNNX4P+Azuqcv71xVxi105jaEn2SVAJYz07rVUEiOt+AIZJJqL7vdUD2XMeR7tyMWtxnmQrzyjvW1CMW/8PF/YWp8ijnruKHpfNaXoiOXl7RFD1Tl0pVM7HUanyl/Io+XUfNW0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1IPnkpg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1IPnkpg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9827E1F000E9;
	Mon,  6 Jul 2026 15:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783353543;
	bh=T+YVQj0OZYMCDuz+jgMoooUl+wT1KOROE0BH991Qq5c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O1IPnkpgF3yZspl6fTzU9MtI9PVFjv4EFKytjeliAMJeai9YN6wMZ8S1JY4VBpNQd
	 +hTsXSaTWWa8HAcZMmxdyrKoQcBjNwz5NFuJm5hC4VXUS/xQXy8wQTvQMyyxqedb2H
	 PvK3ScjIzvP4I+Ib3XSHdR27d/8DLg5wlbd07w0FX5HXu7fSut0IfNuPlaSaUMctE5
	 NkjG2+4CClTO7m3qK8MezC3gE8pnmhWVIpyHQyElLvVMBRm02eNaA5KkTYVj+4l/1N
	 3/ns3V1ry+oM4B5Gn2f7WM657y6zvVxGi5a+blPEH8dmt9SviR56wmx6RCqHAezsKA
	 WHsSLo4CbbvTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/6] dtc: dt-check-style: Narrow disallowing of tab
 in DTS only to YAML
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260706-dts-style-checker-v3-1-03ffacff9226@oss.qualcomm.com>
References: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
 <20260706-dts-style-checker-v3-1-03ffacff9226@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 15:59:03 +0000
Message-Id: <20260706155903.9827E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit renames the function `check_tab_in_dts` to `check_tab_in=
_yaml_example` to resolve confusion, but fails to update the user-facing ru=
le name `'tab-in-dts'`. This introduces an inconsistency between the intern=
al function name and the rule string.
--

commit 9c825da9bb864c8e87cb2f6ad98274fc217a08b7
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Narrow disallowing of tab in DTS only to YAML
   =20
This commit narrows the scope of the tab-in-dts style check to only apply=20
to YAML files. It renames the internal checking function to avoid confusion=
=20
since regular DTS files do allow tabs.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 2d5723d41ea39..34e0f7e2a57a4 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style

[ ... ]

> @@ -929,7 +929,7 @@ RULES =3D [
>           check_trailing_whitespace),
>      Rule('tab-in-dts', 'relaxed',

[Severity: Low]
Should the user-facing rule name 'tab-in-dts' be updated here as well?=20

Since this string is printed in warnings when a tab is found in a YAML exam=
ple,=20
leaving it as 'tab-in-dts' might still cause the same confusion this patch =
aims=20
to resolve. Changing it to something like 'tab-in-yaml' might better align =
with=20
the new function name.

>           'YAML examples may not contain tab characters',
> -         check_tab_in_dts, applies_to=3D('yaml',)),
> +         check_tab_in_yaml_example, applies_to=3D('yaml',)),
>      Rule('mixed-indent-chars', 'relaxed',
>           'indent must not mix tabs and spaces',
>           check_mixed_indent_chars),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-dts-style-=
checker-v3-0-03ffacff9226@oss.qualcomm.com?part=3D1
