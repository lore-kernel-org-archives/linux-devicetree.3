Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028340;
	b=5rmUP79m+6VozfO1fFN1oOt5W9Xs3tx/dIscD0Aw/TFDA1TXO+TAJ1O9smxvzozkDNci
	 nYA13lyO2MUQZTnQBJqvTNEtZ4SDqdi11xT90L3U44QAcfKp3qEbvEgcpnGHdF1IBNWFv
	 5ri6z6Z2zc9FH4Qv6jt7xrS9j/uJDctekx6q7Fy31dsGMNtR214+cgSTeLi55yVdMInnz
	 4wXCSvRIg4IGwKIUjMAcDcXg0G/bXoN/4kiOqIt14CfvKuP/KDwbwst/LTpZG9V4rdqQD
	 lObktKrvWIkv+xw3H0SvMEVnVvFAl7Z5L/cjOTLbbIyflcURyNunBW2TjKMEuqOJZVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028340;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=z/in6Go4HJ3XPHRMCUvYGzPNDvTXNSyIYKavm5KQvOA=;
	b=LdTsoEv05jJZpfhl3nvIjRgR24XoBI1mgV0/9gyPXmAnx5Q0hbKtm8I+2JERHqTjH6oR
	 23/0qtBClLRzIQ1+UR5chbiV7vKoUll//64hOPrG1TMb6RStfnVys4TOroZqQYPlrYBTo
	 WabuAHRFiK8r2/57oFBx2VVVgDisBkSizzaT1JEz1N75+XDVPf64c3iUsKaVyNm3sYliG
	 Pk9e29hehQYARD1CrjHNDh7VQfxT1haC9svo63AWUF+jIEKK3QIWcp2yQxlG14E53+aSZ
	 QmsQRr0oV3qu/m45tOJP+BhS6aF4ISTK66wxg7i06qWMLEHnlRmgt1QYu3U2xnK9T/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HS0WspjP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3013606A32C;
	Wed, 18 Nov 2026 18:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HS0WspjP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B52A1F000C5;
	Wed, 18 Nov 2026 18:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795028339;
	bh=z/in6Go4HJ3XPHRMCUvYGzPNDvTXNSyIYKavm5KQvOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HS0WspjPH1WYyeQ56SzNZK0LISwQUIcp2gHZVIWc6ofAbLaHPjAjebTzVLTjZ7w6c
	 BB6sVDyk/uH9KDdd10veudeuPeAUstgQ3JKD3KymD0NlX3FBLVRC9yPEytrh8NW7Gj
	 EyZedxyDJ8Zye05oa1ZP6kPBsVsioxK0edIGb2uYjhhMNBkpbxemXVu54o4jcHw3NM
	 29t3NZ4qA1FFcNRcfkmKqwTNtUDJvZUiA+wWBNYQIgvemZ6xgwXtChiIGudoVLVy77
	 eGsFkI2JnZy/hy0Dutlaucqu5n5rHZiBMDJRn73oSQMkqVgJZolCrbR6Bw9j9ioquF
	 wTfhQiVGiifsw==
Date: Wed, 18 Nov 2026 12:58:57 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Davis <afd@ti.com>, "David S. Miller" <davem@davemloft.net>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, linux-arm-msm@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Andrew Lunn <andrew@lunn.ch>,
	Jose Abreu <joabreu@synopsys.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net-next v4 01/10] dt-bindings: net: ti,dp83867: add
 supply properties
Message-ID: <179502833706.197934.11325095223476825212.robh@kernel.org>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-1-c41902e5f2fa@oss.qualcomm.com>
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
In-Reply-To: <20261117-shikra_ethernet-v4-1-c41902e5f2fa@oss.qualcomm.com>


On Tue, 17 Nov 2026 14:15:21 +0530, Mohd Ayaan Anwar wrote:
> The DP83867 PHY has four distinct power supplies:
> 
>   VDDA2P5 -- 2.5V analog supply
>   VDD1P0  -- 1.0V digital supply
>   VDDA1P8 -- 1.8V analog supply
>   VDDIO   -- I/O supply, which can be 3.3V or 2.5V or 1.8V
> 
> The DP83867E/IS/CS datasheet (section 8.3) describes two power supply
> configurations - "two-supply" and "three-supply".
> 
>   1. Two-Supply Configuration: VDDA2P5 and VDD1P0 connected, and the
>      VDDA1P8 pins are left unconnected.
>   2. Three-Supply Configuration: VDDA2P5, VDD1P0 and VDDA1P8 are all
>      connected.
> 
> VDDIO is a separate fourth supply present in both configurations. The
> datasheet specifies that it can either be 1.8V or 2.5V or 3.3V.
> 
> Some embedded board design expose a GPIO-controlled regulator to control
> any one or more of these supplies. Therefore, document all four of the
> available supply properties.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
> v4: This patch was accidentally dropped in v3. It has been re-added
> as-is from v2.
> ---
>  Documentation/devicetree/bindings/net/ti,dp83867.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

