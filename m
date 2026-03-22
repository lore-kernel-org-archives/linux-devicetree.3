Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CF71684A4
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774175091; cv=none; b=rBvAf+ffJwf7G7StckVqeAOtBT4NKVw9zzOMPJaHlWLy0NHquslg0W/7D4H3OAIzyhcgDhTIjNKGGvh+6AFVWNCcHnqytbAKsI1ZPis6PnHzee7vG2RF7lehK+tU9pzN8JdU3WDK93lG8KOVuIAt7khzacBiE9eoYjNrSmK+O08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774175091; c=relaxed/simple;
	bh=zCqt8zQ2JlSFoGfiAhO4ZqcAnw7CL8AtGU6/DSg1qFw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WeYGOAh/NPWozWI3qRZUEBGRrcxvZdRVAs3zyeK+IKbhZnhYXjQlNQfl6y5JLgDHhoP79z+W4ZHQwcV4IhC8ApweVVhbEtZNJGAcVCnzrOwu8uOt9m8CzcWRPmjSNQU+Fansd4M1vwfuYvkrxLVXanYYrE39y5rZq77T+vtcQJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=QHSS8PLY; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="QHSS8PLY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774175082; x=1774434282;
	bh=zCqt8zQ2JlSFoGfiAhO4ZqcAnw7CL8AtGU6/DSg1qFw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QHSS8PLY5KTo39Rb2etKO1l6TkdOwV0xt0GWFrHR+5z5kDavJ3s+h+QzZWV+RiNCo
	 rTVaoUynvYhPn1UwpGODnksFj8SktnLWMg6G2iN1f8ATFqQsTLuqUYn02HnMc2hHC7
	 6TOZWx3lOYT1m56kURmCQRuRB3zR9yok+mRaw+vywdi6tOb22Q59yPyFd1NtcpXhjU
	 teSYBiL2ZxaukyTm7ddcEgw8JW5iyQwzHJoUP0e8ApEAmSL5nb1Nehl5deEzhaNKMc
	 4VVUWN2Pui2A/skqe75RdVRY0BSqnafaWF/FeYNcvowqwU7WTlKBHODo3DW18r6f0s
	 Dm1gcG7q7I8SA==
Date: Sun, 22 Mar 2026 10:24:38 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add the Nothing Phone (3a)
Message-ID: <aQ3JDyWgwx7y9ixQxFcbTNxtoPnCOJ654qHtz9cgA6MmS5jP_nfj4z-27L5W6qxzCDIbYNqDRPYsv4sj-L3ATzc4IDV_-pREpsJoZaf8Edo=@pm.me>
In-Reply-To: <20260321-asteroids-v1-3-4b902901cb49@pm.me>
References: <20260321-asteroids-v1-0-4b902901cb49@pm.me> <20260321-asteroids-v1-3-4b902901cb49@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 17060ce766d772cbc821cc2f2e785fa5b0a56b10
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Saturday, March 21st, 2026 at 1:00 PM, Alexander Koskovich <akoskovich@p=
m.me> wrote:

> +=09chosen {
> +=09=09#address-cells =3D <2>;
> +=09=09#size-cells =3D <2>;
> +=09=09ranges;
> +
> +=09=09framebuffer0: framebuffer@e3940000 {
> +=09=09=09compatible =3D "simple-framebuffer";
> +=09=09=09reg =3D <0x0 0xe3940000 0x0 (2392 * 1080 * 4)>;
> +=09=09=09width =3D <1080>;
> +=09=09=09height =3D <2392>;
> +=09=09=09stride =3D <(1080 * 4)>;
> +=09=09=09format =3D "a8r8g8b8";
> +=09=09=09panel =3D <&panel>;
> +=09=09=09interconnects =3D <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
> +=09=09=09=09=09 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +=09=09=09clocks =3D <&gcc GCC_DISP_HF_AXI_CLK>;
> +
> +=09=09=09/* Dummy panel for simple-framebuffer dimension info */
> +=09=09=09panel: dummy-panel {
> +=09=09=09=09compatible =3D "boe,bf068mwm-td0";
> +=09=09=09=09height-mm =3D <157>;
> +=09=09=09=09width-mm =3D <71>;
> +=09=09=09};
> +=09=09};

Forgot to add stdout-path =3D "serial0:115200n8" here, will add in v2.

> +=09};
