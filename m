Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8211B3876CA
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259525; cv=none; b=VuwElbgyVH53B1kRdYzYiBZrR/0PsOdFffKADncKzDRUc7abHQ8V4ZG5oZwTc1uXZjiKN3S/Mpn2sNPW/+p/BYcZPeA07PTTlf/4dZU04SeZaGLYTt8wXJe4YaOv0VgTSc0HMj4SIkIzcPYXqV+lDTP3YEsiTNiwDatfcfSmBng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259525; c=relaxed/simple;
	bh=u+fiRKSs7mydM8yN930ej8ZzTpTSshn5Wz9CK1mO/8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Im3a8b59b4C3IjuLxiRrCU28J1FANWvg5bN9yU89OFefIrJxNiQlnAUUTZj5gxJQmjPbbEPC6B+hQ8WVXOUdoMkGmrNJdUjpa99VMnKb12X6Ss7r5rMLtDiEHtLDXNdYuKLOF2tz/S/V7JRGF0bh7UCqRo5qFyAukKK4VzEHWMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRGYH6vM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VIAhnSf+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRGYH6vM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VIAhnSf+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tWXC1627093
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czqGELlgNYAFwz5UdyFPRfpwCWUsQK3FF2zUTXrhlPA=; b=fRGYH6vMgYbd/JqS
	N/kZtHL6RmiBpp5MF6kx407bXA9UKyq6NHc/kUtIGuyoQF2Y/rK/zV+p/3e/8KjQ
	lcOVMWqb+WFHkrZVpa9HxYxWIQrjcr+9suSONmFDVyV6ommV2LlvHhD6MJsFTl+u
	LOJZe54ac4D8mxcqPV7/SdTBRtMBh3f4OUJVpPxSBsLeGr+QVc68cEB3kyhxN/KJ
	8fjEzT6Q08onSoQGZ9pk5L4Ua9NoVBNrbqaHbcSZdXJ9Hw66rgFAuiqAdiY1JxLK
	mM411WXf/iGCRTxEolQgaRxuIQmvJrZCHtn3lHldSr+NY4t/CwS3fA92RHJ7A5TT
	mt7tmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc0drx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:52:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb39de5c54so333829285a.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259520; x=1774864320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=czqGELlgNYAFwz5UdyFPRfpwCWUsQK3FF2zUTXrhlPA=;
        b=VIAhnSf+yb0PXuVnV6EfiGHApxSxiJqJG6kGtFgtFxtqMyJ+Kc6zYatPItOmp0kRJM
         wLbm4m4ZT2eZ3r+dJsvaGoy0GyzcjbN9KFhzTIDcCof8Bd0vH81Jti9RF42lwdHQiGXh
         lSlAmFEMpDvrXp7lApoWk7E5G8isKmh+3oVwYCDEbXAnLK61jvkQd01vVZc/wRD0QEI3
         LYIHnmXlHM74y3fBxLOH103bw92VcgOCLGu09KYkUk/6TVDnZPz0xocEhORPQLuFjzFP
         X6Ys7j/cB3rg34htzR3WfWf999exU2O4XItWWOFulvOgzWpb5Yk55aLAtmjJZLPsfkiG
         JbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259520; x=1774864320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czqGELlgNYAFwz5UdyFPRfpwCWUsQK3FF2zUTXrhlPA=;
        b=SSpgK9RjiM6GtHoP3VJEFQebz273rpa5Ejpt+cbfoRTcZkgzNqpqVVC2wPx5bzQb5b
         XCj9Dsg6CvqRAChsTQ5nOinE2iMkqSuvs4G4CCdbl5vaPR8yGJKySaSmwCeE8nsTmVz5
         wmjMFVH2wL9viROxkx/1W2CKm3hPbd3bNQM8Kco6SnFWJLsccH/ARkC3A5hZ7U7dQUzJ
         cGoWiOmR1Jeb7FJeNMbegkJaevZwt7BCCp6/pB6GPjWVc9MiXH81AIraBSgmEbrXoPjS
         6j1WUrlSL/IDYsiXbT/09TU5Q1pr5bqlMBeXDy5Xe0FcrAy9ToLyxx4vhHcnauQnLyD6
         GjMw==
X-Forwarded-Encrypted: i=1; AJvYcCVDA6raPaKbp+NEe8ETgcx8uHg8wfUgOW/006zqs8sTmg7L5vLGbkeHYGSm1roIPzw7tCXV5tcHkCQP@vger.kernel.org
X-Gm-Message-State: AOJu0YwusdY9WG84fiybEe6eQGr/X/vC43T2GmUbR/SqTYebgJMStYnT
	i6Fq0nWDm5wlEZ0uyZ9vuDgreK4FV1eTMw+6fJ0o9NFYEXUPKXHUkMlfq1bx2IFtvG/gEOIC6J2
	kzHMyyxQTxWe39TSARNotmU1YrAffepVTWvd1rxgfWzz1TOFWKSwXFCp3Gu1rWJab
