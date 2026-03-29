Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DD83019D9
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 09:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774778141; cv=none; b=YQJJl6i192PQD1DnrTmqhbyqJhxHHfHhQt1uVWjDZE7q9xhSX5DS6wO6mYlCBd+3FIzdPw1H8gBdp9BAzKVB/84bSwcUHgo7H8xBN5KGXHBefw+4/VI55kZlmzRXPIm6XUrt5RUqfFyNRnO/HdJDxh4xdVKFv9903xpzXLdBXPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774778141; c=relaxed/simple;
	bh=MgyrX3X32LwQJpr1AVmRVaUIPbB1ZZzIme71b9y/2rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4DftmN0SVqZIMte73tCjTDv6yTpsuLeTR9azFsAQQuusqi9BmH09vn31LdBfV9quKi5Ahv9zm+jRwWxASy1KvkO1lsky5PXxos7JVpoGRxl6YVSvwJFgvQvX/mrc6OWHQnlcpeF+vpM3uJqFHQelF+TRUR9VyRL6JzMGEbEk6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBtlLV3b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kt+6iUkW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBtlLV3b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kt+6iUkW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T0qpn13883115
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 09:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rw8dxq+hZXQzCK1jWiqk6nPZRgTVRnpbxtwfDSkeXJg=; b=aBtlLV3bZIhfI9mp
	2bekLikie1sgR/wzSUyAmn5wojh5XF1HuGzYgeKFVoz2Z9O06aE5nznxeEGlmSTS
	nynCImLVO9D4r78rDT2vtx/pWXFhExfoA+M9cvRYTZHepq6zyBI7QOLoHZgZulq6
	RmGnneYLEQeJzn5sbHnPfc6Cq5Vs4Nid6o+VGHfELavMwj01Bt3DR5ioKXmxut9s
	UpPLWeOfJ/A4xEwjr8Bp1qucEiELYsxfRU8gFGTMFUP01BNRutj00H5OIY9+HKkQ
	BtXNJ4LNTCVXdWCiaeBy3m3/ym7SFw3YYS6jd5wEZLk9cb9ZItcvxMHoAq6jJKFf
	SVwfEA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685hae23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 09:55:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b44f7b7bbso109591091cf.3
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 02:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774778139; x=1775382939; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rw8dxq+hZXQzCK1jWiqk6nPZRgTVRnpbxtwfDSkeXJg=;
        b=kt+6iUkWiyTTZqY1llx4TxqEs1qNLrs0xJi7Uoo8qtyulN5mrm2h66DZ4YQXoKDH9f
         n9U449q/VnlP8a0Vq4MyfNSu/dUdQHxcD105+QVW0psGH1FtrAartlkv7Ih9aZZeL4Qv
         hulVH28CEimg5XdTa87HaM3bUjX9TCJJ4TFFI6NwW5Em+bozUakAt1fIg+n7in7fVDjj
         fc6yMenGvBmBE/0R1ryfhSSXllCGPeCt5TMvrB2ZTziiXTuY0iympNB3n/WGxHrzGAVJ
         TqOi2KWmR78IxMF9w+YSlkZOCC1i3F8bwGDHwNNoYcvzQk+42Q044OkzNR6Q7q4Jo3I0
         uNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774778139; x=1775382939;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rw8dxq+hZXQzCK1jWiqk6nPZRgTVRnpbxtwfDSkeXJg=;
        b=nQAkMgodnW3uEQu2knb5m6MiXJKDn5+gSz9dnbKCEbSuV2OzSloXdiBzq0D2tIE5Z+
         bWBVCnyi4BH2Xx59v2fmFpdUQ4AfDOcQ54ODXBhF/MklhkI7ym0p+YpJmUpMkXxlVAmE
         +Y64T3cxKP25CMUE7qI+4t/3phgwqqYRR7vKurXaPVQxX1KbG5jRRQx674iXR2s44xXy
         e3blejwGkp26xSdoRkDAfSyvZ+wfxNLTGI+4vyNGog85C0lB9lzrgS5w06YcyT4y5gxw
         C0cHCaPpZjk1aUAvcL0hnhIQHyTsJ2lVfuQoTHHHxMynOzonRCdZhh2unRmV67UygU+h
         5ldQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa0cirEmViP9hOHAraIkZN6NxWlZ1Dr0q5gyh4sGK9b6WVrbGY2zdAqqWVeP1K0vmuNXkaqqjM4hyV@vger.kernel.org
