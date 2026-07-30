Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D9645199E;
	Thu, 30 Jul 2026 16:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428058; cv=none; b=nhPFyqJEqcz/zzctRN5GZ0jjT9wrI6Wt8R3f1Bq+V9mzw5tQiADNL8yq5ushL+GqkNPVuYRdLa6RQVgpTLYIol7FETcCka7gSQDMVMil5BjswHUUlZZfJS+rWparPwiSb6hhTVc8JNnndD4A2XEePNuSeNJA3ua9JoikvCu+zA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428058; c=relaxed/simple;
	bh=/2G7OlA7hEhZ9a07i6DHNU6o9G3NpRpKVH+6k4XObkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0r9NPmI11Zx2b38/KbjvnenGqiKyBHFRoG1xbULgUMXjNBMqMhytMdcxEA1fv1CFxgqhfh0hyjbfhGq2jJm/YmmBWReu3QfPjOo2BmfmwjDynjBIyDuOcaljlKSLCEGKk4lzoSEWUuCQZUuDORpE/PjVoSn4kxS3dGKTuNpQtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOUpRxP8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOUpRxP8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DDA61F000E9;
	Thu, 30 Jul 2026 16:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785428057;
	bh=jV0W+BkptDoGjvzjPAU9rt59C2+jaOnW/9lKN+c95CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SOUpRxP8QRVex+l8pJMbqK4TG271PcS0B0yxbPe9drngg72/uZPnJRzhO4VZH3N2t
	 2kUkrMmJr+A0vIJr1LP6rsAUDD4RGEtkBW8vUh2NA7NEPkRRYv5o6spIvptU9VOZUP
	 b6oECwAxcpwXo8MHqh1hTlzPiq0pr73FWhBFWp7anogtvQ58GaO1vLDCOJF89i+5s2
	 WpJ38rSgwvmENCxKf3B+u/1qTA4BO8gUGltCvkCALkolJhGZhA1w0kusTNuPn/tyAR
	 EkdgIzlROXAwudHpAVlaDz61latR+0Zchjuwm0HOR71XmMX4U0tuZd3fhCj6Sn27Zm
	 KBxfOvMxaLsag==
Date: Thu, 30 Jul 2026 18:14:09 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 00/22] arm64: dts: qcom: Fix the PCIe iommu-map entries
Message-ID: <4sbgvbb5admwtfsggio2tzdwpb5kimddxcpjxjuoiptcuwke6y@nr3nm7577tna>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
 <qw62kk4cv3knqbwa44kvs5hj2uojkkgwrvd4mljd6g5qbn5xb4@jv2lsctxzliv>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qw62kk4cv3knqbwa44kvs5hj2uojkkgwrvd4mljd6g5qbn5xb4@jv2lsctxzliv>

On Thu, Jul 30, 2026 at 03:23:28PM +0300, Dmitry Baryshkov wrote:
> On Thu, Jul 30, 2026 at 01:55:41PM +0200, Manivannan Sadhasivam via B4 Relay wrote:
> > Several Qualcomm SoCs declare their IOMMU providers like apps_smmu and
> > pcie_smmu, with '#iommu-cells = <2>', where the two cells are the SID
> > and the SID mask. But the PCIe iommu-map entries on these SoCs specify
> > only one output cell for the SID and omit the mask. This went unnoticed
> > until the OF core started warning with commit
> > ccb2fd725d41 ("of: Respect #{iommu,msi}-cells in maps"):
> > 
> >   iommu-map has 1-cell entries targeting 2-cell #iommu-cells, treating as 1-cell output
> > 
> > So this series fixes the iommu-map entries across the affected SoC, SoM, board
> > and overlay files to match the provider's '#iommu-cells' property.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Note, this must be merged only after the commit fixing iommu-maps lands
> in the qcom dt tree.
> 

Which commit you are referring to? The commit which triggers this warning is
already part of 7.2-rc1.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
