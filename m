Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1BF4756DA
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 10:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260096; cv=none; b=ZnoVf7BDIz1gHuR5baZiTpEuuJRmzJ9USLH5HuEg2424oL4geMk1CGK1V+Mhv32hgUvfRwp0VSqIv0boVBtPbtE6S/xDwqtZSR1u16aOXoJrAirl4rOb3Qsfa/zDcZ2nYJH0Pk4TrF8HC4XNTT5gE5ARG0DRvgVySzz1mOeeICw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260096; c=relaxed/simple;
	bh=eo41WihyA3ojxp0NLE3JaISxqefjtiIrGimbXZifWtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZXqGzZOomXgETE+XLAu+I9vMLDS6X+SA2uyhZbFgWNxxtrXQuGDzvqrMY02wRYcbgkCB0g6Kct1I9C/wcvqlfEk7R9nfs5bnfQIDDIKAQveWQL95uzCdcv212cpAxwrqoJvjWib62/qoDF4t/buUjXUJ4XMaMh4eon60oI+T2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqJ0Goxn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RB4SYQ+p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqJ0Goxn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RB4SYQ+p"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJCrQ3406526
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 10:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OPtv8ii2wGrHphSvsH0bCWdT13ol9RcJ1O+uWSnFADo=; b=UqJ0GoxnCQ4Csd1v
	wKkffNP5ImAKrzb4gvgZDMzVLBhu8gm+M6RLcMlx/t65dwplHNQAakzHjAyY6Mo6
	YgVAbK8ywJvsJectDmn3yv2MR1y/xk/b2wXbFI5tnbtCm8fGRO/gdETgRlTeR+th
	KiBijkBVFxkEKSkVBZbCB2Ybwi5rqXWrEByQTrjjPuLO0byhSPSUU0g9C6MoeYG8
	4enK9+sCKsNbE4VyggZza0RBduwyopJtPIdAQFRCzEq9nIqI2jUJD5+TyXGbXoU3
	gAlTXV9uVErdTR+hSToJ6TsFvKEgzmh0uDDJ6ZU9XHOnCXalBzgTq4AOm49WOLgr
	QVSMxA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu156b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 10:54:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7151120d6so23837225ad.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 03:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788260091; x=1788864891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OPtv8ii2wGrHphSvsH0bCWdT13ol9RcJ1O+uWSnFADo=;
        b=RB4SYQ+p2mg5q1Gh9bLE1rUC3diLzIXoo3D6/AxVJ/2Kg/uE8VQuvOMYIFsLl7Ojtt
         yUdnWz6KKoV1knAqCs9mdH8kU/IbaK6/wwKF7STTHIhb8LOrSV2hd0QaMo/T0OAT+frv
         ty3pH6forX/HgcWRuMCuaTns4h16gQDhA2TK4+iBJgB+7Ct6ne0qJSsCTa2wJGjUfCpe
         FHkEC1Pcx5LOqILfLlkV4Eb+AlpWwlsP42EO3svgi+8yIhr16soL8SxgRiaXv1GZ69rf
         0jfVWX4vwI7P288dLzp+SuikexulYrH132zdrl/sUEXIB0uJLBiVkyn3XB2Fa5y4J5W9
         Y5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788260091; x=1788864891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPtv8ii2wGrHphSvsH0bCWdT13ol9RcJ1O+uWSnFADo=;
        b=HQHGIVnT4pK9Yq1KkZs75Z+mPxFd0c2X7du7xd+nycI7i0HI7oMEhm/z5byO1rVXYn
         YS9YHGVkKVdiD03M8dWXTdA1njHTWVZP6nrj+4FHNQwlTGQb+QCU8nvUUy2rNgRZ3yoN
         HZEXvhCxa+tlMJlMylubPE54X1m6dkeZ+y8mZh3YOz/LF1CNIUWwpZ2qoF69a0C4E9gI
         0sstsgtFbB+rBg23Ekv0uAlNUKv+irxridO9VTROY2aDtEQOACK+nu/82bL1ZdFqb9QW
         fYddEWh9k5RqflW7We9M2fV0ijfXl7IKipLTQwYmOS04aLZ7jffYVKvktVlZdENPuY5y
         wy9w==
