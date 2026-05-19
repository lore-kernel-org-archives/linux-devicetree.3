Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8F73B47E4
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177138; cv=none; b=JHWqRcqqGklvRjD5hTcFOtHQC3fiHCp9aE2V2qI049e5iSdy5TfevGahz3U/rrVq5YPqQE1wBChjrTNA+Q8mDRF484xEYjA/3UUyQc/dQoYqHsg5aFVtZ3hG+Yc98VyXfgajgcZ2rRrU3LtwvYyjUmCyonp4X534Fyt1sf5711g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177138; c=relaxed/simple;
	bh=XFpqyu0A+rv9hjAVxOg4mZVAMpoMVNza+8UOeN4eUvs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KQlnavTkqvpY0aoBL9cqEuQTYXeI+slFx4vp2PLTNnXldO8FOKZ50YRDOTgqcJNhBqsjDzEjEF6puCA+m6ts1eePVhkv5p6r3Bp3Y6lBvgX0MZasK/+4RH+BcDkeROYYOqDz+9QabzY1rYnHDRPqWn7ffqNjzTerf3TfrFMytMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVEbJrDo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVEbJrDo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11318C2BCB3;
	Tue, 19 May 2026 07:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779177138;
	bh=XFpqyu0A+rv9hjAVxOg4mZVAMpoMVNza+8UOeN4eUvs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YVEbJrDoBcyO5IVf9zT49oM8h/dWrxrhwdXJUDxA5XCT4TgZo3CGQv6XbNeCd7RKD
	 +013uxb4kipnxWVYPuJktMTOJG0019EOkiidIvo8IBwElAHRUkZDCyZ+R54HGJvXoj
	 N5jWsA/NFKeL+LJHLvhcIt316txBu3F9mcUlLbl07f4uEMe/5GJ073JCrlZ3V/rOvc
	 Erf1DSKM2umSMnSlPiUliOk77AeVx3Q3oJn6cuYVLHglYD9muwWgINY+FVin07Kqtj
	 qsAz+hL2IomDME6x8D1fkac/IWMTjX6/vnox81Y4h1IKuprR5p+E2safD7AmtQHBj9
	 TKrGLniplqh+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8750: Add camera MCLK pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519-pakala-camera-v1-3-b6d897864916@oss.qualcomm.com>
References: <20260519-pakala-camera-v1-3-b6d897864916@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:52:17 +0000
Message-Id: <20260519075218.11318C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect pinctrl function names `cam_asc_mclk2` and `cam_asc_mc=
lk4` used for camera MCLK on pins 91 and 93.
--

commit e6d2727b68fe7979bbe116baa48b879e9333356a
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

arm64: dts: qcom: sm8750: Add camera MCLK pinctrl
   =20
This commit defines pinctrl definitions to enable camera master clocks on
SM8750.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index e45f0d33714c5..f1e34d2860beb 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi

[ ... ]

> @@ -3850,6 +3850,62 @@ tlmm: pinctrl@f100000 {

[ ... ]

> +			cam2_default: cam2-default-state {
> +				pins =3D "gpio91";
> +				function =3D "cam_asc_mclk2";

Is this function name correct? The pinctrl subsystem relies on strict
string matching to map devicetree functions to driver functions.

According to the SM8750 pinctrl driver and bindings, the function for
this pin appears to be defined as cam_aon_mclk2. Using a non-existent name
will cause devicetree schema validation to fail and result in runtime error=
s,
preventing the camera clock from being configured.

> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};

[ ... ]

> +			cam4_default: cam4-default-state {
> +				pins =3D "gpio93";
> +				function =3D "cam_asc_mclk4";

Does this function also need to be updated to cam_aon_mclk4?

> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-pakala-cam=
era-v1-0-b6d897864916@oss.qualcomm.com?part=3D3
