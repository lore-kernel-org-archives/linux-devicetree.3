Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908542;
	b=EZcyWwRz0sAD5CEg/A9E9Omq3OBiZNBUnG981YGxY0C9NHAJOnAwjfdhVrZEM9C5Q6aw
	 VRdjbS8F3ich6UhzDovVY9c8FeIIXOS0ZyoesBU7g3D6DOBi+oxNhjn5hqGses+eHnfEC
	 XUdUA0HHNXKpNPT1AHVk4C3+Dxo/V+s1yZKA2NHIm9J5pPA8Y4b4srgeGMEdoWm9ppRHs
	 rQY+VvZNzHM4UwPXHlhBBNMftJHiDlFPXdXuCiJVcr3y8+cz8ewVzuhem4wJGtszwcmX7
	 ZSmPKx1kU/Xxe4fj738Qg7TWTLFr27s5bICdchZqNdMjEBlobZo7FG4iVt6Q9V9dhMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FR0f5F7yPxxa4E3yXHiVVcQsrkarnwS9sLGa/aVW6YE=;
	b=DN74kYlnpykJIZ6yN6zp9x8OiwLdtIJIbi3RfE+EkE0AzfsxOE13n7y3eY2TzsJjQ3uv
	 Chz/Q/fW/dNYsOeFuwnAxirMKrOtfUWx80w7QQDtvKBbQciqGGvN9s9wemu2KbUD8nDYF
	 Nb36h60skLieyIdAjpE5EAOCcggsFaS2IjKDw9+C+R3feW9k1dj3IFv3o1Hm4ruZjTEpv
	 zGp2viMFWpxVBHQhYphv1SCPB1gDJeoZt9fZa0V8RfHKDVkfW9E7diMYGEzCwTAViHEy9
	 9rc+gCbFs5moCiTutIj3XgIW4MOnW7cvTJ2QvUzB2vgCzuA/ETLvAF3vSs04O0gjmwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fOlt6srD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c1XVcWe8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE29606A332
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAE29606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fOlt6srD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c1XVcWe8
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH55h4M3350164
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FR0f5F7yPxxa4E3yXHiVVcQsrkarnwS9sLGa/aVW6YE=; b=fOlt6srDR6s+9QNV
	raHd50uRti9e2P8itcOQ+YgNPDJz2rh4x2xz4XYA2gDiA1hDj83jTr6FUTO5VEZf
	zC0Xf12Vcx+etOXBOVGhqukUzp/ZxwrXzuYL10ip77mubOq2nUBLYMfYWmGJFvcm
	m/AQhCua9zSdriOfR0OVsjm4Yl17KO6Vzdmq2hJCpXPXs2wdjKIoaV8vlTLpiXa+
	DGsIXq4ogr807/F6WshzoZ51dFEWNnFQzWfNkQ6ugE6BBQwQGqWZW2YrJpKbqYAC
	Wi/PCT9s5dghS8xq7eRKo1TUVtJgkZjND5etQRQDc3FNzwHmYL2etL7FTLXFpVL8
	fP7vtA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr10x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:42:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso2236729a12.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 01:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794908540; x=1795513340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FR0f5F7yPxxa4E3yXHiVVcQsrkarnwS9sLGa/aVW6YE=;
        b=c1XVcWe8ts58GvviucNhJs5LqeOWAihVIIParR7/Y4Q+lc96mY6FE+aC+gChl8IGuM
         DYcYIqm3ZhSeMFLEyHLh48TU0Ey19+YpkBlCjP95/CAQD9e+h++xbXxnHOWmTqGsPaQp
         ZQ6GEqsP5gwqclpZGvG7uGsXRCX4nW9ZgQyOUSPPxogzZGevHJGQ+JQqwhrZO+CSQOI+
         CAwOZHn1lHVyj8qP5LUNzfNG4JhpJzqDdPNh/mGa4PPtzSXYX/bxsJZp4esYADeWX7D3
         vvCOmcz45jDUqj9zrsIwmcKHWS+Ompoyj6kuc85xexQHeIplmCQH/JnjpObPdzHfeYh+
         h1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908540; x=1795513340;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FR0f5F7yPxxa4E3yXHiVVcQsrkarnwS9sLGa/aVW6YE=;
        b=eDL0Cq5VZQ/NztSH+DGTaGgwjH5A5FjJheed1+lHLhT+wozf4ZC2AB8xb3VsoolfJo
         BgObD3q4ZQfgQnM/9b8Ve5TIt223lHkMTYVKYdBxGeT6PnKy/d2UTKH+fF+n87A9vPnP
         AIjK6n2NQ+sc5cvFC5z3fIkN9QWq+lfViBKFrjYaJ6bO9f2WgNcpL/rnOgUNIsk0ov6L
         /B3kwl1fxX5EoVhXrCAF4m+0WuKlTzkB9SNG7x/nIHjeca4HMhsUj63B72/aoRtma+d2
         fFsIci6S5hLGP6Di2pM2WPqICYaBv0nsxe9276Tw7Nzfi3L/+1bIO0eKBgxevXxZBA8G
         XN8w==
