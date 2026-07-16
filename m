Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ED83BF679;
	Thu, 16 Jul 2026 07:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784188788; cv=none; b=p4F++6FnueCCKxP0IXjWEbr5uSbLLV5nJvV+mz3645KeYjdRyeVZ4A7YjSlq0mTgD+eLXtAQs2/wMLa8gNm4/8oO3UowD8sj5Y5ZIONDj2ThyOVyALktIUs5nFB1YEOZTDhFFISruXtGl5OKZ7lOGKCn6v4FNRqLVz17SXeTcqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784188788; c=relaxed/simple;
	bh=3vGrIsEqqH4EY4uP6ohMdrYvjQw8Qr5lfzpLWFHkNNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E41SWTwALeJ3xyC3pZjmEi8gtsZg0Wj8QRdXJt/NCw3a/FfZGBcgTE5u8bgEJx+LzD9uO37HLdm25sZfhyw1gJu8mEQPWSvAvxTWebvPC0fsao5RCMeC5NYpufeiK+pm0oarMRxZoSXqfsc6zoayWb1Ta6pSZVC4PItx/sjQCNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iY/KGLBS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iY/KGLBS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4F01F000E9;
	Thu, 16 Jul 2026 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784188786;
	bh=XrR19htHTUU5Y49PneF5zGtC8MjrpXekHNcGYKi5N5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iY/KGLBSWdPQsh/kbgytXO1YLL53o1x4+NGShI22FBC8bWkEU7TFKBmEMHkxqpKw+
	 we//C/MuOFXNL0agcNtaBQDC6LSa1MlHqNO4n7otFsn+bbaEHTWKTKGcLOOVxucsf3
	 U6qpcIFFiO+yxMMHTvX7O+rJ6oseH0DWSpxl+EUQPcxFSUDLTnVoD9k6EJdFsva3pL
	 LyYUCDH7BWuIsPPS2BAIN3a4kTvnvz+RzAqqIq6M60rUtU39c4xPV1NkedHaPB8oR8
	 37SHb8Q9YRw0hdEmZJpZtcZg6Lfq3CZwbYupls3Vp8ToQIwVUSYgR1Lo9s1UuZLZxn
	 kyDvy2V37dliA==
Date: Thu, 16 Jul 2026 09:59:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: purwa: Drop the Hamoa
 workaround for PDC
Message-ID: <20260716-starling-of-heavenly-symmetry-09a73a@quoll>
References: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
 <20260715-purwa-pdc-v3-2-be08934dc916@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715-purwa-pdc-v3-2-be08934dc916@oss.qualcomm.com>

On Wed, Jul 15, 2026 at 06:52:01PM +0530, Maulik Shah wrote:
> X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
> register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
> Workaround hardware register bug on X1E80100") is already fixed in
> X1P42100 silicon.
> 
> X1E80100 compatible forces the software workaround. Use the X1P42100
> specific compatible string for the PDC node to remove the workaround.
> 
> Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)

Why does the DT change appear in the middle of the patchset? Please read
submitting patches documents - both of them - and maintainer-soc
profile.

Best regards,
Krzysztof

