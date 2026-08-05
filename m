Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AEB3E3DB3
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 10:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925151; cv=none; b=cl2IpTvq+wTS+tkMGxALAsb4aEwLa9mIacJStlijQVEY8XH18J9Kh2arA5yiT9YUzgEV5kjLa4yDlcy3+PPI4N76+jvPSGb3HFvS8D3HsiYUqHjK9l22C9AqLaPbuRTBmbMQMhvDDmIPfgPAuzi4uHNkbTxiQV70nZEGS1PfFo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925151; c=relaxed/simple;
	bh=Z09/O9uH0YPm9LdqXdzJqndOd5Ft/4yANEKi+cUmB7Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HZw1O1WaHW4okWDD2BAAOoF+CW3u1rh/ryl/76hQwCOd2K+HfvXQ0zuSIj7bLth/u7M34gE6FQLvLMswIuevPXN6M94mdVC+YrHaHZMg/b8P4lXBEQxmpFqFe4VQokfCno9qpdZ9IGL7wKGZkxH5hQn3dfWbCAiCnqOy+GJHJAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/xXTS6t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/xXTS6t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5761F000E9;
	Wed,  5 Aug 2026 10:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785925143;
	bh=TtP2Ic3Bka3XXicwwpQ31Z62rBhMpJ0o20wawccIcCY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H/xXTS6totGLbsce1N5iZbsGDuA0+e4oxSCYwqbvYSRlROApk6gTXvVpHgwlHgZ81
	 sn2SSPk1lrG6stJvdiKeknYxag6EYtaVczVP6GPxKywWXNZSiDRy0n1TeMjX/i+ZFw
	 1LxKosw/u7gWt/I0HH7ELKKiDZ6EB7TmMgCvBqjvxr4MW0zJ2nxmtZBZBetma6xqcH
	 StB6R05HUkkiim38aVQ840QeQEpkO20lHyce0U/iQgMvP8wpNhCNJ45mLzq2EnU+6n
	 ZICCQ3clHop1f3ZUvl0foQ1acYvTl57w6kwJsKswyPr6C59v5Q6cDR0jo7rN4dJwx/
	 efwmqpAjBqEvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: spmi: apple,spmi: Add t603x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-t603x-spmi-v4-1-c15a12d9a7d1@chaosmail.tech>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
 <20260805-t603x-spmi-v4-1-c15a12d9a7d1@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 10:19:02 +0000
Message-Id: <20260805101902.AE5761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Addition of the `apple,t8122-spmi` compatible string is not docu=
mented in the commit message.
--

--- Patch [1]: [PATCH v4 1/6] dt-bindings: spmi: apple,spmi: Add t603x ---
commit 3674bf5dbfe7c309c197e5a76b4e84e891ec9d7d
Author: Sasha Finkelstein <k@chaosmail.tech>

dt-bindings: spmi: apple,spmi: Add t603x

This commit adds device tree binding support for the Apple t603x SPMI
controllers, including optional interrupt support for controllers that are
not always-on.

> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Doc=
umentation/devicetree/bindings/spmi/apple,spmi.yaml
> --- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
[ ... ]
> @@ -20,8 +20,11 @@ properties:
>        - items:
>            - enum:
>                - apple,t6020-spmi
> +              - apple,t6030-spmi
> +              - apple,t6031-spmi
>                - apple,t8012-spmi
>                - apple,t8015-spmi
> +              - apple,t8122-spmi

[Severity: Medium]
The commit message and subject specifically mention adding support for the
t603x series, but this also adds the apple,t8122-spmi compatible string.
Should the commit description be updated to reflect the addition of t8122,
or was this new compatible string intended for a separate patch?

>            - const: apple,t8103-spmi
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-t603x-spmi=
-v4-0-c15a12d9a7d1@chaosmail.tech?part=3D1
