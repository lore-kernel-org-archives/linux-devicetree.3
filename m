Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE12B23E330
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691363; cv=none; b=kfCUpzeXwUlQEmNMDjDAg63tcLO4DpZgzYsuuW6JRpJXI5tapNlfS5sFh4c6DJ4P5ELjEdiLy2OHgfWxVtafMmfYYafqug7ucBP1Zmy4N+nBr8ECEFcKmXQ+eEsuIv/2OwTJRuOU8iXSMaHD72wtCS7xwy6zZiQIErYImJRHazk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691363; c=relaxed/simple;
	bh=fNk6g2tfFQc6SajQIZ+x+Zg7++uPhKXukM74tSZhNSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ml6EQrOxQi/LRQCEIq4FPKhnPRwNLZ1vo7LSAMlDUixLbdA4x3bBBPoJgvVfHFr0Nza/j9JkoDOkPd3hKZHix8IQRB8fSUH8EDYOqPNPwiW8ugKk3huySC4RPaKlM7r50lt0MZW3QwIE6zugNJysVNEi5D6qxJ40Tn90DbYbmG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdTfWLIZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZ8kip9e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdTfWLIZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZ8kip9e"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD5qFb776005
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jhjMPYnKT+1kv7dyHHLub+f+8ul7i3f8PZu38eT1FKE=; b=LdTfWLIZnPB+i/E7
	AH2etVRa/xU5UVvJQt/1eieR8C7zYNmAyedZiYI5BUcn+v9Dgr5rV2dRPRigTFtE
	34yZCAk0tLN+rLhOBScSC4qClC/I2TI3KuPO4BJp8gsnJYJqCIi46UrV2iPNNs2L
	q5N/QgKDVKojSovhsjLX1RM3TKV0zSagSIJnLV7O7LW01fLBZH6KHmi2M+f70Zwj
	eVbCzDHhL8L/fpw/DfIeUk6CQCCHmpZOdkAl3dGkl23RvvzDjNz+dia7B8TdD56N
	1ft9U/8L3sAI34W406hMIINiEBXlpPu0YiA73MxqGVDh5L4Yehv8d7xs/iNyaPJf
	X9VGvw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5dgwx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:49:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c15c77619so2868201cf.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691360; x=1784296160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhjMPYnKT+1kv7dyHHLub+f+8ul7i3f8PZu38eT1FKE=;
        b=iZ8kip9enD1JY5DANaSzR6J6I4cgrF05Ocmm61ZaXAwx8mhSqXxGHLlTJAJMVOyzXw
         F2aJdneI8GgK9c8Okxo4vJIuXl9WS21iX5tu12VhwcRumKFUQEIOfEBJsjCeO17lc/MS
         I6/zo3RZTIxdE3q3R7GSCmXzGo+83NKzqPN+psCgaXU3gk6Y19YE5SsKMJOWmE1tpYro
         IxlD85nICzmO/ohR62ingTuxjvgl0GiCHU7KVF/JmYukYQurEw6sM8w4RWgqy3zJq1+D
         F83BUJOtzzbZbaEeg3u4T8043e/aE9Tmb5QJDPICjDnZa0ssLq/rQ3frW1ak2smRSZBG
         neXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691360; x=1784296160;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhjMPYnKT+1kv7dyHHLub+f+8ul7i3f8PZu38eT1FKE=;
        b=DJ1n8zLFkSIkXdQYz8bE9vjtRU3ZeKxsgXz3Eqs6g7ZHOIL+vGloUD4HMh3o4T1BJ7
         ej9k84a7PWZwqe/j5AhtzwtNYZuzGKrre5mj3STWdkIo0QvA2ar/OjqSMZFFavsRhL9Y
         QMHw0A86lAai/dybfU38Lfoi2NqImAdYwnPVOpbsKjlDJZMn+5oSatWl/0HpaBR8rbxe
         qN7Ueo4NFesAR26uvCm3iEBtI6YAQVgKWnFZHypTdam03BXma1nADmrLht99ja0ZOVhl
         r7pqPrixPpJPy2+yEAAufYsL65dpPBTzDxSJruaYSkA9vRnT95jKXFoiDFl0zUoGa7sY
         GW6A==
