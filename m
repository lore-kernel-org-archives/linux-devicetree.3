Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82CB572660
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873340; cv=none; b=ihzCGXk7aM6DxWbAWFZuD5TFxdSGe/SzjtRhj9okSK9Xo2GLgHvApBJC/pvBSgwQ6+K0BE7O5mIcX1/cy3A1QLh0nL459CX46bpu6wpUMNaok2Ozit1PbcKbD0qhiSa0eAm2hZrKFHBEr7dQGAVXLtXTNrL2OlwsiMC07p+dJ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873340; c=relaxed/simple;
	bh=Zcdpx+RNhi3G5SXrQ458cAnUNQSGCbuLRxF/WFPWRuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JhgwvAL+2c6w62BMjsGFOilwiVY45Hay+nVB6dyGNjKlftuvzir1nUu8KDT8U37Ks+rgSqgkX+4FWyslVZvRvA8P14OTgPgeKFGSBolO6vQZ/M9/iXWVfSlg4bYS3FWIAUR9Uc6PhHX2lD4kZlqU/MsLnSEgBSpEYJpTMJddMkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuxecpYO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xjxh2zgu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuxecpYO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xjxh2zgu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CknHr3221902
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 13:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wqg4RIvj4EDznPdH5QGIsGmd5X2+Q2zBtKlvYGU1LoU=; b=GuxecpYOHeqk9Hn5
	tMZ/7WCZnCZWme6Z243IfcJ3Uw4W1q/nUlhC2aHKoCQX+uAzg36m+C9UeHSDKfOC
	iPsmjW9BtXfrMUyo8dgm2IQrJAetXDdaViKKtzoJasolUNlcVK7YvoV0+Xf2AfUg
	YR2DdW8RdyRAR/eptdDTodJqUm/0MhgUq5LeW8YYDNH23dweth+m4NdpjgYsW/NG
	SGkK6bSLPX0EpkiTm+WIHwomulj44VxqjVEqnnSGIrdwLiDSszbUqB+VaFz0YPxW
	3h8L/C3SxAJpzObxaJWQFspvASbh0Ht92F5OK1VmxCGDDRUDG3MdZwrqVX9llJ82
	a2trtw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjaguj5tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 13:15:37 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c665139c92so83303e0c.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788873337; x=1789478137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wqg4RIvj4EDznPdH5QGIsGmd5X2+Q2zBtKlvYGU1LoU=;
        b=Xjxh2zguwvL/NWWBWCewc/lZMIYertvOR549mm8JkT3JE9GNAo25OWwG2NnwVc3rZn
         dXXDamrb+PfF+sDkLrHCFvaV+0ehz7JFosJYv3IB45i7A0rF4FQ6oJuWeGhOstrdq+pQ
         611P58KIpYWbKktqRUt2z/cBvCCHU04cG5UU/sIVwE9CGnHRrne0KMvqmjvyMxduEIhl
         ga0mh1/YasQ5zzv1BxmwapGIgPhDzogDQfAVOmo7Nhru+iUkfyzWmgKxWhJEwSTaq4Z5
         7NUC7ZhuxFvNZSI4vb/qUA2hnYYtBgglS1gmHbiApOI+RKRu3I40n97i4knW6P+w1ML5
         juZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873337; x=1789478137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wqg4RIvj4EDznPdH5QGIsGmd5X2+Q2zBtKlvYGU1LoU=;
        b=ZT7LRANhiRkWGyH1keT1zwCLfD9J6bVqAOou4cY8iWlRUnPhUuHYhR7UV/BCOM34zU
         IaXCn2JnGLFsu/xub6DG19Jt1TzXSRQWD6Th2dVFpgTZIjZ7BVO66E6MJuueNNOE3zct
         1cDijPqgTriYntW4c2kxhbnJLJdFaUO0wnbrjh3hrpl/Xa/5m9bF7yilBvKNb32efRh/
         3hASaGxjaeOy28xx4656Wk0SPPhqupZE3AnQYobwbRpIO1uwcwPQ2MuHlatgz2vkarrS
         GndI4Bc3MA2BMtzSwsU2ynHXUpjBAT0U9PuBfqEYoGu7Jc3ewCs3sWO4ovad9RwEBnYp
         NKJg==
X-Forwarded-Encrypted: i=1; AKwUvBxNouQK+uMElRW+HAdlHrMEvNKoyQ7F6BIXp0YGKBCxG56VKpD43zGBxHq9BOcyVBHBnispHR5Y8YxE@vger.kernel.org
X-Gm-Message-State: AFuF++myweybTZiXwRyfmNeZnlUAF222WNaDIXcZa8eE6PSHspREspkP
	OQQrarMzY/fIN+I4WNKa2gkyMmYrexPumXPWtlDRhmD7xJj9LTPdwSF9qDh05+S6U0+9R0adftl
	6D0tCdVtE6kwBmhMA1rA0OeOxpZ8r9yXLItrWVVU7lrI816NyGDquPvbJgdR1eIHF
X-Gm-Gg: AYBFou2OkYhtyh+jb8QBV/jAYWgX504unZ1CGDbpjL/ayZBorp7zN0PVPvebtEMVc/D
	Q4IpBO9pVUYHb8ZKvSlU6VdgaT9D23w4KISmvaGB7dGWeWR9fuwMULzcsttA/ymJepn8rTOsL9U
	WLaQBrzeQz9frSgILPF8PQrWxWls/ksGCfZ1WTpiKD+TcMC4WywOCr0RuVzy7E6Qg51Jf48yO/L
	MN3uEP2ToqoDK2LLK1Un+Pq6HwTJsYH/aEt1LYEy6ySW577qpCqQxigg/TlmZ4OnG6aP786MB6b
	RZNGXEdqQeymoKaAlxAENpBDDWBCTIvtkeiMcCxlBYqeNvGuZkYx48Gttn346qn8GUnssbAW3H1
	ncwFGFouVQhnVysMVSAeTwQ==
