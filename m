Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D6A2ECD1D
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 08:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388220; cv=none; b=EKt5ABRh9xZIJIdkKw4aeo4ZNZZVbXNAUTNq2pvAABdHvDVDQVnbswMsLuhQ12vOEfuwhQJ/JK/Rke0dh3b1trkpkAOmDtnBv4kz0jS6Qt+Zw7pzl1XLHzrntQawnxuIf5Q4g+VQSySD94d/4KyuRP2eEwKZ7kB+dTD//B+chhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388220; c=relaxed/simple;
	bh=HwZzfbMuoem8iHQkn6yR6nwUcKy09+uet+XLTd2nCZQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bNbxH029xqUGOzpLhRcaydvOiCAR0AI8QROGRkS/c+AOp/+L8HP334PqTW807rO9S1uIsg6/bZfsWwQOQ4nZQoSZbP+k3qRCgN7TQO46sc90h/FtayadrBv0F21GqOleHBsuGMwtw7WZIhWR3sgT0AG1JDUkClYQwKRlMBDKeJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MY5YPYzF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MY5YPYzF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6D41F00893;
	Tue,  2 Jun 2026 08:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780388216;
	bh=zkYuPoAU9pIT0z9YvklTJQASKyDqI5XiBldOJSbJ+4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MY5YPYzFae5qpZyVNcGWymLRaoTLOevMnMfLQgWfd2fluIlKsp6y2pFI5tPEL2ilJ
	 Jg4Vy6cFlbWzLskosuKZnnUgfj6PSVbmQH9dkv3YsYPeTGeL+FRvaXg+ARAIPm1sMp
	 QDgkaAGXG2cqL+DZ3kKmwHRkTAk66kJPGggNxocVtS/ycr5u9F4MWMfviYrLg7ltCG
	 tMjRru2Ixaqx794EtdZVxG6ZMuzFthiH7yufJy5BgymWis8Ap1qto/CrcbHzIwexJJ
	 AZAHknc0nV8CieI7iHaJMWlj/2rnNnKzz37GvTRFP4B3Vtm+QE+MghebGnzGasU8VI
	 UMWQyEI31vhjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/7] dt-bindings: clock: qcom: Move glymur TCSR to
 own binding and add mahua
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260602-tcsr_qref_0527-v5-1-8ea174a59d7e@oss.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-1-8ea174a59d7e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 08:16:55 +0000
Message-Id: <20260602081656.3B6D41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added device tree binding for `qcom,glymur-tcsr` and `=
qcom,mahua-tcsr` acts as a clock and reset provider but fails to include `#=
clock-cells`, `#reset-cells`, and `reg` in the top-level `required` list.
--

commit 8298df55a145b1e4fe01a82f3967af5caf49184d
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

dt-bindings: clock: qcom: Move glymur TCSR to own binding and add mahua

This commit extracts the TCSR control interface for QREF on glymur and mahua
into its own binding file. It documents the LDO supply properties and sets =
up
conditional required lists based on the compatible string.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yam=
l b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> new file mode 100644
> index 0000000000000..2b64226271657
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml

[ ... ]

> +        - vdda-refgen3-0p9-supply
> +        - vdda-refgen3-1p2-supply
> +
> +required:
> +  - compatible
> +  - clocks

[Severity: Medium]
Should '#clock-cells', '#reset-cells', and 'reg' be added to this global
required list?

Since this binding acts as a clock and reset provider, omitting the
corresponding cell-count properties allows incomplete device tree nodes to
silently pass schema validation. The 'reg' property is also typically
required for a memory-mapped syscon provider.

> +
> +additionalProperties: false
> +
> +examples:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-tcsr_qref_=
0527-v5-0-8ea174a59d7e@oss.qualcomm.com?part=3D1
