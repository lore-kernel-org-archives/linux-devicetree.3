Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98C241F7CD;
	Mon,  6 Jul 2026 12:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783340250; cv=none; b=mc7n1KyrhaLRtbGzlKCnQLT10kVIw0PWQzNEPRhUWO7rqmaOiX626Ud7pUXAHkoSSVHrzUKPxh33Ol3l0f/82GM9k9CQnUqzYgZafsa1+etc4H0Upd3xkY2azG/ho3kDhEWK5MI5+foH0dSbaDI16lvLpzeuUT/Ypl3JJBGvHgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783340250; c=relaxed/simple;
	bh=0nskR7GDIgxvdgeUxgmYubgNNNCP30wq9nwJyf5IBds=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Rx437pyhwp2DKFhxRkuQlxCqJBBt/JK/r6ZTL7mpR2DVTyLGGgFbyS9HwfpUrdAD+IoMGanmo4w62T54FTeM+ZaoL4FeZ7ZetGbDVsH7EygNREwXJp+s5UuI3dt34TqkNDBhAg3oTv0jWRCP5QN1CyMEw9AhSwY8JgMRhirTp4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blCV9upD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blCV9upD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1241F00A3A;
	Mon,  6 Jul 2026 12:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783340249;
	bh=57LMw+CKpYgHb0dlcpXBJ814pjZ9QY7mvbPGM3p69pY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=blCV9upDdpZjnrvTCKuy5ZYx9VuMfq+iO/JzlE+4EvsIbF8oG3WeoLYKdz08I/TpF
	 puGLsdzlmrg/XFY4lHVDPXsq4/+H7fRIhgzTeEdBtaFfIltyXlZDai0oSMCy6szbfh
	 7NLZoh2oVFMYz5bfdF12CJLZeCgHrDled4kMaxK+JXDS2t1T1TrAvPvQtNb7sQxx+P
	 M8gcTI3AdCYRn8Xb/8Owv4TZwhQtn2A2E6ogdq7kAwPGrxQ7cGrOzxS0CDCUKN1VHK
	 bjQDrPYm6/X5qYq1XwTzZwUIFgO70qYbIew/QtXrmgOjFLcs9s3Iu5HbJtKIIAK1vg
	 wati4ooOwa0Yg==
Message-ID: <76e21440-6ac8-4484-bada-da8e89ab086a@kernel.org>
Date: Mon, 6 Jul 2026 07:17:28 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: intel: arria10: Correct indentation
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260706101913.341540-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260706101913.341540-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/6/26 05:19, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
> ---
>   arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied!

Thanks,
Dinh
