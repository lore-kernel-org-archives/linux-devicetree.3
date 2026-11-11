Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423917;
	b=Z9DvJeeW5jpg3HIYBG8dyzBxxhFSCkTrpXxQq6jXTYfol64bdokSy8SMrALw2dwa5pIP
	 YoFn7hoSVVyLej2HhVHyuc3hrOIKyaoD+j1lkGzRg7N+DiPPOSZHrM4U3D9i/koJWCgvj
	 fX/6W51RnPQRHsIqSuXVs3qnVqt0E4zlRExnCqVUM+JcmbPW0czaxmjAskuWJahQRwOrs
	 E7eHagD02nZ1cUWKNSBP6wbh2Wj03fO+V0RpXjT9I6+xR/EKYcVGvn0XFd4Dg5Fn5sUig
	 cm8jus3/rGjaKJciTPs4XGFLcyo4BB0G1sTvQCTsM8EuKksESPigTp9sNn6S7xVSd8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423917;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vHQpceOMVqrxK4K5nhzSoZfKVb5Q6Arz3ZXzuTEVYQ8=;
	b=NHZib0W2i20zwqL/yiIeCbqw+VpFImrj2ylYO2vw+D/gt/OkZLTXf8dCTEZVhQuHVGvu
	 2x7LDsLJLFGBi3aPIYNX5aJU/tS9iyVeZKS/SqNfgRjHbTn4o5fvk16joyowX++aR0OwE
	 AoNSTon/PtgYzNdL7dPLnac9QDUjaecUNLKqE4DMSgHwijhxLgjG1CY5O2FiX15EJMxGY
	 7sFp+FeGcuWN2o6RTCCVdDd9nRFAheMiYI7RzOvaH4iYQa/qPuiOV4UWJSyx1NQmzuQuk
	 eAF4pSJAxNa+OO8Faw06IH4vJ8NmjLdgInySuCefBbbR15PfAQMmRUepmQ/mf7IoO7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WA4r7QNw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DzuvQHvZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B18A606A32A
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B18A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WA4r7QNw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DzuvQHvZ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABIppIZ2624816
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vHQpceOMVqrxK4K5nhzSoZfKVb5Q6Arz3ZXzuTEVYQ8=; b=WA4r7QNwYdUWzD1g
	ik1urAHVhkUJ9bk3VXGgwlhcsaikJWbfCrXBb6izH5Gfe06Zx4kXTHnfndj+3Sjd
	5JRFprhF1M1qhbxvBEzVhlOAYHET9SZBZaVdom5T5ha5fgbZOD/4DAAIfXC+tk16
	pt/mj3d4+7WEWUIQkp/RvUsEu8dGMdUPprrekaTki+X99MXMqONYMLQsVU8lTevD
	B+4+JDh3lIiVAhVdFBV8pFzU5Tw7V4LQ3cHyvSa8i8fWudR+K+zwptxCxeGzKMgb
	BFaLCsIhkbpS1/FpZQx8F7txXChQdWsWZhTJNMzQwtfdwThxx+4eoa9vNP8EEnYY
	7YcNcg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawkpe9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:05:16 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c83124d530so4058105e0c.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794423915; x=1795028715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vHQpceOMVqrxK4K5nhzSoZfKVb5Q6Arz3ZXzuTEVYQ8=;
        b=DzuvQHvZJZ1J59qF+fob5mgba1BQj2/0pjLTzJXFzK/YvGENPnV/5N2EngVuKw/Maa
         kA7sfOICZZSdVEWdU0M2Y4z29lZ4EClmyHpQ6PfN8a7qj22i5gyB+G8wNKEcC6x4Mc3a
         DYiOaYi+nmC7GWxnCcU2cMRB74NjzYQH/RC8MXgtW/RZMlq9NQ/RfPbZkTrmgo68Rl4R
         c2V517BQipnixyvy9ADLRdsLjP2PYyGASYQGlGh8+kz4UzfLcjzKpNaUBFjj0lRYJcN8
         1xqg9xfa0DTbLl3bQXKC7bfdQD/OAzHLy7iXbjjJYwP//gy4GrBU2kjbZjjzmC5xWmyF
         audA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423915; x=1795028715;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHQpceOMVqrxK4K5nhzSoZfKVb5Q6Arz3ZXzuTEVYQ8=;
        b=EiwKGnZpye65zieVrHypP6hIVkDowyZMDzjxwDxPrhrTNC8ZDeej5kmEmsiU8LyJeo
         IhyP+FGXXzvWKoihv5Jv1bSo5JkBwOkowtVUZnyf+0pJuksyFqK+N+vJwy3GTU+neVaC
         Lgid4OhHJ/05PrU/psUO1mRB0vOkf+18ZlcROXASpNL9HTkD533SdKOpja9xNJFwfx2N
         6yvrpAx4nOBTwkBkvR7+teifPDoQPQiGjnEJ5v1KTfKDbkEyjgCtFTm8b18W7O3MMVmV
         2ytqoOd/LO/a/wO1l+1TEWFCcz4R+Q8p3OU0rioJyx5DbWnUHZhNpayGqFF+bSfr9U8s
         Yq1Q==
