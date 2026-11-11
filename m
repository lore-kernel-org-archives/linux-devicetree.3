Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407932;
	b=d16FAZOzvbsO0MJNjtJhvIi+NtAA2/tEuC9aImU/0rTit9TLzMuOr6IrudATp9hnsxfA
	 smZB2k8H9I5s20OTtjKoeo701bp/IJafbBbHWCyrMyexjordQSt+nkMIz6Q48Ya+IzHnP
	 DgZff9H8eS5s5aDbXM2Q8zlW7h6kNfRw/F1/cQ4R82JvPOdxMmxKksUap8OACrZTn9Le4
	 qPzlYUY2C7jqP3V22njXQLP4DkuABvGFssUsWqQeBe5vQgBW6ucy4mY3l5McEpD15bx02
	 d3D5hvhXxzpPqMOan8/nGGtRmIlhexhknUYj5nhRsdSq8cXoxxtdQUnF0p6pHEE0GIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407932;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WqtuYiZOllmUy0GRDwONda8KCz8KRFiaccB7F57lrUk=;
	b=FClGIPJzd6+k9Ngj8X+ZbwRP51Ds6kt/k38sPtIUXIJldg4QtNqmYiYlzzhl9O1nlKcO
	 5eJ4vvC/3i8ZDuiL5EEyKvGbzszguvd0ys07JwmshejO5OJtisUVRAaRh9FNOOBjA5jpM
	 FlZaIa8VNxkgDF0Zl+tzey1IL9pIK86PfW64xuUQSdW0Nefhv56P0Q70CwI/SZNSwYZOb
	 ncLMuCT965EVCLoHQRgbB9UJFg8orwCGZjt2oSIppjJqznRS9pOYpHDOzNN8IgSJtc6dK
	 B6aIgbKmmYM5aTUFzPQ71mYaB7sjhn5+YEdv6Ls7ky0EQNkal3rHV285nAjxRWUdI4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SFP9z1a5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=URuO2R2+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B824606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 14:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B824606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SFP9z1a5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=URuO2R2+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEH1D01574066
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 14:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WqtuYiZOllmUy0GRDwONda8K
	Cz8KRFiaccB7F57lrUk=; b=SFP9z1a5LdW0VCRoUfvIiCaNzaEE5coE15t3RzmJ
	wwwE+vqRsCBWf59caZKuNvLlsHI2T6tsGZAb7iJkVPW5gXsnAIh17iHs3+/NUA2o
	XpQ1rBcu5thW3O1fkF+nkGVHH3EcmGf0X95fuUOYm2TIOmxP8LxaiQ64pEguVBe6
	1zSCyqFraAYhyOa85YL5TjIj/KDEeNib72yXX0OPWpIIdokO68tK4SD9pomXGbKM
	zt9rR2OC2DCN4barUprs9BMbNDHrao7B2C8qCvB4C9mBymppyLjGMT326ECxNdwJ
	HUtR/w/Tzfqe7ePPB9ZxSTHULtj2wKtC5AsDsKpXxbgxUw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7pspeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 14:38:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2d60dcf2aso2469047137.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 06:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794407929; x=1795012729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WqtuYiZOllmUy0GRDwONda8KCz8KRFiaccB7F57lrUk=;
        b=URuO2R2+7K426dpMBiQd2rRd/4jzYAbqMHfXH5bJkGBSqi8UD2s+DHzLuyv+VRY63T
         WjMF3uOUyFM3LnItUdqYseUveZ3V12edtB++rGt9DSaC6qlu/ggUIuNe5JElMtOcUtWR
         xnX1hN/LJVdo+zAHjJw8OX2b4kTJ1uf2cQrsASvwroHGbv1kt+a0Wunw38nQtiOs8wJE
         ZIlOICzOZSEyLu0fd7IVkqeB1H5yRYQJKZW7qaZyKh1Lg9+zZ3HytWeigAbDeaAD24AX
         rQVchCMurCu3+iaS8eRqf63bbKyIAWHoprZxr2b4gZQZlhFB1+Ck0QDDQdB/rqjF1lhW
         nlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407929; x=1795012729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqtuYiZOllmUy0GRDwONda8KCz8KRFiaccB7F57lrUk=;
        b=HD3Z1uxGLig0FiBoR04nNd2Lz4WgYOcYUFVbSXpR8ve9ZJ1SqZsO1fWOoEk5ehKFH4
         Zjp0VZAizsVgNkj6ElibR7JRpsNBmmcGJCg/MdmgzZVr+gJYsO8n99sgbdQ08ma86AtX
         eAfr/5c0obNGAfCJw12CHI1uZPnZ50QNNPwjAzrbqukHysSTXBUgwy5i4YLAzzEnlEjY
         APmfcoi8Z4qtuKia1WrPNwbeKUQTWbhbOUcREyszEf7uofkPyWfLH4a12TAqpt5DUtr5
         Vy9MZduPySRiVw9eiW0Bn+ZeOFBEw4XN5UOnDo/IHoE6LCC7vaQ9AYoiFsviJlOAYirq
         4LDg==
X-Forwarded-Encrypted: i=1; AL+hErHi2NJPMU0yruG04UkPX3vYmdOXdTfb+oLdx3cwlwSuFcfIh+V/hN7bZ34/wKF9T52E3K9NCYmNBcDp@vger.kernel.org
X-Gm-Message-State: APuU4Z/xbjL5lt3/+T0ntmVkSJvrstGNre+L3uSiYL67u3QBxcUeCJED
	aDFRKrPESpoecdvxGJRvHhik5HyDB2bufb4IcPqlASFR8LXUrzTnx2S6N22ooOc8civI8xYx4hE
	lXrBEcWZhWJ83QD/ckZrphH3vsfBAOEHfM9MjIAaHsrUFhTlIBY/yq39KgioqjCNi
