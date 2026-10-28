Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203671;
	b=CFHDY5JQbDojrji/NVnjONQMjqCSJ/6OsCrpDaGXH3L6ow3ngyqymd79yINNkfSsNbaf
	 qdpYeqoe534vbewrtLKQg3YPOkD8SWcXO1SLeLgRJlOFIpSWq7qc+9KBHmY7SXvCldaRp
	 Byvt8DH932xrbKveB3x3QFh83oRtPb2mE1/BhNoHfzV4qOIDJUq5B82n8TUkfihN9d1Gn
	 H/fIjBPVZxr/Jg1gXzT0ZHTw4X+pWyCNj64FRZQAS4ZelFuRMvl7CrbE5Kzmj35DMwGYT
	 KtU6RVOHfnmgo9Beyenw9RC+dym6VVVZ+dDejFFml1k9xpvEm76qv8yUPaRusQe/RRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203671;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OvJdcLneWcdAZrlX+pjCRCZqVtPdNXDbzbSNDdyEqno=;
	b=B8KlaAr47DViN5XFFgrgqyTnKBWIWSu/MY2D9OMLLJ4Z7e7+i2P++pc0Fj1ramf4W9yV
	 hqnXC4Z7gd0EXrrP9wYn/ux3RkZIlPYY0LAHER82Svrjcj3uUV6G2DG/Ui1HocpEEbRFg
	 AdS5lHHXKAxTL/Dxh4fIfvRdf9QaMPiex/H+XGxmRyA+JA3C0qKK+x84Ye5qwGYVa5nU0
	 WeVsRBaY5HMyqHQlGhTcRWo3Mkzzi708rQotrcBgxy1kENQuuPt+O06IXX2oDyYz1nTqL
	 doyzvnSrRtqXDIXd+cQNHNZ5WdLtVzedqVc1gOnCk0GomP6SMyPX8RM8vMERZ3qRccg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TptoXtOZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fQL1zCXG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E990C606A322
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E990C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TptoXtOZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fQL1zCXG
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAelX423530
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OvJdcLneWcdAZrlX+pjCRCZqVtPdNXDbzbSNDdyEqno=; b=TptoXtOZfVkvyWO7
	wT945Yf7V6tV7xhvIzg9p6o9dvNMIU0Je43wh4tEWOslhJ01HL4PKn2SV1PkclKV
	xa8VvtWSnHlG2zNL+AB2ugXA10GJEc2jdtkkvvRMg+XmcGwQl1Phr9MXOXftv3Il
	IBGf/uGcS2Axo+XQaOfPX71j6XsdH4IU4ZXEJEFvC8ZSHfug3obAU8BH2yUmOba8
	cH7VktgX8Ir5dNGmSkZMxvhWciKRpE3Bffb0ME/J6Aa4HtKJLtRhFE++5RVRCONZ
	6n8lhZl5PT0rsQzebFjsaoHXCVmQRXkGgVq36d0Hp3wWo41tsfobHNzIQVugInTh
	WGXDDw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp1rpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:07:49 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988bc0ef0easo265080241.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793203669; x=1793808469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OvJdcLneWcdAZrlX+pjCRCZqVtPdNXDbzbSNDdyEqno=;
        b=fQL1zCXGs4C0dAhnT8Otxvs9L5cl1ehTZPdbZGYIwQgjkywMMWdNpKDgFVetl3oHgV
         u+EXUGL6wlFkmhjgc6IV9Vt29iX/5z5WzEF0ZBDvn2plaflrPezYkcA+DM4whUx23F8Q
         IH7Ppu+susjbFtLiraCc5MiZ64FSYaNgfQOwdWG4shUvzW0HKsza6+PU8hfPfZUU6PAD
         4fPnxzGb67Bmu0L8U1u+QSmfcsDzMwk4JJkDR5j4tXj5Fob606aIT21fTrbKkf+HRbvr
         LkRa7yKwigUdkkTIhxjbOeZyIEcI59s7fONIORCubsLm+sKoD7f6B6CWiRYc2u7cRx1W
         8NgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203669; x=1793808469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvJdcLneWcdAZrlX+pjCRCZqVtPdNXDbzbSNDdyEqno=;
        b=rUkJa/zOLAXPnKR0YTQ/ppGfyTnkHvtkIrJNvaoHhbl9jM9eLzFjZK1yQw6jrqgid1
         nTJDycQlRGJEKpAbv4dCLrOuKwAZIud4ZlWO+yKQELzsFS4a1vcBT4UpSEeVOlru7BF8
         IxgBG2jjmQaRlFt2IHV9crvSrshaGxXwWbsEKTJXB/vujC22iQOBgNy2G0I5tNz8phfs
         bwCbWXcH/MYJj+uLtqcpIB3F4lg45mReHlzUS0eyj4B9qJGfB/nHG2o933gZUa3kPHLS
         e2mbC0MFxO6QpEJXtDa1NRd494b1nNjNthg6dLz8ioda8CKaxIlTPbxESOVY1hr3rYx8
         xrBA==
