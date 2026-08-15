Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF96A257845
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800903; cv=none; b=B/4KwVlwpgQIOGs8bjpcYlNgJyWsWyXcPU0vGOcE4jGkMH9FaFVjmZSiBDAwGZ0oLttpEYFnwmw91E93HOlhxt7UGEZ6iAt3aUAUzpqW2/f2OPdFJr62jEjhj1A1pSqRHhdJUsKAb4KDwJ7zU9jeLOoJDPNH5kKcF4/HL09WjuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800903; c=relaxed/simple;
	bh=8TIOmoBNYiIiHh0SrdHTS+dl17ZOPZatz16HCj85Guk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F0uGFRATRTrHXhZdygBL0/wPCZOyZ7GOd/xNUK4ZQ1UrNiNhgcxpqt0GWHDEZp7XdRHuQO9myZ0U7paM+5Gvx3TSjMyKCdbhEYPAszuMjMsR9Zca6kVaaX+cTSKMZLMR/J3V3WDUvx1WGkzW/SnZ90KwufPY0eCu4dE6++NWXa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwdHnkKN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NwdHnkKN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B411F000E9;
	Sat, 15 Aug 2026 13:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786800902;
	bh=Je2xKv0omRVJ9fVNYBhSAaizVZ1J8cVV/gDDHuHdgJ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NwdHnkKNiIBh7nlD/WdHI1U6YiNSqtuXRhV1Mv9Gutw0rRhUqu8PfA35hhAmV4moG
	 um4k31jrdrGy3JO6ERsi3wiU9Bm7l1jrhbKrajTRpHqzeEKIntDTbAp3N+YuNC7Bq+
	 jgl5/u4SEimueFxeS8wVAxeVYu38NMNxouVsOBF7Y7P39MWX1aYP04vgzzp1RhzqEA
	 Qy3TRxlaPApBDR/9GivnpW8V1arAJy+X4d2gPMJIF51KOGpYmyGdp6n9Tcn+iIDtNG
	 ajtEgCq7GHNKRqyDi/aBHRWjzXBk/sq2EMd6oEmtv+0Bj2HiAT4Jgq9rkWriJG5Yyo
	 hHrSOrdyXsQ/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: remoteproc: qcom,nord-pas: Add
 qcom,cluster-root property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260815132541.1575121-2-shengchao.guo@oss.qualcomm.com>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
 <20260815132541.1575121-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 13:35:01 +0000
Message-Id: <20260815133501.F3B411F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `qcom,cluster-root` property is strictly required for ADSP c=
luster members but is omitted from the `required` schema list, and the exam=
ple is not updated.
--

--- Patch [1]: [PATCH 1/8] dt-bindings: remoteproc: qcom,nord-pas: Add qcom=
,cluster-root property ---
commit fca9b39c4393ef8848adae4c6b55bac6904bfd95
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

dt-bindings: remoteproc: qcom,nord-pas: Add qcom,cluster-root property

Document the qcom,cluster-root phandle property used to describe HPASS's
ADSP0/1/2 cluster relationship. Every member of a cluster carries the
property, including the instance owning the shared resources, which
references itself; instances referencing the same node form one cluster
that boots in order and is torn down as a single unit.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.y=
aml b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
[ ... ]
> @@ -101,6 +116,8 @@ allOf:
>          compatible:
>            enum:
>              - qcom,nord-adsp-pas
> +            - qcom,nord-adsp1-pas
> +            - qcom,nord-adsp2-pas
>      then:
>        properties:
>          power-domains:

[Severity: Medium]
Since qcom,cluster-root is strictly required for ADSP cluster members,
should it be added to the required list in this conditional block?

If an ADSP node is created without the property, it will silently pass
make dt_binding_check. At runtime, a missing qcom,cluster-root property can
cause the DSP driver to fail to establish the cluster relationship,
potentially hanging the boot process of ADSP1/ADSP2.

Additionally, the existing example node at the end of the file lacks the
qcom,cluster-root property:

Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml:
examples:
  - |
    ...
    remoteproc@4c00000 {
        compatible =3D "qcom,nord-adsp-pas";
        reg =3D <0x04c00000 0x10000>;
    ...

Could the example be updated to include a self-referencing
qcom,cluster-root property to conform to this new requirement?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815132541.1575=
121-1-shengchao.guo@oss.qualcomm.com?part=3D1
