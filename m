Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04083FD147
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 18:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779389867; cv=none; b=Hzr90u1N2YpiW4eibDx7gP5hUnuFAfLx3X3FJMfnTMkINpYISXhE0IZ4OUGQvC6GRdN8p+nINan8IrSmNgcfYp0KTwVWdNwFd47ml/dcHNa5R+Xfh6Aeh6MdsVT3PTnkcl1MT0ZcUjBvPlQLrqmVxnrwoDu6jrzCH4GPCTbI5L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779389867; c=relaxed/simple;
	bh=B3w0i9V5bl97JOa2L1hL8c+h5c7hpZVhnrbgLFPscKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UxQhLidMGCltntFKW8e2ihLgaghwpGxQPIXId1vH6zDy8Af0rniNLi81Ow5bmacYAmvzMHx5jwqw4N+0wduzQdsmEVpRYp6liAEaHxCVkXu9jte8URuxUGpJGRTjm/DnjzsDTcwMOWcwcLrqAVJn087h8G2ECXX79pDnMMOasYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Eaq5bZTj; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Eaq5bZTj"
Message-ID: <094b4042-4b5c-4846-bca8-b55a252e2171@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1779389853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YtpSANnkp2zn2FkS+SFtM5zFsPa8ciMZpk34UyDk2A=;
	b=Eaq5bZTjVpbuR/DkRDD2gYkUoKkDF/Qy3sddisg+ohbkPtuFjcxMKwTRp430tmma46vj2e
	yf2r9SO1hiMdZCKaUS0dbbMKSMlxUAxiTTsYhO7/LngD8SH1TbW5w+gKb+LhzqYXSCE7jp
	rZnZfPo4sUwVSAGZvO2FQDkPnYY3gPgjcellNrG+n66OT9dNQ7RaJRd7IwBazyTJsGPrRY
	lTfoijMAlimpYXL0nXzuRDAQ/27uvUe9xwm/IEeV73WrC7M8w3zppRcI/83cHgdDq0+Wnr
	zyjqt2z12nWQeJ0q+aJ441LPQ59vh5R7N5qbeQhwSVFFlrJK0vKWKJqvu9adtw==
Date: Thu, 21 May 2026 15:57:18 -0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Configure DP endpoints for
 2-lane operation
To: Saurabh Anand <saurabh.anand@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
 quic_vproddut@quicinc.com, quic_mkuntuma@quicinc.com,
 mahadevan.p@oss.qualcomm.com
References: <20260521120058.2966709-1-saurabh.anand@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260521120058.2966709-1-saurabh.anand@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/21/26 9:00 AM, Saurabh Anand wrote:

> Add explicit data-lanes to the MDSS DP output endpoints to enable
> display port in 2 lanes configuration and disable the mode-switch
> property from the USB QMP PHY node.

Why?

4 lane DP has been working great on hamoa and makena for quite a while now..

If there's something missing for now specifically on glymur, please add 
an explanation.


~val

