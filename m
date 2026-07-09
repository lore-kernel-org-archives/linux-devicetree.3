Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56444DB57D
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 17:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618744; cv=none; b=HAtulnrK9HpZfBGyerOypUv64+o7FbNUvr8rmzPtdWpeN7Mud3xTP/6EHBDqgekUYbfBWX6kFRMKn2xgNG6ss25QYzcAxRxUqf0fQLJ55cClyk0VtWViGgMT7sOE3C/O5dhH4CZrDP5S9nqYnpjVPUrUwjVqaGzTdRKe+Lnhj7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618744; c=relaxed/simple;
	bh=WuXlhN9dPr+D9+tCKUy0eiu9+qslbGdbS0eCmtIrkhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkLhgc7djhqyTx3YD/xus7UtqkZ8FAzp4wAkq41GZxq+Dd7S0kILE8cy3DjtXwQE8Yuh2UjHwS7kmYf4HBh9twq3N29eG6uEpuxikim3FW5dj17Wi4FQ1NMgCw11f4YrWQKI39go0q4fzADpn47knvolpHQ8+YkdonHeHRbHbX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z50z3HOz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IumBpNol; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z50z3HOz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IumBpNol"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HX3lP2295105
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 17:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WuXlhN9dPr+D9+tCKUy0eiu9+qslbGdbS0eCmtIrkhI=; b=Z50z3HOzRF+l/Qhv
	VislqZdjWmSwV0v8IQmNdsfoT+h4BV6lQVYsrWP1GJKAJlvPARMYO1ql4mCelWru
	axrQ5hzC/jFjFtgv+kzHWCcA7bP+cfRJy6qpsl9bkQewqBD3+C1UBc/NPEI380py
	DnSqC5+PhKPs+Iue6ypb0nt81UD1NI2mHH/YLdW9Jm7dWI5NoPeCpSuBeryd9nFA
	uOa2wZOuK/r+M3fkoioVA0l2ngpkiiH3I3iSK/HC7u1rrg5++amXa40bHt37K6uO
	k0TkT9VmKLHAWP7uooC/yTy5ROtiwdyOCQktEzu5sFb3jglejG+vVhXBtOEjKfDx
	AFZBIg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vkeve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 17:39:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0e702df8so260641cf.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 10:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783618741; x=1784223541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WuXlhN9dPr+D9+tCKUy0eiu9+qslbGdbS0eCmtIrkhI=;
        b=IumBpNolbLHWTcn1GxBZcfCh41sFeGOWUNOrkOKab5ck0mhVoCCxmJwgEyzZzU1RVv
         tW1BPkpB+62KxgpuvZITN+HpSLqq51URQkQYM/6ETHpI0ZP7SkfJ+Y6UML52WIHdU+fm
         +zHrA3eRJNrdxzgmDf/4rduGgxVuhZ+9MO1Zl+18c9MGlef4o0DY6r3ICUFlP+wY9LSG
         fol5QxTohWdSmU9HZ5MrwgBymFrNcEGyGxuAzX7j5RI2mAU2B5CNZ13lpAkYkwPefYlr
         whJisRdqNg1Rr8r7LwWSEfjA8JGVPhRUQNuGCyMjWMDNG9/a6Lk7pbtfWr/nZaGsUrip
         Qjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783618741; x=1784223541;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WuXlhN9dPr+D9+tCKUy0eiu9+qslbGdbS0eCmtIrkhI=;
        b=DWn/KkPu2cZENkLWFkaCspXeIzfCe35IUvImk9WhUzsBwilV/azo3WeohqU1uyTH27
         OppemB7ByW6n1X6AbUlOb5P0n2fBim0s2f8VocnnhNcvVVsNdWy897rMs7ET7AH/AGEf
         bCNSs6JKr5yQq6dq22ehYga5bOnrVJ+XxifNqMktf0jnjh4TxAat0RtEM9cvc8ddf9v9
         NHijLY33+i6hLGxodWd2UutQ7bl8CX1ewfoPOJV6FBXOTdjLbrwfpIHHsKtTPgfPrN9u
         actR3TYMPyJ9rXOP1snq55w2qeq0OrB3qXVbTKa4JoWGxIoaGoWSGoCxYlKXVrOp7ug8
         fNAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqAlY6+K76iduj+/j4RPC73lfH8gatWOi0ApV5PdFMUw5fTqVVH+71YC0hCjcUMkqC0m309Oh7F3zQQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzjJQ2MGZ7ILQ6rfXAB3PanHpuqmjIOSev0utw4hD1Ztf2svog6
	75LUBd9/VabxJxkxX964tMZu2OFlL40vABk+OHurBTcTUg+3Tb+eMFGtwMgHx5HlsS7EheSHisd
	uNaa/loXjCzxilmjMgbEV+4ZaxCGoNa5tqvnS12bNdgPMWrawmxHudKrzMGUQI5G7
