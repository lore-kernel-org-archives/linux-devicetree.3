Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33EC42FCAF
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786532424; cv=none; b=IB9/dO5OjVG1S0XwedaA1NGvfJtVV0C0C/CPSICxjB+bTfpVekpTONbmnd2FAWIXXlVeyAV1LuFEgANaQMDdJd9vGhD0zQIh1hB1pZTmg6UfAiq+q6igrs+Da7RXSPztb8lQCjZ3HSb7aGBiEJb1xJNmp1lmVILCOIt1geMSKcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786532424; c=relaxed/simple;
	bh=7Fo6r36FUHOo03XM7mJuG/3KNscapNn48SHiyBaY9/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CW3kuoBJfKGOn0SYtNWps7p9JoKSaXoVscWxGofhb7ltcups0qvmIUjah+39geC8QjCz9agZgRsBKeBTYf2xH7m8aBDTJpRpJHG8SE+EkXDbK9U55q4tEcMTQJhfxta2bZevVq6/iQDescI7T2bqLcaSWjkie77rgzohksWnYvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfqnWdQY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UQbVyUnP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfqnWdQY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UQbVyUnP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9fmRk3997151
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 11:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9PCeatloIVvaGd9faSaSqF2c9A3TOKj4hIv65HDDNK0=; b=FfqnWdQYncWPzL56
	Ec7PoJC0MUvbjBkZWj2QdWn1i9md9iLe3Qbhn/Nq7zidf+Gq3IpAuaA3N4Ta3oLc
	LMWHqbCyaWST+Oi7Xmnua+QhHWT83DHt/pPY1Ghb5m41pI4uKepjAGKUkUda+QKp
	OmwTM+00U06fKfJygNI4d8+pWZSs50HhFE6VwtMyqZw9Icpu46wedoZReZYtKzAU
	JAzGhZFNv5AppXjnKXtny+ZmnIYnOO9jYT4WKGACscoFhTO/81NvTO8o1OLOlbIE
	2bgcDwuaK8lvdPiXavveyJrzT8W7eLrQ/3bn5rwTMYlEvZZeELf2k1vczYpfQPOS
	oVgJxA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08j5kge5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 11:00:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc640dfde3so12627905ad.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 04:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786532420; x=1787137220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PCeatloIVvaGd9faSaSqF2c9A3TOKj4hIv65HDDNK0=;
        b=UQbVyUnPGm5vQiLmzisjAkmMUuTCUuXyIZIBCiZw4sFS67U10VUuhTA7Sq/HLfrbay
         dr9k21k34RCfp8nI2nsW2SIYexzHckd0LbgD8shg86GcKTTBPZLH+mQlb+ocGm4TNtPL
         68jlnCNx9JsPPgAP7vClsXa1TqQbWAJ/djpskhRXe/+p0zbE4k+at4TFKpwWGJdMHX6i
         ga6kst80fY06MgiBpiW2nQEiKI5/WfNNMlfn9L1JmfIArmV/b6JkILcWpD8VPdC432L3
         zZrzKvgcOVs4EnsFAT09Y+mqn8LsVgX5Mazharfge8c1UTG+I58QVNpaJxJKjtqToaXM
         xI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786532420; x=1787137220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PCeatloIVvaGd9faSaSqF2c9A3TOKj4hIv65HDDNK0=;
        b=bHjvfIT++oMepYtKiMHR/iZLlKl2EOL1HlIFBa9B+Afqmn4WiSAZNWzn69iSGw+DoI
         opB5Md65UwG4/fb+5T9zStwTkw2SAMC7Pz9J9XJFBdQ8OYBgMtpmaKZmHJKW80tdFcY1
         yU16Tghon6ydUcKsUnIUi5FTOc+zORMMGjNb8PoL6iZwRWtg4TKMK0T+Ikpc4i/9xAXm
         UiuKwcRP2rLT9y8Cpw3gKJWQYvYotdwDR1mVMmpLUyU/5xwAYbrlYpIAMK7yhHakr/pH
         2mlMF582IhR6Js8GIpfP3rpTGRJyBhU8wsPSGW9yrbNUTRgAj8BDNlwBHFvneNHsURxJ
         faxw==
X-Forwarded-Encrypted: i=1; AHgh+RrKMfjYKX1bZREAfiwz36+MnlKTIwDqGdUhwQqvzDYzHnoVxTdgqCZfkCNicyOOfnEIWoZR7YFxpC7f@vger.kernel.org
X-Gm-Message-State: AOJu0YzecVGx7OffB0DCW2x8LYXQV6meqXK+C5fS1s72fBrmPE79q4yr
	AUs/Ip6ofruwuYHqx1pqY/dJ8l4BP30NgN3Zt7Y76/ucusA1968BHDSXBGh+7NJ2/87IRIOoOUO
	a4X0739O+nGP3rZUVKG9A0Ysk9rTPHcdZqeB7B0WB1qjIVkQ0+d86Q8Dyo9dfXuZF
X-Gm-Gg: AR+sD1175YbM5gStLJkSCqTzaMCM7yZQw28n/9gjU8WobSedkcYdo/wXVmeSlb17RYo
	qsgXzueuFBuDwaNRkwDTJ3lXXgQt38Vywqs6R+UIXqB5mN3g2a2isrNXH9V/M10toSmswX3IUmT
	vmm3xm3yCDQq3XTIqeIJlMZtHd7e4LZzo7DkKvfZ9R/B/bmbGRspEFNRqTV2eEy9YnYy/bKSoQ4
	bDMUVxmKZqlNy1pJUMjByZiKWk5N1RSYV53u919Fuwg2mwE58tDkLBPXFNpTmRsGsvchu02Evnf
	QwaJMsQLWen8cUXkr8fmkfxMiclDwkY3TEhnWEJLycdneFpnaPZ1vxTTdC3fWtyIsMyHeTT7iuM
	pn/K6Ao/96AYDVVqKTJJskoioFyQhy1Hb9Q==
