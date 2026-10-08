Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DB93CB543
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 06:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442559; cv=none; b=Bgqzd15z49IUU6ivZsvOBp+HtLBtFHzXB5DAni/IN1yiFlhJTfFY1RfcA6QuTSxw1Kubx66ddl8iGYXEXneaoOghm1Aleq/3mXsW0c5XkQeecj0SXT2J6nkq1pRkG3c5BqpaZWEPpNm99APp0zPgJr8Mee3Mu4fxUhOC52JFXgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442559; c=relaxed/simple;
	bh=CCHtuKmMEuJPPrmD3+zOEJfnrXFEd19ZIJmDz9gdZuc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=YkFQdRtI9o9uToSHS+Nr5i99uzamRBdEZbv7jo4BOW/dVY8/9dB6CWMAp7m68cE21zh+5LXvEZfUPH5CNzAaiTt0GxYBPs8nb2LWObXi3MwvoUCJ3DBeziew24MxxSs4EmpnvurkIuiDUl88sX99EYoDUZK3Rz4C2r4Erts0y1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gwa3CebN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gwa3CebN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AC01F000FF;
	Thu,  8 Oct 2026 06:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791442557;
	bh=hpMGaY4FEBhf6dtXRNLdFTN97eU2pNUAFa0zqQnkrGA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gwa3CebNLyuEPYFQtTL0/ZUBlQuQdOh5IPLWmwz6SgcpaArA4mEJXykvCJsQjLpKD
	 oN9gxzPQvieO+CqrwJRIlFfUYa5Ra73sZix8aEkuBOfavqxvSgd5FF/cjpHePG06uu
	 2tty7P17NnYpoIuXG4vUYMd8aqlTDQ5Uuhlq/3L/Ik3ccQKvtVvy204Uoo7xBTv7Lt
	 udA6iH4MVkeWXrqJIr6JSF4SWjDPx4TnUnYbaqwnsG7KXaCGWHf5YyFhltoH6MoHVv
	 GONlik83SaAV8G9Xc/a6YQYgycWbIZgUIG1UF4QeRdTeF6sMh2gmp8Ku5E4vcliPnM
	 0f9k70bedqAog==
Message-ID: <sashiko-outbox-163720@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/8] cacheinfo: Expose the code to generate a
 cache-id from a device_node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yin Li" <yin.li@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-4-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-4-35196c2b43bf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 06:55:56 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] build: missing stub for cache_of_calculate_id() when !CONFIG_OF
--

commit e0883884c41c729d9be1bcb80b5f81d167e44a20
Author: James Morse <james.morse@arm.com>

cacheinfo: Expose the code to generate a cache-id from a device_node

The MPAM driver needs the cache-id during probe before cacheinfo is fully
setup by device_initcall(). This commit exposes the calculation code so ear=
ly
driver parts can set up resctrl structures.

> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
> index 56fa646df0d12..469d490968acb 100644
> --- a/include/linux/cacheinfo.h
> +++ b/include/linux/cacheinfo.h
> @@ -114,6 +114,7 @@ int acpi_get_cache_info(unsigned int cpu,
>  #endif
> =20
>  const struct attribute_group *cache_get_priv_group(struct cacheinfo *thi=
s_leaf);
> +u32 cache_of_calculate_id(struct device_node *np);

[Severity: Low]
Does this declaration need a static inline stub for when CONFIG_OF is
disabled?=20

The implementation of cache_of_calculate_id() in drivers/base/cacheinfo.c is
only compiled when CONFIG_OF is enabled. If a caller uses this function in a
configuration without CONFIG_OF, won't it cause a build failure during link=
ing
due to an undefined reference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-mpam-resct=
rl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com?part=3D4
