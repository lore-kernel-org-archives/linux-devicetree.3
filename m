Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543B73B4E9A;
	Mon,  8 Jun 2026 09:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910407; cv=none; b=C1DiXgPinuinZzKJcOZ+j711ISyYymMk+xN9s8yfiEvUxLUUlpkjj3fgAEElZMspo+XzEDE+jw8BC+TDgZCL2xA7/G1rVYiu/63C+Sg8lXalfLic/v/JSWuKN99yquGcdQpkdAmVTHu9WfSThtqxDt+eZ8ihXp30VuaEoHR9Gas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910407; c=relaxed/simple;
	bh=aTc//FB64ogpv8x7yoqI2Kbc5qzMmY0zx52lOrL09eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pld3tLUz+FzlIfZN+0HuDHTiOyhOw6gAMBA+OhT9V+4QZN1EK3ivjRbc2F8SViy+Exkc9uhsmOiRWdh5egpDcE4uNYzl96sX4qXNbMmN9LfEpljp9IaTChARUevdvHGalsP2Vmhw5yBA9MxyMNsIreb2U2IXEr5xb0btVx10Wc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRCjIg8D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRCjIg8D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A4D1F00898;
	Mon,  8 Jun 2026 09:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780910406;
	bh=/jiNPI3abl6/ljmC68NsVIoX7ChLV/DruJybBPaUlLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VRCjIg8DKi2vW5/zU4/c+N8rvZqkfwUicaQERR7MBRxLONe4qWVxBsEn7XQG7HNyt
	 p/e0bcGwK4jQyQwg8seZpDGOHaL1NTk0TEpaQrQi1bL6cpkt3NxEz+VKum6dVTmgB1
	 PFEQZeN+7zIfs6+PDcNzL6I26GQBQcBXh9kN1dqJmb51AzojUSYYXIYPkTAPwbjK40
	 AAB7QytVbE0zxvsQiwh7VHEfrt5fCrOuL2b1/+5AKCuDqwc1mOV8xeNxlarKSZyeOs
	 kCJ+p0Whmh7iaelFRAsqioirQboi3ASg2vle5s2d9AnuerIrkRjV5jMkN9p4JzhSUg
	 2VzyTjCJFDNFQ==
Date: Mon, 8 Jun 2026 11:20:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: soc: qcom,aoss-qmp: Document the
 Maili AOSS side channel
Message-ID: <20260608-elite-quirky-manticore-163a8e@quoll>
References: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
 <20260604-maili-soc-binding-v2-3-21b5e9bd1aa5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260604-maili-soc-binding-v2-3-21b5e9bd1aa5@oss.qualcomm.com>

On Thu, Jun 04, 2026 at 10:45:46PM -0700, Jingyi Wang wrote:
> From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> 
> Document the Always-on Subsystem side channel on Qualcomm Maili SoC.
> 
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

