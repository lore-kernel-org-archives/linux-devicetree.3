Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC81E1ABED9
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 02:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780280579; cv=none; b=fb5h46DUe8PzbtIAFZpCH6TX/iCt/4SOFlaOzuVysiTePKgpmRWa+HoqM29Qc4H8FDm9vFymumwMrZAoxHbNmWByaplxzqd1YsIREnTiWwdhFEEbJvz7B7DwrHw8B/C7uVaRKQnMHEEE7TXaSl0XKiM0Z+6t/WzkPeLGSD7rPQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780280579; c=relaxed/simple;
	bh=cg0MnCS56NN8ew+Jxil9Tc+Gmjvxv8wsDw+u21d7vCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q48EauIRlUzgHhLKPuj4LvbGBkCXUEoi5JuJEa4gPgcJK/wenXPLFU7e1wOSZ2X6pZhbXUFqakZROYDfthZyhrcFMu96EhcBif6LpACTBB3jrz8e0oVEeRZXgI8u4dIzssVt/q7o6FkkoUGgQEc/3UxgaqzkKLZQVaIROSY8Lpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2MsvTkt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMbeYrYF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2MsvTkt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cMbeYrYF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VMguMk1445571
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 02:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dm9sRWUFHRjwKU05/c/rPrwtLtbxao/8L9evJey7ugU=; b=B2MsvTktmF6zJ5rY
	i1MwyuPRFQcp/C1gwxCoAc7PXHoV3qQ1rVdtoF5mBXnTryeqAQBAaUfjohEFsM5o
	QOt/rAqIxCODqx3d+WS4mlMz2PgGwzkPMBLBq+KPSl0p/o88fgPOyot8wA1wp1V/
	q8sBRk8EVF38qq4vn+unhiH6jX0pEY3TTIGK9K76QAhJGzGVzBPJFDkGJgNefEwf
	DOsMc415y6IZrgtC4uUc2yxmjxynZD2VF/Xn2rWfvXgK2ykVzb4fKyKNO93nAgy5
	0HUT7mLrJLoLtNEu6KCAUppSPQ1y88iRfotbS3Xtup9ioUykncH8Pp0L70WC9aTp
	Bn3yjg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr41d92x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 02:22:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d8719bae6so777873a91.3
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 19:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780280576; x=1780885376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dm9sRWUFHRjwKU05/c/rPrwtLtbxao/8L9evJey7ugU=;
        b=cMbeYrYFdnhO7XTezYEOTpgT/pH9qQunokpizufzMuH7Fz7m9sh1iOJkRmUkjOsehw
         j+rJuWGiy0kg+AnbK3i9+8c81HcGxlGSJVATzPhS0gm4TIQcdE3WeA8f9hpl+qX+U88k
         YUuahEue1xHbm+uHscVZ3AaUK/0r6vo88h2qyEK6DSlh/xLtdpAD4HblinglOAIJ8lcd
         6KJpJF1WU27nuG0uhTlPYcwj/U/Vga2bp9KlXSBzE+VDWiA47/8HV3XR7Z3QPhCZ4AT8
         moy3nWyztHJgdCcSFJvgemU3ZfpjFcRDfDwSubcsqQf0y7LZC+vUMI3+GNjfOkokXHsp
         Z1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780280576; x=1780885376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dm9sRWUFHRjwKU05/c/rPrwtLtbxao/8L9evJey7ugU=;
        b=CceetTE5rIoZCBqvvE3gKmN8FM7wfF1oSAgj3jZjoBVPywp3bTUBbbmWcFAF8AN8Iz
         SZszFwZhm+BXuLLyEqBd0PCGAf9WBAu0dFSKz1PK2+8YCuokRB5FAqBiLjLUt2+OtlZg
         JV9xNNqmPn1pn3/Adrpzq2UDkdr8xC4Q3XjzDROBNb+FkkgcBjkrP8PxOfxXWlTsU5UD
         407HgfSrv0VsJfsU5zGLxdL9uZYyUxDgCNOqZra2TVdIQCjdWb9OqZKOdN+1Q6V2vcy9
         THoqHRzfuek8IwBJ0CM9EzEuHNRddQ4ro2sBJ3LnTOZ9CJjQ3O8ii9xPIiOwE5FMvl7h
         nJUg==
