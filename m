Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841BE40E8DC
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230899; cv=none; b=u7TgzDr76Fd5dhNByjNtSK0EFJMi7Q5zRl5txMQT0dMNB9ZKKujfr9Vuw+/IUMD2OMtnvNZq3OJbNabmU2XYJS0NVKRIX/i3UmgdI0ypqR5zWABRPyZ/48tRWgAbecdFmXJ91LJgE5Oj/riPII+ezVveb/LAO+t95FQ/qQKZamc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230899; c=relaxed/simple;
	bh=y42RM1fzOk5YTulLaeFHukZ9+4O1czG+LxxzTgCHJBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUuy5UTUm3JsoKwjSoKYwt1f/ctH9kPzk6cxKWpLa1yLN7hITXXzWeO6oLUNtKNsfS/My9j38lPaqJU5Z5KIj1thr7pXweiLk4UjoY1yOsr5FuCsXrcThlnlJn/3kMiLrcIeH+ASPtBRcTxOEBUm1r2L9DWougokzsQWcAhkQaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KoiJROtn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=btpeaIrH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KoiJROtn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="btpeaIrH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S825Bw2071463
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tviKT6P/kvNE3ZLVPdJj/sAPHdfeGtFihh4yLKTBkI=; b=KoiJROtnx6Ue0OWo
	umaPzEYnRqUuBI7ncigPld+C2Ahf7cxu/Sf1M63XYNo32RI9GH1pdn6Uf2aCt2DV
	iOrkfQtP2IZPAvg4pEADklWlXmMrQgvdMZXlbIDwk2SFrbLSEdKTK9q0aQKJ3xRX
	B3vtpxDR3k2qZA00gHsLHcpmQe8L3O04w7mgPtSfiEozTiiAaj/ouY9xHQF+eKmW
	Q6gjDFfbkzi8YvBs0D+XvjZzlr3hiPvJh3Va6QkkI357otGm0cmZLUD3coBjSGa/
	K1sR6LV6YC3O8TmIGUKIBBo8LH5UhemoSeyXlDaOLO7kVaCx0Sp5MlVqgv2OlFb4
	SaHOQA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpqxjggh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:28:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a9764f0so46490251cf.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785230896; x=1785835696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tviKT6P/kvNE3ZLVPdJj/sAPHdfeGtFihh4yLKTBkI=;
        b=btpeaIrHA0z6hStAf/CRo9F/xoHSrGZfWN478jYkCWOuTKMk7dE9+EaqjmxvP2xCqv
         aU25tPDuIPMiP40vetUkHaG+phorn318OWiyHMmRaPdbkUPLkLVUckeqXvz0OaZvkCb1
         tEvfD+Ol+e4w0QaNDrnWYppkaTeCXMtxkrfYAj/6tQV7xxPGc3Yd9YMRbyDXFvK+MoXU
         D7WunchvKxhybGZMn7CCtE+BsXD3Cz0mS4hslsMALTgau2/HB6pXUBhbBTN4qZRSC+BK
         BU0k/pJVKLgfMl9s7sYp9J653mFt1++pCJy8Gwsz/LmBzVaKqTNnVL+p6TjqUjiIdJCB
         YrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230896; x=1785835696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tviKT6P/kvNE3ZLVPdJj/sAPHdfeGtFihh4yLKTBkI=;
        b=MiBPNOmkTWMDZRW8zn+Yjxcj4iUlw2LCA5HJIYfmgDGKuPyyvWc6FntcZucQLjs3cn
         qXRw6f/ylHIbLMiRgE+zYzvGv0iD2ROv0VOX5ODm3kBzynfFEJzxzo/HkUZpAjpyHCAC
         kMFVV3Ei+xK8iPeScZIjoa+bsEnQolRB5DnFi/0SGtHPMzr3VvdXQg1wGmnv70mCqP2g
         BLZ2jM7YRStWqH8vCmBsWkGrNIqm4aOnoyUBvhZyiRtTD0Cau2GagXUKYeEcqvvcSgfe
         pkZuWkjiVgh+I3TGyB9502Q5Xf1ki/KoV05YKpcyQefz6bAApt2BvbW5yjlwkLORen5i
         rOOg==
X-Forwarded-Encrypted: i=1; AHgh+RpQuhvhRhnldOH0lt7otYQRVrL4DRVWP3lWoWOE++H03nWyvXrVhUDf/KzZI2TmBiD24swXxgVP6F8B@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5rzfXVzD5ML1jGlDX6VwYac10kgGsudNdfidXj/I3wBFifLGF
	44JuhbSG4PuSjeG+K/IcuYTmoAdOzye5VO2iJZxPKNuNXCPOECQWnPQOvWTz22I6IHpzfThHj2r
	c2bVERaMjSiAtOygEHELogyYgyACudMVxygB0KK/Cy05CZ/ADTFyFe7BtB4z8aFJF
