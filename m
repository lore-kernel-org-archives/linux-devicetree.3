Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B382FFF90
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784700291; cv=none; b=GVqmaDxe3gikQUT3IrUQyjVMuKqTMHQeJvUZ6HdwzeDvzIoQKPTSi8nmJogbwQcZMuq6xJeQMLfjNJkzoR3Z1h6/Pc8UVNTDxlazI0yvUP40AdaV1jNVTUd70t08hWIq92HsF05Jy5O8zFIYS/7wcArpxuxi8WYb4+zYkOBiS9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784700291; c=relaxed/simple;
	bh=TXvnioynvAkswgV7c1ISWow5AHCaFDxlJPwVCXAfxjw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ECBocMHpGNUwAkUb4+2cLxB2/NqxBdhUEc1fP3MrRdJbfLere4rPwZDMQXXNK2yzRfXLTiUy5biUHoIouN5aVtGfgUaqXE7c9bOi4e1bj4rA0k1jbWi/LHzqTPGPNY7lKBSkybpcNMi/YHQ35gcm6CbbUZSIyteAOqx2hI2t8TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJo0lKD/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJo0lKD/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D6F1F000E9;
	Wed, 22 Jul 2026 06:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784700289;
	bh=btCZlsM4eIEy5k6jGJecw8PFOfL29Z855bO94wWMBa4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gJo0lKD/dWI3WSuWeKftX7DZltOn7Oy0KgmqxGWmlmBKMU/5cYqL9aZCn2HeC7JBW
	 bz7Sopc5E2xBeSMgrZWf2AM3qywwyfeSsAEpQoTETP/CkXEM+IWh1n0bc4snFxxRw3
	 7C/rCP8vuHSrGDjryEAuPWgayR0TTRJlEQBJd0KvE5uBBS+S19dAo44x/vodd9tbbt
	 KqnQJNr/wx/rmWGXz7JmebO6U6ZhjWVynkDyAyboPDlq7TxdgXf8MoQYMaNIWD1hOB
	 +MvoKhS/Dr0dDfYLJs6iJbq/eSg3+o7UVS2Y/E9GOqJVJDSJsgmIAE9BE2+VbfNW2K
	 vBgRQMEAk3fXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/7] dt-bindings: clock: qcom: Move glymur TCSR to
 own binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260721-tcsr_qre_0721-v10-1-d2fa68c63b78@oss.qualcomm.com>
References: <20260721-tcsr_qre_0721-v10-0-d2fa68c63b78@oss.qualcomm.com>
 <20260721-tcsr_qre_0721-v10-1-d2fa68c63b78@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 06:04:49 +0000
Message-Id: <20260722060449.A5D6F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding schema for `qcom,glymur-tcsr` acts as a clock and re=
set provider but omits `#clock-cells` and `#reset-cells` from its `required=
` properties list, violating subsystem guidelines.
--

--- Patch [1]: [PATCH v10 1/7] dt-bindings: clock: qcom: Move glymur TCSR t=
o own binding ---
commit 9dc2aeb415b01bb3192fd7c7579819d2fd9111f4
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

dt-bindings: clock: qcom: Move glymur TCSR to own binding

The QREF block supplies reference clocks to PCIe PHYs and requires
dedicated LDO supplies to operate. This commit adds a dedicated binding
file for qcom,glymur-tcsr to document the supply properties.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yam=
l b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml

[ ... ]

> +        - vdda-refgen3-0p9-supply
> +        - vdda-refgen3-1p2-supply
> +        - vdda-refgen4-0p9-supply
> +        - vdda-refgen4-1p2-supply
> +
> +required:
> +  - compatible
> +  - clocks

[Severity: Medium]
Since qcom,glymur-tcsr acts as a clock and reset provider, should
#clock-cells and #reset-cells be added to this required list to ensure
schema validation enforces these capabilities?

While this same omission might exist in the shared qcom,sm8550-tcsr.yaml
binding from which this was likely copied, it appears to be introduced
anew in this dedicated file.

> +
> +additionalProperties: false
> +
> +examples:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-tcsr_qre_0=
721-v10-0-d2fa68c63b78@oss.qualcomm.com?part=3D1
