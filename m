Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478278;
	b=zOxg5j1PYDHl/wcEj4aEKC2UHmnpQwZwrS07RyHI10zS/ReDUsTRPqmNCgtVhJKQYJkh
	 a4qBPZWFCaOUd0um40uu//LQLOY0iXoaBCiQAjcgJvvsxV9YXcP69NjI8OTbjSmcnYMJ0
	 ImAXookoCFfcxrY+Ijy3dvK08rahTevi2Q05780YxMkXbA78I5Iu0eYjnr7P9isLNXCBx
	 soFWn7PQ5gHTQNFnaWNDDT5V2D6hAzutWln7A0NGP/j/RDP+XcLdbP1pUaOQuMpvlYuzV
	 b+xiNEEAACXaY5wiFpPkjIWduWFdpKJurDiZUkeePnoUAccHY1pjIEVDn2/oAveDpbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4Co371eAtEyBY0WhdQgTX/EXDlxY6o8hzTRzs231jfc=;
	b=j5iRKxJ2QYA5Wk3/H0srHYiM/9yoTSbIs8EnROuOKq6xs15hs6y1sb62n5MUAvQv31LU
	 cEjwuM6KkPuhGJsCkCk4sK/lcQfyZ6ZVP6loQnASmKee0aBYJmvpT/8eAZIrPdowr0/TV
	 H5HQZiRxHglKqja9k0HzDO48wRDb29K9R04R9HgvLW1N9WV5Jfb6u9GcHixgGj4cdg4ZY
	 ltVbpVMEtlaxEMilVutvyAtaxNR7j/cxCGs4EBaKryNZKNkavHsxUmoK6ntRNYAt3Xq3T
	 vuQNmLuyZ9gmQ9A44KaP6z4QiWrnKqZDyCnBLXttfbNt6TlAMZjIMRneDesSEQvsA3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TPl3mf0w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eI8jmE8y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53118606A895
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53118606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TPl3mf0w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eI8jmE8y
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9EoLq1475396
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Co371eAtEyBY0WhdQgTX/EXDlxY6o8hzTRzs231jfc=; b=TPl3mf0wnEZZiYrD
	BA4Fggl3UUBrsz0os/YuZlvZRaCVUPRIPEU7H6qGyaut/36RtBgvdkXGGG1pG8aF
	cLIf4Qk0XYaJ4+Q6fjf25Cf5ep6CcjgW669TzxU/onX4FOWRJheyi4eU35gQH50Q
	PB5VoVXeLXhts9Olw/wn7LaCYNbKOkKcDZG3BxSJnUfZlBqmYsdWIJZjJJrC1lE3
	D2BmccnVebC3T6a9utJAvP6LoFU4ORqZwVRbl9albTBDIWiTCt9/Fe4nU+9JgWgC
	loIt78qpM3D0O8i7wGIlDvccZ0ev8dIZFD7MA1J+rPdgXBL5HeB7lD58x2j/rad2
	Q7Lj7A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymuv3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:11:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e94f72fb9fso41846935ad.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 02:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478276; x=1795083076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Co371eAtEyBY0WhdQgTX/EXDlxY6o8hzTRzs231jfc=;
        b=eI8jmE8yzGFhHLAPCVNM6t/CC34mV2VwGLvl1cgw1svegQsaU59jJzB+72t9vl4qqB
         QfWpxMb66hooyET+LZ3UhbgQqOn4rUH1xcb611QTyvYCcSIlrdU1wFkSfPwogddDk9bC
         skINiPP1QFePXVflGtv0474EZWqhf7IjACesxgsj5FBDH7tV+yE9SlKidvWdxyYzKgF8
         ObscxgeNRTX12vf1Y57O55N66DkbuT5lVB9oRH/4VQ3Io433hIvxWEt6hLYlNHDID0pt
         AH2wexydR3IHhvM5Nc9axz/R26G8LNkdwHkEhVFz6nkyrCmFHNy3pcIhJlUxqj5VJCSi
         errw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478276; x=1795083076;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Co371eAtEyBY0WhdQgTX/EXDlxY6o8hzTRzs231jfc=;
        b=mM/MsZtpgVXvOPGgH84HegGkWrD+NdEv7NoiYRFdkkqRq80fnbpP5vH94hQiVGmKZT
         yui2y9P+eHFc+I5uXPxe3YDaKetCNSPv0Ruv1BNzsw2MkVDppAz4QD6CsyMwx/iCRirl
         QnABUGxw8yuduMryOy/G89+jHg2DKarmCg6vCE6qu4Rb8hOZFOcH/+LHCiK7zGEtJA3n
         lvvcVXplkWlzErDgDCOzuxANV4aqVG+xfnvBTgSghkPAaB00sP2Xmz8HSK3SFyvUjsQy
         8L4woYnCUbIX4FML8ucs+4Rgc39aJeamVLNqdny6TF8QPtaMaPIbzkay2AzMWz7KBl+S
         dHQQ==
X-Forwarded-Encrypted: i=1; AL+hErF7z7SBsUddjj/ogo+/Xrc6GZ5i282gdmUSbiN+7FmuLUA6r0cx+FLX1BNY6Z/u6EO0IS5JufOgvPDS@vger.kernel.org
X-Gm-Message-State: APuU4Z/CJATYmvciLUR4U3TxnTAZAGERNquBHEKV1jLwLJOmOPGB+c/f
	CbT+lTZKE/wNpLQfG6sNaHnRyrrvXNUlSEjvEgHEkgh+7YV7H7IZSus7/bYPYEYYEPRjKRsKoWv
	4UPNY00zMcjUg7yGWIcdmXYuWZNMBCthbZFVwC7yQrOFtJs2lznX15zBesExj8kRV
