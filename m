Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834A03E7BA8
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944885; cv=none; b=jvnV/qP0SVZYw+q5IECTAiTvhgwAYU1/9qILlgVGXjniOeC9zRNSP/IShm+N6BJxOaype+Org337lDKhpjmRHaLXFfNVonre01SpSc2b+FCuOHPaoTuu4Ca0IFAjbOrh2895iInhe7qhkq0MGPS6stPPYA9BxbHuyaNeCTpGOkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944885; c=relaxed/simple;
	bh=xaxtm/Dpnz+4KdGAJI2OS+JIZQ5GYHVCqxmLysD4nMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2aM6Ii6rFnnn4s+XrhL4lfcSUSo6EP1+tNe10T+v19qcO4o6LkdswN8sfpRhpkAYmy/FKJ8oOE/p7RNwcW6vbQyJUudYhAKGAq+JvTHwBDtaLVKuScSbq1tHmZihHSA0R1c23T+BhORX/PmJm5ZRQJIEtMHh4xTCk3Nh+w1sf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UoHR3eNd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VPZpgR7T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UoHR3eNd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VPZpgR7T"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDdSH1480701
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bj2ppbc4gGykhORbbJec9NB3jEgKloyl92m8waO1PU=; b=UoHR3eNdGIPOeVg0
	KsHOyJ51TwiQhLZfHy3iaYcPeErYtD6S3VOfWzkZjy62jO7WL3Ru7lWenpGjb62h
	vxtQsoGXgK0q+/YiglkHPMKZybNFXWqD/nlp65AuJO9zGIsyecm9TSKbP9Nt7DBl
	vkEFvNbh03uLvy4OrA3rs6YncpOdtGfN8+4l3Ulyr/teMGvws2i15XyjW2MS7n7U
	/962afWx/U1KN6UGcvQoEYattFGnsvdrpwbslgEouwAS2+wbc8520DuwkDD1cOWU
	lZuSCPKlHBGRolTzn9YlbS6AzDIhYxsfVNX+xAWG+P559YS3bn/XRhiyQuyk5ott
	oIkWMw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavrkwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:14:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7f385887bso76324295ad.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944879; x=1784549679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bj2ppbc4gGykhORbbJec9NB3jEgKloyl92m8waO1PU=;
        b=VPZpgR7TubTwpoJVGFPgfa82GgkFcNi07gxjNrK+id3pqoMdNlL0mOuifZ9Tpji5Ym
         RzFyJsmiFYRRACQhP0cHJnQCDETgbNJ4XL5H1qTTRbYM1InJXp2AayS1pCpMUdW+SS7o
         9oetUEipydcpkOoXqyZZkEazf1F6RRChAddFFSAKtgmhOoKxMAJ+HNTPJ0Mbz6Cnu/RW
         gpM/OX8AhvqUcV756mxArgwJzorPZOuUHWWPPsp0khlvEowikRjmnuCjHzLyZT1of7mi
         fRy755Cnma9ZI0cMd47vpPGoLF/cYyWPDGgbLF01PB1u2GOR2gbu8alPSoqO5eGDCDms
         2BUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944879; x=1784549679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bj2ppbc4gGykhORbbJec9NB3jEgKloyl92m8waO1PU=;
        b=COYk4sn27zAQn0nhUaeVYDfvbuG7ajIuCrL3tOb5ouyVfN3Cl2pONKze56VyYVUYZw
         t5pMPYmlsw1nqi6r7oar4l12nNRofBFoBIkOCnkdYh+hTLodGr/a1nPunL+v704WS6PC
         1DaiWhHIY5eS7BJn5mWthlKAOZ1hwOMpbIVBpPvVKOYR9sh4qloHlEXpcPvrTJalzIST
         fROodFGJHMlAd4gyairBmfPGt2Z0aYdFQKN7Cx/L2+oaw6ExK9h6vxzHuTNdccv03iX9
         nDnGSTTO77rwZR204hqwi4FJntptX7pfjloVIiD79hSlcSqd4z73g3xLkMaDxL7uWvkY
         FTwg==
X-Forwarded-Encrypted: i=1; AHgh+RqjS8jnbRgEmCJ+zGhRZsH0CSgdsTlF8uBPAQDl44iBIShAdo7l/2RsXQspLNq7SeYov5aw03xlMXwd@vger.kernel.org
X-Gm-Message-State: AOJu0YwTskdqllJGT9Tekwmh0GJuNWgNkD34oFqBDPTosbCNkYe1w3xD
	/XSO/ahDgm9CAKzgC4l5IcP3OJ8RUXvbNbZf9i613T39q4SEZZosFcoGzPWlt0F77d+HkWMiKSr
	xYtVVeDnfDNPOBiDPtn+cCO0ac0nBbCR4YVLVo3n57FimS+T0IpyUEHf7hFQaEBkQQl+s0scO
