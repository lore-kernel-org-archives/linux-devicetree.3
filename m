Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A88395243
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778885724; cv=none; b=ZDLUhy3cbeXeaBr4UtbVFP8um33itAR5UdKWfwE8l6da+qQgnG29Ah+Y8WmBpQiv5JYs2RYiKHWYXVIBLAXbVShY+lN/0XjVFRcjhoEb5nVPAMFZZhOa2v1Wpcnn/PJcrNtDpkjx4KoOG1ER8j1jU8MCJVjbKBnEx5X97aQR/Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778885724; c=relaxed/simple;
	bh=qAZU9KXzEMhQER7M2HhOcqibjghOsciau3ty79QFc/8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jss9ebGVzLjCiGicOT37iARdkQQa1cFe15sDMuOrpCRuiZqtLHtHsiBdgjIBsalsxgJwoA9oCn9nUidfldoQc9Xe85/jRInqVMQp6EJDSK4Dd+U7ld6AeenH5cTMMl3kC2+ga7vc3apIkcY7cGvn4R9CS1rxuUjE3QnzQAPxT+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0fYb7kH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0fYb7kH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19DC2C2BCB0;
	Fri, 15 May 2026 22:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778885724;
	bh=qAZU9KXzEMhQER7M2HhOcqibjghOsciau3ty79QFc/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=A0fYb7kHtVBTlmIzPHuJIkQ7OwinSjyT2RUY3v1HdWaDJrRdJ80iNMfrd1GMCEWGf
	 1mt57JTA5PbkwdZTgFvlV19/1R1Jog2lQ79+rYZ7bV0qaZ1EwMS+dOXX1up4eGEVM6
	 uO0ohOBbcrqt3ZMpFMc+a+0gnoajivhrhBrZE6zP44GtVYkG/I9eYQ4qOByJ1ddMkC
	 G4f02P9Kud2CXxntXPPW8j1XY9/bAV+Krquhzv6VHqWu2wAFbty7YkKxmrQ5eWCKgb
	 TEccXH1tMVJ6jw6WDqJE3mC9jt38mY1KJFEhpsbXEqB4UQVz1bLU9bM3BAUnX/luew
	 7ry5kG+2qrLiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 3/6] dt-bindings: display: panel: document Anbernic
 TD4310 panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260515221947.299229-4-macroalpha82@gmail.com>
References: <20260515221947.299229-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 22:55:23 +0000
Message-Id: <20260515225524.19DC2C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The YAML filename does not match the compatible string.
--

commit 5f66eb8e2fe14ce244cbb7ee82f13643cfae18e7
Author: Chris Morgan <macromorgan@hotmail.com>

dt-bindings: display: panel: document Anbernic TD4310 panel

This commit introduces a new device tree binding for the TD4310-based panel
used in the Anbernic RG Vita-Pro device.

> diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,td4=
310.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.=
yaml
> new file mode 100644
> index 0000000000000..5068dd6b2d524
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml

[ ... ]

> +properties:
> +  compatible:
> +    items:
> +      - const: anbernic,panel-vita-pro

This isn't a bug, but the YAML filename is anbernic,td4310.yaml while the
only defined compatible string is anbernic,panel-vita-pro.

According to device tree schema guidelines, the YAML filename should genera=
lly
match the compatible string.=20

Should the filename be renamed to anbernic,panel-vita-pro.yaml, or should
anbernic,td4310 be added as a compatible string here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515221947.2992=
29-1-macroalpha82@gmail.com?part=3D3
