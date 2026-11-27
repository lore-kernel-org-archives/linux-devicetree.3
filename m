Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770672;
	b=1Uef1xQj8FLb0kuc0xlJstOfH1GV1ttwRZwKKgwLrhzBCbU+gxRnQSlumMAaEaKOMcwn
	 ayeLS9EkvFeCFVZrke9P4XrgrdBmt0h7B5bofnVW0XbxHoveYzIsq5xEhUVafUOHEaiG+
	 TPFIB4STYnwFy9fL3bifLIX8wrvRSixKTQ2bxP3GpFAb3Dl9Ky/yOnJTUj2UXqJcDGnMR
	 +6FK9ekyyh/dqSzddh0ug47OaA5OFUH7NR+D3pQHIlhJKUzalc39DB8sLQTroMCwig6M6
	 c3MH0tN0zFkC0xHVpFcSYGBHgpI9TNY20rWxNnZ8g/5vFbBmG7nDlzfCGhdXVtdEFjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770672;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=;
	b=FsQuGbvqF7jCOxni6ipg0YJcfpR7XadU9emFW3QuwtUNYL5Y95XHA/2tb6OOoXLSTX3n
	 kxj6FRqV8Fq6JNnejohYMv11rtIEq6fEsyvKwhAFV/e0JuReU0KFgzIGwcW/GbiCdVO9c
	 au8mHb+bIGYBth1ba1AKD/Nz2WNaBGpyf2GfGfuat0O3l3cCfXGbfVlK//cIlV5ukTtiu
	 G5zjgF7ZCwdBvk+sGVlnKGLVgtcgiiS7HMUIJMkQFhtKpu/Br8hvtWm9VgH1Xqr8aF/p9
	 ARoiAU4n7mpjRkPFXjezWgYhmU5ZrkUPhV5DLoM2V+UZAtb/jQDtR/H/8RNhoTeyBDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xj3Z3Cob;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="U9hc3B/j";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDD7606A327
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACDD7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xj3Z3Cob;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U9hc3B/j
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GfEt905299
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=; b=Xj3Z3CobRIVJY8WD
	UnqJ/SMwLSCDazOFshwsUrN0xRwkHhr/r4mDo3e7WQJJDpap8dala8XgfPLQcu4l
	7JveU0dyBEKXzdu20o/kTIBkkMTpVKEVif1pQOP6EimGKAd+9HhXbAsKKw+reOm9
	QYzVXhA+WGtmpv4M+pZnkfyFMJHKUaix8RktRRjjk3YsdINu7rF1/yeI21Xa2GGe
	isBrxxB51PZ3014BEUdRdaGRn/SpLuim55rihyMQUZFATtQQtsJFmXWr/Rqu/EH2
	7aw1jPQn2yxIl4pA6sZFmEfIvfjMv1OlVf997L7NZZrCRvgAS6b58ls4fu3t4tzP
	lkgx7g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru39t7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:11:09 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ecba171914so361705e0c.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795770668; x=1796375468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=;
        b=U9hc3B/jq6cSUfq2g6GMrZjaQF8x99qU7tOwkAT2xSbr72byJ/w0GR3fsviDbQ3qKm
         wP96mRwfmYdM0RDJHPHxkCvwLwCD+zJ+p6FgTTY54YCCw3AaKBbvZ8iyOB/Y+pJp4ar2
         /EsimNX4DZMPBpGwmE49BjGpUdB6u/sE0mXHFfx5RcP0PXycLeL9gYbwwsuRUo2MOzFk
         xMZCFQHBsOYik26OTevns1hbwKuiwkjAZoVZRCfLCZAzWP+rWxuG5x9s8xGAgouBB/2x
         /H/vBFa4fsarVUC1bXAxgqx5caLvVEepu6uRHC6icMTTD6gEyrr6FX3sA2NNPCLUhO5Z
         h9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770668; x=1796375468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgUsGcjyfX3pn/47na2rOFgHRHCfaEjUCpn+6VJ9aDM=;
        b=OYkxj+r0RnRbbNjylp1qyirXHRjP8RORD6tmdEJCD6Nbpdetp/ZAiY7ReqUvi0wDgA
         GjPb03bwR6wl27s4kB4B5E+cGTL4YnE7UWTObXqpU06DcqJAbp6jwjuE/PjRWDADM0xN
         FQPzJYZdX/Fyw6iAAA7p9lHbnbmvfJYEWwC2nj3norVTLx9PpLJppGCoM7uT/uKRi3D8
         uSPWXY8I7iGUCT6MtM+dXcTz97pUW8M/HLJYghMvc05/MDi5tvlTVWen+tyBt7h3/FJg
         j1m3eydl19aKqYFkO4ZAHflG9BvvCzTDG8rUyL2g+BwyxpMPadxIIDCZjp7R39iXsbCb
         9OzQ==
