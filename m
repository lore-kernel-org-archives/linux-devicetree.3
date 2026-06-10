Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55400410D15
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099104; cv=none; b=rKkj7mSrwJ3RCMCnPmoTlIAp07Rj+aM64TYWGbNuJ3DFz5b9295SWAyAeIro+w98iRejUCRkDPPRNz7Z5t3EWDo7a3oxKClBtFhDgl4xI5JxnHxTlGxmhul7AJb/LtXsK9AORTqGqDk9c7qyfdDbCWLZxecuZq+TlLTKu/4ouQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099104; c=relaxed/simple;
	bh=QjH2RgbFk1WRZkPXh4SEzTpK3+glKIM07co+muR24rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ua0BbzHCjLXcLsF/KCClnynjCZBzFT2SNDfaM//FkGr3zDTOYUScJ7+n6EewlaNuS580SGjd+2H/U/ehgyWRE8Z8VVk+P2r5QEN0NxOqZr+8AF+vV8mjZgeDiQzXAWDh9ZeiMzE8Gd7IWmX8FZXPA3mymSPvoIpTTk2T5zZdmdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KxIJgXJV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eihe7Hbs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KxIJgXJV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eihe7Hbs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBdSk3763309
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JLisBjxHprw7EZD8IZXsLXnVHgD19va+82RQlSZYq8w=; b=KxIJgXJVDrbonLFq
	HHnxgT4wmr8d+Z3e1s011V9IDwarJdQDjUk8QdnafuV1alxYca87WEmbmh/mnPBY
	3ODwa+XnW7IMlOoFiFRyb1ltAm0dwfTJBE9c981kO73CgXg6UMQ82xNuwafmIl7O
	LKnQSZYTCS2ngpwgmfbJFNJcJ3VdLsecV27B/mAxteVIJp6ZO468yYo4E37vpohH
	UWQUvoc/CulDSzPDeL4Z1MqFq6vMZLsN42C4ZhS76kfE8OeQFvae5m3X2wPmNhzm
	27a+TLN/7SS3D8zobkKxUM07009IC4HiXJne9z3jl9TaQeh6h2ZYZqpXVOZZh044
	mhLIOQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnetq2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:45:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178ded346eso13317751cf.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099102; x=1781703902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JLisBjxHprw7EZD8IZXsLXnVHgD19va+82RQlSZYq8w=;
        b=Eihe7HbsMsOGDWPp/n+A0OU0R3WEY6ucKeoPP2JsScXg9fpFNraItWTaKVPJqFX29F
         41PNMgB/MzK2VN5VnJnFpsTBKDpQRdLn6ovxq3QhGQ2g2hcUKB/hOHhasuCjErFKMFwq
         zlTpTcVM8JaHVKzFcVdziffzsTefNSqZTVEVC0yhN2x61q+hQ68j+QnYOJKkFzhO/YYa
         PNYVnOOJclYjlcAxT94JYYHQi1UTlh1BmHDh9D5qHZBohI/ev1D3/Ny1imbN30Z8VX7M
         teCP/cA9oHMXr8K43eqPfibHYrC0zmi3uvTSr5i9wkFR44dYo3+28rQ4ESnRSuvxszHU
         4DjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099102; x=1781703902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLisBjxHprw7EZD8IZXsLXnVHgD19va+82RQlSZYq8w=;
        b=s4EUoJtCUyLHNEoWkMCxLXQMfgyUPXPZ/ltsYh8Q9y6u9DoX/r4c9P9ivQm8zzT22o
         4PR7W7CG2jugw3NP1x5gICkDcRRKwG6FAo67eWKmBm+H/LdcarERzxpnQocMCP6Okg54
         O1HQwrs3VIEEjEBPWagE8pFXOGazyptGIEZI7YTz1Ks5rCSqs9eCwVRKysG3sDsyq6yl
         Qw4e+De3bRn+m11al55R1OJxe8Qz8i5ykNDFV/8B4zYJy630EIDa0xFxaj4BhWsbKEhp
         gHSYGajyVH/eix0In5gL9/Xxzji3QRVc/KW9NWIfTHcejo+FLpIT0HO1/rfQmzrxHvdk
         U1Lg==
