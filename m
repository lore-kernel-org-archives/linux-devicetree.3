Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7359F2F8E93
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786620109; cv=none; b=JR/q4JhYnpRumMC6CXe+eFQ6aMUjPMWjyEq+8TmvQssF/I0ICzDmJAafGSszzhdF7xn/gFFV/jmRyP90fIN27G7+MsAipfbLrglW+2jdWLiOeMUtbW4l5YV+jD0NSI95bEttTiHSf++JMb/sGgBgyk0TntW5heD1psf5l6/kwkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786620109; c=relaxed/simple;
	bh=aLg4zE65OoQnz9Ax/WRVEGdpfVmcEMHPqaB2WEQRC08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TlTiyMVlP55L0Qxz0aqTfvW4lDHyCS8rGv/wg8BcMBa7JWtF7wPb6+hRfJlz97LFbR6puhBB0NvuiazeiSeEqaDfFVdTE1IpS+Lm6ywNs14rx4o6UxItp2O55DNNpKn9hjUUxldhA3zo/JP7eC67DVBgsbSR++Gd3fz4I/Hz2rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PAUXtAB1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aoFuf6Uf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PAUXtAB1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aoFuf6Uf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D921SL1979095
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 11:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q9aMm4nPs8Owv+jsYuUO0Om6
	+7mJiqrQDdSURKEiArU=; b=PAUXtAB1zZPdNS3+4qzez0gzm/RrAOctVYrxQORU
	23YW1nZCn88n1dAdjEC0JzeCav0NuxBLpeyPf3ojv4dN1s8+QIbgNPrKzWQ4MmAY
	Ji29+/pKHURUGf+DMDA+SjMZr+DaaNGMhUcF2osa678bKiw6mcTbMcv7KROcQbMI
	rf3uK+gT0mZTj28xEd4hb4MOaimHo3rDphifyZRNtoc2jmVNV1pHYtfttmqevqUz
	N/0eCNsZqr/MRoqs9dFbKl1KSPPr0DoeJTjIUhumX5QCtsRxDmlJw0YbURgcV7nS
	RqA1+2fcF3n12BFM2ELqqLBAc2c/WZZOBqxaQ8wXbYYhqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g143ht5v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 11:21:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d30035dso4476871cf.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 04:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786620104; x=1787224904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q9aMm4nPs8Owv+jsYuUO0Om6+7mJiqrQDdSURKEiArU=;
        b=aoFuf6UfMLO9X42c4DbUNgib/6EpTLHO7USELxMaw3kmX2G3R+8OSJUYtaCwRykNr8
         x/W7YWi6LO5NIJ30Q4I9xMjSHMchSPD5xHq8i9p1OfDZGasjGqGGvmVg26+hjP0B0g8f
         MMBcelD1eNbCwz319MLlI7wkxUWzzxgfuJmctt0NAsG9a3FYBVTTSL/abWTdtMvhi6CC
         DtxTaz/t/BkAXUH5xIuRKg873yY631VUT87ubbK65bVVvyZgLxJmXsjr3Nz2v8/jv1ID
         Q2d2abO+6MjH78REh7WxoOwchHD7s69Y0IM9sFizPMDXgaDpVfs5uccgkpGafYhKqngs
         D/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786620104; x=1787224904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9aMm4nPs8Owv+jsYuUO0Om6+7mJiqrQDdSURKEiArU=;
        b=SQjbGEwogxcLHVXM9K08UOuER30og/+DUM0nDNsQIjJQaYm0E4HP+kNmGl0pzckTDu
         ZI2Ryh3k4BecdWO5w9z0cRwkDDvu1AaV5uS8LEP251xL22vJ0Ak50v7OgloXHb0Q8Dzk
         y140dlRr+e+KF6oztMIiiOo568tBQfa50U8ZME4hDX6JjJOrFfqoidAzTRhXg8PoFnVG
         NmiSesOeg/66/pqjY3M0+kOEhJ73zWqQPFlxfSa8APj43EFXxohv5dtjpo9GmEzWIqb5
         7UJJ2EiHQPe1+b1XjRXXjovt7wk6l5Rg4KcJOx7HQiKKxZJ1jb/7C8y082yggJYKAjTD
         XesQ==
X-Forwarded-Encrypted: i=1; AHgh+RqDZsgkGIZkkVGS5C5AYXbN2nyDsgTModYpgR83pl+zHJ3LG0lZIIG6zG3Pj4aY8NNFu7VOZUC3PRC/@vger.kernel.org
X-Gm-Message-State: AOJu0YyzswLktvi5TlooWRFX8HM/pFE9SPrB1PTRMx+rYIvIp6H6+i2d
	DpnOl8vXYWG3ytXBIb+zQkDdebioZIhrcuuB3XVh061wJT6EdTOg2+CiCBkj/ryg9cBPtkymSGn
	ul15P5w7vaQJyNWqKyzqEjbeOcpc25I6T/1TCBb04CFdxS9xGx/y+pbG8yHYtmn/V
