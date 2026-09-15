Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A0E44330F
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455717; cv=none; b=UTTL1XngT7YsrXVbLhLkDHK3K1PoSlt/kzFkhgTWA6AALRDoovb7RXnRE/jsz27m/SOPjkZE7maxFtZuGCeVV2khCX/PAebGla224vcZJe8Lw+sw7J14OFZnuB+KjYQDCptjztTvbNMtBxq9/x4daWJRxB4Sy8IJSuAh8rUcTzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455717; c=relaxed/simple;
	bh=+zP74EUwfqLJku+R/YHT+I6lTJ6QtgwPF9wTSQuz75A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u60eMJCKqH+3DdOP6hUEq6RHSiQuNDPs1Vg5iPdT1FkJI3XojZfLqUAZLpPjvZ8E8IfFQwM/H2SbRxS1/lrPbV4EeR7IsR85nsS/UY6/DtUd9+brbWAFCvRaoK+fs42xOCBVQRyb/GPdrP12alcEWLB7uUFN4Z/oo4VZw63nyDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3cWBCtC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJblrKvq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3cWBCtC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJblrKvq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Zbpt3824006
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eMy2sOColB1dOhl4bj0aoB99cEXORXzDdawD2f/eQUY=; b=N3cWBCtCVkWqodZR
	rsCgybNW4+yWos31oK9qxEbVIFXtlL+gnvxLsRXf7fPrqdb++MzlMSfsLM7Tz/0q
	hRaWpQ5phZke5bkYqMw8haXK+zFpBT/WDbiFfuD6xzWpQxkebIbNaff8cKn6l16a
	+9yaExM/b6/FQCUoBBFrP3V16HXhO3DzcWimRbd0L8aDBuSbqI+TpmASGOeI96u8
	JQYXgDT+X48ntIrEIlA1k4/ly3M4kSKwRUjUsqSDqk+J74+Lk0PO5ncre8RW8Oy9
	noX+H8Q0bYG95ILorEJVnXT1tqcUEHMihY5MTZha9ghS5QsffVIKuZT8WP8rs2qv
	59hG/Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41txme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:01:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de1f85cb2so2241582a91.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 00:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789455715; x=1790060515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMy2sOColB1dOhl4bj0aoB99cEXORXzDdawD2f/eQUY=;
        b=fJblrKvq+MwlmaH0ivZU8mYfx9/LQvloLQ3QH3jTrv9/qj/tRIA3m7h92oEdqLiSFI
         vSU92Fjm1wNdFOdgYIiyEK1ZmW4h6aRBMwA9Hh6N1eRBlEs+R30iw9yjEMgkZ6kJz043
         E17SNpOFD4OB8eFDc4M71KiCaFQqUwdvvani6FAbVxZRyW/XPYQEz2/+1TcTQCAXTr65
         aKhu8iBodjBo3V4vf6Lp5aBHXsNHh+49jmsbEAYy21KqvDPqQS5JVEugLHFEb0UwJlx2
         Lxcq96SRRCSsiPC4Tmy1o/lKoOqrLsDeSPx5viDYxrZfg4K6fxy9/CgF2FkKHA4rzDfV
         RL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455715; x=1790060515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMy2sOColB1dOhl4bj0aoB99cEXORXzDdawD2f/eQUY=;
        b=OkY2wnR9k7reWjsQrT62DEElL2bbXpfli+ZXRzIv6RCmCo0Z/bjK11Z69rh4UJlAkp
         +GY2YOz401bx4WSkuBES46GI5dYCoWVuv4Pm9rOQ2CcgqDHBGIw0TjtH8Mg6Z7drudky
         LX+Rwr5TnOGotLjdwjSbDx9KxX4CRt3Jd17tfpI0IHhbK32WjfVZ6EMAZ+rOmmCEyXJH
         zPk86pAOcJ4eDd1oKmMU6RTOfwJUkBFuLyOXsZdMv+t1JztvoNK7dxWFjAR7Sy9UNPXq
         Iunf+NIHB6SbJ4dYf8ItSrYTCSyHvRhjXexRLYWPYqAZBVyUFdfM6ibatuafO7PxS+Id
         GNpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdKeSy1Kn4a6QjoUT55IYsNRef3vFVD7OTNRm5HbNhMkN2VV+FnZz5iNlATOkila5fOIjzZfdO4L/O@vger.kernel.org
X-Gm-Message-State: AFuF++m2bBau/c3i268NDCE5sSTgbqlpCHXNu3nRFVI4sAlQg8l6VHuv
	XduARDh5utF+MTCDnziqM+RxTqBr7Uns32vrFJQUbTjKIoOYSrRr60SOkfXFedy/BPLfo1KJ67t
	Xz5lFdgQE9aWk6i1FEvX9/i0edCHKu+sMwWEWY9281hwyQzq53EicW6bmKlI1i/vL
