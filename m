Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E286A322B83
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625066; cv=none; b=hOi2WUN8gGn5eJB2TW4adcAktf815rkLluXQoWRLwF+7ZFvVTO2uWrVcVNLU5Ag/DCi3rgWEk1kcKQOIEGjbKMNtH2f2JvkER+bbnl7NZyebB4c1EvNJ64wPLRn+RteP3j3HS5quD4oiB0av8qim9yThPBtCgoaGYnxjy0kkgXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625066; c=relaxed/simple;
	bh=/7s67FtLVQ7osFtoNaW8ycH8+kFQQs5/C4IOWP8ZXZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcFiJOJSUGK0vZF23cy8BoAvHsD6Yz1IWdFt562RfEyTvCCb9f/SDKz81249yzhWqYgFBktQUj57rzv3jkMAVgI2/YziKAeQrl7iuqVEQAdTuMCY7gxE77eNowa40AsIzB4rs3M5a+pJOniYk59MxpXczxsFQprBMlM2wdCEvrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ie5es2Db; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvWNyuZC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ie5es2Db";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvWNyuZC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhHh3881573
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c7CY9526LGiuXbFCoaaH0xLf
	puUVm/HTTCcdhq9z/cI=; b=ie5es2DbqHil6kY7e1DqazN+qBWcEzsbfzELW9vk
	DreUr8ECyP8Y8n6DnPKv/bfZlBVQ6YA1LoHlddXrzKQWBvFjCT8DyYFEwYiImMnS
	NyJygDXG2gVXLp4jh8rsu8DHYusLyNAKUPC0OMg1sUoEnnzVYyFpteO4KRynw4aI
	w36i5GhtH+1hpB8/q9f1ukTnFBUW5BX0rb3HtckXMs2qn8k6aKaAG2y41248mmnZ
	zVUHovDFDxTgaMovgVAL1W6xhj8mZ1mhudtk9kN+rbwbkr87R3Y0bNspQHUUW+yC
	mIHx26jRDeR8YOQxbZkPmwsqwEo2S+guaE1qNZZaRLGuSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6kbas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:24:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b781542c1so50276641cf.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774625063; x=1775229863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c7CY9526LGiuXbFCoaaH0xLfpuUVm/HTTCcdhq9z/cI=;
        b=WvWNyuZCuvfdR2HMP+ClWGj3Oopp4rWWNn26kVb7FBLXX+MtY6Xs33mCLorMxS9F41
         OVzTNfyqFr8I+Ejh99oINp942oJTVJX5Bu2ZIb473bBA6Jgdl8xcoNxnydZJ86x+TP7C
         8cfsZrjxaxpZe1fJu+D3eCsy2xR5XrvZJ91dC/iu3Ks/1HJYpvCgslt3CBSxmWnyX8qG
         mEYTyPQ/3X2psjm7i2pQ3rEkjsq/7Wzxuv380MS4M8iPUDUgibc8Jhc8uAiT0PoeD4bc
         P16fUd/igT/paLbmQI/BJMgSAei64uc11+gNKLkDDRP58jvz7zbynT5Zh9eJbBPFuDp3
         CPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625063; x=1775229863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7CY9526LGiuXbFCoaaH0xLfpuUVm/HTTCcdhq9z/cI=;
        b=JqDgNpHI1XNW5r73Wdazrj8+WH/NNQTfSJENRR/jkuM7zJhPis1gXDn8quKjMTjsg4
         UC3z2K4lwRfDpZf0BK53/+1W+H1mLGT+BnSn7RPdUa6Z0ol/wuQqdg0gB02iewjhP9FX
         /n9/euC7rrPRKMRAVak+BNg3F1Q0bPm2q3LVBO+M5y7XFa+fYdP1NHOybt/SLfSuPAqT
         KMZ+HdZweyn49cggCVdzIoOV4Mir+eXb3OXjCwoPpwq8etRdjauCmn2NeTqNJX1Sx6E6
         J9FlfpAGyZoZxcTtnjegpN6DSt0vcieM6gpNHurFYi6rPSGD7f7nPz/afXU23tySzkMU
         9ztA==
