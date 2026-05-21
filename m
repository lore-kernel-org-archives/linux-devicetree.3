Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D4437F734
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357492; cv=none; b=TvkHjA5RJwqQ6Bkerkf+9YkuE506y5HrfrByTx6mJyPWaX7tD7ZucWuzSmaGZkmWq0SwTV8RSH6G5cZKHLyrjyFRXmJiTylCq5kfmxAYyzlGUspV+2WUS8FVKa9Fo4DrRw75+0nn7IpKBmcVDKk19KuPasZRuucz+zPOeIwi3ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357492; c=relaxed/simple;
	bh=iwRni7YET8FxX6xbOUKaSqI6koM88c23NPlbPCikH+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXsTCmTDOoDk1JKE3dK+wy+cBM2+ycuTCQZ76dFo3D+OJkDEEgSPSasuHySyWDXD6ca7gcFto2eolc9MPaWApIESUDJiTY+01xv57IAxuZxrDNXVGc/0GFnkXNh8IjSC4cA/XpzJYd9g5UgBeEJGlgCWAQkUN8jYbVx39n+9mmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNb3fa0j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0FE5I92; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNb3fa0j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B0FE5I92"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99n2U517710
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=; b=KNb3fa0jJrjbMBUu
	oGAh2ja9IPbOFC4a4TePR6g8pRkA8SYM+XpgnRrVTs9p9fgIEru3jZiTA4kl9pCb
	Hb07tcuZPhLeRhP/P8DeiZV8oGBSv9/lWRNyCAS5RB5eImwjAzwTxC7BwUrE4yWp
	EesNw1XL+Bau/2SnHUJ/KOAtenDiCge2sRxkIZ3so4pzK65QkAv6rW8vP3GtZkuG
	iNjHAlA339jPgf+HwXUhmuElkdhMx5xYJILPjsZv9CaDeOcg4ACdvLwMXAaPHmfE
	LN3POsflr8lM0v/pF/RBvou4xQwb69MdJv2fA2C5bpUqV7U0yF/OkBMqK47srkix
	1b9ksQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa1mp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:58:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90f04f07227so148578885a.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 02:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779357489; x=1779962289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=B0FE5I92lr7OgifxUKaZsZ2sp8Wo8Yquttf+nibr67QyERa9Vqr8RAaOriDT/47QUO
         /Lik+bz2OOg2MSe5JFAZ8vOFmgOGTSCJBkEGfGPvw6phxoO57hg7yrnDbRnSnm5aSiQA
         nPzio8gw4YHA3Iv9xNevU5fIKoRYxWP37da1pBwfMOyn65+FSDN/iNYp1rwFMB7DwgqO
         cLWd4ki8YTNmNnNpC8rCidCAX6Z114WYES0VYla0equA63cYq3ChMvNiOK/htTQJcWlj
         anpHN/snR7c8t2UfpFljpYpuRtFTS2WY0WggIoG++gVojd6Z4cieNth/OZxAM9nNuXv0
         v60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357489; x=1779962289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=ZhhFYikYXZlMoQqfwjPxkKYUb4UCpAUQj1L9U7MVEqieXugc7kt32WUe54opuAo457
         5nr4TVvYpb9qO/4ROBHlwQt9pa2uQ6Ib6D5a4+kezG2hbffSfnYIEN2L09UVwDMEKH8h
         qaCfN4/J/RCUg37hPW5M5tzvo4mrMcOOGYj09PhkaFxZBdn7SJCo3qE9lE8D8PIckggZ
         SMVom4K6y7rGXwAFetuydinrDrVSxBXJiRNZdv4SjwEljqIIb2EHf0BOi8q/VzsX+vFn
         8Bfyi5sX2ZApmtbGRtOzHlvLcwdk2k0tws8tbLJZ558KoQN++7FfWJfQwnwyPK64XBAj
         3vhA==