X-Forwarded-Encrypted: i=1; AKwUvBzflV70w6Wbk3USeunv+lkzPGambFdCKm/cV9EI2jM57ZQeFwZK5ojC01n8E+FxboXJbNJ5JjYGz6kw@vger.kernel.org
X-Gm-Message-State: AFuF++mIOWDVMFrxJfnJtKjioXBV/rMe0VqxZAXRRVK26Rl0Ud7HPIbO
	WPVF6le4zcc4LR3vvissiwaP3Xt8r1HX42FsluMKVBROs62ttP3LeKJHkR45z15sbBzaKxU4VS8
	MzxKdYizoCgtJ++dkBoEwJV+iv8cs11PM3p3ExXJuRqKglormfNw40njQvYZB23Dh
X-Gm-Gg: AYBFou18d1flLEw9bqFcRqAh9dPd3X2DU0+YQu2jLsD+TX3ODiblmvKDaH4nyietb+V
	l9uo9UvaRK9XVqsCJsYqhle59IU1U+pGKdBGAr49MyVpEXpYijGJHcJVAlZbifWrmC6gsR9mzSr
	x0Q5JJz4ReM2MCe3jnzToVhXy0M9oG3lPWirgR2ZZe3MQi5T1nPuEMQCN2NN9IdKAZWoX8nIx4f
	T1WYskT+E95E/AVpfwwXq8QEQF28F10yrPVGhHHZR7y5wtKqUhUzC7+kXI4LisgF10NAuuazgn5
	iFdlvomUKzZz66JBKJarO3J0rgp8+sVDuifC1NjKCTOzC4C1H5lfSAiAbtdwJxP97dy6Mo/n3lI
	pMoFrZkHXzzTM1drrk3mPd5+HQCI0EAIIiT1OOtS/g1YRhqhEhNj9053S
X-Received: by 2002:a17:902:ce8e:b0:2d7:107c:917b with SMTP id d9443c01a7336-2d94a32e0c0mr87827245ad.0.1788260090784;
        Tue, 01 Sep 2026 03:54:50 -0700 (PDT)
X-Received: by 2002:a17:902:ce8e:b0:2d7:107c:917b with SMTP id d9443c01a7336-2d94a32e0c0mr87826565ad.0.1788260090392;
        Tue, 01 Sep 2026 03:54:50 -0700 (PDT)
Received: from [10.110.34.210] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm20231849eec.1.2026.09.01.03.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 03:54:49 -0700 (PDT)
Message-ID: <b571ea8a-4434-45e0-958f-20b2f83ced24@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 18:54:41 +0800
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
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <046e4b62-6d25-40fc-baa3-2978eb96eb70@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5NSBTYWx0ZWRfXwltIfqpn8mQ6
 +aiKl2t45HdHHo/soNWtWXP4Ocy5XwsJM9R+oSYhfsj8qfCBbEcn+LMnlSkHJRHSZQYYdzlxMTR
 gFeTDqIxThwsayd97ZL1a2z4TJigW9XPjWEcKODVPxkay7dIiaqX23acM80UkwEqRMq5NZTjmnT
 a3O/IunoFIERecYGHBsG2R7D59/T2atd0k3ZciWqOOa2geITG9cY7FyuALJmuF5IkP8qsymzp6Y
 7ZBrCTldw3SsKou3EFltGg1jYkjgbrbWVmNVF6WagPEiHqDMRokIa8rGB99XHyvsmgIi88keKff
 kSwCZ5ZFpZ549mUbotsBin1hrpkoIHdVcwOJzT0aHjVCAXEtFhtdiLV8rolJ4pDRyLeepiFJP0L
 SlMgrE1OwEZrGnIU/nsRfgvP9LZBb61+XqprSORzLMj/kWgTJpyNgGXTRdoKTK3075EgHAmRXDp
 v6EbZ+3H76WoRvrCOnA==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96aefb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0jl50ytlWdhOsGfDH1oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5NSBTYWx0ZWRfXzrlcqLYa7CK0
 9LoSK/of3oTeLqQTM/6GCl0Bk6AmcEeoJVx934y4SbEo9NYmlWdWjA/1eaN2eJvByQ9v81ea+zk
 HZ0wd/NEDi2sYtI0LVCMseO2SwPv9is=
