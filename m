Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687946;
	b=wx6jsEcOhRG5mH8sD6YPjdyZ2q6PgXcrPrWF7u+vCzQQPMpFsL080wz5wwdUnOi/tCjq
	 j/xVLryPt9ySCr/X8NG6/FFZV1dmEoYXeYxWYYobZcDCZ6BQBeIkrH5zdKz7mA3TKTZUk
	 /jsGFVqhbKxnNi4EogjITXFLEwz5Tcpdm91QKAIDwAsH2NWiMs2U3lZF9Wpjy0kGj0w3L
	 aiHiF4n2VoycbeByaTHXiXeHOFWeyI3ul6YSi6Mkr15r7CGJ8l+/Dgfq/i2Hf41Io5QE5
	 L+4762AWuoW4aDELU5lK8DhQ90AV+y75wh+NtGuUAIdPfWjQcvOl7mFIxm8+anWgZ9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687946;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=88afsBd4DBJZJXNBN2MdesvR9kKs2U7zYJzInFyRPBI=;
	b=JC0fHZd3/fFPNs/vleFXINag0EDtKMADkitvQUXZewBUcHrh5AMK2sTfTdUzg8breezz
	 C1yqantqByHEpAajhiCR5qYGF2qAQSkKjFfXQ2/vERWUCD1/jsRr5UIUK35lmzGSY6m8e
	 EwDqK7Q3iQoWkfVfn41/xI3E1qHyJMRLZZTHYdwJGwAH3HuiZvKxECYGjp5VpGahTrkus
	 cIy7jgh8C/4nkOZS7AB2csd8CfzeKTV1v5pgNpzg7MJObpkQtJS2iTQjkGPKgMVUIgNGX
	 kYv+Le2pikJx16wnF3CHQwEL6mjsIXCVV7ge/lrhGPhZdvM6vTHPX53Rn3zKG7H0fsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GYoqK8CN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f8q2npDW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF73606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DF73606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GYoqK8CN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f8q2npDW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8NV532859755
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=88afsBd4DBJZJXNBN2MdesvR
	9kKs2U7zYJzInFyRPBI=; b=GYoqK8CNmbpXI/XAZIXWy1BCQTbfYjkSAYGNe0uk
	oyB2cpyJ8jC+F8LetXo2cqGdEUUl/gu0SVDDgcf0dbwCW56zqRRByFBD0MMeN6yd
	DDEsA7dq0oqe43XJt/j7D1iw7gg9xEKqBrXTGqFweEcrCc9stnxkyove9DnNG4hN
	3sRcFNdJv9yzoI3NalvvlNLrqOZQSa3M5EuSmd9f//KgVLBjiyF87+CdHg7sMrnU
	043OBZbhOBG9evZzdsZlsFIC7rAtWgydU/nzVB/zTH0fe9IrA6Of0UkjxIvKmql2
	mGCdQJpAsBnB8+4Nzd93v/RuUQ5CXdmXfRrOMgiE0oV62w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g8f1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:12:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso7384185eec.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687944; x=1796292744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=88afsBd4DBJZJXNBN2MdesvR9kKs2U7zYJzInFyRPBI=;
        b=f8q2npDWeyMusPOpBiBYQ2BjTAlMpAEMs0MoHLCd9uJK7UkqQGMsilOi1IHA/DXKmm
         fW1rBnDfiatVDz5lJwZaFgrtDviXx2FFMZ3aRsB5VhFzOOEOyGBLLGDwJ3PF5Q1Bl54z
         ISYAPAYxDo2gR7/FqQ3BnvIM9o01Pd7pPKhw3WSqGuwf5xvY6P/Tqff56p2yAiyQfOPq
         sZMBmF7tSI/JbgmsM+ahE4taVkS7tNyepkYgaODnT+pupD3xNXl9xBvvkeYg9lXPZVUL
         raH0AjLU6Qt11P192i93wtd0bY4eawZfAEhF2sbbFxGrKCfmAV0jvvvKqDF0+zyotB3F
         7ABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687944; x=1796292744;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=88afsBd4DBJZJXNBN2MdesvR9kKs2U7zYJzInFyRPBI=;
        b=2UVsclAVu0DrtqW5uHIF1xJE7U54tUccmHGiqpkydvOw3ePW7l1aAUDh7TUpLAfYag
         rN5EPX2ng43Ftf0S6UvpkSXL3vx9x5BRkELoa/1K0RJPANfN8XwvCTASi54krBseOY7D
         6WSoYYAGqapc+g5Z2pblNssjJg5lmAqyTu4Lxh3MxS/PR4ahSMT+FLcpbkUSGbCKOMON
         gSnv1W+BpH7POB12hiUiyJ/eFKiVV2kxbSXvP9EcD6mbCX6nFcj796TTTbgFqs5X6p2G
         pHV1HvBHvZXJfxuXh46/s6UYXur4iUhF8ggl5qsi1VniCRAzewH68RHGqmN4GEqCVjep
         R2nQ==
X-Forwarded-Encrypted: i=1; AL+hErElIc0PZsa0Dz4K8hL8oysYHMXQ2y7g8+EkzgcQqu6zz3riseqN6xlRAB4mHLsM76Dhn/nGJJh4SBrg@vger.kernel.org
X-Gm-Message-State: APuU4Z+QUGrkyu9qmX5Wa+snHp7NDxNykt4jQiPpVTPcp19iwtj8ctUV
	nGOl1G8ZsGKXuY29VqCf1eBMls30jdPej+71DCTbiPjVwSO0uQ1wFv98wBAEYjn3wCJ4VyS05G1
	QwiKQCxFdV4P60i7MxLNOK6lTdCXS6qdtr0ozFloBziyjpVUWOqGjporfJj0j1iq/
