Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC93E3A0B2B
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352653; cv=none; b=Qf/vUk5ID3RxLhjnKxmYUlDICXhmhPZG8fXMEiZOHZrIpsryNMDNL6vuxKW/sNpznW2mVBN7CI3PVznWdpiyCTdnN0Q95qU18a2+GRA87KEVf6Ucu1k3vtGpO5xOzML5JwPNrJp/bQbhJsbRGwP/Pe/vrARIM2FejR+BTyX/MP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352653; c=relaxed/simple;
	bh=OoDxQ6JnCdkvOIF3hQyinUzkThw8zBb3mtjvgZ2UdeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ImNZt+gOoIUi755Pc+rY7hzX7CtqvEjV3LwhLFaxpeS+NYcU9SwaGZtSlKCOFtGRft2XaSD3egi3kY2EzZvujTLe2CgOnrUfO4fXsZnIifkom8JCSmTtdvzY1pzpVSa+HP65+xQTHP238tuE+3pPD9fvacu5G3LJT+vLzLD9oIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cyiw650j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFa7woHw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cyiw650j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFa7woHw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8Z9eu1702363
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 15:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	alGNKkLw21+BrqlqmkPplSlaervhuZpi/jOw7KRz/LE=; b=Cyiw650jP1GvuZns
	XT2bm1qDSlwzCTgSyeUxpj0iSWM+xmATXjOEN2tq5YX6sDQvk3ccCsjWRhy7Jkxl
	dPo1WhG9TnHjt0o8vvLE42SY5m7WkyTaOnckdFWmfZLlYj24x4VJOuoWgi5UHWly
	NkXJactehdyih9M4G7hZOH0RImh4lJo5XvGSyEtkzShm6y5wX5Qq33Y/wmeKoHo3
	mEc96UxRtKC86B7yd8M9XLRwTpDCKbglUKXctifyp4/jj579uauva1oyzrtPrUbi
	EbSVnJLCkK8kSstuTyY8YTRbG/Y+aR6JsSyJoTKICn2cqkK3xNWTxtN/XmOJnjDg
	HrEuDQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdammcdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 15:17:24 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6826de8e284so1466149eaf.0
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 08:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776352644; x=1776957444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alGNKkLw21+BrqlqmkPplSlaervhuZpi/jOw7KRz/LE=;
        b=MFa7woHwYGxeFHnhCebOngApdmzxgicc4v3jXPQyhwoKayqhWL9ON7I09tiIukrjF1
         JlVC3rkno9sQFab03s4AlgpkCYlgifmTimdK6aemjSzk6XM3tTKPkBEv12eReJX7YzR/
         wRBP5tTxLVjxfZlde9M0d2VmWD2PNnWYfZI7kRtXOa2KanupoC+SZw1y7lKDtbqOvj6g
         ESZzI8hem6CBjRKdblXO/Hnw+syec1p3dvga4MVcFEfkqc2VvpFbuYtcgTH3YdmXOKnO
         beM1Qq3/toeTseRA17IY5M7Vcr33DJddBs09SV1ndI4zcnRsBAC0j8moexzM4yNw+sX9
         mbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352644; x=1776957444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alGNKkLw21+BrqlqmkPplSlaervhuZpi/jOw7KRz/LE=;
        b=YJP7UJ1wFqroyLxA8NuBR9XQn6J5AmuZJssDk/EXImkLS0r4tDDzvvXHTeyq+HqNu7
         mNtNxMX101GE3+5jGbb5L3TSS+KndvqrqG/3Ysui/afkDUdNM+AXRQOAz579rpM6f3XI
         68UAn+dIKpHfJanEZaPIyCTLqJMvYF2UrT3hjebLALHAvoJv8wAovXNxMa504nTNdE+E
         xJPlFSuLtGvQr2ESKO2oWQuYSCozETpm3Oufa8NCsURKLHyssZk5NpQX7s6mHqsd/JXz
         6vxgZIcW/Sfa/seeBzIf1CcB7kzqIm6ErmReqENyvPxZnfvCROfvsqzvGTx0QtxDEgK9
         4wIw==
