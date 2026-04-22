Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9769D2FA0DF
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 01:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776822578; cv=none; b=B2vm0YQOOSodny3bMfOwYLnhf+Mu0CWG5cki+AHcjP7mMxV7YGWWtRPSXpI7suHa1xuRLKW8okwlE5w9KRYxvMab/faWl3U0EKpNorUsedDRaEzuKy0MjEw89yPTpz33y3IMyZdG6FEkEeDo7WAaRzMkmIbsWEdG69w1j5ZMufI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776822578; c=relaxed/simple;
	bh=+Wtn7wvNYHZYHKoX5jpV9Jp81OC6dD9Jr4VMinq3PGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/WjLLfUxpxLy5cGsJdO7h+sblA+71IDZ0NMu0c+ZdQVu4Lsl9F3WEtWQuPwMGBLj0XQnmYY5A3zU4XkZ0zU9HVtOwj48jQQ3P2QdNANRDDnAdi2gmMVfzXocBpvvpRxPY2bdnKhZ1DknQ9NZgrCN4L87NAZnq/0uhfJgX+nWS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ms8Cy+ly; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itIgq8am; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ms8Cy+ly";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itIgq8am"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIa4vE164682
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 01:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hurFr09vNtmPRCEJnucpGA3f
	RhEigXPf8InOBEhGYnk=; b=Ms8Cy+lyTo8U8uLX2ZfLEM+kvoRgLHCEf6ouCKac
	vPQQn6FqXzvayAm96xM5z7MTjnYIsJojkmCvgUaj7XwVWc+zIU2SvYPKUk/TrJjj
	ZBYC6KG0jINAGs3Z2t95R45sQhGyEKUEslf4yHLcGDVrpO0l9IB0pOQTmN4o1RzS
	D+amClEcSUbvkr6OPQ6mQ50k11VcxIsCCjLwKUaiU7vDX5GIChkJ7R9EP6go6nFL
	AdtlLeIs55ybvZQs2pmfVK9m7DPcy39wvcwE3jhWs2DC9eM0vqOOfQ8xbv/Zzqtf
	vtU2Q8ISf17YTcQfKAKyQBvWSV0H3lQ3yJVWYqdL43onSQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhh4g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 01:49:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e5ca8ffe7so52096061cf.2
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 18:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776822574; x=1777427374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hurFr09vNtmPRCEJnucpGA3fRhEigXPf8InOBEhGYnk=;
        b=itIgq8amY7a4wPD9GY0JelE+G8QoQXeG1wbRNyIJhEd0DK/u/FEd8qrZUaACqN6C1f
         ktLlX5zrcLAzjpzJo9bfZfBSerZ0+iA1zgZ422lpwDmKtdECofUuaktRqnPmJZZ8Ax+x
         f76fh9kOpZElnVSKG/ErLfDvPaqOZ99PuOGPn5yy4HPlvqgpDswxURHDQZ0tn0tSiJGd
         QtHyVTHzyFVMewGbP1X1i56CoVsCv0C6jsrRHCCg5qJKR8nHYx9H8v8X8y6RwPjT25Ar
         EKowb/Y6sYiI/uZg95A3Vxhl3fsRadjws7W5RmyW9U8hSkgPoA9kvJeOgdzDvdrdiP7e
         r14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776822574; x=1777427374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hurFr09vNtmPRCEJnucpGA3fRhEigXPf8InOBEhGYnk=;
        b=Nmnuj6I1C5u0AuCfoTcan6/NgtjwOQuvPD5Bk//PxUJpH/VdUdGxrv1+E3IZDbqd0n
         KfsWXSZhMhjNoyjf0r5ZPvonPgeMN3ettP7G4Y3sSYjJLlGN+B0umVPDRHO5ouQuFC0v
         dYMa+ivxqPNoZkgjmpDHvcGtBdTgWQ2RhnOP2GOKtT0psGX1E838bpfC89v7uwgT0OfH
         8Szob6da3M/gTKH7dtXCJv5wCvygikip0Qs5YcPnSXkIoLncBgKyYBUqsggxDk0RCZ4X
         T2ygfYi9EbAX34ATZY6SMc8bCKfs9IHYO73JIGVPH1Qk4Vbt7cnSIvC61R0GgViHUcVA
         eZcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/WDehSpPcKiOHzE2PiDdhmsflaVfHLbxPAFrOxBWvP+LMPYH+uK3v7qOycv3ddXmkbvp1xJOqX7KuK@vger.kernel.org
X-Gm-Message-State: AOJu0YzcWXns5SdlVKEh6I6n8xLFHKovgGcb1KZZJPboO6lh6cYVZ8qR
	O1/KApyi6HK8fs96+K1t98BcMggck1b1qCFxmpdJxpp2iT/nGOoO1gFALLWIQhdWSc2/3hVJzoA
	tKRZWFCk7GWdJbzcD5wGBkmpbLVzvkp+hqL260M4TvLKN76YBXGF0udh9DDv5bhYL
