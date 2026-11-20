Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170603;
	b=yPDhUtqgvYq330+XX8uDLGep3jyvgXVAM+s/THEHK5x2XRkf9OCl0N4tt/90q2WCiz67
	 Z2otVTzkrdc7gtQXRBgvDpajxu3AMOdaFGqx1rASiajZiXSu1+Tg+fQLSjICGyaJwEEyL
	 Ij2LW1j75ofXhU24HR+lydn7fXnOVo0a1twLbPEo71R9N8ZeI+50WyXO8nWBqE4HnwXYw
	 mFSbeBDfNdjrqavliTA7ISWtXC0zYqeRTh3qvYLuS/KzD0c1gcmKU3UZIsLTuqedTRG/R
	 sAqFchgdE7lyDbNE/TUEQQlzHrJyIlVo0kOkYQdZpfsFV+Jmp5yVXr0b9ocdIBoz0ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170603;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=0Pn3lEK37cGLcBDrLgjiBks9/meH2vXTHJ0OG2X8Tb8=;
	b=p6YbH3V2/uFJPkYZj5RjL9N0YpwlkGkmzZBo3fTpWNyjdMQ3VoQoQXLfT2IIhBNycbgi
	 QnGrlSRhTvGlUSgbSkJtap0oQFc2RjROz2JWJ5n/f6ArSZ694c5TAdrBFw7FxwvzZsqq7
	 Y+rWnEbG+W6EwtHHPsV2CBX4/yL0v4VVXfEKqUUktieW6QK6W4XkeMCgxPcaU1PkQ/00B
	 eeJhiim+pEaUmGnYDAmXoslR+j6bIoQt5wkIcK6vHxeUCaqyfxF7QXY9HmeMnRGIVxZuu
	 XNrRQ2D7ypH2JOn0PpuLELQ4BbrXZlUOueC1qjKuCTvXVKwW2wzLtnEKpqwKv/H35Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lfD7eyQ8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F46606A326;
	Fri, 20 Nov 2026 10:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lfD7eyQ8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4871F000C0;
	Fri, 20 Nov 2026 10:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170603;
	bh=0Pn3lEK37cGLcBDrLgjiBks9/meH2vXTHJ0OG2X8Tb8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=lfD7eyQ8gP4DU8ZSUxPcn2r9/wW9TN/p6DxqGK1n8VVN12IkLR8gBfHRGsyr/V4Gn
	 DCd5sScgQhblvHV68S5Tvv/KtnTofDqF4a5PQ4lp3pHrhB5NfQU3L9fY/TE7En9r5r
	 RSBNLJRcKoUn2BJExPKNbtJU9Ko01NyqupcQK3cw4Ye2o75tvuLdu7jMhYr52/3qwm
	 L1Le+p4TdUR4b0vwsI2VyCKNgqTusA0PZHhIqsTc7j1MZVOyje2SOlcP40JhouFMCL
	 GzuTg92+I5JJ50g/S7JlDkiBqn3PnBMulEYp+3YT/nwD9UaSpljWHB8kR5J5uWpyPO
	 1ghmb7JKtL2sg==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>, Sriram Dash
 <quic_sriramd@quicinc.com>
Subject: Re: [PATCH v4 0/2] Add support for SA8255P in the
 phy-qcom-snps-femto-v2 phy driver
In-Reply-To: <av79X0gPyQDXgZwR@parshuram>
References: <20261027-phy-qcom-snps-femto-v2-8255-v4-0-874023825a63@kernel.org>
 <av79X0gPyQDXgZwR@parshuram>
Date: Fri, 20 Nov 2026 11:30:00 +0100
Message-ID: <xhkdbfqwvpzh3.fsf@mkorpers-koolstof.csb>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Nov 19, 2026 at 19:15, Vinod Koul <vkoul@kernel.org> wrote:

> On 27-10-26, 14:00, Mattijs Korpershoek wrote:
>> The Qualcomm automotive  SA8255p SoC abstracts resources such as resets,
>> clocks and regulators in firmware. The SCMI firmware exposes multiple
>> protocols to control such resources which are identified by protocol_id.
>> 
>> For this USB phy, 2 SCMI protocols are exposed by the firmware:
>> * power domain management protocol (protocol_id=0x11)
>> * performance domain management protocol (protocol_id=0x13)
>> 
>> The power domain has 2 indices: 'core' and 'transfer'.
>> * core controls the regulators, the clocks and the reset
>> * transfer only controls the clocks
>> 
>> For example, to power on/off the PHY, we should use the 'core' domain.
>> To disable data transfer and keeping power enabled, we should use the
>> 'transfer' domain.
>
> Hey, this fails on phy/next for me, can you please rebase

Indeed, the IPQ9650 support that was recently merged causes
conflicts.

I will re-submit a rebased v5 shortly.

Thanks
Mattijs

>
> -- 
> ~Vinod