X-Gm-Gg: AR+sD12QaV60NguXWS88GtQn0Ph7r4IjG5Dk4QKjsbrnRC+Eb16zpJLnWELPVAn6nuL
	Cv+5N4prLSum4ncEGd0RjxOMZ+Vfw2l751NyMJ6cMJRerTG71YuKH+zSunUwYlB+Rfdpfb6DTNS
	Kdv+ixT1Z6pejaSpXxoVvdrrQxHIxcVC9+GIYFqY6b5IZD613fzZDYx4rpHHR+eaSRASvlVTFYi
	3K13NyH2Ys7uE+PW3zjyE24df6R59pkzg6ue9IoCTxnXw3e/gVWDaNHatCpLPFXEdqUjn1WMr1g
	CXjh89ujxc8+xdeNTXV7ArJcjHioE3C25NscOjXMoR0zwOezPFL19DRy5GXgwTVE9W+yeocstIr
	tx/2N4k95AB3/2i+OLx1KCSo2q7Kz5+Sl
X-Received: by 2002:a05:622a:412:b0:51a:8c9b:64a1 with SMTP id d75a77b69052e-529d7169f3amr12173111cf.69.1785230896538;
        Tue, 28 Jul 2026 02:28:16 -0700 (PDT)
X-Received: by 2002:a05:622a:412:b0:51a:8c9b:64a1 with SMTP id d75a77b69052e-529d7169f3amr12172851cf.69.1785230896084;
        Tue, 28 Jul 2026 02:28:16 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c902d2sm723840766b.34.2026.07.28.02.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:28:15 -0700 (PDT)
Message-ID: <22caf78c-4855-41c6-8a36-4dde85e3d102@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 12:28:13 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
 <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
 <9ac3c44f-2227-44fd-abad-fc85ee57ea13@linaro.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <9ac3c44f-2227-44fd-abad-fc85ee57ea13@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ReX8dgzSPzsj1HwgZr_hRdNHaD9xWX6i
X-Authority-Analysis: v=2.4 cv=MORQXsZl c=1 sm=1 tr=0 ts=6a687631 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=dh6gIxRJ7RYJEidOAkwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX/o3btgZwFE1I
 61fejYZSxly+vMO9x0aghmpitC/MElMXTrbvW9m9xGXKhVkXkzyTNwwC/aJlWcUb8JkJ9O/LQjU
 DY7AajsY0W+lTik7ldrBhxtKRxWePfA=
X-Proofpoint-ORIG-GUID: ReX8dgzSPzsj1HwgZr_hRdNHaD9xWX6i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX5TttdPsCS+xK
 mKMmJCsi/o/ek6i6BsS1+W7gAFqBc6+UTN7M08jWS1DaapuZQ6ZPU28tZoNU09enWXUD9BMdR4f
 v3tzywqZU2LPSuxrNg/140E+3GwES1Fa2B/lBuFzuYEyLoksiZi58C2AQB+4jS3BMPgI01KA5io
 1/ny4Tl0tk+e5px4QBXccbnrbtsLtELZuvGcwrbPp3oud342adA6nj2yMLV+mvh8wxwS4Hbo8X6
 IG4t4wozpd9aQwfvjIkVwq3CKDWCvxWcQoGQhX9x+kGeAX00glI94SK7rhwzwH3dKTO8LsrB4ps
 oM7g5UXf7dWMFp5QTXGIS3MErB968ycUqxNJxuKLmsICcTz+i/CMACWEwant139n41+UwLPuGxN
 pYI1VmrP417QqoZvMJ4RrhWNUl5+CrbuuF0v7j9qjeJBiNv0hYYuZfln6Y2jdhNOt/Im8fkzelI
 6o6MWHLJXoxCPkBYYNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280082

On 7/28/2026 12:12 PM, Bryan O'Donoghue wrote:
> On 28/07/2026 09:25, Atanas Filipov wrote:
>> +
>> +        power-domains = <&camcc TITAN_TOP_GDSC>;
>> +
> 
> I'd expect to see MMCX and MXC in this list.
> 
> ---
> bod

The MMCX vote is already covered at the clock controller level.
The camcc node in sm8250.dtsi declares:

     power-domains = <&rpmhpd RPMHPD_MMCX>;

TITAN_TOP_GDSC is a child power domain of camcc, so when the JPEG
encoder enables it the framework walks the parent chain and votes
for MMCX through camcc automatically.

This is consistent with cci0, cci1, and camss in sm8250.dtsi --
all use only TITAN_TOP_GDSC with no direct MMCX/MX entry.

Regards,
Atanas
