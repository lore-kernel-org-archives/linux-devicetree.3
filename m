Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C49349B0A
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377238; cv=none; b=FlYNsqIvI4QMrXU9fRydYaRNpU30n48/WdVl3nUsJCq5uWMog44QXRqXgpvvou/lZ9MozU9KvqfoJS94qcz5Svr3ITkwEgAdwrSnq2aX009V78nHqDYko+u9wDPBPOBuHOsb/g5zf+gpCt5Z8yxY1dafav64xdz2E7uqT3bzlj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377238; c=relaxed/simple;
	bh=gtaG/CTVNkdHoAJnZOTxrnjUKBxFfEL9M89l1nj+Yc8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oePlV7cxJgNDYkvYWQBOHtmpauyuNw9gNmzUNwWB4goRn37gJR973AYYzY1aaCedrMt8xieRNg3LwHsWPdb1MrBfsTi74CNdWvntUvLsQr3AE6KIT+0dwsXZrWM/V2h/VRguA7Z/ZPaixvMTiocmB3Qir/sQm/NEI2T/LSh23QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqr/R2iJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqr/R2iJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2FD1F000E9;
	Thu, 21 May 2026 15:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779377237;
	bh=SDZv29lwS/56R0VAjoIJh92oin3dYH/MEwE+zVZco0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kqr/R2iJII99c7++MOWPFaYvhoGP+MPud00tvjJz9GWd0OpNRKgLHSDVJ77givS2X
	 4fbD82GYhakANwSBxwdjb3tw5IA1nE6EeGTyn8hDjKouF/xZ4d6AWNhiLjC9fRj6nx
	 FUnz1SowoeETqza6a9P8VUz0YXQdisIMg+rv7xUF6Pec0GDdU9uT7idCANokQ4VSd8
	 T5uuofIwiMZ3zrWiuGsxqNnVb7oPaQ1plBLCCxp6LP/SPYfuVMG+GYzubH9OhWmuGi
	 kvtdEx/VG342mfr6g5QJWKRhV/b1Tyu8YqlWFPg15gH5ArVqD4rD20fTw8qVcLUldW
	 B9YSu0HUbV0XA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 14/15] dt-bindings: display: panel-lvds: Add LG
 LP156WF1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vitor Soares" <ivitro@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260521150038.103538-31-ivitro@gmail.com>
References: <20260521150038.103538-31-ivitro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 15:27:16 +0000
Message-Id: <20260521152716.DD2FD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The dt-binding fails to enforce the dual-channel requirement (th=
e `ports` property) for the newly added `lg,lp156wf1` compatible string.
--

commit a568203d1851908daadd835b566099e0a123357a
Author: Vitor Soares <vitor.soares@toradex.com>
dt-bindings: display: panel-lvds: Add LG LP156WF1

This commit adds the compatible string for the LG LP156WF1 15.6" FHD
dual-channel TFT LCD LVDS panel to the generic panel-lvds schema.

> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.y=
aml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> index 45183a1439ce9..a6af2b9cc2f9a 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> @@ -58,6 +58,8 @@ properties:
>            - hydis,hv070wx2-1e0
>            # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT =
LCD LVDS panel
>            - jenson,bl-jt60050-01a
> +          # LG LP156WF1 15.6" FHD (1920x1080) dual-channel TFT LCD LVDS =
panel
> +          - lg,lp156wf1

[Severity: Medium]
Since the commit message indicates this is a dual-channel panel, shouldn't =
we
add an if-then conditional block to require the ports property specifically=
 for
this compatible string?

Currently, the panel-lvds.yaml schema allows panels to be configured with
either a single port or multiple ports. Without a specific conditional block
enforcing required: [ports] for lg,lp156wf1, a device tree incorrectly
configuring this dual-channel hardware with only a single port will silently
pass validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521150038.1035=
38-17-ivitro@gmail.com?part=3D14
