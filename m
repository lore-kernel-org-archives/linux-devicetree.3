Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9456E1A5B9D
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 18:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785609140; cv=none; b=ZVTyURU1f0QMFiuSC5ybrSWqxVIUM5VT5cNOR94gtE/UOwajfjMzmyNBQFG0HSa38VTLFV5/ZSpxPlewaasQTX9ZuUW4GVIJFYSNPQrKVY+R4Wc4ID7RYxRXxE8IeB9KjT2w3QyOzlceW4Mvnv5Uv60iCGUbjkDabEvoUsVMZzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785609140; c=relaxed/simple;
	bh=0VbIcJu+eSqC3YhOFfJlKfyz967ORrz16GRcn0napig=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T6cDXWsarQVN3Zipg3p31YLN9NtfDORa2eDZSrMo720oEiORPKMbehTmvwi5ma7NlCx90Yo0W56HCUsVNl1IgOC3tXVDm3f+qj5rMurqQRUrR2JHlILF5BJP7XDl+dtE+uiq2WrbOTiTNcJMJ1Yj3zr9Kkc1kvklnYyH15sWHKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FuVHHsSg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FuVHHsSg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE6D1F00AC4;
	Sat,  1 Aug 2026 18:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785609139;
	bh=AwU/ZvZO453UTLjBFQml88J7J328sSkH1xoyb1zr9kE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FuVHHsSg6qL0R18wBExlem84yaLq+ciQq8gJ+XmJQxLfWrm7YRpZBv/0kTmpBS0Yy
	 TnRcrGxzDp1FKvON1GukJVhYnm/kmvRl3aCKwU3TDyqslndTCvZWqWLyP8vHpzymbu
	 haiTpuPQeHWTi+LVR8WtMm5C7O19ybQZPQawbDSqDL2uwoh64xlNHAW7+cWpixC/9g
	 mBUofHMf8CVWamDWCWhGQy5gPRHLKKHvjw8oy0FlY/s460MIG4SoqRAB05daLkqHt5
	 NraK2CAUpL5X2Hvu8Nco11aWYN9PMT5NMc0jEixyi4h/Z61j6GLJLFg3lQahRDvGsm
	 VFjDZel/8UgTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: platform: introduce EC for Dell XPS
 13 9345
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksandrs Vinarskis" <alex@vinarskis.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260801-dell-xps-9345-ec-v3-1-9f4bdb5a5dad@vinarskis.com>
References: <20260801-dell-xps-9345-ec-v3-0-9f4bdb5a5dad@vinarskis.com>
 <20260801-dell-xps-9345-ec-v3-1-9f4bdb5a5dad@vinarskis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 18:32:18 +0000
Message-Id: <20260801183218.EFE6D1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree binding example includes a nonexistent header and u=
ses undefined parameterized macros, breaking schema validation.
--

--- Patch [1]: [PATCH v3 1/3] dt-bindings: platform: introduce EC for Dell =
XPS 13 9345 ---
commit 260bc940f745039b1b740f5fca09f58549473355
Author: Aleksandrs Vinarskis <alex@vinarskis.com>

dt-bindings: platform: introduce EC for Dell XPS 13 9345

Add bindings for Embedded Controller (EC) in Dell XPS 13 9345 (platform
codename 'tributo'). It may be partially or fully compatible with EC
found in Snapdragon-based Dell Latitude, Inspiron ('thena').

> diff --git a/Documentation/devicetree/bindings/embedded-controller/dell,x=
ps13-9345-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/d=
ell,xps13-9345-ec.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-93=
45-ec.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <arm64/qcom/qcom-adc5-gen3.h>
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Low]
Does this header exist in the source tree? It appears to be missing, which
would cause a fatal preprocessor error during schema validation when running
make dt_binding_check.

> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        embedded-controller@3b {
> +            compatible =3D "dell,xps13-9345-ec";
> +            reg =3D <0x3b>;
> +            interrupts-extended =3D <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
> +
> +            io-channels =3D <&pmk8550_vadc ADC5_GEN3_AMUX3_GPIO_100K_PU(=
1)>,
                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Low]
Are these macros defined anywhere? They appear to be undefined and used
incorrectly as parameterized macros, which would further contribute to
preprocessor and schema check errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-dell-xps-9=
345-ec-v3-0-9f4bdb5a5dad@vinarskis.com?part=3D1
