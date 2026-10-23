Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743243;
	b=evHX4N4WrQ/FX3/HHjlcI1bGs/RUdgSCfxwhdHqoxuq/3vFCQcX0vGz/gAvnlyQ3z3a+
	 oQLZvF7iYszKd0DFmzsefpvRki4d1QBX9pvfs+1KZDW90p20INDDf6FQ3uoyheMPHQ+x3
	 IpY0abdh09ABViWqZpWfDa6HLDYCILKUyyYkWMCbNXU5J+FF+5u+OhETRLQKgmhQFbeKN
	 uN6izcPtvMqwmo+rv7I5CeJ3D6Fz8ql/TgYWVFBCGr8irpk8Xo5o637m2pn5Fjtf2KAqm
	 9jeBkktCf2yn2ZbMHAHN5B0dOPIL8APYtK72kCx1E2pTND1kE2is8FH9M4WCYdxGvOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tqv4KAoTYY3S/U2JwEiFFAex7twOglJ8WJnUqUg1DcM=;
	b=OGxrUmQRDy7TBSNEKNdWL5DiJm1mNVo9C22K90WXhi94BrzXGRD49zZNtwheW2d/tX87
	 9L+IWWQbhpoTf/+fIY/6eMIsnjGoQiCK2ytQtUvW/a2IQau+1RT8lmnPXnOrrE2z62G4m
	 7n6Yel526+b6/jaM7NretN1UxmluRRlH8wY+w6s5OigwgSjF44o5Oe4J67TZHKi8KZ/px
	 7Xx5Byqo0kNm8WKNR/SfdRJkPywY1vc8h0E0HbJ55rxRU8T9vZOCBH8Dr/AvK7TEOlA8G
	 3GXu84ds3n7qKygZmbC6IMdrwFgJUiIjTK9elcL8r5m1yX7gWXMn/LWLBobLryCOztQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJQsA8Fs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0FuaQ0p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F2160A2611
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F2160A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJQsA8Fs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0FuaQ0p
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FLdO1048142
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tqv4KAoTYY3S/U2JwEiFFAex7twOglJ8WJnUqUg1DcM=; b=kJQsA8FsdDYDXY6i
	a7Kj2LAxWDzNHdXqTYI8OUen0oHwtkYY49xBoELPc7nsS3cmskLKwlLSQuMI1Sfz
	PQ8/BdIr+lSMLozM6PymdpD5dU3HjuHwh4a5XIRnCtneyZgq9dsjQ5LKU9PZL3gG
	lefv5o5fY+/kjDHBCB2iMrXOQpZpJRVbfwokoURV/idtOFD0KAO6VLk0sZsUCrsU
	5tneIsou6i0pqjtKPcEW8Ajev5nljBoxbIg9OCcyzjB1wSvh7gkwUVCBr5gQ8H54
	yDjCWahkVkHcW4MKPCMPHpVtBndx3L+ZDbwKERK5HP+7uOTs/CY8sT858z7Pr4Ip
	NTGnzg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbjqas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:14:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so762590a91.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 01:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743240; x=1793348040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tqv4KAoTYY3S/U2JwEiFFAex7twOglJ8WJnUqUg1DcM=;
        b=S0FuaQ0pkI6VjzKMlizG3ZnUjauVgPirRVozKYI0Yh9BFgO71UCTRUU3zG13O1d/Xn
         4P0IGe0lD5Sf4jGJftoAKmu4zT0YMvEneKlojMLzTlF4sWMOSrdxBXUp7Hb5S0IhjEjq
         BYKn0dYhhf9PI5oC6L7/G+pTuA08lMma2QYXVQCQeYIJpuHMsNzgoi81eVs35MSSq1rf
         6P7anoX6Azgf1wZazuZn5+gscmu6hm+PZiSEA1lcXyb8pN8+KQgWNGrNDjig6PErBBCt
         nlHirsSmaoi5fFF6L/gw5jSAmbt6nDT/4WevzbxIeCqdqSrJTaj4FrNn/d2cQ9wvx3fT
         COqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743240; x=1793348040;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tqv4KAoTYY3S/U2JwEiFFAex7twOglJ8WJnUqUg1DcM=;
        b=L+DiIHWGYchKh/y7vdp3VmBW5HYyzp7oZelxsvLX6Hgbr3Q5Z7X7o+fzccXRQx01LT
         Nv1kjWHIpx7lBTxFSxqckJ7ZB1F+S8m49DbpxbvUYKIbLXy5wh9PAEW3gzhjdKZSTf2U
         rHv5/m1NWHH4m8GR42ghoz45j1GjdGGvX3tv3CuCWy3QN7hpyMhOVrzho6oaIRlKw3x3
         r/KERTR6dgyGUrHtYU+YS4GXyQrK3NxMuyxPFBPFv9Zpggml8co/ASGpQyb+NXotef3o
         hWQswMJi4NLyyq4yew5rgnbezPd2r1I1uhoSEbr1KvDFeDODHHqi314ILNTUqFskzND6
         7UDw==
