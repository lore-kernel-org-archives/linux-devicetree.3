Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E775C3911D5;
	Mon, 13 Jul 2026 07:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928622; cv=none; b=USh7lDDWJa3h/wkPfBGQxgroNnKZ2Hg0mfTuRf4Z2PGbBMQgBWqyJM7+u4Fg2lBR/1NaqqBrR07EFgBjucH9o8B9KKYLst0VMHj8yByM7/jVQYKFR+AwTuA3Mrd1x5AeWAfSwS7DOp8fZ+iuxYTVG9FsNwzfyaHlrg4k7z8B7f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928622; c=relaxed/simple;
	bh=rqEN8xqY8g3jdyRT6vNq8bViYzuVgfgOjRX3IiLzytM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJ+B1xQq0LNiseLsfgppnxetOVITHMMz7fW4g4lC1ztwHSkA/XV5kCWew8nZi+wSwJY2jZeqDew+DRjcbQpALXysM5qPLif+TqRVIss3WwtTMZt059206nRPzyJOYYtt6ocPNe6w9f2wYZrd7XNzY1f12yYeGDcGAsWClhBGu5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAmHdgLZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAmHdgLZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4520A1F000E9;
	Mon, 13 Jul 2026 07:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928620;
	bh=29uBqTvSP+iWBK7NSnWfm06MM3dG9i81/H55CHSTzZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZAmHdgLZ+4rk2DKO+qqI/cHQo8NO1NQHBn/evF/zyqRrgId2pIoYe16aq4n4FK5Gn
	 /HsRHAHzPhsJqpCFe5+8VTf7zMr1RDlgAXpn95UYLaqw9sn2wb//mmpPUOg5uJRuRv
	 xrx4jM5qwB8W21wfSRaVc6VdxKi7726G7EZNi6owhXxm1PRq0/FkBzB7P2Ki8TByDk
	 arySrrR+XyUR6+JXsbtI6enPaBeyqk0QpBknbjQM8pmRnEY6SpJTW3yPPtj6BxZYMW
	 EdwxOoYNz9yw8wbG/aVC1QqZ2NwVb7kDL97yrPZRpRgrEHZ6MNf/4pP5oVglESr+Nb
	 b0uw9476PFCKA==
Date: Mon, 13 Jul 2026 09:43:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oleksii Onchul <oleksiionchul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
Message-ID: <20260713-blue-guillemot-of-ampleness-acaeec@quoll>
References: <20260711184934.55701-1-oleksiionchul@gmail.com>
 <20260711184934.55701-3-oleksiionchul@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260711184934.55701-3-oleksiionchul@gmail.com>

On Sat, Jul 11, 2026 at 08:49:34PM +0200, Oleksii Onchul wrote:
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_sbu: endpoint {
> +						remote-endpoint = <&fsa4480_sbu_mux>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		cdsp_secure_heap_mem: cdsp_secure_heap@81800000 {

Underscores in node names are not allowed. Please switch to DTS coding
style (see docs).

Everywhere.


Best regards,
Krzysztof