X-Gm-Message-State: APuU4Z96S3Or9Vgykbn/ClLcjioPAhuomRLZD0EKaYGgEj8NMyZXEyMV
	6NuIn6jcRxmKTJrgLpgkS43OfGGLyCt4i9BSdkyAQvrJ6xH2tOPRiXwv943occXnlsK8/koezOH
	Hxw+PmJmGK/xn/ZNrJ6642dR+6CIilxyrwbXLaicoPUUUnviCeSZFS/psgx2w3coP
X-Gm-Gg: AYBFou2AJ6ptN+T29rwuENVtlFUafxfzig/nZj0HAunoWXfFvygwIWBg2dium/HfWZs
	swd+2/cInEFZeqlPcIm2n12tYmeVAf0QcQWde8LoPpL+5ceICk0QhAL5HzfG2QVi/5gs8xYRTFq
	HvHE+UVYqGk8vJNkw54NSR9LhGFZE3PsvmCgvIsbk1sQiyEi7DwCRR+xPetirF/CYJdO2hUh3rY
	xZ1DCbcf49oX1YeaLSfT2ar8vhdOjepm5oNJiMFHR4Vbn0RM2RbmK7wBPQFqiU9SNLxATX8xaNP
	Mgdo9v4Qq7AJbNUx/XO8KjV2A+sdTxpGZ7wZ8M1O7MP3BokyGAJV9EoVujOo+zGwCgIp5q9/6gS
	f64ZwAPjoRyUqexzgoDaNCiyLaK1WsB+Gr7YAOAnZWj/VaFqky/RfxEjpQ1J/5eIDvZytWczdVC
	E=
X-Received: by 2002:a05:6122:20a8:b0:5ea:be1b:1b24 with SMTP id 71dfb90a1353d-5ee1c42fdbemr1303144e0c.13.1794423915221;
        Wed, 11 Nov 2026 11:05:15 -0800 (PST)
X-Received: by 2002:a05:6122:20a8:b0:5ea:be1b:1b24 with SMTP id 71dfb90a1353d-5ee1c42fdbemr1303095e0c.13.1794423914770;
        Wed, 11 Nov 2026 11:05:14 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e1f5810sm9023055e9.0.2026.11.11.11.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:05:13 -0800 (PST)
Message-ID: <9e2aba1a-61ea-445d-ba32-95ec57ab8139@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 20:05:12 +0100
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: msm8916: Disable disconnected
 DSI
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robh@kernel.org, conor+dt@kernel.org
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-1-fdf8fd97f49d@oss.qualcomm.com>
 <sashiko-outbox-209493@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-209493@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3NiBTYWx0ZWRfX1tEG/1P/gwc7
 m+JtAJit3uRzkm/Vw5WI1UTsXEeCm+gyArirnW/O6sEdp38EIb/1qCRhgfdSQbAql5O4kKcy955
 Kre3sWSYmdotBX5ejLv59NH+BbVNdNk=
X-Proofpoint-ORIG-GUID: TMZM5WemlsUnVClfcbvN-VUQ7NyX-hGS
X-Proofpoint-GUID: TMZM5WemlsUnVClfcbvN-VUQ7NyX-hGS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3NiBTYWx0ZWRfXxUBJCTj6YhCS
 kMN9kSoF85RrpQWjyJE0wSAIMca1WCIBoWR+Z1qVm6cctDMhVwRNs7H725CtQcVNF64MADd2bnk
 1GekaKAblWV6N+ka+qeUJxFGKelA9d4SRKrcdz559Z+O3o4uHDeNQmCRWuW9HnAOyNUVoW+sbB6
 N7kdrNVU8kkNS2hUJejUNn3Da4VKfPSaD0WvsxpbPWFQEAJLi+z/hybN/vAnbXaL4OY+V2xuftF
 hFBbYfjG7pQFtM+C2Ln8O76aJi4VDZfQ3qY/JyFd6RTFH4amXWSQXhr/YvImxJJf0EEn+L8/x5m
 yxsOoHa5gqjPsE6wwRZafIcdVa1pkZIGbnLkTr4s+A1E9267JUChsWQ5l3AHMEF4gzD1p8Q+ei9
 xhd52iZG/kUOcHFIs9xliwJsKE4uGM7fGFlVunp0C5/hJt5fedAwl2fOEx1ixaY5cZ+5pq9TweT
 CiuyttuNwfhC5UacfRw==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af4bc6c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=nhleFx_QHpCl84HZKpIA:9 a=QEXdDO2ut3YA:10 a=arBHhYMabMMA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110076

On 11/11/2026 19:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: qcom: msm8916: mdss_dsi0 left disabled on apq8016
>   boards

I swear these were enabled... ehhh...

Best regards,
Krzysztof
