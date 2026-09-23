Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1194549C4A3
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162461; cv=none; b=ZsybMsRy4l1uIvmnLhxkOl4Kmdqd1XNqGeS3UJWAqqgqZTvM9IH5XAMAFSbkZroZjW+uaFTZFwDgz8L71YRkg/rOALOHL3K4T2VXojQ/jSlO2qzCJnXpgeqsBZpJmtyEnPpqqt2lrXYQs7J/Azi9qXRwLjSm/D1OpvPlnTTuuxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162461; c=relaxed/simple;
	bh=IJU9MKcwbvSAyF5y30NT+cRls4Pn1fA0J/YBjBXRzkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ronwDwRdR49WQcEjhYZGYif1sgG8PE0gs6A+doxT4N6PJwHcq9/zTjIJem/84pmNzgudnIKb9vvmjZG3BcmxQlqq+N8hlgs7mDRH42iQ2uI2YTBb89U8mVwUzidmz+aRVGwWcNwgV96W8oiJhnmkXMbkPGiUrtJyaEY1WZGxqPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KOFFg2/R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bn9qgeAb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KOFFg2/R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bn9qgeAb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2gho2429458
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1pvnghHOUtv+RWwHYZG0OQG1LJBa0evkZWaVyqIA/oE=; b=KOFFg2/R3VL8g5ty
	lg3w6xp8EqYfWowoyBUsufen0Mwwz7lRw/xhzkS7YNyPHgJXk4jNb0frG1c6PETc
	orq70fAvyPcGktcwcrt5/xJj8CLuaVSUdmH+svWtbOzeUddWAGuMEZO8EiDd7dN2
	RkI3Bz/AVD958iSgUgjI+sa0CkIx/qym2xNqJDB0NCPTXAza5gHXjuIX1G8LAkHk
	d+odsuReajFzUCRZikILMa8MOS6TP7HWmK+VZ/PgazflCG+QD4aab8rRv0sC4k5x
	VpO+RBaOl/zzrVWiy8D3rdTRKZfqggK3mE0RATrg/SHfR7U0OCaJIErETvSlhoA9
	lWH8Pg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqh8uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:20:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so1172159eec.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790162458; x=1790767258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1pvnghHOUtv+RWwHYZG0OQG1LJBa0evkZWaVyqIA/oE=;
        b=bn9qgeAbV517ifSOIgeCQVegdb23XnDJ8ZZrt4KAeoIHcsxz3wf/CaEWiR7mkHZNmC
         pzyAQENr3yOC94GNF90Eyl8tg5ro7P+aFpWzc8tBoxF2P0nANhIsr6QlTHJx22t7AZHE
         WC4ZtoX++tY9AC+c81SU/vXBUVmcwKpQKVWCEaqb+8EyrOQREP9ct+YikJUSXs0FlUu1
         qoMx+DVtN4YmKyAQnuDKgeZTnjiH/8BBKxAA56LWIiSgvlq3mADa6QNeUdXgk0UHp5wo
         dTJGoLnfHZsfsAGxlmVDApwNJulsBvNq0A+uC0JPjJLUeuu/+e9qjnfkn12yTQRR9jaA
         OeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162458; x=1790767258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pvnghHOUtv+RWwHYZG0OQG1LJBa0evkZWaVyqIA/oE=;
        b=YAB8CDW030N67rba48pw6aLPzc7bOa9JVMLtf8Zit+5U2vREjXRcYEn3iwk2M9Tz3t
         AlkBwF46pZM/sH2touXNHGTbkX3y706a4Qbe1Nk7AVM1n5YJRL4hYCYLPW0uWYDjb24x
         NEg4wcFdWuis7SpZA8wVupuX//xxcxsScfwHaDl0qwYSqoqjD8oMI4thL6qZEFVEKkfp
         9T+KUEFsYuBcAw0EIgk+lHNX0yrgLyTFEfAdXvSUel6HbTmoMmZAB54HpKVNmjTzdwI0
         eoP3Env3na1Sla6fgnPqUrfJo9h0g71mNFKbbnHIgt1fiHjrMWRq4LJLbRxHCio3c9P1
         VjkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMqSXn1QtyvrHfEZY80XlRLGWYNLclZ0btlJH+jDM7XCVrKLbcsry4WtZ0lwSUkWG2BpAV3JixnqvZ@vger.kernel.org
X-Gm-Message-State: AFuF++nXwXpOJnEklJ4JM23W97yaNl5bRgr6Xma9HfWYGJcd2tl29Vrv
	1tbAH4zDGxAuxVItWRCfVifq6CI12/amj2/FG9Y70qMxUS9TikRqrwm+ZLUkFFoQdwYimKe5Azj
	7pTNy9p6qNEYU/6FvHzWr9lsLBulH7n8qI9+Dnlc/sFpGqcKeCl0ARa/WDb6p/mbh
