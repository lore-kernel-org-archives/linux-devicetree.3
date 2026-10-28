Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192520;
	b=KZBc/OjScuSHDsLHIjtv34WLKG1aYA7yiFVkB3PhAs8e1Mrc+QW6pWKhFf4WcVYunKiw
	 TiIHFbSG5aD3UJtHggdilBuVJkQ2nB6cmyQNBJb+/CdfVSgLAzfO2Rt4FkTac9FPZgv3+
	 k8uGV6QSRyPsljnLStDQKWDyldLMekVFF1Wi6mOhkolzU4XAHYJal/Vk3TEXF7S46WRQA
	 To5tFISpmjJIAaF1csTnvKiYChTdcd7XihUPhhpFTx0W0sBSrd2KbRCLhteA3F7xsAxDp
	 dY2PqdGpY6lqs5Tqa5UW9yIAcMCZiB9HvBGvi+MZq7dRMRruyAqhAHLMtGEK7qd75fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192520;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JF+E1/98bAILDGzRZuRXRNPmaGCH431NnNIaFq3b5kE=;
	b=eg6thZnTq75ME/MwLY9GrCQMZ1308XPQrDWpRUaOg6BVsnmf9HPfNkLnuBjqt6x0ll3X
	 uvFB2rpSeSS/dzAL0adyNeTpFFwOJQdjhkvZTiETOj/nLUS+rD/5g7Y4zrVL9C18YBYN0
	 MiaAxvtCwnFE+igF8FdqbJFi2O5QMzpdOLuvozwDD89vziFe7E13DNJ7upwoFL63NoxD3
	 5YowFWbD2nSi8rCzk6Hb3OXHHMAt+C+f42z7BPx6iRAZubrADpWxF3XGga5SIXBnnwXHr
	 g6J4zeSvREDTs+ZrVGFIoM3zfxPSJLDOd0h+zU0WBasP2XZe/t441lfDpy6K31rtgzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V+FumsiE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QRJl1SXw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5BA606A325
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB5BA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V+FumsiE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QRJl1SXw
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe0eL4154661
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JF+E1/98bAILDGzRZuRXRNPmaGCH431NnNIaFq3b5kE=; b=V+FumsiE/zr12OpI
	DFvA1swVDcmHoCFSMeuxf6gR1hYAK3aJg97AZw2yDP8OeufhK62kJmBEp+gboxx1
	Xi8hsGiR7zyDrktr8xN1m+uBKHMwOk0wsVM4aOMATdrICf0ZBxCkne7RMXAuFAel
	1VqbuFP5so8wBEgNwGEGTT62Ja/jZflNjlLHbbs3hzqsW1EnUosHDzGsRCRCTegy
	lQEJAimnmTgBR3b3cY61BBkHS69zt7vwihB1XmsBSxJ5+ZO2Il1k5qFEQFIBDRU6
	FV9pQGaazuPUkMWvLM4kNU+rv1EWa0FWnbLxg1cUjm4II6mvSE8yAjrkmjcsi5yH
	96TlTQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0w08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:01:58 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso92241e0c.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192518; x=1793797318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JF+E1/98bAILDGzRZuRXRNPmaGCH431NnNIaFq3b5kE=;
        b=QRJl1SXwTC+/ycdHpnyfytE2F5CpRqYoOGkIGcN2a4cr2Ha3VgdWTPUto9uQ7Yvv9x
         vhvMHBeck42b19kdVRpjlGBm9j/XpfYVX4t2Xmsxicy2eTen5kbovrW61KzFM+RjUcXy
         hinmG5Ds78vcGID3RvHE/zTso4oIz861xipNiAYtI+twPbdpltfBMAo8pfQUlTPFYaqR
         k0oVf1KMJUf2sLpEm9uCBk4898I0yrFCwIBagjmgt4Upm5E2vMfjRylps5Mp7BT/1uGJ
         4sMmgzr7PLEUW+hf92dlT+2F+1G+F9E/pyqS3jB0YJCSeetf+I/dGKS7FMcRbD22gpmI
         3wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192518; x=1793797318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JF+E1/98bAILDGzRZuRXRNPmaGCH431NnNIaFq3b5kE=;
        b=RgUlgtt0gMHITrCJLXweraayjkWmwVUAANndZrFucAzd1WeQe8Fr8Ekmu58a41rD0r
         ssMtfg4wSFLZzbYw4V/1u2JUDcdy+oaGQCeC3FevTCt2170NBiOirbHyZVq4LYjMEUos
         Pw17dF2urBp0rTKT7uRZh8oRzIstObLkknd/RAW95US3qRl5Hg2c74BZ3/Uibwa9pPOY
         gTv3WLwCMH1y0Cwsfjhvcpi1sJTa+86/ro5GX13MSb3plWFIZu+olUvS78Z8o/YgzzFQ
         MazGRHjcNNUNalGw7BeJm6Dkyso/65v3u0k+5xfEVt3p3y0OKEpbds4Kvmi2Fq5z85dO
         lCJQ==