X-Forwarded-Encrypted: i=1; AKwUvBzPC/ac7dusq5ktGrEc/kt/NvgFkYGEAZfb9W+ksM7r7zij2LrZgTB/vU7JNSwf3Ry2ZI8l7mTg6PSB@vger.kernel.org
X-Gm-Message-State: AFq9FYIgzWVXAhyO2xqXGxQfgvQygk6pUmcE80hrKXK5vgfhp2HJGFGn
	B03x6DCxxAJVITrH00o4/IZs7EYe5xEPYeahVLMJEzLOO5IDa4veTcfi5PUz0BQf8UAi1TOk6i1
	E5ywx8bDeWoPjwtqQpWtiHsLu/wxp9DX2FGVKurC0wsVVyDbPxAKOX6vfkRVa5/aD
X-Gm-Gg: AYBFou0wuxFoHrhMljkz1XbnSxnYAd+i0GsA6IIkpUJ8r3Gk5aWgDMzkypmUwqGWH26
	Vm5Z/b8M8YiuQoc/slXwfdTMIbPZPOO4NNOtWfnbo8Mdc6Lo4GoBnVv1CbXjwxxVT+VG3N5i3gI
	hUHdOs10B49DkIuVJZ39CzER3piWbt5GalhjQ3/q068s/XLzpQ1QVIdebU61oWeBQKorwHrJTAh
	X4i+M9aKdntExZn8LD9fDOGO7qiAFdygVdqhvn8mZev7Rvvbavg8BzsWK+ZRZSEFzkZ4Kia9wW/
	OHHORr9tD/ruNtwy7z9lHE8ttKR/clluJ4BxzI4gUP3882nI25DuTY+Ak4+9K3if0Iw/dkMK2yx
	fGMpEur1iBKoXP+ERom0hcEnEMTCpHZ55lw==
X-Received: by 2002:a17:90a:d40b:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3adce616026mr940563a91.20.1792743240435;
        Fri, 23 Oct 2026 01:14:00 -0700 (PDT)
X-Received: by 2002:a17:90a:d40b:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3adce616026mr940524a91.20.1792743239783;
        Fri, 23 Oct 2026 01:13:59 -0700 (PDT)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4954979sm7758959a91.17.2026.10.23.01.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:13:59 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <4c4e48a7-5ece-4fca-9387-a50c29bbcc83@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:43:49 +0530
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
Subject: Re: [PATCH 09/13] drm/msm/dcp: Register DCP display pipeline
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-9-48aad0fe4f72@oss.qualcomm.com>
 <b2cf0c52-4c31-4b17-b341-029b82ddbd7f@kernel.org>
Content-Language: en-US
In-Reply-To: <b2cf0c52-4c31-4b17-b341-029b82ddbd7f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX8AeEr+Ne0v+d
 Oyn8kIQr5ccpWaRtqQtNJDlcPKQcEKm0cyiUMM8B+mdZ85OSTBxrnPa4SvB/EpmoeWAr/aN3lcN
 mZMdI9RjgIlEVjr4ulHWzw39xS6Ad28=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX8U6v8wvDhe6y
 N05PfF4SzLi9zHbBiLdoSEzCYiy17pTDGRMcsWzrxoVNHN8/TtdRzJ8HLNjyAc9zo61VLCo1Owb
 ZJBZ1UV8Vche9Nqsu9hcFZguC5EwlXt2dcuihwi0BSuqGNCYeZodCiekAbx634F2+l/Ah/fOlld
 ENV59EsH8zarp652vtUMZHVfIV4oykS9azVvww/OEkqBSx/hv4kDJKxmfeYvYZ4YyExIcGCBvqW
 ZsYT+3N9yMAeWCLLqwA2ubp6NQOGsncjlZkvGAKA4O0VlxCrsB893YSWedPx3XdCqKW93xPoLy4
 +LgoP30/xx4nKa0ZxYmI5DnDZrHtP9ZkI9640JzEL+79YUdUKSlRC++UeBeSeDxUK1TjLxCrii+
 /CGEtRUKmg2s89+cTf9IVcnJdlmFqXVpkpzUmYHyKDehazqIJyoH9kyitiLxC8q/sgcR6AtOYZn
 G4yKn93zTUFdds2UgtA==
X-Proofpoint-ORIG-GUID: OIpIWRI95bXJv9bigH0POzNfZm2QdhTR
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb1749 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=_vtLzGX-cFUddgSYHekA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: OIpIWRI95bXJv9bigH0POzNfZm2QdhTR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032


On 21-10-2026 17:35, Krzysztof Kozlowski wrote:
> On 15/10/2026 09:38, Jayant Shekhar wrote:
>> The DCP firmware exposes display resources through capabilities rather than
>> through host-visible display registers. The MSM DRM backend therefore needs
>> to build its KMS objects from the firmware capabilities and device-tree
>> display graph.
>
> ...
>
>> +
>> +		remote_np = of_graph_get_remote_port_parent(ep_np);
>> +		of_node_put(ep_np);
>> +		if (!remote_np)
>> +			continue;
>> +
>> +		if (!of_device_is_available(remote_np)) {
>> +			of_node_put(remote_np);
>> +			continue;
>> +		}
>> +
>> +		if (of_node_name_prefix(remote_np, "dsi")) {
> Where did you document the ABI?
>

Will update in the bindings in v2.


Thanks

Jayant


>> +			if (dsi_idx >= ARRAY_SIZE(dpu_kms->dsi_bridge)) {
>> +				dev_err(dev->dev, "too many DSI outputs\n");
>> +				ret = -E2BIG;
>> +				goto out;
>> +			}
> Best regards,
> Krzysztof
