Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989DD221F39;
	Tue, 18 Aug 2026 20:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787083398; cv=none; b=UrS4wR27nwEYYQ/cBO7COk/xxzMHSiJANDKRFXmYBLJ3haLWHqhoXLdr/cFX2b3bTDf31QFAL95Z/SDE2YtK0tjXKVBrUkX1sHH7x/ulJDdh+9LXcZpwV1GU2xUxrXBvs/xiIXN6L5ievQmB/2LIRItp+6QQ9PEOnHuExvgTx+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787083398; c=relaxed/simple;
	bh=LLqKwSU22a0F8s0AEJkjV/olobZ1oLQ12zTpSHZov0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LuVatzz0XD1S95VhmqzAmvdkqRvY3JNo7VK9TGbD+BKNVwWA/fSwSq6kcrdiUtZ3zsrcCPysWgn//Uh0WkGaNCn2T2BV4gFU6AG1nvL2jeYOMzyQwv9YNEeLHwdxmS/b2xL+pSOp0ss4JU66ocA2PX3RDvF7piHQlRIkMaPbd9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKY9G3wS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKY9G3wS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3EB41F000E9;
	Tue, 18 Aug 2026 20:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787083396;
	bh=GsX9hemoRjSB2DVfO8nTfSW0kYKsPEsBErkrqEuSehg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OKY9G3wSBXFEhNGbVI7Oun7C/Vzo6Ja5lJw9khZlPQ9Rx/nW28CcI1Mx1VdhDpflM
	 3HkM2ApQEhUZrfeMVvKkcPebmNC2PmexmZb5jFYJsDjRLk7kK9nBgBwrMgZg8Esz94
	 UQmBXATvNobIGK4So9Svj4aW0zgRlqoSXV5OBgjjTjrjkXuqUms/xvEQYUJ+BJdXI/
	 x4DKmi3WMFGpjrmB50t1ZIV+vhJSAYwfXROEpWeHjp4mOnuSrhKbSELsJT9pU3e841
	 Z5Ew4s2N6Pw/7Jg7xw3tUV9guK40atSNOi9eLkelP1vduE5CCI1x0av3jHMlVhfFaj
	 8AOYM30Pl5RJg==
Date: Tue, 18 Aug 2026 22:03:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom,m31-eusb2-phy: Document
 M31 eUSB2 PHY for Maili
Message-ID: <20260818-elfish-girlish-panther-4a28af@quoll>
References: <20260817-maili-usb-v2-0-97d7317f64b3@oss.qualcomm.com>
 <20260817-maili-usb-v2-1-97d7317f64b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817-maili-usb-v2-1-97d7317f64b3@oss.qualcomm.com>

On Mon, Aug 17, 2026 at 11:16:05PM -0700, Jingyi Wang wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Document the M31 eUSB2 PHY for Maili which handles the USB2 path. Use
> fallback to indicate the compatibility of the M31 eUSB2 PHY on Maili
> with that on the SM8750.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

