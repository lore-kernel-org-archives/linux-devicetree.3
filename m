Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF19409633
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779818046; cv=none; b=oV/RRrSF/5uvZmIrW5KwmvMTVpnE0SNvCekQj9jebtM3ZGY/YxlI0INQp/+IDuXEclpMJa64eUV9q9QKhGISmAyRaJTJY83vHvNrqOYA7b+Xdts/JejYsdyqHq9Jg5Y5g/zRtFgzCDNbQmBr4cUhjPV/3qg4qGht252fipFnPDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779818046; c=relaxed/simple;
	bh=jIBKopzmpHv0w8uCdxC2/k18CuB3MASrGF15TQDIKaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZN7nlj9mpDWqpSSue4TTwvGX0dGsaEZQZDSbHqm+S0kQIHN5XDawvtEyBOIIt1hhwxgCJ0B/qbVFJTkjbD94Ymyefl6Zl/CTodAIIXYkwiYBkMhgJTVkFf6iL29cm8hQ4C52RwT1UnSQLGiZi0JrLgkLpOp83HUGWLH9+wLlLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RecqjBb0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HzyztGem; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RecqjBb0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HzyztGem"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QHhOpC2261691
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8S8qWwQdbAdjsWRCa7jWdqeaaseqcCjBVK19LWrjVdM=; b=RecqjBb04Od9XmDb
	DYjVgt+xSgwnt2wRqJlUYJaWErffzHgBC5M2ZCExU3B8KOpYwzAGXhK4nXfqM4/5
	jUoVvFCo02sRfm6f3aM9b3z4yjAjmLvDCm37sYj+8iIkBwQsj69kWusPP81XWgaq
	JTKK5TFEzspb5nNvaBn/WxeR2hSyO3CpQINVQ2dl0+7jIhbdGNOOByeA3ZKXy1e2
	DQAOBv4ElWc+PfE5763vDBxlWWd3afBSr7uocny9uj92Lg9xkWYNCyYZgjdf6yNZ
	7aMJLnijfvL5KI1ZNUrl62N+09PT6Yb+IS4XmrAcBpnE8qgO/iSyxH9JfsLgm0gZ
	T407xQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edg5p813b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:54:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83f7e7f7457so6849371b3a.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779818044; x=1780422844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8S8qWwQdbAdjsWRCa7jWdqeaaseqcCjBVK19LWrjVdM=;
        b=HzyztGemeVDq9XXT5daDbpO8MfD05DNI/U2TxqWhAkvDmBPnTFThtd4J3gwgT/H7gD
         IaCQwtq8S7aE8hArC4eJvgPofiUyLLsVcIW8JtlXOL2EVnn9vgRSFJpEKsK3kxWMS6Bp
         MSPeSsPTXeIuODNnGKWbqq9Uvw+sAv1sZCA3u3MmyJTyjWmu7I81E697OUIW7zUjf5OI
         IlKQIYBCcD3HS00zWHzAldq5A7kMg+tPhgBXrHWQvqR4sHpA3WR4pS3Fn3E8MnjqeV47
         eExexf2vVXAkfwCVy2iYlzDJc2hKYQzvt6ImHwrGJDGdvVg3Pi7oCH0YQyYzVo7Bmr8p
         W5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818044; x=1780422844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8S8qWwQdbAdjsWRCa7jWdqeaaseqcCjBVK19LWrjVdM=;
        b=oZXTCWk4anMMGc4fkaFyw77frGfUwxboSUYw0HYOOwdgiGxxzFJiLRX7FZ+66pkBzQ
         IjlL5HkY246Ryv5y1ahfbaP3pWYiDtUKeHW47erQfZJ+dO9zDVdYbJ0brLLkJvsNx8NA
         kJEJhRyfHlvdcJzGZiinV/tNoNDInnCPRmVn9IiWoQshhlLW/xDYAoNcPdCpmAr6+/wl
         UtpuKJBvlmznCKyBVzqS7WJrlDMtqOKnrrIgReif1pFY6kfiDJCAkvQwlRzfKdFfwJxL
         XRpd7EYGIIYrC+UqIEJlfVGDwWV0nzQBoZGZspu2Zcx4Y87G89zifd5gyLCzeV3ma+wu
         mVAg==
