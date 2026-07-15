Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93DD436BDB
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108482; cv=none; b=J6RiQLIcKGbeavw1qE488yrxXWPA0UsjslOa2lb4AmsSfJUfw8OnixIEdYGRuDY9Pwa8NeimC2IRsIIw9xs8LISmULe8Z1p1mlh6lMKgv17RmiYXNcXTyJLPe7bsbu55fLW5Pd33u5Kb9+Omkbjof6qZv58WdfB+vHASTRxn/Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108482; c=relaxed/simple;
	bh=CZWjRFVhNRFD5KRdIhEjv8uNSh0JHTUy4wS3VdRGbpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oKGe8maTbuFfD7YvJexSTl7RLON0fcWckngKfSYnI4x9QywvhH/lvoZWCm06sGvD+9W05+/gDic5+61I7OV6HxThgw0Hk7US2j3oBexzSrQjVWeRGXOuei2glOPLskDEHQRUfGav+Y+KMYH3CLnO2FtqWneJztS7fhhJoNW64hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIedsx/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=St5MVPnj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIedsx/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="St5MVPnj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9P86S2679910
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i0ovjxjsaslUBo3qllkswGA5E6toY8tNc/SHCtFB524=; b=lIedsx/aaHyMAIkz
	AZTMgwpz3E5vG+i9eyOwIPecGapFOd5YvhS1O6IdyGOdwR3cjiYy7E2wfsaRat0L
	wNku9JplWkv9MyGuR1IhTCM939za3jlO+F+bI9mReBAglKk3goNVic+zgw7tRhMr
	hIb9JSadmrVE+VDFCvZ7dZhdPiYqWNudJnCdpYuuMuEpTHuol6c8a7mZxmVabt9s
	YeNK5dlI+w44sSdb3T4ra3sBaPpdMZiTvW9d7ATvUp42Q71rkJKnBikaDYg4kiwx
	q2Bg5xUBxjLnODtkZ4bz6FTNiv5QIS25FCuOMXJSuUz/PaeSrAI33hxEOt9RSn/u
	CiK8Yg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnuv33e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:41:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ead919557cso15438536d6.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784108470; x=1784713270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0ovjxjsaslUBo3qllkswGA5E6toY8tNc/SHCtFB524=;
        b=St5MVPnj+LKLFljF18IO2RZlwVTKHz5n8GlVWkaxIXrzl22nBrKEj94WX8RGNB3wsd
         X3v5ouLok98NcQdEixp2/ZIlduUlL6fAzddFnQQxHZaPh4u5YIIG80HAgW12TiwzZ33D
         EMmUDkxumH8b6r/M3YZg0ozMyFjyGcJc8q52lURK8+vnihjV7pROc2AQirXSzv9xOjEH
         TQ8gMTAus0NtAZH/+7PMVdj/TX6geF3JTKEVoddhP3E8Ks7/YK8JNdX2xYcCAzXTG9fF
         rfsrr5V4nLeXEua0GMhWFA+mDIKialXOFqH7ysz5AVIFkuQDCFaF2+PRvXr9+CurUUaJ
         nbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784108470; x=1784713270;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i0ovjxjsaslUBo3qllkswGA5E6toY8tNc/SHCtFB524=;
        b=cdeva3UiMDR0guhqevi6UOWdlMyK+Xqxz1QbdFzcfChTERZyFylMRE8nULbHcU5EiU
         0grWPO+O76/EfRQb3SZaY445nSzEbX0DbjX4edhJHMCsZ0u6t0hG/i5zfuw2tz56lUjP
         aj2vXHgj3Vi7hwaJrVFGcetwVDwJ1UfnAYAGSkbNizJveLXc+mbJa+D7KAfcZXfr0KqV
         R+HdcXfjZvVzcndKj+aYqXReAYfncwqnzhMP325ujoYHycIbEZa76yuPTJLEut0mi2Il
         ZLHY3yGUkUFEXuz3fKoOgR8NzWDvzL0INzj9rsb/nzM06px3URbj6cg6SNSm2r83KEkq
         2qOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVdZg4Naz61KoLCGlR+x9Vm07fJfvcJqoxJkbuxTjKuM6p/00XPm1++7EBdROTNIdA1ZQY3fxgzM4Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxsY//3wnv+Or/tKWTf0r3qwgwyPg01Idlz3CadK9liadKBPJHc
	fp+4sXWSLxiN7B8IQgoD7QxVtoozs08UboGYeo4J+2GutUHrNGrl39wZm15ILml991hGIyEA0Y+
	1V8a9GpNVHCstrxnZDWZzJfXDKsUHdBOtO6CZK3/PtEDLMDKUnPpqyjBURWEzLtza
