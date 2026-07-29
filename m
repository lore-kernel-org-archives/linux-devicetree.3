Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3A1381EA9
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785293087; cv=none; b=oP4ptf3GIFXRMZ45QIoU0Im2pATyCkOMvrEOkhCmjGVUpz2f+OFP9iQsH5nIj0Bjy7O9aNpzEkLvmzViJgKhMRytBKZ5ypN0ytyNovMpirAiAauPQj3GhqWOYQ5SBtCCcragD1+3JW7Px9LaIfmhVbxh7Yur5fjHNxXGAjUZV1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785293087; c=relaxed/simple;
	bh=yg3PdYK0YqTNsWrPwkMb29LX+hl2JWjXUFgchKmEFN0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F3Dr2bPIZB+mH47FyqpIkFTVkmyH6mQCwCoTpsl1Br/yoPR8UApZpSRHrRy7LPzs8AmtP+vpgCLL91XgI2rNaQd2ebvZ9MIA16Ctc/4y9V8DV4rnjR98TEobYVdg6V4YWyAJrbNKPn3L6rGpqit7q0Ahlu7oj9LwJE7XYa9H3sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AwukmhR6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AwukmhR6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F2F1F000E9;
	Wed, 29 Jul 2026 02:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785293086;
	bh=TCryhivHoMNZd8P7j57FoTLcT7vTlgUHexzIf0uU4Ck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AwukmhR6pKKiH45mwjxKaiXhmrxuHP/ZpXUE9zOjd8eQFO9MwUBlLKRPOD18DBbxG
	 Di3CiLjeDcBIvcY2AoBYvVRm7LBNuF9rPICydGQV9GO5Ww94EU1c4Xbcta1TazrkLV
	 K2N0UGmfYuexMeTxmgQzp5mvrkVAR8g9/sJJx2DcK/KcgxiR6LjWkYWw4yiCUotVKN
	 U/mDOYMBEQ1C+7aWeZX2eN7FrHyHB3NKTFoby5xbe4ZsPCxfkCcIG2vgwoiE4Eljye
	 WIUOFaVN5b26VKeKZmf6zN2389E+dbBJSDyFrhtiamrPiA97Plnl0UsbOtNnepKGl9
	 OZUZb+cijnSpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: remoteproc: qcom,nord-pas: Document
 Nord PAS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729023508.879752-3-shengchao.guo@oss.qualcomm.com>
References: <20260729023508.879752-1-shengchao.guo@oss.qualcomm.com>
 <20260729023508.879752-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 02:44:45 +0000
Message-Id: <20260729024446.39F2F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The macro `IPCC_MPROC_ADSP0` is defined without a value in the YAML=
 example, causing a cell count mismatch that breaks `dt_binding_check` vali=
dation.
--

--- Patch [2]: [PATCH v5 2/3] dt-bindings: remoteproc: qcom,nord-pas: Docum=
ent Nord PAS ---
commit 6e5bdff8032d03019c9e668110ed03437c7f4597
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS

Add a dedicated binding for the Qualcomm Nord SoC PAS devices: ADSP
and CDSPs. Nord ADSP uses CX and MX power domains while the CDSPs
add an NSP domain on top of that.

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
Is this macro missing a value?

Because it is defined without a placeholder value, the C preprocessor will
evaluate it to nothing.

> +
> +    remoteproc@4c00000 {

[ ... ]

> +        glink-edge {
> +            interrupts-extended =3D <&ipcc IPCC_MPROC_ADSP0
> +                                         IPCC_MPROC_SIGNAL_GLINK_QMP
> +                                         IRQ_TYPE_EDGE_RISING>;
> +            mboxes =3D <&ipcc IPCC_MPROC_ADSP0 IPCC_MPROC_SIGNAL_GLINK_Q=
MP>;

[Severity: Low]
Will this cause dt_binding_check validation to fail?

Since IPCC_MPROC_ADSP0 evaluates to nothing, the cell count for both
interrupts-extended and mboxes will be missing one cell. The ipcc interrupt
and mailbox controllers expect 3 and 2 cells respectively.

> +
> +            label =3D "adsp";
> +            qcom,remote-pid =3D <2>;
> +
> +            /* ... */
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729023508.8797=
52-1-shengchao.guo@oss.qualcomm.com?part=3D2
