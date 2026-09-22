Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFD93CEB90
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092870; cv=none; b=tcMKuMQ3ADz/iXvupGZTYIC7Hxohowir2h5HXNLR0RRzCXZ6rrA8oqrT7aupB3EKeqhN/8ge4znhS0EAIjhiza1qwBVAEwOT07Yg9qQAqQYyDViI4BddOUy4wdCUkzbOn1aanP98pP9k0U1DUiu12/RGH1eXzA3tAg32gAnUky0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092870; c=relaxed/simple;
	bh=3R4gQIMPX1xyL3fLfmJonUsEWPtqtPZU5S/FIjR1Zgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJnlAqHgEANPD3HMxZFsp7J8a4lSu6xfjy+IZTz/A0/Zu6uVjjydvrTpOWPkhvYFFBqaN/jqHWA8kZpMzT6Za0h39YZPIIMrsnkx73/+b/fJ0wben/ZhxbjMYkZeyV+6cpbnGjg05qcRVZraFpqzCujX5whBEg1ZXF0JDO4LN3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVLihMX5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFyP9MYr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVLihMX5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFyP9MYr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjI4c573101
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HkqGOgoM+CRI3FMAnNK16O/uZWNi4cDR4T0D5Xqe554=; b=oVLihMX5pEmvoTDM
	MOtd91S0ChCCAQGOghu8w/ob+XVXP9TVXRvgw//nAsO6T3khbZ35jGWyeegI+5ha
	bAwVbktgMDuR5ubiHlVE1GOy69jMeliLeFmh7yyMNnw5fV6L/49tbz6w1zlrvym4
	vcKSBmwylQvTeLJQurpVIptTEJCjBNcKIaSYCBysGpiZzT/mHLl7/j3Q/v9abLj9
	TrJ8d7EpuGDkQV6kecT6XCygoBTMoGY6RBhK8Lb5L9VeJBq3OFJGTKRk7DEqKtcV
	FKZREM5S3Gs7G+71uTvfDCw0rok5FtQXdQ+hnXJ6ZIVeMWWugEl6fGpbs1xjPXYS
	vOWIpw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkjay2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:01:07 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-89220d45e10so145407b3.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092867; x=1790697667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HkqGOgoM+CRI3FMAnNK16O/uZWNi4cDR4T0D5Xqe554=;
        b=SFyP9MYrHgRh2mEdkywa84Ft7nGCYrugil/DNo/EwVX6/Hcb536sN0elm6guQGY+xB
         /hma38aUXJqyKfr30UZDyPbForEgwv2JPobFOf2Wpx5yd7WITNF21Ak6vKT7tqbzkNbn
         zaTNzCGiXGUSs/fDQARIs2uxXtkP6HA1+1qQasy3SauZvdyULBYX4+WvnXRaFhx9XlON
         IYANd4QJZkJyxYJk/+jV7NlBC7Dli2o4tq1ndA36cS/zpSBGmm9Y+230DYCXhYIHun7l
         NMKqH56EI4RrXGOJ1Qzo98GJPuJA3qmBULdstg4YkCskdUiFHLLlIVKFffjvsxpdXiCK
         yrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092867; x=1790697667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HkqGOgoM+CRI3FMAnNK16O/uZWNi4cDR4T0D5Xqe554=;
        b=h+vhcxzCOHwk4efBHDqqU0X+GkjbE+GXi6H+pCK8eGQAkTIiLVhybqCQJxQSxD4m2O
         iyRQQSMmp/ONLBYrS2yMtxqPwyWmASfIiOIATXF6PjZYLHhgCXD1d1VWZ1C1kUOQzV8D
         cKCWmgWt5S49dluBhANvloqhcqEFd076cxkaEnNGa5B1K2sw8rQKFEDZVCBu1TqjWkAC
         kKMgZ2Q3kyTEaaMaoE4AbfPG/MGQ4inizt+T2DZm0gT70+udRjmOemwPt8xIC4yoBwmt
         NLL4F9VHmaUlGniRCdJuMsRZdQfQ6NQlTAhxjFVv68tAjychVX9ieK5vXsrqU37BAws/
         Fi4A==
