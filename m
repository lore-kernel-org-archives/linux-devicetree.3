Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB452F1FDF
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728260; cv=none; b=nH6NR6LlQ1b+1KZm6fAjcHtfjFbtjSyrXiXu00dKqn6M2fnEoKTyn70/FhOytEo3yg9RQ7vNcQvB5BaZIgdf1Uf6Ueybp71S8hZUyRCQ26yXvP2l+S9EI7p8olrgQsVlSIV0PqPTbzE8gARVmEgX1hzaMkIT7xAMXSRFq9rfz9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728260; c=relaxed/simple;
	bh=XOHN+A9UrA9lHMZWm+prfk5DYaDZGzDNDx3EItH6QsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fGYhtTLpnkYJRnQQ2St6L3nLPtFjq+TRA1Fe+H4eW9oImFfbdkDxyJeY/YN/jBwo5xDMI5zOVGWtWVbZolIaMni1gfU7wN8Odvhf6yqAJXyvYOKRTzlvxEHPdsvGwllbnwhYFw2japJizowt6ymg3BtnuHJN+UAY9zZu/qF7YxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xyu6x5t2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4+MXHkV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xyu6x5t2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4+MXHkV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6sKk32143093
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rGVDMRWxxVhXu6sG3ksNatTGE0seC/FgPwmQZg+NpqA=; b=Xyu6x5t2IhWN50Rm
	RkIdtnimzBHYBG01Am3OOoDXEpgwZ7M49iHo1y/iRG7fi1+x0+1F2qFf+icKs9PP
	PXXsMqM9n9pXjUEr6L5Ay+qpEdW5mty70Ps5AuRDko6vVGOjGOCRcofRbqT5WKoQ
	0zrKOBjwEsXm+ghQ5TMqeK8R8KuyTQKe+aw4sThcuPkRDrBz6mua32YP/8UdMf2n
	fG+rypcyYIRE61MdsZrhzJKYnl/KUA7kwucVsSUYwLLPxJq1RPZrqmrXwPt6wq9Y
	4SXGdYPirMCeu9bcKt6yL6XLLSzfdzQ3sjwtNxLqPpFkcvMFc18/fMsne9k9WoYb
	+UQbzg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8p0j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:17:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso3490690b3a.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782728257; x=1783333057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rGVDMRWxxVhXu6sG3ksNatTGE0seC/FgPwmQZg+NpqA=;
        b=W4+MXHkVb89CInWLGQIOGCoOa5LAUT0bbgcjVQ802AkF76TsDSroX3blV1a+yTHRgN
         8PfYRaH5K4AdZPo9PhBNROC7JGmsZk4+0mR6JtBhycb7mTElJeLuG9tvjP39pu9iHmPH
         c7T7naWkmlot86HTuhE7d3fBWAdCLI4+H+Du3LS1MvQ1oWyuRvCoH24x4tH8867tvlNi
         qK+GJr/swWL99cvIdHey1WO3ELF8VqZp9BB/m0ns2mOy0/7iMrNGSq1t+CsAzYGqVHlg
         RKU8tr4vXz4p7rQ8osZ1cF3NkX2d7JDePlNT0r26npIu0M2TL+gzgfhQoOgRPGDUKj7T
         nhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782728257; x=1783333057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGVDMRWxxVhXu6sG3ksNatTGE0seC/FgPwmQZg+NpqA=;
        b=PSIg9sfNpscRe0eg2YxpiP72cXFCbDNwDF2INJADkcf2aXYI3GFm+43D/l9SRwQzeW
         qGdKU2e5AdVZYq0wOs9+wToXfDj2JO9YjoDlpZJp1EykJkMTEypChyCF7Fvu50qxP+lQ
         XaUzZf0lWPd4+XTeOXjeNzENOh6ycNPjIhfOUYoTeIx+PaYhttIHoP69QGOYYW55XmqE
         lId5gXhJjaobhRTuS5O6z2Zd+c9/HSnGwGuIYPA84EoXTUNKTe5hOOIbaWriLl2F8Q5l
         kncejwgOLOemGIOT69apW+vXxHiY6Py4cnS4LUnR0FhqlnNRpIhQdkxuhH4AYIY41g8G
         Xr0w==
X-Forwarded-Encrypted: i=1; AHgh+RoY5IvylN1dkcyny/r4CaJMsvPXEG3PaDYCwuiQ9neD+DXNaApYjqjEEA3EqX0mF3Jc0WYgc8t2iDos@vger.kernel.org
X-Gm-Message-State: AOJu0YxG6S/y5zdp/xXiHyaR6TmJGcE75vJfveum10t48Dc4oPA37lj7
	tQIcjQGRGKWsg6OM08RzNq+9MABPzYryIOYcYU9dwS1Kh7MIjbOjx2ELBkpxtkpm4vyrouIPLbV
	WuSeVMtgRpMu2htM58Q70u+kZlUbspr06V2ADIgAqKiT6BnetxQ0BuXSTFtT6iYHV
