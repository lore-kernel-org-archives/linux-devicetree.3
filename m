Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9E4378D8D
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782125511; cv=none; b=potiaHy1JXms0o0lv3X/phtlrzJ2u0z9o+Kl4ID7FQjISlxU4Lcr+nqNwQh3c96wSMH7fqdqQ2tDwwrHJYA3b3J7doLb0ZammmkrgR/6nf/u5m/AxGUDXFDNXJ9qF0UAnaXF1GWJjVNinKc0/xBBZeQu8qpYuO3K01vXBnt4dks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782125511; c=relaxed/simple;
	bh=VaTOs4+4dswaW+DNkYBuLLXmhZgxYKZKmrPqfCpTn9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s9JulSJ1vFa5mKctrpHHecqVZIghMc1oTT0AAunr9rnzGJL/3Evk7GuEIlacXPqVHef5LRiZYtXqF0zBRD8K5rxEUOCcekdE+Em/pvMpO0J/Kg58tX0H4C54iwmYniuxWKgD2PqqqJcXtQVYDim9nxk3cUmV4MdWdxLJCOl0eoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2FqgVmA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZFV0yQS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2FqgVmA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZFV0yQS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAn15O472484
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 10:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRWuT4a/W1vHiP4VCpkpuuEyUOBb8v5GbViwADDHBes=; b=e2FqgVmA5bq24dvf
	+1jGU+x1GyYipkuo0cy56ZQ644oRopGsax8AyF29bFkeHBqE9w1+qlI2c0EmxZK0
	PFNapeE3iKIlKfi8wy/m9LZSE55jKci8vOo4R2rq+/TwtgkPxCyJ97J99xflP7WO
	m04BUSmmw5NR18F4xBFNZbljZNZZQvqEF2PGuZyTyEyRFRY5fPjCa1zjlUvswQQ7
	RgzgoCUyRy6PF1bx6AwSXj6+vbYs8KQp83trV9lDuvjIWneUczrKfvK8Aey4RPHQ
	0gQ98PWEkoHzIiJwSVk6hL7JXvMoT07aaWkLjYIbyrCeAxJ2Bn6ED2fktu936agE
	20lSCA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3cq026j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 10:51:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8d37bc61dc2so13475256d6.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 03:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782125508; x=1782730308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GRWuT4a/W1vHiP4VCpkpuuEyUOBb8v5GbViwADDHBes=;
        b=PZFV0yQShfxhLmiV7+sD9tQTJgostlvZtVPqTAyQCD+2glXSIS1M85KaGAkophZOHq
         QjMdYOx7HRKDIsK80Kcldk1fOY6oY5d5GfjgAT6WvQXgrxiSGeAyL7s6PlbikkYQg5x0
         4Bk38PwFSpmqXR2YWvtDJpwE2OIP8SVaHJ7SVq2o5tT7vF5PzlKQcQDCbDHz5OURhcsM
         ADGbAnMp57LLJvqJnd0V1ZpLmFaRGOCTiI3hZGUi01tLaUPFI1KBzHmxjn1Apks+EdRm
         FK6UdFIFDQTGgIjthpMmJclxArtykqvBZjTTQC7CQstv1Am6L2hPg2gx6kMiaXfN8fJS
         4pXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782125508; x=1782730308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRWuT4a/W1vHiP4VCpkpuuEyUOBb8v5GbViwADDHBes=;
        b=Xiq9jZCvOlU6gLAW6+ht6OjW8nhF8ezlbC5erQ8fCSXEvWQDqNSRJzKgGlmox40Vzv
         kYK8JHN7k+3+UPXaN6d+i/PR2ggv+UQvxDbUEYEhRcQANm4RkLJhx1LBE+XoAjF7fUgV
         JnQSEQU5XP0TtTzesX/KY7amji5FABld2XU6s+fZQgsrztBOgY9Wi2z6r1IdGbceAKZS
         8sAtl0RYrtg8bdo4XpxWej4jMbjSGI/C+Y+++jE6A8xs7baWhoxo4A4APKWKJNDyiALb
         nWRoiAeoN3Yq8S17S8DsMQJElCM8iP7q6WITUmQlgs+UpT1dFpp7Izn81VBLmJe1kon0
         6eYw==
