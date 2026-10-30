Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364667;
	b=pLMigK6TrvMTxxGj4cYGyLc4rhoJ+U1LKFGd3egx3vyHZ9vFPDRuvhhC2dG0L4kIIOF9
	 VB3PnxpZVGhuyqOgyU+9x6FDZNfmeELpIP2wuJhTCZFnLKlW6Pg1XHQkRG78zPMeOmlQB
	 060CuayE1MFp8TnvVbvD0VkBoq4ivsnUZDZd2kfLEPv2Pzk0zFt/5mF1ATFS8IoH5z7q9
	 2O+ZjgkqMn3BClOkiPiAC65LR13LxNn/biT++XUOtB/6K9Zv3UvTre8EwRyRyUiuWiAnx
	 99ujVIJwg8/0XQTSP8T1MHARc6Ih3jMwz7D8sx4bNw49+oTxbxuxhH6aG+aSwuzev9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364667;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XphpQpFJsEj2QqhW36aSkIT3Y00nbckxn13CU38V6to=;
	b=BmIOohiA4OzhqbtfnIOS1nqMIS7uMfUhJH6cm97mFbq4ZXaioeuyrYHxhlXrERLxBJrx
	 yi0gMpkrJNULoUj9i7eMxWbwpZ3D4C45Ec0PATqpV0BwikGqwApYcHg+lky2hHSxeMimS
	 3UnAdUUaoZbN0ykVU3/nOmBiDmEOV1EcXzJ4lIqERose7gZ2PtCk74TCg2h0ohZtk2Qxa
	 FM57+3Peh0Kf/eT9cdhP6JhZFnrYDvOHaV0RVS7VpkOsIGmcJlwfq0vU8TzLTgSauCx/o
	 GZAxNqm1TZkN6louL6vlckaV88AC3AMiOStfbNHH2MRUfUEZFNqwK7/xyJywKrw+mKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUl0A3x+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZSpqk4UO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82567606A321
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82567606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUl0A3x+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZSpqk4UO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGNOI3130313
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XphpQpFJsEj2QqhW36aSkIT3Y00nbckxn13CU38V6to=; b=nUl0A3x+80g2PDHd
	YSi3RtvkUmndK/cWEi6mFBgVt2+sgpGUi8wxOqJNpJTUl88fXpS8UKnxLqWyzpku
	NF8G4AZ8srlzBAmizvsDxaM0k9KJei0QiZXxZSGtSNJX3ALvHriMIxONoO1NITAo
	dQ+aHcDPMGscUY3jEM8+rqWr7/6Odd5DAyDgJl4eB76MEmu3MnC+xtn7njoBhAem
	c4R3Uy+DKAkAY0DCQSqYsRXc2yHGZvJnQbHv7+bO3F4xf5UL/Mifk+Y/dEgnoslO
	s3gZjhk1sJR/gBhP2znsOGsi32d9AfAQGD3iqUXiW6UXP6k/0O5K7nlWgp3ag/Nh
	MMV1zQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk1hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:51:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso14844085a.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364665; x=1793969465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XphpQpFJsEj2QqhW36aSkIT3Y00nbckxn13CU38V6to=;
        b=ZSpqk4UOjmuRfkVfmxjiNernb5Jffau3mWzsjSdi+FoK0168afTXSpU6pFFGmhpbkd
         2/pgz2hV22xzgWo18MCrzgO7Jfp0wqcvHa3bv4Kvr8BNBOSR5aT5cNksXsS5TlOadcNV
         MnpGFdWu2e/uitKA87xJKz/pbx7lfGnpYAKo9PKbEmd+iXjnemL+FvL0qOe4USLkVwoB
         9A3bIjeMU2tDrnma/Tchf+2qg/hdiL8fqGfq2UBbrx6EF6NYFQ9Bp1Di2pI8Wae1L10/
         c8amOZefKKgl+yjZS/Y3FCatYNr3qhdtWWCu7NZ4g1ZMGwFd8pwvwIQESf/H+rkpNNsP
         vy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364665; x=1793969465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XphpQpFJsEj2QqhW36aSkIT3Y00nbckxn13CU38V6to=;
        b=AMFU4f22VUgP1uzeWGQEE1y9VdEuKTYS78qbGgUwr5UPcuFFT5h9btOhZEsHFVN6rr
         WUcW70SeeXfiEcrMtEPPt52o6nv4FZTyZY+nXYXwAhMNjng/5hNmqJ28CO9/wQxsNOhr
         vjBTrIEq+kNXCgPwsJpUgIOHOKzrEtzaVNCBRpSn9X8zUfYjKo2TY5o3Wv2wEU6HiCpW
         cDfvZYwok0QLCnipFU9h9jew8MhcQrPu2wKNq5CsC1WXf1c7sC2Sgusm/sdLG6ToKVT0
         QN2B6hwoHhYD3+eOyzAckjlScyhvamgVik8xgBWm0V1j6eGFAR+Qvqhm40/5BxjIxZGB
         SA6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxi/5EEzMcxtW6ZQJnP3N/D1893+KjMonoLt7XxSgvKVDb15bm3fXkdR3ct4lTCuNRHIGR7HzF3bIzh@vger.kernel.org
