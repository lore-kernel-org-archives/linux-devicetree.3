Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D278386450
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994140; cv=none; b=Fsv1S6IoT+p1hQMaBau4P6PyDJRntZtjxm/H8Iq6jLVDLZuN2JlwGnR8P7OHMPUKAvyNoKoO2GOwtKKfdH79srBG4GHBMa9TtrsXWYCkXsg5b4qnpwuo1rXCnwGH2WFy96vSfT4J7+cDemeLI1OwO80j8KYwj6h1OEqOViQX02A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994140; c=relaxed/simple;
	bh=od2cNrwEx23Z+E4OwrIvnrmRbmU4J1yIpnbYsKn7ksc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p20v6FLlXLQVdevOH3Ze6vlLEjKvQdjI6QQc/1UcX8+U7qSUENSiW6ekyk+eCPmpArb7MSkAU7fl4vjammc2siuM01Iv8FXRc5/pBSK8knzcz1LwdAqEzeNNrDc7HXu3+Govr02wiU4r36KaZcs8qpsSCmgHkQ9ed4+g97IN8+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BxdWsIHp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LvHmeT0P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BxdWsIHp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LvHmeT0P"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662C3h2N389892
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 12:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WqUbFffd94CJdYg+tgT60cVAVIRk6IpevQHF0pQaKzI=; b=BxdWsIHpYGQLZXjO
	dJkqbhdzp8isewUp87DbAEA2/swjK4qe0gPIt2eDWvvlprqTcMU/Zwn9TEoKGEtf
	kDe1VTEH1h2L4gSIFblHNI7yh31jk6E4HkmfeQC3p1fMaMHed1a9y2kJg+O5ZOIO
	eST7tbw02YIWtmqBO5iJl3IKF6VXJthEHGpDfiUkWRTTrhMBgLIQu6tJJaZNGoox
	gAFrFiwmCy33QVHaT2DHq0EwPl34Ti7u4/PKsI+FO90u36b4hKBerZ8Nnb4ov8yJ
	6GFmXr4aEBuFhqMwKhQRhkDfyyOl4My/tp9XF7ZcPHpJGw5B2uZOAmR9Q8Nvxj5L
	yb5/Nw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnp80r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:08:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c069f73e4so4937371cf.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994136; x=1783598936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqUbFffd94CJdYg+tgT60cVAVIRk6IpevQHF0pQaKzI=;
        b=LvHmeT0PSxJWu7P5EknOSz4YvH1ky0GXZ8/lrTKe0Qpl3tn0z6v2KLacH8Y7YUJBeS
         iORQGfvlkTm6vuWk7QDOnlZPxMbSvgBedrE24GTgD8isX2pLDvXt9kjvm1Ig+8wWzqfo
         /dV/nipLR1uoS2pZVUaheB4fuHNt3moPjz0zbWSnvWTTr6jfYKfL6qf8rTymckDwtRP6
         pDAOUaUn9uDh6U7CdHTuylMjo6jNNstxGIcg8GPrBXYXTBNISKLEhUjNPZW4MkL+OkJt
         6DBPCtQWpDl1U/ACkWGSmFFasZnMzYsFtsOfsRbBC8OXtGPzWz1wgRHOFfJCKhpzEOA9
         uK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994136; x=1783598936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WqUbFffd94CJdYg+tgT60cVAVIRk6IpevQHF0pQaKzI=;
        b=ALgUw6IPfxvppubL1GL7flSz/ldHBlocTi73dHih8bjC4kTPvQvJCvM2vjzMAQ4byd
         Z3As9876TRdn6Bup18UhUk78nknZlRKc73LOlwvavaRkkQkBWSsje78YA07mAAFDmqzc
         Eu4l8axPVJgeA+PWoUfBRQrPxdTt9iOsMKM/x+Vr2ZxGDhA6scom+1xmPCCeNze1Z2SL
         Xzp6roga/NXAS0ANFF1SvrSC+6XqhpFMruzm4pgZA9nXlydH3qnQe59LgweL03Z3+wUq
         0IjC0JdoKuq+I+7mQ+CnKQLprIF1PE0VjDsCCwIKFC78CYyZLg3bCXeDe9IO1oKXxudg
         sang==
