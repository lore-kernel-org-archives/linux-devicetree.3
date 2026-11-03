Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738058;
	b=kC/12WDeFlU16fAhiW0bwGODQeq/HrP/OF/j8PmmskfpakjPrsiXwkEiFlq2CkO8JA/Z
	 CT1EQGNtoXG6MF/JZk08s81JSzIkNsjBpaptz76lR4BQjZDftOxue36GTjCDqj2CqrJR+
	 Dh/Ym+J5d6E7NMOx7a7hfznfL49AsCMzu0dxvWysQYHaVfRnbarZHh3WEG8OYCtwXKnl1
	 Ro6AKd8sS6V9czkhPdIKr128DdYN1WisBHN0AaHxTFg8NFSd067xb8Kt+s6rMtXZQQ2D5
	 Wi0lI2AlTaFg2IiFWvhEFkpindiru/cQ6cxpCpornzX5lB8ukAMbsCt9n9WdJYu1v3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738058;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NmhCleWsjB+17l2UAGXCMV0yzOyDAojZ2H14gtAolRI=;
	b=r6lOdujhV2jfjqZ/Rk7f92D9FZhPYnqf3S9MkfpxgENsREeBPTbqgG5INHkFbIexWL2D
	 Nbq7sjatLplR/6a83xny9QyWrhBuuF/pDJm/4HU1uEK3b1MWZssO3lEYxcBMEO61YiniE
	 tcJl2eywzpt8Mb30pqdgPvFcJka17E+rG5FcADB9df/jonWtCELkvOqN/5P5sjois7Y3d
	 HVo3miusn3e9MoD6N2u6TFlFYwsJaRgWEAO91dd4/EZ3WMpMGtKfBHYV0alu+fplpocsf
	 Xgfzpa83aQuzFZtlbrSXPgbkK4pDrsvmf4R9d1HHHbhjQ9jJsi+HI9gd84dOO61ix+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OSx1kdgn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9841F606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OSx1kdgn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7AC1F000C1;
	Tue,  3 Nov 2026 20:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793738058;
	bh=NmhCleWsjB+17l2UAGXCMV0yzOyDAojZ2H14gtAolRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OSx1kdgnbyZCyZ36cS7To5A3NFamIsNL2An5K57qOefQJ2l8Dqc7wWBvQXhG9J2PD
	 ATudCNgEf0euK6By6cpie0NcdRckPPRQiW/PvX4nQRyItfjvOP/pzZbI9sERuFD12i
	 gnPcI1ZiXgBv6aNG/oiDSbzMGawhUx09RwdxaAMLISM9r88T27qYze126h1UUXtvIX
	 asNU0IfkDtWolQ6lE/5+s5LA40xlsqFGaIymQTx7acscG8mOISmImjiTxTwEkp+Wrj
	 yOcukWSJ9q2cyllOloUB3FrEpaGtKeFAP/Xna70+qghxSvcvaMuP0xrqPwaa0581b2
	 X97XgqO1wYBDA==
Message-ID: <sashiko-outbox-195992@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next] dt-bindings: net: Convert
 snps,dwc-qos-ethernet to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102203353.1384705-1-robh@kernel.org>
References: <20261102203353.1384705-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 20:34:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: net: snps,dwc-qos-ethernet-4.10: redundant maxItems on=
 clocks
--

commit ccf9541bde2e61e4e9ad2f4d7325ff792d7181d2
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: net: Convert snps,dwc-qos-ethernet to DT schema

This commit converts the snps,dwc-qos-ethernet-4.10 binding to DT schema
format and moves shared properties to snps,dwmac-common.yaml. It also drops
unused compatibles and updates the example to use Tegra186.

[Severity: Low]
In Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet-4.10.yaml at
line 39 under properties:clocks, maxItems: 5 is specified alongside a
5-element items list without additionalItems: true.

In the devicetree meta-schema (meta-schemas/items.yaml), when items is a
fixed-order list, maxItems is implicitly set to the length of the items list
and explicitly specifying maxItems is disallowed.

Does this cause dt_binding_check / dt-doc-validate to fail on
properties:clocks:maxItems, and should maxItems: 5 be removed here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102203353.1384=
705-1-robh@kernel.org?part=3D1
