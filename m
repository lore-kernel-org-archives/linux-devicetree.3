Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D552DF13A
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 13:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784380341; cv=none; b=d1Cw0nl9474gpDQq5I7MnSgROfFNMi4BbLX5Z2lCUM+EUjx4po17EtkX9LarTKXyqxAGRVryZn5m8J14nWQukEOLSkeISjiyHNwRIFZX0VkhGUFSbzOPtqN8k3M7w6pOEDZgHW+c1gjuVn0NWy+BK6ThI67vRhGfrj6RwAG8Z64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784380341; c=relaxed/simple;
	bh=gCmm/MOeEu80cy2/nU47h/wBwaMPb3f6CHNynHgQ0/I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZDSZSxzi8oD0bW1CNZ+y2pL6QCuvMUtveKr4bc6NPI8anS54pLAiP9AZ+GVOMXyRD9F/a3Dal85inEEFKSQJk4GUPjeyD9/yXEEMkb86y2RN2dZ7KTxo+h7ZpJg8X9olbZFVvA+8+FFBSKgKYiAl69ccXsgwvHNe6mIzyvxh4k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAGhtjYL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAGhtjYL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DA51F000E9;
	Sat, 18 Jul 2026 13:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784380340;
	bh=qdi5dNoUTtbRFziiWS/AFC/ExOcc1B+k5nGwVpma3N0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dAGhtjYLSY8JcYk/8UGKp1DsvNUde3SMtIMKnoHBuEugOfMow0kGxlMwQrWqJfA3c
	 +jpVgGoBfqiLBy83EXtoduMyBal4Eg7nSCsoUYviX7ABam1it5hjEo+pOhtKam8Dq9
	 XtXAeV/3nPuF9BlUqZ+h0IOOxftInqfeYsv1geNMfTW2j53NRHx0nYMrxxfCPID/z2
	 qGWJRBf9YvMvWPQNHi32caCkXxo8zdbHIXEZwu2jFNFVLz9uVwdefthrk0sTBSQryl
	 7D087UGpwIJm2pzrOZF8FhDmcJf417VyghTDCCAEyJo5FrkoYBJ4I9PsAg7QCBuVN5
	 rsYFzivtnMAaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/16] clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag
 for DISPCC and GPUCC GDSCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-6-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
 <20260718-shikra-dispcc-gpucc-v6-6-62703e05ef0f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 13:12:19 +0000
Message-Id: <20260718131219.D0DA51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware context retention failure due to conflicting SW_RESET fla=
g in GPU GX GDSC.
--

--- Patch [6]: [PATCH v6 06/16] clk: qcom: qcm2290: Add RETAIN_FF_ENABLE fl=
ag for DISPCC and GPUCC GDSCs ---
commit 190ef1fdcc32df401791889048619af17ae2bf71
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs

Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs on QCM2290 to retain
the register context across GDSC power collapse.

> diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qc=
m2290.c
> index 3b130f69bb938..8d397cadc86aa 100644
> --- a/drivers/clk/qcom/gpucc-qcm2290.c
> +++ b/drivers/clk/qcom/gpucc-qcm2290.c

[ ... ]

> @@ -313,7 +313,7 @@ static struct gdsc gpu_gx_gdsc =3D {
>  	},
>  	.parent =3D &gpu_cx_gdsc.pd,
>  	.pwrsts =3D PWRSTS_OFF_ON,
> -	.flags =3D POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
> +	.flags =3D RETAIN_FF_ENABLE | POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | S=
W_RESET,

[Severity: High]
Does adding RETAIN_FF_ENABLE here conflict with the existing SW_RESET flag?

During runtime PM resume of the gpu_gx_gdsc domain, the GDSC framework calls
gdsc_enable(). Since SW_RESET is present, gdsc_enable() will call
gdsc_assert_reset() to pulse the block controller reset.

Won't this hardware reset immediately erase the flip-flop state that
RETAIN_FF_ENABLE was intended to preserve across power collapse?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718-shikra-dis=
pcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com?part=3D6
