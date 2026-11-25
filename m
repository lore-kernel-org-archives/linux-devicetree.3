Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606509;
	b=MCOm9FWcQ0XZNcPNzZbyNhMzkHCvdgAxqNmDKoDsJXl8KbbyyOrnVLoXSVBRddACqVwO
	 wXFQbjKVSFuIA15xCd284vo8V96Amclly0BE8K632LaYVgYijD9Wo9R3s62+vrLlCyc+1
	 BFI/1ZuPPIVCvf7Glh20EqY88wrPzxPU/pUZPszmpsCvzbwyQdGViN/l4VNewuF7EuoIP
	 h7Vxce2kd4ITyAR1ZCfoKCHluPyzusSfITIdx9RF6fHsC1mWpoo4QPzg9+Cb6CaLiDpt+
	 4aWHC4gFZpYIZcdZiIqQmJf1MPs0opQwxnoBUOK9Y3IpOM+gV8EBDQTbM7F+iadB2CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606509;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VZ+fp3JquQO0oKHcp7S7FzUHj2Ake0kZLnTu1r4JNUM=;
	b=JquIkI+K5eKEzRpocsIM5j/5kWKzQ6G+N5UgO2KRc2QAlimI1OGUo4hML1NGm0o3RMY9
	 JJVfQPy1QHm9mcVmmV9ZVX+hrtSQBTiE5+YDuETlLyvwfyiy392xgV3xT1syw1x7NuUIP
	 ukLoqspSTqCEG+DuFv8dGS3xix13a3wJ1EnYeoKIpgIm8gW9BMCMPl/iC0paJxEXCO4gg
	 8rFFr6BcKQyLmhOoZ8v/vMRuEyo0FUnwodfPrUr4v5raPByH2UyWC1qOEBdhwqIAXWydu
	 12C8/UuQ4M0AAe5Yvy+faiPhN7Flgde8JqnHEH4+W7+tXT2NawIMZg/nBUmiKpntPIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MYzmxXgK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qu6monxU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE03606A334
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DE03606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MYzmxXgK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qu6monxU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mNYI555490
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZ+fp3JquQO0oKHcp7S7FzUHj2Ake0kZLnTu1r4JNUM=; b=MYzmxXgKtuRtdvoM
	2/jIcmBxMyMhwy6zWv5SbPxLcF4LOzA7R7UcO91F01sgan1ZspmnsmkGA+cOm2Dy
	HQx70G7HiSMMYB+43HbQqY8a8U/POeTe31+pJFGHQ+uMQBzvvqy9OvDk2MOq0rka
	65OhKXLYAES9TesJTJm8ZfW37louGstDu1WoOZIgDDRmRawcpZi71Z38KBqx0/bV
	C5SAKD4MrZOT12H+5NKrOfD5epxhWZWJI/VXplb3G/Fl1WUl7jbKW6L2mjnPmBZ2
	n2gnNMebn2gHiHx4DxljHsWZlQZSNJ7aGudIie9I6CFahZIJFnnqPdmLefNMs95p
	awZA6A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnrk82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:35:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b4b76a2b95so3125094a91.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795606506; x=1796211306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZ+fp3JquQO0oKHcp7S7FzUHj2Ake0kZLnTu1r4JNUM=;
        b=Qu6monxUigO1xiKQfsBrY9HiaaLURfxH4xzis3QCVarNtpaNv1KtcdiIMyx3f4SMLe
         OPuoBEQEQmuDPdNLny2rHBYiy9WF3/JyK2hkQO/Z2R8qaZN3+N3Nzq3WBX2g+Aw2zzmQ
         b6Hp+0uffZWhvCfJTjWBY/a5xd4vUVE1FkRM83Ibjez5lWlh2822wD0N6CQk7B6RmfPo
         DfT6Lxx+D3NS4j2w9kaN/l4KcNH/v+5L6j2f3ag85BIt5YOb89y96PmT+r8R2PsWNO1+
         5RzCSLNP0qRIwmrzpIuTY+ORPpXOxXU4Cug4/qaQ5cbWgDt4F9VP3qKdFjN1yx4ejbhy
         fTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606506; x=1796211306;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZ+fp3JquQO0oKHcp7S7FzUHj2Ake0kZLnTu1r4JNUM=;
        b=0DQUUr+AWIhp4WU9l3aaebMr7XObgXoQS933ZQkXzp0FIg8QJvqqDfXHA8ZzDmNuvV
         V0VyGSCmHzhy63rEMlZfOwkHJ4qw9z1E8GsHjbNvPfYVQtF65qqhrKPIGbcYY6Q6hzVd
         xWwg6AhBWVf8KEinJ+9G1L5ZOF9UkpMoe+NX9dnQEwyDeTErOmbIb+S4TcpPrqZBYXVZ
         Ciyyg1wqyQys7P5ncwPz25cmt3k2TE8IyQRztNUX9FkwpCSzteMgcJNSJQzIEDdjSx5D
         8KvgLDvNPJVUGPqqjo8hF7CEAyxid4oVSLFJKzWuFW6NaG4x3mqQeY+9sti1Mqi9tJE0
         X12w==
