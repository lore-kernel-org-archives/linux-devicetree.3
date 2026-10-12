Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A79C47207B
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797415; cv=none; b=A1ZWDzWu1R8DZvv6WonYjrjR6LBftlYblDX681UzO7KLNrlxtelO0MfHOLWq9IxahVj8toSAws2vQ8hY5p9YbRtXkKdmVH4GMheDbZwc6HZOnWqzfPerUqpcSd+bhMt/T1kj9Taa9nVNOo4ftYcSqLUFfkZUyjkOMjirVZK8gKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797415; c=relaxed/simple;
	bh=nSEDDkMvf0CoQFcM6UdUDxw2hKwIxxKtenAQDFeWcfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3HFuuHBFh3C+ikjDK1c18qAMqzUXmIrUGcqQO+hD69uAu+tvfAvcV1NKhrUYsvbAKy+17kqEghuthYCS8DwSYd5TDgb/ZZazdKVZ5kLzk/X1hodxHNwLvwHKpL55tpFU827zYoY55qu9+tYgevm222tdyGmLY/er4qSbBMRAq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrLvWbo7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G46lUg8B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrLvWbo7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G46lUg8B"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8Kmce2181481
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ct9Vpo8ZetqKaTi6+3Fm1GsfolL1MvhsjrlhMMlUG7I=; b=KrLvWbo7X5W+Zize
	9wroe5MhzcgpwBGp9+O5CvvuWGnfSXpCBggd/q1zX/j5QxvXUHKXwVUC9ncuedvy
	Z6r4xoxGBwKJfk0hINtl9JZg+J+3J1GgRMaDr4XuI4lM7wxWHUkL3/xXdU0wJ3ll
	Sq7FeUS8TuSBGsQ6IWITrDRwJN5LN1JNZZdNPFxSUEE7Q1SgD0OeocfuA/SSVptC
	4+MMF9sYcdILxyj0zvg9QfpwgBBZaFtwbP7RyTmcBOtm6Fec/Iw+U3lfgMZmiznV
	q4mQ9CIcIDGvmvX6AJNlll/yGah7vGWlO7MgfSByeBSSCUJEbN7hb2cEaOCKxL1W
	KqbqXQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1s1q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:30:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e897d06ac2so9929805ad.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 02:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791797411; x=1792402211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ct9Vpo8ZetqKaTi6+3Fm1GsfolL1MvhsjrlhMMlUG7I=;
        b=G46lUg8B0OsMif/TW50LnbCu/r61VINHGrUloElXcrxTNtNKdoNovurlwPRb5L+TFt
         VG95Bi5DRJ5NR6AuGoimoVBLs8RFKwEArIqWF7pw4JfNYAIz/nRyeFl8k93iSzekErFM
         WZ//AfEl6CZ+L3CyVXFwHZ9lVKEsZlzC8E55NbNhYS3nibehb7IwURh602DAaWm+YWvZ
         KqntSPLLC0pYE4kRCbCo/4uCZeKotG9yv67VREJX38WkVisZOw+dO1Hk+vWmn7J0jXDx
         TIqOFd1AHA3QF9vvbhhYkLTO+S/oibbUbHugXM612aOVtEyOjcdAd9J1DS/ROSwZMYaf
         CMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797411; x=1792402211;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ct9Vpo8ZetqKaTi6+3Fm1GsfolL1MvhsjrlhMMlUG7I=;
        b=tMG5k90ilk0bTxePtc2sCXZGf6136WLSKeW5K2iu4G7IGnVWku2F8uubc3/AmbGevE
         J+bzZZ/2FDhbxO0rVnv8/gwZS8qnhbklRnExEd7q47cCCrOGVKWFq/aBQCKFXXGMZKHV
         /tiP4WeNOdwdTnogcu4Q+QhEeeRrqIVsBoR7XQPq+DbOwGRXjPkgLS+u4sNAYamuqRTE
         VCxFznjvV45r3pE+tITZFej5sGj0S5t+DEaJqAS7d8OSxzt7MvSHchC5xqDgoUKppQGh
         WX+RoQKevyDufFWLqgOash0MGbI52MJ8n8usjnhWBJT8l3PT67c7r35pPT1IjjCAfjuz
         5BFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtyQrRj4Coey6TMJKAa1AFz65ECZZQ65S5hIY8s750nrOPwpuTOb/sroCBFQtZpPJFMlnWubiW+dwh@vger.kernel.org
X-Gm-Message-State: AFq9FYIWep3sRbZjvkHgS/oZ3/zQoHSYzQJllaB/YoygQt0jGZWXKXYk
	IMLcxRgrwGzs1CZs8WRli9dy17CcClx65lIT9TVY2ohRptWxDblHUzp41XIVaZUSfC90lToSn2l
	ohRDcXT10FuCZ58+5gDiiLohAxmIDjRle7A9SEVEoCzfeVhn3I4W1arVOLY6u1OHr
