Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D142848A1
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817970; cv=none; b=tFP4DBRKfrq+UFHRMzjh2qbtbF+/MUG7HvLUCe4OsxBdKabCgmbuV/ugc29XxBG7RIU+k8DZEsGtSXIo1J+4C1jeto811LwOj2HAsp50xBNAWlgT8y8TkBhmHBoVq0gLn90zwabsczzuxNp/Wr9mPUADQDChvc/DvehcvFEhDew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817970; c=relaxed/simple;
	bh=Vr6M/PwxqfP52iaG2RuK/Nwr3+InnOK0QJf/jYsPnVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgVLjz8FliewXHL0Acs9Wasj5UXQ58HOU9haNHn3HGHxgGSGz7JqCdXNGiJCF0OxHtnnGlJmsLXlP4ArIq9d0jWe2/BuRg/uf8v8w6hrk36D9t089FtIvRFnSE61ugDMHxDbxRDc8ViJXdPglpRFd7uZXY3f1oMMFiJoyXsnWps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7bV99En; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/P+wPj/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7bV99En";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/P+wPj/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH11Lc3289778
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	US0EdpJwtoJcfj15vVP6RzBks/B4cqT0GUxzgW/jCag=; b=N7bV99Enr2pc/HI8
	RjnkVv1H99R7w6/8YV5G1TJj2YxwymB8GVfAd+VxCXsfmN7MLv/r3k9cg6SYxy7q
	cafj7HQB430NDrAY//IH4YePDQpwB9aqWu801huRAhD6jxE44rz5aE3SJ/+40w51
	uLNx2DOx6mpvysUSsPBA1r+94JhA7h0648UuAbefGysxOXrmR8ItykeuoruSqsxL
	UKk4mE7RlOaznS0d77TNEN+bkMnbZdNdkobTT5Bdh1btCgt6n/Nya5SOO5kDSzop
	NQmyslyv7CV7bqHARytX4yTOZ6xVGT8y5BhAOlRwc22KHY1Q4Z5HT41TGGlM3/mX
	NtWNIw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edf1j8c4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:52:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd6cc53fd6so111874305ad.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779817968; x=1780422768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=US0EdpJwtoJcfj15vVP6RzBks/B4cqT0GUxzgW/jCag=;
        b=W/P+wPj/eardIa26S8VZUbfBTS/IFfQB4+X3qqMz9eeQTsn2qQlrqhpbJPN59OLDc2
         3HmlcpNX0WcrNwByDvFUIw36WuVVKjUGX/F8RnqP9H55k6OGIRjhfa04Jnj0RwCWsFcY
         4K7Jf3VwllciZ0Z/eQdaNvMOo+o7ImtIHVxE3mAuwWu6ILivkDNVHBs9kg8KnbHCNJzo
         y7tjaTgMAOnXBfxiTjsspBXFj0NZkXhcYj3ZssUm5695P1+ViWM+WYdXCrH+gFrYIwFV
         YVGl/7i8jB32mT0RUwRkktn2FtrumSZ2epuSVFKzrkWSJIIhyMPNXx+aRL6wtO1nzhZj
         wQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779817968; x=1780422768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=US0EdpJwtoJcfj15vVP6RzBks/B4cqT0GUxzgW/jCag=;
        b=cnqT9XGePLDaSuLz45EVK96tlIVfVHHtiN5wJqLRWL7YDXs8DYvP0FFTU7O4DrprUt
         tA4RHwdymTXdr6equbm/226mcML39c9c1IqvTqX2OGh6csbXwC6XpODsqFDA9J2td0m0
         jxkc650TjdrkP4cz+pQKWOco3WYjxyPo546nwvs33GXfcMaux8LRAUwcCj/C9z76Ge5C
         ha06tAxrgiGd1QN7b6r9QO41fBQUdx3xI6A5ZnIharYlkS6WVmj7Ud1PQKEHkmz0WLOR
         4bQmsKOQLonSQwjbSyWWULmHY0Yn30DL7r/ARQzTBP/OcJXWOkR08FrFLCMUBdZ0U04O
         kOSA==
