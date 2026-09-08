Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0A249DB98
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 08:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856600; cv=none; b=coI1kc5gwlWlZ94juozFcPbggUCS/feT/e8fLzVWzjbcRWTwFRY5T6QQdGgvloAZAnXnHdeGQ+j9OUfKEZhljfoRVapQQuI36mQZIJji/EhvwUW7+m+ZuZmsaD3vtTPwDQXxeYakkyY+FrKEPPSIaccTrYpAovBBXbSzO1a2jN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856600; c=relaxed/simple;
	bh=tiYasFIpEE/Y34RE614DnJmliaBqbzzu2btysmodjNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZ7XzGNh73ifuNONOk2bKd3Ntx3+/8k8iiLH4YS7mmBWxshWaqqzWS8gmbrTSYzGZvcuaQJcCMx0Z4CwLcumy1uO+KcykjGn42E3xEdw37szhM28otwWdl19i61EorEmNmVTiOqVKxaMT08tzeqfmTBuUgOuBCsO01NZ+S/Xlug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mkOewvSR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMYcWgOL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mkOewvSR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WMYcWgOL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LdTK1477255
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 08:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tiYasFIpEE/Y34RE614DnJmliaBqbzzu2btysmodjNw=; b=mkOewvSRFnOF0E3+
	qq1rNZ1Q8vtRFjpVAdEKQA6fxCJB8eOppF7CfUdX5QMnn2CpVw9/cO4UIaskeY+l
	18RnIebbn8MdK+tpCTnb08hweR4BIdJFBEUZOMJtKhsdbpHJBkj789oy5rKjXloX
	2I9q+tkyBUUhrCNDn8Wh1cDXrOqIqAq3nzqVVhGnK7RvVfspDErYcxf7+ImFFBC+
	HnY/gpv7kuV1PEF3P2UwaeeGTyuZnh90aNZ/j2nKEFlDWbLSX/m9TEdr0TbBL48f
	304e5L9qbQw8Ay89AedMSNdZnw8if4zX6KSen58i1UxfJZXIZMGOZWedKDZOaq1/
	wuUJRg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjh1gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 08:36:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so634855485a.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 01:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856595; x=1789461395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tiYasFIpEE/Y34RE614DnJmliaBqbzzu2btysmodjNw=;
        b=WMYcWgOLTcftEvfqyDP4KjTQSfVkk/4yjxvmU9KJv5ggRAV97yiRowQJarTZyvqZV5
         3NT0mq6GZiNlIrh0cxZvDjugE6M2zAZTp03HPxJIja0WD9DnkHuM5WQqaaRXIsc0J3j7
         g+jJumJLuJab2XvLrvALhKCnfW1dNFNslZevCeZrkj8+f+Z2kICvRB/8wYefboaFxNUF
         oDtiip6i8EIcx1iy3tuoaA13JsTSIf8iJ3DEGA56wLUHrVzsD1792rx8hkj3wlv9J1s+
         FJw9edWMqwmveeRLRGhSZOZgs5R2wMzbeqTaCelil12Y6CT2QcsAzK8ce9uqVQdpySDw
         SPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856595; x=1789461395;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tiYasFIpEE/Y34RE614DnJmliaBqbzzu2btysmodjNw=;
        b=FoKESrTHRkBbTKsM/6qunhOJlu+I8/vM6ltBfy0LrYFmA+gcPJ8w94CcwBqEN5VMpc
         /aivrT8wb7KolYCGOnhsl4UGESLFRIMWeQUTdZuWD1P36wv00XGSlUUonCuoEroXKy+s
         cFqKxKZpk3L85iDqwhCQMJdOzu6LjYcCbmuj5dHorkHMSJ7LyRSABt5ytjjReVQK0KVa
         9KBfbRDnaw4yJsbO1OZfmqL1LlRIjYuZRkU3L0+8S5kLDmU3HyLharxoT8WXK7NlpJKp
         1goIOO+iipn2JQGsvmECsNJsyMASXKxcEfyLaa0uw1i5ZKlkQJS3x6X43dX1RaSvQ9Xf
         vbZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxo68CQihxZ7pkdFBnf/8Z58GhqWYzeDMH2WH5uptJbIYlzN362lihhdLdUo5UlREVoLyYWXV7ret/H@vger.kernel.org
