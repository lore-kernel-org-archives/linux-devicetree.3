Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2323909BF
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 10:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775213077; cv=none; b=oTTJGM2qP4O+pzcSZr0266HP76e8KmmaY0kQsLzj4ZtAfsnPgpEyNzmDNEMRjuz3XzHNt5we7tKdBRmm3zfQmRwrpXcddc5PxOQhood9gmAqtInxhlI48bgbIb63ueoRWOwGLYePEnS8IgRFyAp+eYE82MlEx6vtyll4jUK/BOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775213077; c=relaxed/simple;
	bh=i+5OV1UMLf0KsB6PFIHIGfzBNc9YjQNT7smSsDfyqFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PzYhDLtAYg6QSGP+FOaU9jJ35rQB42woXuJaAEi5hnjMOUU+76p/CRUTubpSRBIaTjddXz2lcJf5aQ3+34xu1BO5WgEfyzwYfISa417VnEVNeVKUlFSe3eneuOWU9IvZQ1fQ9d9+0WoRldHEmirC/yZeFcyd6FFYpZidUsFHaAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oEUmKtDt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnB17/Ye; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEUmKtDt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnB17/Ye"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6332h75f982191
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 10:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qp7jHdTewElQMOorsvsIFbf0ZsK4yvWuAEvmqGviOTw=; b=oEUmKtDtsoDZ/RsH
	KD8QPRgFr20LYSOEq2bQS6KF8110TysMJA9lQSdtWKmMWVnWqhn1a7gCqzCVQOTG
	RBB1Z0KILG593kuQTVD+SfJ9ukEBq/UNH4e9P4qUjt4R2Sw58LsXNEV/BIzZpr0E
	7c4b3rPP15y1gie7U7O2Nzn7iADLfFSbECB0/blXK2HkXdpghCMm/wELH3YL8Udh
	cfVr5EMc04l7RpP3UgkVmEZMdgSSKeZmfjC50lvxFNaXEjFEtIgpoJE8gD4IDwup
	vJD3FZStaYI0YO4EbFxmfFKZhf/xD9PWun+U1YtY7FAV7h7dOiRo9faLmAv39dBn
	FMWTkA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9tupu8cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 10:44:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b23eb4f94fso8783615ad.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 03:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775213074; x=1775817874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qp7jHdTewElQMOorsvsIFbf0ZsK4yvWuAEvmqGviOTw=;
        b=SnB17/YepJNySg8dflIXwCzcLmxhJcMYIDCOo/uj5DdTdGDAlWHKIjIBDwFEpxbcPX
         m1/fh1fleZSuYe175Z6YPphvFwAlHkjSd7oQOjLA11PvA9/jkS5gGpZFpEr0C75TmiUc
         ry4TpmJSgw2bvfNHkpoTZX1uXW+i4xcozgcvytw7Zl+ChIx0PrkvyIBGrV1HSBkpoMtn
         njAvMpkFJSbudYNVEvdLHr1Cji1XCSSpT5T+v1NTKaBGkOQ9VP4IYm/XYegEtatgyP57
         gzsK3rKlgbswAcqkCF+4C1zwUfhHRP9L5l41KqegP7Rs0Y8TGQNb2xm372OUtXpLgtj5
         U+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775213074; x=1775817874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qp7jHdTewElQMOorsvsIFbf0ZsK4yvWuAEvmqGviOTw=;
        b=cikZ5BicM+TrvtDF6TNdnwZ5rPO9z/qGrkgS4JxbMqdZ0p249y3WNUuLgd+JvMdxHh
         J/r18BGNuyIvJpNi73URMH8ZzIvaIpE3yFMt5HltersZGNRbNwgibRg6sDpM0Qqi2eQT
         muTU8/4dDA/J3sm5CVypIfxly4m99MMUwbNy7kbQyYJwe4EepgR7xQgFGzmjeBeUl/rM
         RZHIJq7qEUAG8/SOSnCrdWWVrlGiuuAgXsfYoEWqI1mWhErFjwcOB3y29yq379ds6Z6Z
         1YYPS4Evx790Y2VqLnLZ/BnYgy5aJHJDR4iKUMbbYi1szPr8GC+7+UDKAOzg9CKJD+ii
         pNpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKBJZPuEMTOFm6cTt9VkwHw30qy7NHjc9xQ1WXoqfPTX/qAVTYe/wUr0uHIDoe7cHEMU7hjF3pXW+q@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/EMumXNEW0oUWEKqkJo1ib6UKTH3P+wa1wsmxMjgcXdQAkfd3
	K944d+fFSKgYk9VLgCAJZ/jiWDsxFn3JgWm40dx+JGtJETKvMPWQmj3kc/2+gaDSq0G0I+DlNmo
	oNUpePYGyPmfOdgCU6HDoxDpyF5tQTB1cM2ksj+HdCOVVWLv7fVd5KKoib2lBzgwb
