Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEEF363C6B
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 04:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779338376; cv=none; b=fSELNDYFB6fU8BrrXU8Sl/sBFfPBV6EbHaBLjlR3u2qKhKWSwQXXKjy5oljimlps2i0p5+EwtebkJXJr7oDVHvCbFgAZRTLvoCwoc//8qARKSPWBDZ/rgxli74yAjmJCvYGgZtt8xfZXga60Mm0TPO+qw9u0VQmMCRvIfjWtzDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779338376; c=relaxed/simple;
	bh=qynQuhr2td5HO4aMZNbXY8KSW2cmUMU79ToINMt7Zhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EvKM5GXSZzfMldNqvedmvhiL8z13sk5TbuGVB5W3RHfMtlFbNktoOnvNboiPe2BdJPvjuTBZGpcnpe+K+xg0n5ReCtvJACLX4koK0zwLHjqgi85qQqhll3fiPNbcAky9lTuF8u0uq5JVzyRteroi7h2mcJ4TiFqYp1U12pBodCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=FYWZ+cnQ; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="FYWZ+cnQ"
Message-ID: <1f659806-bde5-4f8b-99ef-339f680bcf65@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1779338362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rOIC5lFHEmXyRzFnIMJxxDLSfJcJuQc8tWENTkCRR3w=;
	b=FYWZ+cnQ1f0hdcDw44jC85XPHBTY7jJKnM6pxdaCWRJqpwL9lAwLLmHJLRSrPBqaYN9PMG
	bCdToxPBXNY9zJL3mXbtJ28W+JP/JvSqVNd+gOmSIv0MY1CsTo2QACCyzTvg9PdJvQMG5x
	pp0oniIXuv5W7FryKWhNXdwl581O7vhvbugqBLn6LK3eAdAtjkJnnjfsGKDMoNE15EyGVB
	DYZoQjU61xr5IoWupAyYUECYvJzneEtKpwpyD7p92qUwz0kfxI/uP5fISFiUMIXqDhWGQ/
	98RZivDA2kQiO8WXG4hVMosz0vDQDmPqIu6klPG0QRU6He5pGr92ON54NDTCvA==
Date: Thu, 21 May 2026 01:39:12 -0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] phy: qcom: qmp-combo fixes + x1-dell-thena DT
 maintenance
To: Michael Scott <mike.scott@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
 abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
 linux-phy@lists.infradead.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, bryan.odonoghue@linaro.org,
 laurentiu.tudor1@dell.com, alex.vinarskis@gmail.com,
 linux-kernel@vger.kernel.org
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 5/20/26 10:09 PM, Michael Scott wrote:
> Four patches:
>
>    * Two pre-existing bug fixes in phy-qcom-qmp-combo that are reachable
>      today on any board which registers a usb_role_switch on this PHY,
>      and will become reachable on more X1E boards as their Type-C
>      support matures (patches 1-2).
> [..]

Thanks for digging into this!

I have successfully used automatic role-switching (even switching 
between USB2 gadget and USB3+DP mostly worked fine) but I do remember 
manual sysfs switching causing more issues..

Would be great to see no more dr_mode = "host" upstream. Though I 
vaguely remember some objections related to booting from USB (?)

~val

