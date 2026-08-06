Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6028531F983
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 05:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785995541; cv=none; b=IysnB8f8WzIOZQNVhf46ZeNnqHGpOWXxVrLUQZsZPtxDg6SetMtOApa5VvwwyX7yZwRiJVfEPsmIVrPtx2rXH09M/i/4y6zOONc6I33i+eWSFLnrO4HRTzbG9+0eqrBNEgV3xr+yf2qB7oURDJOhGvyUHTIoBEVvYlhPAzwYUIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785995541; c=relaxed/simple;
	bh=e+C4aZy523RIhd5n5NQNX/1B/86k5JmgV5gafuEnX/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDniCsHBBso4bc33WK/3ZzqZlRmyCRlIjaRwOmcLHo9xvwhm7b4yghK5m85IWF61S5bWhNfexaVeNar1jFBdxHg/ZMS2SCJ/t+pd0z5SETaDb9zkg6li70N+zisWtkwHNC2kA46gfYBbExKrIAtE7cJWU2NuSXvGTitXiIesK3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nf+jecq1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IcOT5I+K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nf+jecq1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IcOT5I+K"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wnTn1070883
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 05:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oeKHvlvTKqPpnFbSU3MA6x+vArE6ZN14UcQL+UlWc9Y=; b=nf+jecq1x4vefev7
	702Suf/gEnE3e3OA6u5GeSYAnRPQTYxMigqX7fFZvoNZxGqEym4/F0hUT2ZZmHq2
	c6Lc56rlP5T3hu2nuU12ssadeY/XdHCJks6fxI+2+rnzJQDs13xvivQxS5rGCF81
	38naJ/MEUQuZWtNENiPAnNP0DhPNdF44FowUR/LM64ijgBbS4xsRGF+Bzgb09uZA
	IRhVxmmND5g0Pqn7UjVT99n5NlyrPKIDmU5voptG2Aqsiexxim8HMiAUDwM0c18J
	476EoUEQmtOZ8lZiv/n9Taxc4vl9NNcSMLlqvBohaoqMkRWzyijdsMpyPxnZRoaW
	xEymkQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjud0c36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 05:52:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ea24a2db9so211096585a.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 22:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785995537; x=1786600337; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oeKHvlvTKqPpnFbSU3MA6x+vArE6ZN14UcQL+UlWc9Y=;
        b=IcOT5I+KAnmc29/gzC44qVULJVhBcRZ5E9pq+K9FJxS5Y7eAnk6Sp3Pq2trf1YzbLf
         MFHeoEYteSFGFAIWWDczzuNPCqrztxvl0Hvd7cO7fQIFTwlrhRxLz+48yI2avXQ9cEb2
         6PhHnVUWjgsXSLCrOl3x9t83Du56aFsbQKPydzGC7N82zHkzznbZuazdobevN2T84Fxu
         Jdhd1O19zVS7CbxHPtJw29w92mYWgkO58gsOzrmk6qgO4MlWvC5F+tDuXer9LuqwPkZH
         CjLN4JUE/RMAjQ7UDMOr95flfl798kV2B0XE1vU5V2OXiGBlskZUcNubwjFIBPDveCnN
         KEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785995537; x=1786600337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oeKHvlvTKqPpnFbSU3MA6x+vArE6ZN14UcQL+UlWc9Y=;
        b=QYNp4FkcYf5YnrMH4zdX1Hd+dB3zMsH1arQz0I8yO/bgIMYjIK61RfY777CXvCNg6m
         mBKu6OCTZcbHrnMT1FiammdQl/4qnP4OHikmu+ArSbQzszl6kRJR3nzB+DgMOox10QIO
         F3WHWunK+KXYCctTFlAC2EWJK/EiEnWNIg3EQGj6Mvx8A+AHYXDfFjF6rOVSYEyPkzkm
         uikjFWB6aSKOUhc/fvpfiJyPXdopfVLj4xe1Ct5jN9/HTEP/nR9Os+Aje0Wyz4Tqxl1V
         Mn97G4pmU6/Bh5Mvaa4S5qeMpowoAaKuuS7hgBDQmHgnYH6n5WTbbyb1IS9NFEXIyzkl
         XGQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9yCG+ioq7BiAan4K7jVLFnsnkZ7YL3fsBK9jOoDarmuZteT2+xRZ6Y2vUJ/2uqdGAQeduibpJYc98@vger.kernel.org
X-Gm-Message-State: AOJu0YyQLiz3aSM7oyM0Jgf8rmVtFHEwYyfbN47BMN115V49j+7vrUr7
	EAIJDEJYwhuCLEbIYOoXUL2ndn/bSifdW+sknqh+g4CDSJoMVCDG20eSTp6lKTKyBSlw653HXeg
	KdesbOehZ8XzfyGTtYMnETwL5RDe3dANrF0aQwHo8J02rwA+qvfVZLtCEHDKigWZHbQxMCmPv
X-Gm-Gg: AR+sD10yzgBkNqYGYwWKFppy3Maq9ieUyI9g//riDevaUa0urlrxm1IsXTe7CwzHcOd
	XZH0x5W5z5lE5uFjsaPzX665L2UhqLxd1ORaE96pno+Y+M9TBSHmpjv7e40r6poIyv92XSLznA3
	3QXtRSBYq17XCfXaUnKE5ejE2dq5eoeO0g6Ei6+kO0+7NOcbyZzKiKhxA7ACeEhygk2OEwlUem0
	QCEaFJf4xZBEt8YGgaozGfmCTvEiW9mUjz0otMrNzsi7L7BHUseSPDD0fMrf6N2qJWYnHKCYcXJ
	ApMeZIi12CUOj7Y5Hey+r2ft35/eDUd8AMKST4RemjWrnQbtj9J5LXDYhZzfEp4kfTw1VqOlJ4G
	/riFqS5LEwsAEIldnUC0+fZBe+NwITfHozSGLcQxLKRf5jCK5h2kPRQ/vvAi7Pjc=
