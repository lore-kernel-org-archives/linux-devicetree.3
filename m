Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DBE3DA7F3
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541917; cv=none; b=meoLmlIG7JolA3UoRoTvsHAxD4unA1Bgm8P4WwCZX6yUzV5HbgfHrmbBRwpxnuxNpZKHEICYasI74NPD2XMkwHjEb+NUvb5Fs/QGcjKv+l7PSENLGuKZ0wqgOe82iI9PNccl6duLKfwfvoZ2xP0vHWo+dZu+5giEZ4SiZ9LYjn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541917; c=relaxed/simple;
	bh=EXKzX4auN7KbUG+4b/TU1NgR6KJj8OaFiXl704YPn4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1SA3LfcWECs3vqq4OYaggsmbyN99KQwK1MmPQ94bzcg9laxIt5/cafCPgwUwNxdJn9owVA8C8VYLmo6BDQRs+iVMOyz/HyXfkUXNif1zT5ThrNuhwIUvYQwBvFCpMMMYmhD8dotHqk8kG+9fAc01iQ7KQsHBHTwajwjpTJ8Xdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxx75qI7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CVe6HraR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxx75qI7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CVe6HraR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vbFF2139883
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cyGj4iSz8dg6Y4WZohMUfDMKW+MFsoJuC37oF6DP46k=; b=cxx75qI7pMirYbMs
	VHg8XFripNBKxH4gHzTdnk4XkxZkLLffFo8v6JEAdklj5NRK3r6HJiaQFm6nixy9
	+oqyxtSmK569thtVbUuG0+eHY5uCETLEqcFUs9A0D5xMO1LX5fhPqlU+44MSiBeI
	fKeiAHkWq/2GcWsN8mw8lLlzR7+nzWwbzQKjROTK7X6+9Sty7EbfwWn92Q3TiCAZ
	/qJdjL9qnjZictcRe/QNSbAazRj84XVNVZP/qqTFHqqhfHvMVlwF4dLugcydqJ5x
	ERQeU8DcNA5GoTC8e5ZdVHjc9adhXJfVS3w3U7YtHO90ChbXM7RG0VP5zAywpjAj
	PzpZZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0c0s8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:05:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ef7c6e9b4so150390385a.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784541912; x=1785146712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyGj4iSz8dg6Y4WZohMUfDMKW+MFsoJuC37oF6DP46k=;
        b=CVe6HraRq7ULuRT/roQv2ZnazgkXhHXpr8Vmb27wl2qchLS7dns6BX8S+dOhfSohz+
         HmQQwNqDwpunT7QgEDcYmXArFVUw2J+EbTmPVfmiGZNyU7/S4wyFvPdNHAg47G6DLUHU
         rS07BJZPeaBrKrzGehSIwt7HE4ntj+L94oUF6DGfwjgP/L+VEy8TNODoWxaIy8nreuq0
         p12aoLQQ0UYq00o53n0K7fbo1aD3/XNIMjMmb/cVDf8UZR6ZEIm+QguC3UsZ4Ycs8IXh
         vMo76Q5QsAKfywj4AwedXzBmwh5f5Wsfa+mNzQg12yka0GXpbKELp9H/jjqh2tW22SYx
         qk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784541912; x=1785146712;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyGj4iSz8dg6Y4WZohMUfDMKW+MFsoJuC37oF6DP46k=;
        b=NTmHhzsm6U/7Jyv0d2g9jhFIVBWT9weFiD+KkTVJ7ypojz8v+MXgIb9FERPYoMFakB
         xGYvYJxumObI/b+s1ssXgjzjLJklG9UDU3ZvZX+lohDr91Nq6EJEOuQiwfXa+oOdT4X7
         sPoGjujgslVcvnS7xpTGg1K5X40QG+SXMUCkR458VFH/rPj7ieJiO+g1uwNLN3NR7w4I
         cqBvNOG5bXE2HLdvNvlOkCP/1lPNtHadzxe2jw80QPICPeiLln8/VutEW/3fu6/Zm2jS
         MOTcTfLHC7h8bBm+HvHao4DsudhogKRFinaQoZdSTS9qo5SVZnrJQPA+bRSdzcTK5JGG
         jKqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIgpfCftPrZrXVgDhNcLlvDSM1aQapFIs0lRvdbDz/WVsm1wb4X6gDMNZCFUyFDJYx/0IAAhA2Lf+4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6QIiM6O+xmoxdWLgOtb7v1HEZaLjNYz+SEjgupiG1oR2/P6xk
	GG8GWtUgXUN6ZTZhXdl2TOUVdtZ9qkHQZo0L/N4qCHsZ0NaWGlkSURNz9NGpJTtDsUz+cDRD9t3
	TLLUUtqY52YoHZiG/hQaTElkaYOyJF8Hihmlq47hvAzb/gRqlmAPl/iJ1I1CZ42/P
