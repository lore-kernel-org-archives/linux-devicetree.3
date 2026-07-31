Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F864052C3
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498988; cv=none; b=JtRmBmg9GNaR0hC1XnDZfN2Fe+NwLEZalM3W45nQlzlTMBKoK88+jBegC6/iEXfqbn9YF2HpToyyKD5sjCRICQCUwPyL1dWbLv72NSiwInUyvvnPgk0/jEcM5YEdVgzkNMskMfFu5DoLB7VtHU0gQQJmvAhjtlqqYmXgK8Dbr14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498988; c=relaxed/simple;
	bh=ZztRHiIAVKF+8jEYaeYDQtQLDTlU9pwsjGZiENaMr94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEyN2gzDqPSgyKsEF9ZlyOD2bwBXlbbJvoxD0Erf4HKFDUM398k+Xy8R+TpLzrsv3SkWKsnJt+EHccFmz9l4tkNEbhRJP/eJ61EvCsAqW71liafvlpmuBeJL+ZCo2MzklkXbNSC9SHFUS79Mxvm0/4H6FSDq8x/fn37jwz+vH4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z80r+B/z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhMVXEaI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z80r+B/z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhMVXEaI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBgfSb3797916
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A8A/dgkDSxTCKAo5zheB2WNS
	Qb/pN5sTWD9PkNiUW0g=; b=Z80r+B/zppKvvO1Ihb3XX5b4279Ww9NVcPaG+AIa
	JU4UOZHqS65mylLkVvQZktGNeFUyQiYPc/eIeaqeDMx7Y6cq68W0KBZsfzlJtk7T
	k85Ig6Xgf7olFoSCF48K8FloHKiQZkHb0Dp9p1K4qeEfVPOSfiu0E9hpbFn9q9aG
	70e4RjIE9D/6qFt8uYNmaFNCnLlqCmiOzkRyc3HPcwtrn/ZBVn6GRw4xyX45K1YE
	butLAR8QYmyowvmRTyVmXWF4iMU7/X57ALtNiA9OcVJRIT5BQW4MS8GdYlaNZvmD
	N30p3OfhfOynuzghKnDgw9keXWG+pBn7PCxMUa4YWnHYng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru2u01c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:56:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c083f1818so9081931cf.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785498984; x=1786103784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A8A/dgkDSxTCKAo5zheB2WNSQb/pN5sTWD9PkNiUW0g=;
        b=XhMVXEaIQsXdujoO422JBpJmkAkAOFzLPm/2l7EbVqZlWQwyjMBcgcii/6pWr3RXhs
         eZcIwQLgI3wxsnP1y1IqcAiBEO83dwczcheGCGU5nGLLjQik7VYNU/DZN4eVMDQzr05y
         a7DD5pSrmMN5sAnjs6y2J0LmwMBJI9ZNpLMUEJrGKHWPpG1QMNKT50JU8+YfpXrcLQWm
         Lki7IQhKIh5Z4YWudtCUJCOxHLWPRIfjFOjHIo/UBHlwD1/hrg2R1HvarPeWlCjNWfNs
         ceoGQLR+rNA0vMh4os1T3JMHXecdRwGicDJtjUtc6HlXQu7au2fncRWzBGsIRcXMl3Im
         vLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498984; x=1786103784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8A/dgkDSxTCKAo5zheB2WNSQb/pN5sTWD9PkNiUW0g=;
        b=sl4Nj7x+wDVjBpocpTO9BvCH+M3yQnEYvEU8xmnbCUaKGwMkaw9PHZa4RXqVEdE09U
         Fm4Ip4K0VvMzCyG5dTkL/AnbH+9GeL0lkl3bz0sQ6GYeZWGBgB9UnFZnjIqgFY6xORcr
         lRsGuj79WFxqQUuLK8SlJT575fEt8CGCfqPZlusipPXftpj/ZSA/3dnV07knxK7PuG9M
         UjDtzs5NRhI1YgxnmLAKTpzMbJSzWP1zzInC0JPSWUfEGNgQqNLhSMyDwaNYUWZ3F4Lb
         QHHk48Dlm0F/FPGrwBhYpvJGLY0tDBe6gdLj+cj9G3mij+XEgLl7g3/O1njlL+5g0PsT
         vXnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUdH9lC8wn2bahLOWGH2LDCIoFfdAuB9InMNPhNO/tFr+AuL2RlNq6ObRlf423YWsjBUPIeWV5q8M2@vger.kernel.org
