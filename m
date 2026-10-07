Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7875B3D9DD6
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 07:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791357128; cv=none; b=IQDTYbj1tqZ/yvF2Uejukb9SQwhIIUwRwS1pfaM+xMaVovF/Vbe2gF5JI/ljvT89xg8gCF7CKQqqAhzh8SUjYmL4IMGjiTtrflOjh4pRd0D/j2MBQ8zt7ITni8d5BAPCpb/B0nXGG/1hZrh7gJy5UeHr6ZV36VyiJYinPAjbrBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791357128; c=relaxed/simple;
	bh=qfIGU5Nv0gjACCKSPLGWnaMvD/NktpDCP2N4rY9QGv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YWg7yUecVRkjcIeO4uIIZMZt3inyIVi8JmzNdILn6IgW5KwU+XQc0cBL1OowrhsIBrIp8scbqi2NvIRaYgaIo7mkCjbO9Pc3eAud+adHpEe8i7Iei4vLiQexreGgkxnhPO/Mar/69vawU9yVU3PBl5c4bO6/UTTPkW4rT1b3J+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IP25/w94; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y4FuEBdX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IP25/w94";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y4FuEBdX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69776U0x3213245
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 07:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3GX4DX9WHgkoCjexscTyxRsp0Y9v+fPY3Ro9VgKRBTc=; b=IP25/w94e84gY3+7
	bAA0FSOYhxfaZT80uGMtUqAm36yFYmE6tYipp3D8zrmSAUXrpx4enx1uJI6qg1ta
	hJW+JeVpJtgLdGFpVpnT+T/OBUz08P9h4fZkSD6xvd+vKAoNtL3WCgnsgEQn44fT
	2WSB5a5sYOEDR+672T9xJPdddEmgsLlpPaUtJtS5fbw1O/j0Ipjaepdk5D5IIu/Y
	TeP0BxnW2O3TN+na6G0Or2m9oO+sWABZXpsre+Hsum7UAJhp+c1dYqux2BzgoL91
	PUIbC2n7JRwpANKNrCGRH9calDqkNfaizDud28fIJ0335JXW1t/CciCxW3xT5Fwr
	wh1i7g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcr0hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 07:12:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so7089244a91.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 00:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791357125; x=1791961925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GX4DX9WHgkoCjexscTyxRsp0Y9v+fPY3Ro9VgKRBTc=;
        b=Y4FuEBdX9SpPckmQ3YhqoCCr8/rT/X42woqrjrhAGvO2AU1WY0XtrkFW1vf+hyr9Vm
         VGOOORal0ftD0ziomNVNfJ8N4g9vsM0sSkbdLsvb0rVK1SAtR3VVzbdCQjLepC18XGXu
         ZmVggzi0d/E+4qclYdT8eAhRBfffadYUH8j1CqGz2AX1oJCkqi6jZgF7ZvYOwPbzRH07
         qIvwNLaCadOVszCi+9NxJYaieOoNvF6r18fTpaWFSnL6CihSGtBMW0Kg/NIitmBYDyJw
         wSC7piQ4Av1aDoCSkd7aFI2Omdw/H1HhqtEZGvhKCDTYa7MlcSPNScAa7gZZaYCkt6vY
         yQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791357125; x=1791961925;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GX4DX9WHgkoCjexscTyxRsp0Y9v+fPY3Ro9VgKRBTc=;
        b=kiYW4dPQ1YvPCJOSkanxWQvDyJJat7Qwu4x4g2G8Cg8Sl5sljoNNsrEALantkbh5iO
         UHqS8DLhAxGjqVo+4F3nQmcdAtum/2UA+gkh9ClfIKMwE0KxBogMa2TSz6ftYxbZMlaH
         h1LuMBaRwbX60SzyS3VDx/oAkOoC2Zd+wKIxlxvK8py0vpG10DGflujEBqCjuWV0f1TW
         bE5YgH7JU/NdW9afdCHW/luIHdZ6TX4tj8VEX45PqHJOUTR5JApMaCNOpAztWf9wPP8d
         tpJ3MYPSjrLpXwMavWKGBgm8a5pj1rNVyMoKmSqRDYtip1HJF0abjhaHPFM+but2odRX
         KG9w==
X-Forwarded-Encrypted: i=1; AKwUvBwwiPzfpj34HT6Pq0zJK7J0kKojNxICsXczmVgCSBR+CPJFgUWm5FtIkzN+e8ghFkk/BpQPho87g+Iw@vger.kernel.org
X-Gm-Message-State: AFq9FYL4ekiC4614oiiyBcssWTDs4QfbKVeh1QSWVd1vlVjRK4XJVfWp
	i6FZmfnKkAuUTnI+SYR106pwxosnnDA1dyINBRZ8P3xegoNyo1bnwZJKJjST3POi3CQfLyPT8wf
	t2LVIl21WSSux/ziZZw84LCSWWez5UG5Vh0RQxCXLhZS/WGmHsgupXh716WgD+UuY
