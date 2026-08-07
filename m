Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAF247012A;
	Fri,  7 Aug 2026 12:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105095; cv=none; b=sTsOe8iM+9atd6y3Wo8BFUh5psqPEil+e9bFL/BSGxwGgJiMpmWmUQpDm0WlIaFk4PFnGjuiuC63DItGY6typDB58fqznch5bkCplANWJw4fdzl8/1INfy3z9aKkWhwwdxPqQvo6l7hreOiOhSbJ/N9csXH1JyQKec8L0AQgmFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105095; c=relaxed/simple;
	bh=cqnCt1whuJ2m+FGJgJE8nd4sp5bjHx5U1jh+FKPq/Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+L5oRA59eL4Ar/FDdf3GFSEpRK1Ux86XBTPwWSpT5WeiXGct/W5iCSclE6j04OO2Cvr0temg0xxXkXBHTSYjxekkQp18EI6H9hNquVPaikkvr8vpXmzXPoDP9SlgQKdoVMjKbMV8VcxEDoQq1+zrjVCVpFs4gKwWWr1lTpfkIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRfmfWVf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRfmfWVf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B061F00AC4;
	Fri,  7 Aug 2026 12:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786105088;
	bh=hRYmEDOjT6HknsqMzt88izSGG50xsp5fB4RzjMuEN3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HRfmfWVf7tzYawTMyWoz0fPJuKHape63Rft2tbMoZwxlCPyPxDjadlpk14XdfAmIx
	 DOHzXfC8051vs8BD2sydlMCxsNvA2EF9SUXZccfgGIL462qiAd/2It/jyHcvqTv/NF
	 CchZ4QscyM7Ud+ZEJr8sm67KktdScJoahiOHJq0qE7XPaIdH72dJJ9wtSejYud9LE6
	 okgorE3WX/dMXYgzJ1bVI2iZiUG/wFz/VFrmIUwWMrcD7wGBREnL/JxuXJ1qSi8wAl
	 2chHMGTpt/fTe10mI0CkYnI4S9kyz8FTFkvNt8DvVI8Mtk2SgAwR2gX9az1rc4CiD/
	 DckoZAfN7cBqQ==
Date: Fri, 7 Aug 2026 14:17:57 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com, 
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, Mika Westerberg <westeri@kernel.org>, 
	Sven Peter <sven@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/5] phy: core: Define TBT phy_mode
Message-ID: <rb47gnay6drypdef44ddf3cm3zdwxb5pcl4wwboyz4lftth2sb@xmc5dgpokgkl>
References: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
 <20260730-topic-usb4phy-v3-2-ccf0f7ea98b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730-topic-usb4phy-v3-2-ccf0f7ea98b5@oss.qualcomm.com>

On Thu, Jul 30, 2026 at 04:19:14PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There exist OS-accessible USB4 and Thunderbolt PHYs that need specific
> configuration. Define a new phy_mode for them.
> 
> Currently, USB4 and TBT3 are defined as submodes, because they're quite
> distinct, most visibly in the electrical/analog aspects (slightly
> different frequencies, timings, etc.). This results in a need to make
> the PHY aware of the actual mode needed (at least in the Qualcomm
> implementation, but I believe that'll be a general need).
> 
> Newer versions of TBT are basically supersets of USB4 with higher
> host-side requirements, so these are not defined. This can always be
> changed as necessary.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
