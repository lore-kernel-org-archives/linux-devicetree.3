Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192246;
	b=wXtDMu6OM2/Xr4TRrgPSGWk0bO/oBxOPtw7sS77v6aUmfAluYJqWVnWEBOSKwZze0jUH
	 C84iWNrekDvyOnPHUm249HMxd19sj66x904WeNhgkDsI7lMhn2DjJtJlcOL9tKOwvOOvu
	 hv+TdXdj+1gX9aqMsCrgONS0GMaY/NImPV9W1Q5bgbPApqXtxn8ae5xDHoNp0r7XsZUP+
	 KW21/3RCfmS6fC+f4FAau9TetJXYJn80SBlxcYkbtPISxPjCAGKpfP8sQRGMpSjmMfnv4
	 Z1JHSZhapferXlzGD1nMI4BLcn/uCDUe+WoFeGnlNPiU03BsEcahMtk2l35aNm/UDgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192246;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NgkQsGJ7F0ZEbrdBMJdtiIj1xr4L3acMDrweUpa/DcA=;
	b=i5oljku1PMXpcwOOECkJBeUCbSA48fmKRs6QVi60qC+T7zI3PvhfORsGWaT89qmj2l+2
	 Mi0AoesR5Z/sXiL9PIvLNBoXuFvjH3MgR/raBBf96t12XcA8ZqMt7mGKn0dO02xMnKvlY
	 jzJoMudAeZa7xiUSa5RVdmxf37dwoxMAnY/VEdRudevF4JdHUl90hjzASVBrd2AT1UB8g
	 DpE3oN6jYIOd/iSV/uPkRuS8sOBPlcdCm/5oDtpQH9dXxytareTbuezj4h1fsISbhJvFB
	 EgAP3Pv/OJ3QE393e4ZMZXZoiyKnbdCrGdZiLTNCK5QfnFBRZ8i9H1ZlpVf+UJ6Vb6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErqdaxSX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cRJ3RNQv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D30606A31F
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83D30606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErqdaxSX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cRJ3RNQv
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeABB1606930
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NgkQsGJ7F0ZEbrdBMJdtiIj1xr4L3acMDrweUpa/DcA=; b=ErqdaxSXIYUEb5j3
	LNq2HhQf4/3lRGxpLyRRTCBCzJNmltvBveEPBMKLuqEOtoShGjjDE94UCNMRpIhb
	HPnFmuocikNEpyrINUfycILX5SuO5W7PUEl3pm+exYGLZ/7opCOPdehDf26OYBh5
	/ncX14bV6YEVsToe/dqaAR462SqsJRp123nFCZYWXv3Mo3hDNXyY7/N8dcxEow87
	bk/57PvSI7xF2QGzUK96vGJyU5frbvGLBSw+K56/eiKZaYd0637CJfV4aqFUDHwd
	Mqe6n2Q+K6DwMYNQ6E7XRFoZMy2bgNDSi5DPevoxGgeDEEsLvvo7cqc52lKl7JxV
	Mcg4fw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7j89b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:57:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a190c53a3so1099766eec.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192243; x=1793797043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgkQsGJ7F0ZEbrdBMJdtiIj1xr4L3acMDrweUpa/DcA=;
        b=cRJ3RNQvAi6njMTSmi1EMUV2+M8oyLN7T3o52nt02vBnY93lYhBMBK7tK/nH3sV5fz
         WYD2Run4q6dCvnOUNY5JFAhfvLdQyRbDT6OcEkiXflCPNMF0ZoN/upud8I6+SVHr+oaB
         oxiKWPjIYh0zS6qMULkpPnZtSyojY5PXzlhlNGYOkd4JSfeAQJvbATWCiXpsNA0rlUg0
         qU/n2cOufZLHa020zN7gwcDwJXPuzZn6BNyiTodjZr6M+BRu3m4GGvEfXUddWrF8q2kW
         DoemgpTRSNGTNODSLBfjtnolqMWYYZt8pMBDFyB1uFpyhDCVPm7z8pwyalUhe6GSA1ay
         nNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192243; x=1793797043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgkQsGJ7F0ZEbrdBMJdtiIj1xr4L3acMDrweUpa/DcA=;
        b=EmGbO27SEzGNSayg3Owi6KNO3LKllQZS7k1HNjy4wPLXNuUczFujyd1XZPBq9QBbiB
         UHNzuPtwqwHuOI53vygbtF7f9zoxKQDiGo4rzHSQQAuR5OT0QaUwvfNpMdMyYxPYxdy+
         qP9l1ukME+R8AJq2Tdi0ls3iYjW0OEOrwLNjqsL7m2zqZrQYutkCZdHTafgJZTfHPNHT
         AT4kcrCxJZf6sHBUfzuTlosLuuqwS4t4KwHVxPI2mn7oyUGq75MBT2xAyBKAwnYyEtbV
         9shRrKu1tfw+tU5igtmDDXDmYEn88I3/7I3Kvp6kIo2WccD1MIwr1AxXqPmUqrclCybD
         hlew==
