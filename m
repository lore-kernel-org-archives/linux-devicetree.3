Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365623E929C
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101042; cv=none; b=kSUAxZiCaXq7WSahOw2jqrRPqlZS+e4ttYTBTdr0bUH2cc/5Rvk4rNnD5yAQUNYAf769JsCx21nThPVWdyWvYXRvLXMJrsXcpIZvwrQKve4awhYA4u9T9Rmu3t8kAiVP73CRQ1yq6QHMeYbTiaATMlnET8QyyjfTwAb63NPcAOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101042; c=relaxed/simple;
	bh=l4ToQiBwy7d2RiY785WIbdxmKwkLErG4Ylcah7yaaio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4DucZWxDPpQ2aVBbZ/FvkFhI6GQEV91GtEirD9VvqOh7RiUvcuaKwcMCvIvcnu+WCDFpG8KdyaMvr2ZxarRoqkCrBDUUN5FfztYErLk420c0A4zXVpAW745jKGKGiZSvdIuL+E5jXQW+dZWfpOmnRaogi7Kv36D9ARUw1WbqFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKiYZplq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AHpCC7yq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKiYZplq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AHpCC7yq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I8wprN2566976
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H8g9fIrkR3zBA+xoNE5AMzZclMhUkHCRBwnPd3MLibI=; b=YKiYZplqwD5mfco2
	opUgOviuILxcrzdiuTJw9V1Ri+2HhvzQXFHGcX/+9htSm57bmqAaN1PefKhHnCR+
	IXgxtbDEw/pUJVLr69oF+epYfftz1W5FkWuppkV88m1RcV9B3RObNUwFCE9CrZKZ
	ZrqwMkylCcEaZIHlTWyuBkzqMLCwxZJt29d6F8g3nYbBvLCKC5VlmMN+grEF6f0s
	vc+OpXGqd3hT2ncCcJn2XR0ij/s7NgtEadao4FupQL3SbK6RYZa8kLBUoyVJKZED
	tow+7R36WOKv7bFHvrp6MxyF5JdrHEvDnRk9k0ezv5EKG/1h1Eq3GeLUJ6QCZRQt
	vJkfbg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqx3t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:43:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fd55bf6cdso1374772b3a.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 03:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779101030; x=1779705830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8g9fIrkR3zBA+xoNE5AMzZclMhUkHCRBwnPd3MLibI=;
        b=AHpCC7yqbAWfRMIdEnZbuhaAao4XbW/UfMLJu7fe58eO/6u6FumxRKeQh+jaT0AX8L
         BVV5I0fHvAlSmaQ+uqiEEKbzJm3m8Bxj1Cpovaz9UDUsa08A2Z5AbdkVFl0FDRvSgUGq
         HSAM5xtOTQddcsI+umT3UZ6Jl3PELtmbDzz2I0k1+XN07w3eFaCvOm2EakZLbkNKVHKO
         VqzKeyAO06t/89wvxbqp/MP6XdY8AjFVr4j6skyLn1m3s9IOatZVzd5eMzwzpTu4mGGj
         q+GcXZJs3w0rLrdpJNdXXEnAy+YOPGNC+BSv5/62KMh9LsEClKNSiWlfUvKcG31qHLQM
         y2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101030; x=1779705830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8g9fIrkR3zBA+xoNE5AMzZclMhUkHCRBwnPd3MLibI=;
        b=hvej8dPGoN7jWaLNKb0+a94Xiw39JaJuyM5L0KzEKwcF4g3+DZQhQ3SQYT0CwG+iGI
         045qc9H0Td4kc2X9NrBNqBr5RM9kgIBsjjAcb+VAUDExymhfrRW5kuCzbaorcIpEqFW5
         v82U+55w1h0au/1cARXYRhWDfLpKj6vgVp2LZSwTKEfXtv+tYC/HGY6pcBR9U1o/xVcl
         jzqqs/DlQ9Iws0fW1uAgkoJNUqNixqnrXIRLz56uUr59AD339ssnxjd94rY8Ga0v8qFl
         Psy1Inz3ak4/pkCUiqCWLCtxRRmLebmtqU6qBjx2B9kZIZiiHKsBqj/0wsBrQKGqok0u
         MPWg==
X-Forwarded-Encrypted: i=1; AFNElJ9cIn+97P0BVFhaMOZZeZftKELjWrdwSWtAgXkhHuGHVCdg2TQ+J9dfqs1STYQmedQsudg4t1qnE/y1@vger.kernel.org
X-Gm-Message-State: AOJu0YySrQuD7ytOYQwm1RvQkajZNmjtJ+msoKSERXTu95dh2O20Vf5s
	H0qZUhmzewnn/2SOm7nloRU0MSoje1BISSjnmN2HsMY7xXKdHzq3ZE4lAVEE0pl1UZxLbthzh9N
	HZmbwDgfUe91fFnK2piB55Q6/eH1ruuQ1BMc1K/p9tNCUPlE67HWpYlGoKpSWmM5A
