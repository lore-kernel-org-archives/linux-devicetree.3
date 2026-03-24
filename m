Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7599338C43E;
	Tue, 24 Mar 2026 08:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774342243; cv=none; b=dw3O+C6j6IviBu/Y+1johRrQbBB1wADndy+h+cjyY/yFYA7sCHD1Q4yTpfeP2j9PfljbjjQhbuo4Az1PCTTX6MzeXP5cjANBa0yDFF9D4TiQk1JQTf0wdPzFvoNN/i8CXvKgUZpxkoXrUVn8pmpyW5mA+oQUz30qeK2Y+YgL19s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774342243; c=relaxed/simple;
	bh=6NDwqChItr9I9V5VVdlI/K+lSkUvjrUbbV2g12vnlR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQKBY3VbLCyZSy75Os2/1Y3A2T6dc+QgHi491gTMWQ2mmnibyvPrQtMzunrHZgJQyuJDbW8Mkt5IioqxE3vgmDhywegKGT2bleMHt6GuvkbV+wkvJs1bNq2FU/celcAE0BsL1QJR2bR6lGkHQNM7EHAgnOjdrFb9G4A2X0rYgIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VH8el5/p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VH8el5/p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959D5C19424;
	Tue, 24 Mar 2026 08:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774342243;
	bh=6NDwqChItr9I9V5VVdlI/K+lSkUvjrUbbV2g12vnlR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VH8el5/paBj+A8+DFixIBGwtXpOrEUrIR+t+Ru+2UCiln5jQ9fbSD9ryPh4ydPYra
	 DWU38Il3UWhF3Ct/O7phmHHrNL3uuM0g+2bIaNn+mi89Su4vzZWS/WHPxUK/KBGSNc
	 p0pddDoQjz3RJCHj/TxkDwECYXwcneBIb7Ywfw8ax1MzZmN+ZldgDTqUGcmpwpCZtt
	 3Dqmw4xaPINKnbFp9QUdEuxjJLQU2a19A/jEFHznPAMwDeJwhm/+4b9LfwNp/CgDWQ
	 HIY3kT/ybrQeJe/gzjy0a7P8BG2wEDZTcD5ZCcBl6fdKy9mAbPNRGHDG/CXsLH6oe5
	 6XC+5hEoi+QHA==
Date: Tue, 24 Mar 2026 09:50:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] dt-bindings: arm: qcom: Add AYN QCS8550 Devices
Message-ID: <20260324-authentic-macho-coati-55cfb3@quoll>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-2-33a8ac3d53fa@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323-ayn-qcs8550-v4-2-33a8ac3d53fa@gmail.com>

On Mon, Mar 23, 2026 at 11:27:44AM -0500, Aaron Kling wrote:
> Namely:
> * Odin 2
> * Odin 2 Mini
> * Odin 2 Portal
> * Thor
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

