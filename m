Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65F83E0C56
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281351; cv=none; b=q8iWt9ayQIMhz8txG5KeKXh1dSqpEeDyeeTxynaJhBJI6W1xqcThl24pAsMkcSa2O0BH/FKLswU1GYPujtWmfpl7XCSeCc7JXUG1VX6KQYPROnWNVOZTuuvztVqZjU9tx76/Prsu67vS6kuoS7jyUKof/ADTW4cIbiGQt9Nq3Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281351; c=relaxed/simple;
	bh=imXsQHfII3CyFC9BRgYZULNKjp9cltc8z+/6hVLXedk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rmnpe+Dn+EfapPbEeFEMwjewa9L6j77j/2wEkTTkAtfKD6TnJoi7qQXXSpY08cZ+yxiFpgnd/cBMuxo+yrvr8euhhkPzn7a1BpDjbi5jk64L0EIukmSbsgnNAIKVbeHoiQoNdDFsFGtaIwvSGuVV0T8v2KOboLWzHGCFxO28FYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBsM7bB7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBsM7bB7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9E01F00893;
	Wed, 20 May 2026 12:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779281350;
	bh=imXsQHfII3CyFC9BRgYZULNKjp9cltc8z+/6hVLXedk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FBsM7bB7igDOaeslbXhhFUV3cOEgcXnMKUS3c0/+9V/4Y6L/rw/bV/+rY2B+y8Yl1
	 86UIVX+GHO2zgL+4uyX1mzC1shxuxNqvNlBsMk19iaOyEepMCAL2A1u6NJagaFc4fw
	 CrV5jXYUTfHTmTGVb7Zt9yb0VKsmyYuOvNaaz32396KcQWACe2EKDUcI9hi136vD1I
	 sJeOoElq879OHvBazzK2WBigckiH/N96+T4ZkJqWwasNfQU5V2TeXlfsxz2grUKfVq
	 8wLRiju9+mxZL2G+JBJzUju6mltc8VUGBdCP/3ZVeLJnY7dJClgM8fewnI0/0se1jo
	 TxDZ8RGsL1HDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 06/17] media: ti: j721e-csi2rx: add a subdev for the
 core device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260520120022.539913-7-r-donadkar@ti.com>
References: <20260520120022.539913-7-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 12:49:09 +0000
Message-Id: <20260520124910.3C9E01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Improper validation of `media_entity_remote_source_pad_unique()` r=
eturn value leads to ERR_PTR dereference.
- [High] Hardcoded pad indices prevent correct multi-stream routing and for=
mat propagation.
- [High] Missing gating logic for upstream `enable_streams` / `disable_stre=
ams` calls breaks stream multiplexing.
- [High] Subdev internal state is freed before unregistering the device nod=
e, creating a NULL pointer dereference window.
- [High] The `ti_csi2rx_link_validate` function drops the `active_state` lo=
ck before dereferencing the `format` pointer.

Pre-existing issues:
- [High] Stopping any individual stream globally resets the entire CSI2RX p=
ixel interface, disrupting all other active streams.
--

(Note: The standard inline diff formatting has been altered to a free-form =
summary due to recitation restrictions.)

commit 922486909238d39ba74212f5c85e1669aed42e1a
Author: Jai Luthra <jai.luthra@linux.dev>
media: ti: j721e-csi2rx: add a subdev for the core device

This commit adds a V4L2 subdevice for the core TI CSI2RX device to
facilitate multi-stream capture and updates the driver to use the
new enable_stream and disable_stream APIs.

[Severity: High]
Does the validation of media_entity_remote_source_pad_unique() correctly
handle error pointers? In ti_csi2rx_sd_enable_streams() and
ti_csi2rx_sd_disable_streams(), the code checks if the returned remote_pad
is NULL. Since this function returns an ERR_PTR on failure (like
ERR_PTR(-ENOLINK)), the !remote_pad check will evaluate to false, leading
to a potential kernel panic when dereferencing remote_pad->index. Should
this use IS_ERR() instead?

[Severity: High]
Can the hardcoded pad indices cause issues for multi-stream routing? The
subdevice operations in ti_csi2rx_sd_set_fmt() and
ti_csi2rx_start_streaming() use TI_CSI2RX_PAD_FIRST_SOURCE statically. When
subsequent contexts start streaming, won't operations mistakenly target the
first context's pad and break format propagation? (I noticed this is
addressed in a later patch in the series, commit e0451de187b4f "media: ti:
j721e-csi2rx: add multistream support").

[Severity: High]
Will the unconditional upstream stream control calls break stream
multiplexing? In ti_csi2rx_sd_enable_streams() and disable_streams(),
the upstream subdev is enabled or disabled using a hardcoded BIT_U64(0)
mask without checking if the source is already active. If multiple
contexts start, won't the V4L2 core reject the duplicate enable with
-EALREADY, and won't stopping one context abruptly starve all others?
(I see this is also addressed later in commit e0451de187b4f "media: ti:
j721e-csi2rx: add multistream support").

[Severity: High]
Is there a race condition during device removal in ti_csi2rx_cleanup_v4l2()?
The code calls v4l2_subdev_cleanup() before v4l2_device_unregister(). Since
cleanup frees the subdevice's active_state and sets it to NULL while the
device node is still accessible, could a concurrent userspace ioctl
(like VIDIOC_SUBDEV_S_FMT) cause a NULL pointer dereference when
v4l2_subdev_state_get_format() is called? Should device unregistration
happen first?

[Severity: High]
Could dropping the active_state lock too early cause torn reads? In
ti_csi2rx_link_validate(), the lock is released via v4l2_subdev_unlock_stat=
e()
immediately after fetching the format pointer, but before the format fields
are read and validated. If a concurrent VIDIOC_SUBDEV_S_FMT ioctl modifies
the state, might we validate against stale or partially updated data?
Should the fields be copied or validated while the lock is held?

[Severity: High]
This is a pre-existing issue, but does stopping a single stream globally
reset the entire CSI2RX pixel interface? In ti_csi2rx_stop_streaming(),
writing 0 to the SHIM_CNTL register clears SHIM_CNTL_PIX_RST. In a
multi-stream environment, wouldn't stopping one context forcefully reset the
hardware and disrupt all other currently active streams? (I note this is
fixed later in the series by commit e0451de187b4f "media: ti: j721e-csi2rx:
add multistream support").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520120022.5399=
13-1-r-donadkar@ti.com?part=3D6
