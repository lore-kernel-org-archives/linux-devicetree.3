Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13613C276E;
	Tue, 21 Jul 2026 09:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625015; cv=none; b=Zf714eUuu3FoRX37wMJTvOztRKo8QTln8McuRsK0fB76eek9lgHC7XgyLbHp8dRWuIprnwEZS/ABZbN0XHREQwkcR8C888ZJ+t9qN4ataK+LQm5atoLaJj9PF4DFnm1P38iGbIncxVk7hvhaAU7z3mItE2oYRPdr2PkpS5vUZgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625015; c=relaxed/simple;
	bh=AbX9/eVGYTA9gnhJFhwpe0A+BboR507V+aHmSmq0LaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feZjSF5LWsShj8RQKvDtHK6Sk90xgtTaQxQKVWNa5GDcYaNebwRLPkrXwjwJyXfAcDBWfyxopK5Sc/keQ5C/Bp3wnfeIsE0IrTcE3mGjrlHbL9gEnSYyi8pjexTeVC/F78OtJIhjwGW8+eU977ejTQKgdDP7qxK12Iy8wPbLj/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6ed3PP5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6ed3PP5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA43E1F00A3D;
	Tue, 21 Jul 2026 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784625013;
	bh=rL8bJ3cQ/amc8AmRZ/N2VC1IHADA2+B2SMDij5EJ2I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U6ed3PP59epEPdEhUb/EaIRcl/KQ+j0hgeAqhkELeubZpRnCIFALsy/j4+2lXaWq9
	 Qe6yCCYR6l65J5p7lrOw6XotWP25aA8YXi5uNGyfnZl211nmBHt+I3XFYb427SI0YT
	 aMfnHK+lNztgKs/2ej8+6jp4yHSUE4+nKMHbcy9TfqVxW6OX66os7/wT9WGw6tIA6W
	 tLisG9siZrLruvSwB3sH/yBUuMavfdFH8MOM3dom7+yfeTvHhWbi5uEF6Ecg1J6H1c
	 3RETI4emu6k+cVdeNXydGjHz+Yvji3Htx1CMkDV9XIPDxsyZsiMHTzcHyjPB2KT+az
	 vndoxL7h1QVag==
Date: Tue, 21 Jul 2026 11:10:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31
 eUSB2 PHY for Maili
Message-ID: <20260721-small-rat-of-competence-32d994@quoll>
References: <20260713-maili-usb-phy-v1-0-3285da11f148@oss.qualcomm.com>
 <20260713-maili-usb-phy-v1-1-3285da11f148@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713-maili-usb-phy-v1-1-3285da11f148@oss.qualcomm.com>

On Mon, Jul 13, 2026 at 06:38:28PM +0530, Krishna Kurapati wrote:
> Document the M31 eUSB2 PHY for Maili which handles the USB2 path. Use
> fallback to indicate the compatibility of the M31 eUSB2 PHY on Maili
> with that on the SM8750.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Please kindly postpone posting anything for Hawi or Maili, because there
is no DTS user available and previous Kaanapali, Glymur, Maili and Hawi
postings without DTS came with somehow easy to spot issues if DTS was
available. Contributor did not spot them even though they had DTS
internally. OTOH, I cannot spot them, because DTS is not available to me
easily. I raised this internally hoping it can be somehow solved (if
Qualcomm wants to post bindings without any users).

Best regards,
Krzysztof

