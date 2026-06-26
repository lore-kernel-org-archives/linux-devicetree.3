Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CDE3F787B
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782483049; cv=none; b=qf7V9qOFHF1ovLLXt+PeE6hdgLEP6WyIfyKgx3/NCy94+Pjvir2FT1gmSbg8QKmOv7c+9Xq4G2WUFyKdh2XpfEsmml1UFqLtr0K5bA2DaOo+1CXpcmvP+5Sh98WHcyrmRKhpoVWP6OoD+OkeBC/UmxcmPvIYYRUGKEJuHvBwqJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782483049; c=relaxed/simple;
	bh=DDEKwTiPlFrkGV5+hjM/xG5FQ9xPZubUaY/LpcS1UuY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BDvED9H0nVHEUZr3CEh1fUsewguoj+x/AQN7PFpNMgLYPyn2iLxBvfYP45gLswTk2ZFzR2mgYlpH+VFtVmbaS8OivNZR4cOD6wEsTkU22tKtYowy8QNLcdYkXnvl/TSmKpWbAcWAl5y8t7U5Lrq8gZK3rcjw0Y2WUnsWxTfkzx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYjCWIRQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYjCWIRQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFC21F000E9;
	Fri, 26 Jun 2026 14:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782483048;
	bh=PxovwiKiTFuOZIA1X9SuIL0lmTpc/gW6yOtk4D8tsFg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nYjCWIRQyM26Gngyz0uc3jRy1O21SSI88+RMokSVG8ce+hJSPU6NIGO+1AxsX2Ugl
	 dV5UNqZ5ObfUAVr903e5Vi97pzGxBct9NelagyedcMi2AQWVp1B5/u/W40GymOBWcX
	 4tC0Fl6YpkPAZwr0Hep1fiQOB9bgkkA8KuggGxD+9xzf8wU7QgDtRKn9yqQfP/9Xc9
	 nmGh2j2Rj3FTnr8lSw+niHpE1qPnJuEmaKwBcINXIbXedLHwczpvDNnyBFdcYD2Hul
	 jv4Q1A1rXKnAiFN9Yq4g0yKthcSDmdfsnHKkHjLm995w5lEJyuwxXUwZmqQ1hbY915
	 hD6hffemUBtPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: net: bluetooth: Document Qualcomm
 IPQ5018 Bluetooth controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem via B4 Relay" <devnull+george.moussalem.outlook.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625-ipq5018-bluetooth-v1-4-d999be0e04f7@outlook.com>
References: <20260625-ipq5018-bluetooth-v1-0-d999be0e04f7@outlook.com>
 <20260625-ipq5018-bluetooth-v1-4-d999be0e04f7@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 14:10:47 +0000
Message-Id: <20260626141047.DFFC21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The description for the 'interrupts' property is abruptly truncated=
 mid-sentence.
--

commit 6f8911a9af73d725c2b86b32d5b5e404664a0809
Author: George Moussalem <george.moussalem@outlook.com>

dt-bindings: net: bluetooth: Document Qualcomm IPQ5018 Bluetooth controller

This commit documents the Qualcomm IPQ5018 Bluetooth controller by adding a
new device tree binding schema.

> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018=
-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-bt.=
yaml
> new file mode 100644
> index 0000000000000..afd33f8518588
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-bt.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq5018-bt
> +
> +  interrupts:
> +    items:
> +      - description:
> +          Interrupt line from the M0 Bluetooth Subsystem to the host pro=
cessor
> +          to notify it of events such as re

[Severity: Low]
Is this description abruptly truncated mid-sentence? It appears to cut off =
at
"events such as re".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-ipq5018-bl=
uetooth-v1-0-d999be0e04f7@outlook.com?part=3D4
