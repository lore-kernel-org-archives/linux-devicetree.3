Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884596;
	b=rp8d7dfPw2carF0BhssBctSvi0W32fvaZUhH6bZJEPyXLuiALkehJ8k/U4AJpsw08TD6
	 j5DsZpGcayFrMhC73q8lxIhaddMWMtvv1gATTM3GXQ93VTWytdubjOS+JtqGJ7npzNT1e
	 pAWpnWXECOAg4vQY0Eko2kSkrr0q1zwppwGvpoZkotRWGDEjy9Hd/WJuDmv6WU56dExpc
	 6u4t0oFUHkyaLp0PKPvJtgNmlVoAHujsKeP8DTctyfPrctPdvg008Cqq/+EowgIht/5UP
	 HYtJRlpEbTKgm/Jj/1wOBR+tu5p/ESWnHHW/+cWxIijqZ2ZwIXxilZxmMWWy1UVBgMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884596;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BQjd9rrnkPjYMwArfA9FYliMwVSym69xMCbh5BRXbV8=;
	b=qfQp6/GahOE4fQ4tM8a0XkBcwTqV3kCPFzEIurOzSKPfBI7tzWGBZ0dt6UM/dchBloFL
	 dDQuq3ozrkdYYx0+hXG7WfS7rCP2WlQ6yYWQO7LPQxlQSJAPN1fu/0zIeojZrM1dJMO5z
	 BM59fbueWQ4mGyxwnDOYD7fIWUMv+Q79v5fDt1zZYStqRaaZk0VNwgUPE6L+eRlwjIGtV
	 9VNxUUCqRoW34qggnTZ/B6WryHVyylxh3dydXyfHUCUCAUxGumgmxVmYQl0cq/PVNsQok
	 6WQvgo79Hur/GPx1dtEcvIcly8nHaMckIW7pt9yK3P9qepbBzCn8Jn0cmxIPhbkVMiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mlLm/5/u";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AaYlpuK5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5A9606D802
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A5A9606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mlLm/5/u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AaYlpuK5
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tbDN1028238
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 13:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BQjd9rrnkPjYMwArfA9FYliMwVSym69xMCbh5BRXbV8=; b=mlLm/5/uHHXkUXs3
	Zflt46dpp1qf2i4nxLhhb/W+/5FsD0pbicAD3o+LolSsTQXIeKoPYP95ZJlpXe6I
	sqpczlbM4+VLCl/hjWnJT/bVtsg1GZp7BeJ3i1e7dXIBj015CLQyQbXlGrybWQ/C
	VvdBFQQRsCIWnGZkV9GYHafbVQCa46/rLKwcaWWXU5tp5KNgB1DLZaO79kncRywg
	VWOdmY63T/NQFYGp5YrfCi+lUBIAv28Hb4Po2jj+LFS6gQ7fxOz0qPxw4z3CUmz1
	5Y63uKXcOMZ4JZCfg2IEIY2VWPovPs23HwzXxFQXp8spXUbUr7/fMYPWfX4qDBex
	mUbpJQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq9y1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:16:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eab0ea26afso73230e0c.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 05:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884594; x=1794489394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQjd9rrnkPjYMwArfA9FYliMwVSym69xMCbh5BRXbV8=;
        b=AaYlpuK5+H7azlTpt6aNiNO6taFzt1Sy2iEXp7Nm2k5PzhG/JywdL15b1fvqI3W3+7
         7h5AMIKI/yoeZdZyqfQVkkbOaN1WnfzBJNXnO0OlMjiDeQqcx1OoRYXWpFqCg8XHaMVE
         84Mc/uaml6I+T35mDSE/T+wYQEMU1v+t52Y/j+9QXQ1QewDghX6QO1CaRLSsfGVuG2Uc
         ZwSINFba+qm0SLIo8cNxxexy/VyYQSCnOVQfvcIB+71CX/Dkvg5YhsS9TJ+Jo8tY34Xg
         MxTaWGYq1+oQqJB6mJMhfBT4wl7m8xmcuKsFaI8nWD3wW6LGdNs9YR+M2UDf4NiUXFFg
         zbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884594; x=1794489394;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQjd9rrnkPjYMwArfA9FYliMwVSym69xMCbh5BRXbV8=;
        b=XgDEuTtwxdckkmVXMMk4y0iqC2Kj9R0SkE9Qkf2JJkhyuMFRE297nGdBlZX+WeHA3o
         onsAuHmi2qFOoHK8qDnH9kxRc1iGWx7nbxtW0tT5Zrn1AYcmV/2TsO/WgTWwMt7ZdKce
         nUoopAkcUIh1SQEelWUVIYuCi+adtYPJyu+XUwibq5EJEM/bM+i5BHM7YGy1XyjS9x+Q
         HloSRQzCa3a3kRRZrSpmpbbqENjzOvOYm1j2fJCuJoIgmCxo+jZgGWgxtlaZkjbDIq3P
         PT4hxGp/f9ybAy78Q+WKPLjTYhiF4BbJ/El68rBTaFj1nPq4AsEblnfZG01oDf7WIjjj
         JFeQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0sU/yyvvRMmdjHRhWx5H4XQusAqwdebq44QDo8SXP0JcoMf2AQkMWXSb5xBnLONsFtKdOvCyDScz5@vger.kernel.org