X-Gm-Message-State: AOJu0YwT8mhiKnWG7usjPUKqgVg2ieyGMnoSbIPYl/Qr2FemA5uxhOXp
	+i4pZ8ozZMATongvpUfgHk579E36G2oTSlkkuBM4PUgXm/J5Fm/lGWm6+tMZePI25CGll8ai5BD
	WX4JannKLWjSHbcL+vEIwp5HkXnaL0Q+xy8vfe4y6HtXdS8B34CKvFR6XA8MkS3uw
X-Gm-Gg: ATEYQzxHkuotT1QpKvePwXDtJyDElu9KOjIyr24/Rkk2cYqJpC73Td5HspgIwYZ0ZhD
	Kgz+3NAeGNphmc38okhLMYxbgHGCQ97CqZaZCDispsFUivj5BpKjFPo5PUCnb35kEX1RN3PnqbR
	H5IJ+kRwRtU7L6yCMKE7R4J99NYZg+J+rjLcriz6XwtHgd7NieyVK/WlFzBMlTFzCUeKWPnBH/a
	JgPD1Uka3+oB2kGHEzIuCBwKCSabUHMSlnRyRQ1AeW2ruWxiQI6zileDzhCXbGNleE1oY2euaF+
	uIHbcliQgxfpaEWANkImtIsDSJ5uO4a1Kv+wybNN2DZFDgNADKzyUsUFaKOHkQ8m6WQ7f2BH/2v
	8g2xWpk8xCBBfJU95YIdPk1mUR0nuBBM6WcGQ2wjX2U56YK31TVTtwzjOhg0rc6NmZBdkbA9mfU
	TSTwRlykz1doHbXHtEkho2M5LwJVhtwFZuPpo=
X-Received: by 2002:a05:622a:43:b0:50b:487c:f3d1 with SMTP id d75a77b69052e-50ba37d3ca3mr123446231cf.3.1774778138744;
        Sun, 29 Mar 2026 02:55:38 -0700 (PDT)
X-Received: by 2002:a05:622a:43:b0:50b:487c:f3d1 with SMTP id d75a77b69052e-50ba37d3ca3mr123446101cf.3.1774778138335;
        Sun, 29 Mar 2026 02:55:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145de35sm950486e87.74.2026.03.29.02.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:55:36 -0700 (PDT)
Date: Sun, 29 Mar 2026 12:55:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: pabloyoyoista@postmarketos.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sdm670: add debug uart soc node
Message-ID: <2rexatr4fb4swy2lgxrvysixjekcsbj4fn5mhy4dcwqzjfzdxj@apwgj33u3boa>
References: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-0-53abd9db8f0a@postmarketos.org>
 <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-2-53abd9db8f0a@postmarketos.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-2-53abd9db8f0a@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69c8f71b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=Gbw9aFdXAAAA:8
 a=EUspDBNiAAAA:8 a=Qxqo6Yx1iAqdIdhPiXMA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA3NiBTYWx0ZWRfXzKVQziPH5Iom
 0E+KB6HMF+3adWUsWpUlOjO3yuwVgjXTse9TcXx99BN9q227mSsf8H6DHfiFNF0i7u+okDPwTNf
 8YI9nNIeZbmIUdinAXvXj3zI9Pyc03CwtHjc6tJUH1/S2Nu+I0Qa9XjwHQ91folGXJ9nMHqsxQj
 Zq3OZ+Tu7eBN8d7AcrJU/q9NbfK3YK/URYz9QZDs14aul8li+9VP+TRkg9hItbOD6hUWJiY+1+Y
 7XyBlOjVX5ivY4A+1FXETZEigzNc5gr9cx7CCEkOo3fXV307x+MSgJF4XZjHUCnBaEvsPQ+baxv
 RUNpojBKBhKiRme72IySz08WIcW7cJBVKhSC9dj3iMg5FgTXrmbPnf+Yn36ppBMAHbBD0/tQd+1
 s+ryX9+iXJxZYM0e3GsDh0QDm/vCImmoaIIGukz0I7vEfEXgyiwNDa/Y2XOcXHyd9nrDbTnoItV
 X52ZDAS+8ILK6Ue2RNw==
X-Proofpoint-ORIG-GUID: B-TWxzoJ5JSts6S5JcGoz5zrkktJzogs
X-Proofpoint-GUID: B-TWxzoJ5JSts6S5JcGoz5zrkktJzogs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290076

On Sat, Mar 28, 2026 at 11:58:41PM +0100, Pablo Correa Gómez via B4 Relay wrote:
> From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> 
> Values are taken from the other geni nodes
> 
> Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
