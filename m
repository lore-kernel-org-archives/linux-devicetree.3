Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F153C9457;
	Thu, 14 May 2026 12:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761564; cv=none; b=d39CkT9+5UqVfs3MWHz4DHHARmEFE3mWRrh0aVr+wKFdG8LHlU6AwSt2VWrslmxJuC7V+gCtgGqmuLRE8Y2RuCVWWAou2a7Dkn+kE5FekCMaEr5oVmUWEAPdB8atE/th1KAL0GV4FFJzQZSLXwn8y3J1MAcfG4+/1QRmTIOSM9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761564; c=relaxed/simple;
	bh=iZ8uKDIoNpv+HjQ1+/a2xrXNpPn0XoVfGfelSGI4eCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBpPDpWkSdYwHv9xaxyyS1I7GFjpefjc0uLn0VKE4/2uZOB27Nt0MhjcYBk6jEqm8Z6u8YlFxdHF7pF3Rhsv99chqZhqT4CMqIOzO4YLCimvfegNRnqRbOE+WFQ5dyQL3LblDEqDMajb+dmt7LLKPiygNVYDH13iLXCX23+2j+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QANXhIi7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QANXhIi7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBD0C2BCB3;
	Thu, 14 May 2026 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778761564;
	bh=iZ8uKDIoNpv+HjQ1+/a2xrXNpPn0XoVfGfelSGI4eCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QANXhIi72AoIAoV/GDmaj0wX/b+KFL0VZ0FfhboP0uyc9TEaixH/66YqcElh2r+sr
	 OPNXKHnu6agcWGTqA6xVRv01tgG9+wlqXvKnbTIx3UGw2iYnKfAU5xz/4VOouPcvMu
	 bqTYuM1HbjRwNZ976nVNEXWE3UHBVQlSvqPny9qr8dtFDOfW2apNpDn2OxuxlWMgCk
	 KFwtYlzAnH20+ShJb+npdgkScVhLTfm9Xek8ZiPFMwzCRZnoZJwzMykywFny2TjSqy
	 gd3Edtk12recPz7sRB19mPsv+6SYyOeCtdHrlhU97PRqR4mtRdC6FT7ZMQOJ0d+zUf
	 T+P+05UwgMXSQ==
Date: Thu, 14 May 2026 14:26:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Hamamdjian <azkali.limited@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8550: add labels for thermal
 zones
Message-ID: <20260514-crafty-quirky-manatee-ff28ec@quoll>
References: <20260511-pocketds-v2-0-299dd4247f2f@gmail.com>
 <20260511-pocketds-v2-2-299dd4247f2f@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511-pocketds-v2-2-299dd4247f2f@gmail.com>

On Mon, May 11, 2026 at 06:33:54PM +0700, Alexandre Hamamdjian wrote:
> Add labels for the cpuss, cpu and gpuss thermal zones so board files
> can extend them with trip points and cooling maps through the &label
> override syntax, instead of redeclaring the zones by path.

Dead code if there is no user. You need a user of that labels in the
same patch.

Best regards,
Krzysztof

