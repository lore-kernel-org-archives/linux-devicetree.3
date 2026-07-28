Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C9C418A30
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228558; cv=none; b=Kxnbw3dQsdhDpZAZA6j7e+6fWiar/8IghZndbGY87o7I1sTVf/HRdxTCLEfQZdOPhjYuNEtjyklDknCZ4iLx/WMtO93Cd2OMk3nNADThp/GljcHQOS8hx+JykE6sugXEk6cw/Mbb+aP5enP0rTigooh4loszqyKuCkCPTnm3WIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228558; c=relaxed/simple;
	bh=58KCQNkOaUHMCvXa0gWmwbcXf7NF7y3YxqznXaxAQ2o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EiKulaQ6Vs+f07tBoW8/Wa/rWg1wY8Bzo0ANGWW1bYWBEG0+IBSCumstZI/R7iedDf/dfC2BdcKjhj+fIyWzGF0rPWmwXbvRe1GG2aui06zOrArZ50vWkZeSeMhL/jCuIsjgN0pwoSux7Pqm9CssBgZuYsQIz9AzfwnhB2NcXa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXA9rRzl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXA9rRzl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E52D1F000E9;
	Tue, 28 Jul 2026 08:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785228556;
	bh=GZ9idIr+9Ao5JRBnKy/EDUUv2qD9jWNdZ/VJo84AJi0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AXA9rRzlpGY0NUSm4/ffcxwydIqqQaXh3/Ufdcrn4PkW5QEWfyV1FWBbGwdWmuK6Y
	 prDG7ZOfmVV/+loxqwsmRKtv8nyMCKrLDSDfZR9k4mR9YeACUsv8fggufzCSRsp0AZ
	 pGRtiPQkWcyp90H3eHSAhhyfUHT7m2NI0xHP5+RJVPiSGpjOQVRdBlafNUeudiFlkM
	 T3RSsjxJUe+xrQ4yOi1U8OjV1B5LediaaRaFt0MOD2NWSrsNAxeKTaDhGXMcVwgn9S
	 CZ75ea3LVZOYylCmIOKZWb+RGpsTQm8sXq+w/DNllwvnDBhCIGthG0kteVgtY+Gdy/
	 0nmwt8b4bFwcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: remoteproc: qcom,nord-pas: Document
 Nord PAS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728084012.685036-3-shengchao.guo@oss.qualcomm.com>
References: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
 <20260728084012.685036-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 08:49:16 +0000
Message-Id: <20260728084916.9E52D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The macro `IPCC_MPROC_ADSP0` is defined without a substitution valu=
e in the device tree example, causing it to expand to an empty string and b=
reak phandle cell counts.
--

--- Patch [2]: [PATCH v4 2/3] dt-bindings: remoteproc: qcom,nord-pas: Docum=
ent Nord PAS ---
commit 8286180001504872f03eeec58c9b7bc74b5768d3
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS

This commit adds a dedicated binding for the Qualcomm Nord SoC Peripheral
Authentication Service devices. It documents the required power domains
and other properties for ADSP and CDSP instances.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.y=
aml b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
> new file mode 100644
> index 0000000000000..e90d2953ba692
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    #define IPCC_MPROC_ADSP0

[Severity: Low]
Does this macro need a substitution value? Defined this way, it evaluates
to nothing during C preprocessor expansion.

[ ... ]
> +        qcom,qmp =3D <&aoss_qmp>;
> +        qcom,smem-states =3D <&smp2p_adsp_out 0>;
> +        qcom,smem-state-names =3D "stop";
> +
> +        glink-edge {
> +            interrupts-extended =3D <&ipcc IPCC_MPROC_ADSP0
> +                                         IPCC_MPROC_SIGNAL_GLINK_QMP
> +                                         IRQ_TYPE_EDGE_RISING>;
> +            mboxes =3D <&ipcc IPCC_MPROC_ADSP0 IPCC_MPROC_SIGNAL_GLINK_Q=
MP>;

[Severity: Low]
Since IPCC_MPROC_ADSP0 expands to an empty string, will the &ipcc phandles
receive one fewer argument cell than expected here? This might break the
required cell count structure when the example is evaluated.

> +
> +            label =3D "adsp";
> +            qcom,remote-pid =3D <2>;
> +
> +            /* ... */
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728084012.6850=
36-1-shengchao.guo@oss.qualcomm.com?part=3D2
