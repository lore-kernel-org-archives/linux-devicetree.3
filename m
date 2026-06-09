Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA720373BE4
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 21:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781041140; cv=none; b=mS3AElvav3jZ9uQxA3Npi6vU7fDoBxljBsY9W3ufMrEmA38oU1uCIy2Cu15L8VCEaRR8R1VnUmBhNjQkhP7IxG3yepOrea2KId3fHy6yslbO0eNJXwvic+ijVj2JczVpo+q/TUA7OytfydonYX5Qa4PgF8kWiZxlXHE8xDmkZDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781041140; c=relaxed/simple;
	bh=ufe/+3MlZHgfsfopy//V4vNLQyun6n0BlQhNqz4YL0M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nSrSeDsSY8hMFXqtOIjK+u9Z5m46V0fdOcp/JLkTkNOoUo+PFnpZPGdxCARKN+u74S1NbfvXKW2U52VnPB/owgs47P3OYKXPEhJ+S1pMEs3U1na5ehQO2MHAyrQbpOgsc/9kx2CNMaqDOotXdJlRv1IG6b4rcfumyWbsPeLFY84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WttAFDAw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WttAFDAw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4611F00893;
	Tue,  9 Jun 2026 21:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781041136;
	bh=o/JGjHizYGryTmcmiizautgCefRKVFL9GpsDJkSpvFw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WttAFDAwLv+OPS605ClUgjop+1apnQ5Ge32wZIOKfBOiW+qciOE814r1ioAwy34lp
	 atGzCJx+Y7ziCn250M9ad+xS6hWERtbpFFwnfT1JrtKphry9C5IEn1bZd8P0YdKU0P
	 UHwgBYiJHruV3UY0jArn6MUp52P0NwhWNKhAAwA4/UNt6GFgCSlzN4mKbeH2h8eqnH
	 jMSy1z5aUV220EVDHE8S95AU3HgfH4I4A9jfFoqXkMxX3ihtk1I9q5UHWCEz3DUxVE
	 s9vG/V9v4rC9GJHRygADpYRUpWta40DeE/yLrzbY4FGXbSKmPmhILJQQSAjF37eqK5
	 8wUU3pL4qOr+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix
 dma-names and ports schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260609212921.1706886-1-john.madieu.xa@bp.renesas.com>
References: <20260609212921.1706886-1-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 21:38:55 +0000
Message-Id: <20260609213856.0C4611F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unimplemented Commit Claim: Missing clocks and resets constraints
--

commit 57b95b37a13d07fcffc98c59354ae1c916fe8d6f
Author: John Madieu <john.madieu.xa@bp.renesas.com>

ASoC: dt-bindings: sound: renesas,r9a09g047: Fix dma-names and ports schema

This commit simplifies the dma-names schema, updates the ports container
reference, and removes unused top-level address and size cells. It also
updates the example node order and clock specifiers, and states it pins
clocks and resets to fixed counts.

> diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-so=
und.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.=
yaml
> index d7fa165546985..b539e84ead8da 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> @@ -42,12 +42,6 @@ properties:
>    "#clock-cells":
>      const: 0
> =20
> -  "#address-cells":
> -    const: 1
> -
> -  "#size-cells":
> -    const: 0
> -
>    clocks:
>      maxItems: 47

[Severity: Medium]
The commit message mentions it will "pin clocks and resets to their fixed
counts (47 and 14) to match the clock-names/reset-names lists." Did a hunk
get dropped during a rebase?=20

The patch doesn't appear to add minItems: 47 to the clocks property here, n=
or
does it add minItems: 14 to the corresponding resets property.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609212921.1706=
886-1-john.madieu.xa@bp.renesas.com?part=3D1
