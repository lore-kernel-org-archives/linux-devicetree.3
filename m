Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052793;
	b=byWZZ8uo2sbQVB6WHwrvplbPRCJNCz1mSCWb2vYGWdd9i8U1EB1hPetCGB0cm49no7VZ
	 Lx0y6WoEmzIJDaox6HFvVSgch1XobKpzqnbCfmnzeKYVKFpo9alddYfQH4O46MhKSnJOD
	 eX5am6TCJ+sgxvola/2J0A/UPxzJSBwOQwAZLwAsq0sqsZv8/9BV/AxMoCdy79TazrHvE
	 7C3M+CBfLdMC/3f0buHUhhbj66JzjERkYMKwNfbj9/LUNTdnNVOyCw13LaHVaUB65yv1n
	 0bWRQq1AuzruSp5Nd5ahvOYI0I2/iLa6YOBaUIzl5EPkA70IE7yaQTyZCA5kPG9Ib1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052793;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7XvTGUwPVodqg3oYiFhJa0NDKJXoq7wCuqsi0qvn+yg=;
	b=ZNfwfwTf9VYCGZe9ysn6AcvhfH+PH2FzmEDDyrBm56e20EXutWo/rZIpbuGAbfPnTD19
	 EhwFNUsLQG+Hd1rxLHcn/NjEcyBD3gMbo9sWCne7X+THwnnCb/SD6AgJCh+wHh9J60vcH
	 6nrCBMC3PHCVJqwJ5qXESXhTs6AC3svhxyc6uwhZIRgHUI/XUEUrbvmNYkmWnLO+c4k1i
	 AMMqF1FOVmHsqrxQo3B9gkZGLOhThRxBXZRlDssPaDzMlv6fexmsJu9qiJGdaHyjKpSb0
	 ct6reIu7tw8Geai53PMvdBNTqq8MZze6m0eB7Qj41tDBnryrWhlVIF6419NbA1kr6wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAQptyjb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ddUpaFMx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E12606A331
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43E12606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAQptyjb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ddUpaFMx
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1B1jL812615
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7XvTGUwPVodqg3oYiFhJa0NDKJXoq7wCuqsi0qvn+yg=; b=DAQptyjbXlcZ2Lua
	5EhbMDcjLkCA2fsm6XAujVwBoxvyQAs80IcQto7rIcEGb0/j1nxH0mTepFJjt0so
	B3Xs0cp4IutTY583ALBRDu3lTFmBKdm0mPY10TUYIdp7CscdCz8ERQyJxXLQyMAI
	OBEOfaqMyUDDKM7Z6jYe+ARElgkP2iSQVz8yt1mQh9iOV5zSKnr6Z1z0Syiivqgv
	xmghJLlMBh+81GU8iUIwYCFXgNHwNU6d7pf6wx+fDF5i295EAvekXiNGiii/dFjl
	iAQWeab550uevTcnq+M4mzatITJf+Wtv8A75lPPNHgignUj3qiGB+oLqoc31yWW5
	7SmQXg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fgg28rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:46:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3fc6a0083so237390a91.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795052791; x=1795657591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XvTGUwPVodqg3oYiFhJa0NDKJXoq7wCuqsi0qvn+yg=;
        b=ddUpaFMx7sxYdpYERbGPCBxqKNfRsHZK6ZPpk5odqryTpZP3zIjhXRPi5cAbEiifwn
         jt+ICClzxX+MWPPuyyuZ1+ke2PhodDAOMQuM0GR72RiuNpUZOOlpvqM7SDB54aSX2jlU
         eb0HMHclYgfi9TCMGqq4c9n1BL8Q/XWxz3+ryZPVHjjYH4V+gBfZg1ejdRYLu54oOTVB
         YBKijz65R9BZh+fPHxPzZhAhdU4tH/5Nue1LtkFxRVmm8GPM7dSjJsffhBcWAROsYMU/
         5ShV+kNgZ7lf5Y27ashNOIeTq9Q9z7s3Utbq31y8nj4xpjn+qp8zvNc0A9ApSlK6Jdc7
         cDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052791; x=1795657591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XvTGUwPVodqg3oYiFhJa0NDKJXoq7wCuqsi0qvn+yg=;
        b=BpuZbd1ZHAWooGqPEDsvM/1iGhFz5MWkOmdp/ds7AVsj3FLmGU3ng83JXlIJ1EnQFe
         ZMjLSVCoAjlkWEKSIiMPRyPxEdrRaUdbdzrRuIfFhK2MnY5wQMmRKoYwppvAHljyuVvZ
         w5BzLmXvkc5fcPGUYQRy0GKj9xr1x0pwmTGOHPhfKRXX8ka9o7fFz6oVRshjEgpNiWbK
         yMWYM/qGzhYW5NzS+spervLhDv/GEmhbo/0GC8RN7Hoka5TZXuoEWFSaOummtIk6Izxm
         O6efSzgJmOEixnwEdzBGaJjtaBEnX+4ld/T1CkVc6UUVfP17cYsVGzMRMSRJxcZfa+f/
         olpg==
