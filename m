Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AF83EC6A1
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 16:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563835; cv=none; b=lmrjLjlu15kraZiSgNuJV3wXtVSX5Fhd/Qt2DZCndH9LtZTvwDfVcUH5dNl5l980aNjDGQ6GmIMf7B9xfNkGlZPKvh0yYe8yXjv6RWkRE1kXwNrGznkf7SBLKo0jfARey6kUj8Vgo/DVLJiHaXa1iha50tDjvQJMZVoWt/saQIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563835; c=relaxed/simple;
	bh=0PniB2V60AcsQPLIjjIwDsdBmz8DE8VlPNS+CaSikFo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k4MHQGpUdt+l8iHLQQAnIy3Ec4AgctRjQV8tq68kjLmTJJlQtn2k6F565xgyWVqy9/PwysR6/XMq139uZS4etTaNPk8bwSkJSo8mXOCBX2pApo2gF4pLD14Fkq9iNPnN1xS4eMrVaivJwcwT4ITpCEsqiQ2yqh2ZSPWIFYaEvT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmVvQ9bN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmVvQ9bN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5277A1F000E9;
	Mon, 20 Jul 2026 16:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784563833;
	bh=xoxrGLAoADhNRDcjzssb0/9qEVRVKvSCT9vgWKKof54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jmVvQ9bNYL3U+R9+KXI+BjRn5IeRlGDrwU5p9ZjENHThuHFQMqArNtonz007nYr8D
	 BOB2T5GnQrC+8QPm2DXXcE4dG/2NxFdQghiSfy9iUk2ccPCxvEme9S8OxTEju8oDqs
	 YMXS2uMPeR2znhMJnk12IKEFzepBWTAcsLwOJ8IHWCb2pMWUfIy383d5bPBOaSfEfZ
	 v/mvbDjSQRzsfCMAerQzJ017qJDi0mBc/elLJu/6wRMS7JXd5497A/XF3jILUG0Eky
	 20pnJWowdN28rVE7wLG/894cVJaJHTDlWNlPjzh/bpQOA3Igcb0QK63N6PepgWK4bA
	 SznMcNW3Yl0Sg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais:
 Document DAI subnode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720160226.1026440-2-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260720160226.1026440-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 16:10:32 +0000
Message-Id: <20260720161033.5277A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Contradictory array lengths and definitions between `clocks` and=
 `clock-names`, making valid hardware clock combinations fail validation.
--

--- Patch [1]: [PATCH v6 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Doc=
ument DAI subnode ---
commit cca2bfa9278ee0dba4fe02f999f9bda9ec6f258f
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode

This commit extends the qcom,q6apm-lpass-dais device tree binding to explic=
itly
describe Digital Audio Interface (DAI) child nodes. It adds address and size
cells to allow multiple DAI instances and defines a pattern to document per=
-DAI
properties like interface IDs and clocks.

> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dai=
s.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
[ ... ]
> +      clocks:
> +        minItems: 1
> +        items:
> +          - description: MI2S bit clock
> +          - description: MI2S external bit clock
> +          - description: MI2S master clock
> +
> +      clock-names:
> +        minItems: 1
> +        items:
> +          - enum: [bclk, eclk, mclk]
> +          - const: mclk

[Severity: Medium]
Will this cause device tree validation to fail for valid hardware clock
combinations?

The clocks list defines 3 items, but clock-names defines only 2 items.
Because dt-schema limits arrays to the size of the items list when defined
in this way, providing 3 clocks in a device tree will trigger a "too long"
array error for clock-names.

Additionally, do the array index descriptions mismatch? The clocks array
defines index 1 as the external bit clock, but clock-names index 1 strictly
requires "mclk". This would prevent configuring "bclk" and "eclk" together
if "mclk" is not present.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720160226.1026=
440-1-mohammad.rafi.shaik@oss.qualcomm.com?part=3D1
