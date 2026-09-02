Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9A446C821
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 15:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361452; cv=none; b=hjPc2SI/7roYCF5HlWO4xhf1Bzw89ufn37HZ8tpFlzAqXodjCgtZ/rQj2xsAirhCGrFB42csyBuIfwXvx0ApMHismDbvloj9PqUHiCQSpwTt2ojFUcLNJsiabQY1EAIClPFeuP7vvmukADeEO+Vqh5AZXzjHLbr1pZ5/EIrjlhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361452; c=relaxed/simple;
	bh=wCCHaHjAyebRsmsmEX2icSW1s+oMksjOOy7EFoGCWjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZDxZ6SFzDe6k6huXm19OwMgUk0GCvFTQqksHl5HEpnyjp+XpVR/mhJrRIIPfr0Ab8Q3W12nvWfsxQCiUDwQU+okduWznD3EisJcIXdT7tKiw5ykvZKmD2fl7UUsNsKbZFEnUIOIhrr7pSRz5E/mxEjaOCL7sTlMuXmZpbvot4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gslt+rWg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eFTrziXi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gslt+rWg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eFTrziXi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CRHRN2001805
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 15:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8d/HYLVaYKgSu6VLD4TUXAuT+WMimsoAlFLEDX6rbHM=; b=Gslt+rWgaEkn8Wtt
	/GY4xVCimRHa2DbrI8POvL6E7qeLQdytf4vC+D7M9SyKb63Zk/egQ/aHObhm5XSu
	34V9wJoSKIIdXswfhBcglWSNWtlppU0yMF0W8bzoiG+2wlczpOXtKelwdMeoD7kG
	d2XmgIofGoxkaz/bwRWU2k0qB2J8ejlZxWBqPkI9Ixy6ZmNh3yRWAZ43JOXZ+/Hn
	ORx3Onu4LCsoqeCGG3G6B246sbXK2ZAX9tO4Ur3C7Qn/lcj48kj66sch0Cd5xSB0
	JlKyaBGQHkbbv7QF0r0IxAZU9Hy5IWzu3aVlynpWBl4F4bzz+a15q0OtyyAOOMPc
	y+04jA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy1cxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 15:04:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1714310a91.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788361448; x=1788966248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8d/HYLVaYKgSu6VLD4TUXAuT+WMimsoAlFLEDX6rbHM=;
        b=eFTrziXi3Lluc9XUB+MReoZbYQTEm4pDzXfbXQlpZly6DRQ0p9QjNwKa9fq9J8vapQ
         yH1wrzWjVUheLnprhKlVQFoAtVGnxy4cbw80LsYjGv0ZOS897Qoi6vJ25seQl9yuBJqU
         zb479x3Q9CsGOl+DbYmIWMfQbjqZ6SL/yA+aURBAih1B3y+XUH/gns9W8KlkI2EzrHtb
         LagNjp8QAL5V4j/3fGzHFHFc+7mh7hcYH3p/4fLqebWvHFAKNoAhh1TR81LTtEAJMhPl
         0Ys0zxCOIpj2qenXBS0p5YzE76r0hSL6Q27E04V42c9Cdyl7SnHdRgxfD8LLutUOmY2T
         XxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361448; x=1788966248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8d/HYLVaYKgSu6VLD4TUXAuT+WMimsoAlFLEDX6rbHM=;
        b=IcvlgIjNnUuIdKsZF6+GkBy7EyycK6uD5/LN5LsDY/TStEFEhEhP52vVZPW8deZHnp
         LPYiCDQtcvvEF+1HeRFrBbBMK3Bg7m4KmuVw602WeVhd8SUxHnug3zA+IsPcZqx6xYaz
         JZnRvja/pwZKSqhGjDMOsGew6kXUfgYfDm9gAW6BiUfRMj88vX980h7yBxVzTqmZTFIs
         SdZ/cKyx2CDomcZSC/lVf5paUceG3p7/H9l1BVgEsx5PK/xt4+h2OAxVnXvvbP/GM3of
         DwpnXJaOQ+3j3ypGjbl3eraL7BrMRjcYszBArbagUdizfl2Oap8fElee7lcWfJ5lQfse
         GxcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNH5v/MoZcJB3J8qb/aFp8ICko+FtRzb2hIUc2HqM/f846OhTsDGBkRoxpliQ6/fl0t52InU3+i8Xm@vger.kernel.org
X-Gm-Message-State: AFuF++n64vzqAQsCRz/N82ki1njXTBMz9dZBxMWQrB7JNxlDiDrd0mMS
	QkyeaGR4ieIfx5ZpQxKE5u/rpxN6QBXnPVFLuao1siFoYw8ys3AClraMwjvrd4MuNWMuLpPiaBM
	lodwd2YafbzreKFH8HLL4DGvvoF7L9B6uK/mZyAPPR8sP0SWgvpHzsRzfMHvYzZel
