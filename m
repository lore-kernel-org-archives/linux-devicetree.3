Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90654386C15;
	Wed,  8 Jul 2026 13:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518638; cv=none; b=bps/yclenLZ1J5OfqJlywQajtA/UpyMwld0wUg9DVPhlH0W+I3xfsh9BVUsFgtpc1P07IzyEMA/r6fw6L8y7kpII8rZ8zvYCwD60Z5FoLCFPELvw+4lBGCSNV5zqLeuP2nCaFdPbNeuzC2037R9dWB0rH47//E388HHNmEYlv9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518638; c=relaxed/simple;
	bh=LXYz2L+NSP72jASj7HPkEG+KtiHTHwEQ2vwPdBAnCE8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=u7KH68G1uLIp1DHPMzP0p8VnfvoycnrIjk1C/V65UzzSFlDXMaOj6P8xXv/wUqygJp0CME+UPxd6IIkDfPK1clGzJQrtoAMqw42d1cS1CH/jhLkf+wT1TRL8SMoIQrXSkKyTYOZRutO8ANmEkzxd0uwQ1LJoLrnzv+yy7qa6sf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBxqDmtD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBxqDmtD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471FD1F000E9;
	Wed,  8 Jul 2026 13:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783518635;
	bh=ry+WDaoHwcTLLbbLYDEr/m3NYf9GMyFrpzOzll7j1hY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=LBxqDmtDtuFpHhRocv4gIUDl08ZoVWQkXSz19cBOPubK2KBre9an5LC6NDw3TL4yf
	 J3+THJZEq7YDD08W0jAkfKFrh6i54p4w2XVHuutcZt+SO9JgWHdpycPc3HEi/aDNpw
	 RVZExTFWgvAUQ+07V37NDEKzQ5dnfK1DqflfLaNs2LusgGlxDMZEMHt5snGhlI8wgt
	 RPNsvAYXDdnhiVggEAC8aIwV5XZAw+z/K3kOlv6qS46m10UP1jL6Up/r7smHZ/EVRf
	 dRkGlIZ5cEGXXcnl8qQoJrlzzKL2orMiRt/WBTtPdMPcx3Gnpvs7sBESSbBt/njdFu
	 O6fNdqfqb4fvw==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sriram Dash <quic_sriramd@quicinc.com>,
 Shazad Hussain <quic_shazhuss@quicinc.com>
Subject: Re: [PATCH 2/2] phy: qcom: qmp-usb: Add support for SA8255P
In-Reply-To: <5ucpcgiwlhbhn4m63gydrioyznpxnfq7rgdxf637qubikt3gqp@kivbak76lvtp>
References: <20260708-phy-qcom-qmp-usb-8255-v1-0-8d852a9535db@kernel.org>
 <20260708-phy-qcom-qmp-usb-8255-v1-2-8d852a9535db@kernel.org>
 <5ucpcgiwlhbhn4m63gydrioyznpxnfq7rgdxf637qubikt3gqp@kivbak76lvtp>
Date: Wed, 08 Jul 2026 15:50:33 +0200
Message-ID: <87zf01615i.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jul 08, 2026 at 16:20, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:

> On Wed, Jul 08, 2026 at 02:54:21PM +0200, Mattijs Korpershoek wrote:
>> From: Sriram Dash <quic_sriramd@quicinc.com>
>> 
>> The Qualcomm automotive SA8255p SoC relies on firmware to configure
>> platform resources, including clocks, interconnects and TLMM.
>> The driver requests resources operations over SCMI using power protocols.
>> 
>> The SCMI power protocol enables or disables resources like clocks,
>> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
>> such as resume/suspend, to control power on/off.
>> 
>> Power domain "usb_core" controls the GDSC, resets, and TLMM (GPIOs)
>> whereas power domain "usb_transfer" controls clocks and interconnects.
>> 
>> In this variant, two disjoint sets of resources are modeled against
>> the power domain suppliers which can be turned on/off to achieve modeled
>> device states. Two modeled low power states d1 and d3 are supported.
>> 
>> transition: d0 <--> d3  :: both core and transfer suppliers
>> transition: d0 <--> d1  :: only transfer supplier
>
> Sashiko warns about PM resource leaks and those warnings seems legit.

Yes, I will double check all the comments and reply to the sashiko
review (and probably spin a v2)

>
>> 
>> Signed-off-by: Sriram Dash <quic_sriramd@quicinc.com>
>> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 175 ++++++++++++++++++++++++++++----
>>  1 file changed, 155 insertions(+), 20 deletions(-)
>> 
>
> -- 
> With best wishes
> Dmitry