X-Forwarded-Encrypted: i=1; AL+hErF1L5RJ+BNXgMF30KM6OyiFCERNxzYv+I6Rswi3/Y9vUQDEhAqAoHOKi70YJBRR0dHgc5B6wnWVowwP@vger.kernel.org
X-Gm-Message-State: APuU4Z9o4y7BdyPQ7PAlEw+t0OT60ETEg/ogrkOrjBign3egCTa5fIga
	I8q7Dxivwug2ziISVcfQT8ggRyiNvxJbHMVF50jXQrCZGak63yMx5fxMYrvcr4DFyKRG1W660B6
	a5BU3i3Af0eKEYH0emGsIMjLHClfpysgbwuLCWpQXkiKVmSnhXqCCj8Zx0oF+24lEJuhzfkke
X-Gm-Gg: AZFdTZfKbZCDTPk7FWbotwZ+mRJBS1+Bvf2Yk1M0HMbRZiXPWQojela+CzsdxSqQq6y
	IaVJGU9MJXSahhqBxHAsDJf6iEk3jfR35MUFT/YN+pAszedBSD6Krcj5TWCFUw7u5MQnPRf2q4A
	LjKyUUB2mFMNsh3z4px8P44Z67XHgZwJw3ICJFVwbR1PuHaIX4UrtLESMrwDazCLKdZT+tI1HSV
	380YxEVTm0C2ZgNWKTEVHj4V4/RFJNlBUG+NcdTGMHbuRqXboye+FsyVgHC6MgVp2Oq7WLFy9VY
	B6tQu/yQFO8xKYYtfQ5S7wlHOsnxdHaMW7q7LwJ5/oiCotbhMlvKdTiKb0juuoRbONv27DUqQ/b
	HeVJ86RUnTRDxXMGXkg4Hd22OI88QB8LSZN7jryL2rXbUP/2LCZbW8BmuN9Z/CkOjhZaqddOkED
	KdXvlaJAUbhTVPVaqmd6fGmjBwu8JwPClOrWpAwYtba8fSholuKk6z4HUSYJk/
X-Received: by 2002:a17:90b:4c10:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3b1b07ff57fmr13204635a91.5.1794908539559;
        Tue, 17 Nov 2026 01:42:19 -0800 (PST)
X-Received: by 2002:a17:90b:4c10:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3b1b07ff57fmr13204605a91.5.1794908539106;
        Tue, 17 Nov 2026 01:42:19 -0800 (PST)
