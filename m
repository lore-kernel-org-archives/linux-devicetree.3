Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA373429CD5
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784891427; cv=none; b=ZekoKvNLyGpSye7FFy1026rM1f0rBljK81wnnuohiAiCehpu45NDLQZiqMK46ANvwaueYPQf4QqyugwutNc2+pWQIUzFx8ZjvOhHJwMwkFr2UpsEIfsKEBVK1yImMQ1XJhveREGiBgOfGUyybAD4XSXmi9Au3LftFRy38M5MHHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784891427; c=relaxed/simple;
	bh=TyqQuTreFMBpaFJBtkgXl3Ywm/L3om1BdJzH2lzbeEQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UX9WHPkd3nNSOVKMzb/EE9MLnCtG8vbbQyIF6hRvgnEDg+3fHEsOjyUuvJSbNNNh4EIVobBJi85MJjYZQhthAtcG6gdginiP1/Wu/MgGrWKoI1GoKQ8WdLACGrGFlI9CbE1grNvO1w+YUVWiPa9sMdqMg2gCdkf1LAO/CvSvnaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDTxTKRr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDTxTKRr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7751F04290;
	Fri, 24 Jul 2026 11:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784891426;
	bh=bQ83Gv0ohR6Y3lCQSIwgjz/es5AVOK6IyFRHK33lgZ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hDTxTKRrRwvCJ6R7CE2McZPANBxf8GGHlgfYuUkygrIkr5X2n7N/CCktMcnybfhzp
	 l3FEgvxoD23TX787ZjMi5QuM7iTXa/TLpSQWAxED8uZkNNPLIAySPEH6CTOX6xDAjf
	 BIrDUfk1tgIvdBsry1oPZyJSjqkGOTbK6SSfFvTN4vRfbbs42P77srW8V+TDIFvXvJ
	 NBlzIOMgUWkWGkiL/H4mnPourVYPdrqGr02Ba900RVr2jPRKbtcKNJ5ZJXMc8HdS0f
	 ZsK01doSpXR2UntLVUQ0k6JBBt5i81jl/qjAhj+ZYNJf3dMjSO92cNrnfFNqvW0cjO
	 Oc6gUbfvIbXPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724103848.233804-4-shengchao.guo@oss.qualcomm.com>
References: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
 <20260724103848.233804-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 11:10:25 +0000
Message-Id: <20260724111026.6D7751F04290@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect `crash_reason_smem` value for `nord_cdsp3_resource`.
--

--- Patch [3]: [PATCH v2 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP=
 support ---
commit e1a98d51f6d64eea0602e8e964394bba2b37262b
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

remoteproc: qcom: pas: Add Nord ADSP and CDSP support

This commit adds support for the ADSP and four CDSPs found on the Qualcomm=
=20
Nord SoC. It configures the ADSP for early boot and sets up the necessary=20
resource structures for all five DSPs.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 25599d7282083..6f3850a3fa9e8 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c

[ ... ]

> +static const struct qcom_pas_data nord_cdsp3_resource =3D {
> +	.crash_reason_smem =3D 666,

[Severity: Medium]
Is this SMEM item ID correct?

The sequence for the other CDSPs increases by 32:
nord_cdsp0_resource: 601
nord_cdsp1_resource: 633
nord_cdsp2_resource: 665

If that pattern holds, should this be 697 instead of 666?

Querying the wrong SMEM item ID will result in a failure to retrieve the=20
crash reason when the CDSP3 remote processor crashes.

> +	.firmware_name =3D "cdsp3.mdt",
> +	.dtb_firmware_name =3D "cdsp3_dtb.mbn",
> +	.pas_id =3D 58,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724103848.2338=
04-1-shengchao.guo@oss.qualcomm.com?part=3D3
