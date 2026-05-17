Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BA72FFDCB
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 13:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779024220; cv=none; b=PCFOUQz3BW81LD5LBpY68O+H2+nno15sEwG4hA0Gl8aANWzvEHgH6qnsSZuDWFA+1rIaLW/7B+FofXiJ9k9GKISUQPusPlj93T9BIprl/NhNkxKMmJwsVbFoTIkTriiO7rREW5V78Ac6y93066YVZMZbXlz4ToX9b6xrektT53w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779024220; c=relaxed/simple;
	bh=GHbYEEMXwbFNBawIkU43ib9dtneNNhmzSkmmc61/aAQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YnNipNBbV1Sr/iwcm8GtIPoCKXYUeRsF4mPN+7UlKXwX7CBBUGPLDa1/Jg5nUDYFCfHQUG1S2ZY07DTFlFW6v7MxsPLNb+WzTx/vv467+lNuGkTNyC9Sqie5w8UIjt+ThpruxD5jRzz8DemDyfoPOAaZ84qa3tF+z8tL4BBVxqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbBMDaBe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbBMDaBe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 602F2C2BCB0;
	Sun, 17 May 2026 13:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779024220;
	bh=GHbYEEMXwbFNBawIkU43ib9dtneNNhmzSkmmc61/aAQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=qbBMDaBeyKkSGbJQsNL8QWaGoFDAoTephAAM2QYIfylJQbPWSBFJKCG54glNKXTT3
	 aJslAjOrb3RT2l6b58IMDGNpGLDhDZ8r3hZTt6f6javSgjUk7x8CxerlWdL6HXVXpI
	 T6oqYnlx855WYgSBLgNqg7WMN+zT+xvqZLwh7muqVBi0b3tRt6M7qSzus0yKovsptR
	 68EhggPtnCwx/QE/eiLd04Q83XHg7hUEpfWdtKKwLOfk3Jnmb1wa9fNt31RYw+fhDV
	 UNS5/HHBxlCnK4ZmaZ4tRdKuCd9nOPC1JVsk7wFA4LhlxXr2XQxtbaXIMOiCdA+kK+
	 QSiDpz91R4fOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: qcom: document the Ayaneo
 Pocket DS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Hamamdjian via B4 Relay" <devnull+azkali.limited.gmail.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260517-pocketds-v3-1-d5910c801756@gmail.com>
References: <20260517-pocketds-v3-1-d5910c801756@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 13:23:39 +0000
Message-Id: <20260517132340.602F2C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The compatible string 'ayaneo,pocketds' violates Devicetree naming =
conventions by omitting a hyphen between words.
--

commit afa187f3006436f1b9cb60821ba5f70e1c3ff499
Author: Alexandre Hamamdjian <azkali.limited@gmail.com>

dt-bindings: arm: qcom: document the Ayaneo Pocket DS

This commit adds device tree binding documentation for the Ayaneo Pocket DS
gaming console, based on the Qualcomm QCS8550 platform.

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index 2741c07e9f416..f130a6b092b95 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
[ ... ]
> @@ -1107,6 +1107,12 @@ properties:
>            - const: qcom,qcs8550
>            - const: qcom,sm8550
> =20
> +      - items:
> +          - enum:
> +              - ayaneo,pocketds

This isn't a bug, but there is a missing hyphen in the compatible string.

Should this be ayaneo,pocket-ds instead? The commit message refers to the
device as the Ayaneo Pocket DS, and the sibling entry for the Ayaneo Pocket=
 S2
uses the hyphenated form ayaneo,pocket-s2.

A check of subsequent patches in the series confirms the string remains
uncorrected.

> +          - const: qcom,qcs8550
> +          - const: qcom,sm8550
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517-pocketds-v=
3-0-d5910c801756@gmail.com?part=3D1
