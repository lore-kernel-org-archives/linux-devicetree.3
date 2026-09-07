Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7C833262A
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770985; cv=none; b=S1K70/0YltLlpKWGBMeIJO9MAwT/iOsUUxCBualptPXiRktRpQExRatCCX55kQAReZ3puX2SVZxj/34KrSYElPGdd6+xkiEDEs+A5HjfGcAIhz1C2YC+dukTHVeJqlUIqZ2VUcWYyIs/ngrBUQQeVzONnd706yvm4h39srZhI28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770985; c=relaxed/simple;
	bh=h1ZxY7NuC/gJ03hkK3sWX06TOA+MMyhk04o6T3KIqbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JPequhQWrN5dlElaBYHOOGlv61tD5q4OL+kZ5ff1pNQstu7VmKPY9Rava1xt0PLY8oZlw9A2GL8d77p8ceZYYaTypzaf17zpM9AafIlt/2dhjwBYjEBQe6AJ2FoKSbX7UTQCJl5J6f1JToEfk4CskbckNfXIYOM3IwJLYV2uaBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evfmqC17; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3iKa2zz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evfmqC17";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3iKa2zz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777Jih4161125
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 08:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kgvH++j/Y6LqT6iaClP8nDLZ/ECwoa0TBh0Bvtxg4MM=; b=evfmqC17XpzGLbM4
	sPDPfDx4diDv6dIuS6l0nmCEwBIVbht9FIoPq85b8TROytwgw4oGSxhi4epVXSZH
	h5oCWUxLy28y9A+FzQ4iuetLA0LC9b79evd6yrsYDaaMnyG6OudrnBkd4KIXjl5c
	FRqSrM5bctRP+G6WZEvGAqDOJi0xtH9w7q8HVJ3iMxuHlAILXTvefKQGiBYaUz5o
	W9oxa0IsnsTH6dVkWvfEE9T6JxnFMY+WrtYc9BWKsZ1l3GlOoES8raOTWcGDzziq
	KrYHwWTO+GtX/1rEJawyIJDWGGwbH3GvmMxLjuTViSUzFGsr6WUEb67XLj0STCgL
	fXmu0w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjhtd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:49:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9006b9c3fb6so7802966d6.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 01:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770982; x=1789375782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgvH++j/Y6LqT6iaClP8nDLZ/ECwoa0TBh0Bvtxg4MM=;
        b=Z3iKa2zzs5w+AiZjGMIuIBBz+9IbEpGq9fNhlCwGZJjUyJPHRlFHYnhNFLzWbvnFWe
         Hq0W51TVTM/G0gKapJV++fzoJNvFUQnAbBSfIHtgjlOat+EhGy4EtmqiFP268BST8WKy
         X0KiULalGqv2dNkXJ4z9e5t6D/qGlhD/uvxwK8umCidF9Pcqn0R97LxmVpFbzZUSVyqU
         /IC68JUorhOC4vo0EKVgW8TH6q+zPcoVN7HmOrkPhqvy8zxdqy6hNBtpqJdOXuj9wMI/
         pIOuFqQbryqBR9c73qIfmggbPsKkrzxOnC066CjVzxZ5nSDGDvHxflihGXSkTuXjNgpW
         cBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770982; x=1789375782;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgvH++j/Y6LqT6iaClP8nDLZ/ECwoa0TBh0Bvtxg4MM=;
        b=TDcAOSxHSBdb2dzFIx74QyLxanQHy8PA6tDVumTiw1nWNgYy7p0GwlH9AnUGB0RLeL
         RDVYsepluJEcJKa5r4ssunO/SEPeP4nf8bWxw5VkBWuTXjiVsAQ034ywbzFIkpBAdmID
         sdblfo5f42yQ0RNTyYZQDmvuG8EeDBETbKxq5erEJ0dRZsqCSOYqa+m95a3HzRU0AE9Q
         w/ARdEk9iLzdKPsDpXHs7SUVOjFEl1T5TbNtQIlhIPABBqhRQ/S21F7OrlVDmP2BY81/
         /UhCtnn/VsSdeQSdE+el5ponbxZ2oc3oiP9JazzWHdte3JihpUhJXqpgaDZiUxj7JPY/
         wbXg==
