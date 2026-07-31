Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0A033B6DC;
	Fri, 31 Jul 2026 05:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785475764; cv=none; b=ejLoEMIQn7qn00zR5bG9Lgf9CAhdh/Bc5RwOmhPWaNrWKmXQU3GIOWx/gvEKc1J/3MXqbe0iLAPcqjRbvfImt0uhDHySDYQW1L8TrKXFEHrTzG/YXB0NMOPBagNxIojAIQ/5ul16mmWC9dSxTsKrd0rM53fVgwYz8+3HvwSPuyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785475764; c=relaxed/simple;
	bh=hCiZcmzP+QWKjfXVzAyI89xndJ/gG+H+xvuNDeRYZzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=peKOBm2kFXlpADHHqggr7KG1c52aT43p0Qgy/vW+bRi0DYyXhTMTi9Reu4oxuGvQU2iyKUnhq1izAHvXA/50n2fHGG3LGN1qfhIueVScWUxwZoeoSXj4aajVAZi+dIVkJMVrJOWV3zVjGW1ofaUynDuRid/cAXAEXGd5a3aEcaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gh8PYdaH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gh8PYdaH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA771F000E9;
	Fri, 31 Jul 2026 05:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785475763;
	bh=cTp49/urufGIvKtkJgllfunH0bQW3iYTFfunlJLSG+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gh8PYdaHO60tzjRGkQ2L11dX0oBfWGMugwrR4syVmRhamoWn33C94qZkZ0/Ckiw6u
	 k1W6IWfXVMn+Nfrnjao3uuWhU5yQM/d0t3Sedx2dCnUpn6b9OlWbeNfCqzZQm4jmP+
	 wdWJug4Fe8MPBdwJL3yZtgHJr3Gp9OfHyFTplb0VWzzoRBTdyqcUraQQJEmeVQNcBx
	 03JSZqhXVkXl9kgz1utF5PSseViBQlOMsUfckZYenHzL/7IBA6uyITxeRFvKEfVFBM
	 dzU9NjFOexa2dRvKnBVIYcNy72xo7WHRrPlgMzy9HQLTQRf7+Tyh3O5fv42mKp7xWj
	 VEPQ+1mGw9jEg==
Date: Fri, 31 Jul 2026 07:29:16 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 6/6] arm64: dts: qcom: mahua-crd: Add PHY supplies for
 pcie3b_phy
Message-ID: <ln6akt2ru2nomqzoxdekg5ay3ugqdemhmocxwdbufuozn2izyj@gazr6pb6z6rw>
References: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
 <20260730-glymur_linkmode_0731-v8-6-a455265ad8bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730-glymur_linkmode_0731-v8-6-a455265ad8bf@oss.qualcomm.com>

On Thu, Jul 30, 2026 at 10:13:55PM -0700, Qiang Yu wrote:
> Mahua CRD wires the dedicated PCIe3b PHY's regulator supplies through
> board-specific PMIC rails. Add the vdda-phy and vdda-pll supplies for
> &pcie3b_phy.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
