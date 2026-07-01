Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1553735C1A0;
	Wed,  1 Jul 2026 16:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921915; cv=none; b=AgjDlWJTEkcgRbHliFzpk4sVCLkg0Aaaj8t++weszcqmggc0MmDsgVdKHVZg71NziFXwa/krclZEyyOvvBAH64L4gB+dWy8m4fgcfRHB3kvEfLZDAOlXiyYDZkZiZGAxQ9WIrO6W9mka0HJK3ndQNuMu32nBOKZImb56CGsg4v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921915; c=relaxed/simple;
	bh=UGllxipaipOYGjq6tyickr9zwhjh1wEtPHrdYkNECyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TlZEVuNJz1PfHqycbOo2ntrKEBWS0eE20Oc1fHjX5UkOSz5jd9TVOkKVE5Gr5oHKwKRFI6o44w75b3P55jTPRnMO/lHYIh5uJsSUC3WvHX6JkrXl51+Jp+kHlJpH+D0191uVZmKVERv6vN9xmec6IXiUn87EtM579W3MJyG7e8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpsz4t1782921890tc3d080e3
X-QQ-Originating-IP: MdE8Td53W9uJDeQGRhvSKFNpD3UjomZrijBuA4JYZyY=
Received: from [127.0.0.1] ( [119.98.234.251])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 02 Jul 2026 00:04:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11788797983272403197
Message-ID: <843419F943CDE487+c183d00a-3967-4ba7-b6fe-fc50749701b9@radxa.com>
Date: Thu, 2 Jul 2026 00:04:45 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Flatten usb controller nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-flatten-dwc3-v1-1-b18be56bebba@radxa.com>
 <2cb32deb-4266-416a-8db7-1b3b46b52162@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <2cb32deb-4266-416a-8db7-1b3b46b52162@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Mutteg8H72qDYT+d4ZcLZa6RxqaPVM+yCwXc5Oc+nN/77/6uiaLgenDP
	jbGo8byO6aNLQrYf1HgIIB2bWAEiHG15i2AIBdnWRG5EHurcWAmAmHazn/UPiA0n4NiTk8o
	L7foE7xXFX4CJgxWa6FZjcezPbJybpoCBXzmwHQMrj1lOP3jUkeP9p/8JdtIMBp2J5JLxgs
	9njMNaCcgigVj4ug+tqYsvOtaVCbMQHcsjInPMV5bcTDUKP+Iy2UoFCCLnocdYaBoMsbynS
	214/Im/dz5+cRoU4oJcxCv9u4rQRgwF+p6HMHPBnvkFGnk/Rn2rCdST1yNr2lI2OoGpqOIt
	AwGrBdWSJkAJRogHuq2V6+qD8blrpMxYGQXNUZS9zmxQhepjvLCAcqjrB3Oel9iTIL93ufL
	uiSIgpvydmKHLXSBpUYZBo4GC9kJwvkCJU+EBW83o/mG5ljICZEo4/m39T7Q6cnJZnzA4Bp
	WHCzdAGQqILX00QuHG5F+8CvVc7hIMvpXVVWmYOmlT1HZr/QdCcAbDiOS85f5PvsT23vNGv
	9Wu9XGqM0LQDP+wqT7vwOTypLFCfXdpiiTt7R++pOKcH93+apGhdTaeQHBvQ94Z3HO9fA3J
	g8A8KfbBjhFEL6eGrmtxPBJ4Bt+wTWd2+YJrE+YG1jVnH043TBC6EDslnIUufxt7I4nIt/x
	rujFh5nNYkCSJa5C0aWvcLdY9kgw+mr+mRYY7EgV4oMfZP6BgbJfcPCZpi6w0V2CQpPpmcd
	tH9Jn5D0Uv1/RYoq8BTFkCj6qANprr8V+ZfxSNHe/gjVWy/1uUxLvi6DSsj6VaVQqb/Jh2V
	p/Zl1Gx5GRQmeL9yWu3rlbvljh5FnBmGw8oCxzgUYb1ULYeJe7hMFWHiLM0xL6lwrgZG+Mw
	B/HoWRij1W6FgBTHXcX+Olvqz/1mtTlK9s782ZmhCbvN5LN3JnQc+3bQ5BstfPvUOFsXlEF
	wg4ZrabBqFa53vtdsRNjwLoWi2mSLoxsRJeWCXxIU2I5puuyu6IjbzZdXY69ny0xj3l2xay
	+KZMELEcwTuIcPLXYipd/kz/xZjN0=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

On 7/1/2026 11:10 PM, Konrad Dybcio wrote:
> On 5/7/26 4:29 PM, Xilin Wu wrote:
>> Flatten usb controller nodes and update to using latest bindings
>> and flattened driver approach.
>>
>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>> ---
> 
> I tested this on a CRD and an x13s, both work fine across suspend.
> 
> Turned out in my local experiments I made a typo in the name of the
> interrupt that was carried over to the big node..
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # X13s, CRD8280
> 
> Konrad
> 

Unfortunately as I mentioned on IRC [1], this actually causes random NoC 
timeout on reboot, which seems to be related to pcie.

[1] https://oftc.catirclogs.org/linux-msm/2026-06-11#35405057;

-- 
Best regards,
Xilin Wu <sophon@radxa.com>
