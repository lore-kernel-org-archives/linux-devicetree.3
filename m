Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E391400994
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 13:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787665724; cv=none; b=YN7oAzjwjanQQnU1erE+G+Bc/0soPDgJFsDXiQvpaNOwF9UtM/PgH5vxdhO/w/9e2FIqQDt5P5xG7ubfqIRQrbP4cEU0/hgAF4XabVxUlAyDb3CnRMO2pYNDRAD8wghaNps6cg3iM3KVrPn6xuWfQY5dU3+4G2tByDp39uP1bLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787665724; c=relaxed/simple;
	bh=koWaIjYKue8o76GV/cyxINDET8Wt5+y/PlcMmLYYCMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nit2O32WQCRWfOM1VARrKbcQXWm/BM68rJcn3sVmT3O/w/JczRFQ1HYXuJG5zrniiql/4KGjrqW0ZlHa56o9NBJzOa1tU1yhqqyn9wksdfhF881k+Crrp+O0OtgT0Yc/Vp5sNXAzadc9mBtLG48LiUWYddvpHSN3hEjfr2FWaKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQmZgWzz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bz12fFuG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQmZgWzz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bz12fFuG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAvxUj1639994
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 13:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Mtw2dg1AiVlIAwCktRzCgLUkOpeqTfw7nexb4BnJuw=; b=PQmZgWzzCGUEexZC
	Wt9Rpm2flIlXflo+iBq85m+TgbcuFkSr54XfwaG5gq3BkrK+3q273F0UOoojEhBq
	1y0RFRqyMgrGvjh6KA5qf4aBb/P4cBoE1z3aWI5IscDcH7YuLTkXvebdHHKClS37
	q5XEOqLxb2tBB0di7Qwhdu/QXDBGVk86klSIboFbI8Ixf7rx5oHNPsc334AfmlPw
	jtl8vojrlGWm7v3OMgRaaG8FcE6fCsqekLPxLoXuFnHWl95lSqgkydwG3AypxhK2
	eq2HUgkQN64dsi8KAyTuPvqF75JGMMiTCRcU4OwaEAbw96xrE7plDX3hiEh7q/dw
	3LoSDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t1s48c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 13:48:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a312222dso52014985a.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 06:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787665721; x=1788270521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Mtw2dg1AiVlIAwCktRzCgLUkOpeqTfw7nexb4BnJuw=;
        b=bz12fFuGHeIF8xEJihZSlSuU5w4PU/+ycFS9SAtFAF83CDlEfI0tpAb032x4NQ0Emp
         Mf6EOzz3qDkdQGp0KxqDS50G1qQtaU9A90/hEeU1vkdP5hzE8XjJgPii6RKgegPUjeeH
         5mpU9XH5ydR0VYWKbB7y5Uev3Wf597mKwZjUnPfv6zO58ZCJZEYG5H9yygVOxR8Bouml
         oFzTtT/SZ46xPnOuar6QLx+JDembfXPnE7yu1iYab9rw6v296rTSeRxMCpZpEwfNG8It
         a3cVpUtKTN7hVPephP173sOh+I34r0Rirzy3vzRtzbNpzn55cmJJR5KbFG87PwCeka7/
         glWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787665721; x=1788270521;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Mtw2dg1AiVlIAwCktRzCgLUkOpeqTfw7nexb4BnJuw=;
        b=L3spAXVcJvHQNe0jw4iJ4Lf3mIbNHiYNvKhiwwLQDj5/BSmnYWdgHCSBRUnqdUUGek
         Hm5YSazxQsEJ/EA9Q0NPMB7qy0rUv4nzSqEbR58YJYuQVliNGAr+7TxX0b7kVdyiN9Lw
         PrGUsSPEBTW455CWtvc4bs/2ucRVyQgx/BqBbQm+51y0A8Unwnqzz49KvJ4VCmIYXInD
         uwlkpIz+TOpkREG0NOW4bLdDWzOAmr3Az1oQFX6124nfS1/ZjenTqSC7t9XkCUdJzEim
         YdP4txO6StFi8Fv96g3vsq1J3jsTaPoK+BVwFEYI4iuTRRI1zib5Qy6KSBhYFU5prJ3S
         4M+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rry2lKFsGPZmvxsq4Ks2JNXGtRNaeqzQzEweF3b9v9alOVKovGQXvAcEbWtliwd/zRcUwAmCA2jG6D+@vger.kernel.org
X-Gm-Message-State: AFuF++ncdWrwE3QGdxmoP8zyIn523bfNDru4OHPYoPnEboxZz2wK6Ktf
	lJK9hERl0AoMPeDmUl7/ViG/x5y8QBuH/bPWfrdnTGGmjyuDYIKEMWM1HLsOZYed2b1iL7rmRp/
	N2XVlDyUswa8gYhAXT4yeegfbtPbqW4pn2tLeUy/T4QlyAhTS4JxHuUsspIJOb6uQ
