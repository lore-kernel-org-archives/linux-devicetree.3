Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027742;
	b=aaKm4eDNLnN8y9mLBRoseJZ3qyCBFDV4dbJKntnvrnASC/XwLd6OVfUNJZBrFbBoYfkT
	 0G17s8zb2kI0s+2QYgh7u5Bh3to49r2p/uS4s50RLDfSo1qWg7tpf7osaDCn1aJZN/Ahr
	 Dn9QHkrLhGJou+tLcztXt0SIGd3Vo4O6paTiTH7WKY2AZG9vaosVjobuE2H55KPC4RPeK
	 xRZbURWCxe+TQyYnbCnbt3uDYI4D6d1pLIJ7i3wIeuZOP/qytztz0DnZelRw+HKASU3yn
	 1WlrKMJifNdf0LkDMTr0TlrZdPZRMLm5efoplztJdpK6Tux01vnVybz12svX1UKbzWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027742;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=egxOvCyQRMpJGS3A8wGpHQMhIYneT+BSYHrmgVI9nWw=;
	b=kH1B5J4E49klb8ole6XGboRm+xJeX5T7ICBmmmohlqINmqoopKlSka6xzQwnVCxorysG
	 iq+mSbDxSYmMX6Fd7DGhbiEvTQ0Ej6btSke3tl8BnFOBvhXB/vMhq9/TSp4eTpUFDqawG
	 UjY01/BkhjXtVSqgjEqb/xceVoQSUq/u6Up9klYtstUCOv6xxd/LOjtwpnhj2TPBVBKnT
	 Lfb/bBLui/xuOPTGDu1tMEgYqNT05aMpBjAZy/CqibywtWn+BiFUarK4KA79GIq649V8A
	 XyEtVDE8/69Dc14Xhbo9Fofa6GoVd5rg+8PoUsDx1QUeDYaBlNzwoGRdkJZ+2ok7cbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwsnPbGF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UpksIPmE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F238660A2600
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F238660A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwsnPbGF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UpksIPmE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGHJt401776
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	egxOvCyQRMpJGS3A8wGpHQMhIYneT+BSYHrmgVI9nWw=; b=iwsnPbGFYqKmaNAt
	DiGWZ1M01D/wvg6LFujZOApqG9JB7y/vmCHR531TUjmKMEc5aG+SYlIZMOxWjDRx
	97NiHqE5f0otAXE4iDSEWz5dBMmhDHPOQP4o9dvaMuA180YBbiOjNGuaV5OD/VlK
	Y6OuOvW5tQMCXlvsK+J6vqCDBClAAJITr8i3wSuSEZd96/k66O3PVYVuw30kMmjJ
	qJNucgABrbEfFbzrsdJNHKIRA2LE2fA8ZEGVd/0PF3kH8yMKltVMbGZlqz+pIbG2
	/3HB4bY/NKc3wJazMpV2dZq9mW4cg7DgeEfw4GPzwXW6UKefqXmaeJSEjKNysnz2
	yRmlpA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1e5qs2u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:49:01 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b53bfc9534so492164c88.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027741; x=1795632541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egxOvCyQRMpJGS3A8wGpHQMhIYneT+BSYHrmgVI9nWw=;
        b=UpksIPmEgohvSEKyhlp/y0zCwTDDxO2RplOwhNucYASbF5zbVvcA/EyK9dZXIgdxIO
         Xz7c2pv5zsCwH9QG//uHUVzm7Bo8PSoXoZpFv8Limqy0Fhc/w2EewQzMKxfQdYFqW6BJ
         c8JPwKaIUYJHBtU4ycI42Bm5P5r4/hzmcXAhjkt160icSP4F4J3yyTZqGbjVO5DezRve
         85RYaghDPvqV5SCrKcN796euTW1epuvbeBmKtwfLofEXFx/RctjfGsnKISgEQWymkazB
         qiSIvPu6IFzlDj+KzmRiO7X7t7qa9DQeTyO4KoB0ZRScmXpbkvG6dpy36D0OUbsuTZVY
         nV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027741; x=1795632541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=egxOvCyQRMpJGS3A8wGpHQMhIYneT+BSYHrmgVI9nWw=;
        b=E0RAf8tUmhgRvjpfe2srdRH8/9q4IYbDyj+bxahXJj42v3aNSQZszNyT42ysTI7+Xn
         7AzeNnVX/gyzYtLTWE0bKK7IcQBzqj8652S8VhCRh+y2UM9zT/5WnYj2j8y8KLKQ1zHW
         8VAYa8iLvNRmxgi7LeBzdojveNye/0RfxkaFTtYiTyTbsTl2AXXo0+7U634JwhjXdADL
         PMhPsABK1eM2cE7qtycoeM+Ywq0/G45QgJpXG4Rzd0Le+eCBx1mpYug+9W57QfegM6M3
         zn6KcvNWjKSJb/NmZkTxp53Sc/bEh4XBB+mM1HHT62Wlo3T7NCgYZUK5aIxv0odPbU4t
         4stQ==