X-Forwarded-Encrypted: i=1; AL+hErF489lXdQw609ME11t9or43D4ELVIzhYCeuF4Mg4u6j6GDaib52nvBL4F4oX0sGWgb0NeNBeo6FdewQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8Yh1ozZgmAotlibS1pJ8KtBojMI7eAPG6saSqW2FdQoQV3gyR2
	lESAmaeambQEfu76tS4ivedztH4MTsubWGlZ4WzhvPlbfX05Cc66wLiz/4hfyWp30MF8AYkw/rX
	6Dhed0wRoRi1U8XxDb6y8okI8BqXDTiQRLV+gwpAAUYEgpT9L9A5OU+980wI4b8PB4o0XebMGrB
	E=
X-Gm-Gg: AZFdTZcQnmgIzxazNN4pQoB7ATJyLFrMj+OSV4iDw6R9icRbetd8BeWoXwLeAH0SsAr
	tfvYCTNb97Y8iixdg/ARVLAh3Y+hTtfnlnqVu80tKz0oH8Xw7dsaBrYfPXz4gxdgSaq0p9XnYZ6
	DSDTfpELrydOgBG0BkNndL2SmSYwR8q2XM2cfWaQI55mkKSAnRwahHysvOrT4Ob1QB9RqGsh1ax
	VTNH0YIteZvdxJ3ixGFxDIryQ2eSK3GiWBC49dOKefNOFnFh8xurHoZrNJAr1OMhLPzzwcIlP5Z
	pJqGX2sXpx881+EXhL9H22L14ROsXQh7PG6l+2rQaNn3SwRRBKKRsQ8Klnoj4HkzTo71xaaiHaW
	Fl146+cFIeKlHhNtcBrGQVat4OWQoO7aybciO36xglyHe8Fczncypm14QHihi0Qo8eXQxxnaTYW
	EFuwGx2w7lajg/Zq2zSZpgZljscAwmw78pxaeCSA==
X-Received: by 2002:a17:90b:3c05:b0:3ac:a11a:7c7f with SMTP id 98e67ed59e1d1-3b3d07b8f81mr4086182a91.23.1795052790892;
        Wed, 18 Nov 2026 17:46:30 -0800 (PST)
X-Received: by 2002:a17:90b:3c05:b0:3ac:a11a:7c7f with SMTP id 98e67ed59e1d1-3b3d07b8f81mr4086159a91.23.1795052790366;
        Wed, 18 Nov 2026 17:46:30 -0800 (PST)