X-Gm-Gg: ATEYQzznBJNBYqqUzMqUeVFjRW6eOBDq0Q973EnvxJC/v4nTLgjppHD4cbXWCjApicp
	hMh7+VQ78x8UTT5z38BPTW3JDzq6VF59cwLvAzPb8Fzgw8cte36zqWGgxYGHpbgmQ31xSoq1KYk
	KL1ElCwHTMyUZUUkcmGN+K6B08nPehC1knvSlrmYVKn0tIBYhdtgv+PVTPCFzO4sVQwLDDYgV8S
	Nfe2s67g7PWd9g7XB4LDAP0KCZox7n/QnVtJVoXQMbx0nE2C/LMGNKu2a2Lh3VifkyLgiHJKAah
	FFn5f5C22sQ0i2g1f2kLQG3PWLVffwBkSziKKbaFrudbAplak5DTcKct/PYUu2D+wgUjz4W25dd
	DXLYg6EHiBC27NVgK5piiNEipP9joiNH44sC5mO0iGDLVWPjLgQ97Esw1n1Y8eR865xM41sLUx2
	O0tKk=
X-Received: by 2002:a05:622a:1992:b0:509:d76:fe73 with SMTP id d75a77b69052e-50b373d748amr139954781cf.3.1774259520538;
        Mon, 23 Mar 2026 02:52:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1992:b0:509:d76:fe73 with SMTP id d75a77b69052e-50b373d748amr139954671cf.3.1774259520101;
        Mon, 23 Mar 2026 02:52:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8dff5sm468904766b.24.2026.03.23.02.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:51:59 -0700 (PDT)
Message-ID: <bd33bd53-2539-42ee-ba3c-4a544a61b621@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:51:57 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: milos: Reduce rmtfs_mem size to
 2.5MiB
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
 <20260321-asteroids-v1-1-4b902901cb49@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260321-asteroids-v1-1-4b902901cb49@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c10d41 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=99d7ovULxnTXCptroH4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: qKzPLcSv160L0mdDzHzwz-ynaB4hQf3N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX6EuCiEV18Up5
 X2Nl93h6rNEDB7V9urlnAoRFhPpHp7LneqtthpZfjZzVvEu0UrC1yIPq06XXkD4s3c5Fsb4UZRD
 5ZTXVk7unCjYkDWVJNEQRkPuQAByXBsXO9W8/L+qfIiZWeuWYxxFB9Sy23mvAg4WS6CnGSI2hOS
 sj9yn2Abl83w72PeDiT2aWl6MJP9xaeUO+neRx8fIp+cJJLvfghdszg6BDAyuNcypICwH0E1/ZK
 VkroX1fRrPRq9gPi9g0n7LcugtE2ierKe61Xgrl6Vw8FOl0RU1E/tEAzMuDTT3jKCeD5F4XDKWD
 5tMwXmgeZYnETY+3o/vcTBqJIu1+W+0sOne3gmnbM+VBb/Vnhp32EA5VDBWwdnFjl4VcCtewIxF
 0KqblYVVB5Lu4bSDet/XhbbHwfGxgB9LTaX4n/UpCTcLkc2kkAiTfSsl2b/zj4KyzEJWyfCIUF7
 bmqvJMcuIBCNqyMifYQ==
X-Proofpoint-ORIG-GUID: qKzPLcSv160L0mdDzHzwz-ynaB4hQf3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230076

On 3/21/26 6:00 PM, Alexander Koskovich wrote:
> The rmtfs_mem region is currently sized at 6MiB but the default for
> milos downstream is 2.5MiB. This causes remoteproc crashes on devices
> that expect the smaller size:
> 
> modem_ac.c:281:Access Control Error: Could not protect the region specified:Start:e1f00000 End:e2180000, PID:1
> 
> Reduce the default to 2.5MiB to match the QCOM downstream config, and
> override the size for FP6.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 4 ++++
>  arch/arm64/boot/dts/qcom/milos.dtsi              | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index 52895dd9e4fa..c0981ab731c4 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -724,6 +724,10 @@ &remoteproc_wpss {
>  	status = "okay";
>  };
>  
> +&rmtfs_mem {
> +	reg = <0x0 0xe1f00000 0x0 0x600000>;

+Luca

Could you please confirm that this was intentional in the first place?

FWIW I see that volcano.dtsi indeed only requests 0x280_000 on a "clean"
Qualcomm tree

Konrad
