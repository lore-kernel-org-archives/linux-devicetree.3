Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651663043C8
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 20:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779048557; cv=none; b=l1p0RM+7L3OIdBnR4IitXacadVD9EGlV539SNNP2qp6HTsljrNKUuiVwdfxIf3rqI5TynHDEKaSUh5qYjkO9T4azZ1RTY48hzp4ulI16IU6pHJ16WL7kE4p7f+Ngs2RPTQYIHBPftGdpNCLy6N+pFs+r3+bmx2idZ+H0g5LjHZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779048557; c=relaxed/simple;
	bh=i9gGQrBw8v0uvLDFMNri/IPMVmw/afxZ89giSkJ3hUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4vqmJITeTkN8mqb3KLoKkt1DmgjV3oaD2oxckLM2A2ao+WEx5tWWkX5vJsppq9TKHXA09iVsyCb22K/IChWZ5hNS48Rx5dwU3dPJNYleHF/5KOvOi5+KWbrfk+xe/wwZZrDmTKoWHAhMoOz7TveqOpiPOVmK++TmdMqBuRzLVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f6id0z7K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QzL5hEqg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f6id0z7K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QzL5hEqg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H9SUJP3624334
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 20:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hu1EtnfuPuyZsalbXIEwU6Sg
	KVDqPybT0/jZrzd+yqo=; b=f6id0z7KZGH3WkQPvazB7wd+5zTpVArx8O1+9WXk
	sWySwj2F4MqGnH2ul3ouDVMqqh6gNoxCs/pwXNC5OOFvOTFyjWaLoMeGJPCQN9DD
	ceoQOX0tviM6RnhNZJdZO9ZsxI1DDTA6rsPcTuUN/8qVjJXbY63gDTsWjh+xqzQC
	4yEetI+yr026lerXb314VaMHpShyDmdzX1JltSedfjTnIXXkPb5+uEh3Jmjklrj3
	5s+cGQenGba+Zhrmse0IZ4vvL5ROvZyA12xQ0sOtnbJUNjzHvJhQLbfCitSSraqi
	1LOXm7S2RZB2gYQEToxa6VenKDlGM1tu3x2wCRkZt4C6bQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gy53j1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 20:09:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8e8c47a3so51360131cf.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 13:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779048555; x=1779653355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hu1EtnfuPuyZsalbXIEwU6SgKVDqPybT0/jZrzd+yqo=;
        b=QzL5hEqgFZTm0ti0lTKnsU2GaRNCe/x9W5Mn3FAitpw5co9GWpRPBMFIKy+G6SpiK/
         QI5DibGKrR4cJT1KE7LixoymjlbnbqYtDqnXeU/BE+Nhf5cbP9B7tX7qPO2BXcNyAJMM
         Ie7rV02RuLkdsql2d7M4/dWnMcrZB2IKzXk6vV8Oseldvf5woxJOyLuu9xIfjEfvUtxc
         fInX+heJGRpRweBPjeZLe7YaylThpM6ngdI3Epo3yQx4xwgTJ5LZmTb9fpvpZ0nop0oY
         byr7POqQRYexD0ilwmIyQPPCOtOGhjOfgfBnCWvOA2LS3bp2x3SVhxTgtmoqfIw27WGf
         ZrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779048555; x=1779653355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hu1EtnfuPuyZsalbXIEwU6SgKVDqPybT0/jZrzd+yqo=;
        b=HxkjlpJ2VZjHuPKO5tEy8+oQkTv65tz2pnMmIdV0I6kyILn4AAM5jrgYY4ve7eMxrU
         arhXWrD+F4qYWhaAW1zAEBMPGgREql6wOs52jE02eChQ4384gR/JkWpkxw9gKLsUSxnH
         5omqXT4MeexhfnLrtXDgMDI14VBeJzeuVLPbP0v00OOYO/WUAVzk+mCXOOuIz2saNRQ4
         r/4zLevvn08mir3dsSQIXPb9KZ1a9uEVsmMK2ev0oirqfyr7MpfetXkg9byVZEIzFnfx
         iB4nzLLeP+WmXiIKaFuwvtJ4A8sDojpmcYDvd/90ysbPvmiSAEgk8OAlMRTGwxP+ptmR
         d3lg==
X-Forwarded-Encrypted: i=1; AFNElJ+hY01zJ5F9i67qh2VYmkS2sLJlnjlOq5t7k1CAXnXvSIiUiBti7CMDuQQFqYpbnOLzDW+ekw0s6joh@vger.kernel.org
X-Gm-Message-State: AOJu0YyzdKdSAddkVeu2nJ01MYUzSZUVeSH0oD05tTluPKz5VRMLm4ZA
	I0Upj42S8PyA4LqNfC7oJV8nRGmv0wO0d332Yy0XsAPdvm3Iem8cUMDYrkT06Ivfh2bUmttqTGT
	ohLeW3QIOFZvx1ue1yE06qd4ZQiPQz8qAAp9V4gR3eO+Fd1uXNi2tRHyZlxDHsh3T
