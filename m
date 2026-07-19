Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E13F507;
	Sun, 19 Jul 2026 06:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784443430; cv=none; b=AaodIQHdFg5rCHR65bOl++wXVTVbo7YZRV4RlPbkQJgngftfShAqvLt49PV2AGT5xxxSrlg7eIyV0Y8vXhhqzaknbb1Wwd0rsPVbNnNb2M+JIKT7Dr7OX1/2ZM9CXPB6wmYZkCXRHXHjDbt5FciQrnVZ4NY4g1IFlaoW+EKpRJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784443430; c=relaxed/simple;
	bh=GBjgmtAqD+aw7/cCyrWxT5N4xxE/egaH2Bp6QVMBsM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUzDYl537T2i25xIo2k5MQVb+Lc+ADpjAxUvcsc11ow8DshXktbMGXeLSJ1pxAtrLtZypY7wV6FlIE+zjDPUjsE63H7x7R6Bq+oQkb/XnhIdj9xHPak/paueKDWSDQ0SRhh0CMCadOPqEbJl4HtQABGQvFmC1c5l+yYPOhT+yIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQdnVp+8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQdnVp+8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF451F000E9;
	Sun, 19 Jul 2026 06:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784443428;
	bh=SLQl6/ZZUHU837YWcDE8ts1N0/0M5SUGrVQi06gSLno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UQdnVp+8dvCoRsUVrVpgGCNt39oqqv8caElyU3XF1drfpkXoXs9GJwY6VJdBZL/qe
	 x54S5jVM6fDfNwfQoKv5n4vIu5NdrH+XktoF72MO7SIwlJ+1je2FczVBTLVTe3dvsX
	 b5JvUAE5wfInIzK7x3GeP5b99QUoXQd3mOTlLugXRY+MPFLZmepafOgyxx41R2sZEp
	 ElysEV9Ib0EfOYV7f7MCMxnYxZ0ZOIJYtETqCu/pYYRYyW9TURJhoGLVLpvSnVoYZP
	 7cE0TqfY1tjfXVa3Mf+bf9qNH82IgnIpa8jZyMjyKJPXumc2vLsCJCvp7XKL2BgKln
	 kPFro7/CZcx4A==
Date: Sun, 19 Jul 2026 08:43:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add QMP PCIe multiple link-mode PHY support
Message-ID: <20260719-beautiful-pheasant-of-variation-61b8cd@quoll>
References: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>

On Fri, Jul 17, 2026 at 02:58:32AM -0700, Qiang Yu wrote:
> Hi all,
> 
> Some QMP PCIe PHY hardware blocks can be configured through a link-mode
> register into different link topologies, such as a single wide link, or
> multiple independent narrower links (e.g. x8 or x4+x4 mode on the Glymur
> PCIe3 PHY).
> 
> Earlier revisions tried to extend the existing single-instance
> phy-qcom-qmp-pcie.c driver to cover this hardware. That added a large
> amount of conditional, multi-PHY logic to a driver whose data model
> assumes one PHY per node.
> 
> This series adds a dedicated PHY provider driver,
> phy-qcom-qmp-pcie-multiphy.c:
> 
> A single PHY provider node describes the shared hardware block. A new
> "qcom,link-mode" property points at the TCSR syscon register that reports
> the active topology; the driver reads it once at probe. #phy-cells = <1>
> lets consumers pass a logical PHY index to obtain their sub-PHY. Match
> data is indexed by link mode, and each link mode has its own array of
> per-PHY config tables, so one shared provider exposes a different set of
> logical PHYs depending on the active mode. The driver inherits the PHY
> settings and link mode already programmed by UEFI, so only the no-CSR
> reset is used, and no PHY setting tables or related structures are
> defined. Each sub-PHY owns its register regions and power domain, so in a
> bifurcated mode the links are brought up, and powered independently.
> 
> The driver is implemented and validated on Glymur, and is intended to
> be extensible to other multi-mode QMP PCIe PHYs.
> 
> This series depends on a prerequisite patch by Krzysztof Kozlowski:
> https://lore.kernel.org/r/20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com

There was a v2, still not applied I think:
https://lore.kernel.org/all/20260609141608.354186-2-krzysztof.kozlowski@oss.qualcomm.com/

Best regards,
Krzysztof