X-Gm-Gg: AR+sD12JwWFECIGBF7nTug5hIsTKUrj2pEkYc4OQ3mUo+akoJtV1DVefATf36l0gUq2
	t8NqRxxACLGIPIiPGH1eWT2j9l++CxWlFHeaHTTeaD0tirfeauhLZwv8+Hn/a7rs+SVjtYF6PWB
	c3mE+Xxw2MYvk6UeM3+ymicvo1R5mcz/ZVq054TbQgIRFff4PuLeeZqQkMc/ZP/ySys9Wz0rn6j
	Gix/A7s4aoqey2s4uZKPvOCk1tAhjCxQ2nz0ypZUkfnrifUZM1o+ejO1Xh7ekCW/tGjeL8PkBPE
	ERX8YhSi2d8yrFeC7YYK/E6WVxTJNR5TPf78iq+GUUU13Txgo4Num4MbBdoe4jOjl1E92XnsXvk
	lwAIjJQOugMiVRf2ElJEYZKKq
X-Received: by 2002:a05:620a:268c:b0:936:f9a6:3813 with SMTP id af79cd13be357-937392bd42dmr2299901385a.0.1787665721074;
        Tue, 25 Aug 2026 06:48:41 -0700 (PDT)
X-Received: by 2002:a05:620a:268c:b0:936:f9a6:3813 with SMTP id af79cd13be357-937392bd42dmr2299896985a.0.1787665720597;
        Tue, 25 Aug 2026 06:48:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1c2fcb944sm20983451fa.29.2026.08.25.06.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:48:39 -0700 (PDT)
Message-ID: <eedc1702-7767-4d5c-8077-20432766c613@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 15:48:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: dts: qcom: qcs6490-rb3gen2: add audio CMA
 memory region for AudioReach
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260825133333.376591-1-karthik.s@oss.qualcomm.com>
 <20260825133333.376591-2-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825133333.376591-2-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B3s70sRpXjqdXvXQ2vaLXjI7GWX8EGos
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDExNyBTYWx0ZWRfX28qKRbe70CoS
 QdCD/njjtQr8ARo79hLfk+h+dXE3tdrWJm8LZY+TbzEpGDZXwoVS29hf7VScQIltO86IuDVygdW
 lHqjRuqB/Tdmh4hf4zlBdn1WyA1YJMG8arR6nG4QtD1gn+fpuWmzqIVG/ivOIsyCEgbCJ5fQJDk
 7PAvMm/HY9xN9WVXsD7xuthtVhrBT0fYHjhcshULN1dGl3aZqzYqgUQxA9w9YHHKo8dx3ZTEn4J
 zuwj/i8KD+eNzQ4/X6VEQWIbSApXIdmgfWv0+qg6jegfaQGS0LhL9fd9W6iv07w4pctUIV9nXwH
 iDiH0cmfJJnDJmP4PFBX3mj0K6nL1F7pU3D3g3Xt82m2PaaVK37TKtl8FnSoKOSmBUEMNXUhNVH
 IBeFqGNEL50oKT+MS+asth/cAhRwwH4+ovw67s1YtDy2YVTpkQgNSyKxzUFbKec4luwbfj7/o5Z
 sDH7fjEekrOpl/BPsLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDExNyBTYWx0ZWRfX+bj86Dko3aPO
 Yd7BjOns2kuOT/3i5jGl3KjILoHdmqmmDkscKsaZX9vWI214r5LAPJrceJQRwkBlh2ZPT32ynML
 edmf4oO9aaNIhQ2z+1GgBjKuyxORjqQ=
X-Authority-Analysis: v=2.4 cv=L7ItheT8 c=1 sm=1 tr=0 ts=6a8d9d39 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=v8qUxcD9Pr_f-00p6x0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: B3s70sRpXjqdXvXQ2vaLXjI7GWX8EGos
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250117

On 8/25/26 3:33 PM, Karthik S wrote:
> Add a dynamic CMA pool for the AudioReach audio stack on qcs6490-rb3gen2.
> Use alloc-ranges to let the kernel pick a free address rather than a fixed
> reg, which avoided EFI-reserved memory at 0x9cc00000. Add 4 MiB alignment
> to satisfy CMA_MIN_ALIGNMENT_BYTES. Wire memory-region into q6apmdai so
> the q6apm-audio-mem-cma child driver can attach the pool.
> 
> Based on the equivalent implementation for lemans (SA8295P).
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---

Please don't send patches that you haven't compile-tested

Konrad
