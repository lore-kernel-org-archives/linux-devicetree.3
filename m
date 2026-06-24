Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DFF17A300
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307691; cv=none; b=j4YrklOTpzJoh7+rbYggolMQf/KP7wuPE/NLXynFp6PMELyvyL1nxL0+hOTUnC9xFZpJ3h5EiNmui2O6ZL9u6fabqX+0DJrUqBEOjUlem+GL3mhP0/E5DQWCMZw8bvk09pw7jUkyr7Wb6bHoa4jtK/nPVgKznEcheM9ZRi61xI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307691; c=relaxed/simple;
	bh=IYaiqSwkKhKq2oKq6noG5azMdI22xDjR53P6dIK4/TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwK4ZVpyPs8yDltrOvv7HD/Evd2xW1wYk/EH43/N8lzTx4/WRT6XXZZQN702sVW30PUuvAf/Atzc7iXjYofTxxckFLMo07v5imvpgfzEC0GyPdyL1keHqDk4Oo6grNpSp8ZYy/CQvfsHoxZamBexkwMk+ex2kxoAJ6/mkssa2WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBbDXkoc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RVt0ix+O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBbDXkoc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RVt0ix+O"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OAOU6M4182003
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cE5e32Jq9K4Qp/o2vpwbsBEqdWa2a4rwdZ6gyyitcTo=; b=iBbDXkocA62hP9V7
	NbHB4LoFdsZiL2otz5aw3jzwrXx36qQLZWf7/vqCY2x8+EXDDjspyiW0lzLq2L01
	qNSr85lYtheKTlkoJtUG+w3EzA7m6cfsmzulBKT2E5LmCqdrgH4An3LKSyP66mtT
	WkyAzW5uyKBlbeXGzIG6s9lljBO168d4nYdQOPT65UjWBoExCYDVOmj3ZzJXjhd5
	o6uAbLx74k8Zt872yfh+XavqcKECFWsHcbWTw9awIb+E/jWYgjAkEXzTbBTiHBiy
	Yv5LyOxJqzMm5kaod/XTqQrkm+Wd06p4uZVB3OIIR+FZ9zfT6edBhphdVHYrb0ZF
	1VP3hA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0aqp9dpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:28:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8dda2dc6790so3356056d6.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 06:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782307688; x=1782912488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cE5e32Jq9K4Qp/o2vpwbsBEqdWa2a4rwdZ6gyyitcTo=;
        b=RVt0ix+OZcWaCe3fXWaieRkbjo2UHON1EfwV62nv8hj6ZipnGqHd4n3qhdEDtjLn9U
         Z6mz1BITfVI7PZCNDddL58TzjNKmS6jAHceA81QXiNIaP5nBwP+yfLinEKvnTvnRl0Yx
         tK8BfCNFhgq8noHnoLKrZkqeTs+GCtmKgUYvCQU3vo5oS2cSoX+65CTwjh4A26PSB2h/
         L9TPM1Hi8dFt18CpnKKkwmt/CDVuNz6txXakbegpfCYQPzhBHaw4FeWFs5kELD+ZQEc+
         QCEm6hggOeimdRQCPac/+mAxpevCu/Y04brosC0iMIUCJQVWMIg88yWUfZkktRBpnZA3
         m+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307688; x=1782912488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cE5e32Jq9K4Qp/o2vpwbsBEqdWa2a4rwdZ6gyyitcTo=;
        b=TYj6I82DIGKGJBfPFPIhwn+TKPlcXC6cFRglPshmdYPbpaxnDMTOTrscrpoSgB6V1O
         Gzwjg8GW9ersZUxuFB/VYptJmpiJXuoLWtJxvQ4j9+RWa615Jm/sWRn6AkAcB+yE9FeO
         mxIRb4LVTK/MnbOiyw6b4DUnEzWG1/2c9ZRZr0EacOA6kQ5sJKwVpJ1OX3y4YNKO+iR9
         mx2MAWjE3aF3p+tgAD+4IxxizJAO1VicCTRs1Xx71u67By4lYeR4RoJLCMKaht/RkR04
         18sxm78gvbkVDiYb1duCsV1iig+hCnVls5pbayxtTW7a/LxuA3tHVjY5B4AfbUq17+NC
         3Zgw==
