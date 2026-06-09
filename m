Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC72C379C32
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995560; cv=none; b=Qt0doB8qW64PpVgZRae4vMY1OqdHEPl8qXj7XoUo07VWuBnHMs0hQ6kKKCExR/eF3tzrarPY6hb1iSMZGE7larYHrmUMOulZb7LyjHnbrxz+n3e1OVXyZmxKYkfMlTOSbYY+cV6QcC7jb6cwXHy32sRTMqCA39gfATHiojEVapA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995560; c=relaxed/simple;
	bh=SXqOtp0Hke+1ltFED2/7PP4Aq9msWVeNKkXwHRYi7jk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i8Vn0qTMVCFBmuPnD3bLpKikHENuEkT+81gMSq21OOVbut1xyLUUxpMfFOU3qxp9ddnxVKJfyoQFhOKDO8rcNycAa8zBVDdhR3Z8gbzeXelZl8mt9os+5ZQ7Q4LGaLnDVBoe0Z5nXuMkksh/4Ovny6wvv9Jz9BfXaZCse3FBVYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pm2GpMn8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pm2GpMn8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181FC1F00893;
	Tue,  9 Jun 2026 08:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780995559;
	bh=XBo5uOK6bn1RDRE6I9gT5veCYc5jhJMzJC2fWp1NMLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pm2GpMn8rPA1VpZW1Cq3p6MqnX6PQTCL7CgkgLVX+S+0hDyOteelhcr2Hz9qBiQFT
	 2nOVrQVoOGNKANivjXEm8Vqhl6xeOwU+nRWLr3/dCVT0HEOHDrABeMjVSOS248Af0W
	 g5wx4mAWR2yWWRtixnouHKV8TeTx9oLPazU6YuUwd+VX06JWke6VSZ1bKKEwfFKULh
	 Ygkq0jEumPo4+v6ToAqRtDFuaxISiALnwTA8Z4acaf93AEhr1v9WUl5TVXY+tYRgQ0
	 moJkhEdQ9D6eto75sGgv0NhV8sUINhn+N4Cqzy2vz93yLcuUPsod7J3RXxupu/YUEl
	 51KnyCGTc4/xA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] ASoC: qcom: qdsp6: generalize GPR service domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ajay Kumar Nandam" <ajay.nandam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609064038.492641-4-ajay.nandam@oss.qualcomm.com>
References: <20260609064038.492641-4-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 08:59:18 +0000
Message-Id: <20260609085919.181FC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch adds a new `dest_domain` parameter to allocation helpers =
but fails to update all caller sites, causing 'too few arguments to functio=
n' compilation errors.
--

commit 7837af8c42df151e433f6c30da08674cc4716b78
Author: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

ASoC: qcom: qdsp6: generalize GPR service domain

This commit updates the AudioReach allocation helpers to accept an
explicit dest_domain parameter. It also updates various callers to pass
the appropriate destination domain ID.

> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/aud=
ioreach.h
> index 62a2fd79bbcb9..d07fcd3a8fa73 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.h
> +++ b/sound/soc/qcom/qdsp6/audioreach.h
[ ... ]
> -void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32=
_t
> -				    token);
> +void *audioreach_alloc_apm_cmd_pkt(int pkt_size, u32 opcode, u32 token,
> +				   u16 dest_domain);
>  void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels=
);
> -void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
> -			       uint32_t token, uint32_t src_port,
> -			       uint32_t dest_port);
> -void *audioreach_alloc_apm_pkt(int pkt_size, uint32_t opcode, uint32_t t=
oken,
> -				uint32_t src_port);
> -void *audioreach_alloc_pkt(int payload_size, uint32_t opcode,
> -			   uint32_t token, uint32_t src_port,
> -			   uint32_t dest_port);
> +void *audioreach_alloc_cmd_pkt(int payload_size, u32 opcode, u32 token,
> +			       u32 src_port, u32 dest_port, u16 dest_domain);

[Severity: Low]
Were some callers missed when updating these function signatures?

The new dest_domain parameter is required, but it appears some existing
callers in sound/soc/qcom/qdsp6/audioreach.c were not updated and are
still using the old signatures.

For example, in audioreach_shmem_register_event():

    pkt =3D audioreach_alloc_cmd_pkt(payload_size,
                                   APM_CMD_REGISTER_MODULE_EVENTS, 0,
                                   graph->port->id, graph->shm_iid);

And in audioreach_setup_push_pull():

    pkt =3D audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);

Does this cause compilation errors due to too few arguments being passed
to these helpers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609064038.4926=
41-1-ajay.nandam@oss.qualcomm.com?part=3D3
