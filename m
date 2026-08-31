Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5572361972
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 19:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788205272; cv=none; b=icZgf3j1AWiu8skVV/rnUQHcrwu5q7oc6QbI3jLbOYIqsEHMt1DgAUv2R79aYc8O4JRNgKaT1u6P0MFM2kGNz2UPf2iRXtuvRbcFz/f1DDpvqN9zeNFg1ge84v7xOPxdY/uFDVTigaqNZjCbY5B+WVnU1Yx3kfBFJDov5Fl+YrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788205272; c=relaxed/simple;
	bh=0o9MyypgBrEnlUxFc6x0hzOj8hpBUJe8OJr8Wwb2Vrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iGIuKFE0FVG+0agwsKbmx6PNGHHWFFt4uYUkum+1xCL/EgvZa8LjSsZ/jsEGl+wy9dpHcTHFrvDPt8ZSzT1p2vGVdSnpMENOKsc77UC3ORWFmTVdkgq23Z1yK8eM6GCk51rPSAbgllReaTMa1kCtqHHqIpA3Q7reVCCWWXoZOQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTCHifCk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KONIQfF9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTCHifCk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KONIQfF9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIXdba918233
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 19:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a/VOoKcp2TQjssQcleMKDkNpgoRKV2OUeoT4RilSG/8=; b=hTCHifCkykOx3BUv
	Dk8viKoBBKc75sKUj01VBObMyqFUU65gRpe2AvmwkdsicPmjbaaZslhLZt+owvyE
	rQttCHCtCr3ZoyHco0lybdDMV4Zg8tnWvA20Bj1a2NKqhEP9SffFwXPUYgl02A/d
	wzzz6eUpHDkHknCT2f39KPK/EduolDGiqx4PCpr62fRwrB2OWs0GDSIAFC1MDvWy
	nGbcTIYGMiHlBMxizFcBZFsNSwaY8PaNVpaWVJm5UwdsSFq8H/5FyyIYHptVYCzK
	dRHOo7NlQF2CA0QJaHoY2WzEO2RmEmBYg7IMnZj/8WrWqOVjKtz4QJFZ36a1Kutw
	/zljwg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdeg38fj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 19:41:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1d85c012dso6433899a12.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788205269; x=1788810069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/VOoKcp2TQjssQcleMKDkNpgoRKV2OUeoT4RilSG/8=;
        b=KONIQfF9nhZre9w0N7C+TMOPVR1BbCsJpMb4fo8wl7GXwHP2xXQCuzdJx53i6/mJws
         Ie7YGTWW4XKuP1ICefb+HTODNRRJftgxmBB8BXd0y8o0HNy57UqaqfXgeUhmIfdrwaot
         LP0WbOSw5DAZ7ntvlDpN6ZwWT35ShRVlFoflOO53z8uk9cQVzzxlblLwj3KYKQ+4D/Hj
         KCWzCLkaj2bPs35sQ2Tf2TBdMUFAd989EHlAHLDK4SoXsXX5gF3m6LB/J+/VisAhGzwI
         K3R4/1dN+UZ78GwG7mUc2Pi1tjtoTIiV97x+iczoZTa0AofAl7hGz0LAsxxCaOA629LJ
         JQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788205269; x=1788810069;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/VOoKcp2TQjssQcleMKDkNpgoRKV2OUeoT4RilSG/8=;
        b=na2q9EfwQfB49xYr2kZSx162Sv9MYNNG6gY3WVTeGkL+/z6c4zc/Cp2QMueVj7TgqC
         KEWZ5AzC3ihiiuNbHsNjHS0+b85TS3ASb5au9two4VZn+7pigKIXPf8K6JUemmLhjXCl
         gII65zbcSptRaikle8eRTL2tOdRCX2KsYo3u5K/2Xlvr4Z/QVNSj99F5A+ApNYmc7C6X
         uK9xzWMOk2+ZIhZ3vOwl+oCBfi/dShK4N42woNFEcaUdtYJFD6PyGPIJN6HyC3lNToya
         ukrbtSWn0zJTXx7oxwU+EZWWOP8sDNF5MO04VDTl5HxPgvjDlwA6VffOF9EM9ss/ylkn
         +WEA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0yxm2ZV7Akd2qBpjhFbASqIiSe3empLkV+HtYsRN/JMnARtaJL5+8zo8XPkE/apkIgf/2AtnQGWac@vger.kernel.org
X-Gm-Message-State: AFuF++lxlJ0Bv7L/UFHh8bikGc9sZnBW26Dc3Xd6wXZzzkGcJnkJ/gro
	rX5RGSvTYuoCgCiOSuYgnH1XHFfohqUZqb61UCJAuZIbWb0ekbMl4AZgip3WtRE7gaKOmQVCptK
	q7V3Cf4/OCwHBFCjU3Gq+NYuldE6RK2LjkYkFB5mHzvbDrhE2oSUCCbNCt8sgrQ8z