X-Gm-Gg: AYBFou0O0y3hpx1kACJAnQBZYkRxhUAopeHBujnNang6RU6bbruzcZF5XINO5GA+SrD
	PqnMOnVgcsY5U9EYZ0UMyggh9tP5PTUYF4HAyPEz1tEQXrpgOmb30oVPZEtXRVVUxdl84EFphRZ
	rFWNg4b8LfSfX7+/cD3YvcWkAY8mGcHEXdlJ7FnRGW062KD1XzpSwFEkPM2YOkWUVFyvzdoBREM
	Bm/8qKybTeZ4k+jY9e2x95A1Gm5QFJZ33fNd27KPw1xDa6fEna59GEhHqee9m0zyERoPL/qrBqQ
	W78y5zqIuD9LWs1cCFXsdvv4214b71nZB8VJolOIB+eSXKuGJaHYZ3Y4DPCgJ48FfcxlXk5MYw1
	vFNuTi3Xk6bRU6SuF5t4ETHGKI7ODDN5aNA==
X-Received: by 2002:a17:903:240c:b0:2e8:1ec2:a8c4 with SMTP id d9443c01a7336-2e8428a2092mr67121845ad.14.1791797411293;
        Mon, 12 Oct 2026 02:30:11 -0700 (PDT)
X-Received: by 2002:a17:903:240c:b0:2e8:1ec2:a8c4 with SMTP id d9443c01a7336-2e8428a2092mr67121645ad.14.1791797410751;
        Mon, 12 Oct 2026 02:30:10 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8c6esm39087925ad.61.2026.10.12.02.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:30:10 -0700 (PDT)
Message-ID: <954f820f-63f1-4148-a22e-bd85961c88fe@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:00:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 16/17] wifi: ath12k: Resolve userPD ID per device
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
 <20261008-mpp_bringup-v1-16-2c5797b5e4ac@oss.qualcomm.com>
 <sashiko-outbox-164038@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-164038@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KCmHYEM9JYSpWBXRhntgoGK_QpC6spbr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNyBTYWx0ZWRfX5t3mnzxzHB6M
 L5Fyz53hnvBw/bjB70E+bkh+66RouHSMSEKBNyJZ9HgR39vTbos4EhAnRS7eXiDJHAU/w8Il75Z
 6uhaonHhp/fpfsY3O86ZkRr2lnriKo0=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acca8a4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QAkOWx1MTCGqTjxtplQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: KCmHYEM9JYSpWBXRhntgoGK_QpC6spbr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNyBTYWx0ZWRfX5MpLJSaiqV3c
 qahfJXZ/ffi2vcCQH8nfCBcQuqOxfLUp+9elNU3HUBZSaOgzrJAkaU9seIGqFJ3mjHewwcj5WVN
 2S5Lu1HzqHZpGoCnudEj9qu3J9oK7L1M224jwFxeI6c33Guut4RtxxRXgck0tl0jt/J6ynaHMQp
 CvXZZNtFJgUD2UIMCVA3FyI+BpI+U7q3Tb+J04ZmhY7SYegOEbakoO6qZTym82XThmyAWSZXjYV
 EhyGTUzfItvMo+K4RYsdgsC0vL8oDsYM3NJqkeHna2XwK/Gl+dvoqO1ImKRjYvzVgxwthvPqaLG
 5ei3Bkei/6NKz7uOIx4SGYOjClq50dza9enoRFDuZlS8DU6Lro+dCpLxkFvs2lkKnvVOCbeAgaR
 w1ysWimLO7qgHZhlAohaN6SgzBibq1zabz4bjM3xJoVXSrQ6RHECghm82tyPSuT/Mil2CWXjYT1
 2iPZ5wAb6zPmLHEx3Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120037



On 10/8/2026 4:13 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] style: inefficient NULL check inside resource loop
> --
> 
> commit 1ba3501c64845782d9fd054ea266b2485861b530
> Author: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> 
> wifi: ath12k: Resolve userPD ID per device
> 
> This commit resolves the userPD ID based on the device address rather than
> hardcoding it during AHB probe, which is necessary for multi-PD platforms.
> It also sets multi-PD support based on the AHB device descriptor.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
>> index bff48b2fe124d..86359ed1eeb2b 100644
>> --- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
>> +++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
> 
> [ ... ]
> 
>> @@ -43,6 +47,26 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
>>  
>>  MODULE_DEVICE_TABLE(of, ath12k_wifi7_ahb_of_match);
>>  
>> +static u32 ath12k_wifi7_ahb_get_userpd_id(struct ath12k_base *ab)
>> +{
>> +	const struct ath12k_ahb_userpd_map *map;
>> +	struct resource *res;
>> +	size_t i;
>> +
>> +	res = platform_get_resource(ab->pdev, IORESOURCE_MEM, 0);
>> +
>> +	for (i = 0; i < ARRAY_SIZE(ath12k_wifi7_ahb_userpd_map); i++) {
>> +		map = &ath12k_wifi7_ahb_userpd_map[i];
>> +
>> +		if (res) {
> 
> [Severity: Low]
> This isn't a bug, but could the NULL check for res be moved outside the loop?
> 
> Since res is retrieved before the loop and does not change during the iteration
> in ath12k_wifi7_ahb_get_userpd_id(), checking it on every pass is redundant.
> Returning early if res is NULL might make this slightly cleaner.
> 

Thanks for the suggestion. I'll move the NULL check outside the loop and return
early if the resource is unavailable.

>> +			if (map->io_start == res->start)
>> +				return map->upd_id;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
> 

