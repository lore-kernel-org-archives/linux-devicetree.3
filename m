Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51763F4DFC
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289282; cv=none; b=dmzAv3UIjqwQCZFTakOOh/rncbNoBpQEl3Jsry+/Gn1/EOdnHS1ihvSeEPQm/XzUz5JyKz31kU5fAbvU2Ifw+z5ugZdnY79xBkq81JR9B1xXxAoT2KAIROBICZ0m6plWaVCvSjBJo0adANW2vFylnpfpHnaqLAxYexk1GBsgcEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289282; c=relaxed/simple;
	bh=zXItqWiDsxVGuwrKkRKKnlvSuQgrJAxuLG7PITqkoyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C1W77wSVJJxtRRxaZY9S67DLpQPHhcSphS3mvh2DgSdeYWgtllqOCN23r6+0Eq+bJ4bQpEdsVvjk0efMv4AlBcuaFzhqcuoZk4ALWE7x5/WeMYdF4pCBqSnGko1QM4brRUGc634iu7u6UDSzmnNPoYuzzPMIcFLDhjnoXulzGD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HMPAACyL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMPAACyL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9DC1F000E9;
	Wed, 20 May 2026 15:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779289280;
	bh=D+A7KLGH+vUkFIwe6y0zlIyHYqFL5mMqBDMVfVT5jAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HMPAACyLyfl6Opv05e769MmC+eq4qA0vJUVf9M99RF0VBaqnLDHVLa8h/0Lkth1W6
	 1JwlTfPsJyG523ynIrrl6xpc7vUnHhEzF0t5hpdr5iGW3x/gCGKzoJOo8MBuza3gGk
	 C++CTpIJ2UyBy4zzuWjuPu2HHNUcWpG05Z34S0EF/TOZxj89QQphqblUs46pPh+sCU
	 CHWKqyWbOmeTV+84nDwboKKupdxl7Wob5jAl6XfxN67PzjRAbTzI1dYAPqVhmm/QGo
	 T/lzuTH+ueGegyXvQu1ZYI05yDF8VosjeeX7iqglvZq3tQQdhvcWVaYVVVoNdOqeRL
	 GgtzApVaEKSAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,shikra-pas:
 Document Shikra PAS remoteprocs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260520-shikra-rproc-v2-1-583a2e413a3a@oss.qualcomm.com>
References: <20260520-shikra-rproc-v2-1-583a2e413a3a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 15:01:19 +0000
Message-Id: <20260520150119.AA9DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The dt-binding example incorrectly mixes SMD RPM components with RP=
Mh power domain constants.
--

commit 69848c4ac32e863c52c6df41cb4da6b7c711fe47
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

dt-bindings: remoteproc: qcom,shikra-pas: Document Shikra PAS remoteprocs

This commit documents the device tree bindings for the CDSP, LPAICP, and
MPSS Peripheral Authentication Service (PAS) on the Qualcomm Shikra SoC.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas=
.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> new file mode 100644
> index 0000000000000..f0b9e04d84620
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> @@ -0,0 +1,157 @@
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
> +    #include <dt-bindings/interconnect/qcom,shikra.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    remoteproc@b300000 {
> +        compatible =3D "qcom,shikra-cdsp-pas";
> +        reg =3D <0x0b300000 0x100000>;
[ ... ]
> +        clocks =3D <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +        clock-names =3D "xo";
> +
> +        interconnects =3D <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
> +                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
> +
> +        power-domains =3D <&rpmpd RPMHPD_CX>;

[Severity: Low]
Is this using the correct power domain constant for the Shikra SoC?

The example appears to mix SMD RPM components with RPMh power domain consta=
nts.
It uses an SMD RPM clock (RPM_SMD_XO_CLK_SRC) and the rpmpd phandle, but
assigns RPMHPD_CX to the power domain, which is an RPMh constant.

Since Shikra is an SMD RPM SoC, should this use an SMD RPM constant like
RPMPD_VDDCX instead to prevent semantic inaccuracies and potential copy-pas=
te
errors in actual device trees?

> +        power-domain-names =3D "cx";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-shikra-rpr=
oc-v2-0-583a2e413a3a@oss.qualcomm.com?part=3D1
