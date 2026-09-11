Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66CB3C1F41
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119605; cv=none; b=MClDoEWtPnNT5gdyFsj/ZOdmuq5RHQXPum6yKBFsCoBnIwJEhd+crm3UWc2/LxkYOzc3z/r9wUsckGBzDwBf9T7UsNFuf6P0xJWT29DHGr57SyFd2+j43H1R8i6nt4C5awFunHAy6bZ6kF+zp5skapchf7NqbTAOO4RQj04Azl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119605; c=relaxed/simple;
	bh=ae5BuzsAAFz1BZdRU0zhyS7agpnvRhJq2uSZE+kMC0k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TLtVpzb+cwLTiZ7oMHULKWmvy5Ee9Sqh4fwoWu+mtCRW/Pmqc78a8Ak9NL+fjkez+BhAC5sHUjrHVpH2df/LaqcfMIGGa0mBirlo3weHnz1wOh3m9IWFdpcwjHfsj1si+vPpKUzFmV6MvQv9sG9Hk4bt6ocQtgYKF1PrMXMiiv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oe9hoj4t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oe9hoj4t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987DD1F00893;
	Fri, 11 Sep 2026 09:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789119602;
	bh=AEjIqpC44Qwa9WNEbDI1YGjvIvuFfGBO/K/4TMhcqAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oe9hoj4tlmLlcXBxP4HV9pO3RN6yVPXj+4fD2iVVVJz8HZ7uRGOqxz+b22P8mJdsW
	 XqgHvci4Q+qmb+LbX3BmrcfTIpRWpjaQtLj2F9FL2S73Dh1DxMA7V6thg4PIsAyngG
	 NFFIWcT3jcOo88DyBvvaKyKslXMFzE10CQy3go0CVA4IBwXb/NoBPK6jDBjl4SiSsl
	 jZgHl6S5cA2zQxswuqk+Js5+DnLhezgPRgj8Uv4Wz71Zqi/MU/i6Qh/+z1vseSg/Ho
	 aEPbTjPsbW0p+s2TzOY+LA9+XskIpa/rFzJbr+P77SvDXiejI/Up1N2TH+Wxe89Nae
	 s2QYeO5ZPck+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/10] ASoC: qcom: Switch lpass-cpu and qaif-cpu to
 snd_soc_of_xlate_dai_name()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260911-b4-qaif-shikra-audio-v6-6-e9addb358201@oss.qualcomm.com>
References: <20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com>
 <20260911-b4-qaif-shikra-audio-v6-6-e9addb358201@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 09:40:02 +0000
Message-Id: <20260911094002.987DD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds write to mi2s_playback_sd_mode and mi2s_capture_sd_m=
ode arrays due to missing bounds check on id.
--

commit 917cc500969311cb7669274beb9677b12b3a9990
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Switch lpass-cpu and qaif-cpu to snd_soc_of_xlate_dai_name()

Use the new generic snd_soc_of_xlate_dai_name() helper in lpass-cpu.c
and qaif-cpu.c, and remove the local lpass implementation.

> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 242bc16da36da..61efa45376cd8 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c

[ ... ]

While reviewing this, I noticed a pre-existing issue in this file:

sound/soc/qcom/lpass-cpu.c:of_lpass_cpu_parse_dai_data() {
    ...
		ret =3D of_property_read_u32(node, "reg", &id);
		if (ret || id < 0) {
			dev_err(dev, "valid dai id not found: %d\n", ret);
			continue;
		}
		if (id =3D=3D LPASS_DP_RX) {
			data->hdmi_port_enable =3D 1;
		} else if (is_cdc_dma_port(id)) {
			data->codec_dma_enable =3D 1;
		} else {
			data->mi2s_playback_sd_mode[id] =3D
				of_lpass_cpu_parse_sd_lines(dev, node,
							    "qcom,playback-sd-lines");
			data->mi2s_capture_sd_mode[id] =3D
				of_lpass_cpu_parse_sd_lines(dev, node,
						    "qcom,capture-sd-lines");

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for this code
to overflow mi2s_playback_sd_mode[] and mi2s_capture_sd_mode[]?

The id variable is read from the reg property of child device tree nodes.
If id is not LPASS_DP_RX and not a CDC DMA port, it is directly used as an
index into the arrays.

There doesn't seem to be a bounds check to ensure id is less than
LPASS_MAX_MI2S_PORTS before the array accesses.

Could this lead to memory corruption if a malformed or malicious device tree
specifies a large reg value?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-b4-qaif-sh=
ikra-audio-v6-0-e9addb358201@oss.qualcomm.com?part=3D6
