Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365E541A900
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160716; cv=none; b=AsoHC3/RK6aQPuuvgw2tvYWLV3wZzE7ou1xRcuRGh6HRn9H/LQRlxuZJkjnb7WGoEZApzKOcQs8pSJlYGzFhHBJYThJlEhkf1y89W2DIUZKMvHB+MKh5GgPSHXowu+h6fuBGighsytEXUPcLLb4EutHjVqAq0PsWKR1WA0XeYic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160716; c=relaxed/simple;
	bh=zTR59WAMTem5k/i85razqwz30zDny9bvWqtO2HLjxVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JedkcfKEagYbVTlq2TLi+1qZvulOaWylqehXRU+npaddSxTTm4QcI1ak78Xuo1Im8IfuRxKWjcy71T3itH+1S3mbJZf709DwdYyCIGepxCjTdq93vG3722vFoy+Nbxn2f7lb2yAdAUwTAaNZOm8TjKGJeanQTlb7emtr3GC4jSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0gd/pdL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dOF5mcOL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0gd/pdL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dOF5mcOL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlhq43895728
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u+7stY2hW2TFBhJexcpx0/1A
	bMcvQRNAHXeVTkGXnFM=; b=G0gd/pdLn4ZtxFKf3zRSL0+Ci6RNP7SuVivW7u9Y
	wXLY8PHJjFkDhOA6UI+OM5XxNiky4gcb1x5upniz630R5ue2QFJsTq3XFWYulmbl
	OKpU+oUrY/B33hoeJ0bygWmia8Ys8n19VuC5M6qO4ItfrkIjSnZk+5m9Sj4/FeUr
	GWkLeezgIT/5x+VmHkM820TIJl5BL2SJp2SjhDsKZ0IiSg2egnwHU0haov/e8gtY
	ZODveWvzl0b2EzJB8cw0VysdxjXLnmmhBf54Y0zclHVCNLt75f4NZC7nxNIr5cKd
	lgays5r6+1rzHUjdiTdEZSRtNgvXYA6Gv5Lq8CyHJKmH5g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs2vp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:58:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0e702df8so33533301cf.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 06:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160713; x=1785765513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u+7stY2hW2TFBhJexcpx0/1AbMcvQRNAHXeVTkGXnFM=;
        b=dOF5mcOLJZjnqfHcehaN20bicqZ+6/H3irmgOi9AR7OVzxArc1Wb8nXZbl14RNGOZ3
         Zqj7asohshlnQNHgbVg9pHUGh2JDFIJHKOWnH4/gIC0UKqKlZRdbNarohVAJEanSCWWX
         UTtSzdWEBmYp4rPOdFsAdLbaxCViSJjUueMpHCp2XogUCzgFRcNW502nsjwo1im6Tc3h
         JQrFfvxM0qUfYhCOVkMhfGq0KA93uVMlvjzdmWnriohCzKtYSPkE7ZLr0LiLOu9ieL74
         H4g/DXw93pL6pBbl8xzBALjotvsHC8p3hYEJmzgX4oJbK7JjZZpFKHj+rOseFLvk68y9
         2BKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160713; x=1785765513;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+7stY2hW2TFBhJexcpx0/1AbMcvQRNAHXeVTkGXnFM=;
        b=LOrkyJA1/7oY9a5URt7HFCTtJGK5/08tjWapC2bG7Mm+cFZfIPft59BuyBnobbWtX/
         4UEou5SuJtsZSIVxR15PxdrIwY0h8wbbOCruh0hqA8BQ2vwjEXquqBleMsRsd0ulOyxX
         4a5S2gqv/fF1xaNOjfIbw+MliVmK4BCPrNpJmgDWPAlNA0jzzyy/LY87MJ/od1Dj0LHP
         hdO8hq74l5iWCI1dNWHaH1O7fFOo2kr2jRDXC5hmBKdWiaqtsKWmKP3XqBHLPdNH5qBm
         Y4+X1QZ/RLqtGB5Ngp2K0gmVgKUTxoj5I801OmrpmCKKal2oEAen8+ezbALsd0BeTeCN
         N8xA==
X-Forwarded-Encrypted: i=1; AHgh+RpeKIfSONqgl9XtIHxC0MjaFW9w4rQvNQjiCXWfelYcYrkGcN2fVzEOiBNEr918Qc5/F3jITWz+qy/+@vger.kernel.org
X-Gm-Message-State: AOJu0YxmLQsJE1imV5sRWLSikqykiOv1VJaGzGFgy3VTkO0miWJ1DWSi
	7a2kZffLHYuhIlyNg7sWbA5TEykj1fU+Xy5oiuIjJ1zc2kcJ5q3foLcA8i/bSMOPYVKBxVyYhKW
	cnFn/WX1HxOVDt84eDGGSR1POvZRJWJzCoTjHYJraxIjeAttjBgB8wkSl3KXafrsc