X-Gm-Gg: AR+sD13dF+87j2J7nCLViR/lIfk+pGWciG5PDzYg2htHZQo8Ic+Rz6m77ZcT8g4I4eo
	4NGQ7tsfQL3PNUO1XwFy+JDRIRwwnp5uJIAHg8vsICnyZcyXf8R76t0zLC6zm+BpR8zg98OpxHG
	9uPU2CKBPbtphrsnc1L0mt5KjlBjDP2ttLZoFcovgb/KLQ6Dxdy80DJfUdasYzb4KDGw6iB+Zin
	ojNUmZqbOuy1hEfgaBGW+QM38rFgUeJPO4ThFSLyffxDvQnIhIdugyqxZM/bCIew7JNr2oAc3mr
	QS+aidC1hNT0LxgYJuZTSjT+skN1ZjqmBGxai4iMcjoTAvQXKGQpYudMJnS3Bmrwb65bbuWnD+u
	3P3p4yEZ5b8bEYbiSTs36HPJW7iiCS/ede44W+JMk2P+NNJVuImvtjBg=
X-Received: by 2002:a05:6a21:6b05:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3d7b054a699mr5311308637.21.1788205269014;
        Mon, 31 Aug 2026 12:41:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b05:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3d7b054a699mr5311251637.21.1788205268534;
        Mon, 31 Aug 2026 12:41:08 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f552473sm35477313eec.0.2026.08.31.12.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 12:41:07 -0700 (PDT)
Message-ID: <dacc398e-04e0-4b30-a770-9308ad4e80bf@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:41:06 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from
 device tree
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Andrew LaMarche <andrewjlamarche@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
 <8024a15f-bbab-47ba-bd18-f85eb1fe3dcd@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8024a15f-bbab-47ba-bd18-f85eb1fe3dcd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE2OSBTYWx0ZWRfX1Bkh5ge1r4En
 TFj1WrTZh8caaT5bEOL8ga2HEpFMBfTbNyikaUtb3DD3opvsLyqQzdTU8ClktlK+yP+wrk2ZhWY
 3Pz6EGnZCtq07JbS6nfLisjk34mGHtX9h1UQ8/wx4jueBfUaDau4n4372KG7DjvHUAdeKG9kCrx
 mHRazoC5B2vFo6bcYJc3f2Ux5kgu7beEVAup8OnbFJ8h9fgvWHQEG8MHyfZm6FWUlS212gWUgBD
 crhzcTDDU6ri5e81bf+xMs6FGeYDcqoburrWdn6nPTCW0A4ejEqENNwnEa69jBod1Z+aWhssHBs
 9kl/T4ef/9XSENvyLlRywV5XVGi5pCziFmKCo5zDuwNVLKya7iqldIM3wE6cIpUdkYdY9hOL7g0
 ov7qenWnjC1e296T1DPyIKjyBcmrfNETu6itLaYjsSO8Ph2me7F+aJo/7KPt18p2LRCsznySNq+
 Cg8QNfDaZpvDbe5xZpQ==
X-Proofpoint-GUID: TRVty6dV94RZrS5Xi_sTSBAB82iFEcf9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE2OSBTYWx0ZWRfX+0A2OsK2jGly
 3ZPy8pcSZjwZL7ZeRzNkyWDD7AxseF878ts39gR5to62bjpb7q6eeELdSzKcvs3hJm846js3G6M
 ZLZHcOzGXQMO+8PANfH4sbdqXUDaRJo=
X-Authority-Analysis: v=2.4 cv=NZnWEWD4 c=1 sm=1 tr=0 ts=6a95d8d5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=hMWfrMBfY0pDR5NQx0oA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: TRVty6dV94RZrS5Xi_sTSBAB82iFEcf9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310169

On 7/2/2026 2:32 AM, Baochen Qiang wrote:
> On 6/30/2026 9:30 PM, Andrew LaMarche wrote:
>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>> index fd762b5d7bb5..3cf39ae06fd3 100644
>> --- a/drivers/net/wireless/ath/ath12k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
>> @@ -2945,6 +2945,10 @@ int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
>>  	if (r)
>>  		ath12k_dbg(ab, ATH12K_DBG_QMI, "SMBIOS bdf variant name not set.\n");
>>  
>> +	r = ath12k_core_check_dt(ab);
> 
> I understand there are already some variant exacting helper (ACPI, SMBIOS) being called
> here, but they really should not. After all, how could a qmi message relates to ACPI or
> SMBIOS?
> 
> I'd like firstly move the existing helpers out and then add the new DT helper.

This code is exactly following the pattern from ath11k. So I'd like to have
this land, and then we can think about how we can clean this up, especially
since folks are waiting for this.

> 
>> +	if (r)> +		ath12k_dbg(ab, ATH12K_DBG_QMI, "DT bdf variant name not set.\n");
>> +
>>  	r = ath12k_acpi_start(ab);
>>  	if (r)
>>  		/* ACPI is optional so continue in case of an error */
> 

/jeff
