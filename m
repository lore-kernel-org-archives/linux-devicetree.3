Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B813741D65D
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888371; cv=none; b=X/LMgQLe9eVod4p6XhTPI7augMNb77tDLpKwHixoidovUlhmT3dGpxe6bnqbU8NC/jbON3ZAyedH1DSPA2RMwGJ1os4Ak0Dj2uMvZ8y+DgP1m4CflYhqfRLvCnS7rS3fa7rdwAGx3z73pE/i/p9PxuZ4N8MtV7DQ2yM/oudvIXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888371; c=relaxed/simple;
	bh=f1QTIXQIbQlygLZqR/B3bkFfU8v6f3cNQ0t0dkJozUk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oJRdZim5qi8Bydx+SxiuZ+NKqdfwIE7emNmbu+4GBq5PJ7vK56KD7jNxxMtkP2FjZAFgRf7XdXpZngiPlV34JSd6PQvE6Nxdz/cFA67m4E6CrX9dVhtXr2fScYUjY1aA4d5024nbXz02wn/1wU0QWL/lHG1O4ymdQeJQAC2UCx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZF4Oe32; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZF4Oe32"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0EA1F000E9;
	Fri, 24 Jul 2026 10:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784888370;
	bh=mWtQztNFWo3rsZ7oL8nxoO5iPf84MOZLa3sHHnjCgvw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YZF4Oe324/apgC56EyTS/+C3hA0escF5o9yGV1w5DxpPToA8DQhxgb5Mno1oBrd9o
	 GKekc4PQDaxR2h+pqhiv7zam/jDTz3O86jFm8ifJ8W3kP4sp+lvIrtpB5rtUoobB4/
	 hfQDBi9QuFcKRH0V2Y6wX7zg5ucymGSJf8V2rfHcwkdAMCFlwbREyirc6FEekXfOjG
	 gwz4O+Rj9QHByTeA7wRnGQAxyZ/f+2Qoi/q9uvVEluBdYMOWDG7HeQXwKKC1sQ/1C4
	 ocQuJAdV8cld7jK9ysev8Gx346ayET+L22lVkYDIVX8V2SDk+vmmE5acNA6IkaLf9c
	 lpqN2l5ShnaOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724-08-dts-v4-2-65e61a1061f0@oss.qualcomm.com>
References: <20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com>
 <20260724-08-dts-v4-2-65e61a1061f0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:19:29 +0000
Message-Id: <20260724101930.0C0EA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit deletes the original IPQ5210 RDP504 board DTS and its=
 build target without simultaneously introducing the promised variant-speci=
fic replacement DTS files, dropping the board from the build and breaking b=
isection.
--

--- Patch [2]: [PATCH v4 2/3] arm64: dts: qcom: ipq5210: Introduce RDP504 c=
ommon DT file ---
commit 82ed3dc795e1204be6951dec05e4b84f555d89db
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Introduce RDP504 common DT file

This commit splits the IPQ5210 RDP504 board configuration into a common
.dtsi file to prepare for eMMC and NAND variants. It also removes the
original board's dtb target from the Makefile.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 6f33c4e2f09c3..4833c61e2da1e 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -24,7 +24,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D hamoa-iot-evk-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D hamoa-lenovo-ideacentre-mini-01q8x10.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D ipq5018-rdp432-c2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D ipq5018-tplink-archer-ax55-v1.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+=3D ipq5210-rdp504.dtb

[Severity: Medium]
The commit message mentions renaming the file to a common .dtsi and
including it in a variant-specific DTS file. However, this patch removes
the dtb build target here without adding any new variant targets to replace=
 it.

Will this drop the IPQ5210 RDP504 board from the build entirely and leave
the new ipq5210-rdp504-common.dtsi orphaned during bisection?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-08-dts-v4-=
0-65e61a1061f0@oss.qualcomm.com?part=3D2
