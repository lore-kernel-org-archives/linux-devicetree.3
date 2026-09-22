Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA245494811
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102530; cv=none; b=AGLlf9yVsyDnouepn3l4GJrGoQ6tYcSXs3I3VsjqZDmBGJhlEDpkd1fa/YNd+YahfhGOisachjxTimVrOPUr4wB93IRE11xcUYy1vUJ4VkwNz+apn57QxePs5FqfE45NJWF7VkQX2UH58+fErm6LYaZO3Kcj+PepatY4r91ak5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102530; c=relaxed/simple;
	bh=yRqYydSndchtTUcx/XMl6b0/WB3o87e1VH5mRwkGmUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dsvTXtnLchewwWOOLJixTLLXlwyPmJtLYLXCQ2ClZP5r6V5fqhNAAKkydcrbZJAZo73OU+rFrdMWwfYmphvY4FPBl+WrSDYbXkc6bD5XW22ybIktLZfu6q/Lys0yTJM7GQ4lhU4/sjgh07r+8KTxBr63kuFGOsIA0VW+bvkCA1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXGlD4YR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bAjN1ba5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXGlD4YR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bAjN1ba5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI79lX1024453
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tPlTjTDG5Ok02LM/J+xRKeLvLBa+UcNx2c4ubRikRr4=; b=KXGlD4YRDr5JgoV2
	gUQcnyXZ4cKcGj7zDXgXchV0ulGzZGcdlVt1NFBpcdc907X84b2d8TDWaUHJ7eXZ
	Az6g3dXTBoUAhAWUR0XYAv0t+PRnAE/W/dto5aqvRAJViaTnEHz/wCT7yoi/4jna
	+Lhr0ORgWszG/Ak+Ex9tvtC0KD0MUiE9fL6EX0tdIa/0h9XSoP4c7h4Mh8d24j5w
	uksQ191Auz4yHjJV98mrPGWNqDhly8GxSRilkmkXu+YwE9kbwhF9caj6i7Nor3kz
	p2zwVbQBJMLkEP9Jp+yrPgKE706fTwF+UfbKAtR8ZneuuZNUUh1LtSnIGyXjZhzZ
	8EIa6A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkjbubm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:42:07 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-982a39e0c4dso87432241.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790102527; x=1790707327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tPlTjTDG5Ok02LM/J+xRKeLvLBa+UcNx2c4ubRikRr4=;
        b=bAjN1ba5I5k3aLAhCbdjFm/3QJ5Z3kcLhIJBDBnPt+HEIGMMrdvAfHT6RCAVq60R7b
         AbFLqvNsNK3QItnRUJFstI8g3VrjsQqOQBhRPmmeaKaHDNsthG5cao8Ryu7BLDgeo5Gm
         n6w5T1S2giG+qMdt5iZoTU7sVuluRdXrWg/Jz2OXmKuuQSxKL3Fjjy+5ALTpqyzbZZWo
         6r0LZOUqrOVhn3wRCViP8NifyDmHSHitSFl5xnxBrMVbj4uycbwZVRObELXbgQ8xNpeA
         o48xjSdskhBkWq2hWacGzvvRozuZ1wjrLY5FLyBCTB7c19Kxgs6Oq8LGeJc5fZeFWwHs
         bxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102527; x=1790707327;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tPlTjTDG5Ok02LM/J+xRKeLvLBa+UcNx2c4ubRikRr4=;
        b=l8hAwdC7RDoWYwRTRu05jenLSogfRgfowWdQFq9MnqI2OPyV2QtsqRhjEE46OWaHdQ
         6rHRbijIC3hHxy8AN89LS9t6uIi5KXfnLWax3/26LQKgTdDvX9Q+HD+dd7Qfkns3syoG
         SxahCzyfeE3Xw+B2fvBvb1XUCzUqLgSqCQn8sLsNSodfpCPueYLCi+szObblaMYe9aqO
         cRKYLVDGxWWHFs06saBg+5dICqnpHy+QYfJEEYj+pMJpaVDC02RJhagjcV7WonrpKykz
         9lcx8yMb1/adSpIYRVk1LOvKALedQj5NnUue2LxUIZEgPJhcpJZEd+rba2fzghbhT7+S
         bDzw==
