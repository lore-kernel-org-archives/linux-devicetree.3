Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB1822FDE6
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 16:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779725019; cv=none; b=mmOmZERF4g2JNCSvIeJq0uzZVLBpi9P7DrD8Mu5LK13747mPpkHg5WmBdQweBj+vKr0ffl/vGmdEoip7dWqwPJ+LzEJvxwGpen9BrsB+DFgmvPKoNjuC7+O3n3OlOLJgZQLWAiccT8R/nfwJfPxZExQtkcvuM0oI0WMGFaj2TpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779725019; c=relaxed/simple;
	bh=Fe5rju6GxmSKUMQVjJaNKvbFdlDOgq3/KdyDf1lUm6Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YG8rlyrnB6AT4ilpsXnWGy/bD2uSJRA/vXJmdSOhWMDuUCI0Z54n9TuvWiPB1beLeVPJY/JEMYTg3CEcIQTuVKqGt2QMKstxhrsK3XyDA+pW08VUGmO4mWyqT/ihwXqtMCZApa9wBNecoeW2yJ3XYzKR4WzgvGXgVZKmJVmJUbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huHmDDCY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huHmDDCY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C4241F000E9;
	Mon, 25 May 2026 16:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779725018;
	bh=Fe5rju6GxmSKUMQVjJaNKvbFdlDOgq3/KdyDf1lUm6Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=huHmDDCYhOrLMjKz1aWG84EapaSLu/IsMmjvvb6QTzlyqnFKEtQL7c3HZrxcyBiud
	 mSHQlfBHoKcmdtPItfg7wKWIzqKDiuZzbidDyMb9S92RQuTGyjHaRDsHxrKLwBJBu2
	 Bgu9s/OJUlxRfM0lilzNIPatFmuxSu1/ng5C4Xb0pgSEd7Tp+I7np6eYlAu5Rpx45J
	 rqP6IRT0+aDjiiApkKvEsD26QqeedOkmTO/R60cpHdnJ69H0l6i+GEWEMTHJpjINSB
	 IjSf1QSzWo7ITmpjd+ZQk5wmkElgbUwXM4BBRZJg2j4RZwo1t3Yykflk8EewrwIiuJ
	 fkt0PBHpl4u1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] ARM: dts: qcom: msm8974-oneplus-bacon: Fix
 sn3193 shutdown GPIO polarity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260525144629.498630-6-jerrysteve1101@gmail.com>
References: <20260525144629.498630-6-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 16:03:37 +0000
Message-Id: <20260525160338.1C4241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `Fixes` tag in the commit message incorrectly points to the =
commit that moved the DTS file rather than the one that introduced the issu=
e.
--

commit fdcc6b03fb02176ae8f78463b918136ece476e62
Author: Jun Yan <jerrysteve1101@gmail.com>

ARM: dts: qcom: msm8974-oneplus-bacon: Fix sn3193 shutdown GPIO polarity

This commit corrects the sn3193 shutdown GPIO polarity from GPIO_ACTIVE_HIGH
to GPIO_ACTIVE_LOW to match the hardware specification.

> The sn3193 shutdown pin is active-low[1]. Correct the GPIO flags
> from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.
>=20
> [1] https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf
>=20
> Fixes: 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories=
")

[Severity: Medium]
Does this Fixes tag point to the correct commit? Commit 724ba6751532 appears
to be a structural tree reorganization that just moved the DTS file.=20

The led-controller@68 node with the faulty GPIO_ACTIVE_HIGH flag seems to
have been originally introduced in commit 3835f9a0cf56 ("ARM: dts: qcom:
msm8974-oneplus-bacon: Add notification LED").

Pointing to a file-move commit might break automated backporting to stable
kernels.

> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525144629.4986=
30-1-jerrysteve1101@gmail.com?part=3D5
