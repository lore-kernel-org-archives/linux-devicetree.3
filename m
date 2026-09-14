Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C1623EA97
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789347039; cv=none; b=pERSAKyqSPzqI9jynTjUVw02tgdeZ+8GIwnoNMhITGqWzZqUTaaun19UBRq2t9aCbLcMB0tYRtOykt3dUadgjNmVKs1Fl1IX3bjfQFnBuuWgzUqk5V9vNuCmGc4lSIS7gNDg6GdcWOkHtOOc4wo2XkRcLC6i3+MEi2xc7K8VuLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789347039; c=relaxed/simple;
	bh=BhhLq0kAUoP6SjkHOa6ihyiJTZuMj7B+uI7Zc5zJhAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9nc2Pozy9qypoyka8JApKQxSq6m4yMH11kg9U8DrHwyr0HjNZ1r8ihaznpGeFPWwjP+41RY1WitIO3aD2ZmLF/hV5ZCY62ABfUKqtj7etsqhElR5LQYG5n1rDSISJXekz5r1Z8qrdM/c88GvJdUKDrtEpQIzbxutLz8py5Mwro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rpu4QKXY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBep13df; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rpu4QKXY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBep13df"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E06oln4022603
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=asdURPVQzX5whnoLxzBXSnq5
	avohb5NjScAZbrvWiNA=; b=Rpu4QKXY3gQNBMg6lx6rZ31xdK55mimRsuaSryd/
	hQZtTAddl61kn8ty1TCk2sFiFblA567q3CEv1wsb25QIcMqPUQ0+3DJb7sHQ+yfc
	UIiBaTzcXMvrrG7RQr23P+togK4Koyb+GqPm+g0pWZxXjDYhMI+EJFMg8CHJy8IB
	GrLAAFa6zPLb7zTgxi7EIeAKjSj9PZxXtUhm9CLKpODgs5gj8HVqxLBsk3qBGeOG
	Vehy247I8VBID2TjTd3PxpwV5DP90CGNfgxPTrYxzZXB6/FqGHMM41GvEPUjebME
	N/U5xfrR4zjrNqXTVv0yEEqZmep4HHTUMpD+yLDv9S0WGw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k08abu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:50:37 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78481f4ba52so2701404137.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 17:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789347036; x=1789951836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=asdURPVQzX5whnoLxzBXSnq5avohb5NjScAZbrvWiNA=;
        b=RBep13dfS5OIq335Y3lsGYYHR7Ow1BP6yEE0cVdeNK9r82C9peopy5q/fLO7We7lhb
         hnM0gxullC5ImMV5f02/zy8ZKLcsUnyJIkWFum1Gk8A/3QNATxuxHZBjasnSVxefqYh7
         lM5CVCC1X9w0BioaSak5+pxp1sg71GcQga/VZLIdQi9Is9Rsb9L9BImi4QCLQddZDJVh
         8+zntyHWD5RONp6UbQgM/aTGYv/lb9SEtlVjCRwtjKNa1ODRrOclZMI7cLTBXy5xeP5E
         /6aYGB4hm8rjNr9IYbQ4LHO2dxegS3WoIRP4tZWeLnxgSTsBzDvJ3XdRf1ZTAvXAKjZr
         Yd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789347036; x=1789951836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asdURPVQzX5whnoLxzBXSnq5avohb5NjScAZbrvWiNA=;
        b=jV82Mn26YBk+/kmokZmKR2kBKAG7sfEwCNXQPBn9edkSFnD58HFj4Y3dcRT1EHgB/N
         0ggmQ6lk+JgxUUiw8/8Wyw/Od7zr+CB+Z0fVOlm0p/h/K4IeY6qfH5eAwhgGM0OHdvMm
         K46GrvSWgRB/ndINn4BPR+OYoi13mrW1NdGLel9y46+XdffdNVkfxWV+JSZ3Q6HlMAzL
         5oevN1zR/UIaM96h5QmXCvnETYTq8ehR4r0X5qa0TiGJEok0J2MvICropl7FaHZ8R6e7
         igvKv1LTAsCsg2yrC4rBUwYwjPeEQ40+9oCfgtY0LG43JN8qfXKpcG1g6Co2tdrF6Iud
         /3wA==
X-Forwarded-Encrypted: i=1; AKwUvBxJObJrRvrdQZOJbOIoV0HNwTaBDCUrH5Mny+Ew82xer5o34JZzLoGJvOYTFEv+aW0lFkLJDNjsyC8g@vger.kernel.org
X-Gm-Message-State: AFuF++nhQg6pynMXMn943ImHPQE7oV4bftMgvR+6GnHCEBh0ixu1rYH/
	DqF0aWsWQFsmzG+2ngZ/LWhnnkux2zeEORKTOq/W1CZQBM35D079IPfhOsFMPbGDEBGgzhEFd+f
	TnLkWBwv/k71d/82oJl87otBsGtYFncJYSjICyXI8Sa/KN+bN/0YEAs9iTLpgYs52P0MRYVyN
