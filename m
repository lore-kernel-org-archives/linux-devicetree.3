Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B46155C82
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784508496; cv=none; b=ufMWntwGN0Gjjz9W8OL3QXWdgHk6hAplABsymD1uTe6bJKM/YKaQnMPWsuBpYtBw5iHxtOLKmKdenIRYD6B136XdRb1/qjW+SlRcvcNpmdo6B2/aLXabLjvNtDxt6uV5Atv8DLl3R4ic3tsQ/uPwAxBNhvNxSSQQX/sfF35Cvco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784508496; c=relaxed/simple;
	bh=gDPboerhn+wavbbWWCQ+Xf69Vf8MnTMYJZJb7p38np8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oSHVT2bvIdXfEx2IbT/W2rBQ5Wm5HT6qRMTFV5c74/d/GaJWCSwz6XnORFCsU+GEcVUSr+sPrPJPAAbU1f6J4mYUNNhs9tvgCk8Nt4UptMUApwJmTo8pNXs4MrqOJQ5jALipapLRJRyB7Wwaz88rrh57cCB0y/Bh5jH+5A6E3oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtZL4YWD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtZL4YWD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C611F000E9;
	Mon, 20 Jul 2026 00:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784508494;
	bh=g4UH8wZ9Zm+/vFrzCrU93hwDmfwCLQ92uGsR2HZEvZ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gtZL4YWDVbYxYe09dX97jRVlBDQo0hyStk6ApJD+aJ8/ZQDHVG+mKMmMOl9crzZsj
	 xR0gaoQOVyNOpmvaU5lcz3DhQlcCggygozT//lEa6uat2XYCGmDITg02IWNY4XBSRW
	 +hXvObSaVylgq1CoOCwVYM2PKJ3JUMIXE0/VQcff/+YSwnDJhn+DHnqJr8ohw1ePsu
	 LjM5P5RIigkHvUNd3vHCkufXXd3gObP8wDEYTAdaY7dt2k0xHJmv8NbfuWhJxCQlhI
	 RSbVLkASlfbROnWao09v7KSn+hwy2O8csOld/sQBiuGjfAQW3GzanweIMb/rnzN5TT
	 WL5tYVpJ8sGQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] clk: composite: Export devm composite pdata
 helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang" <wangjia@ultrarisc.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720-ultrarisc-clock-v4-1-fe639d63bbac@ultrarisc.com>
References: <20260720-ultrarisc-clock-v4-0-fe639d63bbac@ultrarisc.com>
 <20260720-ultrarisc-clock-v4-1-fe639d63bbac@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 00:48:13 +0000
Message-Id: <20260720004814.58C611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Commit message inaccuracy: Non-devm pdata composite helpers are =
not actually exported, contradicting the commit message.
--

--- Patch [1]: [PATCH v4 1/3] clk: composite: Export devm composite pdata h=
elper ---
commit 796e54251258da0c70103cd9b568babacd07c5ed
Author: Jia Wang <wangjia@ultrarisc.com>

clk: composite: Export devm composite pdata helper

Allow modular clock drivers to use devm_clk_hw_register_composite_pdata()
by exporting the helper.

> The non-devm composite helpers are already available to modules. Export
> this devm variant as well so users do not need to open-code devres
> cleanup.

[Severity: Medium]
Is this description accurate regarding the non-devm pdata helpers?

Looking at drivers/clk/clk-composite.c, the non-devm helper doesn't appear
to have an export annotation:

struct clk_hw *clk_hw_register_composite_pdata(struct device *dev,
			const char *name,
			const struct clk_parent_data *parent_data,
			int num_parents,
			struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
			struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
			struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
			unsigned long flags)
{
	return __clk_hw_register_composite(dev, name, NULL, parent_data,
					   num_parents, mux_hw, mux_ops,
					   rate_hw, rate_ops, gate_hw,
					   gate_ops, flags);
}

Could the commit message be updated, or should the non-devm variants be
exported as well to match the description?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-ultrarisc-=
clock-v4-0-fe639d63bbac@ultrarisc.com?part=3D1
