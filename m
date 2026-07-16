Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A102F43B6CC
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212555; cv=none; b=n5tED8CnReFGrW6zsBrbmLpMcEuv12sLWjZF46rOe51tUiAaG/gL2gOQjO+BORBkzOB2DhUFktHi06FgMD/RtOnhBo9jUgnFc2JCl0StMDm0aP/317+JSRi9RWqZIi40pVYdOMx+E/+mSte1zb63u0KgiU61kfFqW8wa9PBja8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212555; c=relaxed/simple;
	bh=csL4TstOlRxKcxlg5Xr3065PPL4apclZg+stcfohpcI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PzcLV6PUyYRuhnJjbiCcfaYR/hweaUAVqHocYkQLrUAh9r3Qz/YpKo93D5qDts4iRvgi6CD6uz3vH3UAgdNiOawGdEwAy+4WOpcCm4b+Tomwqf4nNAjtclgpmKCyEkjo6BZuDhh19CB8d/rMMGBEDbY+Sbr/DV7NlwtxalXvyhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axRRfS1w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axRRfS1w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD711F000E9;
	Thu, 16 Jul 2026 14:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784212554;
	bh=csL4TstOlRxKcxlg5Xr3065PPL4apclZg+stcfohpcI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=axRRfS1whgaoigIBfAZ7LPplLqz483M34mprvGkZqtpgwtrgrB06T7G2PZgO8iDjz
	 fafYZN/eXP3YMXDD6CkQ9kxwKXFDn2UfGBSmAl5su8STWm5eFfP+ekxWpbuS3BpPI0
	 xbaar/nyuv3jkJeVzEVxn3g0MXJF54oGkNQulwYJiBRCBBTkD73zNe1MKpU629AYZ/
	 0WQYVkSpeH09bISZYAwJokoRH+mLE+gN8TEVyn/keHK/0Zs4N6GW6cqfQA8NuyVSeA
	 +BHN9XgDKlWFD27Vid9PG+DFL0rRG2nQdnx/9VNdIE0Zt3g5j2kGq5tImjo/+nBwK5
	 e+0SaYzpgoaTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support
 for eMMC via overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Monish Chunara" <monish.chunara@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260716142445.2767955-4-monish.chunara@oss.qualcomm.com>
References: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
 <20260716142445.2767955-4-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 14:35:53 +0000
Message-Id: <20260716143554.3AD711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Alphabetical sorting violation in the Makefile.
--

--- Patch [3]: [PATCH V4 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI suppo=
rt for eMMC via overlay ---
Note: The format of this report has been altered to use a free-form summary
instead of inline diff quoting due to strict recitation restrictions.

commit 9c47ebd2f8bd209fc994d382b210d2c4b6160e02
Author: Monish Chunara <monish.chunara@oss.qualcomm.com>

arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay

This commit enables the SDHCI controller for eMMC functionality on the
Monaco EVK by adding a device tree overlay.

[Severity: Low]
This isn't a bug, but does the placement of the new monaco-evk-emmc targets
in arch/arm64/boot/dts/qcom/Makefile break the alphabetical sorting?

The Makefile generally maintains DTB targets in strict alphabetical order.
The new monaco-evk-emmc targets were appended after the monaco-evk-sd-card
entries. Since 'e' comes before 'i' and 's', shouldn't the new entries be
placed before monaco-evk-ifp-mezzanine? Keeping the list sorted helps avoid
merge conflicts in the future.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716142445.2767=
955-1-monish.chunara@oss.qualcomm.com?part=3D3