X-Forwarded-Encrypted: i=1; AL+hErFohU3JWXtayj51U71JZjMKxZfzIMFOFn5FcmsJMTmS2RXWwJtBh48tmK2lSjQnGhTL17Cc9YAMFKEn@vger.kernel.org
X-Gm-Message-State: APuU4Z8ilc3Obw7FJnmlJdcBF6lEASphfcdek7pppK8FdH2SKzlpZ+W6
	kZvce7VBjWEqx79l/Dbf5Q2D+zX1ZEpnnR9xI1HDrPWI3nltO6lDcXH6ItxOaHSKWjBrTjulHVx
	Sk1AUbvHwXG5DM73TWZe7xx00d1+PM2eHMo0cqsumQfoO4fYQGrme04w6pKhCJz01
X-Gm-Gg: AZFdTZcDBqHs0IiXM2yybQcXxzb0qZuIvF5Xkzby8KUndYkdJFcs927l9idLof/FPC1
	U0jPiAGRNaVlA529lbR1eBepomCqwRlxWqIzTvx4ZUXmCuMtqg0burQWnYtsYYQsrZfDslkmLfh
	VvpWPQwLeID0NS+p3N8BXYmRuWeiOVg8gZGqd/ceVaNw/DiW4qmNiqwddZlrkIWH6EnRcwKDSCO
	H/khVQZHVxcfDP0xNhmXkcfK9RDf3s5s5zOX7nFlwMNQkN1MdOOKm9knUnzmHtJeR2wyo2UPy6Y
	M1ejS/g7a8SqGOwhu3J8XxpEuB9ChDlL60kIGQd1jipkvV/r6fhdRsMXDa8G1P+w5WEzof/zg7Z
	SboZLo0jm4M+86pMQr54xgMXXohaxkzaTAduQxgwVooqQlVlHCZ6yMv6+MSzI69jvP85xwFkdWH
	CVEAO/ouaQTCIjMjdIi6ALMq5Usch+aEvRLstYo4Yym0DNZtzmc/SVjujPz7bMmavXow==
X-Received: by 2002:a17:90b:39a7:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3b41c8d95f0mr16883182a91.22.1795606506449;
        Wed, 25 Nov 2026 03:35:06 -0800 (PST)
X-Received: by 2002:a17:90b:39a7:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3b41c8d95f0mr16883157a91.22.1795606506045;
        Wed, 25 Nov 2026 03:35:06 -0800 (PST)
Received: from [10.79.116.36] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm6347749a91.17.2026.11.25.03.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:35:05 -0800 (PST)
Message-ID: <396403af-1505-44b7-bf21-8c656c64c936@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 17:05:00 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add qcom,remote-owned for
 ownership update
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
 <20261106-egpio_fix-v1-1-569d220a4748@oss.qualcomm.com>
 <20261110-modest-significant-ostrich-8dd408@quoll>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20261110-modest-significant-ostrich-8dd408@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX5FWOAw4SzJsN
 xIefuj+02RNgBxwVl+8FSjnzI+62dDNHFHLuBShnl7knMq/DsSSjz81hmC4LwKm8VNP6QrMO+YB
 xK0I3CzyWF2mywNPMFP4e+VdVtblyymUZCfhp/mM878tGDq+1Pe3uJuA24c0ZTab8hmMLKr2Yzb
 4avdpUry7gfE1xvoeuLx0dXt0R/pzB2iEefDwfUFFfM1UH2m3hUlAUOLxqKSNjEly+5/hEMyXdu
 DPEDFQW/vuYFJ399Cr94mJ5152lgKFrdroEDAPwKzUSVffzFMQWJD1LxVSYrXolwadSq124H7tm
 E48bpy0fNNSoMkoW7lopa1O7PLsxnwWM5fs9v+Ep1IkBW8WANTw0RoMUjSgc9Ob45hZULO7ebSe
 F0d8+s30jW8ZhjNPMWUBjJD78YFAhXtcO/nKQBrhK0aE4tW9zkiNCTtLPZ/QLzR81IeQ4zgOZoy
 l7MVJ600hwdvVix3eKw==
X-Proofpoint-ORIG-GUID: 2bIzzOyaJ-qpjXrIE2zux-P8J9_PBU2T
X-Proofpoint-GUID: 2bIzzOyaJ-qpjXrIE2zux-P8J9_PBU2T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfXxxDHQmfSa5Xc
 L/nUKjQxOyVIL96pjABEv3Ubvt9Erljxb4u5igTzghorZfvokkdZ9D75p+vqjjM0qnV55FkPNe+
 Nd+UbcCRg0gRF3yK1+PYYa+/SY0zznw=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06c7eb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=o-GtmX4WOUCOVLFp2qcA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250045

On 11/10/2026 6:58 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 06, 2026 at 01:29:41PM +0530, Pankaj Patil wrote:
>> Add "qcom,remote-owned" boolean flag for egpio capable pins since they can
>> be owned by remote island io independently of the selected mux function
>> even if function is non-egpio.
>>
>> Presently egpio is treated as a mux function level decision where as
>> hardware programming guide(hpg) specifies it as pin conf level decision
>> i.e setting egpio bit is independent of selected mux function, the
>> driver/apps claims the ownership of the pin if it's egpio capable in
>> case of mux function being specified as anything other than egpio.
> 
> I don't understand this. If the pin is not owned by Linux, then simply
> do not list it. What is the point of listing a pin configuration which
> should be skipped?
> 
> Best regards,
> Krzysztof
> 

The pin is not owned by linux but is still being used and driven by
linux for it's intended function specified via function= property, which
would mean the required mux config for the function selection has to be
executed in Linux
This property simply allows a second driver/peripheral to use the same
gpio since it's allowed by hardware