X-Gm-Gg: AeBDieuWOE7wwUwqJ3F2x8NTa5TjYWtLFZ8BcG0nwDbilKN5Ly15e0K6foOMS7GkAtK
	lCeE3fUNNj+0BNhuJVP3512yOg+RMvfXrGpT4OjwX7IQBKexS4Q6i9trYn2Ap3ZIDI3Lk9jumAr
	C4gbau+Cgqkl6mN+0NXpwxKv9ODqz/x1zKPtKVZmS0rW4x0Lqm2KaGjOFq2clSwpkFKgb1AhZe/
	RdCtlv0sRRzlSj/zc6mf1yAofRhNYvW0rq5yzv0KGmXIblfNfK9hfRcm4RCXIJgU4Xu+sMnAsCD
	Gx7nG/5QxsSdvSIBgWFhIg3F24XHF5fCN+VWqvj5N/re2iEMai4zPHw3zmYJ5CtKKuDs1T2XMbd
	ijCbA8hgrWASbjvU/VYzg+VV4fE9OnomAn9O6a/z3XRXjZyhRXqCIyTviv1QtwwPkxihkBE6Ntw
	EgM+Qtdl7u+NVOmjnn7U71pRcN6RPIRWXGRXBk62rGph1zXA==
X-Received: by 2002:a05:622a:11d5:b0:50f:b732:202c with SMTP id d75a77b69052e-50fb73225a9mr67301381cf.19.1776822574137;
        Tue, 21 Apr 2026 18:49:34 -0700 (PDT)
X-Received: by 2002:a05:622a:11d5:b0:50f:b732:202c with SMTP id d75a77b69052e-50fb73225a9mr67301061cf.19.1776822573662;
        Tue, 21 Apr 2026 18:49:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc25csm4072345e87.26.2026.04.21.18.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:49:32 -0700 (PDT)
Date: Wed, 22 Apr 2026 04:49:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: contact@alex-min.fr
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 7/8] ARM: dts: qcom: pm8921: Add USB ID extcon
Message-ID: <7cbmtdsq7iz54fkxckyfqgpkcz3yweg4rrfvo53vyxmraqj4kl@yrioxjdcxu6i>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-7-bcb0857724de@alex-min.fr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-mainline-send-v1-sending-v1-7-bcb0857724de@alex-min.fr>
X-Proofpoint-ORIG-GUID: 2HnF2OJ-CWqmuX0p1mdRXHaBp3uvxUAn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxNSBTYWx0ZWRfX2UpQ7NXdD/qQ
 suXZoEQ14E1ukFbeWQKOLmSWQ/cDqu74oWOeXqGfGL2QajMhxZ5DaCOVNBMlfXlbf3XPurQbJAN
 EHW6F+ZN+u7iJonzgtY6Cb7Z6kSIE1OfMowX+Vrs4Ekfj70fSmOkhSIQU5K5gVMxaey7D3wq+KH
 72jk62gwifQ76qSmTlSkn2NmgzFq08FsqhKF+rcYI/uf8Qs1HHzrlxDu+XKSz1va+uo7vlYDU/X
 IHr/a9wuyCVB8lmrmpQmbZ38LyUlxRE8Zhs6pAz371GRp4tND7ucdpeLpsM6x0DXWQx7U4a0Xbq
 Lprrh6o6XzG2Us9o/nTakz1aAmkaYjjzLjoaXfJ4GswfT1KoEuzrk4J7ot/AAnfGNHdz72/RCvq
 ZUdNlZf2smPK+3I5R3YxUr17JxkpKvfI/lBtUaB4siuydnpWAQm3lsSLNQE2lr6FmpvgLlJXRGv
 M+bXQNdQW0mFIdQwEhQ==
X-Authority-Analysis: v=2.4 cv=WKJPmHsR c=1 sm=1 tr=0 ts=69e82930 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=0w_FVvD09BqdKzzQVHwA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 2HnF2OJ-CWqmuX0p1mdRXHaBp3uvxUAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220015

On Tue, Apr 21, 2026 at 11:45:13AM +0200, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Add the PM8921 USB ID interrupt as a disabled extcon provider. Boards
> can enable it when their USB controller consumes the PMIC USB ID state
> for OTG role detection.
> 
> The interrupt corresponds to PM8921 USB_ID_IN, block 6 bit 1.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  arch/arm/boot/dts/qcom/pm8921.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
> index 535cb6a2543f..935383d6a594 100644
> --- a/arch/arm/boot/dts/qcom/pm8921.dtsi
> +++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
> @@ -41,6 +41,13 @@ rtc@11d {
>  			allow-set-time;
>  		};
>  
> +		usb_id: usb-detect {

Let's see if we can find register info... Anyway, if there is no reg, it
should be placed either before or after all the other nodes (to keep the
sort order).

> +			compatible = "qcom,pm8921-misc";
> +			interrupt-names = "usb_id";
> +			interrupts-extended = <&pm8921 49 IRQ_TYPE_EDGE_BOTH>;
> +			status = "disabled";
> +		};
> +
>  		pm8921_keypad: keypad@148 {
>  			compatible = "qcom,pm8921-keypad";
>  			reg = <0x148>;
> 
> -- 
> 2.43.0
> 
> 

-- 
With best wishes
Dmitry