X-Forwarded-Encrypted: i=1; AFNElJ8nhA40gr/68mB/DkqqK+0twHj/SKN83ziDhiVh3QmTrp5av+6dDGgem9/lTDgACbTWHmrLOm5R0Jbz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0rbGGJLbLcNEOUvjIt99gQMyaWnTs3xu0QabxXAuxYLHKWfer
	quWlSMObKIWCzGHfjeCkBE1fGoxb3u7lJZAnzgOshJVEW1zo3BLxkfm8cqeyPNCcy16z07vlanh
	F+iujYNV5fu4YefucfrO9ZRd27/oYT8umS4QBMaY+naPsetrmXeykDt+6l6zlNs5I
X-Gm-Gg: Acq92OFiE+jVXEOyLREhoVmGdhvBI4huBUdZOcfY3K+UJPKhfRhAM7Lup0D5pjy9dj2
	QxIqJ6czPZacUJRkCXxCvG4iXB1M5y0osJL0rWZX89rxAXRAM+p4lG7fqRKjfoSOB7VlBHiNBLg
	q2W8bN0xY0ysneqOut6SDYQ1wDqNWgjaCTxzUG8kSC1ISoqzH0luKWHqpXM0/D6hsfuh60c0Xmb
	r+FqCdKI0fBBd4AjhdJelN6Wl39jrgrSCxIdJPAA/nditudfxVnKvNr/m+ZZVK4OZgkjKm9Q0Bg
	Hcoi4ztVSq0k/SuY39uyj3XFafvEXWW2XAvTZwK4UkmNSb4janAXEWqB3Xf/K0qTiQT1bNyjru4
	fGuaPnemqaGnbqsOpArnUGt20I8fI2xY0thZaE20vL2MkThFTrDod8a72kh+eZyseXVdPi6URP2
	SfFAKInezh0qF4Hw==
X-Received: by 2002:a05:620a:4049:b0:8f3:5988:f97c with SMTP id af79cd13be357-914a2cc83e5mr168308485a.3.1779357488730;
        Thu, 21 May 2026 02:58:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4049:b0:8f3:5988:f97c with SMTP id af79cd13be357-914a2cc83e5mr168306385a.3.1779357488231;
        Thu, 21 May 2026 02:58:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc87e79df9sm24655866b.17.2026.05.21.02.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:58:07 -0700 (PDT)
Message-ID: <6a8c1779-202c-4ade-8a87-cf42618adde3@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:58:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: qcom: sdm845: consolidate IPA properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
 <20260517-ipa-loader-v1-1-3c3764c1b4a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-1-3c3764c1b4a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5OCBTYWx0ZWRfX3K8PgzOm7eKP
 Ee9CyhKz+cXS304Wo3vnFjC0EqaZVB4njixNe3x/zfQi68vUQRROGlZkYw3yz8qPqF54s/G+Ep9
 17sAZypKMvVXfdmV1Pdg6v5agv7A+gtfk0NBIL2UxYM7BoXzj/FQwqsCnRUNEx9iRqOadrWYeXb
 wp9CPH0zNaMH4h98QrdjXh0q4FOP24HxYNTALJTZdheoEeyAqu0jhuAEb5tbQTTdTDBiKiJmjGT
 eHsaLu22c4jArrfAMFifkR37txSplDUK2vX221QMmBbs0MHevPxSET9IsTRJ0kgUwAmKHsVMqTv
 COpJimgzZ2u3gGYreI1wRqEMZ6noZTkAzj+PgMujkt8ghOz8PHtY/0SmPWIOkhhlxi1aTpD2Omq
 5FovZdA/xylnFLgf+c4ThTZg0MIxPzvX0gO7BUNVf/G9yI8DewtzmUx5OJW4O8f+Nlc5PXr2Yqk
 9qfsnLGEDWQeX5pLN5w==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0ed731 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2tTTa69PSMra328FOmkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: sEKq9qvsqwQPGkYS7cVB2hQ-qIXPRoLU
X-Proofpoint-GUID: sEKq9qvsqwQPGkYS7cVB2hQ-qIXPRoLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210098

On 5/17/26 4:56 PM, Dmitry Baryshkov wrote:
> Move generic IPA-related properties to the base DTSI file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
