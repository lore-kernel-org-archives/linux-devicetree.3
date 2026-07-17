Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8607A283FF5;
	Fri, 17 Jul 2026 22:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784326567; cv=none; b=WH6CpgGSZmvmWr1qq8Am8QSVGh22szL+4wcYchcQ2ktTftuScpd4I3hop2dIpXCURQqyBZXelmDPwKFr5FV8dSOb1opBVv2GFc055z5Uhnd/TMwwv62+0JwWi1+x+Y7mXuFCQSt6pJAQlzQarQ8d1zvRC/jYkL4AhWvXNS92fdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784326567; c=relaxed/simple;
	bh=ccTEIA7bDMUKBD8iz4qGfgURYtRy6eTLUpIVywidViM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGh8nGzTUBjFJriLmWLTv8waC7PHy92aVaI6asVXjf+OnBPUIdBfJMJanVxP40LTfeZ/Pqyr1Sm3Kfq9KLUta4RqLEu7LfWOiU5BKaVVPVyIUinpW9w/z3iEG1SJcp7PbrxTYNQBgocQ0XINCSRuLfDhu37RHtg5jejwVMkPnY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHPDpeFK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHPDpeFK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564251F000E9;
	Fri, 17 Jul 2026 22:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784326566;
	bh=VvlfwL+DGrEKpjo1cxxHqUBMG7hKMaqVp7+LIHCnklI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nHPDpeFKp+cT0qLGsV4DoVaEY0RxfoWoxNlyRO8jA0qJkWb4h+kezgq0wRzcUWQPr
	 B0Tzpi2gZLZoxLT1R+Dmdp7D4LzzwLe0Ohvfnzxef7i9knZSeSvUB8LQULPazwRbTA
	 Ijum4sPFkkG4CaQsV5DUxa9+XmYU2Xez+XPalvSJCXMAt/KX5GoLoQrKDl4pBXoG9p
	 OUfOQsJ+Al9Gg/0VwM1qTaaN7YIrbrG+a96/GlNoZ9YCVVqVx9fynQ/cuSWVI5pdtI
	 m51JnIV3IJndnS5eZfGBrcVX2hR1JLRaSGdk4CFCT9JNGhbW1kC72eXznRMN0kwzMM
	 gRcxeXgnEa/UQ==
Date: Fri, 17 Jul 2026 17:16:03 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: Re: [PATCH v3 00/11] arm64: dts: qcom: Add x1e/Hamoa camera DTSI
Message-ID: <alqn705VnocjAGbW@baldur>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
 <178352261564.2235436.11540452339147753406.b4-ty@kernel.org>
 <5aa5487b-67ef-448f-8975-0c46ca1d3451@linaro.org>
 <e1b25b3c-ff3a-48f6-92f6-a81f7df24e54@linaro.org>
 <alfzEnd10K2kPjwp@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alfzEnd10K2kPjwp@baldur>

On Wed, Jul 15, 2026 at 03:52:47PM -0500, Bjorn Andersson wrote:
> On Wed, Jul 08, 2026 at 10:33:12PM +0100, Bryan O'Donoghue wrote:
> > On 08/07/2026 22:11, Bryan O'Donoghue wrote:
> > > On 08/07/2026 15:56, Bjorn Andersson wrote:
> > > > Applied, thanks!
> > > > 
> > > > [01/11] arm64: dts: qcom: x1e80100: Add CAMCC block definition
> > > >          commit: 6a3568f938c9ff2cb493f82dc595b4dc2760f517
> > > > [02/11] arm64: dts: qcom: x1e80100: Add CCI definitions
> > > >          (no commit info)
> > > > [03/11] arm64: dts: qcom: x1e80100: Add CAMSS block definition
> > > >          (no commit info)
> > > > [04/11] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD pmic,id=m
> > > > regulators
> > > >          (no commit info)
> > > > [05/11] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB sensor on CSIPHY4
> > > >          (no commit info)
> > > > [06/11] arm64: dts: qcom: x1e80100-t14s: Add pm8010 camera PMIC with
> > > > voltage levels for IR and RGB camera
> > > >          (no commit info)
> > > > [07/11] arm64: dts: qcom: x1e80100-t14s: Add on ov02c10 RGB sensor
> > > > on CSIPHY4
> > > >          (no commit info)
> > > > [08/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add pm8010
> > > > camera PMIC with voltage levels for IR and RGB camera
> > > >          (no commit info)
> > > > [09/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add l7b_2p8
> > > > voltage regulator for RGB camera
> > > >          (no commit info)
> > > > [10/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add ov02c10
> > > > RGB sensor on CSIPHY4
> > > >          (no commit info)
> > > > [11/11] arm64: dts: qcom: x1e80100-dell-inspiron14-7441: Switch on
> > > > CAMSS RGB sensor
> > > >          (no commit info)
> > > > 
> > > > Best regards,
> > > > -- Bjorn Andersson <andersson@kernel.org>
> > > 
> > > Bjorn.
> > > 

Sorry, should have paid a bit more attention here.

I believe I had previously tried to apply part of this series, just to
realize that the bindings weren't in place - and hence backed them out
again.

So the change I actually merged was [1], but for some reason we got a
ty-letter on this series.

[1] https://lore.kernel.org/all/20260507-purwa-videocc-camcc-v5-6-fc3af4130282@oss.qualcomm.com/ 

> > > This is v3 from March. We are on v12. I don't think you meant to apply
> > > this.

I have v3, v4, and v5 of the camcc addition, I merged v5. I'm not able
to figure what series you're talking about, but it must be something
else?

> > > 
> > > ---
> > > bod
> > 
> > For example: compatible = "qcom,x1e80100-csi2-phy"; is not a valid binding

It doesn't say anywhere that I merged the csi2-phy nodes, above
ty-letter states that I merged the camcc patch.

> > 
> > Please revert.
> > 
> 
> Done
> 

And the revert is dropped as it was incorrect, sorry about that.

Regards,
Bjorn

> Regards,
> Bjorn
> 
> 
> > ---
> > bod
> > 
> 
