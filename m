Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F16962809
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139040; cv=none; b=alijlp/LpLBbBBdAaIOH0wxZnCrglY3CDLDv0IMcb27SSmUmfCbP6HcCp22pp/Rk7Xu5atZcWpwGi+0SJrh8/YqYCMMYT4ZI5XP+5OzW+/CjQbdVUa2eAsgG1i8PKRqbTqTVVf/WBZoSp+3Q0Z0Ff7ncOmfTMJ0zhwAes7fBSd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139040; c=relaxed/simple;
	bh=kumZ6hbVPH2jT/lJGLIQXfk+sL+MPqtuOi3sguaeRDE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vly74LcznAAc4qvQK+DAa4FJ2POsKFJ76f8hp4UxAdtW1FWR2ieYPUaAK7mOKZRRff7Yehy8EphTWfouY5Zi70n32iCyJuFlJLeTTs3mgSQq6N4gfl1tFaRsFy6La2kGNNkbYe56nwcnDlKtO1fB/tw2PSzelSIKcH8dvLhaxGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYeE+GgB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYeE+GgB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5531F000E9;
	Mon, 27 Jul 2026 07:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785139039;
	bh=0QEFMDWwKR7apoZR8+pGXehn0i+YLrTiScA+nteR8JQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BYeE+GgBCXlKiW07gjIa10yV4GHv+Vl+lAk8MwIeoH9Ga+CspLBvN8y/icuuc0yz9
	 GLHhqQBRM+qS4gInUa7emxchqQ+X8c6MYw16CuCKCxloMFHaF60KcAks6ry1ggqW9w
	 Z6uVwCugMFOwYhHgW+hNOZtj50R1i7fvWY87kxa8Ltq1qlajaTi4xWOUMxpE/HjSG9
	 pi6D05U7glRymf6DoWfU88RLgwt4ElbTIFjjA9CgvVsDg5ekFNZ7RejgGqiebbifxp
	 T220tfpljL2mGiKW0tNl/AYah6CKKp/Cl+hv3+by8X6a3TXYIxamIKAWi0AWBY6wic
	 44JNHp+bMRemg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: remoteproc: qcom,nord-pas: Document
 Nord PAS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260727074621.561661-3-shengchao.guo@oss.qualcomm.com>
References: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
 <20260727074621.561661-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 07:57:18 +0000
Message-Id: <20260727075719.0A5531F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The example defines the macro `IPCC_MPROC_ADSP0` without a value, w=
hich results in an empty token replacement and corrupts the cell counts for=
 `interrupts-extended` and `mboxes`.
--

--- Patch [2]: [PATCH v3 2/3] dt-bindings: remoteproc: qcom,nord-pas: Docum=
ent Nord PAS ---
commit 512d0175c2386f0e4a6fa83886169981b42b9b9a
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS

This commit adds a new device tree binding for the Qualcomm Nord SoC
Peripheral Authentication Service (PAS). It defines the required properties,
power domains, and interrupts for the ADSP and CDSP devices, and provides an
example device tree node.

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
Does this empty macro definition corrupt the cell counts later in the examp=
le?

Because IPCC_MPROC_ADSP0 is defined without a value here, it evaluates to
nothing. This causes both the interrupts-extended and mboxes properties in =
the
glink-edge node below to silently drop the required client ID cell. The IPCC
mailbox controller expects 3 cells for interrupts and 2 cells for mboxes.

> +
> +    remoteproc@4c00000 {
> +        compatible =3D "qcom,nord-adsp-pas";
[ ... ]
> +        glink-edge {
> +            interrupts-extended =3D <&ipcc IPCC_MPROC_ADSP0
> +                                         IPCC_MPROC_SIGNAL_GLINK_QMP
> +                                         IRQ_TYPE_EDGE_RISING>;
> +            mboxes =3D <&ipcc IPCC_MPROC_ADSP0 IPCC_MPROC_SIGNAL_GLINK_Q=
MP>;
> +
> +            label =3D "adsp";
> +            qcom,remote-pid =3D <2>;
> +
> +            /* ... */
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074621.5616=
61-1-shengchao.guo@oss.qualcomm.com?part=3D2