X-Forwarded-Encrypted: i=1; AHgh+Rqm/6PlVaMnsUuVI7CbnVsHvdr/Il5ZJHx1LaaZFfgXJ3i0B2duR5HObgdICGdwwZy+nt6Mgp6mlmoZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnz+duTZjI5g+HcBxVmzS0ctvcIaxOh7Oz695caoZP9K8TVhL2
	3PAQyxG4E6vcyKP5v9CW9145aqusjBmLEE0TuPW2K0RvL6IkbtMUGJNtRiP8cM1ZHZZf2A5D2Rt
	0hpwYK6Bm5JMnXkcYMzCBUADGTzFItUf6hPYqKVamftu54OZ2oHrmEeAkWgTPU3m7
X-Gm-Gg: AfdE7ckNBPqs/EsnCayPSYDQoAP6soTdXjIyIsv1f3dU1dq2ojWdpHT0AUrltBkwtTY
	ymBFpWWC5CeGpeLtxAYpHU/MJzYVjFVWMSSCNMtHHkx8S/Qp06+KBF5ieuIF7fjjhVMgex6iSS3
	XLYjPgOToFyttlme0MPh2cxHoVNIN+29WiMDGk/Ae011O9CxejUh5jLqzxP18zh2PAih3yS9LKQ
	jTnmrEWUL9spkJ0OHop8as2/y/XS6iXLERTfc03QwGtxlPyF4bJpiD7q1VMeGUdPG62a+PRgK7q
	VEm83EyRT6rcd8mim/UclbMrGjF0RpjgRcL6yrUXW3DMSvUZY0YdhESXXgxLWBLhGJG0gXH8XD+
	Q/XBQGH7NEFBAueqE2tIA+p3F4un2nyMl4vs=
X-Received: by 2002:a05:6214:390d:b0:8ce:ddd7:39a8 with SMTP id 6a1803df08f44-8df4837bc2emr116348286d6.5.1782125507669;
        Mon, 22 Jun 2026 03:51:47 -0700 (PDT)
X-Received: by 2002:a05:6214:390d:b0:8ce:ddd7:39a8 with SMTP id 6a1803df08f44-8df4837bc2emr116348116d6.5.1782125507321;
        Mon, 22 Jun 2026 03:51:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be31c73sm3009575a12.17.2026.06.22.03.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 03:51:45 -0700 (PDT)
Message-ID: <6300a2c1-fe20-4573-b65e-cb1ecf3d09b9@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 12:51:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] interconnect: qcom: add Maili interconnect
 provider driver
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260622-maili_icc-v2-0-18b5ac08c04f@oss.qualcomm.com>
 <20260622-maili_icc-v2-2-18b5ac08c04f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-maili_icc-v2-2-18b5ac08c04f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ycWt3IjHiVVJbV9a5b2EyDHblFrFsZCN
X-Authority-Analysis: v=2.4 cv=VKXtWdPX c=1 sm=1 tr=0 ts=6a3913c4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=C4gMAf1nVfw50XILYHAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: ycWt3IjHiVVJbV9a5b2EyDHblFrFsZCN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEwNyBTYWx0ZWRfX0ciWnc0EOHog
 3uRD4qyQAc5KbpjrEgXh6EKePuQxLeWCy3Wa53Ng5eFVXWOI0lvhbJ6q1mEWZnDrNTplL2mJzuU
 SlzNmDF/UTnWzLNZOmKP1LordH9fGeLicV4eeXsnEpGIlSaDnjfEnGHNM+5Kcd5EqB6VWMpRZNf
 hMdvHWVS4ggB0L0QayKcGJxSU/6pp2khyBwcwzW4q/GMGuZbv7KtcKuKlge7Q5VBegbF24L8f6X
 PxczWYS10r+OlLD0+WWmc7Bz08jCiS+H2LbvIvrRcN24atORRUS/pDMrl48AyF6hVYEczNgWs+C
 6w+K1+D5hYbHq+fuqD7K9Somd/XSbBz1FBdFRGI1UbyOA9MXJgh3da41ecQaWjtt7ZfQhD6bUur
 yXbJLgo4mKK+uOVMEGv45gn02F6CVwnMXx2k3vnaIWB+TXkwkrpJGBpwQuSk8sH9jmFTDAz6oHW
 +SWY73gjB6Mvtk/QQNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEwNyBTYWx0ZWRfX+FHV2pfM3KOX
 Z2fm7/8defhPsbY0Shrnwq70eLv4mJMNoa1bzqEG/0H94Y8wvbTBs9tSQr/tr0v7nt051uOqAyy
 uUGvLOOfaxGB2f8jTy51Rge0iRuwjFA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220107

On 6/22/26 8:34 AM, Raviteja Laggyshetty wrote:
> Add driver for the Qualcomm interconnect buses found in Maili
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pairs.
> 
> Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