X-Forwarded-Encrypted: i=1; AKwUvBweillH2gwnp0rfIy/UmSa1nv9fbABoiA00Qkk3ci3BfEEi/2FaaBF6MwrJ/OiB3mJZ7KBu4KKtWt0p@vger.kernel.org
X-Gm-Message-State: AFuF++mXAHnbSA7J18Tp8jlPxhjF6kRHCHRAB0+g3aGydgkd8bHJBMOf
	gi3zGWWV1fKm3W69pvIbgKNjj50dF3ZTlWYy/2p80wqrwIprI+iiGDzO48g6w/wMzr8SVJUiHjV
	kVOSSNXDe5C0m4lBuoYCjLpRo84OrgiwB5YjK4Sqy4JtbmkqaGhuRSs4yPpi6YkGsAn3Cxud/
X-Gm-Gg: AYBFou1fsO1Ng7dS9BjNvkblGrvSjATxoxCJXB/TtDS32hydCXAld4QVu556dxFCduX
	C2m6a51Uz5YkywoXRMcs0IW71Pn6FyxyI7QmLwG1QHuE02l6aJMpoYUUIdp2TWvRlsaJ/NpTc9R
	X0ngr83OnoyycToYl3idBe0xWITnmhqPRjx0P11tgyhK0szm3q1HeQvrdwaUYXhTjKtp+Q/xVzc
	MHXVAGmFXQLbds5I92cSwNF/1j6dAk7FEUoBxLUMVd/Y8QaGD7lVWAwN4i2DdIVtBS9pejdAb/L
	4vIoJFdzkGReZv0FtpzNuy2DJjtr/pGm2ZhxyhwAwVcWkGPUxP9//MYOu3t7nflaEzAYUoVNzPh
	XV+jrB35PqZS+67yBsiqabg==
X-Received: by 2002:a05:690c:600e:b0:81f:c442:773f with SMTP id 00721157ae682-897b1d4d68fmr85797837b3.1.1790092866629;
        Tue, 22 Sep 2026 09:01:06 -0700 (PDT)
X-Received: by 2002:a05:6102:8092:b0:7a1:92bc:d59f with SMTP id ada2fe7eead31-7a59d968a05mr8239060137.1.1790092854872;
        Tue, 22 Sep 2026 09:00:54 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c42fa4dsm109135066b.3.2026.09.22.09.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:00:53 -0700 (PDT)
Message-ID: <b8117dfa-4dbe-43a2-8813-26cab9f274d7@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:00:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] arm64: dts: qcom: shikra: Add soundwire and macro
 nodes
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260910231642.1794948-6-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910231642.1794948-6-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qJYlBEt5wNyEPnvxE1J-oXZuQ_9s5LzV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfXwb8M+fHNboM+
 ufl40ZWAUtM2zui5io4fCm1xWBS0fR652Cr88fvgOmlemWMZWFBlCQa4CodNS7xVS3unCSAgzBN
 Xp2WRDi6gnRqQIkAr3RmhMAwQFao5Z7w3RAoamftsB5C8b/0LjIX3EtQJcBaU//h147pMSX+DvI
 +fPqVRFwJVc2iNbwG9EpdX1+S7eK5r0PAQFdh6SqLQowiKTOoGC1GvSkMlxaPb+WQh92O23ETlP
 shYzxpIjVgn5hOT9io03cP2fWEiNMTft3kfMyW3afIWbdg80ulHufNyw/aTutE4WBcFZtmjWMSi
 HGhzYQmBIRA6gFKAOV+ORvWkd1CvqV74KF4PHezZxRQOrBx24hwzEL9s9z67KFXkGgoz89qZwj9
 3QZuHP/YcBpxoWs1TIKNDNdiKk+v0OB3B8FJPnXyuNVC94xAHXI7Y2gn/dnph20Ih41cvnMDB2d
 l2lXx6LudltbSxBtPig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfXxPevxnC9egX5
 SvO8+VMIYd3ry+R+O0qsm/0bPb9YbVGocJ4+qo1UAPRnE41MEvhhWN1zlJdXYpfAb95i1iP1oJp
 KRkrWuJv2s2jmXMdK1J2CllJeqq313U=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab2a643 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=nLN2K7Ab_lPFtrZS6tkA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: qJYlBEt5wNyEPnvxE1J-oXZuQ_9s5LzV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220234

On 9/11/26 1:16 AM, Mohammad Rafi Shaik wrote:
> Add SoC-level SoundWire masters and LPASS RX/VA macro nodes, along with
> DMIC and SWR pinctrl states required by the audio data path.
> 
> Keep these nodes disabled in shikra.dtsi so board dts files can selectively
> enable and configure them.

Because there's (IIUC) no reliance on a rproc, I think we can
safely enable them all by default, same for the QAIF_CPU one

Konrad
