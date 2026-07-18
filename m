Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE14D175A5
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 17:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784395359; cv=none; b=k9PZKGD7/HeHDnP7t9plJFhR6PmPef28MAPv+Dxag9YN8JUMfjiaP0lYIfZZjR3RU3AqDC6gtjJYUtqJntjIbwlsSFsyt3e6jHn4XgzH1+vs9CDPb+m3ifq0sqULRmiZLLHbWFzG/8BMoy4UNIqr2DBfI7zoU86KhIsGcaAzSTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784395359; c=relaxed/simple;
	bh=yV0aERIwYPImae+1vw3n7z7EsTChcETr/TVxFvpngZc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SCeqxczIQwbfA/h6JJoLrsOM0rX1PnnYE9w850B0VhzMMQ+7AxfLPVfQWD72OrHmhuSuIMpsUUizzL1QoT3G8QvpM8KXQJccuDsZqc9Ol5SukYiGHW0zgk8/fhMLRCNfaTpXjy0+sU9HqVdwoL1QPE6kx5vXapsif++Ay/6/4wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fxz8wmOd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fxz8wmOd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE011F000E9;
	Sat, 18 Jul 2026 17:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784395358;
	bh=iDXSzANRqREQJJWLCafTfXdsbNq8zt+hhWDsZIot8SQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fxz8wmOdCtTtu2VEVRnMSwM/TaH/x22FNcLdCl10MKoovka8BpzjjY3SpRQ9NczuX
	 ANotyXely8z43TiQa/2KsKCM+WFCe5FmddR+s4KBgXyoFcOlcbibWE7Sesi+nGQmfJ
	 Xi5AgkYnE3dMCXhLtgFoGrxAxUpxDEdrjVHKO5EozZQElyHTOiuaHtoR2rnC2Awhb2
	 3iUT5XWoVmFX/8r0Wd0SwcbURmxCifxlF6ShGBaZJ+4Bk3XDNY67urdthY7dbYlbtG
	 Wh9KbUng/x5FDdGasZ2xWiHx8QYU8n/PCRelaKk1AIq73DiOKXoM648p9xZJ8tuONb
	 I6x8JGKRP1UIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: x1: disable ps883x USB4
 capability
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jens Glathe" <jens.glathe@oldschoolsolutions.biz>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260718-ps883x-disable-usb4-v1-5-cec86d0b909e@oldschoolsolutions.biz>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-5-cec86d0b909e@oldschoolsolutions.biz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 17:22:37 +0000
Message-Id: <20260718172238.3EE011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `parade,disable-usb4` property encodes a transient software wo=
rkaround into the Device Tree and breaks non-fallback docks by intentionall=
y failing retimer configuration.
--

--- Patch [5]: [PATCH 5/5] arm64: dts: qcom: x1: disable ps883x USB4 capabi=
lity ---
commit c967f56ff3b6574dc86834616a0288179a8a0cd3
Author: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

arm64: dts: qcom: x1: disable ps883x USB4 capability

Add the "parade,disable-usb4" property to the PS883x node so that the
retimer driver treats USB4 as USB3. This allows the combo PHY to remain
in a DP-capable mode, restoring working DisplayPort output over the
dock while keeping USB functional.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi =
b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 5d49df41be02a..c8bfb38c64ad5 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -895,6 +895,8 @@ typec-mux@8 {
>  		orientation-switch;
>  		retimer-switch;
> =20
> +		parade,disable-usb4;

[Severity: High]
The commit message mentions this is a temporary platform workaround for mis=
sing
software support. Does this encode a transient OS driver limitation into the
device tree?

Device trees typically describe fixed hardware capabilities. Will adding th=
is
property permanently mask the hardware's actual capabilities and cause issu=
es=20
for future OS updates once proper USB4 DP tunneling is available?

Also, looking at how the retimer driver handles this property:

drivers/usb/typec/mux/ps883x.c:ps883x_set() {
    ...
    case TYPEC_MODE_USB4:
        if (retimer->disable_usb4) {
            dev_info(&retimer->client->dev,
                     "USB4 disabled via DT property, rejecting USB4 mode\n"=
);
            return -EOPNOTSUPP;
        }
    ...
}

By returning -EOPNOTSUPP, this intentionally skips retimer configuration and
leaves the physical link broken. While some docks might detect the broken
link, time out, and fall back to DP Alt Mode + USB3, what happens with docks
that don't implement this fallback behavior?=20

Could this approach result in completely broken USB and DisplayPort
functionality on non-fallback docks when the PMIC autonomously negotiates
USB4?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718-ps883x-dis=
able-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz?part=3D5
