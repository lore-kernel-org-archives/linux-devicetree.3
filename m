Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F013B6C00
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768175; cv=none; b=CGQr6G8e0frV3cQ/lWVZOfEK9XZ+95/+C3/W2O+q+2FJzYehkZT7Wp0oR48LBrT5+szfwr4uu52W6qbhRidOXN7XCFxKx9S8Nvypk+rkHO1ayp8IzO8ZhiUBLicE8K8kAvs5zTquMIrTGtQQpoV5XN97lMGA7AvYWhJtxkfF3Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768175; c=relaxed/simple;
	bh=V3Sw8xL/k0QNug3YR59BDk1ejOW0G79c1frnvEZvCg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6bDnhlO/NmITpVpIHM0r9xv0SgbCqtUO/Iyt2d9DveyCw8EcN8KBwUTysA0U65vgDUOXPMpCLZpeNqJGgZM4rIW/lpdDQzNwsqy995/FVpB4B8MbJlz6JqH1ZrIYxEx/WRLRFMu4/1StiGk2kW9p7RUCZfZTR0bDEi9Iz55wpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T710U8NX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jLLx5Fym; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T710U8NX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLLx5Fym"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L5hdc41014304
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mIdVNY8xKxle0iaLzoXqxpFUpCZlqEbuqrI0bo39D0I=; b=T710U8NXI1CoU2Gc
	zsTpbAYq62dKS8IYBOR1JPKU/LTR3jVOUbA6A4c/xlyY7rWE1Zc0xv7uzhRowq+P
	PIo4GJxUPWzd5BC8MMHfFDNd8AB2+1BQGjfSLEsAVbjHRzPYvTM9sJNlD5cq6bd3
	uYVnu8/mmEzVH2Gn8m0HQ7TXKHzLH95wK9yx4AkeBYsBrJVnr7BJQMax5siaYAg9
	ST598D51w528Wi1xsmJ7qNToXG83SO77GMH8rrrY43YgBfPgAmLyFXpNrcyJ8zLC
	kYYMj6zuCOwATqC2BNXE8G5DDnGQyE4Yib98qxiDvbi0mApWnAL2tsGwoMBpPz2b
	FLo8kg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt902snp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:42:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ee23ab9f14so17972085a.2
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 03:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776768172; x=1777372972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mIdVNY8xKxle0iaLzoXqxpFUpCZlqEbuqrI0bo39D0I=;
        b=jLLx5FymEFAc79EuU6FS1JHohUfA0B5dbPLXTYUccEgtgIXnB4jIo7Qg1nvSjTBxEQ
         GbTnqnaKEvYqH9uXvmE+HTDR0xPJmxu/cCvYmpNmXI8Nb/Euo22Fo2Or8v+oV5ZzCqy+
         HLzxx1FDNBuxQK6RgouFUc2NFBkyijCPUyT4sReRchwn8OoOkRxZOZnt6qMOM/O+4ohQ
         cuytDkaYasW8dZ3iDvXy0EZbNzCrFAZhOV4Zr4yDV5jPZMl3C+Te0WlZ54fXRsm2zsHC
         1vQ4n5Egz085NoAwXx+YSzPdvtagNbdl646v1f1DcrRpp9mlp8VgzS93GrmruWu546h8
         kpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768172; x=1777372972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIdVNY8xKxle0iaLzoXqxpFUpCZlqEbuqrI0bo39D0I=;
        b=sEVIAh/nnygnXzVp9GWsOyWwedgHm67LccfOiUfdUZzWAkSlvqyMHRAo0RJan8dNyO
         9HwBvNct4PUCHKfyEQQuWt/HqBeFf4ePyz+Wn+fGtgbtooB1+uJKU+wu4MXozuluFSBq
         6r8rNE542kL13V67TyYxkgQo87MTKRhdCyd+hg8cguJ9qyAKfyBH0izlMFNax9G1aFo2
         y4qLkuunQSX1R4k2alhJEVdW8bCmYn5n81ZpJQQ09EUz7RZwZLwcUZUfbllrY7pFt98+
         ebtSXPhwBV1ug3Oghbr+dAD+38QV8QnMT1DLC2IxrTedYOdhYxDH8nyJBdoYvYBXQeXS
         1UCg==
