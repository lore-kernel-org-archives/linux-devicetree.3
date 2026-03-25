Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD21401486
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 17:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774458984; cv=none; b=ADxh186EVmF/NDqOEwKJfa5CUObfPoTTyfDH+DYRzrvYHbeOnLeT65hYNupOi0bTjCUfJ7b9RAsMTEHotlZR5rDIN0KRci833GQiRY3c6wLmFMnFUUzpiqRmStQ7I6ROKtQqbKa1pz/a6ux7yfvCjCV4A2pV2Wp/CSNEh9Y8gRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774458984; c=relaxed/simple;
	bh=s7BC15FAcSXpNmRg0NQy5DAZvdN8Iq3//DUj6I8VTvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSxDzdGvPRQGWzruwt5z2tGBN8yKnawmiuGwxnQMHRPMd70Dss9kc2nInXxRwS/EGxvL1uQbIEaum8Ka5Tj4A/9lLAP9eRmHZVLnP6i+QF2SSVg9rZ+mnzTURn2j5Nnqp1OEQnVxpZQWEIFEeeRq68tqM/5WdxWarZxznKyoopQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z51ZTt4M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BI3DhaKt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z51ZTt4M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BI3DhaKt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH7eg2432173
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 17:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aWULHrPq2Zp+GR0818/GXpBi
	5WDUAT/xZEzB/ZurXfI=; b=Z51ZTt4MiBxecSM9q881uu4oxUyJpenk1Ur7RCAp
	WBCo+bM5ERXuLVAGNlEYXrwUD3qpr9OBw13w70gvfa1WOQCrEt7MB9uYfXUiAl4D
	KhV7RTe/SX6KlmpQsaESRRuDn6zCYCyR+uOrTREjLfO3cH6mS/qtLgQXfiKuUpkI
	Nq0f2L3xqQznTBQCRjalq/uTCHYkuOHTVAJlckhM0nBYAQvF7g8IrPZ7+2uB7AJq
	tYyqhMK73FOWs4R2pHH5PoMYKA4kA62xzKteuodFSWZyyl6kGkr5QhOlyH+YlH4Z
	6yuw34d4LxcmezpsgEw2tLTwzO5+8cG6FKLQP4F8I9NPLw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mjuwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 17:16:21 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56b953b965dso381975e0c.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774458981; x=1775063781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aWULHrPq2Zp+GR0818/GXpBi5WDUAT/xZEzB/ZurXfI=;
        b=BI3DhaKtLi+lc5Rx0uz03zy9Ve7Nog9FKD2zvytY6V3q1RiKH/byu4rZ6n0qr5Yz/d
         0suaXw9MmZMgpwsxicmoq+YE7T2RKQZj1FQeBKtWYqEUW8284AGE8sd49zAePd5ILQOZ
         o3JcgpFSALCjJID8E4jX+cI3g0+O0rKeWYNbykI+LSUF5JU3lhFkKo2kiAad7uSWJUym
         kfFQZgfYAYxcNQhlVSflpeIyQR45IuRykJ2Bqr4Gy+TrTs3RTsTwiD7Pa+LC7G36iu2H
         /cg11CmgEtItqedm2VrzJxb4yao/xPpx/L9bq49FbGNBPhi6i3eKVbbbdfG+BT7/vrYG
         GO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774458981; x=1775063781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWULHrPq2Zp+GR0818/GXpBi5WDUAT/xZEzB/ZurXfI=;
        b=e+AsxHK8icS7FthAhVWRCrOy75h7HgPQjoQfY5dYUV3fBzsDEEAPpu+XD2fr1hCEIx
         pm1jMxcTPhU6GG2ZF53RBn3jgnw4ivpENqvthq6XUmeP7QoGJw5g2qfHW5jLqkKWgDhX
         0Z8KaS0pnZlo+yY8Cjm0edU9S6uXenmkUdfYAp/XzpDGIMuFpfsAIVDqvapOPGBgVoCo
         HAqgNz3GMCHC6JwzTIJfPQBYWZ98I0KECm0nE1loxvy8fimadukUiKKJrC1B8F09LI/r
         zzaoNNdLr1E+rCm3Z1A/U1ZeXg4tZxDfn1iPXDNRDmeaw4eR9M9dQi2CNaFsFKckkuZl
         OMnA==
