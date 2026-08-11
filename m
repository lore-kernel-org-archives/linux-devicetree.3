Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C463B2F83A2;
	Tue, 11 Aug 2026 05:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786426198; cv=none; b=j3grt8lFt4G4VYhhgoyO0Zc1WRhvLg87RokA+PpTGEEXrcTUHMU4aJNi2umFbfm8/XlL63lNLDu748pjACOi2CoRsNMcmpP79tpHRorGhKiExoDEt9xopD2pibtWbACts2TSE8iuks6hpF/3rcJUEx08bkWFsVQLOYp70urQmjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786426198; c=relaxed/simple;
	bh=joapH80en9HN5n4lIKl+MH1tffa6r0cQDzdIfiW+VDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQ1vDCMxc5pcCHi+Ou02yEj1FitbGcYYgRx+Pkpmo6ni2G9La2ji/VCuKe41Mina4XYeIlF9+hSlFwLk8mUq/TLrHoiYrZXTKjUgJvPM1uI55PhOeV1xo3OyFa30tVmNl7qSdMpxZsYJUSdvk1WHp7f+5w1Q88QZLuDsAxB0m5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GP9C9ReL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GP9C9ReL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DECD41F000E9;
	Tue, 11 Aug 2026 05:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786426197;
	bh=6H4VFqpyTDupLVqdDSghcyR6FyudShqG0f7MIraqKLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GP9C9ReLqrfI6qThyN3N/wqR5AvhSsAJ6MpeXEKINfYPFKbwJi+ZyPnqii5xvugyd
	 DJOktZYwWlJhhIvXCETt7ti19DZoD2JDUiofgTiL0FubKHL/t/TaRHHVWnBdYe+0Lo
	 8PK5r4NKrARD81sBx3/YFh3iq+CYB/lIt76jaD8BfVtw3WDtPttbWvfmBnNmWQKvj3
	 jHmQsN721RxxipkO3lORJIScyx3vjIbGJvPmOfjhgjBZTYZ/mMjj/lp9K0NW7kyvUv
	 v1KV9Wv1bmShlHxStTY/7gzbFtVrp9cAb9wt+I8DVZ2tEjbkam8FeebVjv8Ih+SVJD
	 s4ApWoOkOQizQ==
Date: Tue, 11 Aug 2026 07:29:48 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, krishna.chundru@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com, sushrut.trivedi@oss.qualcomm.com, umang.chheda@oss.qualcomm.com, 
	rosh@debian.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] arm64: dts: qcom: clean up PCI function nodes
Message-ID: <fr4v6eqc3bynt3klrdutkh5rwpueieqdtleqwjy32dkatzvbdb@jxjn3chegxlv>
References: <20260807195846.456079-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260807195846.456079-1-elder@riscstar.com>

On Fri, Aug 07, 2026 at 02:58:39PM -0500, Alex Elder wrote:
> While working on upstream support for the Toshiba TC9564 SoC I
> learned that its PCIe endpoint function nodes included the
> device_type property, indicating each is a "pci" device.  Herve
> Codina pointed out that this is not correct; only a PCI device
> "that implements a PCI bus" should define that property.
> 
> I looked at other upstream devicetree files and I found four other
> places with this same mistake.  (All are for Qualcomm platforms,
> and all are for platforms using a TC956x SoC.)
> 
> This series removes the device_type property where it is defined
> for a PCI endpoint function.
> 
> It also removes the #address-cells, #size-cells, and ranges
> properties in these cases, with a plan to restore them only when
> they are known to be needed (to implement pci-ep-bus sub-nodes).

Thanks for cleaning the mess!

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
