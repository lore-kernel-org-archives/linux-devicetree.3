Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADBE1D5ADE
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145964; cv=none; b=fCF82Jszj6c0A5at4oUaTuTRcncKEnJbl39otuhB3KDA2KEvDnxsxMPigVh542llJ+Xe7bLLkyoKO7tysqFmHUn3+WVCLXaGvsVX82hJAjC3A0AnX+90cVik/cEKuKF3qY51gP6CVoJaUvAeKVB4NFoxN2E4Y9bBl9ePrSYpJXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145964; c=relaxed/simple;
	bh=rWbtPfXhvAAy/Zyki54u1JdVLcEqJRtMJEpAngqbTU8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZbHriLQPqzVrjciSYJF8TWWEG4RdFRcsA4nSGIVxfYYEDIi9IW1fp4dfNmApvyVbZ8Oey2c8h6QKgb93CGgVQlpZk6okpmCpu/9yFs3Oo2Hk7QuvnKVDnxaUnYbUBTcaQWAH2IDm86Tk/HgqHakad0O1OudSvjriQ2upO3/O2Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnYVH4tL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnYVH4tL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1514F1F000E9;
	Mon, 31 Aug 2026 03:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788145963;
	bh=JYtqnEBM0grA9YxXTZ8TH24DO76mwT4407yf4w9DQgQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nnYVH4tLUtmMU0rN6hgwU87lj03c7WWoXrEBWqFkMzS3xB/0Rv6326weAlXT9h6oJ
	 CD6me7stuwEatlS2wJn1+V33K/bsir3EyN7rMvTMWsGIhV0ngVHDAJLM6Y8VWBMzK2
	 qB9kPCWqUhgABNsBH12Fub7fyMDLi0RWVrgdd8hKJ1Uub10UIrBWVAML1+V7MrYW0A
	 3Ku/DZ35yyShk3hhUcu0WNHxw+uFfPOEDORXKh6tfQG13fgOM7D8SSr2bfEQqDPtLA
	 FU5sqITfTtiwvKQlH4ZJFXsKAj2PDDpZskfEWxTtfp8SvylWK/qNjtKatAGUFVjgiG
	 F4LT9QUKN8nfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/8] usb: misc: qcom_eud: add sysfs attribute for
 port selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831030147.1500616-3-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
 <20260831030147.1500616-3-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 03:12:42 +0000
Message-Id: <20260831031243.1514F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] A Time-of-Check to Time-of-Use (TOCTOU) race condition between '=
port_store' and 'enable_store' allows userspace to bypass hardware safety c=
hecks and corrupt hardware state.
- [Medium] The software state 'chip->port_idx' is not synchronized with the=
 hardware register 'EUD_REG_PORT_SEL' during probe.
--

commit 9b038bddb764549d4a4936b0665df772d79af0b5
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: add sysfs attribute for port selection

EUD can be mapped to either the primary USB port or the secondary USB port
depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
attribute to allow userspace to select which port EUD should operate on
and update the ABI documentation.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 926419ca560fc..25a6a8f110ec8 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
[ ... ]
> @@ -104,8 +113,38 @@ static ssize_t enable_store(struct device *dev,
> =20
>  static DEVICE_ATTR_RW(enable);
> =20
> +static ssize_t port_show(struct device *dev, struct device_attribute *at=
tr, char *buf)
> +{
> +	struct eud_chip *chip =3D dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%s\n", eud_port_names[chip->port_idx]);

[Severity: Medium]
Is the software state 'chip->port_idx' synchronized with the hardware regis=
ter
EUD_REG_PORT_SEL during probe?

If the system boots with EUD_REG_PORT_SEL left in a non-zero state (e.g. fr=
om
a warm reboot or bootloader), the software 'chip->port_idx' (implicitly
initialized to 0 during probe) will be out of sync. This causes port_show()=
 to
report the wrong active port and enable_eud() to power on the wrong USB PHY.

Should the driver explicitly enforce the default software state by writing =
0 to
the register during probe, or read the register to populate 'chip->port_idx=
'?

> +}
> +
> +static ssize_t port_store(struct device *dev, struct device_attribute *a=
ttr,
> +			  const char *buf, size_t count)
> +{
> +	struct eud_chip *chip =3D dev_get_drvdata(dev);
> +	int port;
> +
> +	port =3D sysfs_match_string(eud_port_names, buf);
> +	if (port < 0)
> +		return port;
> +
> +	/* Port selection must be done before enabling EUD */
> +	if (chip->enabled)
> +		return -EBUSY;

[Severity: Medium]
Does this check introduce a Time-of-Check to Time-of-Use (TOCTOU) race
condition against enable_store()?

Because this accesses 'chip->enabled' without holding a lock (even after
'state_lock' is introduced for enable_store() later in the series), concurr=
ent
writes to the 'enable' and 'port' sysfs attributes could allow port selecti=
on
to proceed simultaneously with the EUD enable sequence.

Modifying the port selection register concurrently with the EUD enable sequ=
ence
violates the hardware constraint mentioned above, potentially causing undef=
ined
hardware behavior.

> +
> +	writel(port, chip->base + EUD_REG_PORT_SEL);
> +	chip->port_idx =3D port;

[Severity: Medium]
Can concurrent writes to the 'port' sysfs attribute corrupt the state here?

These operations modify hardware and software state without synchronization.
Concurrent writes to port_store() could leave the software state
'chip->port_idx' permanently out of sync with the hardware register.

> +
> +	return count;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831030147.1500=
616-1-elson.serrao@oss.qualcomm.com?part=3D2