X-Gm-Message-State: APuU4Z8v7SfqB3oX/wCv1EQpVCh1SmloTtC5lz+Cxn+SY28ZsaYQwaGH
	zemJTBc+2K+Sw1DzP+yXKV3zjkAGXppO92fl+u5Ltz9MMxTT0APVXQZrxHw0/h9spgF42PdtihL
	TAxuDyWcHaDHQsJQQuPuq+guveUMUBXtYcCvZk9owhIzYdN258gAdtbhU2Ao5jyqp
X-Gm-Gg: AYBFou3oB0EGsRiuDuCDG2/dGZrxUknq2bL5ij7p5lK98tVkDoSuDsF1CiJhhv5zqXj
	VN5x/l84Fsf8IVoGZg/l86fHsP8d28fuq9WLKoJLLvJJrdMpJl7xSQRXgDi5PtdWRQcmXOBHcXn
	jCiHQb+Mi7KiwNqLTZfs7xtl1HeBcFBgR8y9amk9/fP9fT/PHSRJSGXR1wD8EZaoJOBcHPBkORI
	WH7jgXhq5/VAe0HMJ6PfwIg8uz2YhhOdvN1JprMFPgsds4OmPr11dVq+wdeV6eIiX0AW/Y//upA
	vKiNSKYtsaLcRicIzOqhsh6IxbESNclM7HvwLsP25cHn/9y0Tms2JscFk90OJsLpA1feHfQ9ab0
	zlIk5v+EHiqsc2WHS8JDoKqQzPlo+nASoyGC05h08r8fs01bLOvwehPPO4Pkdtx+rVRRZ
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr9998813e0c.5.1793884594290;
        Thu, 05 Nov 2026 05:16:34 -0800 (PST)
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr9998771e0c.5.1793884593827;
        Thu, 05 Nov 2026 05:16:33 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e41da78sm172632266b.16.2026.11.05.05.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 05:16:33 -0800 (PST)
Message-ID: <8b93144b-08d0-4333-a334-804eadf04cb7@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 14:16:29 +0100
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
Subject: Re: [PATCH v2 3/4] clk: qcom: av1ecc-glymur: Add AV1E clock
 controller driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
 <20261104-glymur-av1ecc-v2-3-7c25a73fe811@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104-glymur-av1ecc-v2-3-7c25a73fe811@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uUuqK8ZiY3nTPRXSg5MUaQTXRKNkpXiP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfXwbBCW6YBdWsO
 BMZRGDDKJI3Hkp+r3wRo6lg91lYHJuytIlvwuWXXAqbnysk3NRVU6OswjArpKLZJ4zIGHbBrJ0q
 A/xSK3fgL/w/vIcz97kNCs9QD3l9waU=
X-Proofpoint-ORIG-GUID: uUuqK8ZiY3nTPRXSg5MUaQTXRKNkpXiP
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec81b2 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_WYHhi0DWFvV3-2RZcIA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX1JuvGO1Y0M1Y
 Rf3V9WGoug6NgWfZHw2SMcdnQXt3tS685SGSWFrwwXxeaG7Me+yiCL+KZ3RFtxGvvWrXnw1JEdY
 oyIpipoN9aMTC29a8NSJWZmg8K31g5YWIlYrXJffBXdiNUvnrEwbyup5cWK/Mo79jALz3Ld//K5
 c5zS55GuT4JmGh6Nwyhwl1o6XJwcK8jAidJqztDbVqtBsyiSUQCwZeeyneVDEkgnKPdj3Wr1WNs
 N1vO8WUXy98fXvvW083/Sou6FX+VamAMcogbtl6c0Uzd+lM9u0ZjnBZfz4hkV7+OwcZ5PP3AuPJ
 fp+KCj4aLFhphnb+/+8ET8/ccqKWFdm3FpvIlIrko1XK83eQ46oOxQYf9oLR9Wpi8weCkLefuxh
 pyCI6v70tJDMNHW1gvH3Wqj10/zSsHnpS30Byx/n+kGwDUloK3854dGEA8Pt/XUcGryAaWLEWxH
 oP0e3j4nazLwKLrykkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050052

On 11/4/26 6:07 AM, Jagadeesh Kona wrote:
> Add support for the AV1 encoder clock controller (AV1ECC) driver
> for clients to be able to request for AV1ECC clocks on Qualcomm
> Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
