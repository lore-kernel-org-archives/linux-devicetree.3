Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF0F1DF72C
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 20:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780863572; cv=none; b=F3wn5X2H3g51O2RI9sC+CBPenTVlmLzvBlhPMKY0YVOcPH3eytTMYH1HP50QQxlZnVAoRggGK75F/YcRFEfWOd4BWInmsCCF3s5LI5hZk5tYrPzy+Z6hR1tFl/mqWVMEWa2cOAbQxTVIumRavz/epEOjLjZEbgpkUJq714l2G9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780863572; c=relaxed/simple;
	bh=YIDUcdey0I2pKhMDr3uvfBeyyV710hIgSLslAvqc5R4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SzlASsIymKvE/gfj3+liFKsuGzHirnI/+ZERdoiCZ4z06vwEpX3BhZ0n90YIsAzXgc3DpcIeH4Sfyo1JVmcUrCQhbpadQoUlLASFSv+6l+Gf/3WSDfTMH8qnqgCaZA1OXSGiW7UmPYFsy+VfIaY3TaBtTA544OeXlKACaSWCEUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHZ4a6PM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHZ4a6PM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0721F00893;
	Sun,  7 Jun 2026 20:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780863570;
	bh=mZDpgTO32GJeTNUkWQiUVrsPeuYmJir0wvfjrucxL2c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jHZ4a6PMiCLyigF8/3ZCGMyP5vdLr3ZJYFBh6EG4qfzVSDWkn+YbUDS/ANSF+ON8h
	 oP/JHeACkTPeoIZktI8HuhtAvVWT4Sa4rK4//ArgV9V1Z7jNw8MKt+IgkvW5pKzDwG
	 8BFCOKujGYzZvaUruW2SvHvOK2EWZ1NqcgzG4Ddj/cr1Wpy+1My9dVo9htaEQkoYWW
	 mTdPLOuD4J8tDw3vR/UvKYzOCLgO4thh4sDVcAQK4y0hwCYtA//IJUOa8/XBKmh60U
	 7AI9L8M2UmFe/dY82wNDoIANWW9iC9p4SAb9S+sgU9YuXx9UMh6VHiLaAXk/feC/Kr
	 FyQPSkvOMS7zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: Add Chipone
 ICNA3512 OLED driver bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling via B4 Relay" <devnull+webgeek1234.gmail.com@kernel.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260607-icna35xx-v4-1-64de514add34@gmail.com>
References: <20260607-icna35xx-v4-1-64de514add34@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 20:19:30 +0000
Message-Id: <20260607201930.7E0721F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The vendor prefix 'ayntec' is used in compatible strings but is not=
 documented in vendor-prefixes.yaml, which will cause dt_binding_check to f=
ail.
--

commit 5d6611d7262ab82a8a3721761623b1f394d6e2ec
Author: Aaron Kling <webgeek1234@gmail.com>

dt-bindings: display: panel: Add Chipone ICNA3512 OLED driver bindings

This commit adds device tree bindings for the Chipone ICNA3512 and ICNA3520
MIPI-DSI OLED panel drivers.

> diff --git a/Documentation/devicetree/bindings/display/panel/chipone,icna=
3512.yaml b/Documentation/devicetree/bindings/display/panel/chipone,icna351=
2.yaml
> new file mode 100644
> index 0000000000000..90e69f30cd91c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/chipone,icna3512.ya=
ml

[ ... ]

> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - ayaneo,pocketds-panel-top
> +              - ayntec,odin2portal-panel

[Severity: Low]
Does this new vendor prefix need to be added to vendor-prefixes.yaml?

Device tree schema validation verifies all compatible strings against the
known list of vendor prefixes. Since 'ayntec' isn't currently documented
there, will this cause dt_binding_check to report errors when validating
this schema?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607-icna35xx-v=
4-0-64de514add34@gmail.com?part=3D1
