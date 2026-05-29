Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F893DB63A
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065265; cv=none; b=qK9MgH9yezolowe4x+Yn+vFHhsj2IY3TrBuMzenwQVVb/XfPZndE5pOhNhwq1fa8bOt0JOAMqfek3HIrq8Okxq8xllz0S6b54khy6IPceYtImARYfmonSrAtkqGXTAmfTW+SvJ4TyJrCmh1E+1T2OsUFc6NQCrnxC7gDIFOafVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065265; c=relaxed/simple;
	bh=seP5ZOhGVh1Z9YBkV33mohniOYR8b54+BDkeWLjt6vk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lcH/8pGO5iu/oXuz5CXnMUFepHJf6UQhtLLyTr/wQs+swNvMhMBM58sVEwNiZWAea9zficHdkjSDXLp7x+15/9RKfFwfN81fZoZXSn8eWqnJeopWXiw6tgHzw/i9ChApR85APREie+ea7OhqYgn+qf4tvq24STSVzkvqNd/nPtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGm5xUDW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGm5xUDW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AFED1F00893;
	Fri, 29 May 2026 14:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780065263;
	bh=d8dMryTWwXJLLsJ12ko/t9wXOAO/co0bVBBA+nxJOfo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LGm5xUDWfg1Snxkih+pU/G12QljdLouu6hGHS0hyX18nEvnhCpKLupwQaSoyrWg2L
	 nZC1zTc2X4Niu10q92r7WslV4TZI6Mre17VJx32CUMAlLDEIx2LZ0QULqVnsKb73Jl
	 sEAadqwtrBvs6tCYzfvRDDsLTDPdRj2o3hfr1U2uD2SpTo9nrCe82bz+f6Bff4vo6I
	 vPaiSdA7TAZiRjDVoHvBZhmlaMQx/O2rTXr6Mhfc7X4Msu3VqfpZ5oNeRysDHPcXi7
	 40Hm7DXm9Hmqq8rMiPk+e9s0YkEDHnBGWFIeCRY6Liivcd9vAQNeXm2rdY296WyDG7
	 937sPTZ5LkJ3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Move xlnx,zynqmp-clk to its
 own schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Simek" <michal.simek@amd.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <8e9163806c6f6858cca9afcbdf63599ced3422fe.1780063921.git.michal.simek@amd.com>
References: <8e9163806c6f6858cca9afcbdf63599ced3422fe.1780063921.git.michal.simek@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 14:34:23 +0000
Message-Id: <20260529143423.9AFED1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Splitting the `xlnx,zynqmp-clk` binding into a new schema breaks va=
lidation because the parent firmware schema still references the old file.
--

commit 1e02d44e7b2b8c89538f05376475e81433856e26
Author: Michal Simek <michal.simek@amd.com>

dt-bindings: clock: Move xlnx,zynqmp-clk to its own schema

The ZynqMP clock controller binding shares only #clock-cells with the
Versal bindings. Move it to a dedicated xlnx,zynqmp-clk.yaml schema.

> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml=
 b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> index bef109d163a82..12d060c39bfc4 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> @@ -17,9 +17,7 @@ description: |
>  properties:
>    compatible:
>      oneOf:
> -      - enum:
> -          - xlnx,versal-clk
> -          - xlnx,zynqmp-clk
> +      - const: xlnx,versal-clk

[Severity: Low]
Does this change break schema validation for the parent firmware node?

The firmware binding at
Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
still validates its clock-controller child node using a reference to
/schemas/clock/xlnx,versal-clk.yaml#.

Since xlnx,zynqmp-clk is removed from this schema, will dtbs_check now fail
for device trees like arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi that
define the clock-controller under the firmware node?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780063921.gi=
t.michal.simek@amd.com?part=3D1