X-Gm-Gg: AeBDiet0Rq7WYv48Je4MuuArPuB7EmPobxKOA5q8Ka3EMbCnw+uJJ23+OAX3lJbWew4
	Y9EesWZcPW6o430YoGAqHmzh+ENpDyFNv399bC9it+hONyLlHvft1EDA/VzYvd0Ui1yOfvTG6hr
	JffS6Ybr0SIuz7UD9lCwVM86UEwOFQAMEqJ6tDXJulHUdWNvJsUhPwMLv7QJHmP4ZOCCJIVQSrC
	lOXR/64mkOdmbzYvozM97ySo1E34VCJUXHnmEoo/O2mFkd3hl/pa4j6qE7tcopBWeCN98Stjq2T
	Af8eFljc0rK8uPPqa6ZmxtGdlC4Ltqwk9yhmGC9/z6cromgkN7eGT7CScQclQj2k9TPkxDq2amR
	BOvJdN22maqDDbIXj5p1+rktM6WaVrj4Aco3aU+rLa3ALNNcNrw==
X-Received: by 2002:a17:903:3c47:b0:2ae:54b2:27d9 with SMTP id d9443c01a7336-2b2817ea307mr18235155ad.7.1775213073995;
        Fri, 03 Apr 2026 03:44:33 -0700 (PDT)
X-Received: by 2002:a17:903:3c47:b0:2ae:54b2:27d9 with SMTP id d9443c01a7336-2b2817ea307mr18234915ad.7.1775213073561;
        Fri, 03 Apr 2026 03:44:33 -0700 (PDT)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d55fsm72340455ad.11.2026.04.03.03.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 03:44:33 -0700 (PDT)
Message-ID: <0f2612b8-5c44-4934-a625-27a66eeb7bdd@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 16:14:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com>
 <20260401-monaco-evk-ac-sku-v2-1-27b5f702cfba@oss.qualcomm.com>
 <7baeajhlqv6ujiqzmknjw3h6qr4mdw6qdywhaczm3c42pzjiue@nsgcbd4jsba5>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <7baeajhlqv6ujiqzmknjw3h6qr4mdw6qdywhaczm3c42pzjiue@nsgcbd4jsba5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA5NSBTYWx0ZWRfX4N/2HJciJqxc
 NNUV6/1LAD4LQFB69qwSVRJ6m5vm8Wt0BbdJCaayffqq0EA/d8JloNq1+PfvEufphYH4D5lmi5u
 1Rxqu2NUh5m78cJbJPsNDr4zCiG4ZoLunbVdaN2IDRP4NCb3scoFSDMboNdHCs0EGjMF/G64p05
 QKDDwn//8vPDQbFwycix6w9CQY6YBXVp+/L2uJ5WWLcLeMpO0wnyAbjVIfnJfyvT/p8dVxW/fah
 oabjqY3SO3bbOBiFtOU91Yn7ssX/YaakAD3OCyTm00lPgdcmFSUxNRbWQtwOv6A1moiPoz8hj9y
 lQzuow7bnFoDZkr/oqRLNOtpFClx8toqv0zII//x41aWitR6UdNduMmCPYbaL7bzYonZH7IEsUj
 PDjE2VfkFRYnic3158WyH8kLAuN2A5gZXspCitjaWwRFbyfjbpIU+HkebG7HLUdoPkmZaU9xD/R
 5On0thvovFGetIqs8Ag==
X-Proofpoint-ORIG-GUID: eeOSfnDXkuv1kjmR5yKGgnWgClsNMcZ9
X-Proofpoint-GUID: eeOSfnDXkuv1kjmR5yKGgnWgClsNMcZ9
X-Authority-Analysis: v=2.4 cv=DZ0aa/tW c=1 sm=1 tr=0 ts=69cf9a13 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JE7w62522NqE47sMXtoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030095

Hello Dmitry,

On 4/1/2026 5:06 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 01, 2026 at 12:14:42AM +0530, Umang Chheda wrote:
>> Introduce bindings for the monaco-evk-ac IoT board, which is
>> based on the monaco-ac (QCS8300-AC) SoC variant.
> 
> If it is a different SoC SKU, should it be reflected in the SoC compat
> strings?

Monaco‑AC does not introduce any S/W differences compared to Monaco SoC
-- All IP blocks and bindings remain identical from S/W PoV, Hence
haven't included the SoC SKU in the SoC compat strings.

Hope this is okay ? Your view on this ?

> 
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index ca880c105f3b..c76365a89687 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -918,6 +918,7 @@ properties:
>>            - enum:
>>                - arduino,monza
>>                - qcom,monaco-evk
>> +              - qcom,monaco-evk-ac
>>                - qcom,qcs8300-ride
>>            - const: qcom,qcs8300
>>  
>>
>> -- 
>> 2.34.1
>>
> 

Thanks,
Umang