X-Received: by 2002:a05:6123:5d9:10b0:5c3:b339:7b19 with SMTP id 71dfb90a1353d-5c7fb7ea227mr24540e0c.1.1788873336786;
        Tue, 08 Sep 2026 06:15:36 -0700 (PDT)
X-Received: by 2002:a05:6123:5d9:10b0:5c3:b339:7b19 with SMTP id 71dfb90a1353d-5c7fb7ea227mr24534e0c.1.1788873336105;
        Tue, 08 Sep 2026 06:15:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6167031f1sm3053010e87.60.2026.09.08.06.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:15:35 -0700 (PDT)
Message-ID: <de1c8eb5-c965-405d-bc4e-551926a886d9@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 15:15:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: fix fuel gauge
 compatible
To: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Caleb Connolly <caleb@connolly.tech>,
        Frederic Laing <dev@fredfunk.tech>
References: <20260826233818.124278-1-rinat.muhamedgaliev@gmail.com>
 <60faed5e-8a19-4eea-8272-145aca3db2d9@oss.qualcomm.com>
 <CAGHQT46f3wexEQHpcp_aoa4MHpi6vrtAd8Pbmt0KANdn9rANLg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAGHQT46f3wexEQHpcp_aoa4MHpi6vrtAd8Pbmt0KANdn9rANLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6aa00a79 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=ApsbdhC_8wnva6kFnVgA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: PE0Vv7iRu5GI3Q7nS-6t2RcUwgObWniZ
X-Proofpoint-ORIG-GUID: PE0Vv7iRu5GI3Q7nS-6t2RcUwgObWniZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0MSBTYWx0ZWRfX99J/KaUYspio
 sQxzgp5i4O/xEiks08iphByX4a/TQqUpCDqwssxVHNFkwvrltaVUsGTvISin6ycydM9IYy7Iz1t
 lT0REIkbJF50x0iZvxSkC1oUUwAz+yw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0MSBTYWx0ZWRfXzswJk5yDStdm
 pOd4FC/xY+0cona4OOm8aBvg49d5nBx33vCiGEoU9XdmTqIdaxuWNXEJqzqWKj3QLglRGgAIMA2
 6F+AGWho/yG6F0iM/4BW8KRcmdvgzCMaUcYRteUiY1JuGAR1uBDb1mOzljjVu80nXvEnZVfLYPK
 hRFiLj6TiRJf3aaD40Wt9y7ZvbbYqyCutViT7KH7Sdswk+iNJII69o0hl79bP+5pnYI+lv1mN0v
 AY/xIKBqRQd3HFwDsNw+/aIm8LbiihqvKPIs8mdnHJbLbe1QqfVKcLPP8l5RPLvQdCr9rWfwq50
 mplIAxut95LOIUoSFuH0yUjhPvqOLRQLRpQmCW56wtBX7SMkoWVU0GH4eEz90co/eyzhABWxtdG
 iWxPXiw4uZ+8xRU1MtJqd2bdPpntTnrDfusbL5t/LVXB9d3bQFmHCiDN7pRM3HLbSx+q7kQ26Hg
 doH4OAbnKCJ3DEgiR6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080141

On 8/29/26 11:03 PM, Rinat Muhamedgaliev wrote:
> On 29/08/2026, Konrad Dybcio wrote:
>> If I'm reading that thread right, this IC is on the battery itself (?)
>> and it seems to differ across different units / suppliers, would that
>> be a good interpretation?
> 
> That matches what I found while looking into this. Both the bq27411-G1
> and bq27541-G1 datasheets describe them as pack-side fuel gauges meant
> for integration into the battery pack itself, alongside the protection
> IC, rather than being placed on the phone's mainboard. So it's
> plausible that different battery packs (different suppliers or
> production batches) could carry a different chip variant, and DT
> can't detect that at boot time - the bq27xxx driver picks its register
> map purely from the compatible string, with no runtime DeviceType
> probing.
> 
> I want to be upfront: I only tested this on my own OnePlus 6T
> (fajita), by reading DeviceType directly over I2C on that one unit. I
> haven't verified whether other fajita/enchilada units report the same
> value, so I can't rule out that some devices out there actually do
> have a bq27411 and would regress with this patch.
> 
> I'm not sure what the right way to handle this is and would appreciate
> guidance. A few options I can think of, roughly in order of effort:
> 
> - Ask other sdm845-mainline users to report their DeviceType (a quick
>   i2cget on 0x55) to get a sense of how common each variant is.
> - Leave the fix as-is for now, since it's still strictly correct for
>   the tested unit and the previous binding was wrong for it, but note
>   the pack-side/per-battery caveat explicitly in the commit message.
> - Longer term, add DeviceType autodetection to bq27xxx_battery.c
>   itself so the driver picks the right register map at probe time
>   instead of relying on a static DT compatible - though that's a
>   separate, larger change to the driver, not this DT patch.
> 
> Happy to go whichever direction you and the other reviewers think is
> right; just didn't want to claim more certainty than I actually have.

If the driver can do autodetection, then that's a good idea

Otherwise, since based on David's reply there's strong reasons to
believe both variants are out in the wild, no autodetection would
suggest we need 2 DT variants (I'm really a fan of the other option)

Konrad