X-Gm-Gg: AZFdTZeAnKibpl26TVtAmuO5rRX27K3OceG1VMvDsH7Iowugfi82pyYkmwTbemaDxez
	i2vclEobi10bStYF797EGkoosQY1PmDBEcHNifT3M5wkNG7k/+ECA3V0JeAIfUI5wudkDufVYp7
	Mm4WSta/OeYXODQBncaqsC1HNT1qVWOH4UGnDkBKjTzJu768xjO6blQF252eZoV2RXFruBlzvdk
	+wAT9tHea8Df9LC99MWClXnOSh/F+PhiBzJ2B8ucEVGJ/HYJgkAZIliqysW5yDiolwut8ybTKEI
	HprSefipzZflV20vGEIkEINbm4fowYbzdo5KTHuf8MfqfoRoFXHH4vAT9LGfpreDzgQdvy1KRGR
	YHYTxgawr0LbTgkYKijK24PFuIHUSqHltl0ZV5brwZL5/AkRLB0zGCOND75Q6yfUd8eB308L5fX
	JPjQUPHGqS9sAFnZMd9+1gtbI=
X-Received: by 2002:a05:7301:db86:b0:384:d59d:199c with SMTP id 5a478bee46e88-3856c2c3fd0mr19331246eec.1.1795687943955;
        Thu, 26 Nov 2026 02:12:23 -0800 (PST)
X-Received: by 2002:a05:7301:db86:b0:384:d59d:199c with SMTP id 5a478bee46e88-3856c2c3fd0mr19331226eec.1.1795687943439;
        Thu, 26 Nov 2026 02:12:23 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm51643252eec.25.2026.11.26.02.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:12:23 -0800 (PST)
Date: Thu, 26 Nov 2026 02:12:21 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v5 11/11] usb: dwc3: qcom: Enable VBUS override at probe
 for default peripheral role
Message-ID: <awgGBW9-cxJRlA_b@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-12-faisal.hassan@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123104727.1539149-12-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: b2sw17iNQgCfv3hUF8KDT1ARMfZvo3Ec
X-Proofpoint-GUID: b2sw17iNQgCfv3hUF8KDT1ARMfZvo3Ec
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOSBTYWx0ZWRfXwr/aI/eG2MAO
 NM2iXhk3Yq3n3Yh82JS7MB9x3PlLxI7+eCMYPOzVTA2CgiVi4bMghY9+jrCP9YDPvbHqoP+WGOi
 vdLUQ7kQ2oX893dS3vS27z4kUrP6qBfwh4v/9eta6bFFTzrlJBCmQxja3T8+2e+XNrQpULHI2Ev
 /OPoTnKgq5LgoRrWU8xqZguEOIde9mOs4Fnmf8ptppVCHtzP4Z3iJiSZ+ffuSl3mLCm4DyAOfe+
 jGyNhXwfRiFhhzWKgwAtasrXCjcIHqEdUF4qwIwd9kR3vD9KJnBqGaxFQvZRmEA/RDZRG50ay8+
 NeO093ZDcWht2VAVS9nvvX4i1Jk9HGCKKKoDnDz9336NCSTd+2g3XbtOyN2uJ+OMb2suSFEECM6
 3/50+QTQfEvn8Bx+qvA3plrGXeL7lt5uXvca/6wD4mTCTpGfypFCoAE2wDlV9joltyt9LjZ5pvD
 BdU+UlESO7Cb3JMS6ug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOSBTYWx0ZWRfX1saXdcYohmCG
 tE2Nd2S1lTiZCqZePWO5iuV4K+n++lNgTveoR6zkDhXpNA6Kdc4qR5PmFhU2t1Swiqnrxi2am7p
 9itJsO/Zyczm8jh4hBsOh7NZGim75Us=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b080608 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=y33D9nhtfLLIXgUvc_UA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260039

On 26-11-23 16:17:26, Faisal Hassan wrote:
> When the controller is in OTG mode with usb-role-switch and
> role-switch-default-mode set to peripheral, the role notifier never sees
> a transition at probe, so the QSCRATCH VBUS override is not programmed
> and the device never gets a session-valid indication.
> 
> Enable the VBUS override once at probe, after the initial role has been
> determined, whenever that role is USB_ROLE_DEVICE. This also covers the
> dr_mode = "peripheral" case, which previously programmed the override on
> its own.
> 
> Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
> suspend/resume iterations completed with no failures.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 559de5172e61..22b6c7ca0297 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -964,7 +964,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		qcom->current_role = USB_ROLE_HOST;
>  	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
>  		qcom->current_role = USB_ROLE_DEVICE;
> -		dwc3_qcom_vbus_override_enable(qcom, true);
>  	} else {
>  		if ((device_property_read_bool(dev, "usb-role-switch")) &&
>  		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
> @@ -973,6 +972,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  			qcom->current_role = USB_ROLE_DEVICE;
>  	}
>  
> +	/* Force the VBUS valid indication to the PHYs in device mode */
> +	if (qcom->current_role == USB_ROLE_DEVICE)
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +
>  	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
>  
>  	qcom->dwc.dev = dev;
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
