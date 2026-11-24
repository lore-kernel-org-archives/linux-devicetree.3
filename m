Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795501941;
	b=jF3FHdLdJRjllban0jWMLE9rIG0yvdruRcECV64mQpX4a3WYLZxaBt0fvLAFYr0pwUQ4
	 XoUjfrDcP7+/8f0bZRZhiA/W3BTwFmpe0K6l/D1fDANNTm6rkfUDP7TUDxSXBsyphSxCb
	 S8mOuoJkqmhLU54meBIcvUTjGuHbMmzwXSqGNKYJ8PG8bwdnkP7Kj5YxZh1WjFHlFxOaN
	 H652VxG57eykyA2g3O1hEAkU7+WOU2jvbEXF8upZqdWQOIhU09B3KQuzAX01yecuOhVAS
	 EkHs9OtbCYUBPiyeHxQciGsacb+vxwmJUkLjBTHJ4W/69O6o63RcqbK7fzaGtASJzsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501941;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g64eb51ZluzD1abqaA/e/xtKZHHLSlSJSnLWnH9efNE=;
	b=TDxO6FgyZKTyF+60VLVngyCDQM6ZPRsJOU3tLfS0tV/KT38JWX7WGsHx2JTjD0tNvAVs
	 reI54wgnfS8N5qxNy7ynl/Mp5U05do412+Oy3Tr3b4Y+zkRqPT7gj0+DE/TjQn9KLseC/
	 Yf3Rmuzgz+wC93gMWzs6y/E+S3lW/GQtJZMnJP9CLVW8TysNPCV+mYrXEFNOIBii0r+a3
	 oxLp/zopWpIsP23/ukn1c02nkClALbU23akKWaGX45PqfbN3keSECXEsDh7Sg4NccSqvr
	 ugv4qqtO/9bOHZacIr4LxhKpFMciDv4WhQm0Jvv/xxFGPNNqoweJbSAT8AIXFL5zfGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=goEHkP3k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kWBqSVwf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9855D606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9855D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=goEHkP3k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kWBqSVwf
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k0WD4128835
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g64eb51ZluzD1abqaA/e/xtKZHHLSlSJSnLWnH9efNE=; b=goEHkP3kdmUrkhXc
	GpmDihzUnnvpWxuXOAhv0cKQyPTuR14teZfWtsvcxAt8w3ICkR9cgGy/iNNwCdxV
	EINOj2yu0yTXxqkduUyJeG4tKxxc0+8DTqMyOxMam1I5K/H+5V8mqQx2uDjuxAtP
	f+uCfag5q00jO/Beud0HIo0rLcGPug71DIcDVvLvb3DiyrsRzNFkchpHneqB85de
	vUty7QCxCTgCXkTA9Oox9+XEm9zDm1ORjhPcKsPOvU8kvWShM/9Eh3MOhX1OTcXv
	oMdnZT3PgdmBuoL5q6TgNkBZqSRzqdlIf/DKlpmNGeWDRUByFIMR1nBPaR8prs2k
	FxBkSA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt171v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:32:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b40b011aa4so4996981a91.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 22:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795501939; x=1796106739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g64eb51ZluzD1abqaA/e/xtKZHHLSlSJSnLWnH9efNE=;
        b=kWBqSVwfS12PNVHOfru+hlrW6f5fNbRVeT3pdQaFsYoO9A/x7/TssBcPYmwxLPsLrV
         iiIrEgkq9Ay3M9lGQTP39xU0fdwNQLldVOUe2AWw+7M0kWjzDdyM/2iZ1J3PrxMJ7Xq1
         /XP9plIMUwhNLumb4KJwHUtaU0PMQqqezHzo9Q77fqbpWGgAR7KFAQTagpStV1EZFdoU
         VKqNMLtkoFgaAwF+fSt4OTVi89HKpZFw4w/lDP4csG9w+9o1MF5WqTl2ggUXVeUtSSfr
         jR6v9rToFXrPzQX4eGTLylKt594twMDD2pskoTvUu54V9gippQoeribTsxMdu2lpzk8a
         1rWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795501939; x=1796106739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g64eb51ZluzD1abqaA/e/xtKZHHLSlSJSnLWnH9efNE=;
        b=F34AsMww7Wq1rV+unzH93xHAuJIaOanafC+OxUBDicRlxD1z3jh8pOyYT9IsAxvyb8
         VC/ud5zTN8+pxizKrHxxtwyPlhdN9L407msz3WhvrnR6sMV9c5l/uQIfCCWSz1vkJ71p
         vLFTomVvTxmA5C2X/Gx+ZSmGIFycd+pu7T7mKKPm5AWBCOmRF8BybDHRm0D4DbkZXqNn
         y//xn5tko0MI4j4fK+1WNmXQp4btvmsQEC/kMbNV0osn4OWLLbTVGvI8KmCyxXnNLEFx
         LayT3Eki9FXP3jaZeMHO0Uu24MG1xfv9JZq9JhZ9I8IT06sYa3YKUNe4c6eD7QitYNyU
         /sTQ==