X-Gm-Message-State: AFuF++ldfj3Y020NjoFW80x24y/wpA9AQBqaG9Y2+dQuxGVwk3kb0u0b
	fcA4dFsCuYl538XEMU+a5RBWXBOW95EpeKrDlpaThrhcOvLaDW7cuGgBBSQKWTl1+IFH/yZu1cY
	nCRSejkzo7CSQiIV3KuovV+n0wvtQB+x/6buX9yrxPHDA5VUhDzA++zcsNo8V8RI8
X-Gm-Gg: AYBFou2j2mVBtxhiVZ4AqSSRRCmFjTaLGEpOxJsnzsZ+Dh8ZWFO+T1VHyqkZ4YulTy/
	G6St+5YlyKEA9ZAYaqBynpom/RShyvPrkv3BqCABBkJySPmmfC4MnNkp1rzOLxPG420sSq0CVX+
	CCsuazGxd8w3LJbUHHaGpKSQAYvGoMZGWpj7zMrVe0LERvOZjL1QxguQDsfDGeVpWvztYujKclu
	OcspXIFlyCR6ZMI/FfKlqADwfBdhmhAJdbLPluQHX/lXC/hUhGq3aEfsdmfQsZMfhQcEljk58nD
	+9lu+pRqA0r0A1Gfjege/EQDtpzZKPZ7KvzgTlgT81PBoXvxzMve9Dj6c/xrC0iG4VWT3+H+EbA
	3rNkIKVIKkJs/qY4ueT+QVE1X0mM4
X-Received: by 2002:a05:620a:46a1:b0:939:922b:3de1 with SMTP id af79cd13be357-939922b4881mr2238182985a.44.1788856594827;
        Tue, 08 Sep 2026 01:36:34 -0700 (PDT)
X-Received: by 2002:a05:620a:46a1:b0:939:922b:3de1 with SMTP id af79cd13be357-939922b4881mr2238180685a.44.1788856594450;
        Tue, 08 Sep 2026 01:36:34 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6024a8sm482095385e9.6.2026.09.08.01.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:36:33 -0700 (PDT)
Message-ID: <0e876b5f-13cc-4fdb-b7b5-78621cfdd80d@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:36:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] dt-bindings: display/msm: hdmi: Correct name of
 disallowed supplies
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, conor+dt@kernel.org
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
 <20260908-drm-msm-hdmi-fixes-before-eliza-v3-7-dcf8956878ca@oss.qualcomm.com>
 <20260908072249.83C5B1F00A3A@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260908072249.83C5B1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5MCBTYWx0ZWRfX3hdVPheTBEkr
 exU36wZG/x9CMY0PfkDT2CiJXL0YxHy1zMzpV5tceh9EYHVFfXOA5NN0nWfvFL9sSy5VUxSHLTP
 3Y2u5G6HBrX/gh0BJKZv41JSK9f+aRI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5MCBTYWx0ZWRfX4f0/nSs9vO8E
 dEkl5Z/N7/OtM6C/ab1gYyW2+yQ44nHO1Pm/lGDnyaDB/NUfuhsRLKaIDKOelO/m9kwY3wnhMBL
 w7/VtpWeGx8wEmtSVqlrI+cpUf8CK2idyV/iwlfNzac0buNgPyVXRWkX+L8oVrGPWxlvCKfBDln
 1qUgwX3ItuymRwZnKzd1jUY9C06ljViyHF2NSGqxs+Lt8qPGN7HOzKuReJQeMwmvih+bIZVs05N
 D6NPqrIEaGAAm/x/1f3rOxSDX7/cC5nedvSFcfg7V3fuUmefhbny7mH1VQNFbBqxDhQnKphCxBb
 uU1drqVXrISGIRl2nSHF2FoVRyz7GrSAqM5wRQQnf3QEeDFyBnDhSa/y7eafqLNLs+zr7b515ek
 k7qrRKIY/X/SFony5sL7x78Rdnxzf8f5zcc0iFtFVXC8p4fg6VnvQC7DzZMHvpav25ss7BvasSm
 4M21N+rwN0gNqe5VgxA==
X-Proofpoint-ORIG-GUID: q5MCscfL1Ctma4GUGwgBTJTVgEvxuQGl
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9fc913 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=12aO51z3czoBTLisYu4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: q5MCscfL1Ctma4GUGwgBTJTVgEvxuQGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080090

On 08/09/2026 09:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Unclocked register access in `msm_hdmi_bridge_atomic_post_disable` if `atomic_pre_enable` fails, leading to a system crash.
> --

False positive

Best regards,
Krzysztof
