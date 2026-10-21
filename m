Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585055;
	b=Ibg9b1wAJdpw7BRbIZGEKsw4wGXso+nSIXImRXx/lGrdarjzYE37qLcYH7s17g1YH54u
	 nmKfZiRj+6wTMgIJ7LEfOTsnhx082Gfz1y8c+UkdW0DTPISEC4YLF7J44eYrXcqlHUXYo
	 h0TizDlmWIbOGKmSYZ9kAlUYaeV8w4/TksZQ+v6rFT3sMQLKSqGSTqgYiH9G1Gf8e95dO
	 SH4q/I4NbJOARe3MpMFq/40GcF3O79VOFHXZr2w58FF8OoxIT78rKXnxEQbhpAfKyNxFn
	 7wAixTKZcmQf2qg33zKlN4UL/U0rcPim4h9e2MvUrWMJkagwYQFPlQaEfCcBKbyMAJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585055;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZU6PoNWZ5NCCd4q+Ok+vNmLM5ByE8F5bCoJ7jkP5aB4=;
	b=QrEKujedzDNregtFSE/tC24a4AIcQvmdLNG6HS1m2I6hFukyEf1glj736k3d2mOALsS7
	 0h4tcD3sm3SacsDu7ckDq+ayKWgEkwWAFRzwqDkGsOqsKgPLuPyNnUgoysyxxOvPie8II
	 bamX74U6ewn4z5Op+L/Y7yw/ZsZiWxb/Zjhyb0/j+DM33rOdjiZ10gE+HDeEpS+8iFS5W
	 J7zZHLhGmBUBYSnaZq8M9lzMDZhNQCg3lgdvmdOoc1UZLamvlib2RHXA5tKaAsXj5VQLV
	 3YRGIC9psjelOCbuj/YV+9lGryK9F7ApYVjJh7uYT/uqR9sngduaPrbvqnVdu2aCCaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hq106wdr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fKkrU0u6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E6460A2607
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E6460A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hq106wdr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fKkrU0u6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBfxDs1599796
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZU6PoNWZ5NCCd4q+Ok+vNmLM5ByE8F5bCoJ7jkP5aB4=; b=hq106wdrCvnaZp0/
	BDLD2cDahdCUmhRWtZjpB+7YCshF6VxeNFrTXtBUIvGmxn8HfZUQBQtFWdETR5vq
	aYsCTkQ2WCNu0HvEYe+8sKcEXmkAKQ6+wxJsvtFiFQPQGE39zUTmrvtj0/GVRT5T
	bAai/mO/sam/re1hV/u/G7r9+KNmOpzi4qG2FEEyEX7L9zIo/QklZBferOfvRFjH
	JDO+ZG3pcHZtz4eeQTsjPvBqlg8PGlKrMZ3hV8rM6QPf3JNprzpU6Wjh+u5LZyLw
	Vob4+9lHqLmibwB1StTXcUvs+Xhf3V0ORWrzQNNcAtVDBEvjfhAIvBJiPHwI/oFd
	JLmlmA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhugc5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:17:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb1091fffso10199585a.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792585053; x=1793189853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZU6PoNWZ5NCCd4q+Ok+vNmLM5ByE8F5bCoJ7jkP5aB4=;
        b=fKkrU0u6A9fBdR3M++1pZHdvYPfCEB95kmPNClgzKscG2EiXw3swQIZIFBG3xKuMGf
         BcfCcqU9eCvXcTd77EChyxcgqzn9qVEJdcXu2bcvtpSD9/IjDc87zlDO4fZgjT62AfZf
         8HNk2bu44xeCv31uNynYyID3P1J2xLxUfpzC3pPD7jcdUrrarLcOv5ISm7Nc9L7Eij8X
         sxu8JrAPfcQS+uwqWS5RJpURa02cnYkHjTJdZDh1U+bF/g8kaqM8qvjlR8RAdpIs6UvZ
         DvaFQTF7JdSy4xwvABCAHj8+PMscWhjNqfZF8F1kbmZ3tJoMxpqFt906pgh5uv/hktNl
         TGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585053; x=1793189853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZU6PoNWZ5NCCd4q+Ok+vNmLM5ByE8F5bCoJ7jkP5aB4=;
        b=Ge9IwoZRwDmo8DBDuASoPHgoiREmm00MN1MJGeRmIxQjiKx+U6S+65HgivcdSNfyM5
         Mklh/U9WOALTurnmR8O2jP6/EmoEf3czM1jPzvM0QGkna3VhpF8OlVmdwghewHHdZ6Ng
         5YDF7ATwbFewBt98j3j8xBtm/PbDdBTONXCG6KkcUrXEf1NOuEIng0bIwe5oo5xbPq2n
         vkZpKHHntqaMWiV4QwgtkTZSZapS9tyYSTSFTV5P1BRBJRjXJ1JMKcvBxd6VIRqxe5EO
         /FmuU+rOJxQ9VZ+c4dBKLh9ZvA+LplBO/PHJ74Kw0NUnyMNLT0bnvq7HOdtqWnG0FbGK
         KhCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAJNyWNMusmbMrVPjYU1CnzPWzefJSiSpdZi+mGHuQQ87ONumVinX6cvfJi7y6AzNgpnqFd0oPEjtB@vger.kernel.org