X-Forwarded-Encrypted: i=1; AFNElJ8gjaNUMSlkLNGlMsT4R5Az0SQMVUjW4ux0gq/28er5Enm/AKfojqdF53cYLXtPsTKrYdZE0TcJJxxQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzrJKmubmsT0VA025rPhxGNo0Cz96ohS3M90Xt4v3V66EbV90Te
	a2oE1rRVNfXOWuS1kCp2P3A13NPcV4S+HjxaJvAgIXCMIVQh+duwHfdpshjDgDMRZDedOCU1sav
	XwPd9QWJHJyFzvL2UMYxGVS9qSLaL8JiFDI3VlLk7bushQcEHITmpjym2L+t1z0no
X-Gm-Gg: AeBDiesAtv8kfy9QJTEKWWTList7YDIA3wkMVafn82rfaJcUKi+diwnRG+0yDMbACU0
	5xgd4gmTQ02Uefgq+e4lkm3d5nLk6yIjaErM4P26LC0JoN4fbFvNEY6fm9hX/UlA6eDqtUBEzIG
	KiMLCNR842hDsxgC2y2MP+ai9Yo3nT+c5rSWkgczUqvBvEQWAfbd2/NqHyG8KIjJPE3uwkk4Z/u
	fY/yyy/g3kogFlBek94IS+ENVx0NB6DwKJ5eVfrOaxWQOzZPq6TvIwgXQ8fkDZztAZgmQTgTcsm
	ryPgJi0/+/uxGvCnP8mAr62uZEU9l9CxUT2y+U8XO9cmBUGwWUGAU/lZFFU1Xm6XUO1W5yHmVpf
	Y3S+F1Rjkmm4aK20MXIjrzEP75GVmb+poSFcINT5Soa0oJnkpBLFNxAxKnOUTAp+ACXmKkDF43m
	POdtNJlkSs559eMQ==
X-Received: by 2002:a05:6808:2225:b0:459:f0c5:781d with SMTP id 5614622812f47-4798903ba3dmr901501b6e.5.1776352644375;
        Thu, 16 Apr 2026 08:17:24 -0700 (PDT)
X-Received: by 2002:a05:6808:2225:b0:459:f0c5:781d with SMTP id 5614622812f47-4798903ba3dmr901486b6e.5.1776352643869;
        Thu, 16 Apr 2026 08:17:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba299f51c01sm93170766b.4.2026.04.16.08.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:17:22 -0700 (PDT)
Message-ID: <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:17:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Vjc199k7Ynm7EqaBlKVOmV87t_8c7hWB
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e0fd85 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=sGea1UAM9DjOSmaL17QA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: Vjc199k7Ynm7EqaBlKVOmV87t_8c7hWB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE0NCBTYWx0ZWRfX6zhAlyGg29M3
 CzrxwpOmDNVgP2xnJSDXr4i5kic5oUOgjiXX0To3aUTHupQJ4dDfkrJUKFSuFLNdN3gmMvxg2K/
 Y57A2zW89cqUyZIjhqgpagQBx5uVL+UHY/k7+c+eIQDKDAEy8H5d1MW0n5D/iS5/emGBXnqXHqW
 3YRBnrG7UJAj2ogGl3M8mu4YyGUXqi+PKbbzNx7uFDLKnU6XtjdVj2k/pW6sH66R0WKbdbYHIr6
 N4jQwS1RQctQ3+8UFbiwiaXoGeEh3hS+unEfZ81hNC33bW2ou7SRb1SmM6c+Ed/t+BBdvs+0SYj
 ceVN/JBZSDhwXRNTizsIst45OgF0YMK+dphVH1WEZ/jbbAY2a3EhY8f/qRadQwYOPFfqLd/MFmT
 ngxUmkIX822vtAJKoZJNWXy8wuQWAraCHUbhjSme4Zo8rxubtuVF+aoVtiieyvu1os3XpvHvz+o
 2NVp4YClD8NOkuHuRYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160144

On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> index 90e966242720..231a3e9c1929 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> @@ -267,6 +267,14 @@ &usb_hs_phy {
>  	extcon = <&usb_id>;
>  };
>  
> +&venus {
> +	status = "okay";

You need a firmware path here

Konrad
