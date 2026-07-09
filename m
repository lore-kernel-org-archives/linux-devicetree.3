Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C1532AACB
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604876; cv=none; b=NTfpquEV0sYWyNOIHuEpyy5niJYuRcsZUkf/6/XUk5hkXRxqk/h/qYCB9u75krZTF4+b2tf7rXNrP8llT/C25vXOispaazrNZXq9BiKFC8avDejpqxNfNA8Zox4vkAe81MUJpnGgAYkFCl+ALZyFiT8nYqgsYB/gbJQHU0rNkIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604876; c=relaxed/simple;
	bh=66kDW3XPA/IVL7H/7ZZz5fJbIr+LgzIbNasoSYOmMx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLU/wnJ8JoUI1+JBA+nV4UVSpQeCjhl7kKvthhXLgK9uutsM4anImYt6RHp7OefYit/+VOtAQEtMxaYxBzZDGMlTnsA9gpAGfkZnli8er+sv2upNnhlNNKJTfQOvz/JoxmumT39fq8F6D7vr81q6pI6zgJN1B2tc6RwGrxzNb70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PgAAYXhp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GzoZCyyR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PgAAYXhp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GzoZCyyR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNxnL1674264
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eAxguwIfoyTw9d/WwpSbWgUQ
	k1tijeexcOmhi9TjxW0=; b=PgAAYXhpNxfiw17Kyy6OT6sEMBHOhNVqJ/+fWh3H
	hpM5ZDa+um3yLqJPms9GsX0aygTGP0cSTugFThNn5gd+bRgjftUCZEXDzspgoAFH
	Wm94ZqJ9MVsYYkQkPbZitLlZIGey/knGLrwLxZtqdQ7bME5w7niIk6zK98TVFo4p
	6c5imvbl1FeI56EvwtQmkc6Rps62je9MoF9KIFqteBJESi89Lx6O7btWtK3pd6U6
	xydcylUittTloDi63SkEH88VllozGr18MDIrmH5CLOFck7eibvq4ZhNBA3SFlpcJ
	9vu4s8Za6J7Y9Kp8h/9APGAO/2X4N0zkVH330+43x3myBg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqscjk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:47:54 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73850dfc198so224920137.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604874; x=1784209674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eAxguwIfoyTw9d/WwpSbWgUQk1tijeexcOmhi9TjxW0=;
        b=GzoZCyyRr4Jj5/Fm9PyxVVQuVorqSquTjYTuXwGBV1/3uSQDrsEOIx5o8YaDpGbvZ9
         7Z17fQpvQjQmeng3yIyPWuY7aZS1NCRLU8Li4vaa2dCr/vT8nVRrfc8ly67O0rFT1vxz
         c958GrDyTvyHytmZDTteGIFU+V8xtxY+ml4ehmkDhi01QJh+KxHizhv6URhdUhpIRfrr
         WDjkrW/uoZUhRvtAUAvD1p9epzrK3Gnr3DeqoufTkwpbA4Bvzkxu0rF1qZrUmSYVZ5eH
         IlF54QYkwoP5V6r6jJ+15yMpvWwufLxPAFhEZrZMAl4WA+PlF8mFDDLJlUwVXtUSwW9/
         hQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604874; x=1784209674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAxguwIfoyTw9d/WwpSbWgUQk1tijeexcOmhi9TjxW0=;
        b=SOb2shWqck6/eJqX5fC4z7f4S10OAbkW25ZNxLzBYoyoKhFrBSh89ObMorxr/JLzfX
         c95f6URWy8e/4wH7oevD5WJywDvnkrNQXhhnpX4uzM6D3wHtdNxOfC9aulPSLPnQqeYd
         sIpOkyJF7+kevqFReUPQL4sNu4c3SU9P2Ugy/gmf29xtjqxztYe3UpczMS1RdBbxPDxp
         ZIs+KJdiH0/uH2IoZqNTrqBzKuo+Yntwqk2JPpn0d9oh4haIU9ulH4JykZlacOee3i5I
         136Y7okmChlbvMmuu4MwEcut6VkA/gR8vMaFWYIW8WLkL2anE0dJisDe7FsLUv2jhxbs
         6emw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9//wVX+AiE9amw/ticOap8Hu0KnLYaEUpl6/CaUiLRqNJld6I3i7PuBGdoha7gW5KeTKjtuuDy1cY@vger.kernel.org
X-Gm-Message-State: AOJu0YxKXKcJJupJtLYhERq1YWjdb20h9VulxVAZSXsJQR+SBiNRHgTY
	5+Qk3Ppxsix9ULfUHAunEtotWAI3u/130YtbZU3xcYWdOa4P7gheBnpvoYMH8AvJvt6BnTltx4p
	9FwsUZd+FHir/MUWQ7P7aWP3TenQ98HtkDWSbHmIAsGO7G1ODiXkkQyNmxAJlbh57