X-Gm-Gg: AfdE7clsw1ZBFdbjUiz3CLwf8SP0d4VhZo+85bNEKgmgUH6uHO4cJcHu+8wNCO3rQd1
	5I0QX7mFvnRtmPS5ciwzsktHwy/fFOZnR1bHIgk9B/mlqccdU5k1+1ldedXbEkTs5Gjw20Ffuyy
	wXgyiar7iEsbggic5tvjH6JdPqHqQowWvGnldVeJigdXbgYhrQj+mm7S/ypv7JYkV8iF6vRTFtd
	vcQB4LP8EdqK8pkZhfch2lg/nCL6pRfvtL1UKWjSygxh5oxt0wwYt8sWpMp3wmNVvxfZXyZ3bj8
	8gaZBxPqNZMEPk7PvnDmjkckLWFrVipSsfSYJhT1aCZ8CkZpQ+qhbpRwO9Vj04ajlGZFivoxa/A
	qytV+EZ5RyVZ+dPzs0iilUBWzUtwIT2vF7QTRCf8=
X-Received: by 2002:a05:622a:1448:b0:51c:7b12:5fe3 with SMTP id d75a77b69052e-51c8b422b0cmr82706901cf.79.1783618741151;
        Thu, 09 Jul 2026 10:39:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1448:b0:51c:7b12:5fe3 with SMTP id d75a77b69052e-51c8b422b0cmr82706571cf.79.1783618740750;
        Thu, 09 Jul 2026 10:39:00 -0700 (PDT)
Received: from [10.204.141.154] ([213.55.184.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm50653065f8f.23.2026.07.09.10.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 10:38:59 -0700 (PDT)
Message-ID: <a9dee8cb-d4b3-4267-af83-48dc888356e1@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 19:32:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] dtc: dt-check-style: Add more DTS test cases
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
 <20260708-dts-style-checker-v4-7-c175e6401150@oss.qualcomm.com>
 <20260708145857.840DC1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260708145857.840DC1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX9jUBpKqgD/jr
 gziTIOEOvjAVvQgRE3XP0RoTfd+pYhceA2MzUk8XKbZW8wXAXo6pT0WxQNZUaitDDGId2dLMXuG
 82I3Fa5DHNAaP0lJ2bD8dQXZslDZeXCnhJ9u2dP7+hS2ZLVNtH2pEL3YMzcT6NCvqNmiwZERZqK
 LyQ4IiVvDLrkaqYeYcTJ8SafKRybu/LpbFzRFs11Js+vBVEEP9CSN9YvVZFAWMWG9+PxSL7uCd0
 g7qH5adskbjASzMNJ2dhjHKdl6WyEKAhz+k8n8sTwDm0BlYZAa4JS9xjqE97CRZRHx6O/7frI6n
 qVtnjSpJycNrAKD1EzqJ+huhRoalkBFTdzhyyt/gkucPhKp1///ZuYHb0NB3Pl7kq76Do7vI7mZ
 YhfU+mtFtlQ8qQdiNZ10YmPAdz3dgoP482gbaztBWljjctZUJNcxSxz3R3IhNJKfE/yUs6CQkdx
 rs+K3V+/y59gfO8L+hQ==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4fdcb6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=nvVmADDuAioZMzk/ZEnfEw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=9ZkQsALANqwWZhioCQMA:9 a=QEXdDO2ut3YA:10 a=arBHhYMabMMA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX9USSsbS5AHZL
 JgHMAmSF2FyjFKAlqYahbap/K/aG1pJ0TqGRgIUGKTRZwsGwsq2PhbFYl0MNVE9w7NuFMnSLZt6
 ks5KtpqykUujH/WtTJVDn948/I1JG9c=
X-Proofpoint-ORIG-GUID: GVBEhDWL43EJIoSrlkxWeH3p72kVcPc7
X-Proofpoint-GUID: GVBEhDWL43EJIoSrlkxWeH3p72kVcPc7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090174

On 08/07/2026 16:58, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing semicolons at the end of node definitions in multiple newly added Device Tree Source (DTS) test cases.
> --

ack

Best regards,
Krzysztof
