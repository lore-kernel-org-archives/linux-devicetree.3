Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D015B2F0680;
	Tue, 21 Jul 2026 06:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616149; cv=none; b=LYghOvonmKhC7koyVvDeErBnIjzJm1cTpTAluU7kUltecjUxP0x+6bhJuOS9w8fJS9mJhDTFg86jjuNOU6/0cDnnrC0rnZYcbEs8topukUk99dKD1GzxNGPxoy38nEbC7IVg/03tfunk4/RYXR1v+9KnTMDTnrFo12hb2mVNavI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616149; c=relaxed/simple;
	bh=KSlltNv5by+0N7BbHEEgVaa4PEjM72FzIGNA55Td04o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgBWeFpe35x2/h26max8xERjWlgO7gEj+PTOdvsJ3PiHKtqdnXuXix2WLoLHCkeW9vatgjboxL3G495ejdQO5isgFfMl1kXRhkU/4CnMAgdg6o1+kQsAzH+4RY6CM8XTagYFdHMNfaYbxhSNWs74zLd6bz6xNL9G5UifCgEP+bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wy3BsUFR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wy3BsUFR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC5A1F000E9;
	Tue, 21 Jul 2026 06:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784616148;
	bh=8CbiBV5aOWrj46L9ZurcKtFkuOur0vzKkTHkO/3S6oQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wy3BsUFREu+NHQ2PkiX1/f8b+FzHxsP5EUQnPQgBD9pVxDq+aXc0f4mwliH8oI3Ec
	 kmnPjn3BB7bAZ3p5HdCk66gU6P0BE1UbD2wG9nMLD7YvwKXx8i/L17E7I1vjVQKIoG
	 +rgYFNvgvSDsjVJehQQDiPPAbUvjEi30wLmWJsQLNfNkuehTQVRHDHtabvfXwVB3al
	 6Q3Pl1G2HoWjCojsT2g8xoMdh9aN0q+pBi62ByDKbYiOAYh7l0g+JmNRyyILzb/aED
	 4qJH1XPQSGXc0XQfI/JxnGRh+E9qHw2/IgU0r/TeW8CLbIWNBCyzsb9DEgTCf5T6FV
	 MfU+fJSBnH4cA==
Date: Tue, 21 Jul 2026 08:42:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/4] dt-bindings: phy: qcs615-qmp-usb3dp: Add support
 for Shikra SoC
Message-ID: <20260721-sloppy-subtle-perch-dd921b@quoll>
References: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
 <20260712-usb-shikra-phy-v6-v6-2-1b3e51bf1541@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260712-usb-shikra-phy-v6-v6-2-1b3e51bf1541@oss.qualcomm.com>

On Sun, Jul 12, 2026 at 08:58:35PM +0530, Krishna Kurapati wrote:
> Declare the USB-C QMP PHY present on the Qualcomm Shikra SoC. Shikra uses
> 3 resets to be programmed before initialising the phy. As per the hardware
> documentation, the third reset is PHY_PRIM_SP0_BCR, hence naming it "phy".
> 
> Also, add remote endpoints and orientation switch support for getting
> Type-C orientation information.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 49 +++++++++++++++++++++-
>  1 file changed, 48 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

