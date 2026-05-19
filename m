Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E1A3438B0
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779212635; cv=none; b=FBlvKilDAVgx4XNmA4rV0T2Bp8c7qAqUtkL68jBaOiWZ6MBB4KfBr8T6ro3xsexZ7EEEg6UPqiFjhuKMNeDL90enlzZh6hisyD5ZcVsDcXwy2A0pJsT2J1kOFTiD+qmH11zXeP86ra41mQlsT2fFjX1ngr8sGWvwJKj9uXF9/yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779212635; c=relaxed/simple;
	bh=/ZNE32bc9qc6ujsOpr0Kdi0Lh2sdW9Q66Rdmk9wbf5k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k138ZZFvPjHaKyfrscdZe1KpBTTMF6PGwEr5HhptdMkWpdKoFZYyQn3m5zYPgzTyJrj3G+urI/QEj6UwEFhyWkANTK9J3e3emYMxdeiNnJw/6/3/r7Gxg5CSS+l0P65aHAr02W6xZFKtmGRShSwYEpEVeetmUlmPdh59aNcgzRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BwJ8wg51; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BwJ8wg51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB2EC2BCB3;
	Tue, 19 May 2026 17:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779212635;
	bh=/ZNE32bc9qc6ujsOpr0Kdi0Lh2sdW9Q66Rdmk9wbf5k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=BwJ8wg51n7nN7szteFm/0VHzfN98C42JtjMdRSSYjeU1000kazWPDSm8jbekC+x8o
	 vLpV3KgrlKWTPo/6RaGQONu7eGEr7T7LKuVTvEPdpK/ApG50I3YEd3lDSlFCXVGVhz
	 20CYFGMG+vciPjoKjOhJIUxpBpGaFQIOvwVuik1vVQ3roO/+MAx3KF09KPONfKhDuW
	 RK95z/0tVyYCgrDVyL42t1lV3jQC8r4xUge0orM9I1eaoe6OjBIJqockiII3YfHYfF
	 /YcSO71ZbnY8NIpi4CLqWsAnoAPTi6ziq/QW1zyrjBPanVRZ1xlEeVW4lIZ+SMzsGs
	 v1msBg8TMxbbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra
 CPUFREQ Hardware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519-shikra-cpufreq-scaling-v2-1-2b09f0e1c9d8@oss.qualcomm.com>
References: <20260519-shikra-cpufreq-scaling-v2-1-2b09f0e1c9d8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 17:43:54 +0000
Message-Id: <20260519174354.BEB2EC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `#clock-cells` property is missing from the `required` list.
- [Low] The device tree example contains unresolved node labels (`cpufreq_h=
w`, `rpmcc`, and `gpll0`), which will cause `dt_binding_check` to fail comp=
ilation.
--

commit 53ba3920bbb9dfa66228fecc65f7b4a4bc5e9ee2
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

dt-bindings: cpufreq: qcom-hw: Document Shikra CPUFREQ Hardware

The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS, but
supports only up to 12 frequency lookup table (LUT) entries. This commit
introduces Shikra specific bindings to represent this constrained EPSS
variant.

> diff --git a/Documentation/devicetree/bindings/cpufreq/shikra-cpufreq-qco=
m-hw.yaml b/Documentation/devicetree/bindings/cpufreq/shikra-cpufreq-qcom-h=
w.yaml
> new file mode 100644
> index 0000000000000..52079ed661671
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cpufreq/shikra-cpufreq-qcom-hw.ya=
ml
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#freq-domain-cells'

[Severity: Medium]
Since the Shikra CPUFREQ hardware acts as a clock provider for the CPU
nodes, should #clock-cells be explicitly included in the required list?

Omitting it allows device tree configurations with missing #clock-cells to
pass schema validation, which could lead to runtime failures when dependent
subsystems try to acquire clocks.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +
> +      cpus {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <0>;
> +
> +        cpu0: cpu@0 {
> +          device_type =3D "cpu";
> +          compatible =3D "arm,cortex-a55";
> +          reg =3D <0x0 0x0>;
> +          enable-method =3D "psci";
> +          qcom,freq-domain =3D <&cpufreq_hw 0>;
> +          clocks =3D <&cpufreq_hw 0>;

[Severity: Low]
Are the labels cpufreq_hw, rpmcc, and gpll0 properly defined in this
example?

Multiple CPU nodes reference <&cpufreq_hw 0> for the clocks and
qcom,freq-domain properties, but the cpufreq_hw label is never defined on
the provider node.

[ ... ]
> +      cpufreq@fd91000 {
> +        compatible =3D "qcom,shikra-cpufreq-epss";
> +        reg =3D <0x0fd91000 0x1000>, <0x0fd92000 0x1000>;
> +        reg-names =3D "freq-domain0", "freq-domain1";
> +
> +        clocks =3D <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gpll0>;

Additionally, the rpmcc and gpll0 labels are referenced here as clock
inputs but are completely missing from the example snippet.

Will this cause dt_binding_check to fail compilation with "Reference to
non-existent node or label" errors?

> +        clock-names =3D "xo", "alternate";
> +
> +        #freq-domain-cells =3D <1>;
> +        #clock-cells =3D <1>;
> +      };
> +    };
> +...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-shikra-cpu=
freq-scaling-v2-0-2b09f0e1c9d8@oss.qualcomm.com?part=3D1