X-Gm-Gg: AYBFou0p68qRmydZ/nx60aZS9l1vwFRkOYaq12fSla4QfOruS/6cq4/USAHZ5iBWmh8
	uc1Xy5nFGtmerZZAq6JVDnOeZd6o9rzvb70HcPqlGGEN2j0rtxquxsUBleDio0x69jNQehagtfE
	O7Xf/zJ1181PtwEFitYDd/Y2b201+K66CUpd3IakUqfx7itshrE41tZIQsx9JxOPcq0D5g7WbF8
	ynHMY3HcMEP2pnRXB8hnRF6opOUg+RSbYysu6qkxWjFUrVAfcYugHYACx0Op7rcIxtp8gHSFWhS
	yXcYYRyZB0D+aHYJNsQTxqMfFVWUYlmEAOLU1q2HrsMqYFIdrY1v7PlHK1rXopDj3IJ3Vm68CiY
	6NdZcKx2M2SY0JUJqQ2ztDJRVxzfyK5nbtOgUYJIbAiLL1lySqJcAwhhXIvnXd/fl
X-Received: by 2002:a05:6102:c13:b0:7d2:cbb5:71f9 with SMTP id ada2fe7eead31-7d4fb255e87mr933264137.7.1794407928909;
        Wed, 11 Nov 2026 06:38:48 -0800 (PST)
X-Received: by 2002:a05:6102:c13:b0:7d2:cbb5:71f9 with SMTP id ada2fe7eead31-7d4fb255e87mr933252137.7.1794407928228;
        Wed, 11 Nov 2026 06:38:48 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddd467sm52210615e9.0.2026.11.11.06.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:38:47 -0800 (PST)
Date: Wed, 11 Nov 2026 16:38:45 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: nord-embedded: Raise i2c18 pad
 drive strength
Message-ID: <ujqm2euxzzef42aqvnrobearrftzm3ua4kj5ivigjvusnkbxmc@q3e7wiolqxor>
References: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
 <20261111073121.3707030-4-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111073121.3707030-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX0+uv1YvukDzW
 1zNWHnToAxi4g/Tgn1Gjzk8KaE8mnZ5x6Sgwpuq14LIgGMnKyZiEbB9XzgoI3TRdLOYlwDd3bXZ
 Wz1dNWP6OqidL8Tv6UdaLIC0vJTfmrY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfXz4Y6LL8KBOiK
 RaiTOPV5K6k2399o4eOflJv8hWgz3WuN8sskMceQWMvIl882/Z96ETfQSlPkD0cPG9ISnOzhSfI
 7eYE0CLYbLqqaEHfmIfA6F58WxjJyqo82lfPjtLIYuBRYjRU82M7ZB524Mn020XVSgOutWcuMOq
 C6x6GYVyHDGoY692mdhlLlgAM34sLihTcbnuk23idYodW91rh4SoxNpMzWMc6k8WZicy8LDuo1O
 cs2/EX65dHtzT1sfXZQrWqDt65evMdv/yyYrm+x0rIY5PANL4Uehn/uDuFN50JBFa2zbZ17DhkE
 /p1ElgG+2FKZCc6OfCsxQDrtIcVbuG4t/wYD/SL5fu9GRX4mYoFb6PRu5nLbOBR2+jACUBVT0S0
 mWk4qBWNtpvQD/wmjIew/sVVCffYxF7XPZAAKasBy2gBylEUlw6dGi2K/1ikQ9MT7fT79xwQUlG
 zLBbpkUp4EcFuodKqDg==
X-Proofpoint-GUID: _nk0MxyqaX5G2dVuf9vVWnr0G-2hHGRo
X-Proofpoint-ORIG-GUID: _nk0MxyqaX5G2dVuf9vVWnr0G-2hHGRo
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af47dfa cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=EM5pv7IvHfzd1M2C1YcA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110058

On 26-11-11 15:31:19, Shawn Guo wrote:
> The i2c18 pins (gpio154/155) are configured for 2 mA. That is not
> enough on nord-ride-embedded, where i2c18 is the audio control bus
> carrying the TCA6408 expander, ADAU1979 ADC and PCM1681 DAC behind
> TXS0102 level shifters. Transfers intermittently fail with arbitration
> loss and unexpected start/stop conditions:
> 
>   geni_i2c 890000.i2c: Bus arbitration lost, clock line undriveable
>   geni_i2c 890000.i2c: Bus proto err, noisy/unexpected start/stop
>   adau1977 0-0031: probe with driver adau1977 failed with error -11
>   reg-fixed-voltage regulator-5p0-dac: setup of GPIO (default) failed: -11
> 
> The failure became much more frequent with commit 8cb5c17be3a2
> ("i2c: qcom-geni: Restore the source-clock selection policy"), which
> moves the i2c18 serial engine clock from 32 MHz to 19.2 MHz. That
> commit only changes how often the marginal signalling shows up:
> reverting it, or lowering the bus to 100 kHz, still leaves occasional
> failures in a codec unbind/bind loop. With 4 mA the loop passes
> reliably at either source clock rate.
> 
> nord-rrd uses the same level shifters and has not shown the failure
> at 2 mA, but that appears to be margin rather than a guarantee. Since
> this audio I2C arrangement is the reference design that customer
> boards will likely follow, raise the default in the shared dtsi
> instead of overriding it per board.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
