Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBCA22576E
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 05:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788067583; cv=none; b=SEYDze+j7HZvHISQmTPojI4LCwVtw+/WMki4Qe8g3yNM1Ps8qhnOec8d0unFPjgt6v+Z+mQUS2DrDuIyaLg+WecyeUs8pjUgn6xic6mxs7H94YL3sZW/RPPDfyo6Zn1qk8ZEh3LeDwiTy/Zj2H4rEbvnRjQmmhQ1UfWhk1eQHHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788067583; c=relaxed/simple;
	bh=oqfB6tkv+GWm8jNtpprUZQA/x7b/V8/lotjQPfLCzWA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bUqOO4dp66ASOQMvkNZL7agBVti2J263v5M7ikph4g62cuTOSquz4KRetcXCaC47iLogXqGXWbfo31lfaiX3QNtGVwu2Bi7muSqpkpYJFjYY+15Bbqr8s6/HSNfUZFEpxCA5oFJXaI7njAUA9Ccq9hTnAuviNRTTO+mPOiwqtYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5LQPygF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5LQPygF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA601F00A3D;
	Sun, 30 Aug 2026 05:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788067581;
	bh=w1NJ/cEcaxrCHYAYjz5XM4R1PK0jjr0iJpPyHMODhBo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h5LQPygFU05xwzbN7ELPFRiwYtysJRrI6EMHGOIm+ytCiAg0AKfqIURPXrs3Kaeiy
	 KmIq3C3pSXHHY2ZBQVbQT/bqaLJiuQg7SmaAh7WcsCZuYX8ZrYNFHEt9H1nxszoPsV
	 Z1VCaOmqXduiafqBmvApxLxHOeUg6YfswmbNSbFFJa6NDac7g8uZ1OWpr6jl3fgStm
	 Ze3VHTL7fRwuwMgaUUtwpkoGueo/t0NoYCG0DUSuGolY4hzXT0nRgFbKK+90es6ltY
	 3/YSrtyfh+eVrOWz++I2QgQVVW9Sb5jNi3uMnpOvksLvgmuY80f1ToFhslSBGc8dv8
	 8nE06ecsLu0lQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next 2/9] dt-bindings: net: ethernet-controller:
 add slow-to-probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksei Sviridkin" <f@lex.la>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260829052546.1152446-3-f@lex.la>
References: <20260829052546.1152446-1-f@lex.la>
 <20260829052546.1152446-3-f@lex.la>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 05:26:21 +0000
Message-Id: <20260830052621.9EA601F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `slow-to-probe` property describes OS/software behavior (dri=
ver loading and boot sequencing) instead of hardware, and lacks an OS-speci=
fic prefix.
--

commit f5e8127fdbf6369101e1a77cf0e55acf75f7b643
Author: Aleksei Sviridkin <f@lex.la>

dt-bindings: net: ethernet-controller: add slow-to-probe

This commit adds a slow-to-probe property to the ethernet controller bindin=
g.
It allows a port to keep a PHY reference and attach to it later if the driv=
er
or firmware is unavailable during the initial probe.

> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.ya=
ml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> index 1bafd687dcb18..ca82672b6cb38 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> @@ -113,6 +113,15 @@ properties:
>      description:
>        Specifies a reference to a node representing an IEEE 1588 PTP devi=
ce.
> =20
> +  slow-to-probe:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      The PHY referenced by phy-handle may not exist, or may not have a
> +      usable driver, when this controller connects to it, because the
> +      driver or firmware arrives later (for example from a filesystem
> +      mounted after the controller probed). Instead of failing, keep
> +      the port and connect the PHY once it becomes usable.

[Severity: Medium]
Does this property describe OS-specific software behavior rather than a
hardware configuration?

Since this flag addresses driver loading and boot sequencing (software
state), could it pollute the generic hardware Device Tree ABI by lacking
an OS-specific prefix like linux,?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829052546.1152=
446-1-f@lex.la?part=3D2