X-Gm-Gg: Acq92OHQ4E1b8X/+3T4ol6rXH1a8PR2QM6eTGH43ZwpSHlBhfbamx0ibk/exfGeINLZ
	9ARzx8evxGMPWG4FCzn7poBfQyL786KtHpBMfV2T5gPVa9/rRTr2lRql/478pGda+QJjdn0k1dE
	Su8N/rYn60RO9EbpuSfv9WW3mpKNF+hj+YMEs2rsrJikOmy1W5e4+O2yo5eVCxHZ3noP6sRJAbM
	QJGeFUsOaGPosramV4XCGDHs9DbusY56VuXrwcnfu5VuM/kdihGAIz6AGQrvhFwL7CnBG4CcdSC
	ooeWwmbTSwZqdtgxYcYVrqB06c/RgcupmGFWq0AFa81Arf5iUuKxjMTwVK7PBsk8BbTfo1846B/
	DZM5nZvnfEM97i+alN6NRXA2lMKx3pWtj/b/jkG4o1I0sK7cae4vyUL8wU1xgLDMmx/dGTWhXRP
	VFRnX8Id0xGdXsEpTAjNEv2C4oNVQUIJ7bdEo6FF0o1+KQIYE=
X-Received: by 2002:a05:6a00:3915:b0:81f:ac81:d597 with SMTP id d2e1a72fcca58-83f33a38df2mr13901977b3a.0.1779101029701;
        Mon, 18 May 2026 03:43:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:3915:b0:81f:ac81:d597 with SMTP id d2e1a72fcca58-83f33a38df2mr13901956b3a.0.1779101029233;
        Mon, 18 May 2026 03:43:49 -0700 (PDT)
Received: from [10.79.138.73] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5ce1fsm14182221b3a.35.2026.05.18.03.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:43:48 -0700 (PDT)
Message-ID: <734cf62b-e896-4089-8c8e-5b773ae7df5e@oss.qualcomm.com>
Date: Mon, 18 May 2026 16:13:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Move board nodes to common DTSI
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
References: <20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com>
 <ac3i5MIlEQ6y9SNp@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <ac3i5MIlEQ6y9SNp@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ORRk3l8Guzo0NSQqrGsCSWHOAFp6YWTb
X-Proofpoint-ORIG-GUID: ORRk3l8Guzo0NSQqrGsCSWHOAFp6YWTb
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0aed66 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=k8rrXGyE-Y1bW8ej70EA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMyBTYWx0ZWRfXxkBg/zuLcoaU
 ECOsXjj7pIqmP1bYBF8XKgaYefStTcP5XQbHhMmVa2CTVck3O0YyMCa9ykRdtJZOp73N7gb4mHl
 Txa/97xwEiZQMW4KKpQfqEOGWuKPGzKaJnzVR90QBw6bycKZ7gIPZ/MJaMJZMNUMJmNuULezjOo
 SHUJ2y2WYm8WV4ZVJvBLUe16u69VczNgQQ37a246LE8fLsi9tLCVC5Be53QZfGxro7k5l5dj+Ze
 eS1peveU5g6Mz3f5QUrgKBzVTK0NVq4q2s3D1pRF4kOZu4doqWyR1MB52hafw+IprOx81zeMVRY
 ME4Li13UtXSd/j6F16F0wYetUJJIMEhdNt5armFtkLKyXRv785mQ354un3hQ1+DY7xfYnZ1z7rQ
 4wt5EqCtqj9COG8AU25IJRoUhD45DEn6sTNYdlmoEc6Hjm8iQF750E/uQB5vjknFzZptsN5kJq5
 UZFnyoXK+DpmP+2UWfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180103



On 4/2/2026 9:00 AM, Shawn Guo wrote:
> On Thu, Mar 26, 2026 at 07:21:01AM -0700, Gopikrishna Garmidi wrote:
>> The display, peripherals (touchpad/touchscreen/keypad), usb and their
>> dependent device nodes are common to both Glymur and Mahua CRDs,
>> so move them from glymur-crd.dts to glymur-crd.dtsi to enable code
>> reuse.
>>
>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> 
> You may want to have glymur-crd on the subject prefix to tell the scope
> of the change.
Sure, will fix it in the next version.

Thanks,
Gopikrishna
