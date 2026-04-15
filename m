Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF0E3845D9;
	Wed, 15 Apr 2026 20:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776285062; cv=none; b=nPWcXtaJflMSr+rBpx6pCyVzGPjMk+UvdZgNJveNlGKiMZr2SwE2ot4AHN1XOtTRa2p/kkORkjFDnCmnOMx0ZBX3ha6YW/0jrrdPbwZismzoL5EXw62OBazDFcsvh9sO0jTnqHlrOBWr7KcSCPN063JvO0N0OyCoGOaU+UEwKPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776285062; c=relaxed/simple;
	bh=kSkVvCrypTVjGIHk24m88WQYxs0zTFu3KPl8xD6npOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4D2vjBXv4DC7CbPrHAJuEQujyTQfsib3odt8wvdvu+D/2aCAJjRk/2XoGoyQHxsEALoaF/gNN7rEpG+egHYufyS+HXcMt9Qzlu+qwP4rrdhfAQOD8l8dWriK/buWsiToBnd2A1Ju+1Vhwsl79lmuNEhqRKsiAavovIsKr1jj3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUI4YCGT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUI4YCGT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35903C19424;
	Wed, 15 Apr 2026 20:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776285062;
	bh=kSkVvCrypTVjGIHk24m88WQYxs0zTFu3KPl8xD6npOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DUI4YCGTs9joWv2MKM98Wp6WDQUOKf5KHK4Swi+oXz/UkesI/JrH/WNvnK6A4Briq
	 G1+MoPHAhqe3a4ckmSLj9TykF7vjoh6abZs2We1Lsex0VQTcof+Wnqmb6UYhEb5E7B
	 Q3p/zmg3j++wjpSeg1TIUjyujydoke9qVRIyqQ30hzha8WCHTbjkY5EVXMMOd3hIZv
	 nd+RRU0SfA770t/SV5YWPN6VLSoxVOPbCE+7qN3300Fuqwx6QAzrd0YpeBlrZhgtbf
	 caAlzmdHyfYp0JHoUpnRyEmW8KW6R1xbH/VJFo9i7Z7kyCufIYGNqv/DRoVBonC5v0
	 L45nGzZ/3nSBA==
Date: Wed, 15 Apr 2026 15:30:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Guru Das Srinagesh <linux@gurudas.dev>, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document SCM on Hawi SoC
Message-ID: <177628505923.329362.13192293937197613654.robh@kernel.org>
References: <20260401123825.589452-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401123825.589452-1-mukesh.ojha@oss.qualcomm.com>


On Wed, 01 Apr 2026 18:08:25 +0530, Mukesh Ojha wrote:
> Document SCM compatible for the Qualcomm Hawi SoC.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

