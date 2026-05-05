Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0711D3803C2;
	Tue,  5 May 2026 10:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978146; cv=none; b=DyROaZrcqlpr74qFG52QZc/oAUVnuV+TsGMAvUFgMTBpBfWu9z1/zdDyeFwz33mp8GM9x6Mzp0+t3RPHHGdlYXjyGV9HduL0IXKW7zvFfgqhXbuD2BvM51M+5toFOAVb3NMuYgvtB0wvMdO1kq+DgQLuqj8DmaBpqi/s80GqE/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978146; c=relaxed/simple;
	bh=G53T6k698IO9GqFBPCmmQHVG635bqS1QGM1RP+QYbao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7kp6XccsshGg0cuVqLxWq0lySfd5wkdObd9Vwedorn1UQcxKhaDuKVcdXeToIZfy/uiodgsvtDXtTYHWK0h8989+OxYk6Ry5oGxVx2HJNj3FWdMAfawePyyOmmfr27lOhRMxhptDvoyKy/M5QH0RHLozB4ETy5Z6jDsvt9+roM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZa4DeHH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZa4DeHH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C68C2BCB9;
	Tue,  5 May 2026 10:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777978145;
	bh=G53T6k698IO9GqFBPCmmQHVG635bqS1QGM1RP+QYbao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QZa4DeHHoMLKzwrFPJfvuS68yWl/lImrhBB3rMhV6H4jyP43jOt3NhgzDMrbax9BW
	 KwGBtqIDaLRVlbZaeEj6QQf+zrZEAYsYTEdj6U2Wh2frTcQHPk/y/+zIt4PCTO1moJ
	 N+FXOmkBYSiGz6Gq6DW0v0GjLDwDL5/XXMyS+Ct3XXGv6vUg7mn6x/wPpdiofPE5Ze
	 H6Niibqw+/CGWqSGsLuAoEHneZAlZS+JRNMy9joo9TvulY7VzxDI+Qu9ga13We0EpC
	 Avxln+n6j0YyK81I4cKpmjXXIKDTZL9FnR+A7yZ/js3rr3006aJ4k6AYZGsID56ZBp
	 D4BgqxoBVYLyg==
Date: Tue, 5 May 2026 12:49:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, Johan Hovold <johan+linaro@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for Shikra
Message-ID: <20260505-gifted-salamander-of-prowess-5107a6@quoll>
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
 <20260504170659.282532-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504170659.282532-3-krishna.kurapati@oss.qualcomm.com>

On Mon, May 04, 2026 at 10:36:57PM +0530, Krishna Kurapati wrote:
> Declare the USB-C QMP PHY present on the Qualcomm Shikra platform.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