X-Gm-Message-State: AOJu0YzQmayyFI6fHExjs0AQcCetU5jwBo4nP/F71ElBwDRzxpHiLGls
	ycVjV6dvQ0tTZ+qonS71zfeQbjecHe/4OUy7grLDjlL0kC0eaBKewKThTew9h54zseV+BgnvVTz
	3vvo+zlnUmiEKdocLkTejMLM0YQf6u9MO3PTSrDsKQjFCN8NKDFfPiKn3jlr+wttF
X-Gm-Gg: AR+sD11BVRYXgRHtF9fg6V8mUI9WjBLoopgrrTMAvpjJJTvoz/Rog+gGnM4v+X2K5kv
	qnx43vEFJJW8E0yLTs+u6XgsGaGlSgsIw3X9EHDqqbfvUsG38hKhVLQPAkKL7Ks0ntzZATQjYCf
	XMFeA8dWDB382N49DCwRyFe1mg/2YuIm4HpMgSBaUnK4AVQNlfV5iKgZdVP/leDEKZxQFKTzOs8
	KOkqmKWP09Ges9CikKLVTw3xSoz+LJOXZYCAOHI7+CxDVMqikHNraq/Y0qi0XVnHeuyx7ABm6Ln
	2R0IiOVNFn/F5MozlGQg0lXm+iVMvftbTOoQq3TewqG8P0Ny9P1GN9YID1yoanQa4psByd+DNp7
	Wqxav/ilRyDMEfKc=
X-Received: by 2002:a05:622a:4105:b0:51c:a7b:f730 with SMTP id d75a77b69052e-52b4afaf495mr23885201cf.33.1785498983637;
        Fri, 31 Jul 2026 04:56:23 -0700 (PDT)
X-Received: by 2002:a05:622a:4105:b0:51c:a7b:f730 with SMTP id d75a77b69052e-52b4afaf495mr23884711cf.33.1785498983165;
        Fri, 31 Jul 2026 04:56:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6besm4055437f8f.22.2026.07.31.04.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:56:21 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:56:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies
 for pcie3_phy
Message-ID: <ln5gd3zo33z3l2xsnciq2kxpxc5pqkfeltleyucv4iktdlta4j@tp6y5lttmfhy>
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-4-65c8469c6b65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-glymur_linkmode_0724-v7-4-65c8469c6b65@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4A-EOF3sQKZaPvrUubNdoH9_Swvt2aOL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5MSBTYWx0ZWRfX6Kq4m6obINUM
 n3teaotoB7cF+R4M0/xN/YohEjQaOqZ1UwRQy2c6rgExZiEGemQuRfwE6PDtxfIoUA9TYdFqODg
 BvBl9koXSJ277Y8DDcz+gYgvSY09Q/3HLv2UEjS6y82Vb1Htu5eU+KDkDXqb66GyHL0elxayItj
 uEoNqHIucYGjSsPU6tKPJZ7RUZY1n9sk+HSkTEFgiAFwVVAwv5SGBrxXcsJJiTQ9CGPh/pOgdgg
 QCfnb7AcpVpYKPM+uoMthT00D2oWwyT+/b46yMmqoX2NKMz7c4U/ZhfpwXfY1dZcz6W68gXwpnf
 C18/tcd9ZuqROdl/xs+LbzFa7n9YOqx7EzcmTH/lR6Uj1HtXkJ5zpxhZ/Beou/cY7uVxF7ObazR
 /SSse59Rf/kHJgEh6IZf2MqaJ49E1RSot5d6t+tt/nIb3biygu4W8c77lOQLaAD2K/v04Tu5TFP
 l45vz5z1HNStz3Z3b5A==
X-Proofpoint-GUID: 4A-EOF3sQKZaPvrUubNdoH9_Swvt2aOL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5MSBTYWx0ZWRfX4PKYbAN4t3be
 pG6tKCs+VMDDC2XnxhO0ckh9YwyAMZ9tO90z4pv2D81ze9eRo8SyWZG6yBOd63hUsbid4D1tsko
 wpfDnJtDKicgqGlHa9aid3LAMnuQ1WE=
X-Authority-Analysis: v=2.4 cv=b+uCJNGx c=1 sm=1 tr=0 ts=6a6c8d68 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pZ6eNVg1DDkEi6vEKfoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310091

On 26-07-24 03:01:22, Qiang Yu wrote:
> CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
> board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
> vdda-refgen0p9/1p2 supplies for &pcie3_phy.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