X-Forwarded-Encrypted: i=1; AJvYcCWEGHn+citEVKwfpNy0Fnx4rNyy6Ty0glU741QizHN4oaqv5a8V9W8wQ++nQx3P+c+oox2tFDLyZlzZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyemtLy1zABL8fmBVyk5At9dbP/VJ6X2QTS9bUilzQtxOZp4kPf
	3Xk/fXfM8WblTrjyfkgrYaQ6rzvbpcbYPtL5KYHBgCGU6+ANyY81kg91Ydn56yfphcNvLyoALrm
	9E3TOCRx6LQQOAPONiNPm/+gBYDMAMx5HAfnI0UkwJ0aT2nbjGW1iL2MTeVTuTEtc
X-Gm-Gg: ATEYQzw3LMC7Nb3xQcQ7jwlaN5G2pgCnzHwiAF46TfzIm6eE1VgbXnkVvw2Qeg2KFfL
	F0VYE99Y/JKVc3iHkoark8YvaPAcmGguJ/DHkpBAon7sQkNon5YYo2xS9KHTjermVvGugw6Z2ql
	61j8EnZybI7pXbJII4YjTUVAoyHIUv4iVkYg7QKSrQqHqKLGImfsSASdXNfymOFI8HJJg54KeXn
	n6vXXQtpVdc0Db4cInK16eoDlQID5GD8JNAbB5EeJrshHwwUNOQkzZvFj7r7IFetSSmgXdI/ViZ
	fRF8zLNsIFqxT1z5vCt+/yER391skFSkkUA746uYLLQT+2ItHLcwvsUvRLvOb5zrw2bT4f7h+Hg
	yF4OZXiG7mIZAiBL6zWA7ADvmXcBqaxeNudRhY+j8zW26b6Op1xiEbgi9JoCWnb+u2rBuGuk=
X-Received: by 2002:a05:6122:8ce:b0:56b:95cf:e9ef with SMTP id 71dfb90a1353d-56d220e05a4mr2363647e0c.16.1774458980877;
        Wed, 25 Mar 2026 10:16:20 -0700 (PDT)
X-Received: by 2002:a05:6122:8ce:b0:56b:95cf:e9ef with SMTP id 71dfb90a1353d-56d220e05a4mr2363594e0c.16.1774458980430;
        Wed, 25 Mar 2026 10:16:20 -0700 (PDT)
Received: from umbar.lan (87-92-245-163.rev.dnainternet.fi. [87.92.245.163])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a068f8a3sm24872e87.63.2026.03.25.10.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 10:16:19 -0700 (PDT)
Date: Wed, 25 Mar 2026 19:16:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: mahua: Fix mahua bwmon
Message-ID: <xj3zwkrc5fihmd2arc43cfoe6zbdkou7kyd7ihjdfxu4ywdjln@fegzffxuq4oy>
References: <20260325-bwmon_fixes-v1-0-9433f9d4c276@oss.qualcomm.com>
 <20260325-bwmon_fixes-v1-2-9433f9d4c276@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-bwmon_fixes-v1-2-9433f9d4c276@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEyNSBTYWx0ZWRfX5P/Db6tLU3qZ
 /0bXmAqEQHVwUj3n2OCnb4Uf8FAdUwGvI9xrlhUMRWosMVyBMDOA07HlzWZAd5xVJIy1Ns4HZsm
 TPQGXuz3p336rcxsh+BQdxX0o5pCtBfnpw6rs2tT8JdbJ3oOOgMf4oyI5oHM7DnBlymawXdrmhc
 oJR/rFfRoOmP9aDpNOHnYufIBzrjYbMEZSKO6dvFf1KUn/8hjj20BTTy/ipUUbbSY2wQwBsQRCV
 c5lVGqxQL92JiUwJcChnwgeEXnHJhAJgYdubS7oASyOqHmfgRvS+dm7tJ8UMB9aTjaNrILvAZuZ
 9/yDKwE8SbdqCufF0s+zD+v0THR3M9wCPwLlFdsY7G8yf/bYrNwBFzvaCdNwcj/czg47EQpr/O+
 gFDere3qYpqNYn+k40wMwp/ns8yazH/L0B9SxSuEckDYVeTbxFKKg+8XztXme29J9hBkwHlpite
 +RZd9e5tDLshaPP6WfA==
X-Proofpoint-GUID: 4FHH9-SzgYItqIHHy07i4_Uz1paQRBdI
X-Proofpoint-ORIG-GUID: 4FHH9-SzgYItqIHHy07i4_Uz1paQRBdI
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c41865 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sIzlR-vGjuHj45hqLcgA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250125

On Wed, Mar 25, 2026 at 09:51:51PM +0530, Pragnesh Papaniya wrote:
> Delete the bwmon node that corresponds to non-existent cpu cluster 2
> on Mahua SoCs.
> 
> Fixes: 598eedb21ddd ("arm64: dts: qcom: Add Mahua SoC and CRD")
> Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/mahua.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