X-Forwarded-Encrypted: i=1; AKwUvByQke5/fBEbi8gj1zgWEw3kuYOm0q9VU8idWRGL2c4TOLo9jD4ijcjdGgxah1NhUwNnmadQCbLUz7Sf@vger.kernel.org
X-Gm-Message-State: AFq9FYJEhOJEThnnzb4+DBZ0hSff6NEqZoa1jFzttaVIBD81sdpmhhE2
	zIC+3kvkPrI+Uo6ZCHPgNETOmnvCTEQe6akLygEbrsIadN3OgoEoBV7/d2qk8wLL2tWqNgLnADY
	AUP8yusdfqaiwn5p1V/njotuZz23M5iA7im1sUzoTZ+rD63941QT/uYeCiy2hSlXC
X-Gm-Gg: AYBFou3wKBBat6WqEJ7yoLHyeZnx0emar+NIcOPTXzlziAfBQRIIUSn1TI7IsJ21Xm+
	bmOyjTSnEGuPvLK7TfeI1dRznce7sxZq9fCnIkHDxJO0uRy1LfcFOgiX0a1tfN66YWhOmsVrZ3t
	e4iwLPWcmGRLy4LIzX6QMUbkPuZkD0oF9jhpfbwDVOl3mNual7Xi0d9BuSf1w1d7ANl4fl5rqid
	eVKZNX8Na0c5Y8Je48WalXtUNJqnYGINTVtpM4Sn6ZtoL89/fu6CgBn9emwtvY7R2DsWNDj9G5X
	4yrIFMbZ9wnczeak8RX0EZQZzDiYyNHW06NJMuP7VdaSPTiFjYZN1Ja8m1q+AY87iagaMHAzJ1k
	FCKtz55EDI7iQyFQjjeGng4p45dMODEIk+z+3zeog9NAJZ1Ok1RqrtCkYtzwHMx3yL9p/5Ng=
X-Received: by 2002:a05:6123:553:20b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec4cc714a5mr883471e0c.4.1793192517253;
        Wed, 28 Oct 2026 06:01:57 -0700 (PDT)
X-Received: by 2002:a05:6123:553:20b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec4cc714a5mr883211e0c.4.1793192515300;
        Wed, 28 Oct 2026 06:01:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4eabadsm610575566b.14.2026.10.28.06.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:01:54 -0700 (PDT)
Message-ID: <4b373217-d4ee-494d-a5a0-244fc9181b75@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:01:50 +0100
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
Subject: Re: [PATCH v3 1/4] clk: qcom: clk-alpha-pll: fix Zonda L value
 rounding
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
 <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XgaDHygpVHQ_x_3-u-HmKQ1u0OfU6ohq
X-Proofpoint-ORIG-GUID: XgaDHygpVHQ_x_3-u-HmKQ1u0OfU6ohq
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1f246 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IYGMUUFy9tKC-wNfIDcA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX8J1+kXniBQz+
 hXMSFCLFl0lXQCTdBSb6IF2dx5DeowWnW9fGQjrLQLqgZwGs51EsWCoL04+BDUVNmRct8kRjbQI
 WFxqLtDRI/vV4IRf4/afUhWT5UuZ1zDeJwubUXYKnjpDN1zx6Vu1pRer9Pnku2GOczS+5yEEK6c
 Ruc/LD0v+UPfsZGvot3jrx3UmsyZ4vbbZzjlAExSjEbYG3FmThhlOXUr98HfF1QetQzgZZ7Plxk
 AaAwWrG7utp6xqBJEMbyQms3ern1hdLXQ4LXJyghj9S+GuXCzzC2RmyYjDVWahacQP/NN8fLkla
 V2BuL6eUQToYE0kUyPF0wHY0F1uzsRtJb+D4qdwsUK5F2JhI564f1xJsIOzRQIMXpQhyazmCCXE
 j8Qy1BCTnXsf5qNHnJ1/IEM93tyBadx9b9Rb3UvAGCpWAUvI9AU3s8B+8haNSGr0Y2XsfvPuV4f
 uYaQILcScNJKTb94GJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX4HvLvRHqMLke
 C9Fr2DaqKljeMWXjn2q2Zsjvx4SmB0l6tg67qvM8I4IW2hiWgbMWPLGNfh50QDcKRnbl/87Ce6a
 yPhRKV9HFK2z2QT6B1qf/5EkmaZUCbY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280051

On 10/27/26 7:08 PM, Taniya Das wrote:
> zonda_pll_adjust_l_val() obtains the integer quotient of the requested
> rate and parent rate in quotient, but writes the requested rate to L_VAL
> when the fractional alpha value requires rounding.  This programs a
> nonsensical integer divider.  For example, a 1.2 GHz rate with a 19.2 MHz
> parent requires L = 63, but programs L = 1200000001.
> 
> Use quotient when calculating the rounded L value.
> 
> A GPT-assisted review reported this issue.
> 
> Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
> Cc: stable@vger.kernel.org
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Link: https://lore.kernel.org/9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