X-Gm-Gg: AfdE7cnT47aF1zFHV3rbMM08jaVzn5vAzUvKTzB7im1xpmyPHrmGyLEddiyp9/BfH6t
	LHj+Yxwe7bzYlcJKYIgqisraMzD89y6yX4I7xI6wWHe6PVDdlKmlRgqbtvzcCgx8IUKZXRw8Lco
	1J1civ42WE1MyYD3wk4/mE/xE0wqnMzJIVjylahSTazFUGv6Iutt7qyx47y/N+9yGtiCVLh4RNz
	uWzqCuUubZ52RPAqdhUcbb7R1mODqvbpt7KlDxfb+r/BdVxv2Y04VBjoGtyAw2OTThiCP3kiA5T
	voyKNjJHUkfgBBLJN/O65jmiHwrmmtn0fUhLrij+u+tJj2GBdyA5NqHpVxT7UWM+B/2svg8E5k6
	amhLYRE35T/7zAd8mMSyam8C6
X-Received: by 2002:a05:620a:390a:b0:92e:705f:1626 with SMTP id af79cd13be357-930b41e4811mr1167530285a.6.1784541911690;
        Mon, 20 Jul 2026 03:05:11 -0700 (PDT)
X-Received: by 2002:a05:620a:390a:b0:92e:705f:1626 with SMTP id af79cd13be357-930b41e4811mr1167527585a.6.1784541911295;
        Mon, 20 Jul 2026 03:05:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16eb80bbf8sm440292066b.0.2026.07.20.03.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 03:05:10 -0700 (PDT)
Message-ID: <98b7d242-95e0-417c-a9cb-74aec76dcf0f@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 12:05:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: Add slim nodes
To: XiaoYeZi <qaz6750@qq.com>, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <tencent_DF2E181B86AC588DD7B70DE904F6670BC207@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_DF2E181B86AC588DD7B70DE904F6670BC207@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HeYkiCE8 c=1 sm=1 tr=0 ts=6a5df2d8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=S4-uF_5N94cv6VFABswA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: TfpNpVnGoeYfYXs2DGRAonjW8gOMWrAE
X-Proofpoint-ORIG-GUID: TfpNpVnGoeYfYXs2DGRAonjW8gOMWrAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDExMiBTYWx0ZWRfX7sKID0mydKe6
 Wq7G8VonVESK1062Bk+55uJ+H7ytls6uZ6LgXFFVjXsbtoojCt7W0FjIeIoHMg03u9DuUSVSezy
 JqP/jzJWSY1PMNqNMukCi49TlsMxztc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDExMiBTYWx0ZWRfX5e/v4zhO3rpD
 KcYpjwpebwIIdoZmMHf90PEeGQcFmJ1Bk+nbxJrcSRcx035rtdVW95kOr2YA9UzISPBVvGx5pVd
 JQR/ZhjVxVIR7QsEXOBGvCzgJ8Q9r2yEGIom3bDPUpAqPnLbn/OtPS2drf9ZUT2NAY7Mv/L2MKi
 GifBrAtVwz6oOJyCGVIu4wrB6k/OLPeR4ropuGDP+6V3ONe+ywlKKr51TFSCc9jsIXqoFXLvXfj
 8DDjLEE+Oqhfi6OMBbtuppoaD4Fk8/HH4X1ksi308OyHF6or2SGa4H/L1MWRd0lgDM/qakDmN0o
 hnmljC8vjgh3eFpStTt3dPYEe6gFcHI8SvpAIBoc3mmSyovQZu+MFHvvDTbXcDNrpt7PE7LzJlh
 q0BZyFvpp9OT4PaAFqPx0Lbu74pTPicx8lUVAzFmnGLLuE+RXvR51tTeONLgRl//BfxlCslHCRW
 mFhxhR8pOxhs2vCO0OA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200112

On 7/20/26 11:33 AM, XiaoYeZi wrote:
> The slimbus node is an important node in audio.

That is true, but this is not a great commit message. Please
check out:

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

[...]

> +		slimbam: dma-controller@17184000 {
> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> +			qcom,controlled-remotely;
> +			reg = <0 0x17184000 0 0x2c000>;
> +			num-channels = <31>;
> +			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			qcom,ee = <1>;
> +			qcom,num-ees = <2>;
> +			iommus = <&apps_smmu 0x1b46 0x0>;

Please assign the iommus values as the downstream kernel does, so
that all SIDs meant for the OS are assigned

Konrad
