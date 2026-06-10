Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDE83AB26C
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096249; cv=none; b=bahP8602/gIuHuSsHsN8tLYfrSfOqekUR5fSPW/bUWFK3fo0HzXvSl1L4lmzQTyEjHNve0WzduQyCct/Xq0gGGU1rsoAFFK1IrSUGJQ3V3z7ndoh7sxoZCETya9EelTd7TOJd8WPX1ILBfaf2V+FwxRQwdHVqnl3bcNFJWEjYl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096249; c=relaxed/simple;
	bh=QD3WnmuLmGukCoKcO04lglZG5Y1ZJY1GKUTjmFFLudA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvSB/QhfYgpSFqAplzFkfpeiW7GDL6Ve9SaccuU9fu9ZzNPDA68YVsEeGWviWo2P2IUqZWISw64x22pryk6oaaEh3hRdbhPpdGq6GZgqOvVSzACMNTbd/ooc1+vfDZNYDZTlucM52Gj15DYMmHaxhYJ0zYIQ80QRuUmTWVZw1KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jE7mQZsb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBRlKt0F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jE7mQZsb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBRlKt0F"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCNL51554809
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uOrsbaLMHqJWodEJznlZ6hZw
	bpwVVgA011Bf8C5Tqrc=; b=jE7mQZsbQzcbu8dgTrMBDso/VAZe9hU8xLajFkLE
	OPRJ21TbJhUpKrF8UcU4pHbsB6OW+ugaSHUMYMDqbUyOzRdR/Zimd+LI/sWOSgbr
	3Ngm5RJ8x3m9b2XtmBneIsocS4ZgSGOwWU07hkch7AlYQW11MHdLQnCEsYnuRb/p
	+0lxB2fzJ/Lw7n3nGqkPWe+u3MFp+adR0pxo3CEp9geWvvU0NVuzuG/d+T1Cdv3R
	bCUZT/lxRhvOp75gZVIybzvD+MAT2xDFoj5m0fY28/Bu/bew9N4J4v9WfNVdpM+X
	CqJ7DrTtjvhYgjLnvquxvNMrVT5DjdX0TU1yXv5iwefcNw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnnthk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:57:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso84220161cf.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781096246; x=1781701046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uOrsbaLMHqJWodEJznlZ6hZwbpwVVgA011Bf8C5Tqrc=;
        b=MBRlKt0FN10u5sa5sdz1japd/fwUdjrUqXRncGfRgZ+SVz0mWj60qZ8jGZlathPP88
         /OZmN6QyRdlmCN84qC0wP1dJvFaOZNVS/WybZ7xedkbm2WEbok4MPukVvXoItdWAaNuo
         f4JiMS3NhBkzUpx+9UbfDVaE+z2jsroq+adm+QNHYT/Rv+kWg2Bg42XILx+lCH7gFVOe
         kCPpSZnDHYAfEGtNBpe83qgvmgWdcP99nC0bt5iNDUR4xXiDTWWBMlcpKnABKGlVsZVr
         1epX7u6i04OCCD7KyHtcYdJbIxtGWW5vDPKTQnZhg+AUp8PYJLkFFJ2Q3D3Xxmd2Xnc0
         sxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096246; x=1781701046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOrsbaLMHqJWodEJznlZ6hZwbpwVVgA011Bf8C5Tqrc=;
        b=gwXOU9zdPwVtmxbU+n40Lk/akqjTeEn/+oT4+BkZOTlLpyOkgkFsjpxmfhXIOnOUpt
         ljHovu1ibAdRQ932aNHAtJvQOvK99R+MtU7rGfRhmoGkpGCPgcjsNfMofaV79102uxdY
         xXCOrXNaNONtVM6lMbQ1HSNbolzOXxJKgQ3qnpaxXEyxBOyuOPvp7pAA5elWBuElywZn
         jG/m3weRugW25WC7eMKD6gOKT45glTQArqqXsc26QsUS1XqcBVrzQ8HOQtFZYbb5LMpy
         MRo3DPKiWbZrYRiSolfhAHrsCSaBmnfupjgO6r+sp2a7ZXHKMf8NtnASyblEjIINOFpe
         vwAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0hGqMqYJCp9S/jbOC4WO8bENwmajCg0KFz6tLP0QgGuq/ZqdxAHcfpMh7MMzlMrb0NAZde4soUT1k@vger.kernel.org
