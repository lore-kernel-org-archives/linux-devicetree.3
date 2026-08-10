Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EA73C455C
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362781; cv=none; b=YEU67lUpHRekT0edCBnALudExhh9O5jm49WXlDjLa1kbZ/klMT3qkNS/mpKXgZ8uCza1mRn8rYtGnAQbRLds1kpe77c9or53nLgoxwI9HOd63/RSXURDpoJYG/hV22Ftemz0qRcAu/N5D0YHLL/9OtAe8YfLtwb5b2KYVpw4+G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362781; c=relaxed/simple;
	bh=z5A7qNBKmK97pO7UrB4UHWA53FzsUZYINMOzb7aSxXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ph74uHgCIsbIoqHaJ3Xi9Dip6uqTry6h7pMIuh0inN3JSz9iuG2uDFiHKK4mUJv0aU9V1oXELqS/UiNEClyuh7U93fZpBSQ46znfqzUFZCgdsHRdGjctV2UfAIEuFWpoWT6s5H+S0az+NGk+Sc+hFFNflX8gVNeRdfboAY+rXk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUT+Fy5H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8yCj3qm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUT+Fy5H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8yCj3qm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9S0PC872458
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ssg+iL8SDOereWInaWw6CzWc
	el7jw2pHpojIedXFuv8=; b=eUT+Fy5HrLeJq2ZwypZXYuNf+sc9CQOQPMJ844rC
	umS9n10T80bn60/06y/atBU6mWqArhreC47WRJUhwVZRtr1zR1aZLwbwixZv7EYL
	xVO7RLPabBr6yfTgflNcyu5eR6oxp1GH1hSHX3TKhxmRTt6Df4q5e7HsoTJ3Gwxg
	xyhf3ei1rRdbuUS+pRlutDvcU+j7mDgUQPgZDsksebWj33Gno8tjMzxZWr6f37HG
	Bh6balEPOoMnkReWyh33W8QFFjjwtY2gl0YqJ0LJCbD7ymH/K8UPOcWsK5kSFgG7
	UEN7A1NftdSFwVg/p53htRDF6fjGTmZPFpM9LXOjkYJKdg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v59am2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:52:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90410c668adso18366296d6.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362778; x=1786967578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ssg+iL8SDOereWInaWw6CzWcel7jw2pHpojIedXFuv8=;
        b=U8yCj3qmZ/AwlLl9LE8DxSTTvWquL0f0JsYxNYjb6gM5JvjketWajBOicKEbCK37xD
         yGxVBCzxFDJBva4q3hGNbDmE+tr8M5ZfMxuTZv2GFio+GhcueaIYl+9pTgUxdxQ0qYOQ
         nHMEVYw8hlh59FZbeCXwzmhhd1Tl8rRUfw4ssgtf34f+npgNDbKxCw3/mKQwa5DVno7g
         +30f/j2HnivxhGweAH1Vh9BgBLFriU+4w2Y+Q8+XskXhmhyU/APHtqF9rj1fE7Mynrk1
         FXxKOqZBPY0gU8nIzMJfVjHXatQMRGTAAjtg1MrEC6AgnNVvuJfR7TjODmDhODhjdCFJ
         jTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362778; x=1786967578;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssg+iL8SDOereWInaWw6CzWcel7jw2pHpojIedXFuv8=;
        b=P+za+iI26leZb8Y7TJKNuffU6Lhm54sIpv8+ImjY+jSI3n7RNyht4CFxmetfv79+Q0
         h12aZyrWvXZu1/axRWMQQeK17jV+HsDKxnv3rlfJKQmdPA8u8cHBeL7gYhsW61x9G3/J
         0bEiHPhjt6220qzyfX1NsqqigRxZD5rtBKsLUiUL0OBJLXXAmvcAchWisZptrDppk0Pv
         S0tSjG/KWH5Zt9mG46fLinVkEVUnHJRu50OLtwc4EPsiORYPt9SEqD24IpAcggQ7uNHQ
         zNCMfhabmGaJQcVp357uIKJYSC84yMstuQt02u1sz81IP+jkpgQkI4wR9mamru0qewRq
         ZkfQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8yb9Czq9RG2mDHJa29j8qm6P30yBvosB3XGRO8OwF+pCUeKo2lSoGMheA2vuuF1yqOPQ54XeraOUN@vger.kernel.org
X-Gm-Message-State: AOJu0YxSAeFTUeLd02OEonaCz43z2Hn0ELtkE4wzWEIMH26iIpk3FaEY
	z9Png7eYSMhxRpgfpIh4ZwdDDBhu6nM847ijY+/fEe47I5uUfQYZcT04vADvjYLku/SESdF1ROv
	zUobQvOYxWdakHK0UJVOBeFLhUEbGWZzFDzUXW9FJ8jCWI5OTJGkhGtAUV3qC0vOq
