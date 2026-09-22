Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DAD4D486E
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073182; cv=none; b=s57INypQCObXAQc1f4Kt2dRbrFCRh01ltAONivmGtmX1bq8DIc1P1PrHH3JAbQhBx/emGrV9Z30XtaSQOhoZ/XDSv4V6iAIfaM4IXXZJxPOveQG8cgBQuW7ld1B6QaHUTVbJzMJDbJGwpx51mBtogDjF9iG00OFQ1z3rnLS3yY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073182; c=relaxed/simple;
	bh=7dNe8Ub5qUIc/i0QAD/HshqgBvrYEmV/jNY8/VYo1HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uuXiHUnhqlfzZPu3WlJ77qf4TyR3KO7S5UX7LsR0ubqXGISD4t4rtQ7Y5OrwP64uTHYrJwHyHMQ0F0FVPSxb1kI6Lvb0+mxegZrKuQApOXdOChiBMS3iKO5lVhZzSyVlSYLgwI+JKszb0shP9UwDKunSqE7L88zJlbXRn272RZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oTkqjiuh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMmAkeU6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oTkqjiuh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMmAkeU6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M9FlaB1842310
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rRtsKf07olYMuCWrU155QmQScMjW2NkOARmDMAKurM0=; b=oTkqjiuhwAWixN2J
	2x3aoIGq0vNtNcHgw1NWZ+c/vle6zdG7RIhHCqZXv+FwSxkk1l73SpquRy4tyZHM
	E6+S2jH2mgDJSevpR0a8S+AxBQauO+qGw8nFDLJlzM6ATbknHsfux+M68otLxDcK
	VsWD9yZwj0AJDYV1iGBZGrMj1u8Zrf1s4D29NqxluKAVE5h+WLYeNoFQQQ73hGmj
	EraL18YwWfUW8LTKle+0Ry0hknDT0uJaZbqdHMf8nF1VgAP99FjX1ijNuPqNDtRF
	7jCpVg96gVEtHh5IAm8zM/508UhvsNxOhVF5xP4dc1qeK7Pyc0gXGtyCfBIhzmDR
	FtQ8Zw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj111geq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:33:00 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cace0be95so13902241.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073179; x=1790677979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rRtsKf07olYMuCWrU155QmQScMjW2NkOARmDMAKurM0=;
        b=RMmAkeU6BIVMUXElPvOvwlZrP9/SjOo+IkNOCU0cGbHTv7lHSLp4eE+D/x/FA6NHT0
         /A42rCyT0jSOnMJvjr7rfbAh6Thmi42cPcrXgcxSVTX8oj4ifVFCkGQL7zn/y/Ze8eIT
         8jbwwshNRY39SAjOeyO1ICBQ05MEbVeVMmPTrCiYFzZk+Z91RVXgvNIzXSxWShGeWyK0
         PmnBo+8nWfNvRzQ8YRu9s6ayHgc8Mhu74uHoQFBpf318NKtZZou+UYWQ34w5GIp71LnN
         1yOQ+gD7bl39G0PZ+2X8/DqfppaXRuGB24t1wbOeStindRm5p+1aLAqN5n3ac4mTojHS
         3kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073179; x=1790677979;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRtsKf07olYMuCWrU155QmQScMjW2NkOARmDMAKurM0=;
        b=0/7f2dqF49tECwTti56F/T/a2jFMiemxDuZ20u28OxFdnyxEKMwPn5zt5G+cq9dK/c
         Q3YN1VWfAD3Z/lMHAFYOeck3looCww+MBZhtSsq9rKd46BapG4kLO+SvNvW6vkREAOuZ
         SZQLB7o3tnp7GaWJ8L+HWJbYA49Cx84WeMafov0al/0GiZQOIxJL5dvIy9HLPqJIDfdP
         tw/bq7yWGFta4TT5r0Xh6/vV4dYxvKDERYuDefD233YQo69HnKyEdUt3IffDMtGCFVWu
         lJiYUpgx/dH44W5NJNGXzlvySDoy/gBWZOCiOUl4REwiClZ1VjybjEcdrqsUlV6v2o7U
         33Zg==
X-Forwarded-Encrypted: i=1; AKwUvBzrnPFDBDdZX5iUiUl7IZ98NlbiQrRidYrD4O2pBKfzY5wHhTBt3bqy14mDuqLcTJ80JtWjcJI/eF16@vger.kernel.org
X-Gm-Message-State: AFuF++ldAYTbfLPE3qhm4rlnHrxpalTGKpvJV3PEdRXQnStAnlOs1ghp
	Q62UpwxCBlyZS0g5MmtHOWrZ1Qvd4/VenUh1f+NNlxXS+Zfus3NwvHRUhU0SW8ki+o9722fJ8kZ
	k1BGS/ZuHl4RaX7oJODnNJGLXQM242ptDlGfv9vQspck5UdYmReyzyvYYaLC9OlMO
