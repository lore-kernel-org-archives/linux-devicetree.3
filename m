Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926323A3E9A
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 03:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517369; cv=none; b=XNndYSzmy9MlD/UNzx1hbmpchWZjGVPQhTsnrPA3fSyXwuurLG8toqS05jpwURdPVmkWcaDheTapW3FbpIXF1x/d1GRiq5xjNUSBNDH98vIAHA+zLZvFwFXsbBtvAbsUjsue2s+pe8XgCIhbqOHgn29rZtMeuluKq8Yg6B9Lw84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517369; c=relaxed/simple;
	bh=oMmbNnz932x0fDcbEC3ogsWJcritc4/OIAiDDCwdyVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cNZure9Y4KQEKUXGpUUAxOXYe15WS/O298rj0smnn0bVnApJWAjihRcFR/chc5758a9MCN8l2mD8RAhWHRUvoLo/PSA5Hcn6e3L8Q6zLoOh0l9hWPSpA85M9hBJABWEtcllGz5CjsR3YM/mFm3I0m8S4Qup4CJAa8V0Oc6XwZ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5KBbTJR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0y8PikE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5KBbTJR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0y8PikE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HMZ2594550
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 03:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t1z7NeV5zzw+Qh/Xy7bTSMaYqP4hRm0zEwpbgCNxVr4=; b=E5KBbTJRdB/IPv5L
	HPEJG1sGFDtiA8Ok8DX7DysczMA7y/EvzCmu9GobIIJShNphngiMCcgHBCMvSxCQ
	zI8UET9o3q9qLtpnwJvBrP30Oa5eE7zZIDmOtPYUM30HMOvCZ87eWWkAzfnm/H1p
	Pta8NHDJFoVR51mIbqn1fl2e2FN6dRoRO0CENgkTqyJwSw2Qlt+E+GsYAHoMT7RC
	O+9n/DzRb1Pp0bEJVwdgbaFQLeYoWp2jWpfN6ltAVQH+TN4rfoHv4gcuWHzsqb0n
	5EcWPKSwqV1TwdxcmAGuMws4LLoQ4PQmUjeAkogsMkOBz843AqH6qPsQh1iS4UOM
	KTtcWA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj2xc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 03:42:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso1295738a91.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 20:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791517361; x=1792122161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1z7NeV5zzw+Qh/Xy7bTSMaYqP4hRm0zEwpbgCNxVr4=;
        b=h0y8PikEJRfd/tlSt9uvx8MRehvGxtY5XzIJMeP60YR5sipv6P1aGvgwSPVclo4Rh2
         AmfsB3gsUmDsCgN3yP1QnlF5WMaUcZ4wke0qdMfcm2k/+NWlEweGKnzR61bfWX4ZPiRC
         PJqRdBIOXAs7h4TE9LGpt8IvnxIXix0XOY9jUgB1agLfG28Xx3tr2TUulm3Z86oJ2qbl
         3Wx/Fjto1ipK49161pfr4lrJEDz1KAHMKaVCwYhYMeM36Y2lffIRGReRfxzSQpvP/Lae
         mv0wOOmry0Cg4Be0teiOu1a0ib/yB7txZ0x5dlaYCJN6Xiez2rFeYwjmhcqTevX9bLJx
         0dNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791517361; x=1792122161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t1z7NeV5zzw+Qh/Xy7bTSMaYqP4hRm0zEwpbgCNxVr4=;
        b=o3ZIsYrYP0D9CNc3TfEFRP1V/XVRIRYxbbAyC4V4I6U7t3CqE2b87FADeN3ZmkLmVa
         aZ/qtA+49gjaQSS4pirnLMdfzGN3MhlIv0hzqE5j1y/bfbrxKrmXnaC9q7kjLWfQb5XT
         gT/LElLFChcCj0VZmoEq8uE1gRZQBYMv8d3vfoz0qKdPbv8Abh6h1sK3LyfwnLMIo6Hs
         xOQeVPtnU2LtmTmsx9RJsIHHqFt2lEkroaHHnd0660X5LkMVAFwBvaJVMeu0D3po3kyd
         ZoiME4n8Yemw2RK8cebCUYnCBwxWeeeyAqewRfu/d9wmy+xWf/1yjj68Iw68XnrP5FEG
         u1AA==
X-Forwarded-Encrypted: i=1; AKwUvBxj2IgrFhtnlf2Bw45Wn9KNxlpGGeZ12hS4HHcDLiTL4AjorRpz0W5VxQQoxUq/MNuqbKwtXmt7i4X+@vger.kernel.org
X-Gm-Message-State: AFq9FYKNc4fgZe5CMUG99a4LHZUuRspseH1P1zBdFQkbkfQMiIdgXx9b
	Ih+3TgDJXRIsVIOJeDL77LFgr0jUOIfyBroGVbAMhizjnIc0QHm7oRJN9HJe8D/ChUy9+x5FD7R
	sUSzaMXMO4Hk4daI7NTJfQmbtJdzct5DuHyj7S1f0IkfrNjS3/4Y+pQnm/86p/9Ho
