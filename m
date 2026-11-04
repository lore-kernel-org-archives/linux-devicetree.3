Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781900;
	b=a7dvKXeV4W7zdKKSU/9lbaaVz9BrH+iQZ75X97zjAJaLHmPA1lSHbphbCHAXvVtBaTFJ
	 RZZFn2yJzIeyVHAIEo9IzhKctdyd9/qYwvt+GAYe/aXHjqk8RU9Q/glrR6QBocL7dTINg
	 dxXCuJHwYGACE2C+ygySfif3fYweClukAnqV2KqIjulHLO7qs/o4kXprHWj3eSKkhNuns
	 8Lx1k8afsqax4yDyNQJEhcGgdhOqsKgnvrpw0O8S2sM+Pue7NPIWUirN53B8c2xyozqnG
	 faU7F1k6c4w9V0+E+NY1ugiHIYiaOwwyH0F6IwZkA1XIyAHcsrbe0wWywRicRJd3X1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=n+TEDrUElWg9uttZzwotv6ehhRQDadzLBsmWXWQ4tek=;
	b=MmEqduSMIVr+hsZ1wI575bV7QODroKvGWei2swC2Hbbsi/keG8tTxLq6ECo8KkktBGSR
	 qZw8aPIwfnboB0VHhrAjXaWHydnhoReQnNtjQIrFPAkDvCkdmKCqF5Pif648k6Yl89Ker
	 W1kxyFEfRCDjf5CtOuNrMBkf4wnmGugQXbXoD3DpXaQP99zA7uYW2KFFWY+mC0QvyYCIy
	 x1MBVZNwhnhbOIgRYweLgdvn2wkQ/mUSvXa56PAkfdfRTk/CTDBvEH/keT3OerW0mWS3I
	 /BLPxcJTECbtzinsBuldQONzOzAFmwt+9hQGxbQKfbNY7NEtkD+toHwuO3j3ALc91lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L8tpp8El;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=An8CfSCW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F2F606A32D
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F2F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L8tpp8El;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=An8CfSCW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48Ksbx715360
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 08:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+TEDrUElWg9uttZzwotv6ehhRQDadzLBsmWXWQ4tek=; b=L8tpp8ElNIR+2SCL
	7ABPfhPua3esRfL1aCbBvR9OMxlgtGpIn0i/qMU2pEcNo5Eqx3J0rn2c+0kkfR+I
	U7/8vrjIpKlksjXwfdREkhZVExiSm+DC1oId2M7zdyVNVkECDPnxUmevJscvZvGl
	InIg2N7mSUFHqnfg0xSNZQqINbtu7s5o79YgzZ8+hKj8dbnah7ACvSe04DRsmRiM
	Xwdm5i74GRLViDKzpPTEx32acz5ROpfe3JHkOsB3MsyKe0irSgrfQc347pSSDkhj
	wAnTUQBTyaevg2kGbnx8oyv1WV8X6mwi0e3m+SKJCpji9MroqND5HXNR5fjCX7r5
	MwXiew==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y2tut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:44:58 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bfa915da7cso343146137.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793781898; x=1794386698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n+TEDrUElWg9uttZzwotv6ehhRQDadzLBsmWXWQ4tek=;
        b=An8CfSCWQwW0diZJlUulskvDtINwQDb2uX3sBnyH4H+oUBkqWKth48+Tokq9/nGKv9
         aX5zX9LRrG68zdr6uPkjvh4W9NScqizMgLHETeYmOU9SS8glbvDeZPVZPlVtLgMw6o9Y
         jfoURFC5Frz8t2D/AZONsYOudkN622j/5ll7ItvEjhL7wuEzXuuzXLAu93izx4PaRxM1
         4GOmO3Czlm00iEJDYwNTVDpWf9QhXGOZ5F/OFeR6U7HCuaTh+frAJOv4UYJk0Czq6jkf
         le8kTXegA/o9/hcNVjEgxnDUkrMiQL9Ah9c9R9z76oXLV+GfXr3tc8vFLjyXHvfdFpQW
         V9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781898; x=1794386698;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+TEDrUElWg9uttZzwotv6ehhRQDadzLBsmWXWQ4tek=;
        b=swvNtjYatu6EApydDgE1lJ5tt1QrG7M97z63Iqk2/jMwwEAFJ06c8ekD6MkZRZu23S
         9dSDaX6UVlH8n0ORYp4gjXkkMURPNJyWnxqa4xMggWmtwc/JOYF9kGxk3+6F+fzzJ2Ps
         k6Hh5J6pgKnr0/SYT9Vm4gwmHWSJIHSelOlTn99ZO3wUR0JPLOCsw0cLdet7weDZaTAI
         9h3NkkN4KClmwtSYox7z7fPSmegKkTLmHL17EukCbv14aeThpivR9kxBFkOrFu1e+aZ0
         CE3b2Ok9889mAZ0lWNqpVu+DwoJfz2tk5W7GrQOgsBNzbJgiNl0U8S3UOf/L3RZbxH7f
         TGPA==