X-Received: by 2002:a17:90b:2701:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39301490cefmr4455953a91.13.1786532420022;
        Wed, 12 Aug 2026 04:00:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2701:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39301490cefmr4455414a91.13.1786532416553;
        Wed, 12 Aug 2026 04:00:16 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f935f73csm3181551a91.6.2026.08.12.04.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 04:00:16 -0700 (PDT)
Message-ID: <c4a5b03d-a4ed-4e4b-8e45-8c9431c23c0c@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 16:30:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Lee Jones <lee@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org,
        robh@kernel.org
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
 <20260803100023.7AA1C1F00A3A@smtp.kernel.org>
 <20260812081521.GE1072730@google.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260812081521.GE1072730@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4OCBTYWx0ZWRfX00EIAP8nOWsm
 On8ej4oCvY6GjBpg5c5N23uLLfAkjrbqyUieL61PiBEPgllU7QcNJ7kPKUH58SX1NjIBRDXQrcI
 SlKiB7SCi4lCt6xJz8QGJWgtHR3G3P4=
X-Authority-Analysis: v=2.4 cv=evHvCIpX c=1 sm=1 tr=0 ts=6a7c5244 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=84XDBkMBUWCNCre_yW8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: KHhjdNoEAGXo1ve5VREYN_ZvIZyYn9oO
X-Proofpoint-ORIG-GUID: KHhjdNoEAGXo1ve5VREYN_ZvIZyYn9oO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4OCBTYWx0ZWRfX7nZ9e9d0y0Dl
 R31pVSgLddIXmPNRz711wPYXolMZ3EKFhplUBBfppyJXo4P9X0j26i1MosYO9bbV2qmn+71eV0z
 w6m5/cfxsm8VM52G6ClTaR34QIFPqrsI3+TNluDvwzuSv61xF/NkBsNuHvF8HqxWYTmHYwbixjI
 EcJs+I5uZw+st5x5J0HigMa1IsqbgRhbNGWQwhcoJ8Nfl8HiHlMpUpwRKAi+yTD49QeQij5/Em8
 MQz/Bo3Gb4PY5Jeu1fLxLr/ippw2VW5t9YRdAewiFVcLK6rftau2sXtu0ugPdOLpvOCJvDZfJrx
 Zb+60iEIOXQ2tkyTx/jef2evzy5NLFIIM/gwcbmRdvhkYatdY7EiPLVYn7hflpdfd/BoVcWSjGt
 AIlZahAVgrWi8oS5QLJJuSpfhC8J1ySj4xfNvH1U1sfQZYn1SOfItMNPzjzwYmm8ZBRq13sg2YA
 fz+5E7z2qn3wgJLr78A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120088



On 8/12/2026 1:45 PM, Lee Jones wrote:
> On Mon, 03 Aug 2026, sashiko-bot@kernel.org wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [Medium] The new `psci-mfd` driver lacks a `.remove` callback and does not set `.suppress_bind_attrs = true`, allowing manual unbinding via sysfs which leads to resource leaks.
>> - [Low] The newly introduced MFD driver, its file, and its structures include the string 'mfd' in their names, violating subsystem conventions.
> 
> Please review, explain or fix the Sashiko review(s).
> 
> If this is a set, this request includes the other patches too.

Already replied to Sashiko's review comments on other patches.

> 
>> --
>>
>> --- Patch [4]: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for cpuidle-psci-domain cell ---
>> commit 26907aee3ff3e0a5d7112a9be25ebbebb10e94c7
>> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>
>> mfd: psci-mfd: Add PSCI MFD driver for cpuidle-psci-domain cell
>>
>> This commit introduces a new PSCI MFD driver to manage multiple consumers of
>> the PSCI device node. It registers the cpuidle-psci-domain as a child cell
>> and updates the cpuidle driver to probe as an MFD child.
>>
>>> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
>>> new file mode 100644
>>> index 0000000000000..7affd6bb09dd8
>>> --- /dev/null
>>> +++ b/drivers/mfd/psci-mfd.c
>> [ ... ]
>>> +static struct platform_driver psci_mfd_driver = {
>>> +	.probe = psci_mfd_probe,
>>> +	.driver = {
>>> +		.name = "psci-mfd",
>>
>> [Severity: Low]
>> This isn't a bug, but does naming the driver and struct with the "mfd"
>> string violate the MFD subsystem guidelines?

sure. will remove the string "mfd" as per guidelines.

>>
>> The MFD guidelines state not to hard-code implementation details in driver,
>> struct, or device names, and to specifically avoid including the string
>> "mfd" or the driver's own filename in names.
>>
>> [Severity: Medium]
>> Since there is no .remove callback provided in psci_mfd_driver, does this
>> allow manual sysfs unbinding that could leak resources?
>>
>> If a user unbinds the driver via sysfs, devres will destroy the child
>> devices. Because the child driver (psci-cpuidle-domain) lacks proper
>> cleanup for non-devm resources like generic PM domains, those resources
>> might leak or leave dangling pointers on this administrative path.
>>
>> Should .suppress_bind_attrs = true be set in the driver struct to prevent
>> unsupported sysfs unbinding?

Ack. will set .suppress_bind_attrs = true. for psci-mfd and 
cpuidle-psci-domain.

thanks,
Shivendra
