Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3161A9FAB
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101939; cv=none; b=gL593Lme0asQbQ2SX2in7uM2NSG56LCe9Se9lgsb0JLQ6KUyql6D92v8JApnhIdL636cnvRPc4NmyxpDHlPMXnrCtcvgoW/NJ12xbTqjk4WEfrJPK4AagiH69UNJVt/4bcWW0ouLezrRlaKEjODUDmx2BT6Gc7cemJ8q3zJsORI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101939; c=relaxed/simple;
	bh=bgOyXp4WPxQ5rcdTAw4JUnQkOjE12WdfRpfcAN71Xlc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l8ybHvaevV0FZ0XgtWtgE+ipcDtLeqRn3AgoFxxQoAbT4c5UN/l9IkKshGZES9fEhlWCm25m1mHOx+XQGM9SK7UHed37NYbr6cQ/A0UR2Yvq1fKJXp/Zlmcej7JoK0r2OVrdZejTrjhMuhJqFBjv8la9V3YKfraUmLmwHpEtfPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbzcCp23; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbzcCp23"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1BE1F00893;
	Sat, 30 May 2026 00:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101937;
	bh=u17r1BotL8EYi7xscICZmk5HqnD+coyQrha/RKHOoAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GbzcCp235K5URr/S1Qt1+/SluIFf49mgOzkSbFfyo+nx/ID4B2zM4X9uRlg9C2HQT
	 S3K9tAJAG6fRJfyoD8kDboPs50JW2yDDvkCenfZFbnUHCSGHcXHowbkXa4b4b3toBD
	 OCgCxiXW23n1Pe8Ki3sp2k2ysffAzT8GQ7f3FA7dBqE8tpri5UA8O2AGx0IERAToEW
	 PPnZJ1DILWlFSmEOGwWN2wzwkFTAWreGvd0I9gVZ5IlyvX/a3ky+Pt2IBTw/BH+Ps6
	 akx4BFgkp6E4EyN+o02qP+LLZhdIf1f9+6J1mafhJ8tpqPvvVn9CuVcaPAPMM8qS6c
	 z1YdpJSft/S6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 1/6] dt-bindings: net: Add support for
 Airoha AN8801R GbE PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260521-add-airoha-an8801-support-v4-1-1e4837d30ef4@collabora.com>
References: <20260521-add-airoha-an8801-support-v4-1-1e4837d30ef4@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:45:37 +0000
Message-Id: <20260530004537.8D1BE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding incorrectly redefines the standard `function-enumera=
tor` property to configure hardware offload modes instead of using it as an=
 ordinal identifier.
--

commit e8af54668e8a0d612e75cb2d23647751c0b3640f
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

dt-bindings: net: Add support for Airoha AN8801R GbE PHY

Add a new binding to support the Airoha AN8801R Series Gigabit
Ethernet PHY.

> diff --git a/Documentation/devicetree/bindings/net/airoha,an8801.yaml b/D=
ocumentation/devicetree/bindings/net/airoha,an8801.yaml
> new file mode 100644
> index 0000000000000..fb2f70ceb33ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/airoha,an8801.yaml
[ ... ]
> +    patternProperties:
> +      "^led@[0-2]$":
> +        type: object
> +        description: PHY LEDs
> +        $ref: /schemas/leds/common.yaml#
> +
> +        properties:
> +          reg:
> +            enum: [0, 1, 2]
> +
> +          function-enumerator:
> +            enum: [0, 1, 2]
> +            description: |
> +              Specifies a function for offloading LED functionality to t=
he PHY:
> +              0 - No offloading
> +              1 - Link Availability
> +              2 - Network Activity

[Severity: Medium]
Does this code misuse the function-enumerator property?

According to the standard LED subsystem schema
(Documentation/devicetree/bindings/leds/common.yaml), function-enumerator is
strictly defined as an integer used when more than one instance of the same
function is needed, differing only with an ordinal number (e.g., LAN 1, LAN=
 2).

Using it here (and in the subsequent PHY driver commit) to configure
hardware-specific offload modes conflates an LED ordinal with hardware
behavior configuration.

Could this establish a non-compliant device tree ABI that might break
standard LED tooling?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-add-airoha=
-an8801-support-v4-0-1e4837d30ef4@collabora.com?part=3D1
