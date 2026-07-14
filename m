Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42C53F9F51
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018010; cv=none; b=YIaeMj7vX8fhiQQU8DlD20yvdpzWLd+Wg63oPWhJnZkv44/+bvCr5LhaOcwvjCBpsR81t2pENspANns4qrGlNnnH9ltzmKzGLr970juncJkrvm3pcXbZVS6C9AzkUs0OAVBvq2NsO1kQSW0oBNB9+bLxRxavD3+vbapvf1Hk/pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018010; c=relaxed/simple;
	bh=h7/87QKXD/fbJfpAhjv8FHvRLmrxNr5rG4NhU+XedPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVAu2WReJM0GC8odr0e+lgBO7mNbmciE/nY94cr9wieYrO2wk4UERFF+oykx740n3S8v/ZOLEy8RdU0Viau48o3kUqaU5j0I+Ps6TanmpAAD4ySFftwQitL3MMDHZGYHmTTiJwKENjxdgTYkj/LB2ORyAdIGTZ+E3YriVkfT79Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcYr6G0Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xt9OcHB9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcYr6G0Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xt9OcHB9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6Sffk4005352
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qf5HpFHipPuzqMdwymBhE6vQiUD3/G9Ju7yaYuAtlzk=; b=CcYr6G0YoO+C5YFF
	hmZ4O2erC9bI9fEUs4EzXYdW+svtpIgYUIaJ+QemCDNQVaUwA2itV09F2juYI/PB
	HuJqh3KrXV+DQaJR3PNlC9W/e7N/PpevMznb1gY4MIkxSF8x1vE5kGxcm+n4Y3MT
	NJMJoLzKT6NCWhpxVoz0s47/wuMrhY7ZLzF5OGuPrut2GK72Ho/zIOIGXerK/Cvy
	bw6rf+iTIwLr89BWhcdh2MaHV5kstLSuYW0Tyi7qGqiRGhbN+g9dtGjhL9oX6ZHu
	Sk/mTojj3s87VlEZputg7bhRcdwHZgxuaw4RblHLjRbKraGgAssXE99qkohzkKxM
	p9jKmA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44ctuc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:33:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e695a3b28so69536285a.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 01:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784017998; x=1784622798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qf5HpFHipPuzqMdwymBhE6vQiUD3/G9Ju7yaYuAtlzk=;
        b=Xt9OcHB90JrlOFvfURLHBBF9+MjoMWWOzlSzeIsblo2MzVqjb5i4eDzgD8TZkiFQd4
         qb2aiPc+ZioGZ6p1tKvjOQ67h68D7jqa0GSblxCnfyeCCj9rXoaSZmUWyjrRi0qyTRCa
         n1p0o8WKSU1pOBEdpbidp59Da1RHm6xtNu7VfBEqbmi97uHt50eJ3t/IxYlgvjzwS+WK
         xDucrthHL8x2tQjR+p/INCdWhKqBDVCTUDuIf4frHatZyDKxa9gpfVn+FJC4mVVZ1RQ5
         JiUkfjfQpsUxyESCLD8OHqjmQTpVdH+cZCOCHGHPNikZ7CF594LGe7VuJzPaQF7mlGFE
         WHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784017998; x=1784622798;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qf5HpFHipPuzqMdwymBhE6vQiUD3/G9Ju7yaYuAtlzk=;
        b=gnTXFsnKWoytvyy5qko/K9mn+9Y27fl5Ty9z5VKP81pERUqjlpxntrLPkD51hFC3DP
         5wrFfXematgSFolx7VSUvYrobm6kBjOnuQLuOvEDLsb0TVYNomEJ++s2dbIyG4jmkbQm
         7wX8Xh+RJvY4XgArxObecnS4X3si2mHwI2pAOCatgSSzuURLUJ1eLMei+XkdSR2NXX/R
         DcPCudnhnLeD0AJEAJ5/TfXUgsJ/cRxMoQ9gn/ZBBG8UdU471zLeqMU3yKKzYtOusbOU
         zGXbGVJPOqynpILrs6n/SQWW37pzW3L4GNWm0SNt3mRIsa+915Sa8Xsalo1sHt4qFQRr
         Pr7A==
X-Forwarded-Encrypted: i=1; AHgh+RoMc/4TuxosZ9FomoTkuw7xvOo23ArMgX2T8dJBlbaYzsterGTpjzdlSXXi2JGQCKmgB5eQTbMYQEhC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk9k5XJ2cFEuiLzIZ3BkG1/tYbk8Gad4YbFS6AK5FGBxjnr2sH
	zQxiu2nTYw9UrnymEe4YxIjjvmNzJpgU06Y2IV6YTipx6OkwcKZzo1qGi+Y05uiJ12HQtrDuTEW
	VB+lqz/ljgz74mhaNQ1FqcEsrAKhKDFP3vX1RluoCrUapJQ/xL0EUwEYrk+mB6IEX
X-Gm-Gg: AfdE7clA9stnMjCX7O/W8XUrILE5j3Vzck26hkPypY2DtOu+2+nwqzJ+AgiC+UDI/ZC
	km6wXjKE4kv+dqoS3hVUO88xmEGYsMfVk/j1Gnt3d2TyVRZ3Nj9QmBuYU8Ko/VYkeI9tNK0+RxF
	IrdFya5XveL2YB8CmocrncrYvqTC6BP9n3eO06yxL2GaK50v/5Ob/4aVvjt4GDrlpLgSNsVMaGp
	1EkRqFfgtPaSgoJiFAlIHhPapUVQmj5NqChXzj6reIE4ghmcvSWb86+iM+KzTBhrup223wCMoEc
	4WkGir2aSBVKJwGN2QEFQj5fI0tNlafUDK2nAyhdBNT0OruHWiDGER6fBfD6ncrK8KkhPlG4Ufa
	i56EX8tnJ0SKG6VX0OgZHbGWWmREUFnnGUqV6hA==
