Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B60135677E
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157158; cv=none; b=jvWLeOEExYex0/FllPvCcoKODmg3rZFt325xLnvr+goLC3VKFG68PXnm/jM+2RD0qboXnHkTmf6PIvtFqfppNRZyynDoZBV5jyvkj2BaJx0Jzbnltmw3esn2Mow5u61TOK+UdEj9UzffFAJfiHvJY/bW8rE4qcjSPA8KSH5ll5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157158; c=relaxed/simple;
	bh=9CnHA2sjBCTp76IxgvwKoj3ChzdBokNRJi+YhPrJFy0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g0qGh8YE8hpy/wdmE7PnbrxuZDn0+GUxh/h2PuiiWK81nA8ZgdS6cBmzsM+cRvQF7A7caPZVFSdnDTqiCTE3z5KIyoLZjlWIEuDpkFMdyoZv7SHjx+32By+ALOkmQziloEl/sSZeZJ7+kVLTODZ7VGDtBXg0cLkmSxMmQ45fYIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvzLDrcl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvzLDrcl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1BF1F000E9;
	Mon, 27 Jul 2026 12:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785157157;
	bh=0P499mUk9Ts1ZKFQWX4Zw/qRibwVddbCdjqa1NEPzFc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FvzLDrclQvjltLQJNUhw3bMFLi1ZRisxHrdUJrVjqd6Pig8o2mwDR3D/bQT5S5fAB
	 gpNyjQM5+20jXZiQ4dYeC4zUa9CPyhi4n98XCf+Eu9WgY6e6gg2MKJCx0NFHtP+h5R
	 F35DsSLEkgzzibVZko6o6FvpWRKvGdvQVtvxu/bO53eBhFL7J2wxdL8LLZUuLbF5ai
	 igMbC+l75ezvN0KQg8OBukAq99T/HLXS7uddfymZ1VAX8GkK+kJBEfSRXG654B93aT
	 59EA26cMP2AoJxG/zJvYbDjECQ5PgvkaAY17+nHyEwdbmlEqv3B2xl9IHEN07XUimj
	 dUd24gqVo1ObA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Add Kalambo CRD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikrishna Garmidi" <gopikrishna.garmidi@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727-b4-kalambo-crd-v3-3-25280faceece@oss.qualcomm.com>
References: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
 <20260727-b4-kalambo-crd-v3-3-25280faceece@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 12:59:16 +0000
Message-Id: <20260727125916.AF1BF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch leaves an orphaned PMIC endpoint and thermal zone by f=
ailing to delete the `spmi_bus1` node for PMIC D (`pmcx0102_d_e1`) and its =
associated thermal zone (`pmcx0102-d1-thermal`).
--

--- Patch [3]: [PATCH v3 3/5] arm64: dts: qcom: Add Kalambo CRD ---
commit 827c0ef9079fd542521c1496e341a245697bd21d
Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

arm64: dts: qcom: Add Kalambo CRD
   =20
Introduce support for the CRD based on the Qualcomm Kalambo SoC, which is
pin-to-pin compatible with the Glymur CRD. The board description reuses the
common CRD layout and drops PMIC nodes that are not present on this design.

> diff --git a/arch/arm64/boot/dts/qcom/kalambo-crd.dts b/arch/arm64/boot/d=
ts/qcom/kalambo-crd.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kalambo-crd.dts

[ ... ]

> +/delete-node/ &pmcx0102_d_e0;
> +/delete-node/ &pmcx0102_d0_thermal;

[Severity: Medium]
Should this also delete the e1 endpoint and d1 thermal zone for PMIC D?

The commit message notes that absent PMIC nodes are dropped, and PMIC D
is absent here. Since PMIC D spans both spmi_bus0 (e0) and spmi_bus1 (e1),
deleting only the e0 endpoint leaves the e1 endpoint active.

Will the SPMI driver attempt to probe the non-existent pmcx0102_d_e1 node
and generate bus timeouts or errors during boot? It appears that the
associated pmcx0102-d1-thermal zone may also need to be deleted (perhaps by
its full path if it lacks a label) to fully remove PMIC D from the tree.

> +/delete-node/ &pmh0104_i_e0;
> +/delete-node/ &pmh0104_i0_thermal;
> +/delete-node/ &pmh0104_j_e0;
> +/delete-node/ &pmh0104_j0_thermal;
> +
> +/ {
> +	model =3D "Qualcomm Technologies, Inc. Kalambo CRD";
> +	compatible =3D "qcom,kalambo-crd", "qcom,kalambo";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-b4-kalambo=
-crd-v3-0-25280faceece@oss.qualcomm.com?part=3D3