X-Gm-Gg: AfdE7cmCyQgiyc1lrN4ZYkWW7YYmqzVyFCnHTDIWuNFzZ1w+X/Y0yGFGy5xw4SDO1GX
	LBKuPIucGMFMCzGqF/CxHVKh+PT/jPfq5HAybIBbAMHhn0Y+Bim+Om2/xSA7DH7b/zdLTG4ad70
	WjcCkswdyxb7HKysB3eg9sHPmtEyVF55rJ2VcpYkf07NaDVbX//jQFvf+HGGH1amZHGrj6wKKhX
	Q1+0cIrb0dlmeuEt2I4WVWShXXCvDTMCn8rvbVKrVl/kNkn1lr9/zo8vVL3GYeXJkxzxidymTQT
	hG5WIqrVJ/yA/VR2kJwGznsYGqct/wcDWkDJ+KpQ9pESaFhDBCr6Y+GvEM+hPhvT6xSXIKTZUGl
	NoDpJHIgd6h2AV6PybMIDFpIKC1zhGy6SonyijBI8QciLqfC371KWIKPqKtvIb3quj5fMBUvTyM
	4CxPfbUdyvY37oK4XloXlVaaUC
X-Received: by 2002:a05:6102:4489:b0:73d:23c3:3e25 with SMTP id ada2fe7eead31-744dff69b7dmr3980058137.27.1783604873649;
        Thu, 09 Jul 2026 06:47:53 -0700 (PDT)
X-Received: by 2002:a05:6102:4489:b0:73d:23c3:3e25 with SMTP id ada2fe7eead31-744dff69b7dmr3980030137.27.1783604873071;
        Thu, 09 Jul 2026 06:47:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13701easm5330961e87.16.2026.07.09.06.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:47:52 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:47:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Message-ID: <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNSBTYWx0ZWRfX35HoNgRXMyC7
 HB05jq1FQaCx9xHrw75SqqO0KBnVOHiSzotM+hq/CDuGe424jmPQI6ZddW6ct3qfn5G+wMMc4Tl
 2tWVKnbcvuC0NG94xpvGkL41po9y0u8=
X-Proofpoint-GUID: L52JGyOHVMnrPNDmrsMGJ10TCgjlsMk3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNSBTYWx0ZWRfX1+3P+EnBdUpG
 xvSpYz3Pdba7lEpDdkFeNj841KK61JXyORSX0RR0FMkSMEWo2j2hLJGNG4IP1jdkPnhv5RQQ4H+
 GUeJ3eL49+FKTvX5OjqGAyIL3uuxA+o4waKOAQr18ZkmcbepDZCmk6Krqk/UQoQxyOp9jOxl5C/
 XUQidLDBZDULRGjUUo+8HFExjgQW33NVWMZL6fVro4Xo3AmEQH7AvMZQh+muRBliWiJSggqbIO0
 ds5V4zszOUzmLGKHlejivqg3XQhjXQB05t74QR7w75NyUpqTDrAJlOXwHODUCNhRqxS9Es2LeNJ
 +t8f3DXOvg0WIXfkxxK9eK27cgGifbYbs0mS7yE61uPfS2JrWjh4N7gArsbjwJfPoJn2aDHvIyC
 zFFmSRWPqjXNkaVUgbXzyri5/BYTQ8jMHbUJM4uSlSySNFMqwLvwdu/ZgT1Dt9Ue1z5xEXwI59L
 h9rWdh6Dm/ZUwB3wfXQ==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4fa68a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=HXgzhWCI9UixiBSUE-AA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: L52JGyOHVMnrPNDmrsMGJ10TCgjlsMk3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090135

On Thu, Jul 09, 2026 at 02:22:36PM +0530, Krishna Kurapati wrote:
> Add property "qcom,has-eusb2-phy" to indicate whether the SoC has eUSB2 phy
> or not. This is used to modify dp/dm interrupts during host mode suspend.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index 8201656b41ed..0c6a839be82f 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -152,6 +152,13 @@ properties:
>        HS/FS/LS modes are supported.
>      type: boolean
>  
> +  qcom,has-eusb2-phy:
> +    description:
> +      If present, it indicates that the controller is working with eUSB2
> +      phy. This property is used to modify dp/dm interrupt configurations
> +      while entering suspend.
> +    type: boolean

I still have exactly the same concern. This information is already
present in the DT.

> +
>    wakeup-source: true
>  
>  required:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
