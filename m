Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D85377A8A
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578317; cv=none; b=hQfa9zKksyrFz+T5AxWoljain91PYOHhC6yDZQswgBTZmT275FvCnDAsHi+UFYPzxaPHzOLIEZNWixhNg+YFe+j2rqpHhqV/eZJhqL1v+4zoi3RTnc6KwSd9aCIbly9J7iXHJTpqblIhJ7SxJM/tJhAtF5W3NeBhds5RlvKcuhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578317; c=relaxed/simple;
	bh=n0OSZawk2+d0U5AuGmsVF8Xcm6RzoGlGmitHLuj3WhI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qg9l62O8O2iRzp+XrpAh33t6sD5JOGOQdGZJsdWpQ0sz1uE0q3iwYM69ZDoiS+wC02xdOz5/MeukowHv2QlPwh6LoA46mBCmyIpoi9f3zzWAcQ1a9Qcoixk50ICx9zwZd61Ra48ivYzPKAFyo9/Wo20wSKEgXegfnHZxIlp9T8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OwChqTvg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwChqTvg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218CE1F000FF;
	Mon, 28 Sep 2026 06:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790578316;
	bh=/5ETh+K0dogou4oN6qeGNQPkhm9yVrY0+lV2MR8HO3k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OwChqTvgOOLq+/yRqhpIe1hxEbVeMOYXawcirr+tGeQXZyP7SIN5w1FonQpRYcwwa
	 4itGqUboh3OK2HrGnsqi3WAlh47qHWPCavAfE/B9X7sJKbpfUOAol1qnvzoONlk86q
	 aPpLJxs65o+RoRlzh3z/kdARVnNbfERZSTSqoaYK6A1OJSXzNdK3Txm5LyxlMTgcRe
	 y+gznN1SKKCLENK2ZcKAlPHvcnqrTSsDOIPjvnQJsMsVD3sQYojKMCjZMIFwMXKRiF
	 wtkZbe1tuvG25HWMbL9uQA2lsLP35Auas7isurjIyI4HIPSeU+uRREU0pZ+cjdNHOy
	 56z9M4+rC59aA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 06:51:55 +0000
Message-Id: <20260928065156.218CE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: qcom: thermal zone nodes violate thermal-zones schema
--

commit 5002150e61d17adad9a02df5206f78ef229da8ab
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

arm64: dts: qcom: glymur: Add EC thermal zones

This commit adds support for back cover, keyboard, and SoC thermal zones
through temperature sensors hosted on the EC for Glymur and Mahua CRDs.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/d=
ts/qcom/glymur-crd.dtsi
> index e27c697e31702..571c98124a406 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
[ ... ]
> @@ -955,6 +957,47 @@ right_tweeter: speaker@0,1 {
>  	};
>  };
> =20
> +&thermal_zones {
> +	ec-back-cover {

[Severity: Low]
Does this node name violate the thermal-zones.yaml schema? The schema
requires thermal zone nodes to have a -thermal suffix (matching the regex
^[a-zA-Z][a-zA-Z0-9\-]{1,10}-thermal$).

Additionally, trivially appending -thermal to ec-back-cover yields a
21-character string. The schema limits the prefix to 10 characters, and
the kernel enforces a THERMAL_NAME_LENGTH limit of 20 bytes (including
NUL). Should the prefix be shortened to comply with these limits?

> +		polling-delay =3D <10000>;
> +		thermal-sensors =3D <&ec 2>;
> +
> +		trips {
[ ... ]
> +			};
> +		};
> +	};
> +
> +	ec-keyboard {

[Severity: Low]
Does this node name also need the -thermal suffix to pass dtbs_check
validation against the thermal-zones schema?

> +		polling-delay =3D <10000>;
> +		thermal-sensors =3D <&ec 1>;
> +
> +		trips {
[ ... ]
> +			};
> +		};
> +	};
> +
> +	ec-soc {

[Severity: Low]
Does this node name also need the -thermal suffix to pass dtbs_check
validation?

> +		polling-delay =3D <10000>;
> +		thermal-sensors =3D <&ec 0>;
> +
> +		trips {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-ec_thermis=
tor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com?part=3D3