X-Forwarded-Encrypted: i=1; AL+hErFO66ZTjDxI8EkpM7MnPogQFzAb6ofE/XUyMxLhT9cg2NoHsOaVLV3cXbHzME7kLkJ7eE7ELvcLXihq@vger.kernel.org
X-Gm-Message-State: APuU4Z86zzuKu8+Vuc056OTy1D73rt40mHjtwTYnrs2qNeDaDxyvEG8D
	xylbabDc/YhrRlxhOLab8+E4bWgfEMaV1U5U/0Kf37N0Cqp4fJjCa1HVSti8mkngY0gRLqdz44c
	tFrFQm55G97dbVc4OZ5k4cYaj4srnVzukdk5aQ2SvgYTyYQv1n1PT3FZIGlXwCAta
X-Gm-Gg: AZFdTZduwK4OFQ8c3aPL06Ih0JaOthT+Hboe50mI0GeI2Uh9gVGm6PD/BhzgT3vk5gw
	+mrpp2/DhMvUF5Az+7jWcgGfP74of4ffpj6b7IUWu0vBeqpOiSr6BOSTvr/wFUXEWozCvQmUhIY
	L6UlVxbSamCtsoBmEevc03fkMNIvb/KpZI05k2ifSx3HDSpvv8ATTYY6XU/5ZEkmL7om/ZE+0GQ
	i4GsLu1cGrgIMEYYbO/akFtV7GZgTLSxk4jOtprN5oLnzVw4mzoFUKDrjtucZa9qJ66w68PhgP+
	lSFNpKnBIMI2/A5Dc6mIbcu4ilTfq2O57iyFD2BHcCqh2i3DX5EvATml8f6aEzxC7NiHsYVUcuN
	8rYyoe3WqIU3hP53Vs5u1/U4MhMnKoFbmM2FSeyaZaj6liREeneq2VM6PxyrwiwzEggpw3W/U3B
	uw+A==
X-Received: by 2002:a17:90a:ec86:b0:3b4:889:883a with SMTP id 98e67ed59e1d1-3b41c9bacbbmr13635484a91.66.1795501939043;
        Mon, 23 Nov 2026 22:32:19 -0800 (PST)
X-Received: by 2002:a17:90a:ec86:b0:3b4:889:883a with SMTP id 98e67ed59e1d1-3b41c9bacbbmr13635442a91.66.1795501938573;
        Mon, 23 Nov 2026 22:32:18 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm22962174a91.3.2026.11.23.22.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 22:32:18 -0800 (PST)
Message-ID: <4c568f56-988c-47c9-87f3-2cc616e1044a@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:02:10 +0530
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
Subject: Re: [PATCH 16/18] pinctrl: qcom: shikra: Add gp_mn mux function
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
 <20261118-gp_mn_tlmm_support-v1-16-703f7badd194@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-16-703f7badd194@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNSBTYWx0ZWRfXzu1jsoLue+ZB
 pQgjzAsGrGh46itu2byimeSsg4AgTg5GYrxjeHUtpo0VQIad1a06LytTsCfUadR9RbizXfOQg5a
 tLhjo1ghf/ijQ2bNrx0S7Bfus3D49DE=
