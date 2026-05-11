Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B596A3D3B3
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778540401; cv=none; b=OmsoVOAiEQn/LWVQBmGG67842PbwQiYhpfyAa/T44ipTa+BDd63HA95+3prn5edOJKtt2Ua8pp9ssLVJ3Pm4G5a2Te8/s2C9wYxEfYvbeABX20Jr6nEZU+qa55/oIUnTPBEHj/cYvAxLQp/wnNLZ2UyGAPIzalRBPuGOQ0ugszE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778540401; c=relaxed/simple;
	bh=IUSD1xQBvSsR4f5k5K8sIGsAzppXgfYIdJC98QQoJr0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AfS7R0OUhZ8Aqri6wR7FdQFRkqAq7DwBLu7hhNKl01f1f5e5EPC1ggajtiTP1znElgAfbApGw7RR/GDPLsV7XXdy5Wkurn1RFkdrRlHizr5c69H3G+vT9y3F2z55+LcT0uUicMHRPjryHT2r01WjhGDcZIkQLD8AnWYPFbGb75A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlFyJOcX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlFyJOcX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B220C2BCB0;
	Mon, 11 May 2026 23:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778540401;
	bh=IUSD1xQBvSsR4f5k5K8sIGsAzppXgfYIdJC98QQoJr0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=KlFyJOcXsXoh3OrNJhKNK/ZTEEDdsA+scy+vOUXbLPyVgTq/O6yp+Mrn9PCyCe8h+
	 /s9wnCj+Iu35M5BeIK7oqyGA+/hQA/f25vfqySPIHlSWYGdvtlgCXN3sfRE8qsax5+
	 aMWq4qT9IUc/t3zI51JDktsGQr1gv8WCLs//+S6p+cPHXm8I9zosfg07wlAk842Bsa
	 hg7PQ3sKlS5qMh2PagZEQ1VVGCB6JIvncSuaRwxnfwwWSgQ+SjOLQR8HO+I//zVVYw
	 H0tWbO+F3523pRZhG2bzSSCKbWer6Ybsikwxav+oxIZeq1w7ByobWQ71kDvZRzBWzU
	 MNsrh9A5CBgZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: i3c: dw: Add apb reset
Reply-To: sashiko@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511031945.3228-3-jszhang@kernel.org>
References: <20260511031945.3228-3-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:00:00 +0000
Message-Id: <20260511230001.1B220C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Adding a second item to the `resets` and `reset-names` list with=
out specifying `minItems: 1` makes both resets strictly required whenever t=
he property is present, breaking DT schema backward compatibility.
--

commit 0c4b11b6e45b719eb15a1a87171391a4bfb310b9
Author: Jisheng Zhang <jszhang@kernel.org>

dt-bindings: i3c: dw: Add apb reset

This commit updates the DesignWare I3C master binding to support an
optional APB interface reset signal.

> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yam=
l b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> index 613dce7757bc3..2575442b28ff4 100644
> --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> @@ -38,10 +38,12 @@ properties:
>    resets:
>      items:
>        - description: Reset signal
> +      - description: APB interface reset signal

Does adding this second item inadvertently make the APB reset strictly
mandatory for validation? In dt-schema, when items are defined as a list,
minItems implicitly defaults to the length of that list. Without an
explicit minItems: 1 constraint, device trees defining only the single
core_rst reset might fail schema validation.

> =20
>    reset-names:
>      items:
>        - const: core_rst
> +      - const: apb_rst

Should minItems: 1 be added to both the resets and reset-names properties
to maintain backward compatibility?=20

Since the driver gracefully handles a missing apb_rst by using
devm_reset_control_get_optional_exclusive_deasserted(), adding the minItems
constraint would keep single-reset configurations perfectly valid.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511031945.3228=
-1-jszhang@kernel.org?part=3D2