X-Gm-Message-State: AOJu0YxB8n4lt20prUU8Do8SO6aFD9tIgt0jYtPJoxeaGuGuuzfzcXYE
	QuIGP5hD4aCHjre+mQ+reQGS/P0aNpoC4Lv0DOsw5RTOtd0Fda8+alwdqceNv062VUediRMC7Xo
	0lQlidBnHL7+IdJZE/4lzatIy7NpxM4cRVvvncqHk19Ux0aE9BijTGWOfJ6JF8RIOOw3kmv+m
X-Gm-Gg: Acq92OFHTCAf5Wh3P/Y+szAmqErGmlcm9AIODsUtqSzyBwtGg5zP4ck8gCTs+P5C5QS
	lpI7hVzB5yuqIBC1hyrZflZigOFncgqzs8U2YzNAsklf0j8U+4oBSfUf6XEQHG8iHm+ObYyU3xB
	VY+T7MRy3RnMGgOa9y6ACTeUgO9X9Gyf7GvlLVQcRCp4B8Zqr+qos8PMGPS8pXxrW2rtuth42l4
	2NKfEHABphJhYDUaKkLmLGkPIu4PRLeijT8L/DFoTgfZAx+vWRykm1JivE3fBTgQxAz1bXUv0Yj
	W86g/LKwPtdljOrUiapOxAe7P/8MsRrnIr4H3M2WZFCTgaqfu7XRnJCUiAyWs7VXzzhzU2jRlwL
	pf4C0Z66ednjs7N7U3lIzfML/CEatV6FOQTgazOVazjc=
X-Received: by 2002:a05:622a:1b10:b0:517:9206:10fd with SMTP id d75a77b69052e-51795aebe0dmr347346771cf.16.1781096245703;
        Wed, 10 Jun 2026 05:57:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1b10:b0:517:9206:10fd with SMTP id d75a77b69052e-51795aebe0dmr347346101cf.16.1781096245170;
        Wed, 10 Jun 2026 05:57:25 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm56210283f8f.14.2026.06.10.05.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:57:24 -0700 (PDT)
Date: Wed, 10 Jun 2026 15:57:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] phy: qcom-qusb2: Fix SM6115 init sequence
Message-ID: <r3gwpggirf76rlvk3eulctsvw54ae5a3znbi5czwacd5ftwajp@tkv7axgtle3x>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <20260610-topic-8996_61x5_qusb2phy-v1-2-d7135980e78f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-topic-8996_61x5_qusb2phy-v1-2-d7135980e78f@oss.qualcomm.com>
X-Proofpoint-GUID: SU20t7BtLXkQVlOd9FJjbpkYRKhMeyvU
X-Proofpoint-ORIG-GUID: SU20t7BtLXkQVlOd9FJjbpkYRKhMeyvU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyMyBTYWx0ZWRfX2adANJuGtVUx
 hhsFqALit+/i87+O+3sXkdycOrKbp41AXxxpXwj0GvSPX+4bnvv52D2N4XYo9mDeJIhCJMd50H1
 VlYq2XH6nxbDHWbuUrhL3RWwERY37GvSe4RTExKHzX+SOM5MKNJUOZc/kUXRM+2/eYBrzllxZIO
 Y4UMo1kZBbGvGuIsvRcviVpFZRveyVo7LIzRZ0f1xVPK05q9xW03egYGfQcuO3jEwHJMOjwjiRR
 u4a7ti7vQgvZrHW0+PrWCxQuB1vc7EfRIuxv0R0KbE5sDc9axu3rKvuoo9uYhFAruyk2PfJ593D
 ya3aHpFTdrbFGr7vrOzKMx4Lh0SiwAezVSMkJpqLhn9ttzTuyw7ScY+5fz5ME69FQzWGqZ4svTK
 iRzmuyEU682ivrKpznV55HWObb2ku9hxr9Z/4V3oL+xv4SdCNIoqdOYR6emIiHInF3qit+RKM+G
 xwt8FuI77GMotJcagaQ==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a295f36 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Oh2cFVv5AAAA:8 a=EUspDBNiAAAA:8 a=SC11PsEEbJH5d9KfBicA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100123

On 26-06-10 14:04:15, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> I don't know where the existing one came from, but it's apparently
> wrong, according to both docs and a downstream DT [1]. Fix it up.
> 
> The updated values also happen to match SM6125, which will allow us
> to fix that platform too.
> 
> [1] https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/bengal-usb.dtsi#145
> Fixes: 7756f1d6369e ("phy: qcom-qusb2: Add configuration for SM4250 and SM6115")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
