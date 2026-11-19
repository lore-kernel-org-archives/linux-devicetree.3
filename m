Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095907;
	b=uZDPMKz5hJd3ZKyFp8kacsD9qeU+/nWu+usqbhud0MoQSCOnJfq8pW3oDllN6fjNwCYb
	 dlyignGjwtgLKCmQDnDQUcolcJ4pQVcS9We7ircHEwh78hJwRD0XVGu20hX7c2nIC1bDy
	 sgEQEwlkmma1G4FMjQPlchHp+rRtg4tN8aNt7aEwcFpxHgd6uV45ZtgtIZ6mufYB91Srt
	 ARwenvtiehyryDxxWCWPzSa/XpfAh7gTAO32tdT62akekHwWfGUgPhrqC9o1QCWsPOV6r
	 neQgErxQyO8OUszoNkDd9j+b6fJ377oGEM0ZkShGXUF4Dwv7OK+2590AbCzLZH1Lgyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095907;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=InDwd5ord1uO7JbO8/j2hh0MYhOZynVPTKgcMtQwGnM=;
	b=P/ihMUrLdI/i4Qof3ppeWMdxk7dQNOno8p4yZjUMqispO8TfXFLAfz2Dbi/g86BB5ibu
	 XMCPuEiF87sZPpJph7DQPK+OPwbbp1i2VEAcOriiO3mBbsSjlhn2yB5Ee1pPT8bniYiSH
	 vcHP2/Xdi10j3j5esTwRx8HZtlG9JG3HnVfO2jr5CWceamiFF0Nt90fPKgReNF4xb9ZeY
	 +k1coeBxIDvphbNoRD2QElAiX7eKQU5C8jZ3m75hYfC0o3xUsxKEc3/zYg9QOq337+iUO
	 YBVaTbL+LQwC/C1RBK3h1ZQyWhYFZXP4PWL9o5HImv9dx9QVnuXTwiTVTAgn9p+mdgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HkQRt1Cy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38786606A32C;
	Thu, 19 Nov 2026 13:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HkQRt1Cy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2BD1F000C6;
	Thu, 19 Nov 2026 13:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095906;
	bh=InDwd5ord1uO7JbO8/j2hh0MYhOZynVPTKgcMtQwGnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HkQRt1CyUzzLeeQiWK+I8pHR3mpKF/2lBOk7R9mTATNCzRbq/H2ZS0aI8cfolga2c
	 D5nM0vfwdB4jo2fazdkaT0yVN5HV2BooIPx3XKiy4h+RS+HJhMRlWyTdb1ED/dHcSr
	 u3pZkKCmVCtGJl+CsDVOixMivK5Pvdg38PvE6TnX9/Q683bzuHVlGxC/r/joxCAvpF
	 IqeGGaFp7V4w+0yqJhBHj6v5ZNHtygYs+zVhijAt17KWb0FTxicTNpmTusLgyRFMo6
	 9pK+ZJxT5lKz+8RdMBT+zN/n/QySOuZH3f7Bdq5DcuUQ+/1kOuHcv/0cDHSHT/Q+lp
	 LRdIhhQjkZQZA==
Date: Thu, 19 Nov 2026 19:15:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sriram Dash <quic_sriramd@quicinc.com>
Subject: Re: [PATCH v4 0/2] Add support for SA8255P in the
 phy-qcom-snps-femto-v2 phy driver
Message-ID: <av79X0gPyQDXgZwR@parshuram>
References: <20261027-phy-qcom-snps-femto-v2-8255-v4-0-874023825a63@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-phy-qcom-snps-femto-v2-8255-v4-0-874023825a63@kernel.org>

On 27-10-26, 14:00, Mattijs Korpershoek wrote:
> The Qualcomm automotive  SA8255p SoC abstracts resources such as resets,
> clocks and regulators in firmware. The SCMI firmware exposes multiple
> protocols to control such resources which are identified by protocol_id.
> 
> For this USB phy, 2 SCMI protocols are exposed by the firmware:
> * power domain management protocol (protocol_id=0x11)
> * performance domain management protocol (protocol_id=0x13)
> 
> The power domain has 2 indices: 'core' and 'transfer'.
> * core controls the regulators, the clocks and the reset
> * transfer only controls the clocks
> 
> For example, to power on/off the PHY, we should use the 'core' domain.
> To disable data transfer and keeping power enabled, we should use the
> 'transfer' domain.

Hey, this fails on phy/next for me, can you please rebase

-- 
~Vinod
