Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5636A44999A
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 19:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783624427; cv=none; b=tfhapG3SkvE8K3hpH9TZ5wriWsJAMAiUwoACUQOIVTRxUPXmloj3i+S2jLACpGYTkBbMaa8r216JjQ4UGwpor3WUdaVQP98ImCaTritcKH1ceRXkWEeRW7GaGHR3tEfssGnbk3YmRvwEXvLEKeAgSMo+rZPQYERIN0J5L++1PDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783624427; c=relaxed/simple;
	bh=BUKK0ZC2pEiS4Dm4MMXPIkIVgQy8fsNEZuYUy1kPR0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E9xhMWohX/LPkusGr5DgctK9OLSjFZ1DxY/8WOTse4sJUCtQIOf1MADO7hFp37Hhh1/6p/tWRgo/IMxb/khhOdh8C0P9URK+mFzYHItPBM+la0I2h8NgEjDojXqIYQ77v9LFQPDJ7sc5pqbqjZAOM4e0AbI4A0qZ8u+nv1Zd86Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNheesOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jv600KhG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNheesOf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jv600KhG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HWvK82502425
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 19:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ukg8K27ZNplR+yNjefMWINfSHgjifpE3C2eq9F7iWjM=; b=KNheesOfomsVUduc
	CcvE8SZac96fJwdfD/TF5VQoEEcRgWj7I7Frf00hqvY9YqdBKm+Q4GHzmND/guqL
	btUvlew9kmRNw+mfAP2J5jKDtmluhG7B4jpcDaecLJDHLua6GQA6kXhzFr+ldrb5
	jq0mhLmSnUMZWsb9Obz8avq6lEubhe6hzOH4+7RJzLx85w70UhKvzl6DAzRxb0So
	b/XFXEOcEn+TUYyz7rsBbLtMnbUfuTClcpfLx7lfS6duopKQc1jj+ivBPNAwOUCh
	ZWXzokrJCv4KqAa8umDnUVMD6E43C8+9lcMn7+xCHPtCFduKmq8bbtZE1nNfKuRt
	Jz7J5Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3ugsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 19:13:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e21552dso2886285a.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783624424; x=1784229224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ukg8K27ZNplR+yNjefMWINfSHgjifpE3C2eq9F7iWjM=;
        b=Jv600KhGq6mbOgNttUM8RR/c7rrElUq6MO+CxXen2XIq+7y8P7qx2fz7rQgSDQXB1Y
         iUtkmqG5dPNNtWMzsMHeI67Wzm40NNixF6Ky7fqSNZMs6TrL9pErwple7LkAjFhI+kzO
         nNCP3eGmA8dlKynAeYv2hLpJNoS7ING48347e/BYKXBwFnNKGMd7l5e+OTvPjygrlDio
         uQ6q6EO4XEOWzg08eYdcP+u7tLBiPUqxIBP8bsuBq+pLIVGncu18QxwDZmSayRQxI0sS
         mBf8UDpTka7hjhDA3DMDy7aQH+QWGDze0Y/K+f22Vb7TbwAWozbdyqqzAgftO6hXwWL0
         YYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783624424; x=1784229224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ukg8K27ZNplR+yNjefMWINfSHgjifpE3C2eq9F7iWjM=;
        b=gUCZuYeWGd0UB8dUskRpZ0wd6xQQwDRoUiqx5ICcP/K8jgLXowTqE+ThoNuqAs+hWB
         33xWnQlMZGXQLP3/bVqQ2nXhtwKLUYEHF7GqCFRXJHpobh32HRUGQZambqFepb7Zaa3B
         5nhZ5mh7gAh2TIzLxFNbBjvpvnJ3H2chcv/rZ/J7S/bjaXMxq84s5vBraqVLovKDwB7l
         Btd1B50F87imoaqm1pNWRjJyz0CAmtIVA2vmv65SAt9v6oqsEIQGqRLHRZlhZzkuTzlp
         qidcHsYxlRwYOGXZWLz7PVTWSVM09UlVzkUU09ynW4LpqSJ56RP2QC4j7TroUu6Pa+tb
         Nvbg==
X-Forwarded-Encrypted: i=1; AHgh+RoscIGfmFxowWQnj19L9CVTow6yj/yFbgJXwwIgqF2BxdkFOEfku4J5RR7DJ6wystX9lDmrJAK8JTKN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq9ne5+E9rP4xIUPF0z4emVLOowZL35aVqnOsmAfRVszM1Xl2r
	tGUz5oMWL4o5vAC/S1EX2cn6j4cuflMonsc2MWAYa0HLZe3xtfFvwyaEolOk+NLsEuu1y/sqzkA
	XLN1/O5ufpMVSP3JKaJyYC2aUM79KE1XJLknbMLp/ptW+JK3JVck88HSBInMUML7t