X-Gm-Gg: AYBFou2RNRBl/gFMKUdRfTduX+7YYNp1LqOrq6RJ29FsHhhduSCKG8MD1/Xrail2dXr
	oeIv2V8xUDsclLNKn8LdrzpHTtWWtbco261PxqKlf1V7xMs//CXuLSdwL7ot/pAFniDD/5PWWsk
	sjqm6kaVte4KYQNTLHUHe+2k752K88fjZog/l78xmixqvQ1ZV/MxaFLh5koiu8nDTJimDKIR781
	zLP9IQHLGT+9L0BWbxXiIG2yuPRhWdA5CDAmxEFVDmogdbvtLhKI3qhgMc0DM+UrvqH5/GtkrpQ
	oZV6P5OAPBpZcAYOOj+L69jHUcfvFBMDCRmquE5r1NqWavLZiCOk7JgX3oSMug1m5pZrrWPt74U
	fldE3+5T5+9dwk0WxQkTKVXudLZoTj5arhXYSxWRT7cy0+clElNjwWhHb52gFwi6g1+k5fzbz36
	hSaz6Fp2bLZq5L
X-Received: by 2002:a05:6102:5792:b0:785:d308:cc2e with SMTP id ada2fe7eead31-79b5acb5481mr108172137.9.1789347036249;
        Sun, 13 Sep 2026 17:50:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:785:d308:cc2e with SMTP id ada2fe7eead31-79b5acb5481mr108147137.9.1789347035856;
        Sun, 13 Sep 2026 17:50:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04798d2sm2023587e87.69.2026.09.13.17.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:50:33 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:50:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 7/7] dt-bindings: display/msm: hdmi: Correct name of
 disallowed supplies
Message-ID: <6vmbxuukduj5tpvijgltcizdhhgllj4biep7dqs6twj7qte4cp@khfdliq4agqy>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-7-87bdb9f1987f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-7-87bdb9f1987f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwOCBTYWx0ZWRfX3DRwiMRjmHSA
 ucij5UMMRXCwHTu5bKU7Qnu9lzGMCFjHuHyvJALoJWILK4J+v0/XAz/vMfP03JcQix8LqhayCAW
 yJABTQ7HvSHGeNqQolLMJOjM5Kg/N6I=
X-Proofpoint-GUID: 72N0Qwn4uZV3QeOIEtXbt4M4ru04sVtU
X-Proofpoint-ORIG-GUID: 72N0Qwn4uZV3QeOIEtXbt4M4ru04sVtU
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa744dd cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=5Adlwl6woCA7rngLHykA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwOCBTYWx0ZWRfX6+EbzKcg/Z6C
 TDZdzF8fXst/3gooctIemQQ5Y7iqLr56EqZOaRUjRL5ngGu7+jCAU8UtVdTpEes4pcdYUDozHuT
 iF9tuNLUnUeloPZoThyqy1d1PiVbe9/xxOwDjIuAU+tneHLnlxMqmmRvuBKTAXjCHMkEZ0LDVgX
 u1PwDGoqFaZPYi61s0lpgtWBYN93Pzggtf5qO160jH7DYefCA6/bE3ktbCIKUSHBl35IcbuU8e+
 D1kEffrbLexfxodUxoKAhZOzlk+ER1Rj3nNoSZBs3p5+DItndSzQtvLevMtHGKRsI261+ESOG1p
 W8EAA/adTxaHY8QxEMBEzy1lHPNiAkLRLXHm09OVVRGoOXZ+7sjo8SHbrFsKxrq9ZO+wHf2Qpmi
 25zY6Pc0aFAY3y/nes2elBE70mZyoMuURyaqaGpF7SNjB+n7HdAth4g9ENAYOOENsijesGI9Rlf
 KfdfPPPBg1wUl74NNrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140008

On Fri, Sep 11, 2026 at 12:29:40PM +0200, Krzysztof Kozlowski wrote:
> There are no properties in DTS or Linux drivers called
> "core-vcc-supplies" or "hdmi-mux-supplies", so the binding probably
> wanted "-supply" properties instead (which are defined in the top-level
> properties of the binding).
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Fixes: 2f14bc38d88a ("dt-bindings: display/msm: hdmi: split and convert to yaml")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