X-Forwarded-Encrypted: i=1; AFNElJ+E96DYVU6DvIsafajSOew2pQwU4Wy/p1AXrPq8tikEfQWBN8nnWk62EzxmXNoHuMD7vPNq7i4EOc5H@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7EO6/6XG54CEECwEf7+IKoeW2SSFjrJjTdStwsNfrFyY7t2wr
	9V5YGOJTkGsiwTj/+NmLa77g43droZvOPTtOF9fjinP3c1gVy7llLKvktHUfmDHvs17MB1GkxQz
	SoBmRkrJcoTbr2urkmFzZuDTGJIVrCmuuM7OVr6nWYLX92FhmIdyhfiehaDgry9GC
X-Gm-Gg: Acq92OHiBVXegI64iRTjfITPa7Py7oHFkgYIj1ayuzMfT1UlOXA3W2RRKTkKZI9F67X
	W9c2E1Vv0tOymeyrYHSucHDC3f6x7O+zOW1tYkW/j9o+5DQJV8s+tKZeldKvHM4hl2JngfRn3X3
	K2QL6tQnxfPvuyLctxW9E5/9/5+KVNMSw7q7u5LBovJoOWBisOW+OtUXt/gpSse52U+esuK4mdE
	EFI+AcLMxgpQ08Y9kAYt51Ixl/5mqpTn8ozrfgKB+nONQjOrwQNv+UYd+Adx3pxZIXT5yWgSci3
	PbIXAOZKre34qMpPED7Mhq41fFZrZRCSyY2OJBeoUwguyGoSwZBS4q8Uqg52QrIMDHLK8ewNXYX
	lDhfThgkpK2kl7Oc/5txB4paeE2i01ulesr5UGV+DASsccxZ/G6dytsZKhDo=
X-Received: by 2002:a17:90b:48c7:b0:36d:633a:e7e5 with SMTP id 98e67ed59e1d1-36d633ae92fmr7478616a91.3.1780280575649;
        Sun, 31 May 2026 19:22:55 -0700 (PDT)
X-Received: by 2002:a17:90b:48c7:b0:36d:633a:e7e5 with SMTP id 98e67ed59e1d1-36d633ae92fmr7478573a91.3.1780280575201;
        Sun, 31 May 2026 19:22:55 -0700 (PDT)
Received: from [10.239.132.75] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc0bf8fc0sm9201256a91.13.2026.05.31.19.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 19:22:54 -0700 (PDT)
Message-ID: <bd38efa0-f170-4fad-bd56-d47aced88991@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 10:22:48 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: soc: qcom,aoss-qmp: Document the Maili
 AOSS side channel
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
References: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
 <20260524-maili-soc-binding-v1-3-fdf9f9ff1b23@oss.qualcomm.com>
 <20260530-swinging-wakeful-mole-359940@quoll>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260530-swinging-wakeful-mole-359940@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fOEJG5ae c=1 sm=1 tr=0 ts=6a1ced00 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2PLRVYDuarSTPNz8X7EA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: kyav-RwE2L2i-nUsA-lVB6ju6tQO8DWY
X-Proofpoint-GUID: kyav-RwE2L2i-nUsA-lVB6ju6tQO8DWY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAyMiBTYWx0ZWRfX/s9/K8i1U0Tx
 rn6Nw8me8Zcg3skS4TXUdpSGqL0IWPJ3j6V8vnbkd5OJse5cg45QASMpxOE7ocsKCoWY8ZJuApZ
 UViAsgL175IUN8yaWMRZ1LsBbWs8GRbPoPBUR3+Nh7YPzJ9q7xEypM+uacPzdNL1Smzf3ZOW/O6
 zG+LtH5wVHq7PuMrHDsiXwpqsxUbrXcHWNoqH67BRvbltE9eLJDOUH9qzCjOekpg0PUu9thXHq2
 sNn8IoF33WsCxvhiVgA92oaQZOO1dV2H4eBL81HORWOyj0hdmJGQwOqc/Er04g3d/03BHgQrK3+
 rWw853D7OkKt+Rz5UFYiAjgMpNnXDt/+v4yonNquPypaN+IjoX0t7ipCD2/nGibN0w6UwrRhACT
 VIultJGyzG4ps8areN4trpCRK364duEV1UYph6n2tnnDDDMb6AiQEKwikY3g59Dt93bO3wgDaaL
 lku1jzAbiEa5UC3IIyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010022



On 5/30/2026 7:22 PM, Krzysztof Kozlowski wrote:
> On Sun, May 24, 2026 at 11:29:46PM -0700, Jingyi Wang wrote:
>> From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
>>
>> Document the Always-on Subsystem side channel on Qualcomm Maili SoC.
>>
>> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> 
> Same comments. Also incomplete DCO.
> 

will fix.

Thanks,
Jingyi

> Best regards,
> Krzysztof
> 

