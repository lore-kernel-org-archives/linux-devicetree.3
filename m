Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7AD381C4
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 05:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778736364; cv=none; b=b/nQyHd97bzeWVKAjXN8XKgNovlvYfa2tnTK8Tze9c6BzAADYlW5ASVkSby6x5mKmyC/k8qAfdLeYy1nvAKTKW4LfvNYe5WyJqigaM9cgB7ge1+3mZgVu92by+Bs8nLmcXSWHyC3PXLK5Urkq2POKMZ+plXoISinVbW42AIB1Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778736364; c=relaxed/simple;
	bh=4StrAU7248OTtlC+Jo5x9pVq8Gk3S53no3GhlX1IGFU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=StFYmZPOFP+T7bKO2XZ4WfFtVrqDQT+ZtHEjU6kywxAbIoolAv9kPVUQKjKv5suRnJfb0fxWdKipTChhRLKyGpaLDLJiDEAJlfS7CtE0CyBohueCtF39sOdN/q/n/b5bb8NKCQn9Yucn+vGIoaqlQN6bsFKyi9aYIFlEGDPWSzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SedYNqzM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SedYNqzM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE46FC2BCC6;
	Thu, 14 May 2026 05:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778736364;
	bh=4StrAU7248OTtlC+Jo5x9pVq8Gk3S53no3GhlX1IGFU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=SedYNqzMRwxLBqqPXCHF7eXgI9BPbHDn2z3p4jnVYhLCwu0EXs7JJrlVoQdUatLuq
	 QBYVZWIjS5TqrKQPJ2906Tv2Ivkl+dUO9FwKLdrysUyWybuI38syNQXc88vbYrHhNn
	 H+hlGmJ5WRNqxq9XEpLzPAqD8eGl28k1HNqSq4K84tiWNQHY1g1ZmH3xswGNW87Ngp
	 r4ZppC5ewj+CGDz+Nr6bkQQ2+uyhBoOs3F44T4yETeD/DTnF9+tPDdx9zm4XFG/Mhp
	 RzpRfIc5Ub8+vhj/Ht9SKZRuDdbIjEWQOSQTz4sDouJU7Pc8JIaTIINAzTXQTlE70H
	 cz4dKgWPaCPVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display/bridge: lt9211: Add
 drive-strength-microamp property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Boerge Struempfel" <bstruempfel@data-modul.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260513133127.376458-2-bstruempfel@data-modul.com>
References: <20260513133127.376458-2-bstruempfel@data-modul.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 05:26:03 +0000
Message-Id: <20260514052603.BE46FC2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The values for `drive-strength-microamp` are scaled incorrectly by=
 a factor of 100, violating the standard device tree unit suffix.
--

commit ab265d46e886455894986f313701d72a9407a58e
Author: Boerge Struempfel <bstruempfel@data-modul.com>

dt-bindings: display/bridge: lt9211: Add drive-strength-microamp property

This commit adds the drive-strength-microamp property to configure the
LT9211 LVDS TX output driver current. It specifies sixteen discrete levels
ranging from 12 to 36.

> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9=
211.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.=
yaml
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
[ ... ]
> +  drive-strength-microamp:
> +    description:
> +      LVDS TX output driver current. Sixteen discrete levels are support=
ed,
> +      corresponding to the following nominal values in microamps.
> +    enum: [12, 14, 16, 17, 19, 20, 22, 23, 25, 27, 28, 30, 31, 33, 34, 3=
6]

Are these values scaled incorrectly for a property ending in -microamp?

Properties with the -microamp suffix typically require values in true
microamperes. A standard LVDS driver requires differential currents in the
milliamp range, typically 1.25 mA to 3.59 mA, to generate a standard 350 mV
swing over a 100-ohm termination.

Values from 12 to 36 microamps appear to be physically insufficient for LVDS
signaling.

If the actual intended currents are 1.25 mA to 3.59 mA, shouldn't the enum
values be 1250, 1406, 1562, up to 3594 to accurately reflect true
microamperes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513133127.3764=
58-1-bstruempfel@data-modul.com?part=3D1
