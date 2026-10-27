Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090039;
	b=Juy/fwbM61F8KNZ38qjK3t59izFYWEtbHMkCP+PTcpS3uAicGKM6SWzhPhw4PVLLHy4t
	 4CSDXUrtzbGZp7AbDsCypEG11WjXKx7T+ZX6eYZACwDfU5LKEk4UUExyd1frCeME+IEMe
	 5xVcTHSsEV1Ko2LuYI8Y0zS+np8aWyBHeSmM9SIBZ9w61Rf3XpDBBNBaehP8axt21dtms
	 HQlTEe1Fnd6GKwM/ho51YO6FT2AeMBgQP2euZSwmXJqP7j06Ty9CZXbxPuOJ1+1H2zSED
	 q8PDICAVlBfwS80l+d716GS9R4CMz3HklRiZyVXULxW2Qe5aTlumP31EmY0mVhUKYjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KcNcY337sx7NujaeCz/DnRXy5zypv6RDzrNLxmfRG+w=;
	b=vBvSRDonchqvx1nqhSjcP+/xdHdLCmkx885fRBnOGYfDMtPL7qTqV8/SwUD4R6COo3mv
	 2iw+DRrOs5y5Lpk3qkOCr1znKT7td1LpwVOraatpJ8xzXf/hopqj8Zrge/etR5iEwJCuF
	 doKC9/284ny99b0XZi91bIH3sHXp/YonJui7wgzZMT0qEDHtFDrRgNPiYOhzP6CS9yO+a
	 GghqbYXEtUM6G9f18ITLZyjSe4+NmdpfqXZRKDDqus79llNrAyR45STY8gYgJs0iT0vQv
	 IHdLi1aLLKAdGy2dAk+kxlOKxjeWXDkaPDu5V5058U7PPYusDXKARPr4O9AOaeXx3Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="f8/Lj6+P";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RG1mwtRv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9644F606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9644F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f8/Lj6+P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RG1mwtRv
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5Ywjj752083
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KcNcY337sx7NujaeCz/DnRXy5zypv6RDzrNLxmfRG+w=; b=f8/Lj6+Ph2jtau2X
	HaeYSMlI/wV4ugoBWJFNN7k08DqFxAeks0hD7U7hR8eBWAWLkDfbYkIjZrT1fXfr
	kAsKrE+eNWkN++/ACZXcAjvTMblPwjoT8ypOiLUCySmeUjv2o+0AFjg1/1mVy5Fr
	qHxMx8mSHBkZsmPYeN1ZZ64cLkD0IxIWiusOeWxwJQn2cMOkhPa0wft+kthF7vgj
	xbKb8C+o4XIc1AhZve+Fn2EHJ+j285tt6UDaDuZzmF9V3HCMUSPwTIkIwDfRUinC
	1qeAF0ODs8+0JwjyCznzq/qOvJkoyyoc76fGSvHx92tRP8b8aO/uhoS2ldCRr6p1
	+av9gA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmapa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:33:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536708d1a3eso15275551cf.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090037; x=1793694837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KcNcY337sx7NujaeCz/DnRXy5zypv6RDzrNLxmfRG+w=;
        b=RG1mwtRvjZnVpJsO/OCuiduUjg9ysDnWNCI3ZOdyyr9kKAE9ZHeb45xT2ZFA3Jd5sh
         sOqETuYNBrYJr3huO9iFHJxNzwnLYNTI3oCa74jUD99eDPlRnkhANqU2la8ijp5a5fb5
         GAAME8Vf6YSUAE8ccycCzqStUU6ACYsd2bKUvH3ZE+HOFtJgYLAQ/FmmFcqJbsnWZDHB
         oYKbHdsB857eWlqakJ29y2X0DUz9mDgsCLhMo7lPV574W5jgPyytb25Gd5//et3lGg3p
         sBbeUNdtAs/uMqDTNBtPQRAkzPveG06OZMG9hnsI6ZnpwffbHv1kHFYo60FiNLTLnHY4
         rCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090037; x=1793694837;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KcNcY337sx7NujaeCz/DnRXy5zypv6RDzrNLxmfRG+w=;
        b=RuwY0utBzVrdCKMORXEkP5+EYieXBIug08ci53dRrXTl28cx9HYi+jE+pbBc5uWL1s
         oiow8UdcBlqu8WMW25a/xdX0AVl0ijEbmb2hkxxAAcMH1sfMzUdRh9JwVO1gBYfKhXl6
         ipnQ1rKCoApKJtVM8TKG27YX8DbTUzoEShZAQXyLSW9Q5Hk4vsrgGlJIV9vuDnkNea0O
         qF8fzFA5P9u9m3Q6eBQLqPtCFKiV7yX53u1nt9kJq387mGwGWvnC1G7YZoejHbWzxpQU
         vIKCXhvBQA53SpyYXlsxREAOELa16wwpHQKquF6Y8ntfVtr14SQ29tHhQye3V2CT+eHv
         7V/g==