X-Proofpoint-ORIG-GUID: RxSvVlr9nc_PpMGG5Q7CdDj_0H75vmw8
X-Proofpoint-GUID: RxSvVlr9nc_PpMGG5Q7CdDj_0H75vmw8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010095



On 8/31/2026 3:03 PM, Krzysztof Kozlowski wrote:
> On 27/08/2026 18:07, Linlin Zhang wrote:
>> From: linlzhan <linlin.zhang@oss.qualcomm.com>
>>
>> On Qualcomm platforms where UFS inline encryption is shared between
>> the host and guest VMs, the ICE hardware keyslots must be partitioned
>> so that each VM operates only within its own physical slot range.
>> Without this, the host's blk_crypto_profile would manage all hardware
>> slots, conflicting with slots already allocated to guests.
>>
>> Add ufs_qcom_ice_parse_slot_table() to read the qcom,ice-keyslot-map
>> device-tree node.  The function parses all child entries and validates
>> that no entry's slot range or the combined total exceeds the hardware
>> slot count from REG_UFS_CCAP.  The first child entry is taken as the
>> host's own reservation; its slot count and offset are returned to the
>> caller.
>>
>> In ufs_qcom_ice_init(), use the parsed host reservation to initialize
>> the blk_crypto_profile with only the host's slot count rather than the
>> full hardware range.  Set profile->slot_offset so that
>> blk_crypto_keyslot_index() returns the correct physical ICE slot
>> number when programming hardware.  If no qcom,ice-keyslot-map node is
>> present, the existing behaviour (profile manages all slots) is
>> preserved.
>>
>> Note: This patch is submitted for visibility. The ufs-qcom driver
>> gets its max_slots and slot_offset based on the the current
>> DT-based keyslot mechanis. we are aware this may need to be replaced
>> by a TZ SCM interface, submit it RFC for design discussion.
>>
>> Signed-off-by: linlzhan <linlin.zhang@oss.qualcomm.com>
>> ---
>>  drivers/ufs/host/ufs-qcom.c | 91 ++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 90 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 62396212a0a7..0611ab50f4cc 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -163,6 +163,74 @@ static inline void ufs_qcom_ice_enable(struct ufs_qcom_host *host)
>>  		qcom_ice_enable(host->ice);
>>  }
>>  
>> +/**
>> + * ufs_qcom_ice_parse_slot_table() - parse qcom,ice-keyslot-map DT node
>> + * @dev:          UFS controller device
>> + * @hw_max_slots: total physical ICE keyslots reported by REG_UFS_CCAP
>> + * @num_slots:    receives host max_ice_slots (0 = no partitioning)
>> + * @slot_offset:  receives host ice-slot-offset
>> + *
>> + * Parses the qcom,ice-keyslot-map device-tree node.  The first child entry
>> + * is the host's own reservation; subsequent children are guest reservations.
>> + * Validates that no entry's range exceeds @hw_max_slots and that the sum of
>> + * all entries does not exceed @hw_max_slots.
>> + *
>> + * If no qcom,ice-keyslot-map phandle is present, sets @num_slots to 0 and
>> + * returns 0.  Returns -EINVAL if any entry or the total exceeds @hw_max_slots.
>> + */
>> +static int ufs_qcom_ice_parse_slot_table(struct device *dev,
>> +					 unsigned int hw_max_slots,
>> +					 unsigned int *num_slots,
>> +					 unsigned int *slot_offset)
>> +{
>> +	struct device_node *slots_np, *child;
>> +	unsigned int total_slots = 0;
>> +	bool first = true;
>> +	int ret = 0;
>> +
>> +	*num_slots   = 0;
>> +	*slot_offset = 0;
>> +
>> +	slots_np = of_parse_phandle(dev->of_node, "qcom,ice-keyslot-map", 0);
> 
> No
> 
>> +	if (!slots_np)
>> +		return 0;
>> +
>> +	for_each_child_of_node(slots_np, child) {
>> +		u32 off, max;
>> +
>> +		if (of_property_read_u32(child, "qcom,ice-slot-offset", &off) ||
>> +		    of_property_read_u32(child, "qcom,max-ice-slots", &max))
> 
> No, there is no such ABI.
> 

ACK

This is submitted for visibility. It may be revised in a future version to use
a TZ SCM query interface if current out-of-band key operation in the guest is
approved.

> 
> Best regards,
> Krzysztof