X-Gm-Gg: AR+sD119oFvwaRkDxFJKlsnAWgh9ipN8fgX3AnG4O3Pz6fdq8DS6cPPoXLmCU13457O
	TijWsZm4rLRbdnE3nWMOGxcqX+lUimyTylGulqQX4I8UB6/IKQNjLDs3GN1gl0U6HHWuPS3ug2H
	CGBx4tEre8tnypAq6MWtKoj7cNze/2j4APhzsyRqzS9vbJE/BkxWbvotJ7BkfOJm94uCIUbM+Yr
	6EjjKY+vIHfKgL7o9CGFQYAGJngOwTFZSQMmGJTKyAc6m6rczLB1byLzaA0lJoSWh037UdKpoKC
	t5UK9TpVOuX+8aIQDbVENEEO4OGYWLNz3dTfvONWg/i78WXqegxbpxnxiDBiR5EmylEUUcxm+Ua
	fOrRS0Las0+v60Us=
X-Received: by 2002:a05:622a:2299:b0:51c:1532:ae84 with SMTP id d75a77b69052e-52d73c244a6mr49813501cf.6.1786620103637;
        Thu, 13 Aug 2026 04:21:43 -0700 (PDT)
X-Received: by 2002:a05:622a:2299:b0:51c:1532:ae84 with SMTP id d75a77b69052e-52d73c244a6mr49812781cf.6.1786620103077;
        Thu, 13 Aug 2026 04:21:43 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5613eesm5438185f8f.5.2026.08.13.04.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 04:21:41 -0700 (PDT)
Date: Thu, 13 Aug 2026 14:21:40 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Greg Ociepka <greg@ferrisoft.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Mark USB controllers
 dma-coherent
Message-ID: <v5skpjjwcds4qvtz5nkyxfgl3h7uri22uiyjfluy3dyve742vr@ydje5dj2rsx4>
References: <20260812154014.123315-1-greg@ferrisoft.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812154014.123315-1-greg@ferrisoft.com>
X-Authority-Analysis: v=2.4 cv=R5oz39RX c=1 sm=1 tr=0 ts=6a7da8c8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=o07dIpAjZdj6OISZKn0kaw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=a8UEx8NLAAAA:8 a=i1Pha25J8sJlEzR877YA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=-yeuc7zBjbfZT8aiaP-D:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA4MCBTYWx0ZWRfX2CSHZRnwxQ8V
 Uq5VNjQAIcPqak5EI83x2IZk8UD4QvbW1rEmfJiePH3fhRiOk1Q6JAAhr/Jow/HQBRcKbl4ynK0
 sH94CqOJ0Pfh1Psyj5DOW3Yp0lWltqJbmvb1BzSsYs1qLQcVPW6zDt4uDwHh8fP/dcSKpoUvYYK
 5pR3Eggyg+DylvCasuB7dKVC6bHvZZYalpqWlmUqVRFD5BR2/9hWpRW/d5U0EcsNVKwnILZFWaI
 h4DdCmdLt3I8BwKoas5ivUg3f22tibcVotNSX7Eb8+2XQsolKlj0jYkluxtAKmn7uYi5bJfNDoz
 V3NEGhAehuP6WmqVWXYWti2nA1Fh3ix1OmuTNAU9K+zDmK1Mu3GIr0M7LrQKbcmNorDc+c4gfsZ
 iK6yJyquW6fcVGdS6Y4I2pyPVCtlX671sft7mjwaDO1y0dNTTsAKPPeA+xlt50So4SoQqf61vJx
 MCSBsJGAzdL3b7GYZew==
X-Proofpoint-GUID: z-pj5n6-FrhBaqp0kUXxNHo5JcWoMWAA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA4MCBTYWx0ZWRfXxMFNDDVQlRvv
 xYDQcNqQ/JtyJuBHzc6UCI1CllBvdO4pOt+82fAl67fduYUv0XGDnby3X9IAu/9pjqRATAxaZTq
 2dtTPzgJimaHT1fUa2WbsIjqyjZyzmY=
X-Proofpoint-ORIG-GUID: z-pj5n6-FrhBaqp0kUXxNHo5JcWoMWAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130080

On 26-08-12 17:40:14, Greg Ociepka wrote:
> All five USB controller nodes on Glymur (usb_0, usb_1, usb_2, usb_hs,
> usb_mp) are missing the dma-coherent property, which Hamoa carries on
> all of its USB controllers. Krishna Kurapati confirmed the Glymur USB
> controllers are dma-coherent [1].
> 
> Without the property the kernel treats USB DMA buffers as non-coherent
> and performs cache maintenance on every transfer, which coherent
> hardware makes redundant.
> 
> Follow-up to the clock/power/bandwidth votes patch [2], kept separate
> so the already-reviewed patch stands as is.
> 
> Tested on an Asus Zenbook A16 (UX3607OA): all controllers enumerate
> their devices as before and a 64 MiB write plus two O_DIRECT
> read-backs over USB mass storage produce identical checksums.
> 
> [1] https://lore.kernel.org/linux-arm-msm/f92cc91e-6e5c-4375-aaa6-f079a165f4b5@oss.qualcomm.com/
> [2] https://lore.kernel.org/linux-arm-msm/20260812083522.774711-1-greg@ferrisoft.com/
> 
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Signed-off-by: Greg Ociepka <greg@ferrisoft.com>
> Assisted-by: Claude:fable-5

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