X-Forwarded-Encrypted: i=1; AL+hErEK1f3WvRVYD514+go0B/L5YqiWPNYLBPklk7AMsvXOxlaq04i4QgtICrszvlWdrNOoheTix4Z13djA@vger.kernel.org
X-Gm-Message-State: APuU4Z/WAJqK6eo+WnLNmtswhAY8aHeCLzspvvFUfeSzQeOSvArGnJEX
	Gstam+b3OkTxf1J/YCyF1WEfGzeqhp6v7Q94xmaUrsb6/qBpBxSlUKw5euX2O/S9s4R/qRkHxlW
	4Fj87wpEBPR/5npn2Yw1EDn2TM1WUS9aeGta/a9nfLJmeUkBRyDwzNsLi+YCtjS5w
X-Gm-Gg: AYBFou3oEbq4mywHXemRXX1JMJFP8o+HJ7e5ykL9cyaiBUlYM5uAKOctY6u36qJ4lB/
	DxXs+CwHGXak87vZMH8NgScpLxftoti3kN/MdNdg/1Cmos4fpiRXet+WYQJF0oQpzcQ7xqGSInj
	8SEmqMHlsHQ5jrwiTj5QHCsRICOvq+mbiSjEgzboORF0t8+TC/hCHwot1UYn6zYD7Oe7+OI+gSd
	+QfjnguoAKn0cA6Lo4hN3UPvmcTCXAbpriEuz7POqK8DrT3pa2CjnRbrof/EYyj5PmXOc+783P3
	O3TIRHkdu9rthZJHxLzCn+sr7NDZyNQiaT0scL5Q204AvKF3Flo+fjXXrLrVS3cdXu1RE46tSjQ
	oM9vi1aygIwtIP9yGRk0dACy8pgPo0zmpyBWC2bK7LSdTSzMHI74Nl3Js1nYRtUrj4E4KCuPdng
	==
X-Received: by 2002:a05:701b:21d3:10b0:1b4:fa58:9d3 with SMTP id a92af1059eb24-1b543cebc62mr3198332c88.24.1795027740377;
        Wed, 18 Nov 2026 10:49:00 -0800 (PST)
X-Received: by 2002:a05:701b:21d3:10b0:1b4:fa58:9d3 with SMTP id a92af1059eb24-1b543cebc62mr3198301c88.24.1795027739680;
        Wed, 18 Nov 2026 10:48:59 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm11782234c88.13.2026.11.18.10.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:48:59 -0800 (PST)
Message-ID: <f38edf93-6df8-4771-8e89-c1d150ce3f71@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 00:18:50 +0530
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
Subject: Re: [PATCH 5/6] arm64: dts: qcom: nord: Describe the GPU CX SMMU
 aperture
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-5-e99cdbf3121d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-5-e99cdbf3121d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tVV-zAku9aOsVzuoonlC9a0jaVH2iA0T
X-Authority-Analysis: v=2.4 cv=c5Q+0h9l c=1 sm=1 tr=0 ts=6afdf31d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2DaYFnQSzUVrrlYHPwYA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX+e8GCouQu3tl
 ZuruAybveIG8wRx8vPCRSZZskUjl6VhDu1Dco5aFGmtYUa+Yqba+rWEU7tVAU5b5lAiF6OjLdPd
 t95fEWBP7h/H/bHibkjZnCSCeXAOXgw=
X-Proofpoint-GUID: tVV-zAku9aOsVzuoonlC9a0jaVH2iA0T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX4SDuoN2rnqwx
 lomatQRrjx/DOKuqZ5uShFZnc6hfx27EminWD6sA/445inYAlFN3ceUgU++RckyEqcy4dHYYRDL
 71w3NIk5tPgX8+v+Hlc0CAb0T9ZAO/Qbr9ZQ58fM9yMhYum+EzBVNVKhkNV5hQAiN24jqCM0D8n
 z0zumKhOqC3TJDbLxr9y+JtRGC3X9dUIQoXG1XJCjmdFOKzHcPFD6SeZ+OD5bdCil1G8dOvQiez
 UTc2kRsVEgk34X413enJ9bVli/vGVrWOUQ3iy8e35DrhCz6FBcI78WBFTUxzIjajkUN0sMEMCCX
 H4zJTk2ctoouVRbBbbu31hKrwhCLE45C8Ud3Gw8sGGsHkmp+y+sYPOvGgywYM7tvjnLsDMz2hXm
 qLqYT73rZ7DEads/APnAA9QwENqilCZwqeQBpjukyrqpRLsTt6dmfJrqjFUTIEbZiatUPdHNp0J
 qrnlsXL/nagpgv+Mlmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180074



On 11/18/2026 6:38 PM, Puranam V G Tejaswi wrote:
> Add the CX SMMU aperture register region to the A753 GPU node.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  arch/arm64/boot/dts/qcom/nord.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> index 3e29c43ca9ad..cb5ee6b68779 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -1717,10 +1717,12 @@ gpu_0: gpu@3d00000 {
>  			compatible = "qcom,adreno-43051701", "qcom,adreno";
>  			reg = <0x0 0x03d00000 0x0 0x40000>,
>  			      <0x0 0x03d9e000 0x0 0x2000>,
> -			      <0x0 0x03d61000 0x0 0x800>;
> +			      <0x0 0x03d61000 0x0 0x800>,
> +			      <0x0 0x03d60000 0x0 0x1000>;
>  			reg-names = "kgsl_3d0_reg_memory",
>  				    "cx_mem",
> -				    "cx_dbgc";
> +				    "cx_dbgc",
> +				    "aperture";
>  
>  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>  
> 