Received: from [10.79.117.97] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b245f0c3sm10640263a91.0.2026.11.17.01.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:42:18 -0800 (PST)
Message-ID: <2634a358-59a0-45e2-b2bd-2c404db3389c@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 15:12:13 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-4-715435f52dd7@oss.qualcomm.com>
 <20261116184727.oscwnaurivcxrg5b@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20261116184727.oscwnaurivcxrg5b@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afc217c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=P_9HZXhiIeUehgLQJ04A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 0RYiz6LBX5rdlJW5JR4FB2v7khNUpG2G
X-Proofpoint-ORIG-GUID: 0RYiz6LBX5rdlJW5JR4FB2v7khNUpG2G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfX9uJL/gUJGPSv
 skG2iyVkQrOkMsF6hPf8D0boN/MFojJSFHif/nkEZ8aVj5nGn8QciXTBZW39BE7EN4492t/0dfY
 nbbBsbTZqG2n0pGz8F8kaSWmxlqTZP/RVQ2FfIGZB+hcl2tYVkGxZgDtn2vlSV3VnQO87N6IiCu
 koLcCj0+uq8921yEE5JpX+3nkG+erLQcwyF7eOP8xYopM6XdemuqIS/BFSFd6tPUytgxpKU7hBt
 TKwa52348GvYi6VxySyviCOhP3Z7Jyeu/BocLW53uQeFzRozN6EhXXRlGQBQRUTVH8yEBwp2PLS
 or9f3c2ne9Rc/7XRdslRPyo3iSRX6tWcBkiGmBSzasxeFphRa69ZPP5t78EX+jeuOCwxwOn3MsY
 OjELH602+NuGcjP0e9PxFelzfNF3S0yeMDmCGqgvErRZ/r7y5/4tbLw6RQcHYmArSZ1p+7/6nN9
 bs+moV6J5uGFbrphPwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfX3NO5sGBk9rsd
 AkabdYKgqMpagaiMRHVVXcNNVxPC+KOeSwi756lRLMOYljE8mTKsKSqW8fAZaXWRyNmoZsBaWdL
 HEVLJMtvethTcaQwnGhfFmy/824UPak=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170038



On 11/17/2026 12:17 AM, Mukesh Ojha wrote:
> On Thu, Oct 15, 2026 at 11:25:52AM +0530, Anvesh Jain P wrote:
>> The OOBMSS consists of separate OOB-TEE and OOB-NS Zephyr subsystems,
>> each with its own firmware, DTB, and dedicated PAS ID. Add support for
>> the OOBMSS PAS loader on Glymur platforms.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 374cafd04b62..ecefc6a72fd2 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -2080,6 +2080,30 @@ static const struct qcom_pas_data glymur_soccp_resource = {
>>  	.needs_tzmem = true,
>>  };
>>  
>> +static const struct qcom_pas_data glymur_oobmss_resource = {
>> +	.crash_reason_smem = 669,
>> +	.firmware_name = "oobmss_tee.mbn",
>> +	.dtb_firmware_name = "oobmss_qc_dtb.mbn",
>> +	.secondary_firmware_name = "oobmss_ns.mbn",
>> +	.secondary_dtb_firmware_name = "oobmss_oem_dtb.mbn",
>> +	.pas_id = 0x42,
>> +	.dtb_pas_id = 0x43,
>> +	.secondary_pas_id = 0x44,
>> +	.secondary_dtb_pas_id = 0x45,
>> +	.proxy_pd_names = (char *[]){
>> +		"cx",
>> +		"mx",
>> +		NULL
>> +	},
>> +	.ssr_name = "oobmss",
>> +	.sysmon_name = "oobmss",
>> +	.ssctl_id = 0x21,
>> +	.auto_boot = true,
>> +	.early_boot = true,
>> +	.needs_tzmem = true,
>> +	.decrypt_shutdown = true,
>> +};
> 
> You can move this alphatically before glymur soccp .

Ack, I will reorder this alphabetically.

> 
> With that change
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 

-- 
Best Regards,
Anvesh

