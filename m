Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600221B78F3
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 17:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776534993; cv=none; b=jGSI7MX3VfgFqgPk5i5r6HqLwl3iAhytTHADW0SAWCCcYU+VLeqQ9qaJZChWrZJQvWsD3v9LEIk/bKJDlANvzNkaNIE7KGRjwhqTgBc4VUSz3sUKg6oWuQcNtTFBStXPzr1j7bcYmqxzyyfrvJR4ZKnPmIwmRu8SD69YhFmwHY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776534993; c=relaxed/simple;
	bh=TdRKJoKJLH1ZyW36YbA49ThrdaeIzbteBKjTmgDjuGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0FFBqOxUCniKPav1ptBFN7Y8cIdCXKpaTLgngYYBQq/QavaYH0ZJvQgXcUSYyTl7C1pb92XQsDGiZ67iItbYV/5aMoXEF2XdRf2uHfvGfDMc9mHKKuoSaYyZ6dj4xwq+xoYZ8lWN9DW+Ns8YFziDfFflNMSWXWUQ/IAFDt4UDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9Ty8V24; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SUcMrvUx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9Ty8V24";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SUcMrvUx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63IAShB32135277
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 17:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A202KZUjkcxwmNARdow+n/GA0VYSicUnftkZ2+5L+1Q=; b=n9Ty8V24jxN4vZOW
	ai2tJw4Z0yG5VoRlGD9HQ5HTR1AqwzbG8FBYIcVI9fRsCU33rL+Mp2kBj+7Aj7ry
	8vS5X/gYKbVs9Ut3RPL5XRj1TZc1aibSKJIx/kHBngWEbjeVNdAw8YgjICtiXn+M
	WQQtiLQKYjHJ/5L6vopc8q/V9e3blGdhGboE8UfThxBCiXM+kXSPzGjbtQzbdLIh
	Qgv+F9Mr76PzjLlkZs+nGJDWK5pKB6sV4gW0G4oEETLMlBTzW5SKbZ1ECUrE8qXz
	xCqH73nMCzc4xYj05QkcP1pIbBeGvuLmEot2qGoXvmyKAy6GdHD4o/pTPgbiUZ95
	oP+AUA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2qah7dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 17:56:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca29dcd69so43087056d6.1
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 10:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776534990; x=1777139790; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A202KZUjkcxwmNARdow+n/GA0VYSicUnftkZ2+5L+1Q=;
        b=SUcMrvUxIh1KTQIyQkGHGZScYRfoARZ7SZp7XQHyc1ISZGx+/FjmdpPQ44apRNqJnf
         IeQvpqxr8fNL/Fl0oqgLsdL9r3OoY4TPtYh5dcaxt2tjQZMzeC4Q8yQkTZrKJgvahue0
         tkr1ndcWaJ53eGw6juwrswxFyslEMSJPz2pO8PdKZGvjPR/lGfo0f/Hr+MJKS/4u/R/Q
         ehmdQLqIr0XQxpjQ4aYvKmoVBPGU6wzlcSn1Q7cTyK23z3rR7gOhzSJClI/ezLhJOk2F
         nDzhFuz+4KMfHVRcQBJQ7YMaQPuOe/pA9z5VbyJUIqEuW3bPby6dNLD2y3TIlf+xMlPy
         /2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776534990; x=1777139790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A202KZUjkcxwmNARdow+n/GA0VYSicUnftkZ2+5L+1Q=;
        b=b1Am3hz+7qV+CkmRmAW36tEENSeDFgPUrGa7qf4a8V33bIpEb3EYqcf5gmV1H+LitT
         NLBNVTHzNSC9o8ORybXP+qUUTqfbe+69wHlJaBN0Qan5f6DoqKdOOhEMqQDm9SvaxTG+
         0ICio0iCwjbbYvI+jksg4F12xph9o08NhQfwv/PB71gXk/5zJ8QyqoiB4z24kmEUbxFh
         lPAzr3FaH2xuLImKVIcEAIhq5IdCWUaAKYhXwM6ElrKOb+uH3H+YL31WOtnXDxpn55Qk
         7tfTxK99SC12/0qcxa/FZ831wsDenTtTx9XApGjimgD+nnQyIi8OMW+Alf19sEkg/ePn
         oJ6g==
X-Forwarded-Encrypted: i=1; AFNElJ/sT61e32GX5rcPoRmrU1e3iPrz8caqR5kcSgOHYCoHLNYQ7rDcPBQuVILfP7yd4YgwGOo82Pi4LIwv@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw8QDkEeyj1RPKBVIR+LiISxixfEc03H/3mYJc1cxrcgwnh0kj
	fKddJzAtwuFQROq56iU8jSZRLsbxYqqugzDwiivWzi2G6vTNJsys9vwQGws5VuIS46gPXQZHs5C
	tEJMz6FlTqGd7ZngVV5q0wpozVjDLggV3UiydpdNdZV4h6/xpSjOlKguAJnADkvDP