X-Gm-Gg: Acq92OE0LQRT4q2XbTtskCVCoBT5gkwt6MXQ9KbAfZp3C7rcWo+2Wss9UtdTBAzhV6I
	LO+D4SnhcbpD/SX3ilSQFtAyPmcs0Ag3538H7on5HsMDrUxLzpZnif6kGF/V+z6I1ZFHLNhvo4f
	yaYr83u6B9CTE4j9BuONKnQyTiGqWjXTMIAtbEHturSVdO5eDfnFwa5C2lL7gjoNogDWVLQyeFX
	djGy/0/4eEVRD7OgBnaf94vRcFMDuixEAGDIk40FWA5eff5AnZEGghLqqEju+vzCjKKM+bXC9GL
	7Hk2kdfslTI2Fz06Z49Y0Lpy4RXJX0o3cSi22oJswBqDOjDxTc2DlqRzT8U+fY6dGuM+1TZdatZ
	0ohMYBghr4rYnnCramUflBnfO2U3FlCN5U9aOI1a4tgn3+0PIvLJSsbIxnPbgaQdWtrD7GjNATZ
	gOeTQ3/SBUtw6X7g9aWIiJFP/9ol+ZHjJMAEc=
X-Received: by 2002:a05:622a:4a:b0:510:12d0:3d80 with SMTP id d75a77b69052e-51659fd7d56mr193596721cf.12.1779048554753;
        Sun, 17 May 2026 13:09:14 -0700 (PDT)
X-Received: by 2002:a05:622a:4a:b0:510:12d0:3d80 with SMTP id d75a77b69052e-51659fd7d56mr193596391cf.12.1779048554324;
        Sun, 17 May 2026 13:09:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164ccd7dsm2895550e87.67.2026.05.17.13.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 13:09:12 -0700 (PDT)
Date: Sun, 17 May 2026 23:09:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: phy: qcom,qusb2: Document ipq5210
 compatible
Message-ID: <uoi2732geiiyocjkftdyf23hmbgsm4r5aroudoc24ja4xios5e@fwpmhz3p6rnu>
References: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
 <20260515-usb2phy-v1-1-5f8338d466bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-usb2phy-v1-1-5f8338d466bf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wusb99fv c=1 sm=1 tr=0 ts=6a0a206b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=11pfgTztydWGfUAPEyoA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: -MozYwtb5NBvanNr8YjqdSw1nYdurWEl
X-Proofpoint-ORIG-GUID: -MozYwtb5NBvanNr8YjqdSw1nYdurWEl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIxNyBTYWx0ZWRfXyY6AwRpgjAfz
 2N5u2cV+dT98tEITm+R9Y7KgjpFjvpcybljY+4jxzjhB5M0OoHe/rRUHcLQikeJSZxod3ao7IJ0
 AF7Y25lAPmVNVom7pWHIyS8u0DqlSCnbTbvB8hAbzfGa+8XJLwu6MDDXNT3Wd5ugWF20gfELR/P
 lvrw1tK6HWJ3MEjLJdgQsFDez9rwtwooLHiiHQNmQ/WJr0Y8rgkc4a/94pA5HNqISf+oDVhOeab
 WTLaTdp5i81p3V5wnMV1T7e4X2SDxHQUslD60MJcBExdNqWHALZ4syFeH1o9FqvjVYzF5fzlEmW
 7BkBj4eaS6CdtKYT8cDQtrab3YMt+xJx9HbMVXkbR9qIJ/+/Lu3TwwUvKaxBYnIwHJSIrflcHeX
 Ylk0PJA99sqRb7EHIR8oiqX/ApeuyunvlEMoiGfSna34zuJXQMjo8SWpOjKxmP8L6YX87oQCZ04
 ylSOh7hDmnQ/7Iayb7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170217

On Fri, May 15, 2026 at 04:17:42PM +0530, Varadarajan Narayanan wrote:
> Document the compatible string used for the qusb2 phy in ipq5210.

Tell us something that isn't a part of the patch. Why do we need a
separate compatible for IPQ5210? Is it compatible with any other
platform?

> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> index 39851ba9de43..509cadd31adf 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> @@ -18,6 +18,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - qcom,ipq5210-qusb2-phy
>                - qcom,ipq5424-qusb2-phy
>                - qcom,ipq6018-qusb2-phy
>                - qcom,ipq8074-qusb2-phy
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
