Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAC6387362
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658389; cv=none; b=l8vREdTODIm+K3rc3zNVzyyjr+IDqbxw4JE+AVnx88MCd/QH5ZkFGQg266J/er+PHxR5H1dQc/psWrLeC7GrkUEBgZ7ZDXQHn09BGFHUxeOv0L98VotZx7OTmAlsaDIc6xmTO09ynpnakuCkmcuWU5MDghWTXbHTZyRyd/iXCOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658389; c=relaxed/simple;
	bh=vGjsyji+oeQA0tfmrJ2Qqg3Y6tIhKmA/0EAeaf2hnOE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ls8ijBZ9WCDe3VbP3W8Am3+Bmn350UT+/OHkVUl65DpOrDHP7dNaUxFgb5uwMZwm2f/klS9E2hfgXzdbS6ZmVqxHGNCCHlLdBdrpDTjaJQ6yPhNLzuCBkkWwSkDwR6FRSoZKmedDNoK+rIRKz3zN0+kw0Yqd3v+LI2fIFgKCBQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdN16Udr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdN16Udr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0881F00A3A;
	Tue, 21 Jul 2026 18:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784658387;
	bh=l0LNGOqddo4JENiuh2LcL3xPsC1o19AIrjNYiONQmu0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MdN16UdrKjFvTsSn07vz1/v/I2ySk+Nv2MhDD7aGYk2e6svA7b4siWQMH8jOXO5iK
	 fFa0aOIdeLPBMMI1/xpU8Dkdbul2GvevTd8T7VJBsq/fGXa/ytFJz6V9yp3IJCZxex
	 BeTX7pqXuq0nMAAq5sb+gTktJyEDzqfMEXE+AY2sDEaqpI3sVocVF+1kl+CyBe5YPV
	 ZH/vLNiRuOt1PXUZhDYZvb02mu3JImuHuWv2tPJhIA1jM3eUCRO2C+4GuCSfThta2T
	 d9hrwt9bUBwzuan5GUIyrUp0MiRRcA5Irj2Gvqv//qf3rJBL/hW3a0aF+WzyAtuCSs
	 uii05FLF4B+Dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: sound: remove google,storm-audio
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-drop-sound-storm-v1-2-23ae4a689ffe@oss.qualcomm.com>
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-2-23ae4a689ffe@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 18:26:26 +0000
Message-Id: <20260721182626.DC0881F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete cleanup leaves the IPQ806x LPASS driver as unreachabl=
e dead code.
--

--- Patch [2]: [PATCH 2/2] dt-bindings: sound: remove google,storm-audio bi=
nding ---
commit 4f1f4fbba8c2f852f688a4151731bed0fe4a61f1
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

dt-bindings: sound: remove google,storm-audio binding

This commit removes the device tree binding for the "google,storm-audio"
sound complex. The removal is done because the accompanying ipq806x Storm
machine driver is no longer present.

> With the ipq806x Storm machine driver gone, the accompanying device tree
> binding describing the "google,storm-audio" sound complex is no longer
> used by any driver or device tree. Remove it.

[Severity: Medium]
Since the ipq806x Storm machine driver is gone, does this leave the
IPQ806x LPASS driver as unreachable dead code?

Looking at sound/soc/qcom/Kconfig, SND_SOC_LPASS_IPQ806X is a hidden
Kconfig symbol:

config SND_SOC_LPASS_IPQ806X
	tristate
	select SND_SOC_LPASS_CPU
	select SND_SOC_LPASS_PLATFORM

If the machine driver was the only config that selected it, this symbol can
no longer be enabled. This would mean the compilation target in
sound/soc/qcom/Makefile can no longer be reached:

obj-$(CONFIG_SND_SOC_LPASS_IPQ806X) +=3D snd-soc-lpass-ipq806x.o

Should this incomplete cleanup be addressed by removing the orphaned config
and driver file as well?

> diff --git a/Documentation/devicetree/bindings/sound/storm.txt b/Document=
ation/devicetree/bindings/sound/storm.txt
> deleted file mode 100644
> index 062a4c185fa9d..0000000000000
> --- a/Documentation/devicetree/bindings/sound/storm.txt
> +++ /dev/null
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-drop-sound=
-storm-v1-0-23ae4a689ffe@oss.qualcomm.com?part=3D2