X-Gm-Gg: AR+sD120Z3ozKD7ta1yx855uRWTZLw/eFaQdAj4KIgEDNQIwPmmzSk6+tZLWOZ5Jm8m
	kwdTB2QXhPPDaNFDHZD1QiX9KSRJz4O9P11lXnFYjg2dARh2DoxDS53JkUN9ar2uI+KFHe+Puk2
	7AgVzUE034f4lB0Tx2MI8JeBKlFEoD/mNaFEe/K7GXVotBpFnN54LeTI2jLFdLXsGW4hzLoczLJ
	tsH0+M/cwEQ+mZv+9620MPe9R6zATT5KfAGJCm4cSSAIWbhQDh0IV+A8rb0n8R75DPFuzir6D4l
	gYKucSXxVVd+q0G59gsINR5U1N0kIl0xgjbBgIg6ZtOwL8GHLasjMmaksdFBvKzFE7FMK67oRpb
	NWGAfuGHfMHFnWSM=
X-Received: by 2002:a05:622a:5a10:b0:516:d955:ea6 with SMTP id d75a77b69052e-529a8360693mr87559511cf.14.1785160713438;
        Mon, 27 Jul 2026 06:58:33 -0700 (PDT)
X-Received: by 2002:a05:622a:5a10:b0:516:d955:ea6 with SMTP id d75a77b69052e-529a8360693mr87558791cf.14.1785160712746;
        Mon, 27 Jul 2026 06:58:32 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bdac28sm48156415f8f.16.2026.07.27.06.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:58:31 -0700 (PDT)
Date: Mon, 27 Jul 2026 16:58:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] arm64: dts: qcom: Add Kalambo SoC
Message-ID: <j2um5hoha5js7aatspkhuyt7luh4tecvziralqi2hyyvuqua7e@k5uq33cb4l62>
References: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
 <20260727-b4-kalambo-crd-v3-2-25280faceece@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-b4-kalambo-crd-v3-2-25280faceece@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfX9IrwqBZnKzUO
 /po4G18KRvr6w7oKiEJU66x6Opzvr47MA9ZxSFS2yaHFcDplR+nZXHaQR7wRCa6DeaHHDmkqeQa
 RYHRCdSEndBt4zF6LbcAfjyolPHOIX5ZolDqz4t6buy6sLlU/nTrNymZhz2Z0U79obgKmrjFpA9
 skfaTp/GN6WY0zcf9Ly2hAdPqljvUQZmom0N+aukuBSmWRdBXAIZ2wML5BnwpWutSWb+ndls5RV
 +xuN7YRD1OfoYO2G6qSi7zg0fWrozPq/Dl+pGIe+qGLkWlpjMnWoMI5XSNgw4jJ5XFAp/AYAEOK
 7wNV5ZSBR2OFWU4L/gvoAfZmbJtKixM1S8bfmu6nMSqPO66V3g1skyL4h4MaRNC6l+e1GR0stCY
 FYlSAReycqOYn/sw90StZJWwDxqNqK/TfIQcdLHi9uZhwaat9gWAnX83lojVZjSwd9kRN+J0DpX
 8CviGiTGjud9aNbMnrw==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a67640a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=EpawiZA4NEOSy88HQ8IA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: IvClDTtYm-64FcmNU-DFWvDeZy_pQ2rB
X-Proofpoint-GUID: IvClDTtYm-64FcmNU-DFWvDeZy_pQ2rB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfXzkRTOKgbEM8V
 IST2+Q4KYWX9ni6IEDiYdUKifxWnRo5gthP3IRd2wKLjpVEEE/6nHAjHekFThJoFACI+TYEQ7zX
 ijbIuexU0WWLAYVvNNjUueykug0smkc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270133

On 26-07-27 05:51:39, Gopikrishna Garmidi wrote:
> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
> with CPU cluster 0 removed, leaving it with just cluster 1 (cpu6-cpu11).
> 
> The surviving cluster is re-added to the cpu-map as cluster0, since the
> kernel stops scanning at the first missing clusterN index. cpu6-cpu11
> are reassigned to SCMI performance domain 0, as domain 1 is no longer
> present.
> 
> Kalambo uses PDP1 whose tx shmem (lpri1) sits at offset 0x200 within
> imem, vs 0x180 on Glymur (PDP0). This pushes the tx region end to
> 0x380, requiring an imem size override. The rx shmem (lpri0) stays at
> offset 0x0. The PDP mailbox addresses are overridden to match the
> Kalambo SCP firmware.
> 
> Add labels to the cpus and cpu-map nodes in Glymur to allow derived
> SoCs to delete and redefine the cpu-map entirely.
> 
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
