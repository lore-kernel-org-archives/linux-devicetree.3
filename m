Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB453793B6
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221820; cv=none; b=BTYPhv/JERLlItUJtakpP6C6a0BF8MPJizeq6OKutl/v42guySrugXfvNfQgdk7tnRwakKZjEMySydy5nYcAwxMHFrv99yzq3KMb9luUN6pAK3JcUUAUH3apHEZ6R8cgBwL1CNb02EDAiwXllxXUcRBwcDqsgTLVoTqtHss8su4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221820; c=relaxed/simple;
	bh=PWLPimOLxeJKoV3EcFGwk368jnyiHugBx5veMASyBH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I4g2b/SPwaT+ZRXQGSVlY0OrfABNyqXrenhHjyCYTWhs4r2Yl4YkY6bakNftTYRVChEYh0EvggDVsTBLOiLcXDnvtvmC8KdJ/jRWdwykvvQg14NwazX3Yu6p5xK71t9a9mBa4xBqaQEWlQZwA3vkjgXBqMTZnpsFSaJ+BWGt3mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nydox8Tn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdSAG8ok; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nydox8Tn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdSAG8ok"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8jw5j2529911
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLHMlJ0zXtr18TvUn1mc/o+7ROZpENj+V6CPrImGZoM=; b=Nydox8Tnvj4bTLwQ
	d3XtbcWlzS38o93yWF0Ifa7IzXRMOM1w/EYlbwRB9edW2QZh9zNePaFVVqy1r/89
	R+Ue9xjLLpg9pM8MGO9YTDYgx7ylSkWAkD4KUrBZQ2rLgIgS2AwV8+v2mfs9I6zh
	OgdzI5B8902BiPN8QgapWj+CiJdhNUR7IzpOSlQshNorK8Tn7e+s2mPE5ytOFAHc
	0Z35R1cNY3mmJWCKhMeq8MsdZs6vR7HwaIvBrtVnRI2aXt1z0LAki5HGHUGTDjRr
	203qdZV7NjaeA/ydYxgTdHiPdRmk6ulP5sIFUsNWBeqla4hggTbdWilwu1INy2du
	vWsDJg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbv8ddr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:30:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52b4e315000so6879821cf.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221817; x=1787826617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLHMlJ0zXtr18TvUn1mc/o+7ROZpENj+V6CPrImGZoM=;
        b=kdSAG8okmQc+FcQdSDO7aeyXnABw/U1rwjKza7BtELYo+nxBbGIsUcWHuOFTk7ysBD
         e5vE2SzU250iZvAxd9f53UbqKHNRbiI0eijHok/wpfQvcBudrfI9AV0aUFGjCR/0jD3t
         oi4IjKGyktL87lPMzufbz9eFnz0lBRDwrSmU9tc9yzzV/eGIWZCGSbf/cmyxCkKKIH5w
         XV2mA2xAeM1mnEv+NZA2AF1ttqHPU8Og1s1pNsT3iD8s22DXF/+o2r04PHw9hehu7reP
         a9ndiLiQf8J9pt5td7cTdKCfltdNkHj7W9F+6TU9LRuzTOEjkcrmHtoUgSDpzGynw3Fh
         8IDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221817; x=1787826617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLHMlJ0zXtr18TvUn1mc/o+7ROZpENj+V6CPrImGZoM=;
        b=dwZNBCBjlnZA/RDMUbsOnl0SY3WRbg9Y+/Lo31Fe8MKOSE1y/9/WHjcx9kuDLwv43N
         A0GHygZriNFpPkT0Kc8LdnoJvn+wHgLQ7SaIe930KREqgahgIKT+v3nQMbaBg8k9n1J8
         4oO2Azit9myEFPa3aInUvUEixeMqfjzWJnGpPXXqPLI3YuBVpyYcUMuwSyMDDG0jRdau
         /OXNqvcSnXVrK9uY+c6hbT+6lx20xLS70LTPcLhnzdY7ZzicAWEq36KJ27970hV5O3kf
         JYEIzaogYOrDP034vwb3VvNXMD6Up0EzZcW/vBD50D9/dYF5lcgkUq+xFVH4yfgkajU+
         2bhg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8l7bpBIEKzLlxUXkyGuHamXCKLFjMWHvGr7DuCx6t9Gf8zfgtGVVEp9/lTvNbDKbOIHLBVM+RbPFa@vger.kernel.org
