Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800F74BEE5E
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 06:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789281069; cv=none; b=Ocibb3nsJF0YsywtaQYwqaBV9u0hiSe1t0rULOLRjCHr2904uZ9RDMXd4leNk6Km0qF+Fq2njjX8/NCCEtW2TfnjlypPyYrL0U/aRMVmLbebpdwzn7VSZ43yjTJNt2mP9IHBCqsEbCR85EZZx5J739WRHs1bFP7E0q6hlvpZf3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789281069; c=relaxed/simple;
	bh=XNqoDi8GI6eE5CBlp5NDP5H7YIhJjWn0NcRjIzIyyWk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lEFuzZDi2qJVY+RlWx9mqbaUyaAXQT4hD0Df1//e8i20oDBpAUCILzNhyccdBBpi5AE3xaKK8mvOzz6KDa7zh8ubT3BxIvUZB45UvjBfjnzX8Zg9EMPlEXvhog7kas6UsWQzn4EFTeehK1ZXlMpS6AqIruFW7EcbDfFvwo+FipM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eb0GvKTr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eb0GvKTr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83681F00893;
	Sun, 13 Sep 2026 06:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789281068;
	bh=xAwViQErcoj/iSttbbspJZcrpFedxAxEGKzSOirtOkE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eb0GvKTrK6JzGGFT6T639FISDQIWxwijFAHO7rxs60EO2H604Dt47YyIzbCpa4sd1
	 JsvyWir7dtH7h3uL15D4teeD0UXjN5uVf7cavJjDPF62oQxHDDjStnTzPn2YlHU3je
	 Js5AWPF+pFYRKFjRj7i/5mQEzr12twUvd2IHVeALz/iVwhI4oLSBa4u3MCV1EcAztO
	 I48pp/5sv8s4EjhqkxyWgoH7MRuIk9VIFmB4mt7SfsU9jGicij8DFZlMU4F7i+yOto
	 77sMckRL0KxeQu/REbLlFdmL6YZr7lavHaYnHxQpxyHXUpEbfp5y2KAVxSBfc7Act+
	 l8z2tZjnSjpZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: vendor-prefixes: Add Shenzhen Zhuohong
 Electronic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Minnekhanov" <alexeymin@minlexx.ru>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260913-nt36672a-panels-v1-2-ce097402c6ea@minlexx.ru>
References: <20260913-nt36672a-panels-v1-0-ce097402c6ea@minlexx.ru>
 <20260913-nt36672a-panels-v1-2-ce097402c6ea@minlexx.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 06:31:07 +0000
Message-Id: <20260913063107.D83681F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Vendor prefix mismatch: 'shenchao' mapped to 'Shenzhen Zhuohong Ele=
ctronic Technology Co., Ltd.'
--

commit 73f96d396aaa9d9d8dc1a660e32b98910c8690b8
Author: Alexey Minnekhanov <alexeymin@minlexx.ru>

dt-bindings: vendor-prefixes: Add Shenzhen Zhuohong Electronic

This commit adds a new vendor prefix to the device tree bindings. It aims
to register Shenzhen Zhuohong Electronic Technology Co., Ltd., a
manufacturer of LCD/IPS displays.

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1507,6 +1507,8 @@ patternProperties:
>      description: SGX Sensortech
>    "^sharp,.*":
>      description: Sharp Corporation
> +  "^shenchao,.*":
> +    description: Shenzhen Zhuohong Electronic Technology Co., Ltd.

[Severity: Low]
Is this vendor prefix mapped to the correct company description?

The patch introduces the 'shenchao' prefix, but maps it to Shenzhen Zhuohong
Electronic Technology Co., Ltd. Since 'shenchao' typically refers to a
Shenchao panel (as seen in a subsequent commit introducing the
'shenchao,fhdplus-video' panel), mapping it to Zhuohong, a different panel
manufacturer, could cause confusion for device tree authors.

Should this prefix be named something like '^zhuohong,.*' instead to match
the manufacturer, or should the description be updated to reflect the actual
Shenchao company name?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913-nt36672a-p=
anels-v1-0-ce097402c6ea@minlexx.ru?part=3D2
