Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794656562;
	b=nyh/QyZbDC+QFrCJYP+ajM8VOG/gCh5v3dgAHjSoUKL4cNglKbW/KAqJG1mQVfIP9bda
	 AMW1m56XwslcmEMNutFZHriHRnEzSrwSkXNbyMH8C1O3hTOnWbCpkkT/d1nvtOaOF+Oxw
	 O4/1+hCDFzJZDca1Z16dXfrBiKUzKbR3Or8lJSDxznYm4RcYVvVfUiN360wQlc8ccqNxk
	 6qLaE/D5+xb6cczXoNLkcuTECjllIMh+9ePr5XHT0GQ344VBAv2XXv77JkewHEZ0DrMPp
	 x7pS/p6g+mKx6cAuXs1k0cfUtlBcUJUgEnF6UAK8g8wyVJ5JeT2q2etgPpP0beorjHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794656562;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OMtMYcishGO0ZdBger2v9Kb8tRhLZJGFMblJXKQt7s8=;
	b=Fivso62XwpHKvuaSxOThoDIsv5fa5zzp63w/uF0QIvB9QiomkeB++LtGrIksNDbd8lde
	 Q6UavIaBPZoUQgvxciH/W1xiGNi2vGO3YcnggNvzSC0DDEoM1UFlYfKHR0MgoqBOqRpDu
	 he49fJN6hxs7itVRwwvMf1Dpt6mRZnyzQToVPBI9kapkVk2y9imVxC0WUgH+Ej0ofsu5t
	 MJD3GO7oGBjMvuGign836dVBt/5ufuk/lSatuzKcAzoUoBY55IF6JP1CIMuihLv834O8Z
	 WOej7p8xh6Z/emqbrRiwGYIiS7L/BLg6F9VQpaDiQscfAeg5ATW+znYFKAu6xAV0SUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k24Cy0Fr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1289606A327
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k24Cy0Fr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72B11F000C5;
	Sat, 14 Nov 2026 11:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794656562;
	bh=OMtMYcishGO0ZdBger2v9Kb8tRhLZJGFMblJXKQt7s8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k24Cy0FrPUogjHv43Mv5nO/4Ju+kgvQ+iuA9cDPgblJzvpGToR8CBPaFwCGSw2bnP
	 CJqgFdVB/SVDQk+4TRevsx9P/EAVxDVeohgiXYo2TtU9HBNTOWfTZ6bQl3QXk7kJbO
	 5fLSdX0kGfVBmsrYxPRPF6DnRjNuVOaYdS/BrSJ8+SiHlTcaGUPPMB0BYHz+c1e/LD
	 xIN2jmx0//2h0t4xB+zI/wntxfJ7xEVh3jXoNbbcyGajepRLiw/Dgxfx2/8vdpwBz4
	 qOQCE5gZVMATCFg6ICPIEOo1vS+wAhtUtYBq7nc/LtKRZ3hMSffY5be+OTZZWWMGMz
	 cvq9r2sO4A70g==
Message-ID: <sashiko-outbox-214425@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 11/23] media: qcom: camss: vfe: Add support for VFE
 980
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-11-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-11-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 11:42:41 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] media: qcom: camss: camss-vfe-980.c duplicates camss-vfe-1080.c
--

commit 29195d9029785533829d246888a075efe92d772a
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: vfe: Add support for VFE 980

This commit adds hardware operations and SM8750 subdevice resource definiti=
ons
for VFE 980.

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-980.c b/drivers/=
media/platform/qcom/camss/camss-vfe-980.c
> new file mode 100644
> index 0000000000000..47f6c18190acf
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-980.c
> @@ -0,0 +1,213 @@
[ ... ]
> +/* VFE-980 Bus Register Base Addresses */
> +#define BUS_REG_BASE				(vfe_is_lite(vfe) ? 0x200 : 0x800)

[Severity: Low]
Could VFE 980 share the implementation in camss-vfe-1080.c instead of
duplicating the entire file?

Every register offset, client index, and callback in camss-vfe-980.c is
identical to camss-vfe-1080.c except for BUS_REG_BASE, which could be
selected based on vfe->camss->res->version (similar to camss-vfe-gen3.c).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-add-suppor=
t-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com?part=3D11
