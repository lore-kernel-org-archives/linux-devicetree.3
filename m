Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CBC490BFF
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048145; cv=none; b=LGfxR89FoU1Tt+UgOqcu2N6+uDPrOB51KtUL48MD9vnAXPPlRkYdbBUUt7aHdrdYczJJSwTf3MR09A7vTRJUwYFqKLCsuefBjXZBJ7BRvJSe+l8eDBAiFX4tvDHRlJOqUpxzJ9d2i/NIyJhd0hmm0j4y++hrj4Br6QsbCxUwuzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048145; c=relaxed/simple;
	bh=a7FQKV+XpHPEhT7CWMDiXQXIurEH1NOSgz71dZnolng=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GTHvmicrVuwMM+50/in0bnDhnRybmRdPw961od6mW/++n5+tw9dxsG+3mTpehm4cDgo6kh73oKvzcaFzHNi/aW683oiW8KzXPiGgsMOeURlfIRyQa16xcHMSCfk67PdDNP7vH1Bsjl+cLuEt0gL1O9tkwvMtQntzQ6OOI0+cnQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bI7uCzzB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bI7uCzzB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8195F1F000FF;
	Thu, 10 Sep 2026 13:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048143;
	bh=a7FQKV+XpHPEhT7CWMDiXQXIurEH1NOSgz71dZnolng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bI7uCzzBWxgC2IjpDqjno0Vl6aWGd3J/3QTdIC/IGD80Gged4fE91zr6L8LR9E9D0
	 XY1OvTb0IclWPSidU9ZNdDJAFK6eyV90veY0XPSToJ6ofXM9CnBIlRAGO5FF1M8XLU
	 QRAR+Fj+MHiaDiIGmkHVCprCN1XrZ4pj0w9UrpBRxiSjOVE0MwLRtchCQNzHmL7Lq1
	 jYATZDCWYnwrVrYPKgMyhh1DLh3a+ovVi8tGPiEjTo5BSGESTfYUWSFKGQjRUIs96p
	 iAonEs7iq+IjGm/snsqW0/+E67EJTZOeCztEtTnaKhB+Bj65CEsiNPQ3AdzTZMhE99
	 raXl5s7/ZkZQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 21/34] arm64: dts: qcom: msm8998: Move PCIe phy and
 GPIOs to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-root_port-v1-21-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-21-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:49:02 +0000
Message-Id: <20260910134903.8195F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to move `phy-names` to the root port n=
ode, but the property is actually deleted.
--

commit 5db263a0e4f8f01c847c35b40997163432b4247b
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: msm8998: Move PCIe phy and GPIOs to root port node

This commit moves the pcie phy reference and the perst gpio property
from the RC controller node to the root port node (pcie@0) for the
msm8998 devicetree. It also renames the perst gpio to reset-gpios
and adds a label to the root port node.

> The PCIe phy reference and the perst GPIO property are per root port
> and belong in the root port node (pcie@0), not in the RC controller
> node. Move phys, phy-names, and perst-gpios from the controller to
> pcie0_port0, adding a label to this node to allow board-level
> overrides, and renaming perst-gpios to reset-gpios to match the
> binding used in the root port context.

[Severity: Medium]
The commit message claims to move phy-names to the root port node, but the
property is actually deleted in the patch. Should the commit message be
updated to reflect this omission?

The omission appears to be structurally correct per the device tree bindings
(Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml), which state
that phy-names is not required in the root port as it only has one phy, but
the commit message contradicts this intentional deletion.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-root_port-=
v1-0-90a252ddbbfa@oss.qualcomm.com?part=3D21