X-Forwarded-Encrypted: i=1; AFNElJ/TJDiDptqCd57/ylG2fJWzWNX/PmpoFtNeVvyEIaHfzDzPN0jt+Q1YtPg0UEVHxXjz+sn9sm57ISzY@vger.kernel.org
X-Gm-Message-State: AOJu0YzrhYRBokgfDVu1jRoNDdR6oK6IRKN330hJwE1DGgNwapC8XxeK
	gPvf7qzmCzmFiLU7JekOmRJVTYqNlXkLIXBIUiZaYF4RhQLAP39nTud6dN/+Nno2WAnuORli5Rq
	wr9eBpYPtCVGu4tcynxHzASlClrlnYsdknJGJ8d3PIquBeE1vHLm4mD/Pgn6kR4wd
X-Gm-Gg: AeBDieu9HFEOhmol1L9mMA7atQSBWirBATuNwKEE8Yt/Se5sCEdQYFXRO+jFtbL6Awr
	DwTgx2ssMzkRxnlHI8jjIxrE6kCGZx+eqFmMozRzWtnUMWqqJ5Dfb67UNYR/FXgz3CMza3Y2yFA
	xAMRYrXuMxtGOVFaZF+IArQGataBV2u2Gwmv7jqhHNU7BLaN9xu5dvg3aV4xA/B8fRTauFv8nIX
	jqn2ZE6leeWkJTirMbH0ZsrfvwqFSnddWBki6x+uiT+QoRc5PyZyGFDs2LyT6Iwn4E4IWZfBhKT
	cjxB2mXcfdXO9M7F19EdekHwN1PIS6DmGWijQKG+SBpXE1JyysvHVk3uV6by0Z03zLHfDvCf7Qb
	CI1Eum5flYTGPCwC4Y8Q0kPZNIlBjUHql5QAlTtcoEEHC1qELt9+JFSImNIOKPdFI7W+gzg64FG
	LXcA60erXvSIQdBw==
X-Received: by 2002:a05:620a:178f:b0:8ed:d6df:c768 with SMTP id af79cd13be357-8edd6ef1bc9mr422897285a.7.1776768172255;
        Tue, 21 Apr 2026 03:42:52 -0700 (PDT)
X-Received: by 2002:a05:620a:178f:b0:8ed:d6df:c768 with SMTP id af79cd13be357-8edd6ef1bc9mr422895085a.7.1776768171730;
        Tue, 21 Apr 2026 03:42:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d50922sm2464976a12.21.2026.04.21.03.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 03:42:50 -0700 (PDT)
Message-ID: <b8bd10c2-bdcd-47e2-8fe0-92177906c477@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 12:42:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8650: add CPU cache size
 properties
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
 <20260420-topic-sm8650-upstream-cpu-props-v2-2-689e07d8ab8c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-topic-sm8650-upstream-cpu-props-v2-2-689e07d8ab8c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e754ad cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=nGxWEAIRjKdob76_-7wA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dN0EiFaKFDDYoZez_M-7FtvAeZ2KRRH4
X-Proofpoint-GUID: dN0EiFaKFDDYoZez_M-7FtvAeZ2KRRH4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwNSBTYWx0ZWRfXz/spquUn948F
 okVG3DvvyMkeCFI7hUXUahqVhoGPpS2qDB7bnfx7BeSbRVXpIM8NXqBm7h3U6AjdR8nualhL/K4
 YVdSDD6J+UTqtDHcfjGE01qR06PRbOFyznlZ5T9l0whFFmf0zofQM0eqBv0T2gfcUdloZDp1YtB
 M4gMPyNYom7OPFITeqMMeNYONLkyYPMo5PdhJ/ogVUY7hfGXLlvtG8CBbtymUUV08QuaCuGk7j4
 /lrufEbKFhm4ZP2YLoJE+lAGYleWRWOExWfUNRtg0SuveBjdolRNREGRQNkbnmec5tn9K9XSVii
 NYyqWwNlzrQnDhCWUdPBhrl2twK4SGtw6qNvC+HMm3V7kUEgGuP8MlnCq42os5RGz9+em3rlT84
 LMVVzqDVkhX9RSAhLXd/UZDkhftxWWZ+vNOxbi2bEmYR2if7rMUL9A8d+D527uXLGnxO8g8VGrv
 wmJSnDoE8s7P7+Z1uHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210105

On 4/20/26 9:26 PM, Neil Armstrong wrote:
> Add the L1 cache size and its line size (cache-size and
> cache-line-size) with the corresponding L1-I cache and L1-D cache.
> 
> L1 cache is unified, but clidr_el1 register (get_cache_type) tells that
> L1 cache is separated (CACHE_TYPE_SEPARATE), add i-cache-line-size and
> d-cache-line-size and cache-line-size of L3 cache is specified.
> 
> All cache line sizes were confirmed by checking ccsidr_el1.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