X-Gm-Message-State: AFq9FYJLmvgksB5BntgU5KmpqlZPXgwONIDQ401ddJAemI1Mei7p1GBd
	qfnqFJ9F0OHP2XTdC7GhyG4hSync3pKM3PIsjdM5gHG8R/8zW0AMzy3BbIJGFKutvVn6ToY6Q2W
	vGndgiZ7/bYgOGSagxwQyUVXL+efn+b3xN/yz8zYnmRwE1Vhxz7bFsBqT3tsoasaj
X-Gm-Gg: AYBFou2R6xpLJrcMQmyE/60lI5w9hnM0ntS8QCbvyTFe8OpTvjeBZha89gOPRG2C2C3
	/C6NwMArbJsSiBhwVwiuo5LzXZTv6iBGSV84gzdRu6XvHosYafBc7WHKdiErKC14ZyQxf6V4lb7
	xzgqAc3AX/HtvNObipmOwhGhRCvD3d8YeX10eJdWEIpDI3TgyOnpKT+ALeS9MS75J7TaRfbEJ7l
	WDFXcL421aAf2ih87v1KpXpzDunaLO0UYANTmOy1Xrt/AyllYwq7bcbCpzxqhC48j3HY37tSadg
	ix0K34WOjuHU6Ey1n71vfVbuOjBYnSKVb7/4d3GlUKHMog/pjxDFBHBteEAEEKYq1J3YNb+SVp5
	QYsr6OX5h0Zhz9jx5zb3SNQ==
X-Received: by 2002:a05:620a:6493:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f57ff1ff9mr436659485a.6.1792585053165;
        Wed, 21 Oct 2026 05:17:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6493:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f57ff1ff9mr436652385a.6.1792585052487;
        Wed, 21 Oct 2026 05:17:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f7c55asm71894466b.20.2026.10.21.05.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:17:31 -0700 (PDT)
Message-ID: <eb5a2294-2e1e-4449-827d-eccea61198d8@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:17:28 +0200
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
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: eliza: Add iris video codec node
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
 <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8ad5e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Db7omukDTCqXEX29fTMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX47isWDk3IOZo
 ZTMMnJYQ+J4l8TYZCNK5I14BnSR2ATt6Rv2j4sQCY+ZJJ251TE9Qs2Phh7ZLGrQcBqIFYNavCmc
 uH9z01KnW06SNC4P7n+7rCe+slbAVSc=
X-Proofpoint-GUID: 9HEJL_DLXE_jbVizL98pTzk4JaO1y6i5
X-Proofpoint-ORIG-GUID: 9HEJL_DLXE_jbVizL98pTzk4JaO1y6i5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX+9WLpS8E7eAC
 ydXAPsSxPGJESoxu74HBn9xYBc+6v6UDIoOdRDB93LJh49mWn7aTdyvXno9SkU+VbgG16KIP6uX
 LC/ifxJTz7GcP9oI3M3mwcdos9+3DUPTEX9TBhBVhgCg/cHhzHqFFyOSyff0Tj/YGuJiYgviTl+
 jAmMwt1b+RX5p4MmXrfMSTlyjQ3jfd3ecFw9Qu1CcE1Q5Mc+5yB0a9IE/4o9IJ7De3ybKkfkTFO
 msLAW4SV5chlMRbLfGIqoFbcYQUuMagOaaOgSOQuRCAes6F/vUO3lJ6YW6KmtFz2fKmQXyaEOxF
 uTprybsAV6cmeeF/vhT1qP+wQpx/jp+PO0aWZ/Xf+CB+AxGJShEYcBQsTavyyZQSfdUIZSVxv/Q
 rXZPkLuYutySJKlA272pkv9Frp/DbCgduz2alpM5H2fax2cdFfRw1cvaambe0HjJnY/lyjMP6n/
 K8bAsVRmKVd3RpxqkKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210048

On 9/21/26 11:51 AM, Wangao Wang wrote:
> Describe the Iris video codec hardware found in the Eliza SoC. The iris
> node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
> GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
> codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
> support.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
