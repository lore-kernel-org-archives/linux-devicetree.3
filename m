Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023317;
	b=eQWLmCJ/FMM0xmVAR8q3dGeWxV7o8O1E7YFWs1G+lztedrexB4Rb6RV7A/J53z1iy4ft
	 m0A++0bAOywbs6VDogYx68TWKFjIdAkAU2zdbRu2eC9E4xnR7aghJ4B2byqKy9mnuYnOe
	 FW12ncKDIbyhAHPJX+5bWrlViCXZUjlWtJa1V33gwXffFX+KvjpTU46e38/K+sNXTI1IT
	 q2oZw4IgKA1ZOmW8YwcaHqlBZSuH83jYYMBZj5Ie6M1DSqeFdiAQmp4Zm9fYBTO+OOjQr
	 Z9KjoG8R9NvrsjvyHGjMUqlyqZaBMTFzXaRZxdKq+pIaUnj+ghlTO+ZbN5tPk6tTqaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023317;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ghBeo+TK4npvaXsZEpt21+g1yXC6b+Urto50LbpsTK0=;
	b=Lz94IQGaxd/DdMSrRtt7tl+mJTyam7MSrKHqqM+ZIcmysEttMFOOif6Y14t7XJA3u/kx
	 UabWRObeNOd+Q1JwBLP2QpBcLmC1KrhBllsBNjgvAGkfjZLyHZR7AMJcMrzMIzey3Fl8s
	 EbwhMiL8lxPKaHenaI195tLNaaQgzarNdO/aI7Zpt62bv/hCc6IDiPt4spfTav7o3sutj
	 kZl0wjPcNhLYnwSEhsjNi9tgfqIaDrNobO8HyNIYIteCB+2CQMsD5RDsQfie20/FYDLZw
	 dXyTsbCUusbVexuj31mZt7YVCeh/n0I69X0fhYf6Xu5XMYjm5+P9qVpBRaRWHw4D/4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P6mhZ0lf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O+zoa0X0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE35606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE35606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P6mhZ0lf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O+zoa0X0
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt8ZH2733524
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghBeo+TK4npvaXsZEpt21+g1yXC6b+Urto50LbpsTK0=; b=P6mhZ0lfV80JodKf
	qlhHrTNNTaPjsSjPQpgo7tBVjmWl3MKkJ5obEIvI/tgSZrkHAtB0/n/ydTk9RqfX
	f3clKbcE+Be9utsUDOiGiHU59Rl+yj4chbCiY8tufsWz2GKS8hliy+8Ge4CKpER4
	7aURYfDu9QYTeOdEn/57LT6/PEbpps3nSyZsev52EU7iAnhes4kICSBdx024/n5p
	bhdMDUs0W4j7Kk/HhklqYBcTIAmWzGw6jPF1X3QoaFKmG9qbs8R8H2ESFn+s62xQ
	lAZpSlwQIDA/JWWv66UzUeS/rtLE9WxelSIT80+6L4dQJTq9gtzfmjBonp/pGonn
	eKTC4Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp9023-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:01:54 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c97957d83bso150231e0c.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 07:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793023314; x=1793628114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghBeo+TK4npvaXsZEpt21+g1yXC6b+Urto50LbpsTK0=;
        b=O+zoa0X0GmaUXb+NMh2Nc7StA3H6od0Qgt5jiqh2r9dBIfFIgWdVFCflnuRTu+bLCC
         ZVujLW8OLJHyCgRdf8+ChgC42WeGZry0EtLdhSkN6LPJBsV+0XnUEz9x8PZ5R5a3kkhj
         iAHWUdGkXqouElxMtAOZwuVsjvxhUJ99EibZztgVFJJmEZgAoU9BWaLNem8QvNrtD2+o
         VIRSefsq8O1Z/gIcLC1PtXKiytKhFfbLH1m5fS5YjbzGGxqPhNlkaP+vGGlreIixpEiJ
         IuvTlLcPvP3or7Bl4ufWZBEb0EDqZ/hr+fD39n9jgyQnKd+aIZlh9Zvj7DBD1xeW5Ln5
         3uRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023314; x=1793628114;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghBeo+TK4npvaXsZEpt21+g1yXC6b+Urto50LbpsTK0=;
        b=MfrHAbARiMxOJvrf/gfixbo949WY3ppfmvO9quSdEMqozENkGul+Hqxee119xWUliY
         zimjisK8g8O52621GA88dMLnyAl7wzpdOaYecANaV38OsPce1Jc27vTmU5OH6JwIx4Km
         YJJA83kizvVzea4uUFk7FnOH0ec6ijT6Yl8B9B1XtoDD+xCyzAIDKZTLb7uIj8oSZbfK
         Pa9IHTfImLWAXlU9QlQZUNZkh3pYZ53CNR5Zch2UrT9YDvj04VCUZdD1++z2QgoIKT0H
         efeoDnqCZzQQ9mVJ1xDIgsv7sZeFex/NQeVBLc0BL70FJxdOaYW4oTAyNpwwLJKiMDVA
         nhKg==
