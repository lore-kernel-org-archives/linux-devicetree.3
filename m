Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E06E3F8222;
	Fri, 10 Jul 2026 10:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679468; cv=none; b=C6VmxprjgQGy5eB+MQJxOhCjw6w/V2mnutUV+BnLupTN9aw0l39PeMYWNFQz8xO27sH/brKBYJdUwvo844kUryllTp+ciwUQHHZxhXqgHMh5a11KLqKNRGECSuRv2SmJ+Jz0BX+cGwf0V/Lo8nweASZArhpZwWuMnat6SxP5I6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679468; c=relaxed/simple;
	bh=ciMpBU5q5X5MpU3DMrlVl+ZF4pBUD8wSBnMQE41zaZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ws6Cu2agejA3q9G6DuoW7iDOr2kYIMtV6fyiU1rKFjvV6WlKgxWsHhHPWOs5zjBP6yge3XD5VY6Np9Z3oAceasHqn9Y8r+dH1mc/lOwDBYJirL7XxvvSV1iS3c0jP3lpeJbpKlv+oNUxO2dCT57CJUM8n3eHsJGb/qaLRuQ347Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQ5FjPsN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQ5FjPsN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24191F000E9;
	Fri, 10 Jul 2026 10:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783679465;
	bh=v9mglEQYnPs6uk3OJ3Xuvp9hCfi2X4aAytOeMWAoI7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FQ5FjPsNOieS0sERUz6obcmLz+1VTDcNw2SSm6i/1AWFQK7OGHR9gNhNNON/C2Axb
	 A13b6MhKhmHt0k4Junss+zgGFrkf96FdL4WkOuB99IRLqbjzCy/M11AVo8lRQuIr1h
	 wJ7EU8nPdIfdaJp+ynA3eY6Jvmj9nZRHGj/l8ZSE5ZbSvKOwYcSfme4Rg2URQDSSfY
	 r4uvcoDcIk4FSPwexuP9x5FfKF4llBPb6GB43OboPkJMDUSdXZ80wlSjt7PdX8+9Qs
	 JrVJk30/lIsewgOKAKb9Q0i/FIC8nYohBxCSzhfKltHOS1mzen3PjBqkrBOeul1nO7
	 dUXz3OKzePTug==
Date: Fri, 10 Jul 2026 12:31:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: mailbox: qcom-ipcc: Document Nord IPCC
Message-ID: <20260710-armored-tacky-jackal-e5edc1@quoll>
References: <20260709080848.4070338-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709080848.4070338-1-shengchao.guo@oss.qualcomm.com>

On Thu, Jul 09, 2026 at 04:08:48PM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document Inter-Processor Communication Controller on Qualcomm Nord SoC.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop qcom,ipcc fallback from commit log
> - Link to v1: https://lore.kernel.org/all/20260420040141.1247612-1-shengchao.guo@oss.qualcomm.com/
> 
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

