Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B5E2FFDCB
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779024463; cv=none; b=LliuM+KhSJ4a1Qymo9D/HEKQw1tQJCavRbuXDswA/NcuKyGCy2vATALsk2rdpNnOp+RB8dFlm1V584FkTi/O91TJ1GK2jDArdZpezjWP7x7L/mV+tsTahN2XaxuRkLp/SXA1o1KNCsG+oDcpmzaRCg+4XDMydQrObt7GQYqQrVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779024463; c=relaxed/simple;
	bh=9E3p2FyBDSzyqCk95E0Ek12GmPJz5AzGxzBHORXfT5g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CVgLLJ/2HoN9ffz88jB4SJVbt+YKh3s03enoF2mqZt8+M155+06aOENGwRNqd1rm9LPla7CjutzgppG9PUslo306BAyfUrwYzLwmNR87B5mvQPMLvOy0dRAaqwkEEGmxv4TOXwLSV5l3i8Vb55DF2IoDKSpW4Cj9iu7Na7tTZSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNmM3+dl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNmM3+dl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDEBC2BCB0;
	Sun, 17 May 2026 13:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779024463;
	bh=9E3p2FyBDSzyqCk95E0Ek12GmPJz5AzGxzBHORXfT5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=cNmM3+dlZQOn8YWIdtEDgFEErD5Ab+DEMgDjuP2fuLKplf94eW8zwyjj6aLSAcvOa
	 J62c7kjYkEvO9jq6Tj7IMrvutJta69o+cEa+EKlkXfr500dabzMyzrpJbIngk9S+wi
	 MgYf4rGiI7NBjOrhron5CgNSgDrS0RqOtAiOyGDXy7QqtV7YgqbS91HAMyhe1eQODJ
	 8IP2tUkVnRMpXPbGlP0lUtx2Z2SVeMPrN6o6HGRI8J4W7+bB95CqtG/moNHcHhHRW6
	 LSOvaXXJp3odboB6N/0RaixQ8o0HTi4lDFnlMZusXfWH92FIPqV3TtS9JjoTNkMmUm
	 7zbwyzOFGuvBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: sm8550: add labels for thermal
 zones
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Hamamdjian via B4 Relay" <devnull+azkali.limited.gmail.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260517-pocketds-v3-2-d5910c801756@gmail.com>
References: <20260517-pocketds-v3-2-d5910c801756@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 13:27:42 +0000
Message-Id: <20260517132742.CBDEBC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete implementation: missing labels for almost all CPU the=
rmal zones despite commit message claims.
--

commit 32e1020122d8ab932064f6929e94b9d9f74c8a75
Author: Alexandre Hamamdjian <azkali.limited@gmail.com>

arm64: dts: qcom: sm8550: add labels for thermal zones

This commit adds labels to the cpuss, cpu, and gpuss thermal zones in
the sm8550 device tree. This is intended to allow board files to override
trip points and cooling maps using labels instead of full node paths.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/q=
com/sm8550.dtsi
> index 912525e9bca6f..a9c678fc9cb2e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
[ ... ]
> @@ -6028,7 +6028,7 @@ cpu6_bottom_crit: cpu-critical {
>  			};
>  		};
> =20
> -		cpu7-top-thermal {
> +		cpu7_top_thermal: cpu7-top-thermal {
>  			thermal-sensors =3D <&tsens0 13>;
> =20
>  			trips {

The commit message states that labels are added for the cpu thermal zones,
but it looks like only cpu7-top-thermal was updated here.

Were the other CPU thermal zones in this file, such as cpu0-thermal,
cpu1-thermal, cpu3-bottom-thermal, and cpu7-bottom-thermal intentionally
left without labels, or did they get missed during the update?

If they are left out, it seems board files will not be able to extend those
remaining zones using the label override syntax.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517-pocketds-v=
3-0-d5910c801756@gmail.com?part=3D2