X-Received: by 2002:a05:622a:1dca:b0:52b:4e1f:940e with SMTP id d75a77b69052e-52ce5f446cbmr124017681cf.1.1785995537343;
        Wed, 05 Aug 2026 22:52:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1dca:b0:52b:4e1f:940e with SMTP id d75a77b69052e-52ce5f446cbmr124017441cf.1.1785995536839;
        Wed, 05 Aug 2026 22:52:16 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ff9d720sm44340536d6.4.2026.08.05.22.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:52:16 -0700 (PDT)
Date: Thu, 6 Aug 2026 13:52:10 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: qcom: fix PURWA/HAMOA IOT SOM
 compatibles
Message-ID: <anQhCksBK0Aa7i8w@YUANJIEY2.ap.qualcomm.com>
References: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
 <20260805-hamoa-come-v3-v3-1-20463c43eae1@oss.qualcomm.com>
 <20260805103850.50EFC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260805103850.50EFC1F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA0MiBTYWx0ZWRfX/QR7QxuOD8cC
 k1WWLgCFK9JZCqnXTEeZLzIVlFcpH7qrhAj8xe/6hawsfHOv2eRQUCkZ19ZT9arMzoVIUL3kYrX
 ofD650w9XjM4g6pA/OdAVAepYq3PJEKnzv9+VDVLSq/jXXvpsZvK4QVlxHUPxk9KiH57bbPfyg+
 lwvLdzASiizy8mViLJ0hwVEQJdRVucYkQnznLwcRyCO5QqwbEBba62W2UNOQOoBxzkMgxCrvOsg
 QF0UISyY7CXaEODzdGFJsSSf5c+rNaKXMPJfiQV0NQY4eEWhf4+7yu7RCDbKQBLHwuH7KT5REBT
 K1zyPyvkKP0mBSF2HplTBptOp158GgNncRRDfWu1xcugICETokIonsmRsgGbftyt2m05P2D35EG
 euAgow/mAE8DIXX635ul2HOK89LV9cFdc0ac2BagePaIObnrnhVH+4YKhpynEnlnSp0rquhOgyU
 SKiEvVFRdRFlPP+LpXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA0MiBTYWx0ZWRfX9LZrDIYopN7O
 epOxS1gOW/JqDVfW7SJywcoAHeuvX1YlBG7fcFoxC6AaJRRD4WFn700C/hkLSBXiMp1amldDkYM
 230vNAfexQauwz829S9v/TRJ7EtUa/M=
X-Proofpoint-GUID: dk2GIImn-KVFPMxbbOVQYd8FnGjqWPwx
X-Proofpoint-ORIG-GUID: dk2GIImn-KVFPMxbbOVQYd8FnGjqWPwx
X-Authority-Analysis: v=2.4 cv=DeInbPtW c=1 sm=1 tr=0 ts=6a742111 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=8nJEP1OIZ-IA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=zW8xuOFVkWB4YR5bbQsA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060042

On Wed, Aug 05, 2026 at 10:38:49AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] Renaming device tree compatible strings in the YAML schema without updating the corresponding device tree (.dts) files breaks schema validation and ABI.
> --
> 
> --- Patch [1]: [PATCH v3 1/4] dt-bindings: arm: qcom: fix PURWA/HAMOA IOT SOM compatibles ---
> commit 86746ff462577b3f827d2ec7f0eb293389e741dc
> Author: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> dt-bindings: arm: qcom: fix PURWA/HAMOA IOT SOM compatibles
> 
> This commit updates the compatible strings for the Hamoa and Purwa IoT
> SOM platforms in the device tree bindings. It renames hamoa-iot-som to
> iq-x7181-evk-som and purwa-iot-som to iq-x5121-evk-som to match the
> official hardware documentation.
> 
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> > index ff8a35df7862d..f244f547d5114 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -1220,7 +1220,7 @@ properties:
> >        - items:
> >            - enum:
> >                - qcom,hamoa-iot-evk
> > -          - const: qcom,hamoa-iot-som
> > +          - const: qcom,iq-x7181-evk-som
> 
> [Severity: Critical]
> Does replacing this compatible string break device tree schema validation for
> existing boards?
> 
> Since the corresponding device tree files still use the old compatible
> string, running make dtbs_check will report that qcom,hamoa-iot-som is
> undefined. For example, in arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts:
> 
> 	compatible = "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e80100";
> 
> Also, does removing a deployed compatible string without retaining backwards
> compatibility break the device tree ABI for existing bootloaders?
> 
> >            - const: qcom,x1e80100
> >  
> >        - items:
> 
> [ ... ]
> 
> > @@ -1235,7 +1235,7 @@ properties:
> >        - items:
> >            - enum:
> >                - qcom,purwa-iot-evk
> > -          - const: qcom,purwa-iot-som
> > +          - const: qcom,iq-x5121-evk-som
> 
> [Severity: Critical]
> Will replacing this compatible string also break schema validation for the
> Purwa IoT EVK board?
> 
> Similar to the Hamoa board, arch/arm64/boot/dts/qcom/purwa-iot-evk.dts still
> uses the old string:
> 
> 	compatible = "qcom,purwa-iot-evk", "qcom,purwa-iot-som", "qcom,x1p42100";
> 
> >            - const: qcom,x1p42100

Patch 1 fix binding qcom.yaml compatible , and Patch 2 fix dts
compatible. So the issue does not occur when Patch 1 and Patch 2
are merged together.

Thanks,
Yuanjie

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com?part=1
