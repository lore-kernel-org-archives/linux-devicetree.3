Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05911DE8BF;
	Mon,  8 Jun 2026 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909458; cv=none; b=NqokC8LnOw1+e2ArVwstZgFbCyA0K6uromfgH77bpYlG4ieGawZ04X5XPp3uBZ4cZSHOeNHxi9zfzsgEwaO5Z5jWuZHiTFwUd21LNUV4yQU41uTYC345j6XMWMDweJ8oCHIny57mulOuSpBrkdVU8PAKUilB9FioFvIfqhS2Fhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909458; c=relaxed/simple;
	bh=3wRF0QxJ3j99iS0To6w0zjhVZhWzcfNKvgz4aw2IFyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtlcY9EnOKnXsD+EvoFFn5J2ihzGsa00eaIFvTcZ493XCDJJsj3TLx87xOaVdWc6i6gCNIqiNwlInHUR4ET6fU5DyZVJFNiAlyT+FXjxEwzKxCvjOhHvHKynWRqaF2Vf5+CGNZ9U0c741rxjcPlmDvA+I4S4d+Im16UPcbwiaDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h18i9dEO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h18i9dEO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB931F00893;
	Mon,  8 Jun 2026 09:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780909457;
	bh=/tyfOc5RIX9dJ1onvopbjdS1gwhJ8hrCTbrl87kbOJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h18i9dEO0BHJZHXVYFRF1OgrNBsUBEygbZGDTKL6AdwNNNx7JoIKGm6hLaHSoc453
	 Uc82hWo2eGeC3XWHI+eWYv86ou7HpP0sYF4EMtXeUT3AQhJxi0dbMYt8ZEWb6S7nMG
	 23/vRhZXsOG5W7UfSwdTzBPsq3Hb6EmwbQYYmOjDt2zxq6blfs1ieAwrJgnE8TsWXA
	 o6p7Sbgma84t2QtLtPn9Y2HvbQRMS6GlKPojUHthH8HZvyXz3Un/lFJJFh07ACOA3h
	 8SUCjWOLGxHCjXfwacgrHjLzvTzgjbDxwLmfmUI8kjJsd3f5dAK5PNRy0wVGUu28e/
	 MWTFRpII/1bsw==
Date: Mon, 8 Jun 2026 11:04:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: sram: Document qcom,maili-imem
 compatible
Message-ID: <20260608-magnificent-turquoise-shrew-84bb8b@quoll>
References: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
 <20260604-maili-soc-binding-v2-2-21b5e9bd1aa5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260604-maili-soc-binding-v2-2-21b5e9bd1aa5@oss.qualcomm.com>

On Thu, Jun 04, 2026 at 10:45:45PM -0700, Jingyi Wang wrote:
> On Qualcomm Maili platform, IMEM is a block of SRAM shared across
> multiple IP blocks which can fall back to "mmio-sram". Document
> its compatible.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

