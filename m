Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF8737DEA3;
	Sat, 30 May 2026 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780140299; cv=none; b=hoCvt2O/mboPfb8q/BZq/bX73GYxzJcnRWiJjQDQW8THRCFW22g22YBVatCp8jKvnVkzSDVoTtCN4IcBo+pAFEULE1LcFGraIpNkOYu4vb2k38+5miL3RClZsup3XNWLvkHo3ADteAs04WMs+CSUoOZUEBJMVLsSlPrq/fg4BmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780140299; c=relaxed/simple;
	bh=6e2oonWr8HQqSnceUPRxbnuWDD23jLxCRGqLKBaGVJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTuKf1N9ZuPeInQlpiHylpGfIGHneT4x0qHqg+yCK7H5xt51AmplJSEBl6ZghJkACBWUUBO8mzw4jp6e8pkTNVR+D3P9FyeEa/tO2K/kc3+ts8s88N+ztHr7b3NZ2dxHSrwf0lpRcvwO0oJf/XQJKE1sJhZwS/8vH1uJsqpAwZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGDz1fQl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGDz1fQl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E741F00893;
	Sat, 30 May 2026 11:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780140298;
	bh=6e2oonWr8HQqSnceUPRxbnuWDD23jLxCRGqLKBaGVJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HGDz1fQlO+15ERDO2c6qpfbnwZ8ek8aHOA3hxzPV5Q6Hs8XqIb+UypU7jSXdWvn0H
	 95V2TkJYXcQ0Uv7WoyZpTQFObj9gHQziQYky7uF2H3bJK22j8QFvdudW1CZ2dqYa9E
	 nxsn74bCan/z+e+5t+IdEYeDEl9f1T30by5OWvXS2r8X6AZkvrgh5y6hUx1ZbeMLdq
	 5clwAntopTicNUJiS4ZAN8UgUsldjqnrlctdkPQ2ATqoa/Czl4bzF/g8rK9YRQylOW
	 zC7VeTbH1695pTPbW8Els/6bSCVrwQNNKObKUI3ROpRcCykD0iW5fwNuyvSD0q/Zbo
	 UZUJq9wl4g9oQ==
Date: Sat, 30 May 2026 13:24:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cache: qcom,llcc: Document Maili SoC
Message-ID: <20260530-lovely-strategic-ringtail-dd5eed@quoll>
References: <20260525-maili-llcc-v1-1-cdc72b98b671@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260525-maili-llcc-v1-1-cdc72b98b671@oss.qualcomm.com>

On Mon, May 25, 2026 at 12:27:29AM -0700, Jingyi Wang wrote:
> Add documentation for the Last Level Cache Controller (LLCC) bindings
> for Qualcomm Maili SoC which fallback to Hawi SoC with System Cache
> Table (SCT) programmed by firmware outside of Linux.

Why are you describing the patch contents? We see it is using fallback.
I don't understand why.

Best regards,
Krzysztof

