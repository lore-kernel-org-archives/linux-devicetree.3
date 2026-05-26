Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FC3413D8B
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817750; cv=none; b=ZWidVDP3jkBpzyKL0fGrY8QUE5/f3R8kGzQr50bIeUkSpNB8m4wQzog8kwEB+Z18YUb9Fsyb2Ru7wQBm6NGOlysP93Cl1KePlbadZjI1dh7AL+46qjp8Xt9VJpxFOSeteYruC7dSuDWvkG66PT6U34baU24X9jz0kFQal5bwUHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817750; c=relaxed/simple;
	bh=iXtQY04XT95uhrP3PB560z5ebfA9fN7SWahBPWKve1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nlxXv546YtNplEaf7am9kVIQTeox9s2sHCVxUseo+lMDdZEj2sQRKdq4gW0JHSi0sThZsyRqj3VxQt9HOm4V55Hyedt/TdtWURU8LalQO9Zvt4CgmO+coCCZ/xIRW5xVkr1hcYtiTiANnSVSwz8VTZ9j9aHqY8tBd3vmlKn1kJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5oxQtgR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OG1/ueBO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U5oxQtgR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OG1/ueBO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH11eX3289832
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iXtQY04XT95uhrP3PB560z5ebfA9fN7SWahBPWKve1g=; b=U5oxQtgRMqhIoYW6
	2CKc9UuG0L5dW3rCSH6M5b/u96Klu7yVfRynqcTInJGVdb0ADO+8RnJCzpGz2gss
	clNhtLL91Tr2XJCmq1HSNZmZpGI/s6syyTLnZP8c1cCoPab7y0F4nYv4QM/bbWoP
	52juzIJ5n2TwjcsTyJ4wqaAyldAeErJEgbX0JNhkjw1gMuWAfQaHbBEfcKlPgn+3
	xeI1h/b4OtA+6yXmVBhJrjYh5/YENzUIC0UCUnsSpUwKEVPTNTDfQP+M1gG+6zB8
	ypgqif7ySbrAHEkgKcNhQ26f/F54yAxPGBwm1sVD56vtmJVtcHhBVppyy9316X5o
	g+M9kQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edf1j8bn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:49:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baf7748d0aso109696995ad.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779817747; x=1780422547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iXtQY04XT95uhrP3PB560z5ebfA9fN7SWahBPWKve1g=;
        b=OG1/ueBOGTrQ+XNDaWpJqjWK0uwrgWv5K5HopMfG2tCBXkZzhONlNPjm2IzMTSbNaG
         bszqzpPeiXVZBhxeYFLgZb9SlbBjQOmKppN26nd8h37HSHgwPKmO8Z4DDO5AFl3gaB57
         5dYcdedz2ZdMozY9QPTTa7AsSlr6/KUkjjfk4xFTz7+4plnlb2y7+Lo0iVZ7lR1pRzud
         N1gPo3YUIXXxFkUg6+JfUQ0NuVYhsS3jEVOYsm2EMSyRvJMJ3NK3rxrCnSkHbZYpg8zx
         Xw4AxRVuVJflGw1wyKRzaKWa9upnkQvzXH97jO+vRZDRdVBDE6vyUx5rABgmR9KIC0RP
         LHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779817747; x=1780422547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iXtQY04XT95uhrP3PB560z5ebfA9fN7SWahBPWKve1g=;
        b=cwIq10FmwsHmeJ5I/qqgVtqpkO4Z1Zl0q/U9pdbGYI66lj+v36WVroInmSxNy95l8U
         4gLREj0FoV7WfV7l7TSiDYFMwoKWBv9vJm8lDUCcJSTuk/znVD9JiiA1dV7F9A7AY1me
         HGtmqEi6Mahnku6ly5e/8jJ1zFCw4u2G+SS1i+TjjU3RrwYvufdfiKp4VhOEdtFUtEtu
         JPz4pp0I9UTprkRhn5ikdOzcnaMufEElOX7b/TpN048rRmVN8wT6XGJjAtPy8G/Z+pei
         epSUGarjC6UrEusx35fiUpUIcDy/W4j5VufnL7v9Jdr6IVheAltwv45uTHZpdXt5RO2R
         oP3g==
