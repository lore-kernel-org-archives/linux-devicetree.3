Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1993955C9;
	Mon,  3 Aug 2026 06:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739869; cv=none; b=ibmudAb488AHar4/Qg6eyaLpwjRahOBk35qRfiGoYF/LUXtO0rIZSZpQ8tz6PvVLHPELtiRc8W1n9YYckeRbnzZ4aojPXknBo9axvC42qQs0v61XXyhk69VBrb9TpF8fT67a8NlUUZdk0ZWiOW3enjjtpM/26rTLlbevTJ2nR+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739869; c=relaxed/simple;
	bh=QgSo1AlOUR8vwderFfYohAeNCTnG05b2VM4/u/Jc/JY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFnb6FdJjLdEVcKHKNVdT0uC5FfTH4itMtgV8/PVqQ8UZha3WiQioin/pSLXuq6YC1wYkAOukGI3NmkyAuviaVo9QDZDH9MrvxWxHD90Ko/5B8QprUQjvx5JlfTk7/697VFTIuR85RR8UFZVSeDuJKbDPdGXDfhqLZLbvOtoSdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqDUPP7A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqDUPP7A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92A11F000E9;
	Mon,  3 Aug 2026 06:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785739867;
	bh=1rDfLby4Mp8kqwc2uwEf0aYXYwO/5jbnRK2d2iKT5DY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SqDUPP7AoORXd8Zpb/v9SMzgqZGJbV+TyPvn65cJ+edBxsorlqposI8kOKnnBUp4y
	 Q+SX8g1DjND/k3vGDX/MZoevVT7cY02jZWyG9Y3LtCMAzbaZu9FG/0I7HQTV7OCciN
	 S6QPIBB3iJ3hYDtZwAlkGWMz8Hx9HlEAKEw9+PaFN+thgFcLqm5pMKiiFsVNpT72C2
	 vwKslqRQoU1KqNXXsqX/bhLGakIMUTCRb0vN0dMiYsnhxe/HBgeDE83VKpqFwUjryf
	 MNSUREMzvwZrIWDzN0rOr+VEbjc1UawhWXS+y48aEYcRtKS64vsdfrrIf1KQC/OiTi
	 ZbFjwbIRoY3DQ==
Date: Mon, 3 Aug 2026 08:50:56 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/2] Add DT Support for USB on Shikra
Message-ID: <y7uc4v4pwjzte6cb3l6lmlhpuzb4bjczswejwv5f3kcbjhcocq@tkna2mkqmhcv>
References: <20260729-shikra-usb-v6-dt-v6-0-72ffb4796a08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729-shikra-usb-v6-dt-v6-0-72ffb4796a08@oss.qualcomm.com>

On Wed, Jul 29, 2026 at 08:54:03PM +0530, Krishna Kurapati wrote:
> Shikra has two USB controllers. Adding both USB controllers support
> in device mode in this series.
> 

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