X-Gm-Gg: AYBFou2mFxlLGbcburlZro5Ap9UIR3mNmm8RUjD4PonvkH79VtDFf67P/HsSnGjbhcA
	lS0zm6DoavEAmBBzFcGvp6ZDR50+gYKPSi0kw7YCBGbAVk7QcrrVvGsL3xWPFknXhKh+KRl7uL1
	ZIXguMhvIk0GNhSzDyWx9NJvAXNkdv3D+D76+fWXUFwpnYSMpUoYX3WWRadCBLgcdQfXHI0Acyq
	6updN3Rei0SXJNT06wId8XbtKOwFcFlhz5BZNZvU3f0nhnGIFv1lWNFsLhtsF9yZGJZVMj1BBcD
	GpYvVoPhKtHecQcMNUx/yFw/Cf4QKeNuXvpoNFL0mpIBtpoerI28RaUFnhlu5G1vcBDwP19GWWF
	13JyNCmG5Lk3Bmy57zi0Sn/th4g+xyjNn+P3rgivUJyzhALY4Mtg1KCCtRg==
X-Received: by 2002:a17:90b:2ccd:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39aedf77333mr8400140a91.11.1788361446259;
        Wed, 02 Sep 2026 08:04:06 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccd:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39aedf77333mr8399969a91.11.1788361445459;
        Wed, 02 Sep 2026 08:04:05 -0700 (PDT)
Received: from [10.110.114.54] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079f1f4fsm7552713eec.11.2026.09.02.08.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:04:05 -0700 (PDT)
Message-ID: <d530f962-4fd0-4897-8022-c7335167f450@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 23:03:57 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/11] scsi: ufs: ufs-qcom: support ICE keyslot
 partitioning for guest VMs
To: Krzysztof Kozlowski <krzk@kernel.org>, ebiggers@kernel.org,
        axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
 <20260827160806.1295313-12-linlin.zhang@oss.qualcomm.com>
 <046e4b62-6d25-40fc-baa3-2978eb96eb70@kernel.org>
 <b571ea8a-4434-45e0-958f-20b2f83ced24@oss.qualcomm.com>
 <ff869d8a-85d1-4148-b19d-af3a70fcc904@kernel.org>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <ff869d8a-85d1-4148-b19d-af3a70fcc904@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a983ae8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Vihkso_W4dyqxCYGQKUA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: nNNguHptqteMdWgSupu7MIPn288AKOCl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzMyBTYWx0ZWRfX3dCvEvJ8GFuE
 t9w7tqCCp4+c+pA3ephqdCf4uc7eG3c1v1UXWzPRjOZOODEHtg7Ee8Kn67/D+vzbIuKx6Ty7nDu
 c69u8SPm18hbMvv2WftwSSUR37/+MCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzMyBTYWx0ZWRfXwkqQT9kZzYKP
 vUY6tufQwgCdDrmlHczSoWg5NaHge8kMgDVkOQRtsx/rm4oZfJzndfZfUJkD1TPwBxrn0/tIRG3
 j95XF6qaj5wnmtv4w0P1RvJFuQzA2NpjKxabExHo9exOHlFsXCtWfJpTXkPJySflQI5K3zNdQvz
 kHcqeQ/4nkjESIfuefRXD+tKiTrQhkRaN/cCtQCQzSscSesI7sa9S/Ls0oXWT7MC2n0+SCn22IL
 UFa0wkklwDMRFFjxa18ICVLXfWe+q1L0l1RMdnhYHIKC3bOASoRvSpFhRU9nSKbetjxUXlTRxML
 XdZ2P3ZuhkwTJm6k3GXqHmMIEVsfVKkwFA+9rKQLPPvEVihdpnmzDw8Ls7wWUGkpvF8gzUWf6MV
 F00gcwmz5jGL+hUDWqAC95MBqPSZmRMAfTOjOC4MTrEsqPKLUOnzHnFYiK68fA5q5qRaiEdIfAE
 +mPhyOBXNMR0jS+D5VQ==
X-Proofpoint-ORIG-GUID: nNNguHptqteMdWgSupu7MIPn288AKOCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020133



On 9/1/2026 10:02 PM, Krzysztof Kozlowski wrote:
> On 01/09/2026 12:54, Linlin Zhang wrote:
>>>> +		u32 off, max;
>>>> +
>>>> +		if (of_property_read_u32(child, "qcom,ice-slot-offset", &off) ||
>>>> +		    of_property_read_u32(child, "qcom,max-ice-slots", &max))
>>>
>>> No, there is no such ABI.
>>>
>>
>> ACK
>>
>> This is submitted for visibility. It may be revised in a future version to use
>> a TZ SCM query interface if current out-of-band key operation in the guest is
>> approved.
> 
> Don't submit downstream code for visibility. It just clutters review and
> wastes our time.
> 

ACK, thanks for pointing that out.

> Such code IS NOT ACCEPTED to upstream, thus posting it is absolutely
> pointless.
> 
> Best regards,
> Krzysztof

