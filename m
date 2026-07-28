Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7813C585C
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227966; cv=none; b=TZNHbQOlO0pZUfCzggbHEHZXpngjdMhFU6bMhFkj+oVO8oRTnjJC/mwgEBB1uZ0HyNBGw5LH8Wg5afFdmb27EbBHagUPKFYOKctx2wmECH/F6gsFZFl2ukup2EzA/xagvl0hNOVkzNva2r0O3k5BkWKSHNNhjJsDcrecSxZ1X8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227966; c=relaxed/simple;
	bh=Gy9E59E6a5WXeykg4cDOxRzrDdWqBRyfN8EJUL97rgU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SH6rKzWLzEDLgYMzA1Ou7I2XrHPoLi09onfsdfnJHaZWGMK+tLnQHeHtaqAvoh6Ml+Ggnq3seChuVLkHENyYjWaJAtI1GfM9W545nudK9h4EQNc8FTnEzajF8TUlzcuhRh3luSgo7VLB6DKonqwBrdR6jFDwnb3JyU78avvbcD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8EEMWmO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8EEMWmO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01971F000E9;
	Tue, 28 Jul 2026 08:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785227965;
	bh=IIj5iwju7kEksBT0DEyho7vdToPuJwzd5sYO6x/weto=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E8EEMWmOJwNaf2h40XwQflzp9lekdnj3Qv75LGBhFEpZwb+iXX67Xw+RhV7lw975K
	 IvZz2Ll+RAvPAJxbQoLAKAsN0791ZJV7n2mBPN1JPXa4L643QwLGKxqWkV/vqgeT5p
	 GGkOrQClkHkq+9AA9iJvyogZq1Ci6t1N8VIHRBaVpQ8EokddjdP4QuYkgzo+z1fS7P
	 vZ9j3uQdbclEOqpsylU0/3erfrcXkuGAUrTdyg1YgQPn94UNtm57AxrMuxj4ga485b
	 /6UfXzmyOL622Eq3XImxKT6RYlMz571FYYnOynghCC53EjLFm62MVVcxOjuTxUEEop
	 ueK45d2nzks7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728082548.2511694-4-atanas.filipov@oss.qualcomm.com>
References: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
 <20260728082548.2511694-4-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 08:39:24 +0000
Message-Id: <20260728083924.B01971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Race condition in stream teardown can disable interrupts for activ=
e streams and cause hardware deadlocks.
--

--- Patch [3]: [PATCH v5 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder no=
de ---
commit 37f9191db4e80eea5cca3dd9978def555946b6b5
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

arm64: dts: qcom: sm8250: Add JPEG encoder node

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/q=
com/sm8250.dtsi
> index 7076720413ab2..98935f3fcd05a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
[ ... ]
> @@ -4469,6 +4470,79 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
> =20
> +		jpeg-encoder@ac53000 {

[Severity: High]
Does enabling this device expose a race condition in the driver's stream
teardown sequence?

Looking at bop_jpeg_vb2_stop_streaming() in
drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c, the lock is dropped
before calling hw_release():

	mutex_unlock(&jenc->dev_mutex);

	/*
	 * hw_release() calls jpeg_deinit() which issues HW_STOP and waits for
	 * the STOP_ACK interrupt completion.  It must be called outside
	 * dev_mutex to avoid a deadlock: the threaded IRQ handler acquires
	 * dev_mutex before signalling the completion.
	 */
	if (do_release)
		hw->hw_release(ectx, q);

Since dev_mutex is explicitly dropped here, could a concurrent stream
acquisition via start_streaming() acquire dev_mutex and see the lockless
ref_count transition from 0 to 1, thus initializing the hardware and
enabling the IRQ?

If the preempted stop_streaming() path then resumes and executes
op_jpeg_release() in drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c:

	ref =3D atomic_dec_if_positive(&jenc->ref_count);
	if (ref < 0) {
		WARN_ON_ONCE(1);
		return 0;
	}

	if (!ref) {
		rc =3D jpeg_deinit(jenc);
		// ...
		disable_irq(jenc->irq);

could this destroy the hardware state and disable interrupts for the newly
active stream, potentially leading to deadlocks or panics from unclocked
register access?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728082548.2511=
694-1-atanas.filipov@oss.qualcomm.com?part=3D3
