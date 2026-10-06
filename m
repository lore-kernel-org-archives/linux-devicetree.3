Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57253CB8FF
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 23:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791330817; cv=none; b=KiBpygg5F8XQDnQsenHpkMKbNnGoVT3PIHv6Q8GZSWhHeANQid1zIERLWTEleNKReAVSxRICqmWaErldm7qC/ECih65kKU/wqfQip+/HM7mA94whRuNKndZnb6ihXQxLtAHMAcoDQqtigkaDqChIGnVpelvPkpYExi2Xrjuy7rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791330817; c=relaxed/simple;
	bh=xf167AZzu0nvnTcAX1Xw8R4tyYv+cUzmt2UzRs7bslQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GbQgCQezBna/pyJziqqWTVNboPCmqkqaV1eQ6lHKp9pEgYbY6rlsUKCb8nHcfRZSk+Yltph9GrytuSe7+cCt1WzYdyLfJB5fyn9G9KKfASjh1f8brhJCx7pLH0ZpFxH9sUL5Ma8Z2Huss2VxTFDemZ/+RAnEXZEGt42sF5O5NaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkiWrAzX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+z66KUC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkiWrAzX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+z66KUC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696Lea9W3015731
	for <devicetree@vger.kernel.org>; Tue, 6 Oct 2026 23:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IFp8HdaEfTURv3yOkfDgaxZg9EFYUbB/frsyn4UIA0o=; b=KkiWrAzXJ0cWLYsj
	DWrvvW6RLnt3U7oadPNWuvLNs4UbwqMb8BQRas/iqGSO8pxrAF8kzD78d5B/Ltuk
	oL8+9fqfkFcty1hY9Sg3iWS91ESxCx0tej2TAhoUoFuc3sHOIIl8aQ1MheovAUDh
	Ax+ArVACEAlkOwleqh9YCYjDEMAJVoRkh055+d1JSzoE82U6W5dLfau66blM+hDn
	mvaOsS6YbEjCM7ZzId1oG2s4lfaaKPqi2I8pRFwKPcnzGrBTYgNCoa1dj3G5yCow
	XcDAkZGhMgqdjV5tWVaZdkm10tuBqqhsJ6tOMhtTQB1mtx9eIq2a4CBou4P8WPmT
	ErMHKg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4uy4ks9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 23:53:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510562ef98so4602368eec.0
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 16:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791330815; x=1791935615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IFp8HdaEfTURv3yOkfDgaxZg9EFYUbB/frsyn4UIA0o=;
        b=P+z66KUCVaVdG46mJGBGEu5X1yP6CIlTB8KEhhLufX14Vq7SkRLBU2EDXVLBwUYMq8
         DT4ZlSb+O0gjvnQuJVTqr4elpS7JLns8f4erz8+90Pt3qshRCZyJLYBRU2bhj+B4lQJ+
         kAZc/fpIDQkNysIfNDXB+pYt0JQs4ucgyzROgdPkkW3S6NHMxQv/rwtmYntJsmtUj5a6
         FmgcIw0sABG9S5SPYl+cmyobYtVz7Pbq5hLlFfDtK9ZsOSTG58/mC5yJxwMNOGrVH+P8
         gFfRH+iLRUOKmVScQAd5L95o8iuYnbK17LE/7JW+krkqqovmURmRWD6ZVrr49YEvuGtz
         Mz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791330815; x=1791935615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFp8HdaEfTURv3yOkfDgaxZg9EFYUbB/frsyn4UIA0o=;
        b=Jf57oDx0i87OVnsBpwPOH5r8GBVmfIED/y0kIGnhDCBMHlrNXZMxl8PERDb0+K61pp
         CRDRPrJf4PTDbFZV09f25YkaxNqm0vHKWrhmxWMKoFXx84FAkwGpRHjY4yiCwCuAit10
         UwMM4GNUOYHSopxKLuAEYOoqNiFHS/iGOUMns6rhASL1RpoMHydkv9fGceAbW2m6zn4u
         f1tVX43ZfPwF5H3JFe4QIsGrUD5d9pjMMX8O0Y9zQafLdI1+Nh7qQugMezFH17Q9W1j3
         CMTHuvk2cd7YmCXoOIMXVTN8OYgFGt0iXu/W8BlmWdTVpXGOiOHvUZky/EulH5wubFCT
         zH5A==
X-Forwarded-Encrypted: i=1; AKwUvBxG2d7U7D40Ps/NtiLDKGHjYxujc+WmgEe36ohadJrsgysHICGGxvaJt4kAQx9NMc3ydsgtql9s3bsq@vger.kernel.org
X-Gm-Message-State: AFq9FYI7kBoowa7JoXYRdsyihIFKnOoaGl5a/PalW8ChW3b/UCiWYzAJ
	zzsmCci0zu+1GzQfcONQ9oZkZTH0c1ppXcrDQEFrnRsSAsp8R2wG9H42iu+ojv5E5X1egCIXZoF
	nG6FNxXv05t7mnIrOaP0vvJrgpDBMoIfDNi75ddnYi8fahd8Zg0R0pPHtEMRC7+i2