X-Forwarded-Encrypted: i=1; AFNElJ9E84QgNNicKtsUwCsi+PMPEaRsjPnCiBmODP/pNTAzAlZ77u53p5sNrr+HbXGqtdH2JJlWLjq6HUo8@vger.kernel.org
X-Gm-Message-State: AOJu0YxxgqHg4cFgwxLPlB83SYOdGHXihK50E+nvW7p+Nua9uzlkvyeI
	TumDE6dwDT9gnLMYxd6qIlQevjeM9j4D3ZTi2XJlvYhr1X9SY25vmF51Y2CcWHGu+NUiX54Or4v
	PrVFIrQOuV9WyAPMe3BlCB65iJID7P8xArR0V6C//btsG2jWDm16FGEM00DjTJm5G
X-Gm-Gg: Acq92OGkgbvrlz5Cjbim1Ch7jKiM7NE8lC5qaS0gDTZ2JmIcoP7iaPPwf8Sy98Y4Jyy
	dUsduZt6Q5HgOq9xmKWFHXRveWvIzhX0JCyJIqIr3qFIIxkfRBBF3hEahdZSly77qgF0becUDLU
	/yo+rQO+BruKpHX7upCK7tgkAzpGyUIhzniOFZipmqC7N78CmXq2ALgQJpRsF3TxfTwB9ME5RPg
	fMkw2FdpVZEDn5lMqIC0hIE0WWrXonDlZxOJ7zrKKTu6vLmDYGmrz6Po45bltp1MvWqIHKROqcZ
	BI2h5m3XzwAmGa76QyoUFFotnZWmJJ8G4sEx8Tk8xuVJd9ZM+ZgQ4B5SOSQFAu0yf7BbvZiXMht
	70jkm+bfAfmwuDAIpQp0l3x9Wc6vUOx79WNLBkt1S/YhlOFLHZLre
X-Received: by 2002:a17:903:1b10:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2beb058078cmr196462505ad.0.1779817967597;
        Tue, 26 May 2026 10:52:47 -0700 (PDT)
X-Received: by 2002:a17:903:1b10:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2beb058078cmr196462025ad.0.1779817967002;
        Tue, 26 May 2026 10:52:47 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.233.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58d9fe9sm127139065ad.65.2026.05.26.10.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 10:52:46 -0700 (PDT)
Message-ID: <e03d1626-0220-46a5-af0b-dc149beeed30@oss.qualcomm.com>
Date: Tue, 26 May 2026 23:22:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document SCM on Shikra
 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260501-shikra-scm-binding-v1-1-93d7faf1b784@oss.qualcomm.com>
 <60dc7a9e-3ee8-4419-a53f-dd6c746f9276@kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <60dc7a9e-3ee8-4419-a53f-dd6c746f9276@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZNjnX37b c=1 sm=1 tr=0 ts=6a15ddf0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xYyWL/Q2DZNEK6BS9gpG/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IVn5nGlCpDZ5uCHmXRgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE1NiBTYWx0ZWRfXxI3gPCwuV0Fz
 QPLBa/7Uf6MgxaOn+VLAkL3m12d7ZDcEO9YvObIxLcFt3uxl2fWBNs+JohwvytWXFWL4bQhljLI
 ohCBhyejCjku8h5G15kpALFLs1yLdHGl6yk6KCVh5z95vvPh9n3u3SPsAhIp5piEh9SV83LIO0J
 miS4VWsAz7g/RQc7sTjJv1k/ZzFvc+rkOPvpPzzoeQlJpTX32StBje5opYmndkNp2XSVRgG2kh3
 6+ooMRsiM1H6fGoxIsEsS75SDWZilcsI2121QhVaTYGESu4B/Zcg3yW4Qj87CE/yCQmpMuRrMma
 xorKvmo8TthGvoFQjnABtoZqdxK7Lv6Te9eAGlDxIcUQrdkMYTAW5pdFv5K7DAZLd2Pv6g1GVID
 pEVm/tQ+H7MsBtgihL7R6IErlLTTpWsyLeYzhdGH0860MrZY2qMQbWgduFGmQeZ8av9PoqaveKR
 q8TzZQA98tqQSLqrgXQ==
X-Proofpoint-ORIG-GUID: jZwTnEXoeulWZo7CMf6___hOvVXNvJAQ
X-Proofpoint-GUID: jZwTnEXoeulWZo7CMf6___hOvVXNvJAQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260156

On 5/14/2026 9:21 PM, Krzysztof Kozlowski wrote:
> On 01/05/2026 19:53, Komal Bajaj wrote:
>> Document the SCM compatible for the Shikra SoC.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Gentle ping — patches have Reviewed-by.

Thanks
Komal