Received: from [10.133.33.89] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe08cf1bsm745570a91.5.2026.11.18.17.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:46:29 -0800 (PST)
Message-ID: <ad300534-54a0-49f1-bda9-3d781e3d730d@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 09:46:22 +0800
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
Subject: Re: [PATCH v23 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
 <20261118-enable-byte-cntr-for-ctcu-v23-2-67fd9db6bc0e@oss.qualcomm.com>
 <3348a751-87df-4f22-80e0-8467c6b263f9@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <3348a751-87df-4f22-80e0-8467c6b263f9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bfu5946K0DNBE0Fe1q2ocX8ERotThMh9
X-Proofpoint-ORIG-GUID: bfu5946K0DNBE0Fe1q2ocX8ERotThMh9
X-Authority-Analysis: v=2.4 cv=fOSsTpae c=1 sm=1 tr=0 ts=6afe54f8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=rvWznffgM_U_UKBysmgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAwNiBTYWx0ZWRfX5CFTKMde7eUY
 hKzKtJCnZ4r/KxMzGtsiOwAL5WwMQ2cebxLqPOa02FwAvGrI/RjhHTE/YokCRIrhy7aZqmKPOaX
 t/0Q4c+kWwKU6ByGg9xd4DxrNCGfpEg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAwNiBTYWx0ZWRfX1QJiYpNFKVHd
 sqxtAcTZUR56E68mazw5KvJTVzSzwTLhXzZOxUWagZRnab2+ZfGgieYGRqpeGh3W5A8Bfx30cdt
 I0dfNQj/N2vQyiqzC+yVnpertRPL/OJH8pQET087CuWIeigE2QtEeM7UEYCZPp3VGw5J2oGFq+C
 bUFMjRupJcTswpUHZXBpPC7+7JRyR9e4ib29OoDhe5vfAVgzSNGJkylw02305MU/RpMFxm1LT2G
 MxPhQtSQK/d5woy7NY7mcsIJ6th5NW7mxIhhQ3RXSuXEMcyQ538/yn23i2RvAej+hB/e91+iwKV
 Swc9Qwro6xn1IMbjZCy1e8VjVO2PxG+PgAAKYxZrGmKkiCrGRXUZTbI9CtEKpJn2vpBMkkeSjEq
 IbKmzyZtRrN8vPiDbfZrq9lURcj/DIvAeFks0WfQE1STi7/8y0DLmYl8NxKx1X+MuSfMo6GDUXT
 YmsL/PnszCgwDDOvPkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190006



On 11/18/2026 7:16 PM, Suzuki K Poulose wrote:
> On 18/11/2026 08:02, Jie Gan wrote:
>> Introduce functions for creating and inserting or removing the
>> etr_buf_node to/from the etr_buf_list.
>>
>> The byte-cntr functionality requires two etr_buf to receive trace data.
>> The active etr_buf collects the trace data from source device, while the
>> byte-cntr reading function accesses the deactivated etr_buf after is
>> has been filled and synced, transferring data to the userspace.

[...]

>> +     * We expect that sysfs_buf in drvdata has already been allocated.
>> +     * Wrap the live sysfs_buf into the first node so the captured trace
>> +     * data is preserved. Take the sysfs_buf and add the node under the
>> +     * lock, so that the ETR sink enable path sees a non-empty list and
>> +     * doesn't replace the buffer.
>> +     */
>> +    new_node = kzalloc_obj(*new_node, GFP_KERNEL);
>> +    if (!new_node)
>> +        return -ENOMEM;
> 
> Since we know we need num_node entries at max, could we not allocate 
> them in oneshot (kcalloc()) and free the unused ones at the end ?

I hadn't considered it from this way before. It's a good solution for 
allocating the required buffers while simplifying the code and making 
the locking easier to handle correctly.

> 
>> +
>> +    raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> +    /* The sysfs_buf is in use by a sysfs read session */
>> +    if (drvdata->reading) {
> 
>> +        raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +        kfree(new_node);
>> +        return -EBUSY;
> 
> This pattern is repeating quite a lot, do you think this can be a single
> exit from the function for such cases, something like goto err_unlock;
> 

That would be better.

>> +    }
>> +
>> +    /*
>> +     * The sink enable path reuses or frees the sysfs_buf of a sink 
>> which
>> +     * isn't enabled, so only wrap it while the sink is enabled in 
>> sysfs mode.
>> +     */
>> +    if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS) {
>> +        raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +        kfree(new_node);
>> +        return -EINVAL;
> 
> 2
> 
>> +    }
>> +
>> +    if (drvdata->sysfs_buf) {
>> +        /* The mode may have been changed since the sink was enabled */
>> +        if (drvdata->sysfs_buf->mode == ETR_MODE_RESRV) {
>> +            raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +            kfree(new_node);
>> +            return -EINVAL;
> 
> 3
> 
>> +        }
>> +
>> +        live_buf = drvdata->sysfs_buf;
>> +        /* Keep the buffers of the list in the size of the live one */
>> +        size = live_buf->size;
>> +        new_node->sysfs_buf = live_buf;
>> +        new_node->is_free = false;
>> +        list_add(&new_node->link, &drvdata->etr_buf_list);
>> +        new_node = NULL;
>> +        i++;
>> +    }
>> +    raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +    /* Free the node if there is no live sysfs_buf to wrap */
>> +    kfree(new_node);
>> +
>> +    while (i < num_nodes) {
>> +        new_node = kzalloc_obj(*new_node, GFP_KERNEL);
>> +        if (!new_node) {
>> +            ret = -ENOMEM;
>> +            break;
>> +        }
>> +
>> +        /* Allocate the buffer with the lock released */
>> +        sysfs_buf = tmc_alloc_etr_buf(drvdata, size, 0, 
>> cpu_to_node(0), NULL);
>> +        if (IS_ERR(sysfs_buf)) {
>> +            kfree(new_node);
>> +            ret = PTR_ERR(sysfs_buf);
>> +            break;
>> +        }
>> +
>> +        /* The buffer mode may have been changed to the reserved mode */
>> +        if (sysfs_buf->mode == ETR_MODE_RESRV) {
>> +            tmc_etr_free_sysfs_buf(sysfs_buf);
>> +            kfree(new_node);
>> +            ret = -EINVAL;
>> +            break;
>> +        }
>> +
>> +        new_node->sysfs_buf = sysfs_buf;
>> +        /*
>> +         * The drvdata->sysfs_buf write and the list update need the
>> +         * spinlock, to serialise against the ETR sink enable/disable
>> +         * paths.
>> +         */
>> +        raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> +        /* We don't have an available sysfs_buf in drvdata, set one 
>> up */
>> +        if (!drvdata->sysfs_buf) {
>> +            drvdata->sysfs_buf = sysfs_buf;
>> +            new_node->is_free = false;
> 
> Is this supposed to be done in enable ?

Yes, picking the node during enable and marking it as free makes the 
logic much easier to understand.

> 
>> +        } else {
>> +            new_node->is_free = true;
>> +        }
>> +        list_add_tail(&new_node->link, &drvdata->etr_buf_list);
>> +        raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> 
> Instead of adding every node as we go, could we maintain a local list 
> and add that to the the etr_buf_list at the end of all the allocations
> and when we are sure that things are still sane to do ?
> Set all new_node->free = true and when we get to add the local list
> set the sys_buf with the first entry and mark it false.
> 

I will try this solution.

>> +        i++;
>> +    }
>> +
>> +    /*
>> +     * Clean the list if there is an error, but keep the live 
>> sysfs_buf even
>> +     * if the sink was disabled meanwhile, as it holds the captured 
>> trace data.
>> +     */
>> +    if (ret)
>> +        __tmc_clean_etr_buf_list(drvdata, live_buf);
>> +
>> +    return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
>> +
>>   int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>>   {
>>       int ret = 0;
>> @@ -1928,7 +2128,8 @@ int tmc_read_prepare_etr(struct tmc_drvdata 
>> *drvdata)
>>           return -EINVAL;
>>       raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> -    if (drvdata->reading) {
>> +    /* The sysfs_buf is owned by the etr_buf_list */
>> +    if (drvdata->reading || !list_empty(&drvdata->etr_buf_list)) {
>>           ret = -EBUSY;
>>           goto out;
>>       }
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>> hwtracing/coresight/coresight-tmc.h
>> index 319a354ede9f..7c604b9f92e5 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -208,6 +208,20 @@ struct tmc_resrv_buf {
>>       s64        len;
>>   };
>> +/**
>> + * struct etr_buf_node - node of the etr_buf_list
>> + * @sysfs_buf:    Allocated sysfs_buf.
>> + * @is_free:    Indicates whether the buffer is free to choose.
> 
> super minor nit: Does this mean the buffer is available for tracing ?
> Simply "free" is good enough. Or choose inverted logic "live" or "busy"
> 

free is enough. I will update it.

Thanks,
Jie

> Suzuki
>  