X-Gm-Gg: AfdE7cns32qD6Vy+9KwGo1bBv4Vj3tGP+Z091HitVcA+nnaSjhw7rJE6ptacbnSRsXl
	nWp7vja2DivIizOvnA7Gf2LnBQpBlmwXIjT3oOGxcwWu5Ot/VpfRviz+wbNgrIaIPmujVi7SAj8
	nTE956mSTAHKUcG+WfeCJ2M6j9sbGXlTQg8cJZh+Gpu7Arr4A1cxqijaKyctQXt1PHPBcSGVxyS
	s5dUFrFqHRpMVGokTEbiyXT6e+mpKcgNF4N48A1xwQwPhTF1ZtMYipdJGfydRijiY+JXsoO+UB2
	pExcShiVvdLW1LalAyrrSdHVFZmrreiy83Z+w8vop6NroUnYbc8+aLARDwjkyeY4ZEvtJq9paBt
	ojo2q1VkLkBKMsOmOjgvNy2XOt5olvP4tPBwFsMdhTmr+sD4Vb/XDqkUZYhPswj7EbB3H02qsuX
	NT4mGruVo=
X-Received: by 2002:a05:6a00:92a6:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-845b3abb5bdmr16173882b3a.13.1782728257460;
        Mon, 29 Jun 2026 03:17:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:92a6:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-845b3abb5bdmr16173852b3a.13.1782728257017;
        Mon, 29 Jun 2026 03:17:37 -0700 (PDT)
Received: from [10.133.33.239] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845cdfac944sm5773852b3a.12.2026.06.29.03.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:17:36 -0700 (PDT)
Message-ID: <c09d70e1-edd6-41a8-8ab3-db353bb6f8eb@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 18:17:08 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/7] Provide support for Trigger Generation Unit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
 <48c6abce-c492-46a6-84ef-3074983e817c@oss.qualcomm.com>
 <a36a1ed3-5194-465c-b029-0404e0f2bcee@oss.qualcomm.com>
 <2026062959-distaste-launder-e253@gregkh>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <2026062959-distaste-launder-e253@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MiBTYWx0ZWRfX8Cms6a7xxi3O
 UGUvDxMscjViQAfadqosoaF79OD+g5082VoK7Ze1M8IDwN8nSmslmYLpUKQ0IDEFdu9ObWMLHdN
 8GrWJ9Z0vyI2I8+1Fs5SsmApEbrVBwc=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a424642 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Svlu2gy5LF0AZrWEB8IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: B1-wEz_o9nGc_HfqMyab8it8roDdNOX7
X-Proofpoint-ORIG-GUID: B1-wEz_o9nGc_HfqMyab8it8roDdNOX7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MiBTYWx0ZWRfX7Q/OwrYWeuEf
 jjjiMEPD3dqRG/BJafdLfEykWt9f6DpQmlGaLspyFrS16xZfkd5kzXbaXIOg4AUn/Ch9DYlRkiF
 xajCguQarP5WTNBUF6dlwZx+hlK6dKsEodAm31O14y4E2q5cYcJSHfwc3vFBdds4iYiRaXtbhqr
 /C0WpRX4fa0MNFXCp6Rf+t4QP18hU+a5MgZ23lUYZjgC/P73xHL2cIcGUQr9x70i4MitkPGr2RE
 G7x8VoN18Vhyw5AH2ddUi2S7UPNJunEM410r3SU9QmbAxs0vbx3e5dBuI5OdP0phekfQ9DgK7s5
 alNGQxH/GDZz8lc4NBl+N7iBuY+JzYn0R7aqDAbSNEf4dmWAhi8tFcndOKBGeOvxQHNBbChagzM
 ia+ZXgQzoPQgaiVn8/nrU+1ffDq41PjxrEg7pkXRNZT6tWH7klUrVTgsFIvhslvuTQpwQRnDLcs
 dhp9MQ6zk+zooAdMGoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290082


On 6/29/2026 12:22 PM, Greg KH wrote:
> On Mon, Jun 29, 2026 at 11:03:33AM +0800, Songwei.Chai wrote:
>> Hi Greg & Alexander,
>>
>> Apologies for interrupting again.
>>
>> As the TGU hardware plays an important role in Qualcomm tracing design, I
>> would greatly appreciate it if you could kindly take some time to review
>> this at your earliest convenience.
> The merge window _just_ closed, please give us a chance to catch up.
>
> Also, why us?  Surely you have other reviewers for this code, right?

Hi Greg,

Understood, thanks for letting us know.

Regarding your question: since this introduces a new 
drivers/hwtracing/qcom directory, there is no existing maintainer for it.
Given your scope (and Alexander's), we believe you are the most relevant 
reviewers.

The reason for creating the qcom directory is as follows:

/We previously tried to upstream this driver under 
drivers/hwtracing/coresight,/
/but it was not accepted as it is considered Qualcomm-specific and not 
tightly/
/coupled with the CoreSight subsystem. Based on this feedback, we are 
exploring/
/a dedicated drivers/hwtracing/qcom directory, similar to intel_th, to 
better/
/support this and future Qualcomm hwtracing drivers./

More details can be found in “[PATCH v14 0/7] -- Why we are proposing this”.

Thanks,
Songwei

>
> thanks,
>
> greg k-h