X-Gm-Message-State: AFq9FYJGxhrD5Hi6bYuz+lXFqGaOFNUDJmOl9UPTy60oc1gZaP1ATuK4
	GMQ2gm7jLODwthUvTOUP4CUkKmmf9PUXaOJFHL6dsP4Dpd0LyPV4+xpWcx7qo8pKiNOAygij6Qf
	mqqhzFaOf9Z7Uwc1Mw8BsmsC+EceDCwjIX20gpxU/3hahXDvWuCyRFNisZZBLZMGJ
X-Gm-Gg: AYBFou392/bdl7K45ElIT/DLBV89eLo6xEh5+V+xfwfL397xmqqNUk3iZJfEwEIKz73
	BqqJ4bKVVmplw+icfEWlEkkPF50R7tK3Coj0N9rPMhrh0UDQkmvmrnR2rXDpv9FCjTN0WQhX8V5
	5Rs/JVUEoUuvflPvCoBmxI9XabYCihd1695K1iMFYNAPMmUPj9yQ79PEFzKt/09XuoWFvA1B7um
	gtI1tGdvjPfyaKFEm+trFctKUXrRmf2wpPpr9gCXfEN64mreV9+cf0YqtqbKkepqXkemC/gTCDG
	rcnQ5dkMsOeRLn3GJb/mfiYI9N3idsrKEiF5BfTAjleGnIqdUvRP7gn3VKoqxC+q/uW4wUB6I01
	8tvFIXGPGITGo8lBONGaPGwK2CPz0twalKzOUToDn7Nv7kwHFvgpzf4enoeWAiU3eZDHbEpY=
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr347960085a.4.1793364664824;
        Fri, 30 Oct 2026 05:51:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr347955885a.4.1793364664241;
        Fri, 30 Oct 2026 05:51:04 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe5006dsm60694766b.64.2026.10.30.05.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:51:03 -0700 (PDT)
Message-ID: <4e578d56-f865-41f7-9189-7ac15f7a835d@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:51:02 +0100
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
Subject: Re: [PATCH 4/5] arm64: dts: qcom: milos-nothing-asteroids: Enable IPA
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
 <20261029-asteroids-dts-updates-v1-4-79351337d681@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-asteroids-dts-updates-v1-4-79351337d681@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _TkqcLWrr1RLcEKi73cxpWizpfkbOdex
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX3RC+GsdOVANh
 599/TJVHrShwJ/30aND/EeHIwWnqPSC7OKaLMHdldWyI4RW1Eu517QMmEoDIvWPsxQfyq9g06/A
 x8Iy3fEQIXi/n7NczGQKLNPOeeQcauA=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae492b9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=dMdhFRwUw7ASlwpx6HcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _TkqcLWrr1RLcEKi73cxpWizpfkbOdex
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX4X5sv0UaRFUf
 /qpoh8peLldzu9g0hBlKgX7fEQ++d2cT3Q7i0MCY2AgcvmXcxFTrZPwmMbWl9gE6cfr1tYbbfQc
 qDRr/6Vi1YSGdD1CkZP6dpFef2vYXkkfjQijZqUERTnsGhP40NJ22SXMoLUM7T7VdIejNgVPpWk
 q5Wixvj9bRv5I8qbugPnMKNxgkZXZNe81zyS9ZtUvAKUSN8cFUviGjM+UZmhaeiDW/t+ysvCP6v
 pQuNhmlyo6c8xHWkRTo+NbmY+RTtlYT6Mri8bOZ+NHhP7XKkCslpKtxUlKBumyp8lrU24XdSrUx
 QR7b8ngF43q3zl174ttt6Ko4QJmT19grcd2a/RfiqQocB29cX8Fn55QSpCOAgrHHWyk5QNj7qDp
 sW2jWl/Fm3xGlSrQUiBumr+6XFKV/QiENLpiM3S6uNhFGNsvmXGBsvXdnb1PJHnQi+X28xEF479
 med70+rA6iGTketeg4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300051

On 10/29/26 11:33 PM, Alexander Koskovich wrote:
> Configure and enable the node for IPA which enables mobile data on this
> device.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
