Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758656;
	b=YPPu+lWQy5sfN9lc+9Agx1PshptNlaxgpYnrMMeP4Aqd+8zPuzeAix7o8h0Ypae5mXx9
	 uK++FTD0NAUZqFk9/GHgz72KSSqYHElW6hR130LA05yvORor/xjD3V6+o0hTE7wzCTQ5h
	 7+vo6eP8jQq2QWXVKXcIerjKhxYW2JfNxVF7edVaFowd5FIk144ZXw49J1l2jYtPo0HFa
	 Gqq/vWdXVXVSLsTG084w+fi+Tfrd8j2exBt97CN2dITgF8RjPJnEaelzrgU77DPGgGB/m
	 iPCMRA3+DMZ9tJFweTFnzxQaQB7xumXLuUKPBWfibaHwoEq2p3VrfC6yv9SOu/zMSwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758656;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eJerYATXc5Ofmp19lEAv8MyKqAGNtX5c18EGoX1GCog=;
	b=k5K/Mn4ByaZaIZK2IHT1AIm1J6L5eK9zFRVIWgjwetIeIRx5Go9mplrFNp/S8dakt62p
	 29XOIZ0E+dAgsz6N4JJLrg5EEBR2CxHXLUcsXM4CZY8VENg7K3S1I4e/R6nBWNR2pjpJI
	 VRI2AEQy2By9pTwdDCOXppSgExOXCXj/BA1Rw13CZhhUkefa9WTux7ZvvTsiCOWM/VO9s
	 VoLc57K6O0zwOvC/LRAaoIV4XlhTQJx9+EDINCVTO24gY7bPK8SggsV5BpvDi4L56uZYx
	 +BTsEJL61p+xmIJwId2KnutZZPV9WlHeYrN1gC0y9SUC8zJR0vWGMEzFV4zP1yCIY+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n7ZDfs5B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3KqsHv8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC5D606A326
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BC5D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n7ZDfs5B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3KqsHv8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAASEs3550496
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eJerYATXc5Ofmp19lEAv8MyKqAGNtX5c18EGoX1GCog=; b=n7ZDfs5BA9A8bQpY
	E1H2S/nbo2cvfF169cWF65Aol1lDcXjjU5WExuNarNWGPsT3JlaYWJ8dWgr7aGM9
	OLYZ6m58ai5BJEuRH6jVzggtVa9rEJcGnh2OQB0wlKUi0VQTkYOjyOl2lqixbDyW
	NVWte2fq9us5Ri9hYX4Sat0Pz6IrHel/OZ6uIuHxtnmEi5D4ubyOHss09NEQF/Sn
	Y+04LVcwpil4NHqnuIXSUHqjRMk0Gp/ImrIpWYQXhGohcYACfPP7EZYaa2cTzbId
	ktJUF/3ePHtvRqCUVzcf7FlgvB/VVlT2SKAj1As2OnMJLm7cyB1WSPCAa6c9/f+o
	vlTt1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrbmrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:30:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cac495d99so16013785a.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 05:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792758654; x=1793363454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJerYATXc5Ofmp19lEAv8MyKqAGNtX5c18EGoX1GCog=;
        b=B3KqsHv8hhsMLLwiizISjoTh+hZ/tOA6Mnw/w8KSaKl132gdW688NP8EbWZgdwHBI+
         MOlllJmX2deUvD7NTFa4Uuik5lhUSKda1l2Q/cLWcXgUKDhrOZsmv6X/kbfaGp4JATR/
         6wa8DnnUzg+hEMK8z4hCbo+0feeFXTnBC6wCK2qoUkgDYaPvgha92wAGAPu6bCLB4eSc
         fBUBeOe8isL9hqLvb6HpybscWaIaA8PCOVPEN3O5XXYKU+Fhjf0rwf5X0YZloBkvSooj
         CMS3D/Eyvbn/PWcSXrDd2CRLCUupF1veG1I32mYNNYWJrYdAH80GkhhJDz8OfPfqiatK
         i+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758654; x=1793363454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eJerYATXc5Ofmp19lEAv8MyKqAGNtX5c18EGoX1GCog=;
        b=DLNzbF9NU9WhY1hHWgumKLhFqGn3TS/w/KtTZEBigvcAVeFGlCZnjOpdTwdwh0NNUM
         EBT163eMU4qi/6+kToPgTg8p/2BhR+QYuvtreUlx5Kc/L92iS9oCxs9X+sj/CZqRVA4T
         ibGltCSM2fj5kcBGLrzDr2t9alzlwNBq6ivbbFb2YnITxLWC5vuDZtUERt3QBIirZnyh
         hSfPuq+f9Sp6qgyEl4OLDjegLM5RZIBTzoZ3u4uyDj6yCyrX6XwAsfrswfnmvjY93o/N
         Ehl6JHcwxbMZ92QSCw4eSpkbmGDtiAxa9rrltjf6YjxtEZ+wHE7iKepGJmvxZq6wFXf9
         Il0A==