X-Gm-Message-State: AOJu0YzKbI/kZ+vTj59xzLPMsHLCyrXen3b64v5Ria5NV1hNBplaMbGm
	d+z6VLHHCKjFNyQwH1i09X4ZYa9OvPLd/6n5xoRHuKjIVgYEwkE2KNNFtjp81qcMUg/6POU/7ow
	DxmrWGmCBLz9KyvomfQqJ5sv3rHqsR0vRO6Zknn3rB4DL9ot1pTifMeYKnT0wqJOw
X-Gm-Gg: AR+sD10qitlvZoyHkBSSPjOmZ43O7IJPhBhZ5FlGnn01z5NHoqeShddagnSOvK2yRTT
	NMutMnutiVe1MUxlibr8iOnIf0cwjecNht7QG82TpGv5b53G7MexogkOhY/pSCpExSHE/G2320k
	ShYAsTbVQrfo9RLhe1D9zgGbVL+jz1kvHyce5zNf83Bz7q9I+m7IxcN26fw+Ueb9MI6Mb701APU
	IrE//f7f1duhd+VocpMSul833Trm7R6be3wRdoIvKL1MUg4Mx70BWkZ1g9YFCA8koEasmLrs/Je
	rq9GO0loyBTpxhA1oJGFDL8/stL/hDOvr2/wD58blVyOHvEKwi2K37zNh44vJxVXW6vRpf7QWJs
	Tn4wIm41MO3ErE34hSn+cuxq5
X-Received: by 2002:a05:622a:491:b0:517:5d21:9899 with SMTP id d75a77b69052e-52dd61c060cmr87004191cf.5.1787221816678;
        Thu, 20 Aug 2026 03:30:16 -0700 (PDT)
X-Received: by 2002:a05:622a:491:b0:517:5d21:9899 with SMTP id d75a77b69052e-52dd61c060cmr87003601cf.5.1787221816079;
        Thu, 20 Aug 2026 03:30:16 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b0b00esm52770466b.23.2026.08.20.03.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:30:15 -0700 (PDT)
Message-ID: <1134bbca-9c3b-4e07-975c-21aa5c49fac8@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:30:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] clk: qcom: gcc-kaanapali: Tie the CX power
 domain to controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-7-e67ea30d8b7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-7-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a86d739 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=tWEGOuoi_ilLz9bYf_QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfXx4rZKUFhCcsa
 aCUY28vMdS+QVceKHJwuWiUYJt2Sc35WrDGuMeyE768msfgG04/rGXyXEQeGxp0J64AVr6W5yFG
 sU/8FeWZeFJBp4MzQLMhKCUlxYDTsd03Bj/dph7v5Q51sB5iXxm4O943X/GgKkp/PEvckOgXayl
 /HB2Gom9FtPpDxov3LS0KOArzD7jCWQ5bVc3mVrunJw9rZg54ocJEr5iia+HGd7dP1hkV/aJmz8
 zvRBgBtqaeRgcW5l5MenvpJZVjZoPwNxLj+gcD6e25M24GYG2xX/47HO1dxAULHokEdqVdWsOhi
 gZDa2WRXbYHAtNHEU2hh4nFZc+Wyc4j6iZKAfdj71sQ7Lkf8+LB7uUtZbRFdofA/JKWwFlfGutP
 7qD9iysYDtuwHOj4+233tddy6nlaWbUm20u+rqaWhP6FAxhXZSUUNFCDYkaUUy4tGKcXxKzpF77
 UjkCts5/xoCOWCvL4cA==
X-Proofpoint-GUID: f3nHV8NhYY6_9nHU517wwO5te-nvFhdZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX2xIt7f363mEg
 fLqzkB5OhrvtoAiMT3I6GsIfK0JsMhG9n0XRsX/6+19X9MaKBDweWtTNlDOCuuLJZMP6B13Y9Rr
 luzzjgYkq9s6TINPlPwThLogZIIQVO4=
X-Proofpoint-ORIG-GUID: f3nHV8NhYY6_9nHU517wwO5te-nvFhdZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200077

On 8/20/26 12:07 PM, Abel Vesa wrote:
> Enable runtime PM for the controller, allowing CX to be powered down
> once all GCC consumers have released their clocks and GDSCs.
> 
> Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