X-Gm-Gg: AfdE7cmIpRncRTBrH5Tc6ff7uJcL7TQQCz9zbIW9R+hScTyXEhc5cBOqCXxoJ0DnGfW
	B72wSxyh2xyTEwtgCKLizLoRFtSe3a2rxuSpvF4tPgl6x1O1s3P+TsogFX00qlQwbyaCUiVooJ5
	dXRUB7IRe0g2uvHbKauAwfmbZ5yy/aewrAIUkRRcCI9jCMwLQ8v/nJ9U/4aC43QOlCWDc9VrYlV
	3nx/asu/MwdaXndX+r5DbhYv2/CveJL6Kbm7R9/E49kW66orRdZTc58yNRw7DwV1Zkwd5tbEf5/
	GEoIBxNWvfASDyypkKyQJNuS5tZ/jDO9nrB9jg5hMJUL+wXQ5YMBZmVYcK3A+JdPIiTLnP18gDN
	zRXwnBrFqZlaAxbryLvnpE8ivugF7bGvWS9Np0g==
X-Received: by 2002:a17:902:fda5:b0:2ca:d7a0:1312 with SMTP id d9443c01a7336-2ce9ee16623mr91362395ad.25.1783944878669;
        Mon, 13 Jul 2026 05:14:38 -0700 (PDT)
X-Received: by 2002:a17:902:fda5:b0:2ca:d7a0:1312 with SMTP id d9443c01a7336-2ce9ee16623mr91361995ad.25.1783944878253;
        Mon, 13 Jul 2026 05:14:38 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1ecfesm98917475ad.47.2026.07.13.05.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:14:37 -0700 (PDT)
Message-ID: <b0ed37b4-8279-4d8c-a4c2-3e422d799767@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:44:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/19] dt-bindings: clock: qcom,qcm2290-dispcc: Add
 DSI1 PHY and sleep clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-2-cc13826d4d5a@oss.qualcomm.com>
 <20260703-imaginary-quokka-of-resistance-c06e8c@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260703-imaginary-quokka-of-resistance-c06e8c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IBq1-D-6esTqXyf5aFtBQqoehV4l6znI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX57qfBcA0OMRh
 EG/1OIsuzbDfLFAFRBfypzOGgz3Y8RqPYlh4hHx2fuExeP04Vd7xvmBAKL9uBA46ewGnuRwRSVb
 RqWyWN8bdZIJtFqi1vKDcNkZ7R+RxLlYljesxQHj6syMEh0ulq5PWGbJdDLPUJ0RLog+fAM4eJL
 rKmbLdkyJangp0YVBnUz7wjOO7rHDXXi1Ycg+dRac3DGpQskwSFBWzAhgf5IzZRdF6+hOm2LlI2
 5sg060AB+UqAwDZVHK7BVtFRKSJLeThgWmHcB7BvYvQ3r6ejqAg8J4hoxiPibOUVa9cLBERFT83
 cJisSijma34UFdnv7XsnWOApHuvpekRAIdvispmikv3WwF/myAsN/ngvDH+IHl1tEyYUkBrO6hM
 n9uFOT5CiIRvDFYQkh1l15tCbK12tiEoowb0VCGFQJhjCdRWfMVyexBQoVZCpMCQjxyhQ19Uj6j
 ig0Iab4TSACox4n2ggw==
X-Proofpoint-ORIG-GUID: IBq1-D-6esTqXyf5aFtBQqoehV4l6znI
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54d6af cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6Xi6mpGAEk2f3eWU2LkA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX9WUDv5qXX7o7
 jfBY+tBXrk2JMvAbvT6oT7kOzCklKhs8TM8sEDnwmgvg3fGVdtgW4nt21ORtb5890zcKEcMkEYs
 JSrFrNEOwXAnJRIs1Yg7+NY/PlCSI3A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130128



On 03-07-2026 11:43 am, Krzysztof Kozlowski wrote:
> On Fri, Jul 03, 2026 at 12:01:24AM +0530, Imran Shaik wrote:
>> Update the QCM2290 DISPCC binding to document additional clock inputs
>> supported by the hardware, including DSI1 PHY byte/pixel clocks and the
>> sleep clock, alongside the existing clock list. These external clock inputs
>> were missing, so update the binding to correctly represent the hardware.
> 
> This sentence repeats the first one.
> 
> I asked at v5: you need to provide reasons. I understand the clocks were
> missing and what does that mean? If everything was working fine, while
> the clocks is missing, there is no need to change the ABI, right?
> 

Sure, I will drop this patch in next series.

Thanks,
Imran
