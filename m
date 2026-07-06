Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F1A372EE3
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347868; cv=none; b=LdCBEmVoQ3cFNqZEk0c9KKFrPOvoMMdiZxwGtIxKpjFeKXFDFsbW6mRbKWPFtmb/9ZvBQv6G2IWfsIzhvu1IuJmhCr7HSWuc9mvYulmkvBuE4p1i6MzfWK4SGJOa5hJXVlkXhPXvu60SunnbgA92BxB9/tqxOZfQY9KneA7ADug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347868; c=relaxed/simple;
	bh=RqKk5FotZtKC8C4ZhewaFiPzVOmJRvPjCEVbeomkK3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBVD5gdILxQ3LU+vvyrl4sh4Cx1O02w3jLXKQx8PuqP5lDEWQzWSxrUUjjhKam8RT48loPIxahDZyb5d0l1y8IchRHEM5kEXhePp+IL7qCRsWhMk/Cp1lm+UwfBcD0iCr2QIz1XCD59AqrdE0vxhHIdCdq3empvkumLi2LkqDjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgx7C2tE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyYhxoIe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgx7C2tE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JyYhxoIe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EEIqs616656
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 14:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yXFv2mECvN+xZKWYVmzpDkFb
	Ja59AM6qd/7I+4lCZZw=; b=hgx7C2tEAY+nCJtHgG95o5yvkp5BfksiQo/5UGvR
	eXxcAXeRNHE2F5H22rtuZUVravngGe7Upt8L7nt0R+0WrPurhJ57Q72U2F6VRSJX
	LGdHiV9Kk0Lo7nbwkSpI/RrO4fTpocl6dELHgIFDfx9tZhKAaNqczQjVwNESPaH6
	zGRQFGnkqw9tUxlKaEbnwO7e6RBenFgKJMqh6xSe8rZmV/1h3hQakqLe39NrdqnB
	y91OtPgPCohzPYya63ivbGB0+GZPvnKMj4pAQ3z42e7U4aEKlZV2govQ3VpL5QHl
	sqoYMiADZmBje316Zd8Ha4iDtROsOPcxyZONcXPwM6xmCA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxss40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:24:25 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-96939fcd33dso445643241.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783347865; x=1783952665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yXFv2mECvN+xZKWYVmzpDkFbJa59AM6qd/7I+4lCZZw=;
        b=JyYhxoIeXxB+TWtdmfQnc8Omo7QoXssbUct5kbhoiC8TNpbqPKoMDzJf14bdUp2fiW
         CDPS5Dk7YGmnH8jyUd9PORc98kOPz2+n6iGlrxSJPe6aJVXbto8+LzjKM06gDcmcToSE
         4G03xWhVQ4sdHI3InS1A3Z2jVzmu16Z4dkfV3wT3dQJxa+IWxujAb+Wqcn7nmg7y9q1t
         29opzBclxb1tU/nsa6AWOQ2T7xUx7/imRySQhAqz9sCmyyO3Cxe2MWxc1Y/DWWgPqAAD
         S0HfHWq5CfLVdZ90yMEuzEjOKPb7PUC20ND46OJbWMn85bBu2CBOe44WFIv7coFuEYlf
         /J0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347865; x=1783952665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXFv2mECvN+xZKWYVmzpDkFbJa59AM6qd/7I+4lCZZw=;
        b=GzCvdmgWQoZYn6TjdyQvIgkmSi9g0lmEAf6Mx31Eac9odG1hdNs8rabcaFphsVkt9I
         I25Zuj6nsnGcoSAbpOIZUwluoS5BUhjDe67KdgO16RxpQQ1uF8+Vjo9+xh24PS1rH3Sq
         5dKTgxA5/Df/FzYTu5HCcQdYcKyeRRkbXcDp6UrBl7+vd+AvFEaBO16tQbVukrk0fUf8
         vYLWlKExCdZYxBbNjV0Pj+hX/CDWb42tpyWzP9dsR4aoyNKJfzEsXyrEBnMpFxYx9GL7
         6asb4GIN1mA8NGWqLXDnzmLXicfoz1lMRD6CZdz6KSDMx+L2Xo9EmabQOZaL/dfZ2Pe1
         WX1w==
X-Forwarded-Encrypted: i=1; AHgh+Row9EeJW19d6hl4pAY+pkECd8X5tiXLDS4Lgw6TiEV/JMcddhrOUaKF9Wo6TlrUNrOG7I4crFihacTa@vger.kernel.org
X-Gm-Message-State: AOJu0YwCrW3F0rEng+nWN5nugs8dTuNRCcoBcH7XQ+4wa6nm3gLM+nB6
	UHfx4D1d8bPdymW45gWbzC9IdXppm8NLelej5Z1RoqQbwr1gOX60RwlPT5MKPFJqgLmMT4BMHep
	dJR9MzixpYgnm3e6DdL1+TgHa+awyfyLOLRSFPDR05uYA+J1ch/aweq9q0fLeheoM
