Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225291DD0EF
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787712843; cv=none; b=KfmxoSUUDyqqcAZRJ94XWfGrBQMnY37QIQ9/1JgMXxXD97hHaapa3XmK8D8GRUrYLJeaWf1DQlayzIiuHyS+WDJ8uLdOiqzAqk5rC3/Hxy85WklD83jf+odtNK7qxF/AFukQxMAPw350l4gfNPtgxfe8oWgsafukFJ678klfqCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787712843; c=relaxed/simple;
	bh=wqEHyThrKPi++BMi2jTCJleLBgo9aj2aD4TekGGIWyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aioIUmTcX1QTl43D7XL+nkDtQbQJm6Sjq7nZTjWj4kQ/ILx5VTw26DnfypIvzFbd0Gisk8PDKq5jge0SRPGnGhNTz3kc1zHFe+VY+geeD0mkKv4io2GenG8BnO/fR1iZi0LdVegM2zlFRoKg43EguzQLThXniAIhOrW4lwnY+WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nGyRCOOE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZMlX3F9K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nGyRCOOE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZMlX3F9K"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q07OXt2295999
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddJboHpSvSX1Z16yPX/eIHL9/F7ni+5viQTQ2BSEvlY=; b=nGyRCOOEBwAI0SrN
	vodQLvRU4DRtSev1J5AxMFJZa5OBFM65xAwLeRXUXy3sh65mf+odo0x++njSM5ZW
	C8gjEc8lronFyxQsSNJd5DlLMPnBwoOGtK2bxkMCCBR2cKCPEwxzwd4l//CMEULG
	n8xWlUdpt6x1GfkZgjD5VduCBuIvmjTMi7jht55sVnTZJinTEKkjbapeU3kIHL13
	Ryvn2jBA9EL55lx1wLWx75K5f7WrlZbXu59nbxkLjh+FIJMnZzRTIyX6rwV0TppN
	eAANZ6gYFw6UK5kF27rwr3GaKxRbmP77/1X/AsMLedI7YE+2lQv4KVH7qVAfRHx+
	Jy1xig==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9f9usq6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:54:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso1012299a91.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787712840; x=1788317640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddJboHpSvSX1Z16yPX/eIHL9/F7ni+5viQTQ2BSEvlY=;
        b=ZMlX3F9K1vXV7wnL1K3i/Bi7y5wR8kro2Fk/6/GCdCM+CGMQ0i0HRqVrBgSd/SOnww
         iJDsuBXbZGGiyeApakuDEoVJ3KdSmvUTldMGH6dj3TcgXMtbs+JLZmCOvGVrNWeTlG6x
         l1M23o85iVFYT3WyprpQIZmiT1PLBFVcKTEfeFUvXB6UZy+WGbjETZNEWhgwAWfZ0RXh
         qKAfcmNseXd8worBhbdKJNyDh2p17T/1Pmiz9MrvlRLdANktA3CJhbfqVF2W+fGKyGI6
         U199PLQCYUpAc6YvUJeE/5aNri6tdhXyS6EHXpFPe+uLqzewlqtPP8MNQ/9Zd4FWPEGL
         5zRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787712840; x=1788317640;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddJboHpSvSX1Z16yPX/eIHL9/F7ni+5viQTQ2BSEvlY=;
        b=eYbQdyoaNlX1sWSH30aXEjprFr95wWeJapJnp6Q9U4T2IwnRv/0y+TfBAAl3OYYd0U
         O9kow5VzhfR6U4ywX5BfCOixF0vQ0pDlSi5orSKc0zQO1+auG9lpOdvbG7g8JUvJEA8u
         fY4Y/TsOQ4DonE5CDljLOlvh+GmKiXgag6omhBcGmrJYbWIMFKbwsLw6CqKS+dyc1NJb
         ooIw4f1Jnk7sJ27usBKCJkcboKhbyPfIu1VQHfs/je5lKDVXd0oNQhbe9rXdeYJuAob1
         r3nTP5Ei+H1Srsa+68YMpUnk6U6dAw2TUJlQ/vd5h3EXO8/qOBAhkdzSuE/+kf8TCwDg
         fLew==
X-Forwarded-Encrypted: i=1; AHgh+Rpudf2eVQ7ZcneoVVEb7qrkC4cCOutBCqVIX0DfZvE1z0rtHOcg97J9+vg9bAQAUQ+I1DErETuXewdN@vger.kernel.org
X-Gm-Message-State: AFuF++kfhLDhMGD++deqVRvkExZsClKr6fcIZfumMqN97+V/eurartx0
	ANLT6HpNw4AI373q3SRYFCoYmCSXuQ5W4wW6oVgir+7g7i5Fx/HMyMaOIIXfB2MKwaDz6O1WH6e
	oRXjx3PpmeMsOKG9F8M/ky6PfURSuPrFBz+LA21m8LN6E84SmWDfxthhFi/pVFYan
X-Gm-Gg: AR+sD10qOXm6yjygUF1vD1VIM7JChaRuhXL8UOLqir4dD2FWOkjPtRRRF+k+CUWgofL
	XUQyc1nlmuDnLwxT1qNQqVMeNLiKbAQPwBAL9gUsPo0G0k2ulLM4aq990vnxzZJ1vJRwUyeWwAm
	Q1ZOAN1hMo3r8/CaRUyDd6w+/rbPkny9j2r9iAGfXjKiAdT/33V9NDjnvL0PI5zAfykayn0DhBe
	5/GzpYk68mCai47gFDgNp5oFpJNEz/Ix8g7nZXMV2HsxS409zl6zctV1ROc9qsfQWHuiI4YT1w8
	dgHBNy2wwmwBpjv8sR8SOzY0ECCo1NH4w59tjplWPq2wb+12K8paWBPtu9xyyN50zRFfG9jeCRF
	GXtEFjXtv+Sudjc2ieN+/3wVtSwN3qY+FT+y5OQX7UO5emCh31mDm5MwNzLHXdJ1Ng2MUwzJH