X-Gm-Gg: AYBFou3ne49NL4djo0EVw+PgOKb5YyauEEwGG9Sip5bJhffA2vNCU1RXBAEYlYaCNuX
	Y/d+GcekytGmrmFKK20LMyn9vwrm2TPiFf1NSZK2LgIFbeA1JAHCTlU9k2F+VRBjhp6XHYGfY2p
	FzW7GzbQA9dJOfo9Y60K5jdPqzt/D8pDwQ/w6DhIggWovpNnN4KIKRRckqSmPI1pCRxIZegObhw
	rjuPYIyGUCoM4fqXQ0opJzIN8casLiG7NkOpkpOOJw6U9GSFShV8hOXBHK6esZMimvSX68y3Acn
	UJrL+VYxX8ZQAgiZwahHT17fYBdS+35D6t67AdvD1TQy71Oi+HbdO8YugQDiIwW0gZpgBnxSFk9
	D9XBVralTCw/zNzdM9JFhdA==
X-Received: by 2002:a05:6102:3754:b0:7a7:c789:88e with SMTP id ada2fe7eead31-7a7c798bbb9mr5325180137.1.1790073179664;
        Tue, 22 Sep 2026 03:32:59 -0700 (PDT)
X-Received: by 2002:a05:6102:3754:b0:7a7:c789:88e with SMTP id ada2fe7eead31-7a7c798bbb9mr5325164137.1.1790073179275;
        Tue, 22 Sep 2026 03:32:59 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c54f5dbsm61657966b.22.2026.09.22.03.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:32:58 -0700 (PDT)
Message-ID: <f2fdd3f9-4412-40b9-a4a4-c777ff023663@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:32:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add bwmon node for Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pushpendra Singh <pussin@qti.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
References: <20260922080416.484280-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922080416.484280-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l7IS-kXl4e6Z-9_tTHNgD0bilfv3x-wz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MSBTYWx0ZWRfX7uZDax6QYTqL
 nKaQBrMFuhFBK+TBypm4Fyp4umSwsdiaKGphVC++/8VGh4zuMipr8Dmx2JkU5EgrosErPv83ZcA
 qLJWBk7VZqs+kHusRGat71YBArR23Us=
X-Proofpoint-ORIG-GUID: l7IS-kXl4e6Z-9_tTHNgD0bilfv3x-wz
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2595c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vK6GiN-Vya7UJqaPjmUA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MSBTYWx0ZWRfX869Ow+RwFm5R
 Zv7wcxrgZ2vk55qWaIEaGN4hqvQWuYyMSb5L1FXVR5ZOddH1S0c+k87xDG8Z3mWIO+w1HhfrZF6
 y5zHczLHfMgdT0y4EhYnb1Q4KgLFN6JRDJQcGfdAK+0GTT5I17KryktXGEqVp9DBrQ7UtCMDnk5
 A5IldfSc6bNmA244DgTeApbhQ8n6SGcC8/eK2GSzJ481oa0zHg2nw8QDFIFjN6rusA3K+ZulD6v
 ds3zrqE5ePstpkzOQk3M8N77iC70EVtmSGW8WmHRa/iwUd1KtPx/aM91f4WvOS6uVaYlFs0Kypr
 rgy6Gu80jXjn1XxKy633p08G713eFJv2iitezh9KAWZFhNudwIifBInQ8zOZRwrQHkDRSbcMle/
 ItVncTEGf49OmixZVpo2E6Pg3jij8cFeQNpyB7RdkVg8702q+O/QwdHgAVF/5gh453Uanp0g4F/
 BZbqETJOhJVovxXZG5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220151

On 9/22/26 10:04 AM, Shawn Guo wrote:
> From: Pushpendra Singh <pussin@qti.qualcomm.com>
> 
> Add BWMON nodes and associated OPP tables to enable dynamic DDR/LLCC
> frequency scaling.

[...]

> +		bwmon_cluster2: pmu@1014400 {
> +			reg = <0x0 0x01014400 0x0 0x600>;

len=0x500 for all the region is 0x600-long, but the docs say
it starts  0x100 earlier (with registers actually starting
at +0x400 like your node here) - unless you want to solve that
discrepancy in the driver, but i'm not sure it's worth the
hassle

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