X-Received: by 2002:a05:622a:588:b0:516:d83d:b28 with SMTP id d75a77b69052e-51caa08a385mr165941991cf.17.1784017997820;
        Tue, 14 Jul 2026 01:33:17 -0700 (PDT)
X-Received: by 2002:a05:622a:588:b0:516:d83d:b28 with SMTP id d75a77b69052e-51caa08a385mr165941831cf.17.1784017997425;
        Tue, 14 Jul 2026 01:33:17 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c15e6286a5csm736326066b.11.2026.07.14.01.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:33:16 -0700 (PDT)
Message-ID: <ac5e64b9-21e9-4a88-a14c-2aadc8eda73a@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:33:15 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
 <20260712134110.3306763-4-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260712134110.3306763-4-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uQsa3A-c_gQvOrfr5mariC7W9jQQ7JE4
X-Proofpoint-ORIG-GUID: uQsa3A-c_gQvOrfr5mariC7W9jQQ7JE4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4OSBTYWx0ZWRfX0l3a5s2Ineoi
 xmjUivajNGA6kuRH3IFO413YG59jCa6kHRVqv8uTx3IT9dYDTxrNo087SQg6KbDGxqowiygxFDy
 eayxLzNL9ZE4MmXFcBrSPVuNhRpwWrA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4OSBTYWx0ZWRfXwqV83Hk3whVd
 X76Czc/4FjC5vpXK2zm3Ja7qr7J/kQEwQmN/14gnhafhSHTzrOod5Z4Zb5OB0ml41i6CymjhrSz
 rmhkKU2wlU4ZRDvXSd+1lpr7HkAT0UIRZguqCZi7GbRC3OwmbGDTxKiFsuJGN5S6Zenc5Sf3HNE
 LA9cslfyeVFRv2BTyg/r5/FTYH/UU2HR7dSuOvw7VEyZN9FyA7rhXOcr/egem7X46zsiHH8oreQ
 5W7sC0ij+s0sX3VAbT5q7A1f++c8YKnpzYlfqVsJoGJghoNzIuu41nEVllNkJ+P9cfb7D9WUyUI
 T/5NbU+gXMf/Y0fcqHcIXwm0+esoEzmuqqhzIru7XuWqU/QJLEx9920ErvlHkZOdPoTtUu5DKZo
 xxYUVjb7tZX5jvwjlcAR9sFvYbxsDkbwPtZLhgY2N4kKhNnIQlUPygvn2NsbHXpdSscd5PG3OTW
 cFe3///svgmE6IBrs9Q==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55f44e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=S0i2IUftuXgoZizot94A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140089



On 7/12/26 2:41 PM, Prasad Kumpatla wrote:
> Add the LPASS Audio IF clock IDs used by newer backend interfaces.
> 
> Platforms using Audio IF module backends request the interface bit
> clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
> header so these clocks can be referenced from device trees.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---

lgtm,
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  .../sound/qcom,q6dsp-lpass-ports.h            | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 45850f2d4..a3aea029c 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -233,6 +233,35 @@
>  /* Clock ID for RX CORE MCLK2 2X  MCLK */
>  #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
>  
> +#define LPASS_CLK_ID_INTF0_IBIT		71
> +#define LPASS_CLK_ID_INTF0_EBIT		72
> +#define LPASS_CLK_ID_INTF1_IBIT		73
> +#define LPASS_CLK_ID_INTF1_EBIT		74
> +#define LPASS_CLK_ID_INTF2_IBIT		75
> +#define LPASS_CLK_ID_INTF2_EBIT		76
> +#define LPASS_CLK_ID_INTF3_IBIT		77
> +#define LPASS_CLK_ID_INTF3_EBIT		78
> +#define LPASS_CLK_ID_INTF4_IBIT		79
> +#define LPASS_CLK_ID_INTF4_EBIT		80
> +#define LPASS_CLK_ID_INTF5_IBIT		81
> +#define LPASS_CLK_ID_INTF5_EBIT		82
> +#define LPASS_CLK_ID_INTF6_IBIT		83
> +#define LPASS_CLK_ID_INTF6_EBIT		84
> +#define LPASS_CLK_ID_INTF7_IBIT		85
> +#define LPASS_CLK_ID_INTF7_EBIT		86
> +#define LPASS_CLK_ID_INTF8_IBIT		87
> +#define LPASS_CLK_ID_INTF8_EBIT		88
> +#define LPASS_CLK_ID_INTF9_IBIT		89
> +#define LPASS_CLK_ID_INTF9_EBIT		90
> +#define LPASS_CLK_ID_INTF10_IBIT	91
> +#define LPASS_CLK_ID_INTF10_EBIT	92
> +#define LPASS_CLK_ID_INTF11_IBIT	93
> +#define LPASS_CLK_ID_INTF11_EBIT	94
> +#define LPASS_CLK_ID_INTF12_IBIT	95
> +#define LPASS_CLK_ID_INTF12_EBIT	96
> +#define LPASS_CLK_ID_VA_INTF0_IBIT	97
> +#define LPASS_CLK_ID_VA_INTF0_EBIT	98
> +
>  #define LPASS_HW_AVTIMER_VOTE		101
>  #define LPASS_HW_MACRO_VOTE		102
>  #define LPASS_HW_DCODEC_VOTE		103

