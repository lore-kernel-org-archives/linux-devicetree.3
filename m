Received: from knowth.nicko.org (knowth.nicko.org [52.215.230.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DB8342C9E;
	Mon,  3 Aug 2026 16:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.215.230.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785774004; cv=none; b=P2g/4ECWb/NlzDlzfy5OnaDXTUh9Dqb+zgEWkAATORt3Fo4cuxo0tvCMaiCuQu5uZ8d59opcKNcXJ2ni/a6KI3JJ/I2f9q+1sNfaHt1mGigUB/yL6tv3T1/7m+nKVYYqUoabTwa/tTBmzoVqIOII6bsLuZlgz0t0g/7dBCnPs1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785774004; c=relaxed/simple;
	bh=hgQVAdeDVrCIN+Z49ylLdyA0idWgHfnnwAtWKGNF2DI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=RtJ5hj1+yNMLRqboQR0i2pGdmPflnzr0SyABNahwA5EGfqsmGmkQis1Ir94tUFmCn2sY0uB9o4uHZ1JIZjPtMpKgajoTHxGqSbqT19Y4CrD0bQ7jqn+oBwhVbLCid0rjQ/glqka0ksnaxUPB0O/aQyiKaeqaeHg7+H+xbIm1IM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nicko.org; spf=pass smtp.mailfrom=nicko.org; dkim=pass (2048-bit key) header.d=nicko.org header.i=@nicko.org header.b=vXDuQWrv; arc=none smtp.client-ip=52.215.230.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nicko.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nicko.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nicko.org header.i=@nicko.org header.b="vXDuQWrv"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nicko.org; s=dkim;
	t=1785773988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UhueohGQclX/GRBPF3HMrvfjnxB2F8qyYo8Y31LUtcY=;
	b=vXDuQWrvopki68Ybcda6x84boN1CkcFqGLvI6W6PE9ZEtUA+xRLU4oozEIQVT5vf2Ej610
	ah5Ee3dbgAzzHoeWxJrXSMwk8L+89zltEYx+FJ1fGEphEbwD6sHMMW/33MfKQs/F6afiIM
	foEdpzkWUvJtXVK5LyN8HKuut1GZKsRXdPCeZZrmcUqhpOJqzR7IiyswG8g8L73w55CmAs
	qTOav/7yBNzMoLaV5YdWnzn5zcjF5F27F6Ej5G/KeJ66fTRx4ltRQAxnIbH6qBOqY+J93y
	BUmL2F41zlKYCddvYxei8KaaA2qhl2n+WQ7fX1Tw/n507l8la3yS5jX+6MsoqA==
Authentication-Results: knowth.nicko.org;
	auth=pass smtp.mailfrom=nicko@nicko.org
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A14
 (UX3407NA)
From: Nicko van Someren <nicko@nicko.org>
In-Reply-To: <20260623-zenbook-dts-v1-2-3f80f680381d@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 10:19:33 -0600
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1D8BC06E-7D8C-4BD6-ADF2-A4CC1BD24B93@nicko.org>
References: <20260623-zenbook-dts-v1-0-3f80f680381d@oss.qualcomm.com>
 <20260623-zenbook-dts-v1-2-3f80f680381d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
X-Spamd-Bar: -

On Jun 22, 2026, at 19:31, Bjorn Andersson <andersson@kernel.org> wrote:

> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>=20
> UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
> Glymur platform. It comes with an 18-core X2 Elite SoC, 32GB DDR, and
> the other typical Glymur platform capabilities.

Firstly, many thanks for this. I recently acquired one of these machines
for some firmware work I'm doing and having a working Linux system on it
makes my life much easier!

I tested this patch set, along with the others it depends on. I have it
mostly working now but ran into some issues that might indicate a few
changes.

WIFI:

> + wifi@0 {
> + compatible =3D "pci17cb,1107";
> ...
> + };

ASUS don't specify what WiFi7 chip they use, which is fairly normal =
since
ASUS tends to swap the parts depending on supply. As a result, my =
machine
has a QCC2072 (17cb:1112) WiFi/BT module not the WCN7850 (17cb:1107) =
device
that you listed. Inspection of the hardware shows that the WiFi/BT =
module
is a solder-down M.2 LGA module, but electrically that's still an M.2
interface. Photos that I can find of the Zenbook A16 show it does the =
same.
I think it might be more reliable to define a wlan-connector, like =
Konrad
Dybcio did in the Asus Zenbook A16 (UX3607OA) (2/3) from 2026-07-21,
rather than specify the chip.


SOUND:

Regarding sound definitions, the dts declares four WSA8845s -- a woofer
and tweeter per side, two on swr0 and two on swr3.=20

> +&swr0 {
> + status =3D "okay";
> +
> + /* WSA8845, left woofer */
> ...
> +
> + /* WSA8845, left tweeter */
> ...
> +};
> +
> +&swr3 {
> + status =3D "okay";
> ...
> + /* WSA8845, right woofer */
> ...
> +
> + /* WSA8845, right tweeter */
> ...
> +};

This machine only has two speakers (again confirmed by physical =
inspection).
Only swr0 shows attached on /sys/bus/soundwire/devices/sdw:*/status:

  sdw:1:0:0217:0204:00:0   Attached
  sdw:1:0:0217:0204:00:1   Attached
  sdw:4:0:0217:0204:00:0   UNATTACHED
  sdw:4:0:0217:0204:00:1   UNATTACHED

I don't think that's a config fault either; the swr0 and swr3 reset =
lines are
both claimed and in identical state of (out, 0, 2mA, no pull). It's not =
really
a surprise that the cheaper model from ASUS would not use the full spec =
audio
offered on the Qualcomm reference designs, but without a suitable
UX3407NA-tplg.bin topology file I can't really tell more.

It appears that the audio setup is blocked further up the audio stack =
anyway.
I hacked some dts changes, purloined blobs from Windows and got a stereo =
speaker
setup configured. SoundWire is healthy, but no audio is possible because =
the DSP
does not respond. The ADSP boots and the audio PD is reported up:

  remoteproc remoteproc1: remote processor adsp is now up
  PDR: Indication received from msm/adsp/audio_pd, state: 0x1fffffff
  qcom,apr ...: Adding APR/GPR dev: gprsvc:service:2:1

then, on every boot:

  qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode

I'm curious as to if you tested this (or if this even known to work on =
the
Zenbook A16, Yoga Slim 7x or EliteBook X G2q with the other =
submissions). Do
you know if/when the required firmware blobs will be forthcoming and
upstreamed?


HDMI:

The built-in HDMI cannot read EDID: the connector reports "connected" =
with
a monitor attached but the EDID is 0 bytes and there are no modes. Less =
than
2 seconds into every boot, before any cable is involved:

  gcc_usb3_tert_phy_com_aux_clk status stuck at 'off'
  Failed to enable clk 'com_aux': -16
  phy phy-88e1000.phy.5: phy init failed --> -16

I have not really investigated this in detail.


eDP:

eDP link training intermittently times out on resume, leaving visible =
flicker
until another suspend/resume retrains it:

  [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #2 on phy 0 =
failed. ret=3D-110

I am carrying the (unmerged) "phy: qcom: edp: update v8 power-on
programming sequence" series, so this may be feedback for that rather =
than
a report against mainline.


Anyway, thank you again for this patch series. It got me to the point of
having a very usable machine for my limited needs. If you have updates =
the
need testing I'm happy to help.

Nicko


