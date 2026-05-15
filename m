Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF0E3C8C77
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 06:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828029; cv=none; b=HaswL5GFWCqq2O+Vy8uwXl3v23UIlRWhc9srGbPBDJfvltVaxDgqz3MAXcsmv7Kt/rtvJuhBBoFcYss+qB3oF8Kc5i8ptIhMcXpCDxHEtcC0cMKAdLBT3vvIlsIKtK/WjdgLeZB/O7/N+5+gNFQxV364sNJC1ULC9c1Uh/I5QY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828029; c=relaxed/simple;
	bh=KEDSSQAsVBcmk+tZl+633r/Ije+SiNPkA/XZclWOE/M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E3oZ/s+XTNGPyIXiTzpXgUju5nQLAhimp1CShZxLtlJYBIA4ZVmW5DQGSNbHfEWgMQ86dg8AXXJy642GVPTggMSVA4HFnyd/4M1r2osbbdp/0bpqoldduK5xyO+oQimzTDmc+/IaxygwpcLunxOluw5aEZKGU83BdPJlW+RJdFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ksBTc/6z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ksBTc/6z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42769C2BCB0;
	Fri, 15 May 2026 06:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778828029;
	bh=KEDSSQAsVBcmk+tZl+633r/Ije+SiNPkA/XZclWOE/M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ksBTc/6z+lx1+0XiYOxt4LoS8/g216p5YHYcYmGo6rRkPMPy99HKL+JIbXqNuHcCf
	 AoJEeatPbqOPMxnxjn95l4273tjCfazDQ5DRKwHQdv3RFeP0tBEoQWS/KmttTfoh6k
	 AEfxo+b2K44llGr8JvfCtGUceNNxkt4jVTNNJkD4sv2PowifnKK765Ydn4kZbK8Jfm
	 vSf4NIbHav0tbp98acTC53qyJ4ZRvXgl1G3K0CywlNDP/NwUM3XoO114TidwQXKOfE
	 KLrseZvW4QqalS9dUQETV3ppwHCI+I+uxvtYqtMXH50BFhtxkVVv0NsQ+9lLdePGTP
	 KHPc1660kqpTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add
 AM-1280800W8TZQW-T00H
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260515064721.1750990-1-dario.binacchi@amarulasolutions.com>
References: <20260515064721.1750990-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 06:53:48 +0000
Message-Id: <20260515065349.42769C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The new compatible string is not inserted in alphabetical order.
- [Low] The panel description comment incorrectly states the resolution as =
WQVGA.
--

commit bf39295cb05fc88a5c9fc03f7444ba1eb3e26cfc
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

dt-bindings: display: simple: Add AM-1280800W8TZQW-T00H

This commit adds dt-bindings for a 10.1" TFT LCD module from Ampire Co. Ltd.
to the panel-simple binding.

> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 3e41ed0ef5d51..ea5fe23a6fe84 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -29,6 +29,8 @@ properties:
>      # compatible must be listed in alphabetical order, ordered by compat=
ible.
>      # The description in the comment is mandatory for each compatible.
> =20
> +        # Ampire AM-1280800W8TZQW-T00H 10.1" WQVGA TFT LCD panel

This isn't a bug, but is the WQVGA description accurate here? The part numb=
er
AM-1280800 suggests a 1280x800 resolution (WXGA), while WQVGA is typically
480x272. It looks like this might have been copied from another entry.

> +      - ampire,am-1280800w8tzqw-t00h
>          # Ampire AM-1280800N3TZQW-T00H 10.1" WQVGA TFT LCD panel
>        - ampire,am-1280800n3tzqw-t00h

This isn't a bug, but should this new compatible be placed after
ampire,am-1280800n3tzqw-t00h? The comment above requires compatibles to be
listed in alphabetical order, and w comes after n.

>          # Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515064721.1750=
990-1-dario.binacchi@amarulasolutions.com?part=3D1