X-Forwarded-Encrypted: i=1; AKwUvBxaLv1k1U0J2sdd4FmbbRdbdkjDYdkaKkFBzj9BwCQPvKa6R7Y2+C0nmZgd8nFCj+DpF/3uWheJyG6p@vger.kernel.org
X-Gm-Message-State: AFq9FYKVAQIVm+Tb2VBHF+z00GMdxtqmAjdxRGpgumDOS0eOWWqdZk18
	Z8GXXDXdCceJ8bvSPAbgcDHyerq2EL6OKXqNTpIVYlTXqVy2ZqloykUBGEN74AQNCd3bcYJd65j
	N/eG6TukRc2Tsc/3osRjxenJMO/NSHEXQXkTATbk5kOmZD30IDzZbcJCgczOyFVQe
X-Gm-Gg: AYBFou2avwDaWVvFHsXmC1ISP9pS6vZKvxBvTnn8JWF2Qzbu5BhGHqlGP5cjKP3fcxj
	xo2N48/qkSN/kAXDykaIKNndxm1kaX3PtJsy9EF1SqbGRtYvjEPoma/UGHOxwKbB4BCvQsgOTIp
	FNH2COhxZHMtUL+L24KGD1F9MUPpBiGW7p69xHXpQ9pjYPQgLtl93a/+Oi6Dndzu8H3sul/uErx
	H1lxuPDsQ55oaMn/k6nCLPWRlBhHQ+8R6moiSEQXEEGPllQ1AEw6+2HztOt6HgZCzp3QVB+2XV+
	NLSnHu0fbLMWYbCLsKgEI7wnH7uTdsdx1yngxoKIWvDK8MrkQfuNwL5FuEbY0g+E5XXrOaVerWy
	1g0X9SKfNVEBwLT6Mvep20gvaeEfKkQUqye2sFqk+NeWu1jJh9BXPAVNGzy39R4IvHpU4XwWq2B
	S0CiFR+B84
X-Received: by 2002:a05:693c:6382:10b0:361:2a55:b94e with SMTP id 5a478bee46e88-36a24ef79d3mr1805695eec.15.1793192243406;
        Wed, 28 Oct 2026 05:57:23 -0700 (PDT)
X-Received: by 2002:a05:693c:6382:10b0:361:2a55:b94e with SMTP id 5a478bee46e88-36a24ef79d3mr1805670eec.15.1793192242839;
        Wed, 28 Oct 2026 05:57:22 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908449sm6625610eec.11.2026.10.28.05.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:57:22 -0700 (PDT)
Message-ID: <aab38b8f-9e13-4c77-91b5-d3e12c0c5ce8@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:27:15 +0530
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
Subject: Re: [PATCH v2 4/5] ASoC: qcom: sc8280xp: Add shikra-cqs-evk
 compatible support
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-4-9bf6bad589d8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-4-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX4ocNv0If5s6M
 t5Kh0m/YATkdHLtW49bE4t0WqdBWiRLs+o4c1TVsw+uqpu9Oyd5cwR7sodJ9fEgJgYP2GI3XquM
 KpkfN0xyxyXeUZ4JQdGhhQWsK7raQUo=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1f134 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ct-79n1Jcior63b1T_kA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: v_oxlxabhyW7owPkIO3fsMEuRzGRrmfA
X-Proofpoint-ORIG-GUID: v_oxlxabhyW7owPkIO3fsMEuRzGRrmfA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfXy4M4t+9fM63G
 RqtMQ5+tW2Uzu9en6kV9Bx2IB737sQ6RmKCVZ4/+3Si93iEDRn3zQpHZCVUPQTetokKZCRsguTg
 n4zrvHjmfBKbUUDlW8w3A1iXDBz0C31F8qh+K+kVkj0O06lltcVekEPXVSl+g77xplEdf+iWoPS
 f2uciuD9IFIUL2U8WbsbX4OFxvxEjResGrp6isRZLxHfdXBnno2p8OuvK2HGt/dE0nrzTsg4yIP
 wLijSdpkAXj78OlUJ1yk9IBFzuCkBjNtAnHUnHzbgkR+BAVZivM9wANGkZy9S24XFcbXy4IcW/Y
 1WB6C4eeJKTFIzwj63ihB4FjND9uXEKbj6GJ/kVzaeFqZBP1Ovz3Ki3pqXTiFCrPGQY9345vD8x
 cQdnnoTvCiLR0ikYuPPMal4LGMVtF4eLk7O2SbpNPG0jg55wiJkAczlLDT9Z3PhmLSsGK2nwR3d
 tCM0Y1pUUB3D+aVqTew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280051


On 9/10/2026 8:32 PM, Ajay Kumar Nandam wrote:
> Add machine driver support for the Qualcomm Shikra CQS EVK board.
> The Shikra CQS platform uses an I2S-based audio path with WSA885x
> amplifiers and PM4125/Rouleur codec components with modem-DSP based
> audio processing.
>
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
LGTM.

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

