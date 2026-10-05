Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7A1472072
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 15:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215478; cv=none; b=BtQzZ4u+0PTmUBZcSs1sxRXx979Rs2mD6Px4OO4KXCCdTGf+leBr4krysYCRUPEgGfgc1sEXU+whnk+fvhYc2Q1TCQpzqm15VwKxKhU2KdpNtfDG2zzZJpzgfLCjCaEYgIk+ufUP3cipu4BAgCbUxFJE92w55pYt4sgh+7axKto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215478; c=relaxed/simple;
	bh=+GUBM4GUpISUCGXo8g1itIoC/G55jTd36WzkQi+8bCY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R6+ZLWNwX9Usb89OGw16YFOu6+Qrcb8Q+w9ZmHGu8YAu28GzbfPSB3HcwydMP7ALNke/vlDB9VaylS7YQKRBuW4Il0eBhqcbF9pXxrS9+UcgpBP7tMeUAoCINFxL7THknu+4BHkdaE1Rh3B3CYzFuYJqSz7kwoYNVr18Lg7rCCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wzi3+kzP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wzi3+kzP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83BD71F000FF;
	Mon,  5 Oct 2026 15:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215476;
	bh=x2lnOnUWOM4T5ecFvHiYCAvAPl9vtG9c9feEiy77cj8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wzi3+kzPqucRDy6KTtGbphOu3cuRCh6QP5FfSc4FzmmObEaY/OKRs9qypL9iVdBPf
	 RNPOLYtxaMPMqVbQl+c1TFmpsl5dOE1FfIoCELeriwh8qh5LTXC4fOBdHit44fNs7j
	 9ddDu1mP2m+sdAUVgEykWCFAuejBTp1DveCAEo1a01UEgyGY2DeGRy5a/3zBQAWRpI
	 35QBL/M+ODz9FxbPt/EBKiFC7UI9T9nvIgbeEFFoTbzLtLqqf5/1gjgZ7k2Vhwe1fD
	 2WehHIpLLh9jPX4hooFwWJkr+NQLtF3r72R3smkckhRTHOl5ylXvB7E4LsA6UiedIL
	 YUUDIsCPdIesw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: i3c: dw: support up to two reset
 lines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261005152425.25319-2-jszhang@kernel.org>
References: <20261005152425.25319-1-jszhang@kernel.org>
 <20261005152425.25319-2-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 15:51:16 +0000
Message-Id: <20261005155116.83BD71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: i3c: dw: maxItems mismatch with commit message
- [Low] dt-bindings: i3c: dw: missing items/reset-names for multiple resets
--

commit 6da78b08867272d83c36c1c30ce43bb39d9aaf6d
Author: Jisheng Zhang <jszhang@kernel.org>

dt-bindings: i3c: dw: support up to two reset lines

This commit updates the Synopsys DesignWare I3C master controller device tr=
ee
binding to support multiple reset lines. It increases the maxItems for the
resets property to 2 and adds a conditional block to maintain the previous
limit for the Agilex 5 variant.

> The Synopsys DesignWare I3C master controller can have multiple reset
> lines, such as core reset, apb reset, and dma reset.
>=20
> Update the DT binding documentation to increase maxItems for the resets
> property to 2.

[Severity: Medium]
The commit message explicitly lists three distinct reset lines (core reset,
apb reset, and dma reset). Does limiting the property to 2 directly
contradict the hardware capabilities described?

A hardware configuration wired with all three resets would fail schema
validation, and the follow-up patches in the series do not appear to fix
this mismatch.

> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yam=
l b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
[ ... ]
> @@ -39,7 +49,7 @@ properties:
>      maxItems: 1
> =20
>    resets:
> -    maxItems: 1
> +    maxItems: 2

[Severity: Low]
When allowing multiple items in an array, does the schema need to document
the exact order (via an items list) or require reset-names?

Without a strict documented order or reset-names, the OS-independent ABI
remains ambiguous. Although a follow-up patch in this series (commit "i3c:
dw: switch to array-based exclusive reset control") updates the Linux driver
to use devm_reset_control_array_get_optional_exclusive to fetch all resets
regardless of order, the device tree binding itself remains incomplete.

Other OSes or future drivers that may need to toggle these distinct reset
lines sequentially currently have no ABI to rely on.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005152425.2531=
9-1-jszhang@kernel.org?part=3D1