X-Gm-Gg: AfdE7ckytUVGuNCeqGcDM9/fAcuuO7Gcn791cHU0X8AoFGPRshfrHDulgCsXU6hHeOu
	UFrbohY9jiuoV8r6mRM28u9yMeKF6XkqXoxisQsV6iJsOYuOoPzU0PFi8iWi0vmHSvS6xYVpP9K
	DSzjoPJ5CHWqZgCANSLsxrHUVfV9k08jMgVa/hrdzVzQUmO7y2lor6OiZ5zynlGorf2Aod1RPNl
	rHiN1zOIWVEqLIuKLDMu1740b9lTtcA956XJSsnBIo1VdC3VpPu0H/7d9Jey65NNBhElmtEzMx9
	+8uqRrs+CaSfq5YO7NZ5j1E4Qk5KmiYax3K5kSFJ33DfSeiiUy4lr+hSOd/DEXUPSNasd6bxduD
	WuR7HPJaTXgjy0xZnvBia5tn0D8JGRrYDbpA=
X-Received: by 2002:a05:6214:529c:b0:8eb:1061:552c with SMTP id 6a1803df08f44-8ff941c2fc6mr52515786d6.5.1783624424233;
        Thu, 09 Jul 2026 12:13:44 -0700 (PDT)
X-Received: by 2002:a05:6214:529c:b0:8eb:1061:552c with SMTP id 6a1803df08f44-8ff941c2fc6mr52515356d6.5.1783624423732;
        Thu, 09 Jul 2026 12:13:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69c14972fc7sm595785a12.22.2026.07.09.12.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 12:13:42 -0700 (PDT)
Message-ID: <88edd673-1220-43ca-805f-675890be0cfc@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 21:13:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] arm64: dts: qcom: shikra: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aastha Pandey <aastha.pandey@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
 <20260710-shikra-gpu-v6-6-b388ec5dce77@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-6-b388ec5dce77@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BYDZQwx5cKqY5RFKLqqigmfv7gX6-74e
X-Proofpoint-GUID: BYDZQwx5cKqY5RFKLqqigmfv7gX6-74e
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4ff2e9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4OSBTYWx0ZWRfX+yJreTcRxT8K
 6P21tx+cj4/8NJf6sQjXGUF7xSMKwYdq194NheB3Nd7OGG/lXebVZlBE0fkW4D9/BaFCqWfptXR
 G5DF8/5+aVK9DD2YFZISqxc6ksbPehg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4OSBTYWx0ZWRfXz8ywiyvRcXG9
 4JJl15cxLlYNaHCD5a7geR900B+zPUYyQP++CN0ORULoKOp6JJxGpeRb9Wb8h4zYZ0cuxO+XEdf
 5mpn5eKDAHp0fLE7NqnqoY04tVLIxP2cSCV+G8sPqKgtiM/iWsdzvCkv9GhWXLOtIiNNCPfa9iV
 W5/x9N+WDIYil2pYh5xzGRaWBcgyrd0vpxgsElye+cSuXBmOtRwlqpqPsMNkaaEp6+dl51km9EY
 1jzTPTjct+faJE3r0mza+eeSm71sLkH2H0qijk+yWXst1+POhw4FBNasZTCiLVirqiHlJ2deCjs
 sB/YL/Ylo6D/uxP0cWeEhWqFjTQkrNebAq4YI0E6M+M5wgV3ZNyPQR6Ump6SSJ0N+voX/DRL+hR
 GFnZ0+Kn0XdWQ4T4dUpYCLkC20SIYL18DQRyXbNTXRKHl45RiHmwZKomQgz6zMOoMtVHcu2I+8S
 AkHh15b1XTWSt4ck2bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090189

On 7/9/26 8:42 PM, Akhil P Oommen wrote:
> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures. Set up GPU cooling by throttling the GPU speed
> when reaching 115°C.
> 
> Without passive_delay, the governor fires only on trip crossing
> interrupts. Temperature stabilizing between two trips generates no
> interrupt, so not all cooling levels are applied. Set passive_delay to
> enable periodic polling to ensure all cooling levels are applied.
> 
> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
