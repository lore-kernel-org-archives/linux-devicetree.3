Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B593ACEF6
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778787648; cv=none; b=PNJzju61ENBt/FfQ2YtAwh57sy7WON75o4PUnT2WMILE6yDrBLHxPdNq4Rxi49J8xHTCwK46Z5eOuoS08ib5hk0fOfmb/jAIkIQSNEKVxjL/casosYH83Iy885wt/Q5vvLpGmEaB4I7K2q5Qef0Ekn7lp3f7caPdgObr8RkfhkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778787648; c=relaxed/simple;
	bh=/okIdQYBQU+7KlKf+IdpIn6TRuSb/ndMj35DKgn3nbQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QF6yRrRQX6W/8zlM5pGzDlhZgtvzyleUgmLfkrtrf6Q0A6Nnunpiul09/+oBNmv7TYvs3SzT3dGb/Wt4PeqgTGUPR1OX7Lc0u8v+v3ExR29jTeSoRNBht034IlIP2V58i9XrpZxewtPkMPsoL/hfhSJx39JZzz+GSuZ25Pt8Ohc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M14VrKya; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M14VrKya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54697C2BCB3;
	Thu, 14 May 2026 19:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778787647;
	bh=/okIdQYBQU+7KlKf+IdpIn6TRuSb/ndMj35DKgn3nbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=M14VrKyandzGeFjLpJzs2UOte6AGIb5i9hB+H5ThMafiJmUcXlDU52vAFbCIyJW8N
	 N4pKrjU+6mQT7zCNv09crM1OcQUSbhmrBkk4m5Yi4xT+glc6ApLyUdRqDJts5/EtGG
	 Z7MUYOKmvllojzC4V9OeOCepcTQP+UxQy16p3Jhli8WM2ToeTz772Bnh0IXaXUjxJ4
	 nYGcGnyS2d5He+lNiyCmsfh2HkmoURGmfczIo+b59wARHDxkgiUuUApX0nLWu6gm2J
	 fLg2zoPQDoV1h93y+xLHxuiPdX1Z3hSwClVrYszThu+O39atjUfAFaBeJhcOAaZlHz
	 obu8J8i/nLh/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/10] dt-bindings: mfd: syscon: add
 qcom,msm8960-sps-sic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antony Kurniawan Soemardi via B4 Relay" <devnull+linux.smankusors.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260514-msm8960-wifi-v2-2-7cbae45dab5e@smankusors.com>
References: <20260514-msm8960-wifi-v2-2-7cbae45dab5e@smankusors.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 19:40:46 +0000
Message-Id: <20260514194047.54697C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit adds the compatible string `qcom,msm8960-sps-sic` for=
 an Interrupt Controller but fails to define and require standard interrupt=
 controller properties.
--

commit 4920dc5889f6c452e2f9cb09ecf073afa3b06d47
Author: Antony Kurniawan Soemardi <linux@smankusors.com>

dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic

This commit adds the compatible string for the Smart Peripheral System
Interrupt Controller present on the Qualcomm MSM8960 SoC to the syscon
bindings.

> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Document=
ation/devicetree/bindings/mfd/syscon.yaml
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
[ ... ]
> @@ -219,6 +220,7 @@ properties:
>                - nxp,s32g3-gpr
>                - qcom,apq8064-mmss-sfpb
>                - qcom,apq8064-sps-sic
> +              - qcom,msm8960-sps-sic
>                - rockchip,px30-qos

Could this cause a regression in schema validation completeness? The commit
message notes this represents an interrupt controller, but the corresponding
standard properties are missing.

Should the binding also define and require interrupt-controller and
#interrupt-cells with appropriate constraints?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-msm8960-wi=
fi-v2-0-7cbae45dab5e@smankusors.com?part=3D2