X-Received: by 2002:a17:903:1b08:b0:2d0:cc92:f7af with SMTP id d9443c01a7336-2d707b7f5bemr53716455ad.9.1787712839957;
        Tue, 25 Aug 2026 19:53:59 -0700 (PDT)
X-Received: by 2002:a17:903:1b08:b0:2d0:cc92:f7af with SMTP id d9443c01a7336-2d707b7f5bemr53715585ad.9.1787712839459;
        Tue, 25 Aug 2026 19:53:59 -0700 (PDT)
Received: from [10.133.33.110] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704bfc5aasm3273085ad.61.2026.08.25.19.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 19:53:59 -0700 (PDT)
Message-ID: <15826e27-514c-4aaf-b56e-b40ed0bd600b@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:53:51 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
 <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
 <5341e732-0deb-4d00-9a7c-595e317bf1e8@oss.qualcomm.com>
 <db2a18aa-f5fb-4ee8-8747-05fcf740749f@oss.qualcomm.com>
 <f344a913-cc95-4fef-880b-f1fee200c108@oss.qualcomm.com>
 <b6d6b627-a38b-427a-9e62-ee883505b2ad@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <b6d6b627-a38b-427a-9e62-ee883505b2ad@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xirzmOMUelZNe84YQ8NWgUpDaF4V6yBQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfX0+NSyAmmJf50
 9p2BWq8CDloQM29NYhISMJ5pewRunBYPQG+Qii+RFbFMUYzsW1+t7/eNKC7niwRIFZQPN7oZ63G
 svM8VJBXfecCXD12vtB+seX1JOqPYSanzURwlJrbbHoAGMcGYI6KyKjZr7jMgYvr8dpaTUqwjr9
 ZXcuF+z1tmc7+tMLrUvahaZgakFRRL0hJM1VpbgCWgKgDwWPhwmnlowYPCm+C069sO7Yeijm2iZ
 PXpwIu3R+raitE+IDVMWhI36R7l73yHxh5Sauhg8UjtxUlxObkFile7ydc6JLlWt9GDoFrsup72
 r2GlB/pSi+YUxtd4rluzEUbnK2+S099SHblLJgcHuDAnoM4FwKh3TFtVHfwgjOU7xv5ocrQpZ9P
 eteQWSvNeHHzaMpA4Fz+ZmCRFmeglMf5h2xRbkdHyC7VoUa/PTncRvBHLUetA21oN9jMwp12jh1
 cli4GtLF5bYroCYO0GA==
X-Authority-Analysis: v=2.4 cv=acNRWxot c=1 sm=1 tr=0 ts=6a8e5549 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=XoI0lUbBRiva2J4xD0cA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfX9e+RGMiU3+1V
 ecIC3XNijAzlBlO60yY3uuAJCK4HhJ02ntIiQpLP5Y/BaiXNjYNZHJoj5ktceYltyQGJu4hvHxR
 81qvLa0Epax5KK5xnx7JqjNGDKIfNTg=
X-Proofpoint-ORIG-GUID: xirzmOMUelZNe84YQ8NWgUpDaF4V6yBQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260022



On 8/25/2026 4:30 PM, Konrad Dybcio wrote:
> On 8/25/26 8:28 AM, Yongxing Mou wrote:
>>
>>
>> On 8/17/2026 10:14 PM, Konrad Dybcio wrote:
>>> On 8/17/26 4:13 PM, Konrad Dybcio wrote:
>>>> On 8/13/26 9:44 AM, Yongxing Mou wrote:
>>>>>
>>>>>
>>>>> On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
>>>>>> On 7/20/26 10:43 AM, Yongxing Mou wrote:
>>>>>>> Kaanapali (SM8750) and Glymur use two display power domains.
>>>>>>> CORE_GDSC powers the main display hardware while INT2_GDSC
>>>>>>> powers a subset of SSPP blocks.
>>>>>>
>>>>>> Can they operate independently? Does INT2_GDSC need to be
>>>>>> powered on after CORE_GDSC?
>>>>>>
>>>>> On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should generally track the same state, except that INT2_GDSC may be powered down when SSPP1 (VIG2/VIG3/DMA5) is unused.
>>>>
>>>> Is the MDSS any useful if *only* INT2_GDSC is enabled? Can the INT2_GDSC
>>>> be enabled itself if CORE_GDSC is off?
>>>
>>> (I didn't quite know how to parse the list of states you provided in your
>>> reply so I asked again)
>>>
>>> Konrad
>> Hi, Konard. Would you recommend adding the parent clock in the clock driver, or handling 2 GDSC in the display driver? I'm preparing the next revision and would appreciate your feedback.
> 
> Does disabling INT2 provide us with any power benefits and will the
So far, I haven't found any documentation that explicitly describes a 
power-saving use case achieved by disabling the INT2 GDSC. The material 
I found instead describes it in the context of display tiering:
"Goal for partial display is to tier down from premium tier to match low 
tier pipe configurations."
> display driver do the accounting for what resources need the INT2
> GDSC specifically?
Not at the moment. Our current requirement is simply to enable and 
disable it together with the core GDSC.
> 
> Konrad