X-Forwarded-Encrypted: i=1; AFNElJ9SIEAJA2VI+fzesKomcndO85sX/sHAzkUBtLeEMwyaAF6zMxFaas14pRTgW37OeRoeWhcFO//pFYTO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf6PDYpT+AW73P3uCzeJxnxrBd95xOm14ASAavTNvFp3RJy3lV
	mwDf3eh4II5iuRR3XDDN0wvHP9op60eTg+TDeEr7FCU5L0evpDg1ZZEvXMmzxfEM4GSPsUaeN0v
	Y8a+tOQIqoeu8wlGQRZDahxatwQar+qDLicD2yvf/oW9fMF6/6zglTCexxrQcCrrD
X-Gm-Gg: AfdE7cnAfkw8GbtRKJKn6E0oUTCvk8llObvku/m2jAL3OSfFdSUTPh2rSzIGjPTceye
	fyTsUzPEnkG3f2WCC/PMduWo0mbfpeS1waTwspdk0R94dNwOI4eVNsOhMz7ZaA6w3GZUGnUonJY
	iXHp03sG4Mx7iz4CXJfHv6M+lXWH1yK4bilDdS8C6uFMKPF8CfWBEQ0zPmPFc1UPK3g6UFFjXUq
	hgsVS6CdGc7E41NJ5phisYO9oMhgK52QPHiSi4R3sA9NpR0G5ukziGIlEEqTIJfcCk7VLyZgmsd
	1Wbc8l8y0bQX4/d/yj/TL5wtoyYAokGe6E8wrjKnUx2UsLfp4EVwpd1dj7jw/idJ7SIXqEQRtY2
	+sj+tL5ne2kbVnJ2BUsks0lEX6sCeMrs3OTU=
X-Received: by 2002:a05:622a:13c8:b0:517:8999:6c50 with SMTP id d75a77b69052e-51c26b25b59mr58048531cf.8.1782994136194;
        Thu, 02 Jul 2026 05:08:56 -0700 (PDT)
X-Received: by 2002:a05:622a:13c8:b0:517:8999:6c50 with SMTP id d75a77b69052e-51c26b25b59mr58048051cf.8.1782994135600;
        Thu, 02 Jul 2026 05:08:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628efefsm120580566b.32.2026.07.02.05.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:08:54 -0700 (PDT)
Message-ID: <a1151605-242f-4044-b0cb-7decf643e83e@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:08:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] arm64: dts: qcom: Enable SD card for Shikra EVK
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
References: <20260702073354.3641966-1-monish.chunara@oss.qualcomm.com>
 <20260702073354.3641966-3-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702073354.3641966-3-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyNiBTYWx0ZWRfX/RgOU6bkGdRh
 IUKl3hN9jmbQQsa/JS8UhvASPETiFfYotusLeHjpz6Rmci7rHAYJEdmBtF2LoXhC446ybPJEBMN
 WO4OCFBgJblp0dsQOvMlZa8maroPfmg=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a4654d8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vBACkDl9X50tgIqftl8A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyNiBTYWx0ZWRfX+pO+FXokRQHg
 MvEeefIWKROcqGSSpaohZTlfcfee4dXrkitsT/DW+/6LF6U2iiOVgqzUSoQM0+0kPYdpptDrXlS
 +X7A8WwFpSdZ/rpn41KwO3D8P9h6h+UaClNtha2XB926sGB51wB9OFiz9cgGkg37W/PBKLgVY24
 UmwS5dotCm62unwiVLdIOrFYt77Q9NPU9FyIoUpScKfBb+moakMJCarTgrh+UHgLMrZdAaPNdkv
 /Z0PKH13Xh0Sz9d3RmAMyJBdGSeLzFB8ih2MXUGWHE4oMvJ5GkZWj5iCygq3JNsJ8S2O9AhfXeE
 idkav7YnnDcbcILJ4Itz9HtwqdivDok5pfY8ltKn4sjFzW3vdR61Nk3oGJv5MqYRf0+Zs+FtJT7
 f4Bev18FkmAwEvBtvqPMkcaX0tBcJb7Cd4qF5L5fb6m6I5oKggK+t5wNK8VNswAh9LuZg7/njBv
 +x8dXFQQZn9/hKJVZtA==
X-Proofpoint-ORIG-GUID: N0pWIrgFOfFS7VsOzblKqTSGiLTeg4MD
X-Proofpoint-GUID: N0pWIrgFOfFS7VsOzblKqTSGiLTeg4MD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020126

On 7/2/26 9:33 AM, Monish Chunara wrote:
> Enable SD card for Shikra CQS, CQM and IQS EVK variants. Configure the
> vmmc/vqmmc regulators and gpio-based card detection for each board
> variant.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