X-Forwarded-Encrypted: i=1; AFNElJ+gicEHYkmz8sgLLwYT3yncmVluxXARU9QBlfikGWR2JgT2+l5yLSraLolwsIwoVSNf1mFp5K/6tTMB@vger.kernel.org
X-Gm-Message-State: AOJu0YxcL/P1WJeBP1FD7cGmLRrPdUyXjUL5gwwcuPOWev/5UnFY25ux
	lnFwk6Yw+RyfwIbAz5FF4qUonDyFxryRmPeXbzMqFeDL2FAKFite330XxcvmkbeBZkHsnZd2g0H
	VNOF+kn/aVaTXWL5TwoVNnrPazj7Ob5vrITWWJV1g7qcFYC03swWVoJ0BH8jTrSNcNyJog+gv
X-Gm-Gg: Acq92OG8cpw/WLw8Ctgsps/94Hn7GBYXzuX8AhIQA1Q9j/OYSh/20+dce8OpNtVCk8Z
	WVA1BMIcciNqXBpPaAGZHt5ruwaav5+eVTLZR4pypEhfRhTILXEbTFJWf8+tmNhEn2E3MNv/LA9
	L1ZFrtOePgfhGik5/46oJHG4K4wXp0oFHFhLyvXtZRjev8zGV25NSJMEiZ+XxDEQ9fR7ihN3G+h
	fy4qld3wXtZSFu+c4NpggP15LrWz5yfYQvstbsO2gsV7QCxJ6sFzSmitZQNc5xubGqvIRv8qj2G
	Rg/mKnWin9v+wdX1nykOLEQxPc0TbidX9YJ08tLCbRsm9gtwdbkYmkiMpcAQVp9OjC0TkQZ37IJ
	uGeNwBsE8x06d43XCLlVRw0EKfcYOSdrb8Pc4Fe1JNOdZhPI12Ll8
X-Received: by 2002:a05:6a00:4407:b0:82f:1f43:7190 with SMTP id d2e1a72fcca58-8414b3e1e94mr18278008b3a.3.1779818043825;
        Tue, 26 May 2026 10:54:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:4407:b0:82f:1f43:7190 with SMTP id d2e1a72fcca58-8414b3e1e94mr18277991b3a.3.1779818043317;
        Tue, 26 May 2026 10:54:03 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.233.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9a42sm15138298b3a.8.2026.05.26.10.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 10:54:02 -0700 (PDT)
Message-ID: <83fe4b80-f40b-4f74-8faf-1c6268e79648@oss.qualcomm.com>
Date: Tue, 26 May 2026 23:23:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Shikra
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501-shikra-tcsr-binding-v1-1-0c136d193634@oss.qualcomm.com>
 <20260504-pastoral-devout-jackdaw-b84ff6@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260504-pastoral-devout-jackdaw-b84ff6@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aD4yea6ULXX2fpB5t1yllh5jKcUUwSMq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE1NiBTYWx0ZWRfX1lqVCwacMURL
 PB52bbTELlp1kdYE4o26uGPJ8IUqVtB7E/LcwFln1e5RpQrQ3JZTvG/77lC0fUHj4ie6wBJOX1c
 P5iVLhxS3QT4/Gez8VBNiiVCmqoH+05sfrDPYgE1pWkMrppzTZGyyrxPlgPUtG3zugABNbeASOj
 nOZ10EiwAV0CM8G1GWHTZUnlvyWfqqbgZAMC9LAyS8K0qDzBUchmmCtg2qi64PZca3h41UBePbF
 3O9ZiLSguGodgTgsN+gg2/b8Yez0Cq6wojKfdmo+nN4QqXb7VOH1G0+AOi0LA1y561lPGNaJJCG
 oG8b4BlCiUcUW/97sY8rFt+/MoMEZduHNooAHo1blzrbRkTvMOi4k8b0OGbzofRDZdzBD/ti6fS
 BtDtGH0bmAcQWxBLrNPA9OO6TEKrqNu5RBbnQ6UrCX4YVCSuNGDSe/vgdWX1A0gRzCRoVyBI/zx
 tAqynQcrDjp9kUaGXhg==
X-Authority-Analysis: v=2.4 cv=I95Vgtgg c=1 sm=1 tr=0 ts=6a15de3c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xYyWL/Q2DZNEK6BS9gpG/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KU9BRIzEWep4G3HigKMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: aD4yea6ULXX2fpB5t1yllh5jKcUUwSMq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260156

On 5/4/2026 4:37 PM, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 11:31:17PM +0530, Komal Bajaj wrote:
>> Document the qcom,shikra-tcsr compatible.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>>   1 file changed, 1 insertion(+)
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Gentle ping — patches have Reviewed-by.

Thanks
Komal
