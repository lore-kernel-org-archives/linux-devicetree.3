Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544CE3033E1;
	Wed,  1 Jul 2026 19:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782935868; cv=none; b=iRPQKt1w30gwnHpmQXXRlBIoNZ8bLHE+0E+E/LjIYnrp7SQi+cVKeGI+KMFA0WyNr+oU8B64f3b0aKIiRSPUuPjDWsL/WNpfKuKSh/7zsE7lbMNoshaupMTdsMy/WqAWu5FSLdRzJSx/HIxpn0qw74maG8TgOFCQmIAAVR0ZLy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782935868; c=relaxed/simple;
	bh=CxLRqTBgzkQaCEBILNZMW3t/HVZ9PM6TBFwHKmFqjDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkjCLf4sMx4hggxlkg+evWvhzVPWfdK9C+Nm4dbTuAB3ujgygdFIHatq7iVOKz4/PWwpai7CpZcv4eVEQZOKJcYUSsWvsvMcDsFpe5iwgyffzrVWOAtK2GsP7dDxrAxWdncmOJeZckXH8g63Sfu0/uZ753fUYwGV2J7k/4t176g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yr5NZeCZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yr5NZeCZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1AD1F000E9;
	Wed,  1 Jul 2026 19:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782935866;
	bh=+arrMtj0DzOjS+9coYsG+5hWSiHSvK3/4PG3jfqqWpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yr5NZeCZXMQmA5hZ9BLTzxWyf0sMBJtUAh93FS0JWrS/CdsboO/vt63wwXZH6iFC+
	 t+X4Z8AF9n3L0gM1g9aSWugOXbgNRCsIHsT2HOnt6kELthS6/Di4isS9ASFJ7I58V8
	 QFzVFxElIhiU2jwyi69Ge1hQ1tKiv0fMN2IC4JKIKPVXUkZjMomiX7fHV8Idbd/Bc5
	 Bqmj0MBrdu9jOiOP7zZxHMaWyIg79f6mPNJJx6u/VXtbkmDHjcVEcQB560fd+bswqV
	 bK5Rrh7hdBJdmxXl/Rg+gtT/aZGOa1RE7vlIbb96TrP3w3kgBlvjV/zTm9nf1lL6BD
	 tWCJ5HRr0fRVQ==
Date: Wed, 1 Jul 2026 14:57:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH] dt-bindings: sram: qcom,imem: Narrow allowed reboot modes
Message-ID: <178293586432.1654597.1308385994723132950.robh@kernel.org>
References: <20260701105832.197036-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701105832.197036-2-krzysztof.kozlowski@oss.qualcomm.com>


On Wed, 01 Jul 2026 12:58:33 +0200, Krzysztof Kozlowski wrote:
> Only few Qualcomm IMEM devices actually provide interface for setting
> reboot modes, but top-level schema allows "reboot-mode" child for
> everyone.  Narrow this to specific compatibles.
> 
> syscon-reboot-mode schema allows arbitrary "mode-.* properties but only
> a subset actually makes sense and is valid.  Provide negative look-ahead
> pattern to disallow any modes not supported by the device, which
> tightens the binding even more.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sram/qcom,imem.yaml   | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Applied, thanks!