X-Gm-Gg: AYBFou3u4Ay7+bT6mrDu7qjJvdolyhbTe1Ksun+XryuSxJScpVYmLI6RcIMcYzJMyKB
	gwLhV8+gwgXiTBL5pRywjbKhkUnXr2UN0yWGiRRzrUBnlE6wVBxoja7JUGRGBRIeJlCjsdBNlO+
	Hv0rCo/yMQbmPWUu7fvoZwtvythVj8wpDPiP0cLe0Jdg2CHcdkwujjhLUn9PFXf5mDDfxxmOcCk
	zjO75mh6fMJYlWsbwJL2NuZG76BfC8K56MCJ8XbHrWEDF82N/fxP36gEczM4+XebgHsxtkVWzOj
	etvUlhmNqA0xlOh3PlGUp/SufRbqXTVSSoqZMoMieq5umyRX4rN4goCcOIuO8wl+6oNwngojDD4
	YNAcb7rrI1q0mSfv9bnU+soNxeYV+J5ThfZYzwFBphlb2EuyhEaVSfu+iK30ZUh4=
X-Received: by 2002:a05:7300:e5cb:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3515d86f096mr371882eec.3.1791330815330;
        Tue, 06 Oct 2026 16:53:35 -0700 (PDT)
X-Received: by 2002:a05:7300:e5cb:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3515d86f096mr371852eec.3.1791330814702;
        Tue, 06 Oct 2026 16:53:34 -0700 (PDT)
Received: from [10.71.184.34] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515afa61e8sm1972503eec.22.2026.10.06.16.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 16:53:34 -0700 (PDT)
Message-ID: <4ed3f09f-74fc-4f07-8897-5c773fbde0b2@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 16:53:33 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
        Georgi Djakov <georgi.djakov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, axboe@kernel.dk, rostedt@goodmis.org,
        mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, djakov@kernel.org
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
 <ar3yt8Kl3WUV93lP@google.com>
Content-Language: en-US
From: Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
In-Reply-To: <ar3yt8Kl3WUV93lP@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5NSBTYWx0ZWRfXy2iFbNby09Vy
 stDor6K7641ml9p4fq05YS7a6DwcSXggTgpTGTGQSi6HAEqM2AczljRZpEBPp6guY3v/RtnzpGO
 jcTsGynvhj56dG0R6E9TSpeFeJmaziVYm/yIgaNImTJtTVL8EMhT+XdkwzrWbgFGbOVSz7kHf1f
 N+VC8FOXDNFNuy4GN04ZeGnLGPWYkSyIWQyi5K1NhB8VcKe2sw5k0dL87QHVzUnQpD3MldSQUCg
 odahdcEppAUviTVIJjq/Rj+Farxh6mksk+vIFCMjKS6P7HVz1Rbmh5hKb4irwG3U2KXjgfUy5wm
 RTJkKnlrRpTzIM+nTxceigdqUBvxyEvpTkF+B3+yAJ6CLnZy4R3iVWWjNYDONtuV7yIi5WN3sXg
 SbOIwwyaAqF0Olg/yPTRDbFSxKt+RKt3TsZ3hv0JvzhQ6wPMl/iBNnMkhflrBf+IjcVZdfIX/yQ
 fjAwKTtVLFw2BxHF3bA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5NSBTYWx0ZWRfX+w2yCsnLZccX
 o8XLv1evd2wqCDC/TDwpTTG6m4hMgGF4Mak2/xsL585Sd3DCvQOycbZC8lC560T1t5/ZobP0Rin
 7g9/Kyx75zi+w2LbK6h0EPg40TJ7gBQ=
X-Authority-Analysis: v=2.4 cv=F97C5ahN c=1 sm=1 tr=0 ts=6ac58a00 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=9kMCAbyDuj7LhItxiaIA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: _FG_x8HVDUMJR5D302CsvBl9kndCBPeb
X-Proofpoint-GUID: _FG_x8HVDUMJR5D302CsvBl9kndCBPeb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060095

On 9/30/2026 10:43 PM, Sergey Senozhatsky wrote:
> On (26/09/30 07:52), Georgi Djakov wrote:
> [..]
>> @@ -80,10 +87,10 @@ static const struct zcomp_ops *lookup_backend_ops(const char *comp)
>>   
>>   	while (backends[i]) {
>>   		if (sysfs_streq(comp, backends[i]->name))
>> -			break;
>> +			return backends[i];
>>   		i++;
>>   	}
>> -	return backends[i];
>> +	return NULL;
>>   }
> 
> This hunk looks unrelated to the patch in question.
ACK. Will remove this.

Thanks,
Oreoluwa