X-Gm-Gg: AYBFou3p3A0A4Ar+EcKgiW4JLPhVkcymcroQl1La6A71U1H4uXeBwor2Yx/LZYboPHI
	HNonG8q8xZReJJJmgcnaZMQZALudCwz56CA5wK+UkdrzEwrLs8KiJxwofNWmI4S6V8M/HO5V3Xe
	Yvi4NCDvIvY8SEIPyBnpcxgRb2BMDb+333gg3ow8B4+JSh4MAjg30NZW456n48g0dJmKkdsn9Dg
	tN7P/loSdJoh15VlFkdWp73REGqTTdI0aDyQGeiXT3Wq5ZHIjwNjMA79vL0XaYHQkyW9NOVCZYi
	ql1/ZLkhWZ/lUttaCvH07wuTDOkIeXXJJjhwNXuj9VnZfKhJaWSVDbkwPypU3MUfFKJmQtjbGjr
	l+c4hMGUMNJ05MJz2nAVIAEfJWbsDvqA=
X-Received: by 2002:a17:90a:1056:b0:39d:ec9a:8f8e with SMTP id 98e67ed59e1d1-39dec9a90b5mr8134033a91.8.1789455700785;
        Tue, 15 Sep 2026 00:01:40 -0700 (PDT)
X-Received: by 2002:a17:90a:1056:b0:39d:ec9a:8f8e with SMTP id 98e67ed59e1d1-39dec9a90b5mr8133194a91.8.1789455676013;
        Tue, 15 Sep 2026 00:01:16 -0700 (PDT)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdb3045bsm3754708a91.17.2026.09.15.00.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 00:01:15 -0700 (PDT)
Message-ID: <62cd0c26-23e5-4662-810b-c9f940b79a36@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 12:31:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: dma: qcom,gpi: Document GPI DMA engine
 for Maili
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260901-maili_gpi_binding-v2-1-c10dd2324a09@oss.qualcomm.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20260901-maili_gpi_binding-v2-1-c10dd2324a09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA5OSBTYWx0ZWRfXyeXtXVyXhylv
 9p2mLqK7QA/nGYdg71twW2hFML1BzXhpea778r27VqYc9wxUgnxUPcFswqQ1beKcrx4fLnRpa9e
 boHl+AKU9CSFBD/8EX1ck+DLHmsHsCe9z+VxgU/DVuLiUI5/CoXEMPym0fDpmaVNSS+yNIiiXyH
 7lhTadBgN03tGwv9ZQ/5YluSnFZ1sogN6NqZ/W6+LcPI03UJBw/3AdwcLGc3dQmczgdhPnudYnB
 abCd3Fk2HDlGlOW7ZVQ2PdlKF9voTVue+2qfAssLCpHppOGEubzfT9pZwIFv010lqgFfZmF7ltj
 UFeKpenFjKFg2OE4Ju/wP++U6pZz5/F2e66tepdCg7H4hJExjKNEkz3Jay4Ddwjb85G6EvwcrAD
 RFEIJaIrMgWdHcXNQuY+AT6Cxfs1eWLMZLMbcdMGL2IlLdrSocheYkt8PWaG4goIAylxwzAVRLk
 MN6B93IC1I5rPo5A6Qw==
X-Proofpoint-GUID: OBB5I27zdPZP3yj_ulKP8LiNcLFHDIkF
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa8ed63 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sNGwWByCUGpZoCTVRkwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: OBB5I27zdPZP3yj_ulKP8LiNcLFHDIkF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA5OSBTYWx0ZWRfX0kVjYQ6RKfCv
 piUe53Bd2k+Hyg9dc6DZ/cmFbNziJ9UsfXJkP5BEBIbkO8i2Yb1HXT4TPObLLsPx3xXxK5K9tlV
 OVsYXEwI8fIGNpPvazD+7sG1wrUqiVc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150099



On 9/1/2026 1:10 PM, Jyothi Kumar Seerapu wrote:
> Document the GPI DMA engine on the Maili platform.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index 54dca623223d..dfc4a3054b5d 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -28,6 +28,7 @@ properties:
>                 - qcom,glymur-gpi-dma
>                 - qcom,hawi-gpi-dma
>                 - qcom,kaanapali-gpi-dma
> +              - qcom,maili-gpi-dma
>                 - qcom,milos-gpi-dma
>                 - qcom,qcm2290-gpi-dma
>                 - qcom,qcs8300-gpi-dma
> 
> ---
> base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
> change-id: 20260901-maili_gpi_binding-37b12bf9e5c4
> 
> Best regards,
> --
> Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

Hi Vinod, Frank Li,

Gentle ping on this patch. Could you please let me know if there are any 
concerns with the proposed GPI DMA binding change or if any additional 
updates are required from my side?


Regards,
JyothiKumar