X-Gm-Gg: AYBFou1rtg4e30whmjFl0H8uWWUHvpKrn1TK65kqKx0uPQHotTTLRysl+cg41joTEZw
	9uSI4yCqpKX5f8fDTCo2F5IpIP+0S7Dghv3iFFMUl6+1yJbNayYIfa6gdK8Whmi869Rf9RMvS3z
	pV/OIwO7fsw3ktw1CjEVu6l4M+iuAdQ1TnnljnJtLNT+XUYzBnIvnZ5qa6s9oaY7m+kUabigu8Z
	qy71JHrTm2fZZnHKMfvpNYqTmJjSD7x/ddR9SL1G4hAucV+8wnbndiGW22oooqVU5C/mqn2pKQG
	uoIzbOYBxmWkoa+mEMj55BiW0X8YW7QLCC4cU2Z5EQAOtyRk7eo1Pgqq5jgPaJv20XlFcw+BLHe
	kveUKkY24A2FLq8RomG2gkWkkC8A=
X-Received: by 2002:a05:7301:162d:b0:33c:5ff:71e4 with SMTP id 5a478bee46e88-33e8c249fb9mr2158404eec.9.1790162458403;
        Wed, 23 Sep 2026 04:20:58 -0700 (PDT)
X-Received: by 2002:a05:7301:162d:b0:33c:5ff:71e4 with SMTP id 5a478bee46e88-33e8c249fb9mr2158378eec.9.1790162457791;
        Wed, 23 Sep 2026 04:20:57 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fe502sm5805691eec.2.2026.09.23.04.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:20:57 -0700 (PDT)
Message-ID: <2be528dd-487f-4093-a2eb-5916832a4123@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:50:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] ASoC: qcom: q6apm-dai: add SCM buffer assignment
 for mDSP platforms
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
 <20260922-vmid-v4-v5-4-e79cfd7af5b3@oss.qualcomm.com>
 <arJ0yBdeDfjYihRd@sirena.co.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <arJ0yBdeDfjYihRd@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QvcCHy_hSkGpj8S4m-HE0gy3XVSpmVOa
X-Proofpoint-ORIG-GUID: QvcCHy_hSkGpj8S4m-HE0gy3XVSpmVOa
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3b61b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Eu4FWuEEJWto4IdLvdkA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfX03UJ8jhtsLkv
 irnOmtwPsDiLTdM9Abm6NmQY0/SQ5pnCF5e9DzuYsqVhvL1vYrfkIl2spPMvLWuCZt0k4khZ3Hx
 kvSE4zYF2L5Fz7UZekwCaOuxTPUeDM0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfX0yiIrWQROt5J
 yBSO82t9zVnO4KDoMKQZ1WGXOdvKHMiCPbbTF1kLZAhGdc53bIMF/KRo98DVD//LpWDsENrSjR7
 mr8PNHlDYrXkYDkWKOI8hAF85zTSXz45SXu6+jWKHjfmOZjRM0hj3yioQtU6pK+cNXf9j788Lqq
 K3Ubnm0/IGdE+tc75CbRDvW50OjLTul6yensmPHW9UL7PmPvQLM18ZV5SEQlpINWHecuysVR2R7
 g/NhaRyAzuCxI/R0yR3SfDO7V7w0i2OVJfK5iLxOFAt0v7yowpTd/Lq9uxoO16ZlWCrncKUWyxW
 EJ6iLUY7GJUiKoorxBZY59GQGreGhHwLfKsFuzrO/sLuTG5BIVnkMPrVtOKMwawkUoU9JiRD9jO
 bI04LUCElkcSaq0kQd3eR+cf2u6+7dMH4TOSBdR4osFdhfptmjjytcwsRd136pQCK4J3U+NgWjm
 XbDTETxyEWs1C/93ttw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230045



On 9/22/2026 6:00 PM, Mark Brown wrote:
>> On platforms such as Qualcomm Shikra, audio is served by the modem DSP
>> (mDSP) which runs in a stage-2 protected context. Unlike ADSP targets
>> where SMMU-mapped system RAM is directly accessible, the mDSP cannot
>> reach the PCM buffers unless they are explicitly SCM-assigned to the
>> appropriate Virtual Machine IDs (VMIDs). Without this assignment, audio
>> does not function on these platforms.
>> +static int q6apm_dai_scm_assign(struct q6apm_dai_data *pdata,
>> +				phys_addr_t addr, size_t size)
>> +{
>> +	r = &pdata->scm_regions[pdata->num_scm_regions++];
> This needs a lock.
> 
>> @@ -1021,6 +1168,7 @@ static int q6apm_dai_probe(struct platform_device *pdev)
>>   {
>> +			if (per_stream <= POS_BUFFER_BYTES + PAGE_SIZE) {
>> +				dev_err(dev,
>> +					"reserved-memory pool too small: %llu bytes\n",
>> +					(u64)rmem->size);
> %pa

Thanks Mark, fixed both in v6.

I added a mutex to serialize scm_regions[] / num_scm_regions updates in
q6apm_dai_scm_assign() and q6apm_dai_scm_unassign(), and changed the 
reserved-memory size diagnostic to use %pa

Thanks
Ajay Kumar Nandam