X-Forwarded-Encrypted: i=1; AKwUvBzWwCL1P7BqVuFMiLrSeYgmE6yhD2eaT6gO2Ld9+SLIT6cYJp/9plH5WIPqEh0VWjwDzQ5186Mcezrl@vger.kernel.org
X-Gm-Message-State: AFq9FYIKeLSKZ+CirfRPZWr37fmunfJnwE4OArfJipzxNNpzJFiH4htM
	52MMORjWnbxr7GQ3bpCU84WHgxXwmdrybongjxSgc+r4RB6c8Yr6XuK4TgT04eFpa23AMmVIMOp
	njnSyiGkxX6N7uae0JzZgnzso4pkXfClJQ09oBJeICTSEDfH/nZZqVNXeSmV1ETfv
X-Gm-Gg: AYBFou3CZ/nzYvuQmUbOBCz5mo1FV2kikXAO+stmHFwPD/wK8ouGzFv2jzakEYdJIGb
	5eRl+uW4bZFI5PoGfCIwZZKRSTwO4uYzghk4DJSnBn4AtaOT8wqA6ohw9HzjH9A29c23R3EXdvD
	eG3TBlhiCyn7f1uxr8KFiGpNvngfYWeUJfpehb/XyVMNTxUS9qmSWIkGMFpAejo9pC+0CzeMAdF
	wkP5uhjfml8KUZkFghLs5vv53BbmiwqVBecPy86+hbbkh+ubSw0sIJUrMAs5XKyQzcGESXegsp1
	TQWJfsBiys6zKQcndmomzonH02tP5grXayJHPonqHqGX7+gCL8muD1hmKxwphaddAUvgX8UA2ny
	4rnGQWW2VzsB2wA9Nn1Tk/g==
X-Received: by 2002:ac5:c00f:0:10b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec22ec8268mr1986262e0c.0.1793023312333;
        Mon, 26 Oct 2026 07:01:52 -0700 (PDT)
X-Received: by 2002:ac5:c00f:0:10b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec22ec8268mr1986164e0c.0.1793023311680;
        Mon, 26 Oct 2026 07:01:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7984f5sm322859066b.77.2026.10.26.07.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:01:50 -0700 (PDT)
Message-ID: <7684f3dd-e5c1-44ae-bc05-49d2ce64af24@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:01:47 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add initial Nothing Phone (4a) Pro
 support
To: Oleksii Onchul <oleksiionchul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261011095221.24767-1-oleksiionchul@gmail.com>
 <20261011095221.24767-3-oleksiionchul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011095221.24767-3-oleksiionchul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NSBTYWx0ZWRfX+ay4RFpUikUR
 c1vS2YCV3h3ujB10GJ8H5U8aigIz+CxHt2ufy20xkCkstZ17OA1k5ycKF2a7CWjyoUbRug+rPXM
 xASPNFIml4eIGgmdqF8/IMWzPnUa6fi32zqBsqzZKBmpalLsQRIU8tUEG5+KW8FVKunmI4LLwuc
 rDjBGTvssOJ72Q0S2la7Ifz0RUaYTHOYiiqRfvyT3sQM7vi5prGgldfGJOjAM98m25WPh7/ypOt
 3snJx51XtPl2T6nlJciHqfz0LEIhIE/lw73Q8+tOjdJ6k3yQuldx10RN0ocVInbUhzSAcZTp+2L
 Lq/9jg4im4mNto/+e4bBK8qtKdk3eUksWdNEhANEq8120mkQpRjOdHTaAYIQV+iwCbaAbTsc+PK
 E2DBxlIiSG0yadlc7EnRIN88wH3SLYJWF0yQg8MnF5iaxX2PEPtavyMih5N+mUAD81CMsQ4t7ky
 3SasgCSjfScaAF7nnzw==
X-Proofpoint-GUID: 7DgP4fgOrz4Jlm-tjaO9NCqLEtDjwDvf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NSBTYWx0ZWRfX4dRrODO3+WkA
 BDvnKEYsdOubZUFnyafcuz4JTa5kjDMDR/94ltbz57YNMD42do3TBfTXNEutAqvBaplXiaKDzX4
 Yr7o8xpt3ozxkdzDbYD6g08cj9tKLgw=
X-Proofpoint-ORIG-GUID: 7DgP4fgOrz4Jlm-tjaO9NCqLEtDjwDvf
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf5d52 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=g09VQlvOWAvZh4W_s68A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260055

On 10/11/26 11:52 AM, Oleksii Onchul wrote:
> Add initial device tree support for the Nothing Phone (4a) Pro
> (FroggerPro), based on the Qualcomm Eliza platform.
> 
> Describe the UART, GPIO keys and reserved memory, including ramoops.
> 
> Assisted-by: LLM
> Signed-off-by: Oleksii Onchul <oleksiionchul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
