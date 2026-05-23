Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBC933F58A
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779527497; cv=none; b=XMHEpATSQIOyz8MakGwBtKEyKONKioZRri2ikYAcAgKVT5AUBPRk3khUgOEhkwgcQwJzpXkSMPSlV4mGYl2W2u5ZlIfh4J0MvXdPgDo9I9krSG7fKGNI307HkI4lK4o0981FwwSF/6mxjMOKaHH/qEuygPUBPXUm7SW6oCeS1fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779527497; c=relaxed/simple;
	bh=0TZQ3EUVWKOFdSL6kXdEODqjZIz67GTCEIIK1OBQdSw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OGaj4r/eB81oYJH4FqEMHKXCmk+txFQNCCPDryJ4j3xwR3kDE/FVBX+xdHG9hm45Xi2Eqa663GdWWvgWAPprT9iKjD0Mp5e04ZHtcalDEOxCLwYGXbVRCSMcF7JOTbmM1cNwdrp4+qsBEpfCBS/ay0J/8LsS1anACbAYlflgyCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKX1Lp+l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKX1Lp+l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851FB1F000E9;
	Sat, 23 May 2026 09:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779527494;
	bh=oVvakX/0xGrlRNKYPloQe+JduCDuEEHz9DJP5bI+r4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UKX1Lp+lwzIVswZeUYPCRfKRi7GMZL4BVNx2zxKzlaBQArT3LctzNmx1BPXPPrf0A
	 Q4/427Mi/V8AQzzYouibXoQ317EumdRjHAKNgXROgNeqJj4MuNvcso5lZeV+yqLeox
	 +4D2U+FNR2F8RDHAGBr5xRD8AHlkiD8CS88lgtIbc3WURZuFFnJ3dkprt9agcXP2jm
	 umJMLIm1QMhsCtgRWKgRAaghS1xfhmMadGUf6Fkw4D9iIxTFwCGcKuMeCbtOTWoWF0
	 TTY0npzgFZYCygfEf1P1iMzFo+LKyfmDAWHsqH0sATbpJ8AyR7o8IblZ8bkMTt0s11
	 Kk/z5Sd6pgT/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V9 1/3] dt-bindings: soundwire: qcom: Increase max data
 ports to 17
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sibi Sankar" <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260523085511.2532669-2-sibi.sankar@oss.qualcomm.com>
References: <20260523085511.2532669-2-sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 09:11:34 +0000
Message-Id: <20260523091134.851FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Globally increasing maxItems to 17 for port properties weakens s=
chema validation for older SoundWire controllers that only support 16 ports.

Pre-existing issues:
- [High] Port allocation logic fails to properly check if the highest port =
is busy, leading to silent collisions where the maximum port index is alloc=
ated repeatedly when all lower ports are exhausted.
--

commit 4f104dadbb8cc83ffee25439c24bc3ee896cb832
Author: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

dt-bindings: soundwire: qcom: Increase max data ports to 17

This patch bumps the maxItems from 16 to 17 for all qcom,ports-* properties.
This accommodates SoundWire controllers v3.1.0 which feature 17 data ports.

> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.y=
aml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> index 9447a2f371b56..8e6973fa229c9 100644
> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> @@ -90,7 +90,7 @@ properties:
>        or applicable for the respective data port.
>        More info in MIPI Alliance SoundWire 1.0 Specifications.
>      minItems: 3
> -    maxItems: 16
> +    maxItems: 17

[Severity: Medium]
By globally increasing maxItems to 17, does this weaken schema validation
for older SoundWire controllers that physically only support 16 ports?

A device tree for older hardware (e.g., v1.3.0 to v2.2.0) could now incorre=
ctly
specify 17 ports and pass dt_binding_check.

Should this use conditional allOf / if-then blocks based on the compatible
string to enforce generation-specific bounds?

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but there appears to be a pre-ex=
isting
logic error in the dynamic port allocation that these bounds protect.

Looking at qcom_swrm_stream_alloc_ports():

drivers/soundwire/qcom.c:qcom_swrm_stream_alloc_ports() {
    ...
    pn =3D find_first_zero_bit(port_mask, maxport);

    if (pn > maxport) {
        dev_err(ctrl->dev, "All ports busy\n");
        return -EBUSY;
    }
    set_bit(pn, port_mask);
    ...
}

Because find_first_zero_bit() searches the range [0, maxport-1], it returns
maxport if no zero bits are found. If ports 1 to maxport-1 are all busy, the
check "if (pn > maxport)" evaluates to false.

Does this allow the code to blindly assign maxport and set its bit without
verifying if it was actually free?

It seems on subsequent allocations, the search will again find no zero bits=
 and
repeatedly assign maxport, causing silent resource collisions where multiple
audio streams share the same hardware port.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523085511.2532=
669-1-sibi.sankar@oss.qualcomm.com?part=3D1
