Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E7135201D
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465830; cv=none; b=XK6z3Ks6kL5Z40EuObrnAwFypBzLp7IysiE8TN8rG7EW6VgpnVHtXk6dy8f4u7BXN7BVxFVxtb5onTwSSlqmZrMZztcSvHANjEx8eZ30oPi4cxLidYb9314bFiiaGlXf7lpN3zMS/RVtHDSYXVoXDrZLDcpBPQxbOFO4T3N3wsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465830; c=relaxed/simple;
	bh=fPWHh3C3wvlOnS+3Q2sqQ31lDJUjaT0odDec8zlLkHY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kJPOos92FmG5C6y4Z2RXLBQBU5Pe3Jz/pdpEY0KYE3seS/jk4tamsAmCKTQn/r2xjyeLKLKmKIaSoud8Cy0dH2hdZblO7XQr93SvQ4JtBpBt4QXKXweOiK9bf1WV7v4M+GwFPzTSxGBSempdgyxzsgr+C9RSE/PmWn32odjr0Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0e+Z8/Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0e+Z8/Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB2DC1F000FF;
	Tue, 15 Sep 2026 09:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789465829;
	bh=BP66suQWBLv3gr9UaQk4naz+HG6qkYnDHs8xox2+NWk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U0e+Z8/Qe82O4ZAq1nKNJdUoCOGNbKVTPFz7CMXr86sKBqd8tF4kMvhlY92W1iCXY
	 CcVtJqurML9TKAmZm4X7p9UNN2EVJW06G2/qTAZN7YQ3jLreI114KHbhmDWy75BhV8
	 iKLo2s6Re7OiYXhZUDHYrBWYyHEIlaJYP7quSRrTwIpRK2Y7ahrvx1pWz/VaeNHbEG
	 2D+bmrXb7BhyUIHLdv4VSYQwl4pT3tTJz/B7kRyQ1mlnNB9rBVAHOifr8UAsXCnW2P
	 TE03fisZemMUUxkbs7bTvVXLQpqBosT4JJi2Nvnu9kGfiK5Of5xfQlIGDkSGfDH+M+
	 qR5GmbaB+VYOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] media: qcom: camss: csid: Add support for CSID 900
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260915-nord-v1-2-20db41a7f1ff@oss.qualcomm.com>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <20260915-nord-v1-2-20db41a7f1ff@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 09:50:28 +0000
Message-Id: <20260915095028.BB2DC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: qcom: camss: Data race on aup_update and rup_update masks
--

commit d62dff88807e9c3cde57315a677507f8c380eeee
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

media: qcom: camss: csid: Add support for CSID 900

Add a CSID driver for the "900" revision on the Nord SoC. It shares the
CSI-2 RX helpers and the split RUP/AUP command model of the gen3/980
lineage, but uses a single register map for both the full and lite
instances, so add a separate file rather than a variant of an existing
CSID.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-900.c b/drivers=
/media/platform/qcom/camss/camss-csid-900.c
> new file mode 100644
> index 0000000000000..921ddb7aca37f
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-900.c
[ ... ]
> +static void __csid_aup_update(struct csid_device *csid, int port_id)
> +{
> +	csid->aup_update |=3D CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->aup_update, csid->base + CSID_AUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_rup_update(struct csid_device *csid, int port_id)
> +{
> +	csid->rup_update |=3D CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->rup_update, csid->base + CSID_RUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}

[Severity: High]
Is there a potential data race on the aup_update and rup_update masks here?

These variables are modified using non-atomic read-modify-write operations
in process context during stream start and buffer queueing, without holding
a lock or disabling interrupts.

> +
> +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
> +{
> +	/* Hardware clears the registers upon consuming the settings */
> +	csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +	csid->rup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +}

[Severity: High]
Can these modifications concurrently race against the updates in
__csid_aup_update() and __csid_rup_update()?

__csid_aup_rup_clear() is called from hardirq context via csid_isr() when
clearing the INFO_RUP_DONE bit, which also does not appear to hold a lock.

If process context (such as a userspace ioctl queuing new buffers) races
against the hardware interrupt continuously generating buffer-done interrup=
ts
during streaming, could the driver state become corrupted? This might lead =
to
lost or spurious hardware register updates, which could hang the V4L2
streaming pipeline or cause dropped buffers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-nord-v1-0-=
20db41a7f1ff@oss.qualcomm.com?part=3D2