X-Proofpoint-GUID: -UU5qFNk5D6i4dW-IPWr8YhUwWuMLmI7
X-Proofpoint-ORIG-GUID: -UU5qFNk5D6i4dW-IPWr8YhUwWuMLmI7
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b052f73 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GewgOwSwdJvqOynzejwA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNSBTYWx0ZWRfX5+p4oDu6xzLw
 hopwIez+dOfjBGrCr5nFaG/jMeiapA88viGwVwWtNk2imFJz9gBHVw4ClEikFgm6kSPCJhQ9LFy
 RZdP+uXTf4lW74mRIYl+M2oQBLVPEpLxAsSc81LYjKb6oNIXGOhGmnQer2m7C2+uqZSo1VG07Ne
 XmGHT1ra+K+SVCUbXKlgpGqYS3hSSmY0RjA24FbxosCwS1GsnsIgzu2h8bC2hBw5pqh+mtodUks
 pH/qmY7QC0igxPkN9baLcyba2yfiTLr6P9YylDA8J2Re1B6P7ArToWNdQFSM7Xc7LKGG+neWkX9
 4W703R3GbOCzPzJDQcnLC2RFh8vRP2HjbJKKkKR8B/YXdASqmfdwIjG74b8Vu4Ut+hniMYVvX1t
 kQw0DwLhzqwdDEAf4VqItuWuBIyDNuuDieR4IpTikBk4VfATc/Ow/6Eg4WRqHMY1c0PuJLK20vO
 4w9i5Lsfqsv4bDE4Ksg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240025

On 11/18/2026 11:32 AM, Taniya Das wrote:
> Add the gp_mn pin mux function on gpio87 of Shikra. This exposes the
> GP M/N divider clock output on the dedicated GPIO pin.
>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>   drivers/pinctrl/qcom/pinctrl-shikra.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-shikra.c b/drivers/pinctrl/qcom/pinctrl-shikra.c
> index 55aec2f675e6b0953c6a7ed1d9c33e85a47bfbe3..c411ddc48440db732712220b57be6ad1278fafe1 100644
> --- a/drivers/pinctrl/qcom/pinctrl-shikra.c
> +++ b/drivers/pinctrl/qcom/pinctrl-shikra.c
> @@ -459,6 +459,7 @@ enum shikra_functions {
>   	msm_mux_emac1_ptp_pps,
>   	msm_mux_ext_mclk,
>   	msm_mux_gcc_gp,
> +	msm_mux_gp_mn,
>   	msm_mux_gsm0_tx,
>   	msm_mux_i2s0,
>   	msm_mux_i2s1,
> @@ -666,6 +667,10 @@ static const char *const gcc_gp_groups[] = {
>   	"gpio45", "gpio53", "gpio61", "gpio88", "gpio89", "gpio110",
>   };
>   
> +static const char *const gp_mn_groups[] = {
> +	"gpio87",
> +};
> +
>   static const char *const gsm0_tx_groups[] = {
>   	"gpio75",
>   };
> @@ -945,6 +950,7 @@ static const struct pinfunction shikra_functions[] = {
>   	MSM_PIN_FUNCTION(emac1_ptp_pps),
>   	MSM_PIN_FUNCTION(ext_mclk),
>   	MSM_PIN_FUNCTION(gcc_gp),
> +	MSM_PIN_FUNCTION(gp_mn),
>   	MSM_PIN_FUNCTION(gsm0_tx),
>   	MSM_PIN_FUNCTION(i2s0),
>   	MSM_PIN_FUNCTION(i2s1),
> @@ -1103,7 +1109,7 @@ static const struct msm_pingroup shikra_groups[] = {
>   	[84] = PINGROUP(84, uim1, _, _, _, _, _, _, _, _, _, _),
>   	[85] = PINGROUP(85, emac0_ptp_aux, emac0_ptp_pps, _, _, _, _, _, _, _, _, _),
>   	[86] = PINGROUP(86, mdp_vsync_p, mdp_vsync_out0, mdp_vsync_out1, _, _, _, _, _, _, _, _),
> -	[87] = PINGROUP(87, _, pwm, _, _, _, _, _, _, _, _, _),
> +	[87] = PINGROUP(87, gp_mn, pwm, _, _, _, _, _, _, _, _, _),
>   	[88] = PINGROUP(88, gcc_gp, _, dac_calib, _, _, _, _, _, _, _, _),
>   	[89] = PINGROUP(89, gcc_gp, _, dac_calib, _, _, _, _, _, _, _, _),
>   	[90] = PINGROUP(90, usb0_phy_ps, _, dac_calib, _, _, _, _, _, _, _, _),

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