X-Forwarded-Encrypted: i=1; AKwUvBwrO5LZ3mmT3SQkAP1OMk0k4yYw61xndF5QL0HF0QIBng72JT5GXktiDq8drMmoKcANRj/WN4EBiB8n@vger.kernel.org
X-Gm-Message-State: AFuF++mzvQubJzwQMC8MA8M1c8FBBfnFs70H4ezu0HwZQ2NpLxn9rGuY
	ldpPBEDS8BGhAbN1uPic2cTeOMa3JmEdJcpsCr5l1I5nx0Bf30Nxt8LzWSFV9nFHqhjW/mWRdAY
	I5SDKNfQ1DUW7wXw3O1zYK+pPO+PfA69Y10TrJOlKxq9h6QIn0AciTTBng3vNZR3N
X-Gm-Gg: AYBFou1e0oW6WS4E9quQbTmmZ7/oCPCtpat1S0ZTKZCXszf9Hm4zAbNE7txiWFYbq6d
	5Jy3ibph+EI1gpLIA8FYJJeLSdj3u5Gh2bWQDDl1Gtk32mpev6KBwPKODUOBG9R/WkAZQ0AX5bn
	AoaiapNXlbXisN9kBR2NJjtNZLUqtiR8+6amnIGbXOd0mKSDuJJf+3gf3kEOHiDiwqhMwdfdNdD
	5O3+LCdtITq+UehAnotPxfPUg6TyeWDxA3tYcyFfbnqPzTC71MiVl9LEXmyacSHYLrHTBkxubop
	XGDRvCDQiw+gYQ3zmmUMIW1e2gk0GTCBy9IsKgMnqmB2fIWijsrryLJJ5xAD92R72xKySc2ct+a
	jPdc9syXa0qQfpW1p5+vLKw==
X-Received: by 2002:a05:620a:448b:b0:939:8148:1e3d with SMTP id af79cd13be357-939916fe312mr1089815785a.2.1788770982127;
        Mon, 07 Sep 2026 01:49:42 -0700 (PDT)
X-Received: by 2002:a05:620a:448b:b0:939:8148:1e3d with SMTP id af79cd13be357-939916fe312mr1089813785a.2.1788770981637;
        Mon, 07 Sep 2026 01:49:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c261e24a9e0sm372159666b.4.2026.09.07.01.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:49:40 -0700 (PDT)
Message-ID: <9cae2950-43b0-44fd-a24d-a1044eb733e8@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:49:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: ideacentre-mini: Build the Hamoa
 EL2 DTB
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-4-9a87882973bb@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-4-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NSBTYWx0ZWRfX1qM7lssKjXPo
 GHjH7gL96OOyu0fxO2KeCA9brDqDxCg43boBgYALPi0LK60IUZUfTOJlhxN/uFahDLjzY2gwvUb
 zPuX3m0RzXtHVdCsMobwLHTJOD+H5Jg=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e7aa7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=VAHzJ8QwipbKsDwnUKQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: n6uMIUbWXjix_brUk6IEQpjkEw2tf2Sm
X-Proofpoint-ORIG-GUID: n6uMIUbWXjix_brUk6IEQpjkEw2tf2Sm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NSBTYWx0ZWRfXx0B81aLg+Khp
 q+SK1jTNXgRUXX3ZFROy4EAFozHTGF9D/kWQH2vuT5y8ObJKug3/SxCwSnMfopxFZ98SvdvTRhM
 MLBXD65RSi6wUQ0/+WmAielrq48Der8czZ1HHVVeBYcJJSW8I+M+IhBwU05nBHSypzqv+3Q2DG4
 878D2hvMavqbOnICyOo2hWOpuOVKb+1HaPF7/feiAqEm1bV7tlogS0wx00bmYp9X6GlAUIUsh5d
 Jf09vq8Ve5S/p/PPxaJ+92fV4aTDCv9P1CxDBEeS6ziDKY1JEVw6zslyBpQz/4aeKJbeKZ3x4SF
 HCqpDov52uberYo6VBLpBxwWxfVOXFRAJz6hM3Sy+f5X6BqN3TGdZQwspyB+zv4BfTD3ctcqKTm
 wrApw7QtkXSawzJ8oCB6LuQN1MXPgMSXRB1az1jDqyvvBT/PE9KxogOjJSmfEJIoz3hs7igNDz9
 5sYCPiNWXIKCIyAkGXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070095

On 9/5/26 11:28 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Other Hamoa boards combine the board DTB with x1-el2.dtbo. Do the same
> for the IdeaCentre Mini so the EL2 overlay is produced alongside the
> normal image.
> 
> Assisted-by: Grok 4.5 (xAI)
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
