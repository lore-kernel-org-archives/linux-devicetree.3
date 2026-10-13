Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A664EB844
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890681; cv=none; b=VbXHv7WMuLjIZV5ag1wcAW8alz7V4tAX0ocDF1EhNPLrMJynm9YaDy0KnxXnLClTdIQPx6eDq5UTgwYjOyONGUDEj0NThRh5udGMMrwu6Sq1t+DHHM5xFKWoQysd3PlKBYmG3FmvaHi4u9wAIfrIkLcJnqh80tCvhafwERk2b6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890681; c=relaxed/simple;
	bh=qNQcC3HhoWRWyKY5iW5ZcT0XrxFEM4clqop1N62ikqs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dEoIxGbR5LlFpb6HSqfTW86WzIg+BwO+k36T2zh7/Kn1rpL+MG7+RzCw6rXN5nCsNwnIsDpGjSgPnGooPV5mfbPsqU5D8K1/Z3qhTH7WM7z70gEjgj0zPgnwj746fqRUMDEhyzMtmMia2kS5uzt2dbpkAm+wTyClVLiN5fAdYJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gy3W0qBj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gy3W0qBj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C821F000FF;
	Tue, 13 Oct 2026 11:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791890679;
	bh=tVVqMALrY1nVpuqvEo5AFwzTDYwIBMeNnS7o6Txa0NM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gy3W0qBjOUSgXhplPX7T5pyydNVoMQ1528Ec1BBPFQ3KCSJAFMLjpjXejuRvtt7aV
	 uG1cqdwuAeR9amJG//jmXvr9rE80ZWIfSWIYdeOVbRMgFjSdFv5unu412shayzUGfc
	 10httFw06NhvQRV1D6F6+tKx6Zj0wX3Lxm3uwHjiNA7KXECHrPOTEJEtcmHyVF4ygH
	 2CeANfrrnLletaLezeVElyHZfNdV8bX4Vs79NqKeuUPHRy3kZv3Abepms8WoksMQ8O
	 T/7lebBIU1QprHzSgqLMCjIy5A1+CrpfEq/AFsIFayRXjHwlCKlmFlybAocRyD4N5C
	 hRXywXjnCwDUQ==
Message-ID: <sashiko-outbox-169617@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/8] dt-bindings: media: Add CAMSS device for Maili
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261013-hawi-maili-camss-v2-4-fc93222da89c@oss.qualcomm.com>
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-4-fc93222da89c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 11:24:38 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: media: missing port constraints for maili-camss var=
iant
- [Medium] dt-bindings: media: invalid superset fallback compatible for har=
dware subset
--

commit 5533f51204e6b2bb4713bbf162c5fc5e10ea6c2b
Author: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

dt-bindings: media: Add CAMSS device for Maili

This commit updates the CAMSS device tree bindings to support the Maili
hardware variant. It adds qcom,maili-camss as a compatible string, falling
back to the existing qcom,hawi-camss compatible.

> diff --git a/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml=
 b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
> index 5bf0dca3d2462..d1d53d6f024cb 100644
> --- a/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
[ ... ]
>  properties:
>    compatible:
> -    const: qcom,hawi-camss
> +    oneOf:
> +      - const: qcom,hawi-camss
> +      - items:
> +          - const: qcom,maili-camss
> +          - const: qcom,hawi-camss

[Severity: Medium]
Since Maili has 5 CSIPHYs while Hawi has 6, Maili is a hardware subset of H=
awi.

Is it safe to claim compatibility with the Hawi superset?

If an older kernel that implements support for qcom,hawi-camss boots on
Maili hardware and binds using this fallback compatible, it might attempt
to access registers, clocks, or state machines for the 6th CSIPHY which
does not physically exist on the Maili hardware.

Could this fallback cause boot failures or undefined behavior?

[Severity: Medium]
Will this schema silently pass invalid device trees for Maili that define a
non-existent 6th CSIPHY port (port@5)?

The base schema in Documentation/devicetree/bindings/media/qcom,hawi-camss.=
yaml
unconditionally defines:

    patternProperties:
      "^port@[0-5]$":

which allows up to 6 ports globally.

If a device tree is created for Maili using qcom,maili-camss and incorrectly
includes a port@5 node, it will pass validation.

Since Maili has only 5 CSIPHY instances, should an allOf conditional block =
be
added to restrict the ports property (for example, setting port@5: false or
lowering maxItems) when the compatible string contains qcom,maili-camss?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-hawi-maili=
-camss-v2-0-fc93222da89c@oss.qualcomm.com?part=3D4
