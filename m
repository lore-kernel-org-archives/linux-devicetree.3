Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975BC4A5EDF
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819088; cv=none; b=C1By4j89bBAk2uWDHZkPLT0Zb75DGxfkeWUNGWuKhmTQ6mLf1GMDUjLbli4jg4/7UFWnYdrsKIac/yLHHVSQNbT7WwPpD/W+2PcuXtZH8+UVZnosvfpIhap90M1uh8fUUAxtZFfS6AUPn5MzTuv2Ce7pxTXrN9jPOCs1noTIs5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819088; c=relaxed/simple;
	bh=E0eYBDH6q7otgv3NMgyjKsx25BJurQD4IFX7mtGQkVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qtL4X+mXUZ6TyxDpR/8KwHc99ptOvuCXfgUHQ2E7PUSCHXXbZ7HAvizov4sL68ZRtCQzSX7nv5iC7JzsQn/tm68bEjUMo9iwUgjkpc19X1XrYfYta+5C33sqhwjcEi5pWl0xGrdtnWM7XF32TnMSz7LluwZxbTKccJxe6PjPOvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+8J477D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EuIvy4di; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+8J477D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EuIvy4di"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0BXB2275910
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6RgNgtTktLuBEblMjoU/JvQyqD2FuH3FkedFx5A5/o0=; b=W+8J477D190EFoGe
	43EH0L4j6qMk4NZI9vhWnH7ftVzxgKDm258BJB3026WyOO0gWBykyX+J3ZzuLnNc
	zKPVEGVdWDDC3hQ94WoUhS7y4w6SS8cO63I5Ff1bG5rU8KhuGdre6GfKi26i19GD
	zt32WNsJIWo6slJkKfybksb9O5ae0eKb4nh+LAQTuZqq7ZEambZFQJ40eP/shdZm
	MSQP/1VfWEGaQccXRCy79IA/lMxBuCsANFqKJyTohNHBKmwA1ZVRhy59MhHDyG5Y
	AtdFteeAqZ2s2APMxNH6FasEp+2v49HGomQb4KCFwm7auQ3ksjai7ALsfUyU/yUm
	3lBsvQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq22hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:31:24 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c274c15c90so38853137.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819084; x=1792423884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RgNgtTktLuBEblMjoU/JvQyqD2FuH3FkedFx5A5/o0=;
        b=EuIvy4diqUwBdll0aJ4naeWySQ0pLf++tQ7vVKI9e5/fCmwpwymi/qYQeCoLG9Rqb+
         qXHuw5NVIcKbJC2RJ5yOmQpxvnat7oZ6xaFwdeV+YbVgmbxEsbUN5XicEnrRgTpyHa0Z
         xNP9/TXGAlaUR7qaIH8FICrZTDj7R9gfCEsmWIZgNraOYgUzKWoss4H5zEWlJP48GyOB
         i8jZez0ZuAvtjoUuc2kRtcj2I+Yxbp04vNOtaHis1yaatlIS0b3qnqcfVKCLgEEisVU1
         RIdnYyr/q1mkpHKm7q0HbbTshypMM+JMjIOf7WvV/mPdmlT5jviPCd5us5LI4CwskLtT
         6wTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819084; x=1792423884;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6RgNgtTktLuBEblMjoU/JvQyqD2FuH3FkedFx5A5/o0=;
        b=r/7xgfnthH5UjZ2fp8h8zCe5uXEaMdmXgY7PxVv4H447manzLtzCdDbAkRGg8zWWi9
         NREAT29ps1p5KjTuESCBUp78i4jRCQmwg5L+Tq62PKeb4XXxxUWAQHtU6JQ06fo+fGbB
         HOakXJqBUzqZQSoAsp5dqBM8sHs/SpPd7wrfUY1Qj9kCZ9YTwTElMjMncHVXA704BzaB
         SGqtP/ZfhtS1R09f/uNFhnMIUoSdI3G2yHI6tX4lSD5h9wFWiOcRVKn9RMZPWAJRG7ob
         wkcEL9h6UhOCOX1YMmkXwC16j/HYa4Oe2lpix2c3RIuP8m0Q3ypLr7je/fB4NfzdZiRL
         XUzA==