X-Gm-Gg: AeBDietag8sFGUYabaadxkegz55HqK4QnMHB37JFFV6E/IWZGqzfATZAlVwBop0Kbel
	2/HOhRmG5ITcA/SvfyM1cf85PuDGItjsV5avpQLb9vr3dyElRXsv4GZL+4CKO9m/kUhk/RGByr6
	yODKC64o5y1DC2xkOcFZiOvMQzCUBZESyRyZXpPPqc37NP8Nof46NOkQWuOu61IbW6+MdgPtuRk
	jZxGH6eT7aTdpjn5hFUfeunZ3m96aCyo/VxW4cLeW4iF3FaY3HkyD4Vfe8ursyLGvrUHm5NDyKi
	QOMDCM/uR04Jzyq8n6MXfDaEaitHLCx1FKRYHkPw71JHOnZUgdEQzG102VwL+S1DYzZoD1yiiwZ
	pF2pOt1Qzh/pjTCw4ykk2+De2vtR6OBjDC8FzqA4bHTvxnFH7e1+HtPVPrQwvJgTQhwpdNVilo+
	YEJXEBPCSuN2rkzdCIPbXV2MuVfELDRtazPMSsVFj22aJVaQ==
X-Received: by 2002:a05:622a:1dcb:b0:50d:74e4:56b7 with SMTP id d75a77b69052e-50e36837466mr113732881cf.4.1776534990557;
        Sat, 18 Apr 2026 10:56:30 -0700 (PDT)
X-Received: by 2002:a05:622a:1dcb:b0:50d:74e4:56b7 with SMTP id d75a77b69052e-50e36837466mr113732661cf.4.1776534990160;
        Sat, 18 Apr 2026 10:56:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7a62sm1488772e87.56.2026.04.18.10.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 10:56:27 -0700 (PDT)
Date: Sat, 18 Apr 2026 20:56:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: purwa-iot-evk: Update TSENS thermal
 zone
Message-ID: <xxouwrtrhgyf6y6xgpqev3cxomn72mty7kvuzh4tof3jnmfmnf@6deaf6mhhdpw>
References: <20260416-purwa_high_tj-v1-1-b538f98d42da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260416-purwa_high_tj-v1-1-b538f98d42da@oss.qualcomm.com>
X-Proofpoint-GUID: wI4dDQe3uFNUOs5qCBXK2W2YsSx5-VgV
X-Authority-Analysis: v=2.4 cv=KdDidwYD c=1 sm=1 tr=0 ts=69e3c5cf cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=irIo0gwFZieol5Rq1NEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: wI4dDQe3uFNUOs5qCBXK2W2YsSx5-VgV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE3OSBTYWx0ZWRfX3X+OCE7SoMnQ
 su/X3dZlT+uj9R3kCvkN0rEXHrlCQbgE8WfYFZr0PmKDkaOjgSrMei6bZpyTWSqhDAR/TiKHfN5
 KtRfPtc6tUcbxnMcs7P+DD3FlQ2a3G2iXxgYMFcS8hTvoT/kXBlA5r2SKwQdDpwCiamuT6giTFS
 D6EbvRdjJrkNSjRhPVAkxGzknnCAJAx3HRda4/q3AcJBerukRljoX8ZaGzHMpTkeDlLOyaizIiN
 UTKFrVtrkvsVm49gFUt5hcvx+iTQTL0Aaa8k1WNlG8L08KZwJzTl2gi1Wu2lt+qaGaMfv7lcGEC
 /SjiDz00N3qxce9qTumrkQg48bJp7NCswsXHpIlV7mRpNUZC9UHXmBdTenJpFfTD1c2WXCHpa4H
 VEIlw8Jx3UJjhwmykVQqmxJVZXx/hLMn39RdYl+fM4xMzg35iNvoWvHwOUWypjBCgle8+lZBYtD
 7XkUBk/ayV9MBzSLSqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180179

On Thu, Apr 16, 2026 at 05:04:48PM +0530, Gaurav Kohli wrote:
> Purwa IOT boards support a different thermal junction temperature
> specification compared to the base Purwa platform due to package
> level differences.
> 
> Update the passive trip thresholds to 105°C to align with the higher
> temperature specification.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 32 ++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> index ad503beec1d3..261d1e85651d 100644
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts

Is it a property of the SKU used in the EVK or a property of the overall
form factor, cooling, etc.? In the former case it should go to
purwa-iot-som.dtsi.

-- 
With best wishes
Dmitry