X-Gm-Gg: AYBFou1f32mlxGjbugqH1nrtHKpWvLonEQR6aEa7iX4m3hXtYzcBvmCgplHEwgtDkGQ
	xeZNZBvPqbUm1iN7ueZDcN98uySS94vKe4Mg0rZa+AiXQXGYZhAR+SP0n3yLSlgoHIybXxbvfGr
	xtWzX/D2nkhhdFah5hiIl7zhyfo0vSl5/leL7rTtJQDHmq+d+Cxv9GhKSCV9XIOUp5gTYGyAEmF
	ycCaLCGmhReixZpDsek/5E/N0GLNC35TxvrN0q0yzbJW1YUodGz2ZIJr4YcSmQGDXzxJUINwI2Q
	krMjhK774uz12ai4f/XfilORrl5sFoH9Zyc/sO1qgGbzVALbJficUwrOsMgsRaGWncJS7ohhoYk
	Z7VBhkYustsgB6/+z5PDGl/QzzhwovNWjtX65rulrzj9vL/XRIX3iQoJ7lEnZJv5Ngh4Xzp4rH4
	ooGH4=
X-Received: by 2002:a17:902:f690:b0:2ed:e35b:7d1 with SMTP id d9443c01a7336-2ede35b0cfamr40899955ad.61.1794478276089;
        Thu, 12 Nov 2026 02:11:16 -0800 (PST)
X-Received: by 2002:a17:902:f690:b0:2ed:e35b:7d1 with SMTP id d9443c01a7336-2ede35b0cfamr40899675ad.61.1794478275533;
        Thu, 12 Nov 2026 02:11:15 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a415d3sm32254925ad.9.2026.11.12.02.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 02:11:15 -0800 (PST)
Message-ID: <60d25371-4dc6-4ffa-9f20-4c995f5e0d8f@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:41:08 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: crypto: Adjust Shikra compatible
 hierarchy
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
 <20261006-shikra_qce_fix-v1-1-8ac54d81edb4@oss.qualcomm.com>
 <20261013-pastoral-magic-perch-1a2e5a@quoll>
 <c6aea30e-337a-4747-93be-cbaeeaa933dc@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c6aea30e-337a-4747-93be-cbaeeaa933dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vJTQ8m6eCBUuV9BmnbtQ00uxgcViLMAQ
X-Proofpoint-ORIG-GUID: vJTQ8m6eCBUuV9BmnbtQ00uxgcViLMAQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX4BZGmOFykxoA
 uK0TXrftpO+46EN16E5IJw4+KR5HU6ytZn50H1MlQYZcFOQKTM71npLJ0cl/yciWHhReqVRDqAl
 2x3Ra0/XIHrKzb3xCKaK/WHnj3j1J7O2qoF964+76EYJTAPtsdZLiycyYD83gNcM6AXYPuO2qEW
 nxT2SFuzDl4gVPc99sJihHVVnAiFxHPm9jQZRYPit2+NmBEQBnwXbvIs0BGLwXK4T5Xmj/xB4FK
 3/0Wf6kJ7E/Zg18cWIl73CZTZGlb9KDTr/3QVKMy4PE1dFqChV4Z1n8Z/McfmPUo8CQu0Z9L/AF
 vtsxlFyodThMBZELFW5FA8cU8FCf6BH5TdiIwhNqZt0LkbRqpySDndpz7qmqadEeZTJQahjnLll
 8nePO/xFBONlZwfSBrQ/8Ge3vpgVhyAIdB2owUr9W7YS50cSnS7kiOhMgB1p2lgYAmxhaCdYHh4
 3AHytcSah/9fvItZaLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfXxQMQ7IWvxTkb
 v+c6vcDsx3c/Xn09iBt/fFa4QIQahrTLBVRz/qyjDklhtKWEurh0NnO5+AdJRdaSQBy/8F9f6rT
 QAsqyHuPfLyBHWZoYGR8IZAPmMcbFo4=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af590c5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=3XU7zFwr6z3BxEykzYQA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120040

On 16-10-2026 17:40, Kuldeep Singh wrote:
> On 13-10-2026 12:14, Krzysztof Kozlowski wrote:
>> On Tue, Oct 06, 2026 at 04:44:03PM +0530, Kuldeep Singh wrote:
>>> Shikra reuses the same QCE integration as Agatti and should follow the
>>
>> `git grep Agatti` gives zero.
> 
> Agatti is chipset name and compatible name is "qcom,qcm2290-qce".
> Maybe I'll mention both next time.
> 
>>
>>> corresponding binding requirements too.
>>>
>>> Move the Shikra compatible to the appropriate binding hierarchy
>>> (matching qcom,qcm2290-qce) to reflect the underlying hardware
>>> description.
>>
>> You do not change any binding hierarchy. You are changing fallback
>> compatible which is ABI break without any reason.
> 
> Agatti and shikra both consume RPMCC managed clocks and clk-smd-rpm.c
> does proxy clocks voting as of now even when no consumer is voting for
> it. The required consumer i.e QCE need to vote for it explicitly as
> proxy voting being dropped now in patch [1].
> 
> As agatti(qcom,qcm2290-qce) specifies explicit clock entry as per the
> spec[2] and shikra is derivative of agatti hence, follow the same
> convention.
> 
> Coming to updating fallback compatible introducing ABI break,
> "qcom,shikra-qce" compatible in bindings got accepted in v7.3[3] but not
> the corresponding DTS change[4](which consume this compatible), the DTS
> change is queued for v7.4[5].
> 
> So we can straightaway update the hierarchy then?

I was away on vacation for more than 2weeks and hence couldn't catchup
on the thread. Sorry for delayed response.

Krzysztof, So we can update hierarchy directly right?
Let me send v2 with your prior suggestions.

-- 
Regards
Kuldeep