X-Forwarded-Encrypted: i=1; AJvYcCV32hpiDKqAbpqhWlSS8xEI24LxBvun4OR+khifuRBSUEaCKOse5mnSoFUnFt7K67iVWoFD7p6SirFG@vger.kernel.org
X-Gm-Message-State: AOJu0YxWFETe0Lib/6E1t9NWy91lHsfTCVWWrjCL2zLtl0qi3jsvA74m
	EcCWvjcwJNyn+1DW3uukVZXIj5BTJdj0TScnDhMM7Xiwwi5X0uLIeucJUBnZZHm8dpCZkXcQd0Z
	Vv9epKSj+b05BS74YrNQ8gJt2eWGHNR2X+z3kWS3o2WHuzowzclJzdHgeUwIfQ/qf
X-Gm-Gg: ATEYQzwbCfHpKqex1nMYBmVKP1JsiVnDlWTjhjVH+oAox99NvGOg/zMbCzcPjP2BLJb
	PAEnXcsC8aDGZTW53Zf9q8GuFzsWuGc6Ote//Kw9FtL1MsEQIjaWCwtZoqRyUtxRk6TfOfZSDIY
	Uh6acABNVwokdm3vCkR0IHa9ZmRlOTJ/7rwDUXcYm3oGkOE5Oivt1kC55g/pujCX3i1vLsJRmvA
	Zxs9ZWJrEWkuCKGmwK5lSkc26hKEw3LSitjVfR0DTyFm+nmjseywkjZr/ZDmV++mMKNxhrhkFUd
	QR56EmNKXaAlndAx83hYGiERuvlrb9uZnrdEJrx+wWLLenpgJTFhK1BCxqz1mRb9mbY3RZHYy1x
	Zy+xQMFvhGoXl8w7o729BCpQe2GTyT2IO4g==
X-Received: by 2002:ac8:5c84:0:b0:50b:4e20:83dd with SMTP id d75a77b69052e-50ba37d2562mr41025081cf.1.1774625063113;
        Fri, 27 Mar 2026 08:24:23 -0700 (PDT)
X-Received: by 2002:ac8:5c84:0:b0:50b:4e20:83dd with SMTP id d75a77b69052e-50ba37d2562mr41024541cf.1.1774625062470;
        Fri, 27 Mar 2026 08:24:22 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725d9acb9sm19639105e9.1.2026.03.27.08.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:24:21 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:24:18 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Message-ID: <gxmvsabqwn3xmqwhefsbcornrdlxfczprrpdq7gvygx2hlcpjb@5stbl74f6ng2>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
 <20260317-add-driver-for-ec-v5-4-38d11f524856@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-add-driver-for-ec-v5-4-38d11f524856@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c6a127 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6SiODLxq02sLjzxsB7oA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: GNYtqnjljJZfGYJ9nh5x5mGZL8F568-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfXyojRqujvCgsP
 YOJVOmJ+/98+1DSLMmt9EswRDCDLA33bS+RNIJhfEXNoIobRApLNNgsNY6KHe7vWzWb+mgi7Uv+
 5SkC2TndhAVkCFPUsuvcaIrg1Z2/1vca9kWmk40loHT/OLZkFIcUR0ZWija0szrTKnRaYbKB6+i
 YXnnxiMpeFxR+wWDOql47aJYuWtYUY9fpvzHdefERduW7dZWYs5oVFui8PRAby4sZWrbEIORxhF
 WwpumZVShnNJFCQ74wnvrjX7Hf4c2ft5DR0cX5SZl5481iIBlaqHhTbeNqmO+rAzowRl95hdQ80
 OU4hfWKOfVvjGt0cKRPn7YDENk/WJ8z/KX6Kv/HFqSpfPiraRAwM+xvDE+1kzl135/G9S9PjujB
 BaK0ioy3rq221JzTQaFwFdcS0Ccir7sBXxaW3zKq46IOwqTsCf47oz1xDQnT/9ckLvm1xHvf9G1
 EOzASdCv7IjenciAmWA==
X-Proofpoint-ORIG-GUID: GNYtqnjljJZfGYJ9nh5x5mGZL8F568-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106

On 26-03-17 17:57:58, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
> temperature sensors, access to EC internal state changes and suspend
> entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
