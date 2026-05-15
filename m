Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F09B368964
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778808058; cv=none; b=VOjn5LXujNShVfLloPvqOHC7av4gmVOnpdH6IZoKNXfNKynWEyDodeOBcpqSfVlk4O3Pnzd7tphp7/7DBeb529XlDlgMZF1T3qX0k9g9WXpxheqwaBoysrBcKBxjqnW2U5xYOVoD0qFzHnvz7rEi72I4qXz7LxYmYCWG5iyssRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778808058; c=relaxed/simple;
	bh=N1r10OChhUO84kpS59xO0RaqZrPiIBGpm3EgkHZngYI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dWThX68oyNjWm5H5U6QJ4z7ts8wRuHfN0pgcplKsfO0VayZ6+LjRJi1MjwluhgRoEyo4uIzhdTg92Hw+gU3Vnm20chHm4mekzgYTJtLnnaqM2NphgfncGitANPfYPtlReGSQ5hX5vM5ikR5G1OYzq5RsvkM8UMvR+42EUqfVys0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBgNKbXL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBgNKbXL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06EDC2BCB3;
	Fri, 15 May 2026 01:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778808058;
	bh=N1r10OChhUO84kpS59xO0RaqZrPiIBGpm3EgkHZngYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=TBgNKbXLQNxTPuE8tbC4AqAL7/B50xywCWjPXPwhQzBXRWMuDec1SRcBhAUzsov+Z
	 Fw20kykw2W7jaxNbwZViwi38/or1GnCE8UITyVc89EC9w+RiTX3XhTxkN23wJvVnev
	 YajXtO2nOigssHAzFYYyfsVcgc4cQfWGCiF24YAB2qOcP6neLBGyvEraiMkgStM88Z
	 fI6YW14eJeqm8Is1NOe/0FaleW/tXfKR5CCZ7oHFv1ANjdxYZxUFe0dZRg7PiuBM/z
	 FPs0ihPsc6dpU/KdufOiRfv3SAnrqKKI4I8h5ZynVP61xM7rF1RLda28EI2fD6trDa
	 6hwdNgzLfJdMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: vendor-prefixes: add Rongda
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang via B4 Relay" <devnull+wangjia.ultrarisc.com@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-1-bf559589ea8a@ultrarisc.com>
References: <20260515-ultrarisc-pinctrl-v1-1-bf559589ea8a@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 01:20:57 +0000
Message-Id: <20260515012057.E06EDC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new vendor prefix '^rongda,.*' is inserted in the wrong alphabe=
tical order in `vendor-prefixes.yaml`.
--

commit dca4b6c39a857922a831a430a56bddfea711476c
Author: Jia Wang <wangjia@ultrarisc.com>

dt-bindings: vendor-prefixes: add Rongda

This commit adds Shenzhen Rongda Computer Co., Ltd. to the devicetree vendor
prefixes list.

Link: http://www.shenrongda.com/

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 28784d66ae7ba..04e593c66c7c4 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1407,6 +1407,8 @@ patternProperties:
>      description: Rockchip Electronics Co., Ltd.
>    "^rocktech,.*":
>      description: ROCKTECH DISPLAYS LIMITED
> +  "^rongda,.*":
> +    description: Shenzhen Rongda Computer Co., Ltd.
>    "^rohm,.*":
>      description: ROHM Semiconductor Co., Ltd
>    "^ronbo,.*":

This isn't a bug, but is this entry inserted in the correct alphabetical
order? Alphabetically, "rohm" and "ronbo" should appear before "rongda".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-ultrarisc-=
pinctrl-v1-0-bf559589ea8a@ultrarisc.com?part=3D1
