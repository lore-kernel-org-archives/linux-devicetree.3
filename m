Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E5D455182
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112601; cv=none; b=YwwRepnrb4HqLbPhh26wTJIDNAssILVNjCMZCLw5sl/ulPfzTgbX/C/9HT1AsJvwK4aUkXRzbsLjEEUkbRPCJURVDROl2FnH/NBHx0jpt/W1r1wmCklusxql8wHW/W8uoVc1Lm0ppirlT5/OiB4urxTKIcECwOTGGzz3kFa2h9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112601; c=relaxed/simple;
	bh=5ChWbFIC5IStbQYg22U9PeCTu/RbG/HOgMXms+fRUQU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I1ZocY4W280w2Ys9PnCFJAdHGWaiMyFSi1UAZMRjBfhzTuhiL7i9YKVr0Br7sUisZ5xMtqaIAL217kFhRAaxEJrlxjH4Ci7ALt0kO/cBRirZ2F4v6YW0gV0LuHwtRw0CIZsh7E0I4UPvfOi8uXzGvYaK1/2y3EpUzGRyfQUopmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WM4g31/V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WM4g31/V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB1D1F000FF;
	Fri, 11 Sep 2026 07:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789112592;
	bh=qo8lCZzrr0jxFPdwpJP9YznMpKDuoy7361WCAbPF1h8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WM4g31/Vrf+RLfX0eR2i5egUY8hD/mjFbMY327xFJsN/xmf+yhsy+FSPwt+sb0nxy
	 NrL9QIRMNI8SjPnYzDyFmq0pK/P/vlU22SZMXwPrhWOe6vnUBBR2aYl69oApj/eKtr
	 TnjbzfEyCVWBm6mbEGW2y073731wvx7QgARI5P0W1PQiiEGaV8EUuf9O+F3aOoX6jH
	 +FmJpj86kyZUrxUjGYUKWwsEN5V0dnJ0VneXPk9nlkkqmvJIIBzYAdzKZRO3EBq2HB
	 NNMgOMSiddo97vMNQT9bYsmfGRqWq0H00Emmd5DHtg3QtNFFp077hljv8bmdolSX2Y
	 RucSydDKx4weA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Revert "dt-bindings: display: panel: panel-simple: Add
 lg,sw49410 compatible"
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260911-topic-lg_sw49410_revert-v1-1-c9385a9e1926@oss.qualcomm.com>
References: <20260911-topic-lg_sw49410_revert-v1-1-c9385a9e1926@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 07:43:11 +0000
Message-Id: <20260911074311.BFB1D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reverting the 'lg,sw49410' compatible from panel-simple.yaml lea=
ves the corresponding in-tree device tree node with an undocumented compati=
ble string, causing a dtbs_check warning.
--

commit 28eecf951716dcb353efba4db6671dff19420f95
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Revert "dt-bindings: display: panel: panel-simple: Add lg,sw49410 compatibl=
e"

This reverts the addition of the lg,sw49410 compatible string from the
panel-simple bindings. The commit states the panel needs more specific
handling and that the intended compatible was supposed to contain both
the display panel name and driver IC model number.

Link: https://lore.kernel.org/all/20260614-judyln-panel-v3-2-07f4134441bd@p=
ostmarketos.org/

> Moreover, the other compatible that didn't make it in the end landed in
> the Qualcomm tree some time ago, instead of the one this revert
> removes, so it's not even used.

[Severity: Medium]
Is this statement accurate?

Looking at arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts, this compatible
string appears to be actively used by the display_panel node:

arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts:display_panel {
        ...
        compatible =3D "lg,sw49410-lh609qh1", "lg,sw49410";
        ...
}

> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 3d1cc11ba3aa4..de722f45f862a 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml

[ ... ]

> @@ -206,8 +206,6 @@ properties:
>        - lemaker,bl035-rgb-002
>          # LG 7" (800x480 pixels) TFT LCD panel
>        - lg,lb070wv8
> -        # LG 6.1" (1440x3120) IPS LCD panel
> -      - lg,sw49410

[Severity: Medium]
Does removing this documentation leave the in-tree device tree node in
arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts completely undocumented?

Running make dtbs_check on the tree with this revert applied will complain
about the undocumented compatible strings lg,sw49410-lh609qh1 and lg,sw49410
for this panel node, resulting in a schema validation error.

>          # Logic Technologies LT161010-2NHC 7" WVGA TFT Cap Touch Module
>        - logictechno,lt161010-2nhc

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-topic-lg_s=
w49410_revert-v1-1-c9385a9e1926@oss.qualcomm.com?part=3D1
