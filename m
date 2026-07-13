Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CF33E5A2B
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942746; cv=none; b=auaODNOBKljtpw0lw3cTU9X/0siUMeDBwHujZ1FppH/7O2b3+gnCNglQgCgd0JOYBV4tN9niryWbxCtFtn6Gp6g6vCfORBvxcy2OpPAXfwRGA75AZxVi/KDS1qOjdYC8xKnsNXnJTFkHuVob6pfjjJ8oG7kMQ/6DzCPzEhf6RMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942746; c=relaxed/simple;
	bh=Ma5391Cqb/y6aQhAZWWefapi/hITbyfcodm9edhan1Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nYPSlHwoQeSC0HGSVKUv21leTvovpoQnHH+qFhhNTBkgyrJ1tF0BkPMewgoG2rqL44zHK7pNeAwTnaQ+puPA7/S/iFzFs3E4omPIK6oVVLDie4kq90eoX1ymXWV7wm9kOsCGQUGgwDGibpbGJDcX1R5QU20KtLDn7TM7fZvrAUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4AJnxxw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4AJnxxw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FAE1F000E9;
	Mon, 13 Jul 2026 11:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783942745;
	bh=vjUNoxbnoVzjgxQLa2hBpFzn2KLnn/bd/B1egmQFBfU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l4AJnxxwXASnSBwvG/HK485dNSv8/Az0CfCXVe/T61+YCpnOoAkA4vNoyw2bFZiAz
	 v4aB9gBj08D1E/yZlCH5BTsjBVzuxo3DjmB7tYoI39i7eLEu1mNgfx/DLZkbKlSwey
	 +hFohhj1NWMB7i3i1ZCKNm5B+6giN4upgHeDRm9iF0vj+zXTuE+sbKxvAyN42M/W0y
	 xkeff2TooeDCxkq2CMO1xGJWq400izQgoAOTLVDfewlMcu2K7nQu9Reyubvvhllv3s
	 BGz/90qwxs0ZO0fIB8QbmF7s6p/RZWxZBCHrZONOPQy/adul5nselMAx6YAudPFrnX
	 5I3Hcqg8mR0MA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] dt-bindings: net: microchip,lan78xx: convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Lukianchikov" <avermoal@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260712113821.12543-1-avermoal@gmail.com>
References: <20260712113821.12543-1-avermoal@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 11:39:04 +0000
Message-Id: <20260713113904.D8FAE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Commit message includes inaccurate claims regarding changes to t=
he MAINTAINERS file.
--

--- Patch [1]: [PATCH v4] dt-bindings: net: microchip,lan78xx: convert to D=
T schema ---
commit f1714d97cf714d559260a426c4169db231384ff6
Author: Mikhail Lukianchikov <avermoal@gmail.com>

dt-bindings: net: microchip,lan78xx: convert to DT schema

This commit converts the Microchip LAN78xx family binding documentation
from plain text to DT schema. It also updates the MAINTAINERS file to
point to the new yaml file.

Link: https://lore.kernel.org/netdev/20260711105537.11065-2-avermoal@gmail.=
com

>     Restoring a mistakenly deleted email in MAINTAINERS file and fixing
>     microchip,lan7800.yaml.

[Severity: Medium]
Is this commit message description accurate for the changes included in
this patch?

Looking at the diff for the MAINTAINERS file, the patch only updates the
file path from .txt to .yaml:

> diff --git a/MAINTAINERS b/MAINTAINERS
> index f37a81950e250..5de154167b332 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27931,7 +27931,7 @@ M:	Rengarajan Sundararajan <Rengarajan.S@microchi=
p.com>
>  M:	UNGLinuxDriver@microchip.com
>  L:	netdev@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/net/microchip,lan78xx.txt
> +F:	Documentation/devicetree/bindings/net/microchip,lan7800.yaml

It does not appear to restore or add any email addresses. Could this text
in the commit description be an accidental inclusion of a changelog note
meant for below the '---' line?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712113821.1254=
3-1-avermoal@gmail.com?part=3D1