X-Forwarded-Encrypted: i=1; AKwUvBxSnolkvGcA8+XNQhTbal612FRx8Ey2RdONx3rIf7V87JjA7BkDk+smuTs3sNk3sM84jABO6lH4PFdS@vger.kernel.org
X-Gm-Message-State: AFq9FYK8A03DERrhc1uJbB78A4SKkbSUNZgbWnOy6tB//CbOb1iMFTet
	6YqGDByqN868uViAFvAdei2MaKoJvERa0CGiIEoMyPRkvyoOTHt1EKajVFMTGzSUWvswlaNnBXJ
	l2cCpdwbeKxvsf5Naow1wRemVtxBhhpceDqR9UdBhYSV1Wqt63pVb0KRsblQvj+vW
X-Gm-Gg: AYBFou1Ai8CJQHAFOHE/2oL+7i6fudirhukkWyl2/kUYY3ukau2PgYwNXqfufGDSY5F
	4hMNWlnM2DKqhjQ054HLi6oHkT6JedFU8erEGlvuyaekIroxaAZkvAN0c7RbIAoOh2vlc16iJCM
	719PuqHRRwrjJE86SAj7bU+NAebeTjUXSTLDE0hAC5AUCUR0/JbEUctRb8JS3nA3dIAXDevWsQm
	trA5Hczekjz1e28o6glM9CJwrTRe0bvu7c1OosAJrhg3wWHHnxlfGU5NlOuSAOIDlGcmoBIFqfo
	KIdVtdrn1bltjPc9Lvr2MjcQPHZnXJx/Uy1U43wSh+d6o9iVhH58AjDpIIYW3tV/tTbv/sg82cX
	3WO1Kdtze86YAr8I8dDS0zg==
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr1928359e0c.0.1791819082486;
        Mon, 12 Oct 2026 08:31:22 -0700 (PDT)
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr1928328e0c.0.1791819081948;
        Mon, 12 Oct 2026 08:31:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34001fbda1sm203669366b.66.2026.10.12.08.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:31:20 -0700 (PDT)
Message-ID: <526230fa-d8cb-4e33-936b-a3b99d271026@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:31:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/38] arm: dts: qcom: msm8226: Align multiple property
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <d9bcb8ae23ce2143e598d1dc68b1050684b22246.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d9bcb8ae23ce2143e598d1dc68b1050684b22246.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accfd4d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3-RhneuVAAAA:8 a=IcLJOOV1pWpkvDOWcK8A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX1kNTrd537bGJ
 KssT40yVTMy10jcEjyfLJ/DQT4O8iPPJEAoDdygR2voUkNvd5N+vDAr0YgDqahXl0Isqu7XoBLe
 g/lXq4yUePZzmcYnRFb1OeVKRObaMcM=
X-Proofpoint-GUID: 5H7goS3-QjcMmdqyMtdb93hGQhDDDcou
X-Proofpoint-ORIG-GUID: 5H7goS3-QjcMmdqyMtdb93hGQhDDDcou
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXyJoQ3jOb5A2y
 c6H1vrIndN15kGxlYniYAVlMAFIiZlg2Ur491VtR+ebs24Q2GYeV/75SjxyMMQ3NV/4T2EWogiM
 SfdckVnt+gRpzkAItEtedzCTPOnwzKmWsHfy8Y30YBfZurU3qCB2PMbUcmJ0gdKRe+WeZOgqD/A
 CmX/eLVZQeOU8OIrVRW2i+btmxF1H9M4DXJ6IMw/3LZQb0SBCTu2r4sCmqGjlqt0qWnj+Ik3H86
 xtCVKDzuxgpFFxtcKPeFgPXPuzftGd3tgx0Iie58GsHKuRcSfSDdSb7sOaqZJkw10/+R+eadqVs
 Oq+xB6L6sYTCM+dbLZ6eiBdNEJogf6Jx26HJfOOQ/t/DFL0FmD85i0EjFbRZgpF8mfm+qtK3uH/
 iNIpzwMGB7YKjlDOhA5y6EVy0WmNaPegKSJi+gNyd/YMb789D2+JGuWVl9Mv6dc6tX3FmSM5GEN
 ucnRS93AbQQHmNp4/qA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be aligned with the first
> one. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> index 346aef4a1d9f5..ac18744b50924 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> @@ -1483,12 +1483,12 @@ cpu_crit1: trip1 {
>  	timer {
>  		compatible = "arm,armv7-timer";
>  		interrupts = <GIC_PPI 2
> -				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
> +			      (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 3
> -				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
> +			      (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 4
> -				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
> +			      (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 1
> -				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>;
> +			      (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>;
>  	};

Likewise, these fit into 100c

Konrad