X-Gm-Message-State: AOJu0Ywj4l4fcKYXApDGWgRIyWvi44JlV6dWL1KLKcLLASi42aUzyRPo
	V58O4XpEZDVwGQXkZZbjkltdV72F2RR95qZnm6RAgLLuF8Qz3ORWspWK5qnHEU1HF8PIxl6Mya1
	sZgsci7dZZ9R5QqETFq+yRnVgB9p2/QMjUw+95O15EGr9ji7tP2d2JWhEi2zzFe89
X-Gm-Gg: Acq92OFJs5W7GmxR6xLNe4CgaxO73Jw102P9iZpTiSc6iosMOWCCIzNrjuBJPYzSJhW
	O4g39+1PBugf4Doj8CLKIzE9+8pCc8jNVNru3dCc5jI7mz3YelVbgfnspEW2mn3B96Z5VJO8bVK
	MWZuliM1IIxM7A9DB/cXWHOn2Ta6GJh1+FabXTwbiwlf3hq7UyyhhbFvRnKVq44p4I+QeciI4gW
	7ZimGlcp0l4nYAr+vI5/LhgaScQvsVln/OqbFn0tRzITRYjzRYmQfmkqO+wCdZIUftg2qI5WnOb
	U6TdCteBzuHSOx4F/uQPrUUHntUwq7WnI/wO/9iRkn0vAFSoSt2bID/YlHu5J1sIA0Qha+E04P3
	WJ/FJQ9rgS5U+mwcMO6E/kv4zNFkjQig1gLuYjAnXYea7WL25y50K15wuuYizAHE=
X-Received: by 2002:a17:903:2c07:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2beb0631a41mr199013905ad.26.1779817747479;
        Tue, 26 May 2026 10:49:07 -0700 (PDT)
X-Received: by 2002:a17:903:2c07:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2beb0631a41mr199013615ad.26.1779817747054;
        Tue, 26 May 2026 10:49:07 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.233.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b5886sm116944825ad.20.2026.05.26.10.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 10:49:06 -0700 (PDT)
Message-ID: <90b2609e-c955-4751-bb93-d5f602953d0a@oss.qualcomm.com>
Date: Tue, 26 May 2026 23:19:01 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: sram: Document qcom,shikra-imem compatible
To: Konrad Dybcio <konradybcio@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260430-shikra-imem-binding-v1-1-c6976239f90f@oss.qualcomm.com>
 <7e5cc82f-4e28-41b1-ad83-3433b50a07bd@gmail.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <7e5cc82f-4e28-41b1-ad83-3433b50a07bd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZNjnX37b c=1 sm=1 tr=0 ts=6a15dd14 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xYyWL/Q2DZNEK6BS9gpG/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IiY6zXmfJHY24_xqyRUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE1NSBTYWx0ZWRfX9BKgWsrlR7/S
 IjVuS/uhO6TERu7kGJkSsl6NCIraFm1k+1ddBMWRQVx1oQHRkEA7r8eeR8iS4cvQIrjsZCMpcKV
 kEAM4Il/cuI+qZq29WYAXovjwnplCMO5RGswWCatmqBKKizSa0fUrUxwRv+mNttRDJPlshsZIep
 AnNbOmBkCwNUHlXX6P5y3o6NhVxups3EJgRbN5AG7xto2AAVMAGO7hY/3A8Mc3cSFdCWytNXkLn
 6Db4UyzTojvZUKQ87QvoYgptI2CKhx0oAe6jpnj86B1Ml9l2S0wt9WJ/xC3xjBlkDHOAY9KU7pP
 210La5rftzumqX5ldZbqAUfTb8jyzxhAAheg3OD4fcAH2UISJYcunUoQUgwNUhfwz2VH7Qwvmzm
 /HQqVmPjRmECWGhxeH0G+XsGDMkkf+KQ5nhPN358EuXSco7yngs3OnuamT782wgIU+eLftA0nSR
 /tNLI78J6+nBhFRcuLQ==
X-Proofpoint-ORIG-GUID: rbJyHwSO54Bcpdv6xTDPabMhScaIATet
X-Proofpoint-GUID: rbJyHwSO54Bcpdv6xTDPabMhScaIATet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260155

On 5/21/2026 6:24 PM, Konrad Dybcio wrote:
> On 4/30/26 2:38 PM, Komal Bajaj wrote:
>> Add compatible for Shikra SoC IMEM.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>

Gentle ping — patches have Reviewed-by.

Thanks
Komal
