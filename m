Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887F63AD525;
	Fri,  7 Aug 2026 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106990; cv=none; b=UNeeo2sPp+mDw0vrPoG7daFyeWTvk2ommthripNAfJEtpHmHq03ag7Nv5WUOHtg+WZswGgUpGL2uD9LQMVasZubjeko3SbxaEOLEYMcmA+v8sh+NEuv6CJdnKNmcadIWWKC01okqh0DFyDnedtbXvBFQ1v3eZJjQNqZaXXF216I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106990; c=relaxed/simple;
	bh=/gh6kNR08AEmjlJRKpN1P1xQ1RTxw+mf91f8cxzCBrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnnq2XSWLDgBot1v3sJs36RGpIzgvmcuPP1YLl32KmEJQENelBdsvRCV2MCDKprZ6BB4bfEQ+Zj6h0pTRFrPWgxrlC10s30eGVHw75wuWNsj4EQoQBocR2dsv0qorq2MRwNYfNKjTCZoOT5fdc7e75s+i+N8XQ+YxORV5fHO83A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOUKd6gt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOUKd6gt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF0C1F000E9;
	Fri,  7 Aug 2026 12:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786106974;
	bh=O9h+F9cYLnm4e5mGGpZSCeYecPFgwWXW+nLBHJ2epqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OOUKd6gttIW0r2cAVG5JocFqGHGo+0bKDAfJgWMkKIBhraWLsPT2bHSi3laQ33lNT
	 Hta8rEcTF8VCsWxqoYRBHARYUSdI/PBT/s90DzmAOo70r8ZC08swkzlQM5yWLEcqnN
	 4vYZu2DS9uWhbKx3OwtnCzncdHWLTnINpbEl5QKh7UdwX3DVf/Cl7llaPj3za5yCGA
	 HEGX4rfozGzn3V+ph25HX3JyhyD8p6YCzD6tdmbHTf1WU8Fc80oAFI9oxz/5mbHI5M
	 0HhVVRfGPypp7mclUq+y36JcCIvWjg5vpWK6ZjRa7ySEX3q+BEI9SEi4p1f9MpodN0
	 2gJvAvuylK+RA==
Date: Fri, 7 Aug 2026 14:49:23 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com, 
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, Mika Westerberg <westeri@kernel.org>, 
	Sven Peter <sven@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3
 configuration data for Hamoa
Message-ID: <xgo7ptqqhhhuivi4ff45nfthl7efzkpp2ghnth7hdyqkpioolt@w32ygzaepm2a>
References: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
 <20260730-topic-usb4phy-v3-4-ccf0f7ea98b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730-topic-usb4phy-v3-4-ccf0f7ea98b5@oss.qualcomm.com>

On Thu, Jul 30, 2026 at 04:19:16PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add the offsets and configuration tables to support USB4 and
> Thunderbolt 3 operation on the USB4-capable PHYs found on Hamoa chips.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
