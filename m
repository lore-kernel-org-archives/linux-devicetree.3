Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C6132E128;
	Wed, 15 Jul 2026 20:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784148772; cv=none; b=FAilA5uIi/wR5/d+3hNYkn2Mac7Pj5VRQyBz2saFp2cgONH2/if9Y/DFCDK8b0WELquXZt/r2s/M9Ob+KEAJ0FjpZbdKXx6KnusMZ9U0FsGezgu/Iq+umi0loiINKuxsoIW3Ca+Cnr58PBawtaHH5xg0+BoKEwPyj5FFXgz3Qlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784148772; c=relaxed/simple;
	bh=JhTbcAdFH2RuzXtTaX/qIdEXRlyOoZ6Vy0uPI2RXaBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLJ/wMBpoVKn4T1JL+rS0ONYgjr4n2V/DbMkXPFdaIy7lJ1ZXgM/tARxpNqFyj5/rpS9W121e0SBZo9TlmJk5aCgSoq/03BzhgJBctrhr9EHXf11oWxhcoxfgGKkZvgJMFKlm3q/3J0iAyb6KGI+NJrK5ikMUH8C7Me+H+YCFTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TeaoVgY2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TeaoVgY2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E911F000E9;
	Wed, 15 Jul 2026 20:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784148771;
	bh=yvvXfF4MMxkbg52aHtkqzkq213LU6ORGps4DBJfxOig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TeaoVgY2Sht4HEQLgArlPXfqRXN8XuESdahE4fJNbL/cYbUAAaTo2pMmYGvxIxMXJ
	 nxObzDWUVRX8e+EoLsMU7JnxhgSRqYdsu4jKHeytV+DuzZj5HmLPVeTTljjkegUkcb
	 jJRhrtJIXyMxvgNpvUv4ieSW6pwFfAg6I/2TEgvyfL6dDQMssphK7T9OX2b05bAnSp
	 cy7X+qifJdnANsl8hAzNn4N+gkosOZ/7wlZX3blZ8170PxYdTMP1RCyjm5czq7ok/0
	 bsajA2Pl4GVKbMc6b8sOmfeXiuXW5dLAKw6j9Znupbfo0oUp/TOX64GB95Uj+5TOoH
	 OXCuRwaC4Kbzw==
Date: Wed, 15 Jul 2026 15:52:47 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: Re: [PATCH v3 00/11] arm64: dts: qcom: Add x1e/Hamoa camera DTSI
Message-ID: <alfzEnd10K2kPjwp@baldur>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
 <178352261564.2235436.11540452339147753406.b4-ty@kernel.org>
 <5aa5487b-67ef-448f-8975-0c46ca1d3451@linaro.org>
 <e1b25b3c-ff3a-48f6-92f6-a81f7df24e54@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1b25b3c-ff3a-48f6-92f6-a81f7df24e54@linaro.org>

On Wed, Jul 08, 2026 at 10:33:12PM +0100, Bryan O'Donoghue wrote:
> On 08/07/2026 22:11, Bryan O'Donoghue wrote:
> > On 08/07/2026 15:56, Bjorn Andersson wrote:
> > > Applied, thanks!
> > > 
> > > [01/11] arm64: dts: qcom: x1e80100: Add CAMCC block definition
> > >          commit: 6a3568f938c9ff2cb493f82dc595b4dc2760f517
> > > [02/11] arm64: dts: qcom: x1e80100: Add CCI definitions
> > >          (no commit info)
> > > [03/11] arm64: dts: qcom: x1e80100: Add CAMSS block definition
> > >          (no commit info)
> > > [04/11] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD pmic,id=m
> > > regulators
> > >          (no commit info)
> > > [05/11] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB sensor on CSIPHY4
> > >          (no commit info)
> > > [06/11] arm64: dts: qcom: x1e80100-t14s: Add pm8010 camera PMIC with
> > > voltage levels for IR and RGB camera
> > >          (no commit info)
> > > [07/11] arm64: dts: qcom: x1e80100-t14s: Add on ov02c10 RGB sensor
> > > on CSIPHY4
> > >          (no commit info)
> > > [08/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add pm8010
> > > camera PMIC with voltage levels for IR and RGB camera
> > >          (no commit info)
> > > [09/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add l7b_2p8
> > > voltage regulator for RGB camera
> > >          (no commit info)
> > > [10/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add ov02c10
> > > RGB sensor on CSIPHY4
> > >          (no commit info)
> > > [11/11] arm64: dts: qcom: x1e80100-dell-inspiron14-7441: Switch on
> > > CAMSS RGB sensor
> > >          (no commit info)
> > > 
> > > Best regards,
> > > -- Bjorn Andersson <andersson@kernel.org>
> > 
> > Bjorn.
> > 
> > This is v3 from March. We are on v12. I don't think you meant to apply
> > this.
> > 
> > ---
> > bod
> 
> For example: compatible = "qcom,x1e80100-csi2-phy"; is not a valid binding
> 
> Please revert.
> 

Done

Regards,
Bjorn


> ---
> bod
> 