X-Gm-Gg: AYBFou0spIpk9Am0Re0qJqYZy4pseRsTqI1AAxeadcQQEAPXRDVvryWv13FWSKyyYkw
	9o0k8pJ15L1WRojgir99iQb+Fyiw11DvYrgUsAumWkTc6O2LNyN2HwFJWM0G/Xguh6MJxMmMJYF
	ov4rV1dseP9PxO4C4UBSoj5GACv1s3Kq3qidDkNM8LVY/IyoACkNQ2NEAYaoIVbkS4utK4ilesz
	UPF7Fz3gG+jtahcs8X1Dg+iRhLMxuZtGPs+2nlm5DpJ2fx86mgG4KVt6hoSFY4hzQ5op2MvgzVF
	rI4BbHLLZeuFZr3DsR6BW3HHuWsucp9kH3l4nBIWaE2N/0BE0BFg5wnBV0BgKTWjJ1O6Oe3U8RZ
	UFfSpJZKw2JPzS1vaVuNFRfjJzXLEpIVqFIaUCXpxAHxOHNIFUX3aR/xMud2VSpF78dPzaJ3SAw
	SYDJaUuI1Mnhux95fKrqerIGgHfWQ=
X-Received: by 2002:a17:90b:3809:b0:3a7:8350:3faf with SMTP id 98e67ed59e1d1-3a8a17f850emr1227705a91.18.1791357125324;
        Wed, 07 Oct 2026 00:12:05 -0700 (PDT)
X-Received: by 2002:a17:90b:3809:b0:3a7:8350:3faf with SMTP id 98e67ed59e1d1-3a8a17f850emr1227675a91.18.1791357124810;
        Wed, 07 Oct 2026 00:12:04 -0700 (PDT)
Received: from [10.79.117.106] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a897a22610sm3843683a91.0.2026.10.07.00.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 00:12:04 -0700 (PDT)
Message-ID: <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:41:55 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vZnSq0syxWIGSPGEy9gn-oeuVf4xnRxX
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac5f0c6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=yMhMjlubAAAA:8 a=EUspDBNiAAAA:8 a=jx5OK0JlhDPw0se3NWkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfX/8wc5L6J+4PL
 3kOU6Jb0uL46f05hQows0F1G6VNwTSamNDdJg2E9F4NYioZe20NMQQ3qFWwC6eOf77UmvBdUsUP
 x8V8NVlOK5ubVJT/E5NMTo/BWgIpd3g=
X-Proofpoint-ORIG-GUID: vZnSq0syxWIGSPGEy9gn-oeuVf4xnRxX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfXybCjwf1KTVBG
 Cw/8xyzcHXCVDi64ZQHDFWIsn7gpEbWGcWA+1j+TUUyVzmhVr9PRSI+Has3FRgYuXGISWA+2wwn
 QdOyyV1l48kS0FmE9PzZnImUswfUxeV3JaDgeUoZWiUGMRAptf2sP3izAeD8gXmVxXtSaDHFnan
 moFb638Q9PmYrD7OovhdiDsX0yOk814UkDfAxgEuSHUiN6J/zMGtOUpjae4ziDzPJG9ezoggS+U
 L3g3j7rPEBvAlQY/s0Zx5PG4dOS2LVzKzYi/OMGOcBSH8aFsjSKJCvskNnRfFPjM88oLlfAH+bl
 vYqRghUOpHKyO3L9tZc1FVSK2mkirwwyMW+3OfCzs1yvQjyNB72doOL3zjlMzrIy/06gAtxIITS
 HYYfn4ovsZq/IW/tlbtNs4lROtoPawzq2uv3Sy5Ucm9k+Gu1L2OVoXrDI3J+P3Jc9n7unktfX7m
 C0dmCH3G/S6Wl4pD0eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070028



On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 121ca557ce1e..eecc00e2a718 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -191,6 +191,7 @@ properties:
>   
>         - items:
>             - enum:
> +              - microsoft,surface-laptop-8-13in
>                 - qcom,mahua-crd
>             - const: qcom,mahua
>   



Hi Krzysztof, Konrad,

Before review, I'd appreciate your input on the naming.

Surface Laptop 8th Edition comes in three sizes [1]:

   - 13 inch:   Snapdragon X2 Plus (6-core), UFS storage
   - 13.8 inch: Snapdragon X2 Plus / X2 Elite (Mahua), NVMe
   - 15 inch:   Snapdragon X2 Plus / X2 Elite

This series adds the 13.8 inch model only. I named it
"microsoft,surface-laptop-8-13in" (mahua-microsoft-surface
-laptop-8-13in.dts), but that clashes with the real 13 inch model, which 
is a different board (UFS instead of NVMe) and will need its own DTS.

I couldn't find a codename for these, so I can't follow the Laptop 7
scheme (romulus13/15). Could you please suggest the naming you'd prefer
for the compatible and DTS file name? I'll update it in v2.

[1] https://www.microsoft.com/en-in/surface/devices/surface-laptop

Thanks,
Gopikrishna