X-Forwarded-Encrypted: i=1; AFNElJ9XEmuBr05rHkUONeoaHqxVRdcOdIeScGnI23qh7u2LGsPCXyVQmo8kzkedbTlHp1jaZ6PwHiRaF0jU@vger.kernel.org
X-Gm-Message-State: AOJu0YyOMok4EoXqRgGKyWcnim43u4Pwe3BS8TqXsbaF7pjJ7IF0YLQe
	RahdVQaWsxtVKe9rZh2k72hbtsnj00Fk1jmL99pY8UJ1iWPn7cqbubFiH47Wf9XbSqJh2yD25Ty
	cHe7vnfRU6JIUdbKVGI+i9t+MqiUFdTtv291n+nHBhRWMBb1o1onXfiTSlE0QRio4
X-Gm-Gg: Acq92OGdlJ/FNqeqYc0g9Eev0CSaKOC3Ev15lim9w69BWn9FJrB0/PuQypKveLTsSnq
	stG42BO0ztDdWAeCLFptThmvmphndZNweSTb+2ldUaTStw+Yh/kzs/bcmVlgaLbArxYXp4kWxub
	Zp1QfX6CsxPc+rX1NvL6uH4srS06/SJbNYdXn0p8sD1MG3E4wjd4yc9e+XjT1HL6lhrJ9omlojn
	f7ZFZJeFaFrrjgnABoJfYVkX8WUSa1e0jPzxom4mCMpX99OyBbsIMOd76MxHep3gX0NyUP4YDkz
	z5wmhbbaHnqz7KOX4l0ksteeT7ouVGilf3Fezj9mhFghC9oxJhZA/O7gIiOkIM0eMN4LU8oH9Bq
	0GIQbTqGcvgPSvvPXc7pc12ww9u73pqvt/soDn0zoIwPf8iglmfec4Nqm
X-Received: by 2002:a05:622a:350:b0:517:71b8:ee37 with SMTP id d75a77b69052e-5179593f3f1mr209122381cf.0.1781099101561;
        Wed, 10 Jun 2026 06:45:01 -0700 (PDT)
X-Received: by 2002:a05:622a:350:b0:517:71b8:ee37 with SMTP id d75a77b69052e-5179593f3f1mr209122031cf.0.1781099101043;
        Wed, 10 Jun 2026 06:45:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e02b43sm1165887766b.40.2026.06.10.06.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:45:00 -0700 (PDT)
Message-ID: <227480ed-cf70-4f70-afc1-9c5a6f73fa57@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:44:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] clk: qcom: gcc-mdm9607: Drop redundant register
 update during probe
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-12-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-12-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KdTBbgBiAtHYRcLoE71Xw2UJ7DoFMFvi
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a296a5e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=j8Cu_9a8AAAA:8 a=EUspDBNiAAAA:8 a=hT0Lo-xYggzRLxYTxJMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-ORIG-GUID: KdTBbgBiAtHYRcLoE71Xw2UJ7DoFMFvi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfX0egDw++vuD+D
 xTtwIonU2gcctRdWW32MZyPfX4duWwkXEprnsq3kJh2/PLEP59CKlWF/zhuGjbRG7SUvr1/Psa9
 ZpguFItRmgosteesiM2KcDHTcQbYmYg9cg1xFUc040YBLreuLQel1A1qk2g3JEE4i8BwrDiNvxG
 LBsBaQh6tzg02ur1M0gu83c+2SCmDhOlGgvBeBIVLotIFoEnswF9t3LHYJ1QMMNKk5fPyW2Hl+U
 nf6mzvESpDC2V7IZ/N2dIpVqoWH4FQt+vekZJtsG5w2Z16TI8n0XtNTQ/9NGbBjT1Tbvj99NRBj
 cjDnKV2IphzotVpRcP/kwrnnFSBRGPWrF4tTv1TI2Gtx2XdpI5anEBZVsCCUea0RMOiJl1FWLCT
 IczaMEtOpSNL0VHFDz55VG9dRwGLRS9rcRsugQkFsRyiwaOZ6hFPaPuoLStxQNhLKDmXVwBOYPn
 7RHDg4YvBwel0bU/lFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100131

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> GPLL0 is pretty much guaranteed to be already on (and voted) during boot,
> since it's used by the CPU and also various other components such as UART.
> We also vote for this bit in the actual GPLL0 definition, which will be set
> as soon as any driver in the kernel requires using the GPLL0 clock.
> 
> All in all, this makes separately voting for GPLL0 during probe redundant,
> especially because the "acpuclock" in the comment is a downstream construct
> that does not exist in upstream.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
