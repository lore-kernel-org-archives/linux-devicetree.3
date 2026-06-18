Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70BC8F49
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781790259; cv=none; b=pWwWc+UDafmtFgVfgFMpz7XoqdytpHjzWoL6FkBw0jPZ3TO2+krtOZa59svHkJbvol3V9loofG8MuCHd7ksIEkgEUuHvK+41wf2NCVNYzQAszsmNbMtBc9TMX4U5tSm8YFBmihcoa5gjILnhj5nhrnulyEFrdYA5+P0ajAKpFpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781790259; c=relaxed/simple;
	bh=b6CC02LCjf/PpPvdIPnVJjnM3cE6ILXnLUOk/wLCCiA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JNm3pt6F8/oPWE6+aLIHkZq1BHnEm/GRgeKYbvcpS+JtphFbTHkoOarl4VqqDGsGBgIE2sB2Qpm/P+jjnYRetfeIlTjSoE/edPbxGGYueRjcChq+Zy6l3OA9ND3AyocK3vUS0NyuhEJfZds03lbmbCMmP0PbMpj+aqI/bU0g0gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNUcrisV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bNUcrisV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B55B1F000E9;
	Thu, 18 Jun 2026 13:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781790258;
	bh=xloNlSXVqNEWAbkf7aX+41D+vE7i/vEHagDv7nNtZKk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bNUcrisVLOEQy9HreBMJdcGuh+8o1bxPtuGJ+gvglE7kSF+pb6OIe6Lk8NmVMQIro
	 tnrN25+/UTOCnd8shW5d1UrP92kj2lxsEp4nw65CH4VPg084b3TcUWx3PsrTbyHeYd
	 yymQkZXa177duQwsG71I+0phucwMvfJ0ekDel87vc38FgozC6KgJrI0ckZVhTLKXga
	 RgIWnAijIc3adx1rdrD7uya3nmWC5XqWVYAC8hJ0q33E4TOLzaYTwJyZFTHr96wcoh
	 glJps85hTMbMHa3x4yjRPoCsnMe/mvzvo9+pgZ715FQJbmXBK3mjNq14r7ds/TIxu5
	 1f9aCy1z1u2dA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 15/16] iio: ABI: add docs for ad9910 sysfs entries
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260618-ad9910-iio-driver-v6-15-79125ffbe430@analog.com>
References: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
 <20260618-ad9910-iio-driver-v6-15-79125ffbe430@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 13:44:17 +0000
Message-Id: <20260618134418.0B55B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The device tree binding defines the hardware as a clock provider=
 but omits `#clock-cells` from the `required` list.
- [Low] The newly added ABI documentation file is missing the mandatory 'Da=
te:' field and has empty 'KernelVersion:' fields.
--

commit 87a63b1a571e4fe2e7cfbfd552bf448b474a11d0
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: ABI: add docs for ad9910 sysfs entries

Add custom ABI documentation file for the DDS AD9910 with sysfs entries to
control some parameters from the Digital Ramp Generator and OSK engine.

> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-frequency-ad9910 b/D=
ocumentation/ABI/testing/sysfs-bus-iio-frequency-ad9910
> new file mode 100644
> index 0000000000000..a54afeb643029
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-iio-frequency-ad9910
> @@ -0,0 +1,27 @@
> +What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrentY_dwell_en
> +KernelVersion:
> +Contact:	linux-iio@vger.kernel.org

[Severity: Low]
Does this new ABI documentation file omit the mandatory 'Date:' field?

According to Documentation/ABI/README, every file in the ABI directories
must contain a 'Date:' field specifying when the interface was created.
Additionally, the 'KernelVersion:' fields appear to be left empty, which
might trip automated ABI parsers.

[ ... ]

While reviewing this commit, I also noticed a related issue in the device
tree binding file introduced earlier in this series:

Documentation/devicetree/bindings/iio/frequency/adi,ad9910.yaml:
> required:
>   - compatible
>   - reg
>   - clocks
>   - dvdd-io33-supply
>   - avdd33-supply
>   - dvdd18-supply
>   - avdd18-supply

[Severity: Medium]
Should '#clock-cells' be included in this required block?

Since the device tree binding defines the hardware as a clock provider with
'#clock-cells' and 'clock-output-names', omitting it from the required list
could allow incomplete device tree nodes to pass schema validation. This
might cause dependent subsystems or drivers to fail unexpectedly at runtime
when they attempt to use the undocumented functionality.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-ad9910-iio=
-driver-v6-0-79125ffbe430@analog.com?part=3D15
