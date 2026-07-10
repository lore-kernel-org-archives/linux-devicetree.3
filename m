Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D993AE707;
	Fri, 10 Jul 2026 07:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783667086; cv=none; b=UE4oOmqjexRe/JIwYMpnZNYrCnHZGLcqCb776JfQxPS7ibRbpri97/nd4qxDBEFE6D1lQj4QAEUuXSTgmAJ/URFIrerlxXykFP371bnGmzYRtioRdG0BbhJxOgLf1Ow4hWdiE7yTwNKNCmaO30ckgTf7/3cWZ8RjiiOCaHrpQDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783667086; c=relaxed/simple;
	bh=lQ2ZzUts34us+bAoMg5eTkOA7HMBX+S+UXDkyeTQdGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFqIvslkoe/pCPmVx64xOLkdIWknbFjEEKw+4G2aTiGEZ5QScPG5d2MtJhytrES+o3kWtKRcSXTlxDHNMlYVsqGvacJe8g4MtyrIdRnEHJjpLUrEKOD3EIxX7y0KoBx9Wx/e9hu4MyFYx203HH+HdvX6V4F/c/gtmsua7rPCdpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSSjlpsT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSSjlpsT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39DF51F000E9;
	Fri, 10 Jul 2026 07:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783667085;
	bh=+CYjmrJCtVa9SP3etbvUrkNcDJSC4r6lAgFkVU2BoWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gSSjlpsTiZcnyb+iYK0cSqNfVFyxqcSErMk+KMn3ZgScy0A06Xs0FYpUDUo2ArM7I
	 KN53zDuGxjJqdotqnAzXKcBExzjom16E1x2TowEmsv/085SVyjdghHSkgdJ8/Wx0Z3
	 xObwRhsKqs6UKVx5iYbVlccG4+nvYsmhdoNwnIR9hogHtIEAduy6G7KymuCgqR5znA
	 ohIRhhp/ZntgWVdo8xjM43Ph1FIcaMhfpH+Opeaz1cFnl9JURLh1AevvEsYsdbuf6d
	 Le/R6t7NUNUgYlSJeH2PdwEQI36qQcv6cpMk0S1DJr0eni7UDap4VOj79o6TdXRxxe
	 6dizOOIpPTWaw==
Date: Fri, 10 Jul 2026 09:04:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/7] dt-bindings: arm: qcom: Document Nord IQ10 RRD
 board
Message-ID: <20260710-adept-lemming-of-superiority-67e928@quoll>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
 <20260709132013.4096850-7-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709132013.4096850-7-shengchao.guo@oss.qualcomm.com>

On Thu, Jul 09, 2026 at 09:20:12PM +0800, Shawn Guo wrote:
> Qualcomm Dragonwing IQ10 Robotics Reference Design (RRD) board is built
> on Nord Embedded variant. Document the board.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