X-Gm-Message-State: AFuF++mDzbO4JbghPeeZacUuc/gGCw9bI0QzD8YLKknQrtxUhxa9Z2Q3
	OgN6vI5ICcOi1sGBOorlt0bDsvVRIWakp779ZBH1CQc9CMwX5LwjxZu8K8qSpca6PJKC3VU0Ogj
	xGaLc3iLP0x9Xk2n8a01H7tgQYit4X2ldT2+INalRI3L8ak4ZFTu+mDpPee3hlN6V
X-Gm-Gg: AYBFou0ex0hVnZqE81GpxteLJ5Miblo7wBXpYb1h4nYQLJatQyZ+EC1FziPqP6JKqSA
	jjGm+xaWIJh1e0RJrHAlccSpIG47t3mRPrQS/6F8bYz4HQyr4FoFj8DdfSPR/r03nC4GIhycvFl
	7xrQbFdZDmn4o0xPZPWhFR7yqnmqk4xoNjrNFou4JEsm98vCilUT5vHtnVzyJkQV2dEEQGbjI3I
	ar81Yr8Fm9Y4Yw86DtQnsg1JqIDWvaIDUjtKT8SalJ0rAE2XYyaIwI8xJmBmF6etnyUid3zqM4z
	lmgnlkjsxDOzJN/grjdJtqJiVS0gVrgIoQCn1VJzviS6VAxNUicqFIV4hew1QCgAT+71dyT+/8S
	ns7d8bi2tWiWuH7V9jBYbNGxlAHhSwQ1fId9tf+nZa2OwZx3q7dfn8uuFBkHM2A==
X-Received: by 2002:a05:6102:3e8a:b0:7a8:1817:278e with SMTP id ada2fe7eead31-7ac1dc2d1d1mr322338137.20.1790102526694;
        Tue, 22 Sep 2026 11:42:06 -0700 (PDT)
X-Received: by 2002:a05:6102:3e8a:b0:7a8:1817:278e with SMTP id ada2fe7eead31-7ac1dc2d1d1mr322296137.20.1790102526208;
        Tue, 22 Sep 2026 11:42:06 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a913:ba43:96d7:743c? ([2a05:6e02:1041:c10:a913:ba43:96d7:743c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf3559b3sm1587915e9.0.2026.09.22.11.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:42:05 -0700 (PDT)
Message-ID: <3448a4ef-f5a1-47b5-b47f-f208aa02a622@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 20:42:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260922181818.5503-1-daniel.lezcano@oss.qualcomm.com>
 <20260922183135.18EA61F00893@smtp.kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260922183135.18EA61F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 05yKsTNc_6hWInBCv0P_h6cUeXfq6trD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3NCBTYWx0ZWRfXwT45HA0t7i2t
 +Ur7N2laIJ2TnIj8YwupJZ1NyrlbfCZgrluA/FzVXnzg6rLT6v0t0hM6QPCe3ifKtXflAgt6nFr
 oVVLtCSax5uEZVVubjNtpmRg0V1wvUqHq142+50B0e2Jc/ozkW7Y1/13lIxqSr7sI6i+LViZ+QN
 VnDrTRvHGIIbFPHrCp7YW3zUphlR8yGAkrZE45hNRoy7Poc3esL3eJsCGd5ZrhrXGYIY7Bunj5N
 OqdOIR1VfwM4bp9kNsvmKwztONY9dLtyJxRi4o85XHpKlj7+jQLWROPPYe5j5qn4xSY25DpL+nN
 DXe9cDFvH/CFJBaU2xY79Pgw631CrGQ+Mj9EmZkFJD6ISYvnLD1awGvVz9hONWiRfhmqTE1RRjC
 C+Gzci0aUcC4fPGpYDGIaJP4NoMToi/fIkEdo4LXv/MfTY0Or/56tPyul4ExOoCapwu9WI42mfo
 FTHwJU3pX+im1O8copw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3NCBTYWx0ZWRfXx/S4uaB9Dl9V
 xOUiSsjDQ1oLdRwU1LfGXqcPxdJtK/ftMFj7kg4HAuj1pvziGIAW6QPPAKfw/oJhO8/AqO9N2mm
 u0ZH3Cuw3WYNgdiJ/AgD/lKYArSuEJE=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab2cbff cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=AQOl0tKIyClE0BU_-i8A:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 05yKsTNc_6hWInBCv0P_h6cUeXfq6trD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220274

On 9/22/26 20:31, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] dts: missing #thermal-sensor-cells on pmk8550_vadc breaks thermal zones
> --

False positive probably due a wrong baseline because it is present in 
the QC tree [1]

	Thanks

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/tree/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi?h=for-next#n291
