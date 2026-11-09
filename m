Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248370;
	b=tXNDrqkvqt7ORfqtbu5NbDt5tIdX/NeTMEvQfnJ/lzDlAa4yyFcQWmERtbq4Ga1qipix
	 a4KJnh8eninbu0VJxuSIiYq5JyroIwAkSoAeB2DqUq97Yrp5Lc6gxzqs9C/e4YYIKKuud
	 zBD2Z3DoOIGT/0O/g4DxxD1HtFcM5v1j+nNa46exTpF/Uh+Oc/87GYVjAjpumoal1bha6
	 nEPPqnUR979R+W4o2ucCinA+qPxlSBvCzOcGLfleS88wvX8w2BEdJqoG2iCb6049ikhdh
	 a77PK6EECeat21m1qXgRb1r0wc00/IxIuWqlW4254zVQyQFPOn8sHebhRpkecHFlBPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248370;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ry12+632i+pnlYRMK98Gb1RQCRWpUlngn+K/HEV8/9s=;
	b=KkyyT5WMVoAxlpe75XIESc+TUS2Up2vzD6MSVUqhHv+c0+21jVMugx/Ov3ThEJBkQUgc
	 rRIg4SJ//wslabwijcFadodbmHJwSgbYP50rqk0rqEqxnJxrf3Yu++MDam8q3Kw56YmRg
	 O8++LKpNxQmh8kKQLFw9ieierL/t6XfQ+rNI8XXjcAL62gz5KHiek/iWxDYGeRczjJxbk
	 aG1Ga1udQ3i38SFGfrRwN1laAlXmErn9ZHIW8cXeMOk5fcnorJldI4wtStDzWsL2GlrnX
	 o1KpdTAqHRtcLMvCG0Ym66sckiBJJ0OIhRO1RaILkDYYk7NxAG7AVdUuQz66ixEs7oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=knfHj+un;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F390606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 18:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=knfHj+un
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 123F21F0089F;
	Mon,  9 Nov 2026 18:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794248370;
	bh=Ry12+632i+pnlYRMK98Gb1RQCRWpUlngn+K/HEV8/9s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=knfHj+unQVCqbQ/j+doap7pk1iZybjRxJoP0skD8CLfSFp26O/xrnbT6Cy7inOxNh
	 +nUWWCmi2E1PzFoBia0ekmsP7d+AjjXEDoGOze4llyRU+ab3mrfY1XM62TJcI84p++
	 4iRTm1pNWQnsBe5xh4cbOOtYZ/VsfeYgG7FxzkjlfzIikNwbWh8nhpJbbC/uRCEfDn
	 cC77LSHDG1YjaVeJlsZpW7nG3hOZGFVpFlR69WM0erNUJxG2KkfuKTyIDjEsvWZLab
	 UW/1unE8gXo/W07Tv7MhIps6Jd5GVtFbpfgW21XsBw0adjtxV8bb3Xkt115d1BZORa
	 L+jWAZse73p1A==
Message-ID: <sashiko-outbox-205397@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: ti: k3-am67a-beagley-ai: Add
 orientation to IMX219 sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thorsten Lannynd" <t-lannynd@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109180859.4139929-1-t-lannynd@ti.com>
References: <20261109180859.4139929-1-t-lannynd@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 18:19:29 +0000
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
- [Low] arm64: dts: ti: missing Fixes trailers for BeagleY-AI IMX219
  overlays
--

commit b82931b5cae82dbfddb19d7077db1533a5aa02a0
Author: Thorsten Lannynd <t-lannynd@ti.com>

> arm64: dts: ti: k3-am67a-beagley-ai: Add orientation to IMX219 sensors
>
> The IMX219 CSI2 expansion modules are externally attached. Without the
> orientation property, V4L2_CID_CAMERA_ORIENTATION (0x009a0922) is not
> exposed and libcamera fails with:
>
>   ERROR CameraSensor camera_sensor_raw.cpp:465 'imx219 4-0010':
>   Mandatory V4L2 control 0x009a0922 not available
>
> Set orientation =3D <MEDIA_ORIENTATION_EXTERNAL> on both CSI0 and CSI1
> sensor nodes to fix this.
>
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>

[Severity: Low]
Since this fixes the IMX219 camera overlays failing in libcamera due to the
missing orientation property, should it include the following Fixes tags?

  Fixes: e0c1c2492be4 ("arm64: dts: ti: k3-am67a-beagley-ai: Add overlay fo=
r IMX219 on CSI0")
  Fixes: bb58f1c72c5c ("arm64: dts: ti: k3-am67a-beagley-ai: Add overlay fo=
r IMX219 on CSI1")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109180859.4139=
929-1-t-lannynd@ti.com?part=3D1