X-Forwarded-Encrypted: i=1; AHgh+RqtXfXX67rio/BbCFo23e+yye1OPYfRVueRdU2P3n8yF/04LuK2PACYP/WNkuoaD9LHkIwtff04HKqR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywus6ysUkZ4U1AI03YtLs3UaYnU8Z8sIqFcC4SH5Zwv/6l8FuiV
	fb9Hsn2WMnd5+CwEOHQUo9lN6dtsD2T7hbjclCzYSXNXlAB6DIm/QNczBKaP+gUmf8eJ344Y/Iq
	JIqllFA/o1BP0SsTmeHF62fLDdCd0+9S19kjFd3uARTrfVyzUqtQ1EG7h7+9nvLTY
X-Gm-Gg: AfdE7cmOArIUBKOy78hzXefhj1It7wk1pSEkIa8nn0KDNfJVGiFetfFpdwX16NsYeuG
	ag0gOtjw+GewnC1ogHti24EzFK4kDqGilFaSBWluQF+pO7WVWyFTiYMS7F3vzbiD2BfrEgghImH
	8jtQ9VL1oYfYbmEK1gT7t5zyxcTSLumuDhoLvC8LMXh+TEHG+i0c3EU4ChalkwTcUmmq4/NPeiK
	VLtUkJLOTv/0NHYRTeczmzewQXhSX/NXEFFMoSh0Ukv2z6wGmNMEThey+uS3NeOjO9oL5TblVqM
	E6Wvhbb1YY6t0ZcNm7l4+13T0baXQJ4hKwWNGTAl0HbAwX4PIfrqU4IPyrRcsLiveIQb6Ol0ZXB
	kyDOA/GXjVXth8grMr19UM50+w4zgmCHRrYY=
X-Received: by 2002:ac8:5dcc:0:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c966b8b25mr75444081cf.5.1783691360031;
        Fri, 10 Jul 2026 06:49:20 -0700 (PDT)
X-Received: by 2002:ac8:5dcc:0:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c966b8b25mr75443831cf.5.1783691359627;
        Fri, 10 Jul 2026 06:49:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15fc29937esm138763666b.22.2026.07.10.06.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:49:18 -0700 (PDT)
Message-ID: <768b6337-674f-4111-9de8-0f4a245cd275@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:49:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
 <20260708-shikra_stats-v2-3-beb52f24f1fd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-shikra_stats-v2-3-beb52f24f1fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX5q9f560VSJ/x
 0TlEIa7HiRDA3DByMBXfsUlql8TcgmAJJhh6PBtiMUYPc1jfdlBh/RMtv0zqZhIG3dYN6woi/a0
 Omtdf5MeNWMZEBobza4Z92Px0CXFj7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX12tKfGVgl8qj
 HoRwDcwZVgXLdfSkWmZ3QgN1LYDA4nmuFlxzA7u8bCvVZug59UsoH2HVVyL5QsyRz8d+5+XlWJv
 79lroJKqoGiuK167gO8E3/nkEQXpkFFhiTj9oY9k8zfCM2QL3wGa56oMiPyco1vuunDKdDaIhhn
 GmOmoSSeSMxdax+tWKlQrFXUoJvhRO0vHjUJxDhiRNV3VuRUcSZ+zMMX0v3Fw/oOyruKWDtaKNQ
 dXZpr1Hc1QfxWVkwg0JkTMEnC36zH3bOZYqSmj3ZRkUVh77xAbnkVkxEB90GBsCxqcIxplz7xba
 dPES2JM9VgKGajkCuO2VjRz/6aJfO7NU5QJFKtHNz35DtJUggtJlk1CmXS0jxr8+npSqfvUOp3Z
 S/AowJVAVqavJtz0lHY98KYwO3dU4kiZNuanLLBjz+grxxdBgrSzFIMTsIxl+rDcp1nAtvxaIE8
 rSdJ7TDeQnmhzliL4vw==
X-Proofpoint-GUID: EMKo2lOIpPwFe3OHk-nsr5Ko4vzw3D2P
X-Proofpoint-ORIG-GUID: EMKo2lOIpPwFe3OHk-nsr5Ko4vzw3D2P
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a50f861 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=5Q0izQ4MgAGUw91kEtEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100137

On 7/8/26 5:49 PM, Sneh Mankad wrote:
> A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
> stats like vmin and vlow.
> 
> Shikra SoC specific compatible allows reading individual subsystem level
> LPM stats along with SoC level LPM stats. Change it.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