X-Forwarded-Encrypted: i=1; AKwUvBy8dyz2tHpHZ7XctlgB3l9TDWUGxY2/ZtAoMW2Sz7xUIQuh/GeRqkgXFmInM5rcQEo8t8uCxJcQGmVT@vger.kernel.org
X-Gm-Message-State: AFq9FYIz6heS+lngoCEQhVnFgbN+2sb1XYkJ7rM7R6YrpmT25UHVz4Em
	EGQddJzw2dtjCoWtxVMlI7SX4cwMa29Yl4JVkBrTfvdghmSs4ywP3+7/Schi+kKXy0hcfUGf8Ov
	AFvFm7M3b+PVz2qb98reAjVTL5y4Y72cznb9i88GDDmaCgOvz2K7ENWC2S/Hp93hX
X-Gm-Gg: AYBFou1V4qo3SSF4qIpLaskwTpvtBL9+RlwJoMuckNcMGIjR9vFH7VWHol9sEIApM7I
	tjB3dtLcsarj4Jc4NoCEcXUvJ8KDZ18REdCt1xSm9yopaHVBuSaD/EftVGfKmt9GYtmQtZMkecL
	yfef1QuL53kmKMguD74x98EigaRLfLxJx+Ps6nIFej7KpA7XDNoGb5UrsTavUNJPXWidwJAh0Bb
	p0l7B9pK+b1UvAVP3CEJpOSaHYvQEXpX1QzajOzp9Wmuca7XdxUeOZ7l91Qczar13kAZU6CaPJc
	yPa1CHISxXW4j6A7Blc8eWXSE+Fp/7lLlwnqR+cFrtaX/KYUGYmAMGrR/RUV4BGAH57euNIZ1XK
	rNKluY4RlTaBBLtX+FnKu4A==
X-Received: by 2002:a05:620a:a0db:20b0:939:9205:4d78 with SMTP id af79cd13be357-93f6f8ea8fcmr359356885a.3.1792758650303;
        Fri, 23 Oct 2026 05:30:50 -0700 (PDT)
X-Received: by 2002:a05:620a:a0db:20b0:939:9205:4d78 with SMTP id af79cd13be357-93f6f8ea8fcmr359323485a.3.1792758647587;
        Fri, 23 Oct 2026 05:30:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cbeafcsm95025966b.62.2026.10.23.05.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:30:46 -0700 (PDT)
Message-ID: <bc06957e-56fa-4738-888a-02723efa3ecd@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:30:44 +0200
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
Subject: Re: [PATCH 2/3] arm64: dts: qcom: lemans: make the emac compatible
 specific to the embedded variant
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-2-a34d778ce9ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-sa8255p-emac-dts-v1-2-a34d778ce9ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lZ84eg6ydCD_GEVFbvDWWtNcSfHV-jH6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0OCBTYWx0ZWRfX8wFMD6Qsv2+k
 kuOD4sEsbP0t1PsKrKC2CRaWJ3eLlwu1EaEufYUktWt/ArCpcwxMW/Cy+aih75tEhZ7/Z961aVO
 4B3h5Dql3ZnIL/zf5SO3x8jw6Ea+rgQ=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb537f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=tUKzjj2clC97W38UOGYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0OCBTYWx0ZWRfXxIXVGd1Z0aQM
 RLBqZBKMw7+EPNmjsri75gSJMXvcCXXDKLupD7apBrOdVmrGDvAehfkxNon1ALrNoY4021nekGz
 T7WCkpkwK716XTYIRKlJtYDnP8uhcIQpCq9+ZhlkCiDgZUgHlryhDkz28SikoJmag2cygQEdF/e
 Og8y5QRL/HSPdt1tHnLQgnQR4d5VxogztroiSERN1wpvOK/CNUnrs5vJQ9uVeLKi2+Nd2gpCac/
 VUuXdQnPI0C26FSokjZlJa9OO98igLuPYZlnDBgkX4XghcIM7K06VI6y2zhhuUgQ7arC+jczJZ6
 xF6Sic2dv/Tk4nHcdJrI+3MTi/U8i+7BjYAsH01osZXS9DmkCa81OpYCAXoB3WpWHX2lyCEjSjV
 7LZ5fEOf92oH/yAC1txQt8iss8Njnjwz4+vTW3tXzVQSOgDXuVszeHPFSR3tOSZkhYpbN37Tsl+
 D1ODJG88sGKz1zSfxqQ==
X-Proofpoint-ORIG-GUID: lZ84eg6ydCD_GEVFbvDWWtNcSfHV-jH6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230048

On 10/23/26 11:02 AM, Bartosz Golaszewski wrote:
> The embedded and gearvm variants of the ethernet MAC use different
> compatibles so move the one for sa8775p into lemans-embedded.dtsi and
> make place for the gearvm variant to be placed in lemans-gearvm.dtsi.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