X-Forwarded-Encrypted: i=1; AKwUvByAmEjMGxvhl7Eh+e/hL+WUuaphAF7/rqCeO80Q3nJ15ZsAaQpLLxy4uIApl/fz9OXSkhR8g0u8MMi5@vger.kernel.org
X-Gm-Message-State: AFq9FYJmUrUWVA7W3LmGr/gh/Hzh9YM3vN9Q2X1j+H5EPOtC1m7zYTWS
	cso5Q39/d+kodwj01TwfFvhT0Ux3hMNXrlfuPrc+GAqHhtuaCLKnOl60WlDbuIjsQ8FdUp0z5Nk
	NnQ0cDIzNiuu/G6D5qdHCqdfBv3KyAjIrwH0nAM3RrTkTnIqYjHI4KWjGMJFOPfEh
X-Gm-Gg: AYBFou0REzDvZdXBOA1ydTsmE0WOh4/a/JuD7Dlxvb+qRrW3pyD5ACtjhprOIqE3sp8
	DAIqQaDE0y8qOKXah2KAWueADBK0DaQnw3OyhWpdXTmMztjUQm234/gSBbsCivjqWyznPfIre3F
	XBbVFN/y15rGUZ71az6rsAeCeqrhjSWu+zOe0w66e0rgmDo38vja8HEyKA+KGieRniQ2/989qgb
	lbbFSoVl2OK7aBjBdUcmh6gQYQy1sWBLNHHyA3iBOyCXFA0P8euxyKoKOoCPCl4uXlNrRggNxEp
	+3+/NmMbUFJa8xqkOfPhdOvUUc5JY/gCEAEVWgv8ngkl0Od9GCQu4F7M3lotGf0TZQGAWpjYMzX
	uAhtr1tlRsbWprpra3jFdUw==
X-Received: by 2002:a05:622b:212:20b0:51c:2324:666 with SMTP id d75a77b69052e-5383b547886mr145891971cf.3.1793090036641;
        Tue, 27 Oct 2026 01:33:56 -0700 (PDT)
X-Received: by 2002:a05:622b:212:20b0:51c:2324:666 with SMTP id d75a77b69052e-5383b547886mr145891611cf.3.1793090036019;
        Tue, 27 Oct 2026 01:33:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c498f8e6badsm215366066b.22.2026.10.27.01.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:33:55 -0700 (PDT)
Message-ID: <46403aa7-ef76-42a9-9bb6-5ada503d2fdc@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 09:33:52 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: sm8250-hdk: Add PM8150b LEDs
To: ShiTou Hong <redstone.dcity@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ShiTou Hong <dc_redstone@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
 <20261027080758.3990418-7-dc_redstone@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027080758.3990418-7-dc_redstone@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX8Zxi/rinMm0K
 2CYBWoIHWRu2Zx/CpshN68LEppI7RigdWwSFqrN7LhHtCPQiwmCD8ZRg2pdPhVt+mdjgx2VQjCO
 HTZeoUGcILA48OLih/zRxt87LF5F6wk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX6KFdIofQeStg
 SsgdXhBZoa4bIQpbQKVCD27w8hMq4meuLcgQMA44CXCpVsIQ5SB+mvEhElKRtn+IO96VPXrt/lc
 TtT/lLfJa31CHE22UFO87chyjJWBaQnJxUwibpPSiccs9UUx+mcUPjsP2ChTGrtywSkUfsRN+zx
 yZBTmPUIYtzzQV8ebySNXsodp1nX+jCa6mu6Afs2GmAOjbgKEDBhNbwiBjztCtyl0P8odNwZcRG
 qPd5hd+eINesqDypkdte3l1JYTXNvQdm4/Ge4HH8DvIgYKft/ll46tcpM/y5l/dxyRsUJ4pjS0G
 Cqe9WPS2EzOH9txgvXnZfdsSYP+6QHic8+qVBFGUVc3ukDEOW8H/mGNJ2+9Ow9yvvO3A/xHmmer
 4eGXdHvewq9V7MsKr5TUhWgUio9mTC4sqJATqOmNA84haaznA3sm9Lel1mmrz+Q6BxpW4Xfs1s4
 CcwkQJL6P5UtYQNLqYQ==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae061f5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=nbs0e3HrYrdHu2yMUt0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: yf4y6Sc7ECgMVdMJTF8bWxJkMqJ-OX85
X-Proofpoint-GUID: yf4y6Sc7ECgMVdMJTF8bWxJkMqJ-OX85
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270033

On 10/27/26 9:07 AM, ShiTou Hong wrote:
> There are 2 LEDs controlled by PM8150b on sm8250-hdk
> which are not added in the dts file.
> The LED1 is for heartbeat indicator,
> the LED2 is for wifi activity.
> 
> Enable the LED controller of PM8150b,
> add the LED nodes with proper triggers into it.
> 
> Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
