Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C933B3C1B;
	Fri,  7 Aug 2026 05:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786078822; cv=none; b=RdIphajXdYI9Yz/c4rem0qp7nYWtZnjyMCaEdrhx7BMaPuQuOZT42OEXrhbEspcW989Rdclffmw/XkhCRIPQ7yd1lFomU83h1DrKLYojKQ91djVA/hgwBTUU8jd9XfoFD0dk04XbrQ6KhLswdYQCf75Rprp8allDWEis18QL5jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786078822; c=relaxed/simple;
	bh=h/cSfziJ7Etc+O2MjXGaY1B2O98aVIDqVTpo6Yb7x4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+AcQbXQcxFRmxAt4/W7DHu5LCv2wDsALHa60k1qcdw+Aytxgys59kpDd2R3byoT8ueG4sgbFm63l3BRNw9O+B/nIXlR2AvcGJtLfb3Ex+koyj8qH5TjMirpY8JrByZWAxOj2jzLD3zOdJdNuelPKAV3qfeH1UtvNqDlp+kLaSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+22CknR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+22CknR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA95D1F000E9;
	Fri,  7 Aug 2026 05:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786078814;
	bh=g+D3AJQFvhPRzkoa0tC39NTBMn/lH/wnQoRYJfVrN6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c+22CknR52MxQ5QmipW9AJNvWJIzeZdLGQCZLx6zwxqeuCX5PKIkyExW9XMCx6eS5
	 kkJW7HMJjTwxIsA/8W6bi0t6KmrQvTVIXnj5X7sAN2FqiK5afxmDaHfZJA2SkgYrXz
	 fpleSr2++RNZvTBkaYOvMRgbwvfy5lMk+Z/TZouyTfmtGF2HNQO0qxmOU3kqza/GU1
	 H7JGB595GwmKjuZ+2xo1AN5BBiLIAE9uzaIsYTxjdpq5nr4ffSQ6Ll5dMlZEylCIN7
	 fHnse4Osb0H9v47evb60F/x3EV4MejEDkogg/96oi8znWlINaLlUU1Ku6N0fPXFJnI
	 dKi0sxURLxtyg==
Date: Fri, 7 Aug 2026 06:59:53 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Wasim Nazir <wasim.nazir@oss.qualcomm.com>, 
	Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>, Umang Chheda <umang.chheda@oss.qualcomm.com>, 
	Yijie Yang <quic_yijiyang@quicinc.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Fix regulator voting for the Qualcomm SGMII
 SerDes PHY
Message-ID: <efu6xalzkpim3cu2r4mkzksseviqrxqmpmblm24r3ip6bwt3dh@nqntulmbkgwa>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>

On Tue, Aug 04, 2026 at 12:57:56AM +0530, Mohd Ayaan Anwar wrote:
> This is a long overdue v2 of the original patch series which tried to
> address a SerDes power-up failure observed on the QCS8300 Ride board
> using the phy-qcom-sgmii-eth driver. After going through a rabbit hole
> of hardware schematics and power data, I now have a fuller picture of
> this IP.
> 
> The Qualcomm SGMII SerDes PHY (used in Lemans and Monaco SoCs) is
> powered by two voltage rails. The schematics call them vdda-0p9 and
> vdda-1p2, so that's what we follow in the series. Additionally, the
> 0.9V regulator draws a peak current of 46 mA and the 1.2V regulator
> draws a peak current of 15 mA.
> 
> If both rails are not enabled, we see the original issue where the
> SerDes calibration times out:
> 
>   qcom-dwmac-sgmii-phy 8909000.phy: QSERDES_COM_C_READY_STATUS timed-out
>   qcom-ethqos 23040000.ethernet eth0: __stmmac_open: Serdes powerup failed
> 
> Currently, the DT nodes across affected boards incorrectly describe
> only a single regulator via the generic 'phy-supply' property (and in
> some cases point to the wrong rail entirely). Moreover, the driver does
> not set the proper current loads and just relies on an enable vote.
> 
> This series corrects this by:
> 
>   1. Fixing the DT binding to describe both named supplies.
>   2. Fixing all affected board DTS to use the correct vdda-0p9-supply
>      and vdda-1p2-supply properties.
>   3. Adding bulk regulator support to the PHY driver so it enables both
>      supplies and sets the proper current loads.
> 
> The patches are sequenced to maintain bisectability. With the driver
> change, the PHY framework will continue to vote for the regulator
> described by 'phy-supply'. The DT changes which follow then remove
> 'phy-supply' in favour of 'vdda-0p9' and 'vdda-1p2'.
> 
> Testing:
> This series was tested on the following Lemans and Monaco based boards.
>   1. Lemans IQ-9075 EVK with the IFP+ Mezzanine attach (dual GMAC +
>  QCOM SGMII SerDes + QCA8081 PHY)
>   2. Lemans QCS9100 Ride (dual GMAC + QCOM SGMII SerDes + AQR115C PHY)
>   3. Monaco IQ-8275 EVK (single GMAC + QCOM SGMII SerDes + QCA8081 PHY)
>   4. Monaco QCS8300 Ride (dual GMAC + QCOM SGMII SerDes + AQR115C PHY)
> To conclusively test the new regulator voting, I tested builds with all
> the other consumers of the regulators disabled from the DTS to ensure
> that the phy-qcom-sgmii-eth driver held the only vote.
> 
> Changes since v1:
>   - Fixed the DT bindings to describe the actual SerDes PHY hardware,
>     which actually has two supplies rather than only one - Krzysztof.
>   - Use regulator_bulk_* APIs to properly set the current loads of the
>     two supplies - Konrad.
>   - Fixed Lemans board DTS files that incorrectly voted for vreg_l5a;
>     the correct rails per the power diagram are vreg_l4a (0.9V) and
>     vreg_l1c (1.2V).
>   - Link to v1: https://lore.kernel.org/linux-arm-msm/20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com/T/#m0b93e06a0d6a09c4c1b65c500b475958ed5e288d.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
