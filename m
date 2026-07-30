Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA603B5310;
	Thu, 30 Jul 2026 06:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394306; cv=none; b=B4gr8X1YPLy0yqLgf88AP6xJ9Sj/HHrbBbfGBKhk3IsqFhdgq7dmh1qpGBzukkaLsPLEA/4anYM8vtgUMg6yPiIi/2Y0j0RwyyDbYxQOHas1HPbOrc6ycGPIxLXEhSXI1jiRTh4bPISC5lLQC1CS/+o0fJyJpXXXw+BAAAdo4Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394306; c=relaxed/simple;
	bh=hlXVgnz4U/MVOvvGah58od+ubzdcfSYVLsDY+m1lVMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmeHT1q1DBf3XFIPeifeNg5UuEGQA93mcn8A1F+pvVr3IpPt/1gUH+RJrP8gUSy73fCb2/m9l574Aj4Fjj7P97JgHUysjiU4cmlM4vQ6b9ymqEDQI3Nim8yW7s5w0SJ4vpJffZUpiTLoeaOPObqVkyAMYzzsCrnsVf674fJ2fcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lsf6lzJi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lsf6lzJi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB221F000E9;
	Thu, 30 Jul 2026 06:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785394304;
	bh=LUYIZP1GOFsmrjUuV3p4xnpCCgou0gunX3Omvg5hT2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lsf6lzJi+LODdBqBPgyMmTxtoQPwjVzs73532+QE+C0dmK6fckGXgoxPpTy3x0j1e
	 QZLRA5YTunsFGyDqbUMSRln6cFXI7f4lwf8Mesv2qSSROS8DG+Fe+HwOD394saD6bV
	 HfxcdiuMGfkJRT48n3XT7ITDccAwOUw0XfBeMK6KgX5JPPaehi20MU94Vw9hVm1MWy
	 ft5Y9L0lXpCy/pmVKsrqb6cCOd7ctPz4dJwr/45xHjMMdN0TVJLig2tGrLRbfl5NP5
	 h6Gm93U4R7PBKDdu+/K0KuqR2NA16Cu79iZpO5wTSSOjiNJc8usbBIA2I39OkRwECx
	 8TDek9qzcs0ow==
Date: Thu, 30 Jul 2026 08:51:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add HAMOA-IOT-COME board
Message-ID: <20260730-alchemical-phoenix-of-excitement-fff9bc@quoll>
References: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
 <20260727070758.528-2-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727070758.528-2-yuanjie.yang@oss.qualcomm.com>

On Mon, Jul 27, 2026 at 03:07:16PM +0800, Yuanjie Yang wrote:
> Document the device tree binding for the HAMOA-IOT-COME board based on
> the Qualcomm X1E80100 SoC.
> 
> The platform consists of a system-on-module (SoM) mounted on a carrier
> board. The SoM integrates the core system functionality, including a
> SiP containing the X1E80100 SoC and its supporting components.
> 
> The COME SiP hardware is effectively the same as the SoM used on the

Effectively the same or the same? I googled for "hamoa iot come" and it
gives me zero results. Provide some URLs describing both.

Are you calling same SoM differently based where did you mount it? That
would be complete opposite of the idea of SoM, so I have doubts that
this is SoM in the first place.

Best regards,
Krzysztof

