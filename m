Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C3333A70E
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662646; cv=none; b=be/b/m/M1k6Uy5eEgf3X9tl0HkLl2ZMNeemMORL5WjdHh6e++Enu2rbT8mbnIV2NshSkO4DvgfzpsXWJ2mJmIrWdT8VHVr/XxYYCjKbPLXx3jaxIJ3Uq6zAXYrjX6/UW3H8lpXAuheDc+PgzqHgnCXJMRHbaOrNnTGLgQWZUfD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662646; c=relaxed/simple;
	bh=V6rcYgceVl1cF58Rz5saZyavTUdq/24smz44srvJxZs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EDTc6u73cvTrqk/JjYzuRoP9NnpC8IyEMld54MV1FAgKZI2x530OA994cMkEyJTcwbDL8zwBelSZj2YPnBLJvt/G66JCt3MWISA5sXX/phTXvT7I7pP8HosGk9ihgJKKF1NJNwMAOeJeyj4d/co2rh+yNWqHYejb29cU4oItD14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzBFVuon; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzBFVuon"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E52C1F00893;
	Tue, 29 Sep 2026 06:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790662645;
	bh=cI2Evcrxq8EGyu1nKEqRQSvnCjRrbV62MrQoh6nfzd4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IzBFVuonhOnYlm3G/qyyUkFrPeheQf7Cf8GKz72wFkYXr/9hx9oEpb8TePSUMW3g4
	 ncj2/raFcs78MiX5Gc496l7+NFB1rwo++xLMc/7afM+4a/huCPNOjb6uIpv8TXyUlk
	 ImV8PPaTmVUuYAqzqwSUBPWKi3bPomCKuc0BCmMgvDF6lM+id9TCHmyB1xj1SbNS5t
	 lyRtBkyibE2PC8VVgYpAK7tnPFg9eyKnS1rY0/LO12yp756VxmKOnbZa52u+qTTlo9
	 2h573XXXgoKhT5UbqSvBPellN2UqFE29RXH2wqKKPN1R2Xs3D+PwbYWDAAAFkYL/au
	 Wxkkr592irCcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 06/11] media: qcom: camss: csid: Add support for
 CSID Gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, media-ci@linuxtv.org, robh@kernel.org, olteanv@gmail.com, conor+dt@kernel.org
In-Reply-To: <20260928-kaanapali-camss-v17-6-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-6-dcf3fd37f76c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 06:17:24 +0000
Message-Id: <20260929061724.7E52C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: qcom/camss: data race on csid->aup_update and rup_update
- [Medium] media: qcom/camss: integer underflow in __csid_configure_rx
--

commit 611abdeb4b5da574ae292d1ff736d0d71f2f4ed2
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csid: Add support for CSID Gen4
   =20
Add support for the CSID Gen4 hardware found on Kaanapali SoC.
   =20
Introduce Gen4 resource descriptions and implement the hardware-specific
register programming, reset sequence, and BUF_DONE interrupt handling.
   =20
Gen4 splits RUP and AUP updates into separate registers and uses a SET
register to commit the updates. Update the CSID interface to support
both this scheme and the legacy combined reg_update mechanism.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen4.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen4.c
> new file mode 100644
> index 0000000000000..4ff2f41f70f7e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
[ ... ]
> +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
> +{
> +	/* Hardware clears the registers upon consuming the settings */
> +	csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +	csid->rup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +}
> +
> +static void __csid_aup_update(struct csid_device *csid, int port_id)
> +{
> +	csid->aup_update |=3D CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->aup_update, csid->base + CSID_AUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_reg_update(struct csid_device *csid, int port_id)
> +{
> +	csid->rup_update |=3D CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->rup_update, csid->base + CSID_RUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}

[Severity: High]
Does this introduce a data race on csid->aup_update and csid->rup_update?

If a stream is configured in process context via csid_set_stream(),
__csid_aup_update() and __csid_reg_update() modify the shared state with
non-atomic bitwise operations (|=3D).

If an interrupt (such as RUP_DONE) fires concurrently for an already running
stream, csid_isr() will execute and call __csid_aup_rup_clear(), which modi=
fies
the same variables using non-atomic bitwise clear operations (&=3D ~).

Because these bitwise operations lack locking, could the interrupt's
modifications be lost, causing the hardware to receive an invalid AUP/RUP
command mask? This might lead to broken streaming when dynamically configur=
ing
multiple virtual channels.

> +
> +static void __csid_configure_rx(struct csid_device *csid,
> +				struct csid_phy_config *phy)
> +{
> +	int val;
> +
> +	val =3D (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
> +	val |=3D phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> +	val |=3D (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
> +	       << CSI2_RX_CFG0_PHY_NUM_SEL;
> +	writel(val, csid->base + CSID_CSI2_RX_CFG0);

[Severity: Medium]
Can this code underflow if phy->lane_cnt is 0?

If the device tree incorrectly omits the data-lanes property, phy->lane_cnt=
 can
evaluate to 0.

While __csid_configure_rdi_stream() provides a fallback for this scenario:

    if (!lane_cnt)
        lane_cnt =3D 4;

__csid_configure_rx() omits this check. If phy->lane_cnt is 0,
(phy->lane_cnt - 1) underflows to -1. This would result in writing 0xFFFFFF=
FF
to CSID_CSI2_RX_CFG0, clobbering all its fields.

Should there be a similar fallback or validation check here to prevent
hardware misconfiguration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-kaanapali-=
camss-v17-0-dcf3fd37f76c@oss.qualcomm.com?part=3D6