X-Forwarded-Encrypted: i=1; AKwUvByQuiONM4d5O/6vuWFLg910FdYATEFpOQSIbR/h1F2VkeuLOdTKNxVDex0NtF6dQZSn8Rn/yRLaVU+2@vger.kernel.org
X-Gm-Message-State: AFq9FYKmjIJNzE7lOIwcGQPqTMGyWpBRoBf34YwAjULh1pvC+ZAJkBGT
	uN4Vpfx7+azj9csVCRg+WBQp3ifANK97NVRX0XsZndmLWUAku66YP3wug5xonBPwicMXgF01+Xl
	E46h1vOvcnhgHRogh8D6VTvhNkSxIcuVMQpkbzRiqftIRGwIlvB2vAzE0ADyjU3j3
X-Gm-Gg: AYBFou05Y1PlFp8Tn1QgxB2/FrkLz+5TRqJlCcCkZGynId4JFBSTC1DHMr5rFVeOP2i
	8f9CrlQtkn1C6J7ENKUWltg5BUPmCg+YoO5vYF9ANKgfSFOQCt65F0tetGzGCG31bYzbShGSoCI
	qaRxOgTUGq74YgK/9M54eAqkXjx6NPnDVH04/UdPKV4rlfvBHFmhpxGpys9NCViyMVx7m3hCxE0
	kkmlHtDnpuMOFUlCHBZ8Ket3oQyrj2n6EFZjHySqtkhtfdLZmoYd1Uirwwxu2/MzBjp5V7H2Jk9
	Br62P24grfXojX7fuSd2ZDfCrTQNr0vPQuTLzsR44OwnA2U1EbScnihrzA1e4JsqP3OmUXbDKGV
	5htvVwOafra6/sogWaJL8IpMxkUW4asvRr4IOVnQWEfV5Xih3LMVUnXiO8O4mOZfEgC75lbuFa7
	zLTlLcZU980oap4uEYnD0KUPwoge3Tqjfd
X-Received: by 2002:a05:6122:1351:b0:5c9:66f7:2f23 with SMTP id 71dfb90a1353d-5ec4cad0b76mr1280439e0c.2.1793203669044;
        Wed, 28 Oct 2026 09:07:49 -0700 (PDT)
X-Received: by 2002:a05:6122:1351:b0:5c9:66f7:2f23 with SMTP id 71dfb90a1353d-5ec4cad0b76mr1280418e0c.2.1793203668624;
        Wed, 28 Oct 2026 09:07:48 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:53b:4cdc:b68f:256f? ([2a05:6e02:1041:c10:53b:4cdc:b68f:256f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm27689459f8f.56.2026.10.28.09.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 09:07:47 -0700 (PDT)
Message-ID: <f054a608-730f-4415-87ef-510523a50ac5@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 17:07:46 +0100
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
Subject: Re: [PATCH] dt-bindings: thermal: Drop thermal zone node name length
 limit
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20261026094956.2323036-1-daniel.lezcano@oss.qualcomm.com>
 <20261028-worthy-prudent-cuckoo-d5ed97@quoll>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261028-worthy-prudent-cuckoo-d5ed97@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Vbw8bTlnDMpo-6CpLLUHq2n1EKAGF9QM
X-Proofpoint-ORIG-GUID: Vbw8bTlnDMpo-6CpLLUHq2n1EKAGF9QM
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae21dd5 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=vV7VIxlxivoAVXJuJQcA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NCBTYWx0ZWRfXy23O8IRUD9IR
 A2VlNHEZoILFMRFPK7d5KW+9+20Mag+/qaBBhEu8PlsJvL4Cg27UCtf9O+lLAp96DfPMGOIfmFC
 DI85pao1Qo9pQYGbDxIVfniOGIWwgsvfvq4HiL6NLXMStlxXWR+HFD4c6G/rIedvfGlAHkinv1i
 /W0xpjsYpRXyn0La8yO7Ed/WdBIdh3OKPQeOy9aLBIcJF2nUrG6IaMlWJ5uW/mWhtieYiLrtxVB
 /3z/O0u5yAHmDwoNkmtJr1EXiN0jM+RH2CITLSR3xnKCmahAzWmq4jeKA79eXakzLIciUfHs/5L
 0R8Amxi9T7sWJszrWW8v3nWsj1KQfPDpBmIkxLPwWdlRLr5ksKMu1dGam5xfylnKtl/UVoP2DfS
 4EuU9/Z7YBhd1AVeN18ojyDEu3LsKz/gm3QobYO0h1QyhH6ovpqmiLLtqRhqpe6C8YyI71hUpL+
 D8PjDg6B4+N6WXwTStw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NCBTYWx0ZWRfX1tuANR0p9K9W
 fvga1W6kiFCM4ZZEiy4BqfCmIj5ZkvE+VPBZfLEAKxM/iF9p/aKk5khwuZJzaC0id0EwW+I2Lac
 X8KqTvvgSTBJ8z/DlOXzGfIg78S2pbA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280064

On 10/28/26 14:00, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 10:49:56AM +0100, Daniel Lezcano wrote:
>> Device Tree bindings describe hardware and must remain OS-agnostic.
> 
> DTS describes hardware. Bindings describe the ABI between hardware and
> software, so if SW requires something regarding the DTS, should be
> placed in the binding as well, IMO.
That's odd, if the Linux kernel changes the thermal zone name length to 
something else, then that impacts the bindings, no ?

I don't see a good reason why the node name must be limited by Linux.
