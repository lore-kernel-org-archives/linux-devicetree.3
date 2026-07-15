Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702E2417D80;
	Wed, 15 Jul 2026 20:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146763; cv=none; b=cy7e8Niv08zSiAb4RYF7CtQHdZp4mkyQ2ojOJJwllI4S3XWbhE11+kDW6SBr4/AOapfEbJUzAKRfIaLhlo35LARKybSob/eu48V38S8ZFH67/ByeCxuR3++THO0YfEmWcyVg2VzMHN/5pL+zT8G0R42g0kOHWwFTyjtL2GOc8h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146763; c=relaxed/simple;
	bh=Z5aKsvpkY1h5pezT1tECYmI6RahhsIdQLBPGNbsN5ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7ioCMuEVh+DqPHrpO707eGI3rZeOhTyATF6s4dvGDSBqsegrWqczHhBiafv/2SQZsZrJP4zki8kSwVedheALB+nALpxbipD4d4llkyRjCC7rJaxVMsR+591zVgldpQ3JJsy3Wg6P2gG96ouLOJXwA9jj4I/H96wxXco5I3L8os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVbymDB1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVbymDB1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764B91F00A3A;
	Wed, 15 Jul 2026 20:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784146762;
	bh=XqP4a8zoES4ExjAG6Vu64q13AmzlkjeVhdugeOidsEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IVbymDB1i8mkgUSlrcXKuL1KLjL/wWaCZXD16u4qu5sQMh/ivyG3iCFb07hULWp0q
	 vp0u0DeKq/hFVXyxgExt0c8HuY2v7Qy08eiNcPsV4RiiBDrH4K4UbWAfDlJ6acMVvq
	 uAYA247WIIu1MyPlaHb7xxUmgn9oOeKPxde8EGz9+I1ucS1wf6q/1aPIf/9dkTWABr
	 vqSxNv5x47UAA3ZvDqUfTIXncUa2zE2P9sg0ck0L8nQlBU5Yq41Dh+0SUMwZPUil12
	 +6Bt06OolyF3+Qd0nHUEQeqBINKXCnR3eHnQGZxTkqktIaBbCAiuNJqN2DxGIQiSlI
	 tedNUMXWTf+Wg==
Date: Wed, 15 Jul 2026 15:19:18 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add CCI and CAMSS support for Kaanapali
Message-ID: <alfrMmDZzfdIZypN@baldur>
References: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
 <178352261637.2235436.16367939885864866010.b4-ty@kernel.org>
 <943eac10-45b8-4301-b8af-8ce8d9144372@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <943eac10-45b8-4301-b8af-8ce8d9144372@oss.qualcomm.com>

On Mon, Jul 13, 2026 at 10:44:57AM +0800, Hangxiang Ma wrote:
> On 7/8/2026 10:56 PM, Bjorn Andersson wrote:
> > 
> > On Fri, 08 May 2026 01:36:44 -0700, Hangxiang Ma wrote:
> > > This series adds CCI and CAMSS support for Qualcomm Kaanapali SoC.
> > > 
> > > This series has been tested using the following commands with a downstream
> > > driver for S5KJN5 sensor.
> > > - media-ctl --reset
> > > - media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
> > > - media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
> > > - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
> > > - media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
> > > - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> > > - yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/3] arm64: dts: qcom: kaanapali: Add camss node
> >        commit: 7cc8ca0387f572a4d69941fe380e7a262342491d
> > [2/3] arm64: dts: qcom: kaanapali: Add CCI definitions
> >        commit: c25b80614c31a30b1b0f44fc5ae260aff90fa4aa
> > [3/3] arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
> >        commit: b6f8ecb80c1f894bcd0c612bf0ed4c5fee52d287
> > 
> > Best regards,
> 
> Sorry Bjorn, the camss binding + driver series wasn't merged as expected,
> which would cause dt-binding checker failure. Could you please revert this
> series? Bryan expect us to rebase on his new re-arch camss and the
> binding/dtsi may be changed accordingly. Thanks a lot.
> 

Thank you, I missed this in my dtbs_check. I have backed these changes
out.

Regards,
Bjorn

> Best regards,
> Hangxiang
