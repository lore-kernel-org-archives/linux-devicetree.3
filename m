Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AAB372B39
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481546; cv=none; b=k31IvxnNxl23sfqEzDiSEIk7Ocz129pNQ1Yy+/Vb3+FeSJuQmpH2lbx/YVc39ioY1r+dr9/w3BDzltTGxcB2c09XshmacPkYLzCNYSHngywCQ5guanx3iEPRJ8Q+AA9zXTDyccmHyK7GDW+R3SWr90ZSogiGHhsd1NQK1q/ToYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481546; c=relaxed/simple;
	bh=aJvEtwmwplZaH2YRns9CTQG4ugMr9twNFe/HDAjOzII=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K7twYgRUeNRSD3LDT9fi81LxV+YKMpM0Hm0Dw+LV4WdzP7M9xh6gFcXVPaeyLKe/dfU5x5Lvt9MDxidF9oDjvjAUzQqbLjPt4d+riduChkf9cOfpPD6aLWZYCse9he2z+M5ItFuE4NERCyFXlbSUNDHVa43v0Rb7vcSVc5e/VxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzWpMEvH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzWpMEvH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2EB1F000E9;
	Fri, 31 Jul 2026 07:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785481545;
	bh=D/NLCO35KGnH7GMwGX5PV7iS85MDbMJG3539X3MDwOY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hzWpMEvH0G1qPWxp3Cv3a7hi0b9l4CSLaDgRo3p+7lj9W9usofNqMTIV3a6UBxnk2
	 XR3EUpl5HWpUR/910gmVEC8nrF7fP8W9PLj6jw4E/buO0jHyHlS1DVHzGaSmZggulk
	 hU9dVDwAxUJj6P/E8HOTV5KLEA+YUGNL0Wp/XxAapWz9eEeTiaSVVj8AkanC2hDqTr
	 bD51lO3X6RSKuUuBwjbixr8DDKpLUfvGiherrzGxdmqzURxvRuK0z5n0/IH4/2fH/c
	 ij1gUy1+sr7WpllNYehmhCmXekpbmNVU2ZnR+egF8B0HRvbkYYYU32zmUTpXx7qkzk
	 lDxVwP4UcFQNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] media: i2c: og0ve1b: Introduce per-sensor data
 structure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731-og0va1b-v5-3-c2b90b601241@oss.qualcomm.com>
References: <20260731-og0va1b-v5-0-c2b90b601241@oss.qualcomm.com>
 <20260731-og0va1b-v5-3-c2b90b601241@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 07:05:43 +0000
Message-Id: <20260731070544.4F2EB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but incorrect handli=
ng of pm_runtime_get_if_active() error returns causes an unbalanced pm_runt=
ime_put() and usage counter underflow.
--

--- Patch [3]: [PATCH v5 3/4] media: i2c: og0ve1b: Introduce per-sensor dat=
a structure ---
commit 4767769879b1fbb36a5857ed0679efc6bcd34ead
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

media: i2c: og0ve1b: Introduce per-sensor data structure

This refactors the driver to separate sensor-specific data from the common
driver code. It introduces a sensor_data structure populated through
i2c_get_match_data() to hold the chip ID, MCLK frequency, link frequencies,
and supported modes.

> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
> index da5c8e49d4a81..f560d5d90fda9 100644
> --- a/drivers/media/i2c/og0ve1b.c
> +++ b/drivers/media/i2c/og0ve1b.c

[ ... ]

> @@ -314,7 +339,7 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
>  				ctrl->val + mode->height, NULL);
>  		break;
>  	case V4L2_CID_TEST_PATTERN:
> -		ret =3D og0ve1b_enable_test_pattern(og0ve1b, ctrl->val);
> +		ret =3D og0ve1b->data->enable_test_pattern(og0ve1b, ctrl->val);
>  		break;
>  	default:
>  		ret =3D -EINVAL;

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing
og0ve1b_set_ctrl(), I noticed a potential PM usage counter underflow.

Earlier in this function, there is a check:

	if (!pm_runtime_get_if_active(og0ve1b->dev))
		return 0;

If pm_runtime_get_if_active() returns a negative error code (like -EINVAL
when Runtime PM is disabled), the negation !(-EINVAL) evaluates to false.
This bypasses the early return.

Execution then proceeds through this switch statement and unconditionally
calls pm_runtime_put(og0ve1b->dev) at the end of the function.=20

Since the initial get failed and never incremented the usage counter,
wouldn't this unconditional put operation cause an unbalanced decrement and
underflow the counter?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-og0va1b-v5=
-0-c2b90b601241@oss.qualcomm.com?part=3D3