X-Gm-Gg: AfdE7clKiDwH4zqvIfHmchokaMDuHw/wK4IC6J5wI6xqS5lBpMNRJ2PXtUtAT/FEq45
	8JTdm6P7ZA+g6u1VgH5cd3MErklOcop0TdqDrfK/g5VuOq5DrdCoktI5wreMZbLDEZ1wIgOhKnR
	E5zomH9fa53ZA2EeBoNzF30v48knscGZ7Cj8IZF1LlNJ5VWvjGpHO973r8i2qoAgP/pz9fBmun6
	sIMrIUmwFGdyhPFq4qQ64p+nGBFDxsPi/xp0pjoDbRkYcYNUN1FkzOCGWcQ0P2mxwn8DitvBwsl
	rM+pnVaWIX1XKZDFVOlAaujK8BiEk5K+Zuy0w4G8KNnYsPk11J6mOQHpJUFzyfPRqRVM9vmaTpK
	gLOtzlI3IqPNfPCmqWENdraajzNjkEUBwaLov0Lgw1hkKbEiEZcJ1VYgSZKuMRgIYvd3K+nHFl+
	6JETT6kPMO524EySMEnUXfMahR
X-Received: by 2002:a05:6122:4d05:b0:5a3:5938:6935 with SMTP id 71dfb90a1353d-5be90743468mr454360e0c.6.1783347864946;
        Mon, 06 Jul 2026 07:24:24 -0700 (PDT)
X-Received: by 2002:a05:6122:4d05:b0:5a3:5938:6935 with SMTP id 71dfb90a1353d-5be90743468mr454346e0c.6.1783347864484;
        Mon, 06 Jul 2026 07:24:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1376ffesm2968872e87.24.2026.07.06.07.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:24:23 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:24:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: milos: Add Iris VPU v2.0
Message-ID: <k7dizyxxj2gk2lyz3ru4ffuckbh4vfw2z4hkn72ygjqouundhm@gwgriymkpg6b>
References: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
 <20260705-milos-iris-v3-3-8c1353530f24@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-milos-iris-v3-3-8c1353530f24@pm.me>
X-Proofpoint-ORIG-GUID: ZPd0MbI7vbmLNKbOGHOUyy1_OS8jewA8
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4bba99 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=_c_tBz_40JZhELx2ZhwA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NiBTYWx0ZWRfX4vY2csIfpqpA
 I1/bMZZ8C+Jyx4u4XQcqf8oRowP7G2g8Ia840t/XsZ/KdIVjdHn699TZZVgYJaGZjvE3BhDT0WE
 LLmon2dzi6/JK/1QCwZHVzERL4OQUfk=
X-Proofpoint-GUID: ZPd0MbI7vbmLNKbOGHOUyy1_OS8jewA8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NiBTYWx0ZWRfXy3c5lL/Mgaou
 X3iiehIQwQh/nwUTVATA2B57xn4X5Q+7L/EaB1Nbu1b83oOYzZz1dWQ7U4Xp8HIsCafOA+iBUld
 HjwG4BSsOe0q4hoCpqnoUtaFKiNYlCp2q8rFQ7BaKlSjPS4f6AbUisgG7It7wMQPYkg+/w4CRDc
 6rzD3kL3q5y00NbJoBRHqwPNhoCBSFvL8Y7FBeoKsA9+JIHxLqGMYccG5iQVBxDHGikVRXgn4tm
 DlqDYhDRvxcM/rXWadK0kPVwyjYQUIgPBFivhEextFk5WuBsjD+S4tgLUuQQTbOJ/vF0cipHzas
 cj59qcbmeF/VnaLgBGsOBLZBUqXd/hv6QSif8xBeNfXxVDJpojAP5NgluKDtmyUKHKqjNLEUwnk
 ySkj4enaVBHpgzpYr7b876wtOkUP0dFCUERR9vlJYKNRht+BzEZMQcwbRtEH7PhOhCZ6Bi/u65Q
 H03jeWCTWeeI6XwdpPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060146

On Sun, Jul 05, 2026 at 10:10:43AM +0000, Alexander Koskovich wrote:
> Add devicetree nodes for the Iris codec (VPU 2.0) found on the Milos
> platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 85 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