X-Gm-Gg: AR+sD100PD2hZxLRrt8EJ2Jm62pfM7w7PULunJ0Uqd1LlBRl8jJdurIt3FKbfSnwKpl
	vvLmu3xFtj8kPuCVLErvZQqCBFak58T11j+cnoIHpU4hHmhNULIcm2XifcgFtNoVKMrgENPsRtt
	gvyzQp7ZhKDAxVZDAD1sGPLT/dTWWNHFXhjbWNgMNxEgPqoGTIU49Ev7J86hgiHCRrUJG0IfjAF
	nazKJGKBTh7kJp8egCoH8OeS68d7IpUilx6vDCnLZgzwsoQMJRnNJx8HFoFSvlYb7BN55+jm5KC
	2PLecT2RRONGmsfZA15zTAIy3/i85CMNV35P34NCEQl2MTcPu1FXrwZ68rZ+BnRMk4WxiItYqlz
	M3Vrk2Rxejg4=
X-Received: by 2002:a05:622a:4c14:b0:51c:2633:9ddd with SMTP id d75a77b69052e-52ce61eabd5mr473507941cf.41.1786362777778;
        Mon, 10 Aug 2026 04:52:57 -0700 (PDT)
X-Received: by 2002:a05:622a:4c14:b0:51c:2633:9ddd with SMTP id d75a77b69052e-52ce61eabd5mr473507401cf.41.1786362777165;
        Mon, 10 Aug 2026 04:52:57 -0700 (PDT)
Received: from oss.qualcomm.com ([82.77.85.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800220ab04sm31425905f8f.37.2026.08.10.04.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:52:56 -0700 (PDT)
Date: Mon, 10 Aug 2026 14:52:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: hamoa: Add ICE node for UFS
 inline encryption
Message-ID: <3msd7echul4af2txjfserdbnedh6ukvzxqwiismjapk3odgkby@uoxai4e7wmhu>
References: <20260728-hamoa_ufs_ice_change-v3-0-293c7c6c2ae5@oss.qualcomm.com>
 <20260728-hamoa_ufs_ice_change-v3-2-293c7c6c2ae5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-hamoa_ufs_ice_change-v3-2-293c7c6c2ae5@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMyBTYWx0ZWRfX1tLBSIjXNctJ
 Zrhp4HZvC6TrmPbkpvbmodpWnW8kJRhc7g5VcE2yyiqL5cZQnCBjjTEgRLqQW8klLiGValaEklC
 6ulre1CNyc3GG/XBtG+iUhA8fcX3Qow=
X-Authority-Analysis: v=2.4 cv=J6qaKgnS c=1 sm=1 tr=0 ts=6a79bb9a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=GMu+mMXmPKlJm/I3Pt7gOg==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=SooqmcQUKh5i17ny3PUA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: v9xWzP7R45K1vWjgN6AwWPq5t0QX7Lzw
X-Proofpoint-ORIG-GUID: v9xWzP7R45K1vWjgN6AwWPq5t0QX7Lzw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMyBTYWx0ZWRfX/2slW6X6iK02
 nWJPn1VFehsg3/3lDrQYZhkimuxLW34DNUz5fGu1qnILyBcvoXMFhiV+RGPlOX3AZ+koEWTu+IU
 DD9i5/qJ0N/mWWYLWOiVx6Lzv0gMfoSXIsH3ezDmCkEg9ZcrXrkQaVAaNocNTwFoslFSbjtFkjH
 1Am+B9GmFwOAGrT/wmTK/CjQPc2UCT/AAtpr9P63RNAbzVKLpbd0CqFA8/stkiuZbxRsZAD0WhP
 Q1Gcpe6S7FaW+f4yCa2tn3A2wXbxRtGaEN+JE6GctlPyZlvRiicRMUNPZ79G++yA1TGj4rUa8lZ
 YOPh+h0QQeClp29mT5kfB6ZIlJJdCdgGVVyYj1sWddlyq8+O5eO2kgWCHzvrFTQdn4c/tvAFHCJ
 QapAyi43g0m7ZXx27dYrnzVWYZlQB55ARZHnDxV0hfN/blCecHzWOus1vFKLJv98qPH9dgH7KEV
 MBy2v6zBF+6JsYV0uhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100103

On 26-07-28 17:53:56, Wenjia Zhang wrote:
> Add the Inline Crypto Engine (ICE) device node to describe the
> hardware-accelerated inline encryption for UFS storage on the
> Hamoa IoT EVK board (Qualcomm X1E80100 SoC).
> 
> Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