X-Forwarded-Encrypted: i=1; AFNElJ/taOtf8oUdMFCcBUZwnoIcVuOIHkGoMUWeVt4/8eltm2ON20/fuLHzLax2eV/gymhwb2KE14j/rxXH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ovslJ6IMwh2e4WF3a+/OD52KJ836OjplD4n3WhrG9tlk/sWT
	yOXSRfEc5lSx0rDPaTibS1skMVhyP1ObKs5i5VG73XqxRkylUqElgU7l7KBMoNZVw/ST53tc42F
	+a4zBhGZ2X7HzV7H9NRgTBH7TmjCOS8Tf5pB+Y2wCrgyL84NGQzn5XGHXDp5c06/1Ol0GEthz
X-Gm-Gg: AfdE7cmxytDIsPrnSPq4j8tghY6H2qHOvcMPh6cJT5gdqqvqMSgtV58L9g3MmA0s6d+
	InA9ELz+BaXYDj8TQqKKQxroRsNUDvf9AWDcXVmzITQMp3XRORx6KPIyx2qm8rFOYgvdpqsycuy
	ndQVkNm5UXVoFPZBFW/X44RZGReBYuuUS5iGZsmc+GdQ/kq8NyQRUQXrYE0F9yvR6B//wNwC9iU
	8K/Rn44jNp9gXRtjk8DS5q31JAkrVRNRffZgV+EUOiEcVo6od4qwUb0tMck3HFs7hsaJffEbmxT
	HcLw0BgkCGWkJ0mkMaJesCKhs9xoAbY0iQaiEzLn0q5N7EK7gGLOnWWV55eWgsLQXU5MOLOyRoP
	vCm1J5+S6QHKbbgEjjT8SXVg22gMRvANUKLc=
X-Received: by 2002:a05:620a:3185:b0:915:8197:4490 with SMTP id af79cd13be357-925c95b2466mr942762785a.4.1782307687814;
        Wed, 24 Jun 2026 06:28:07 -0700 (PDT)
X-Received: by 2002:a05:620a:3185:b0:915:8197:4490 with SMTP id af79cd13be357-925c95b2466mr942759185a.4.1782307687275;
        Wed, 24 Jun 2026 06:28:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac7c1bsm661168166b.33.2026.06.24.06.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:28:06 -0700 (PDT)
Message-ID: <53cade89-1fc4-4ba7-aa7b-815b9e26d88b@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 15:28:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
To: Esteban Urrutia <esteuwu@proton.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
 <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
 <6123a923-21dd-4f69-9ac5-02165963027c@oss.qualcomm.com>
 <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RabWpfacloLldGyqoF6COYR-TMno-49C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDExMSBTYWx0ZWRfXyUL1V23XIbFC
 ysPf4bw6h2R5zqWj8T+6tNgPTYiOLMqlPDG6yA7yAnOm9wpc1MapBc66ze92DTMZ5LztSwz4h32
 +2zLePNJUCTMfZToLp/9e+wgR+ixaube/UxZBkk6af+xz0It3AtKjqGZvPUP4rbiS1TQf746bUV
 pzSoNalDgJGIXKY2ZF2vRRfPot3INgdNyztLUTJ2rlnITuq8zK7clmFeL1WxDcjgE9Nb/YDEhb2
 vsIzFDLZbzYrBPyxa3nwmfYXC0QEFSAINpLCX3kOpw5Yr/XDudp8Kh4V6okZpf15xpoc0Sw7PUi
 QhEKsQ4IHXkjZn3LJ5E68TkpzWLlCA2d3vRRBiy5YT96MRvDesiiVcDghHboR/3H1PwDDebwMPi
 7D9K/pxKW3+Z1l1aPaEITuFjTTL0nw==
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=6a3bdb68 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=oK1bmnR47wnCuWhRGskA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDExMSBTYWx0ZWRfX/fyX/aVYKA6W
 UYOn0vWqg4kzMyf25vuJ+SDQfHs8F96j7rNgzzMgmvQOfvPaWqtkE78y/Oqflw9G0UnAnP31iH4
 lKhTJ2Qw3LnzM7CBKRGDbj+SCsdSiyo=
X-Proofpoint-GUID: RabWpfacloLldGyqoF6COYR-TMno-49C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240111

On 6/24/26 3:26 PM, Esteban Urrutia wrote:
> 
> 
> On 6/23/26 7:03 AM, Konrad Dybcio wrote:
>>> This is mentioned in the memory map description, but is not part
>>> of it.
>>>
>>> I booted up a 8450 HDK and it doesn't even have MTE, so it's
>>> probably valid
>>
>> i.e. it doesn't report MTE to Linux. I don't know if it's Gunyah
>> trapping it.
> Then, should device trees delete these memory regions on a case-by-case
> basis, or be left as is?

I'd delete it and reintroduce as necessary

Konrad