X-Forwarded-Encrypted: i=1; AL+hErES0Xg+ZzmVp7yj+PWSVhNNTAg5yxmbtKL0mPFc0aKTi7Kg/iMb+HJr10yphLa6RV7tBfzPV4+CZAeF@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xr0nxY/DxqLQdJCdp6PT5EGK/LB4LrNaav/wDtlpc6raJhGo8
	Ds4Y1IodR6p1jMNzz02V929FWI6gZ/LVD/9C64b2BhEF80ecnrJaelH4regMUqn2KA/nTXDxxIw
	8WqFDzKoOznRsK8duEu67vhMhYejxkfVc3FpUbAgLW8AClryRl1VWf724jmIBW/OB
X-Gm-Gg: AZFdTZckeRn7S1sTfDQvl3zKKWBd/5IeI0gJiaF13jTc48knfU2FZoGYLS19CthcYvl
	kdhD71OPkMsEV58bjswJKZaaWfsVOA3XmtpJ2WKapra6is3bCLeHMla1I2m2cwlfJyE8JdOsVo2
	97gJZSgilwdboz06qHwkxCflRFkJ2+f9gWfw1cFHcqnpB9x/HEe6um2s4MX5KG+o4wUzUY7Pm49
	6HwkLMqak8Xekvdx5pD8YaXCI/PsbV1mNA/81PS4/qwGYopAXB7vYmDrYWgoBmmvQZxj4LNy6Gi
	7wIKxMZY0Re+DkIyI+cexN0WU/ZvXsEWp7g2jYbKZYpUXgqefI7kfl+iM0d14wnwgA5Bzu3lMLr
	XP1QKpTWUVqltxIY07sQ+BhiRVNRY5VKHeO9M9pecG6i0RJ0KkdEZBCAa2ATTHE57VkJLKoQ=
X-Received: by 2002:a05:6122:4a01:10b0:5ef:d97b:2867 with SMTP id 71dfb90a1353d-5efd97b3b39mr322615e0c.0.1795770668664;
        Fri, 27 Nov 2026 01:11:08 -0800 (PST)
X-Received: by 2002:a05:6122:4a01:10b0:5ef:d97b:2867 with SMTP id 71dfb90a1353d-5efd97b3b39mr322603e0c.0.1795770668162;
        Fri, 27 Nov 2026 01:11:08 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b03723bsm840417766b.87.2026.11.27.01.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:11:07 -0800 (PST)
Message-ID: <4aa25716-37ab-43ba-b3d1-b0b48671dfc5@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:11:04 +0100
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
Subject: Re: [PATCH v5 2/2] pinctrl: qcom: Add Molokai TLMM driver
To: venkat.yadlapati@yahoo.com, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20261126-molokai-tlmm-v5-0-ada44435bdd3@yahoo.com>
 <20261126-molokai-tlmm-v5-2-ada44435bdd3@yahoo.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-molokai-tlmm-v5-2-ada44435bdd3@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b09492d cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=CjxXgO3LAAAA:8 a=EUspDBNiAAAA:8 a=tfEBk67aE7w0iaTIDxoA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: zWdlboi-LXNdnMVEv17FAmaFMm2sEin3
X-Proofpoint-ORIG-GUID: zWdlboi-LXNdnMVEv17FAmaFMm2sEin3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfX/4JKHmzCL1QM
 g+QRt2DD/gWVgZN/pvFB6F9hEZAc+As2gjHSHaKaCTebXfZ645d3uTFHFl9bYezQA6rF8Fbx+i2
 YVzMo8wDTGMtrNm75ToVUKTIRjWTs2sriDKhOEVFmlXn8SUYBqb/Qun9BDTucg5vR25uHuub3ZQ
 771g4/JcU+PTlgzf/uCuR1tQSlHlTC9vdJC1C/rmlkWgMytdgkkqijZ8JiHQn8GZAc5CfJZ448h
 RGJe9KF75/gfkjdZknyh5bdro3ipItJKbzqN0edlL9/kicuxcFGuebZMoguUvt1kLbglPPBTolf
 Yiexq0dFDGfIh+Cia2lpVaGjnkoj0swZ13t0vPbNiTIL6E8TPI7t3244w0e8Lku+YJnm/AFTi1o
 JftCiW+pc4gnRHOuokDDmC+7R2SbUnOBwOTEMZvtIhjAyayOIxHb9CuehBdlQDdSkv/XpOX93t7
 u7OFgV+rdz1olHeCeFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfX+hKwcfpfoKTN
 DPdV2jdnTHYBvgwJKCoCxbUrFtAMlYswHDGj7ZZOCBonsp83awVSnqoxuMovZmeb0bBuxODGM1f
 5YSdyBxNjp6uDBgArInlt74Ugd4n1HM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270036

On 11/26/26 5:51 PM, Venkat Yadlapati via B4 Relay wrote:
> From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> 
> Add the pin controller driver for the TLMM block of the Qualcomm Molokai
> (SM8845) SoC.
> 
> The register layout is the one of Kaanapali, but only 29 of the 205 pins
> have the Kaanapali pin functions and the GPIO to PDC wakeup interrupt map
> has no entry in common with Kaanapali, so the Kaanapali driver cannot be
> reused: with its tables, a wake-capable GPIO interrupt on Molokai is
> routed to the wrong PDC input and never fires.
> 
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
