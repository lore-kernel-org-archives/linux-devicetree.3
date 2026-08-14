Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4C017B418
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 01:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786672577; cv=none; b=f29B+M5sTkcGFhWZmgxTI6MMpTt9JnBLkncKKe6RhYVSlljhlo8bBRPtdNLDgjobSE66VKFXhaus6oCJPujIXGVx2y7639qsR0U9+ZCK8Hp07ilP8pRlq+DdhvxNo45GRyfz+USUNnn0TxBkW3Mev6IW5E8Ypp5G2+1SnvoK4k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786672577; c=relaxed/simple;
	bh=N13SkcRrnR39wvYU/J/LRJSjQ/13lm685jNCCa5Sg68=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nIjJD1DKkGB72mnqhHWIDs8VNlu2kEig374Y2zaBtGJPKMwLesHLLpOgoq2KWmh/mrw2jrv4U4QSe7faiLVDRbq5qaTFuRXY/Fm87ZJlgZbcxj3tTAdbNftco2fnAxJCZuECMru0sXj2U83LxkwFe7DdSqK3zLfGw3+2kYs9r7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwXSkQws; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwXSkQws"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9D51F000E9;
	Fri, 14 Aug 2026 01:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786672575;
	bh=fp9Luq5tJMNd1NfmlqQcXiJAhnFSe01gOETX37hVKaU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GwXSkQwsLFmRFWJeueeBWKrWAfoEE4bNJPyPuww4B+V4aI4ucWQRu4ObEwW2J/j+N
	 RPURapAoU6aXDCFqMWZFd2paSFkXJjpRHOAMOIqgXJNPHjBJMAu3MFY4N1agFh7siJ
	 QylT7aJLJSvNQAhWKkmbeV8sSOL2ZpsX5U5l6juP2LcsHPgdbSr38+NjD1HZfVZ8Tn
	 qdiVVlwqVsMdM+XH7bU/nySFLOhA7qtTl4TKwtPtSgQE9/uMb05P/Dq8rn4AZXOmrf
	 kATDr0RAV8xtR8QhkQGbK9oYs5j8bgN8/csOg4eJbqcv2gJLHcBVie9uJOTx9fUe1L
	 wz7rFk2ohvKMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V1] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP
 UFS PHY compatible for Maili
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nitin Rawat" <nitin.rawat@oss.qualcomm.com>
Cc: olteanv@gmail.com, conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org
In-Reply-To: <20260814004725.1368027-1-nitin.rawat@oss.qualcomm.com>
References: <20260814004725.1368027-1-nitin.rawat@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 01:56:15 +0000
Message-Id: <20260814015615.6C9D51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The new compatible strings `qcom,maili-qmp-ufs-phy` and `qcom,ha=
wi-qmp-ufs-phy` are omitted from the `allOf` conditional blocks that enforc=
e strict constraints for clocks.
- [Medium] The fallback compatible `qcom,hawi-qmp-ufs-phy` is not defined a=
s a standalone base compatible in the schema.
--

--- Patch [1]: [PATCH V1] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add =
QMP UFS PHY compatible for Maili ---
commit c983ddf99ae7f556a6b7a2870c88327054b94d8c
Author: Nitin Rawat <nitin.rawat@oss.qualcomm.com>

dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP UFS PHY compatible for=
 Maili

Document the QMP UFS PHY compatible for Qualcomm Maili to support
physical layer functionality for UFS found on the SoC. Use fallback to
indicate the compatibility of the QMP UFS PHY on the Maili with that on
the Hawi.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-=
phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.=
yaml
> index b2c5c9a375a35..f74434f51653c 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> @@ -16,6 +16,10 @@ description:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - qcom,maili-qmp-ufs-phy
> +          - const: qcom,hawi-qmp-ufs-phy

[Severity: Medium]
If qcom,hawi-qmp-ufs-phy is used as a fallback here, shouldn't it also
be added to the standalone enum list further down in this file at line 42
under properties:compatible:oneOf:enum?

Without it being defined as a standalone compatible string, a device tree
node for the base Hawi hardware using just
compatible =3D "qcom,hawi-qmp-ufs-phy" will fail schema validation when run=
ning
dt_binding_check.


[Severity: Medium]
Do these new compatibles need to be added to the allOf conditional block
that enforces strict clock constraints at line 88?

Currently, Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.=
yaml
has an allOf:if block starting at line 88 that enforces a strict 3-clock
limit (ref, ref_aux, qref) for most modern PHYs.

Since they are missing from that enum list, device trees using these new
compatible strings will silently bypass the strict clock constraints and
fall back to the loose global defaults. This regression allows incomplete or
invalid clock configurations to pass dt_binding_check validation.

>        - items:
>            - enum:
>                - qcom,qcs8300-qmp-ufs-phy

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814004725.1368=
027-1-nitin.rawat@oss.qualcomm.com?part=3D1