X-Forwarded-Encrypted: i=1; AKwUvBxcNVaZteYaGH0tC2sCvE1jqwwNMNlonzCbjU4Xyg768rGH+j4jd28T0dx0Q3pZmPkxG7FZySJnbiic@vger.kernel.org
X-Gm-Message-State: APuU4Z+hDN1J/N5qhPICOX8isSjDGXc5Rp+bcBEaDb/2t1IlQy5jCveE
	DFUeAWbu8Ph3wpNQ3H0THpJBHXto9K4mcWlyXI0KOpvfa+rC+2NJwhhi0GNtTLf4KKLqEihqVy7
	w651FE8y28Y8iU5DBkCZXG87HK9DsNx+qUi7DE7Dd7LupAui/cLy26OXCYGmR2npY
X-Gm-Gg: AYBFou3wt277BONhvye9+GYSKij76oq5KkKBWHMDJa3VBdtVCyF1/zNz7NXLvdDl0rQ
	iUaUlxcRV3OhZ+foc1PacGzJeSshTqlk4fux1eTyQy10r67F/XyQDOPQTIPfGt7HQ60ITmAs1XD
	OS6oqabsJGBRv9syfCWGGgdShgnDwyRcpPPysFuAR91GA0ebhSB5BDYFNyYpLgUoscI6TufIbgu
	7mqb85Mcs5GMMs+0iNdaVdzIZ1US4g6VtGAnuxoo3ZcwzyOtAn+MprsbR3Zw17HK233iiqB6ti9
	4fZxPfRsM/zLpwQyO33urmY9aj+V53YHlumRFjFSVotGjd2xDa0IqJPV7JTXOJflsEto+4lo9HJ
	EXap4ncMxneS4pUNi9qaCxdVyV9zSS0eNKC/L/R1Bg3eOgGJ8Zu0eLy51/dOt3Sxr7UqWeLgNEg
	==
X-Received: by 2002:a05:6102:3f9f:b0:7cc:14d:52e4 with SMTP id ada2fe7eead31-7d054182fa2mr5047786137.8.1793781897748;
        Wed, 04 Nov 2026 00:44:57 -0800 (PST)
X-Received: by 2002:a05:6102:3f9f:b0:7cc:14d:52e4 with SMTP id ada2fe7eead31-7d054182fa2mr5047765137.8.1793781897282;
        Wed, 04 Nov 2026 00:44:57 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d7f7sm2658699f8f.38.2026.11.04.00.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:44:56 -0800 (PST)
Message-ID: <6964d550-2ddd-463a-a142-9e8f72588803@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:44:54 +0100
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
Subject: Re: [PATCH RESEND v7 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC
 haptics
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20261103-qcom-spmi-haptics-v7-0-418de67ef84a@oss.qualcomm.com>
 <20261103-qcom-spmi-haptics-v7-1-418de67ef84a@oss.qualcomm.com>
 <20261104-myrtle-kelpie-of-chemistry-de43cf@quoll>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-myrtle-kelpie-of-chemistry-de43cf@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aNQk0lne1wS6zBYxz4HIqY_GUC6yPFYz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX+5txt15T4Ycu
 mCGCsUz5LvS7tHt3ilJxAHr5VrU7dVpe3D392u/dfqKcxngwnt7M+A6WGGu9CH9brRbx2wY34y/
 W0YZ5v8LG5nsDlpTKLutmMTb8+W7JrIUGggN8vsroc8dLdv9EsiY9NZzTRidQjYzY3PZCE60/Pi
 MghIb0518FC+jib7fQzpdWBoXr+cCxVWXdea/JFvkSHuHD9gtFYyXpOuQMB/MwsdcxArjQ2N18R
 vGCS9r4BFcIe9OPWJPIlDIaug2lFKYAhyMe0wS5fW0amHggZPtGRwT68uJ0s2fixEOll/TvivvF
 G4yeXKs4gqVPd77IDkrWfYP89V4UEvJSIcdGWuV954yGFmpnQqCpw2152uecDz3CxUorUo77nBW
 ts33kUpieznOTW4z8MO/sZhLY4SL9TBMH2zDZp3UmrMY73lioqzkTAydYpZHLV1kjH3ozf6FTAp
 kuAC87KL0UOvSsNwPpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX2Nr9UOvYuUe6
 VYI5rBERalgYhClG5cH+MP9IJMTrVSEt1cA2ejDBOr7rJXRI4hwShR1nTlg2c8OTjPZTPEL7u54
 HcTut5igehFReC3GObuZGIBzuzUq/BQ=
X-Proofpoint-ORIG-GUID: aNQk0lne1wS6zBYxz4HIqY_GUC6yPFYz
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aeaf08a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=kU8dVnbwxP-e-aHbJ4YA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040034

On 04/11/2026 09:29, Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 08:51:17PM -0800, Fenglin Wu wrote:
>> Add binding document for the haptics module inside Qualcomm PMIC
>> PMIH0108.
>>
> 
> Why are you ending this? On what sort of ancient, downstream fork are

s/ending/sending/

> you working?
> 
> 
> NAK
Best regards,
Krzysztof
