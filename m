Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4799E324B32
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416109; cv=none; b=nmIUlpovkFpt+Ox8F9UvpWhL6X8tPoH6mW4vu7DWRAlXAM7N9c/wDn5oODtcLeg0yHX0j2vnPpWxlKxY0Haz/g600eSHt58XMS98AssrQvg+H0jUo4O9BC9WrcF0Ew1HhSL0zR09mgpyWb6mvFYeTA1yzi29Gbqa6IXC7z73AFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416109; c=relaxed/simple;
	bh=6Ulr6s0a5nBKrP3MY7BVic1BebDD8HP3u3l/Bb9Zko4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MCnfJwCOuy2pR5pT+wWCNCcxS2dxCTa/doiS8NjF6YxdQZZ4+H/TAiytFVD7BPMySDP8dC54H4DkPyE6OXlxLeaqjPN+DyqDIzVZcZ6F53tRn7d3f98xdMxrRMsKVIxVWlEd3Qu88qMarT1SJUf2MglXp7FgJysV1OCOcZGXnyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9kOy9JF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9kOy9JF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B051F000E9;
	Tue,  7 Jul 2026 09:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783416107;
	bh=eG7eljt8rLegRcKkyenO0IK10zzYiQFvVeQPZhaNvgs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l9kOy9JF7X0ndMtH7sl04/DzzMBRrfYZaG0br4QY7+QOg7pHD9CiVKHoAqtb/Mbb6
	 +ml1+YKb27U9Pe8ji85bpMW9BqL3OVviVDtPDKOgyvcM/sXD5oQjURna2EdVjWVVy4
	 YdX66yIODAnRSu01osI7EA9Mnljv+7esjpiMXipvTheG19AHiSIs0cVokO4aOFe28G
	 +JA17jH05qXSsUULAjTZ7cDruoACqi1BkhOuyawCBBbk6LE8234EgvkqWtOm8EKhpd
	 eefdpI+0oEFDFYcMX/m7KI70qIaGgrQ1qNvpvQLvulpWisp8Um4bQy/AI9Ar5upN4q
	 60x5i+aSIKxrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260707-fix-tracenoc-probe-issue-v5-3-bf733ed9ebd0@oss.qualcomm.com>
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
 <20260707-fix-tracenoc-probe-issue-v5-3-bf733ed9ebd0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 09:21:47 +0000
Message-Id: <20260707092147.B7B051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete migration of the traceNoC binding leaves the sm8750 d=
evice tree violating the updated schema.
--

--- Patch [3]: [PATCH v5 3/5] arm64: dts: qcom: kaanapali: fix traceNoC pro=
be issue ---
commit 9b027ffc45673a64efa19cd6c9d0acb4efe7595e
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: fix traceNoC probe issue

This commit drops the arm,primecell compatible string from the traceNoC
node in the kaanapali device tree. By doing so, the device binds via the
platform driver rather than the AMBA bus, bypassing the missing primecell C=
ID
and fixing an indefinite deferred probe issue.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 7aa9653bd456e..5d0e7e8c2e58c 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
[ ... ]
> @@ -5004,7 +5004,7 @@ tpdm_pcie_rscc_out: endpoint {
>  		};
> =20
>  		tn@111b8000 {
> -			compatible =3D "qcom,coresight-tnoc", "arm,primecell";
> +			compatible =3D "qcom,coresight-tnoc";

[Severity: Medium]
Does this incomplete migration leave other device trees violating the updat=
ed
binding schema?

If the qcom,coresight-tnoc.yaml binding was modified to strictly accept only
the single qcom,coresight-tnoc string by explicitly dropping arm,primecell,
then arch/arm64/boot/dts/qcom/sm8750.dtsi appears to still retain the old
compatible string:

arch/arm64/boot/dts/qcom/sm8750.dtsi:
			compatible =3D "qcom,coresight-tnoc", "arm,primecell";

Will this cause a make dtbs_check validation failure for sm8750?

>  			reg =3D <0x0 0x111b8000 0x0 0x4200>;
> =20
>  			clocks =3D <&aoss_qmp>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-fix-tracen=
oc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com?part=3D3