X-Gm-Gg: AYBFou1mQW5ytxLM/tM4Ch7IYRczlWLMv6LxN9qByIjjSZayPv/UHDs4Ep8HBrahCC3
	Wg6mRDMADKWXEVs97hGTY3QcbAhCf+n6J3U1AagFRkUEdOwxqlKvtVS0BkZtZcBV1HMmtUXLTaN
	l5K8RAwFdjwgymdEDS2ctIYILnAKWjOHrlu5P7KBQcrHtoBTBHpigyGjjTAhN5wdAU6C7ua2EEN
	i5nUCSkYI9hPYv+NX0QjU7fVqJYYVwm7BNORIL16KKQdKMqBVuf8M0OmtVhTRRsAM88PtNLZAC5
	wcCEn7lugkda2kMgX2z0C2Xvqidkn/ACOjbKN3u7S4/QD/TwoH7X4VqzgOK50lkVSy76ahy+z4L
	MwDg9yLb6n6lJyLx/blWx
X-Received: by 2002:a17:90b:2d82:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3ab3acdc391mr403441a91.38.1791517361035;
        Thu, 08 Oct 2026 20:42:41 -0700 (PDT)
X-Received: by 2002:a17:90b:2d82:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3ab3acdc391mr403427a91.38.1791517360547;
        Thu, 08 Oct 2026 20:42:40 -0700 (PDT)
Received: from [10.92.18.229] ([114.94.8.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ddac6dsm1351959a91.7.2026.10.08.20.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 20:42:40 -0700 (PDT)
Message-ID: <4272947d-a9df-4cf2-b890-c2b2392800e5@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 11:42:33 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 00/11] net: ethernet: qualcomm: ppe: Add support
 for IPQ5424 SoC
To: netdev-bot+sinfo@kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
 <179147126645.2527009.13829110581548714861@kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <179147126645.2527009.13829110581548714861@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxNCBTYWx0ZWRfXzzRFHSF/kNNW
 8nte3v2dzRmDaZvZ4/6qFinLn+Hij/B/KgNMOsyByZJg9JR7lu169D8WE3CQ06+x86EPgbQ5Ck9
 SeyKVefbsXkk96ig+HJWWWLGxnjsrVqawdCMTPE6wm0No83wLCW86F54JK46AIbns0DWjG8pjoL
 jZ630B84a1nNMDyyiYBk32EvIWISrKjgK2y0adUgO7i7x4PNZCYwJBGnUrVU/6L6ux59HyCTLue
 19Nggbr7N8R3owcFvkqnXJ+/IOdxUrE97Aes7Rv4kkTmTAbjnPBconjEPnVIHSkdWdHftE9hMmK
 CXsRx41TK8bzUW9oSu5J9X+qThP4H7BZQUSQMjxfhlbUFuGhuMRFDA5RNGIvUEqof9eIUzq0gFF
 m7FYRB+wLwcFfRpFeaC2YRerfPXROwwCCWzN9M88iXSduFsvLy8hN1zuhoGxS5/SoH8ngfzzIm1
 cxJS+usqbpr+UtyKGNg==
X-Proofpoint-GUID: RKTFEHAPc5nb3fg16EVJzBXUZDlliRvz
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac862b1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=+dQloWKbpC4JZN4npCJT8A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=wfrYX8O7EWgUh0Dss7UA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: RKTFEHAPc5nb3fg16EVJzBXUZDlliRvz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxNCBTYWx0ZWRfX6oZD5/OV1yL5
 y4L0J7YiB7wzRbLDeKw6SUsAKmQwsOZ+RjC0VwLAWBoibGBeKkLf9LA7NyzmWdaWhanr6DDvKpS
 1qXlHvSvCzGP5K5SQ1p2xtAXl/b5V/U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090014



On 10/8/2026 10:54 PM, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
> 
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
> 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Both issues are theoretical. Neither was hit in production or reported
by users.

Patch 1 (dt-bindings: Split EDMA reset into sys and apb): [found by
manual code inspection while developing the IPQ524 PPE driver]. EDMA
driver is not upstream yet, and no in-tree device tree uses the
ethernet-dma node, so the issue cannot be triggered today.

Patch 2 (ppe: Fix multicast queue config table index): found by the code
inspection. It was not seen as a crash or an error message; [the
multicast queue thresholds are left unconfigured without any visible
failure].

The series was tested on the Qualcomm IPQ9574 RDP433 and IPQ5424 RDP466
boards.
