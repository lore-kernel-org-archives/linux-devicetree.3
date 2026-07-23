Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F8D339364
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784774035; cv=none; b=mOS/KWLhlc5FGosN2QLc141sZ56fSNRCR1Ls4xhvDuJEyaf4+OJTLuK27ncH0ythGT3tjI8GHsQLNKebwfB0MRc7gVztfOuKPRTJPaO22EJrkBglZu7tlRAXfAwmo1hxqkd+scBrCtRMhaY/sUKN7idV4ewQMqLzPj5DPhb6I60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784774035; c=relaxed/simple;
	bh=EU4XifvCpsBQeAIJcvv0XwiMg5XX3BEv13uf9UOOfGA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xu7qP1eCd6LjND3LbgS2mMWj0DKMQYNAmP1feLxJ3it0XVbEZW27n916srjSx67hUmTsUSyvc8Mj3AEL92B8VvipQVe3MxVtXJy0XuY3LSXqokpkglWQSFhfQADAvKCP8CHXVU95q3YStzGjV5q5kmvIs6/oEwLO9C8xEk7CyEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtGrRKEJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtGrRKEJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBDD1F000E9;
	Thu, 23 Jul 2026 02:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784774033;
	bh=EU4XifvCpsBQeAIJcvv0XwiMg5XX3BEv13uf9UOOfGA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UtGrRKEJXfB6dO+sCd50BrgAxWS+xHix5V72/lEBOhbPt9NozXX2L6Ox8O5JGLHIe
	 LyQOs9L7O7skn3cB4jhczMgCPxUCd4xqM9BCCJAPle9IYSsKYKtC8/c8LhLW7Skz2A
	 ZZ64cdBSZoHp8Qqy1OybpWxTJBKLIDZ8t9B/7m+Ck7d0ozn5svK3uN5d+4EtU8npIR
	 Lja8fr/t5JpznXTIv/v/Cd0tIqwKTIruNdZ0xczbfkc80R2KE0hpKqHxu5qVGx6dob
	 HYD7cTXZlTY3NiEw7zIUm9e6d9iA6GzaAg1miH7vFNIKaZPtYpMnAq8DETL4Q8O/EY
	 MdZKyPybJMlDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/6] dt-bindings: phy: qcom: Add Glymur QMP PCIe
 multiple link-mode PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-glymur_linkmode_0722-v6-1-bba8156b8cbb@oss.qualcomm.com>
References: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
 <20260722-glymur_linkmode_0722-v6-1-bba8156b8cbb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 02:33:52 +0000
Message-Id: <20260723023352.9EBDD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to add the file `qcom,glymur-qmp-pcie-=
multiphy.yaml`, but the patch actually adds `qcom,glymur-qmp-gen5x8-pcie-ph=
y.yaml`.
--

--- Patch [1]: [PATCH v6 1/6] dt-bindings: phy: qcom: Add Glymur QMP PCIe m=
ultiple link-mode PHY ---
commit daff94211d78815eee9a0fc0796f4b5fb3719b59
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

dt-bindings: phy: qcom: Add Glymur QMP PCIe multiple link-mode PHY

This commit adds a standalone device tree binding for the Glymur Gen5 PCIe
PHY hardware block. It describes a PHY controller supporting both x8 and
x4+x4 link modes selected at runtime via a TCSR syscon register.

> dt-bindings: phy: qcom: Add Glymur QMP PCIe multiple link-mode PHY
>=20
> Add qcom,glymur-qmp-pcie-multiphy.yaml as a standalone binding
> for the Glymur Gen5 PCIe PHY hardware block. This block supports two
> link modes, selected at runtime via a TCSR syscon register:

[Severity: Medium]
Does the commit message reference the wrong filename?=20

The message states the new file is named qcom,glymur-qmp-pcie-multiphy.yaml,
but the diff actually creates qcom,glymur-qmp-gen5x8-pcie-phy.yaml:

> diff --git a/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-gen5x8=
-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-gen5=
x8-pcie-phy.yaml
> new file mode 100644
> index 0000000000000..759f7f979dc6a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-gen5x8-pcie-p=
hy.yaml

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-glymur_lin=
kmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com?part=3D1