X-Gm-Gg: AfdE7cnxVF+D55Qi4R4OVzLlIB0MPFt7gDaPTK0IdCLFSDl+pW7Q4svk0i/GEhfc/Lt
	TAZvgJONz6ZDDbPprSM5moggJYiG7oCcjSlfHHtxwHn+ggYoRyQJQ1r953sZyRQU2cpWjEVsID2
	874pfNaysWagy2HAZ3SIcmc67Wj4gNloO3gA4tb3AOO5ZyRkDHZggQgQu5fYWsDCRu2K8Aeg4eO
	q35K/cCycke8pMo4FrXeHBHZIXuENF0J+gsqEkbXLNrMc1IE9XLE56AHuF9JoD7mg1rqQZLd88T
	T4ocOdIFmCI3wMxxzwaR9/fwMn7+mJvaHQk9cHFOVKE1MEsPCkVIchjkP0Yejvj7dXpKnM81IiL
	tpwGITwu7K/rd4Vk7SgOUkeg0aX70VCQVel4=
X-Received: by 2002:ac8:59d2:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-51cbf286b1amr133643931cf.8.1784108469815;
        Wed, 15 Jul 2026 02:41:09 -0700 (PDT)
X-Received: by 2002:ac8:59d2:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-51cbf286b1amr133643671cf.8.1784108469343;
        Wed, 15 Jul 2026 02:41:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c63c04fbsm1127051466b.23.2026.07.15.02.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:41:07 -0700 (PDT)
Message-ID: <35941437-9003-4e64-b4ea-46137077c214@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:41:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: enable ETR and CTCU devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714-add-ctcu-etr-for-glymur-v1-1-791de63c0713@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-add-ctcu-etr-for-glymur-v1-1-791de63c0713@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F4N9m4PfoyNteQga5Nh66N7IMh85SM-Y
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a5755b6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iWN5h_POgodqhNU-qcIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5MyBTYWx0ZWRfX93L5zeGowPK/
 FbNqST0I55rq9Nh15pNI+QVnd8ig41HnsFwlE2jcFCWx1WQl8I0QZXnnNsJiDV1V9614Oiyew5a
 w/Bf4XPHkOOCYmV61hB9jxwVieTlUde1D8SuAqfHRft7gVpruFM1ZqEDBMWKsJEv7pMxAxyMj/2
 MXsRQdr2hYhnuhtQNuR2YsvynE9NS2JZTp6abzNzfWMBl3AD1nN4VlQH+b0wNkZVfsx3m3F/H8/
 yU1bt9V7Zw/WOnMZqIdMzg/9SeDJWN49GLCnYfo3Tw2ZxVsw65pSyogz6Qv1B4luLV4mUTLUHjS
 ctr3KV2WSBkUFbCgyyka7Rfow66SDkARO4wbb3jljtjanMcG9x9CLLaMLxoyXfvoCGWj31neYQy
 p5C2n3LLPtgEu0RNKIVQoCatnIRV/86j9mVmLj/+yezdnZcJa8lmBr2l3EbbUOvc+jvITqEi36p
 L61CKHebWUrLs89R4Vw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5MyBTYWx0ZWRfX8ImS/TXSXdjX
 5VSctXMzZhXic3CXY9YLYcYsRsGxTUxWL6N14Xu1GtI/8Sq200c6lwU6aT8uvc70Aeq8EHciroN
 7tFz5ZliBDCjWhPzBdt0W1JnzB4bFjk=
X-Proofpoint-GUID: F4N9m4PfoyNteQga5Nh66N7IMh85SM-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150093

On 7/14/26 8:50 AM, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device and the CTCU device serves as the
> control unit for the ETR device.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
