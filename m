Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5A5375AB5
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707715; cv=none; b=pXZmoklAQqxxh6sGtuRlguMlFtrI+A/5CyS+B3VbvyXcmiPnWQghh+M/wdKsWpOJZmEam55YBcXrRKyVbCL2he0pPbPLesdTyuDfFIlOIDBMFqmwwuvIGR/YL4Oi44kwfjjzl1FUiFQDfAzsYSEKiK0iEPIZMaTBAz0swinRSpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707715; c=relaxed/simple;
	bh=lq9cm6IPVD/x5v/I5IT6JLMiL6m6LVXQpw8xOY4o7X0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EfMKkLuFr31WnT4tr8rLbl+wv970kdMEJ9ZiyAE8pLln7TXV0Pf6u9pJmzwlfdePaS3C4qO414vvl/52apT1ZpUbX+nHELYQEXxEULK9EvqQK362kBAYTp9EZt/Zym7kHoOs7T91eb1uq+uQVUpNg6a2e3ZoysSEiJHWCgA+iBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDqCSYjB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDqCSYjB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7358C19425;
	Wed, 13 May 2026 21:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778707715;
	bh=lq9cm6IPVD/x5v/I5IT6JLMiL6m6LVXQpw8xOY4o7X0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CDqCSYjBovbl58hHk3kwlg/DhiAsMT+kvd5EnfMM5hNXIwA3V3ukVjP2lq3/uZL6w
	 dRIBBEw57Y4BI67sfR2t6SvLvoehp0EA6yPIp3Bg7fIBYuOouZWJ9nboaDp6CCGLc5
	 nzqljFJiMElfRFbCrIeTnrkYUdIQQ/n4DescTWE+i2iFJ5F2oZm6FFXbhTolox0VsM
	 Ky+SFWalzKfM+TmznNMQh+aqeblxMWih+EXbaU/izHz3BN87cF5TTdQD9fSGOb7BzU
	 9pZ2XZmyg2VYnWJXBK0QRGMNkWqV6VmMeXsHOaYu+J2vBQ8ZoHdTLvPGTVDo/Pphg0
	 3Q5VCZ4zwweTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add Eliza-specific PM7750BA
 dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260512-eliza-adsp-usb-v3-2-6420282841c2@oss.qualcomm.com>
References: <20260512-eliza-adsp-usb-v3-2-6420282841c2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 21:28:34 +0000
Message-Id: <20260513212834.E7358C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The commit message incorrectly references 'PM7750BA' instead of =
'pm7550ba'.
- [Low] Unnecessary duplication of the entire `pm7550ba.dtsi` file to chang=
e the target SPMI bus.
--

commit 972447828c23a5ba2c8f03cd2dde21737ff3881a
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: Add Eliza-specific PM7750BA dtsi

This commit adds a new Device Tree Source Include file for the PM7550BA PMIC
on the Eliza platform. It introduces a separate variant to configure the
specific SPMI bus master used by the hardware.

> arm64: dts: qcom: Add Eliza-specific PM7750BA dtsi
>=20
> On Eliza, the SPMI arbiter supports multiple bus masters, requiring
> explicit selection of the master for each PMIC.
>=20
> The existing PM7750BA dtsi does not provide a way to describe this,

This isn't a bug, but there is a mismatch in the hardware name. The commit
subject and message reference PM7750BA, while the code introduces
pm7550ba-eliza.dtsi for the qcom,pm7550ba PMIC. Could these references be
updated to PM7550BA to match the hardware and file names?

> diff --git a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi b/arch/arm64/bo=
ot/dts/qcom/pm7550ba-eliza.dtsi
> new file mode 100644
> index 0000000000000..2c386f16eca46
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
> @@ -0,0 +1,69 @@
[ ... ]
> +&spmi_bus0 {
> +	pm7550ba: pmic@7 {
> +		compatible =3D "qcom,pm7550ba", "qcom,spmi-pmic";

The commit message states this duplication is required due to hardware
differences in how the SPMI bus is exposed. However, this appears to be a
full copy of the existing pm7550ba.dtsi file just to change the target bus =
to
&spmi_bus0.

Could this be achieved with less code duplication by refactoring the origin=
al
pm7550ba.dtsi?=20

If the hardcoded &spmi_bus wrapper were removed from the base file, callers
could directly include it under their appropriate bus node. Would that be a
cleaner approach to avoid the ongoing maintenance burden of keeping the
thermal zones and PMIC nodes synchronized across two identical files?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-eliza-adsp=
-usb-v3-0-6420282841c2@oss.qualcomm.com?part=3D2
