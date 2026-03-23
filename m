Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C473B3C1F
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279267; cv=none; b=jfR2fWN5FDLwtq9C8edpi5xLBBOkMzqYsKbejEMHP4EK5XzOaWZv/3OqBZSa2dbkhW+T24zSxzIoYnah7r1MzmUn7uIiAOIsljL/+yawwLISVO8Abeb9X6q7TeR38M8BgoX59hJkoAw8DRdFOWF4GVVVGfxI6UvenGqg0jsdDZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279267; c=relaxed/simple;
	bh=nGYPrzjZNMlNg4taQgSi0jKSd8PYHwnflZG4oY0HO8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nN6js+PmhiIrHwqVaJfqPkPWsgObyXJYFxjBZGNoBNsP28e7yJtsBfhiO5lVg1ZxdoxfJCr18NP/xX4thvKDG53ArLBpPw1kT+tq83WGZaMN6IXLKfx/Lp5EtxGecn1EnBuCgaVQEEA1qVSg/IsG9htOb65VNtA4GtfkD4SD0Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LthYUu72; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aS+tYDU4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LthYUu72";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aS+tYDU4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGiXV3589370
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fjYIs1caVgKngRzAefEKuLmK2FwOzhuv6kpcbsbBxjE=; b=LthYUu72uNG8O+4F
	wPvd7B9umjr3WCdY1j5w1725KQVAzgyo2A88kheFjTfMDjTMMowfp14io+OQbOP/
	E308e/zTFaT0dhNec191diJnvCifb7nWgKN3/hopSe/LY2O4598cNUBJgfftawHI
	wPhOy8uvVFV5yNyXurgB2D3pEExhEsbZOZa/MBDZ87bTAUypby84DDs4WldPw66S
	FbGXbx8to3oMHdq3+K0tc5mZHdXsqViLgNJKz/qFromtPpWS9SuNHr/kxNo3X+y4
	UdCJvM2I8VBizVgCuMeOzj8WP39vreGV96yki4LRCpu3Ye+e5op6EbxUSuuWfYOG
	ulRzvg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0g669-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:21:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ff04e26bd9so486946137.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279264; x=1774884064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fjYIs1caVgKngRzAefEKuLmK2FwOzhuv6kpcbsbBxjE=;
        b=aS+tYDU4D0to5hjTziXF5KsuIPmQPBVu6ogVUd6A1q1ZpDMcn/ocTL5GVTFp4rnlLW
         ViZG8KdeNK4B4WIBr9aDR0+N4Y1yj+awVFjBiR/GiAnLvS40pe/7Cz7GGm7BDcn4+1gb
         Bu9cWNybyhJ4N55cMgBL4SA7C8Jr9EPrA4AtxwnCM2QSIJncKmBsa9tL6q4bX/H7i65+
         fD0aY8cAaEIACRex03+/q7VdxyuayssAh1H8wx0wgCwLTw5VARFadt2swwfa2d+oMw4M
         8uQsTKcXrbz5bMLj0Q3ow1O/dmOEtALhIdla1FaxK9/s9d9S//Px+PK43CyJH6HWbHXA
         6KPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279264; x=1774884064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjYIs1caVgKngRzAefEKuLmK2FwOzhuv6kpcbsbBxjE=;
        b=rNK70iEd1DDLBUAbQlFzjMG/vmUqDTkDVM4+VjLekj8lkLGbUhsqKKmd4JlRDGUaag
         2mqvaJiBPNRs332Sk/eSC68R/ngMl2qi/KkvK0O1fuVCQ8Jtq0lCVKtoj1i/3yboedwM
         bKpPXgc177X2ey1YcyF497k4eBxlms7NezprrERetaWz+jUbDGnO4BXRvOfctfR2fVEo
         C7BFW2WdP18XB7tZ8i/3s3aemRD3pv4Mr9UH2rbu6XzQPqsETFbRUEjJ0N2PXvICR2pR
         38Brc0tXoWi/kBLNqls92MYjo/WTGHnh/zHbSk/91OP6bO+dOI0e+TMDtr8FFQoVGSmQ
         AdYw==
X-Forwarded-Encrypted: i=1; AJvYcCVtUORuQno9ALl0MYoJO6vhZJFOgjHKhN5ne9wHbaY+prmr9bRLHHuPqAIq6s8puH5ZvJEAYzWMZqXu@vger.kernel.org
X-Gm-Message-State: AOJu0YyZcmQPRIN5YM3rUdGwYWD1r2kmHr4rNWyjH0LDYtsm1KMXF9pt
	lI955j0anwgYtGwVrOpVolkhx0H50Xv0UYVTdjjeEEuLfLZDenCSBLTwK0AMTbVdvPCiS8m/GD6
	QRdaBYYKi4rY/Qpz8DaQgjilv7AJkKeshjNhEHE6Z26IfBPBXK0QQWsV/53ASrpCU
X-Gm-Gg: ATEYQzwxEqIPzwgQDWU9KN031IYjxcJchKunxJ11AsumFyBHkJCWOqU0aKsDFX4Yvyr
	Te06ZbC6YufgB3SGa52mYbg2jSfoN0I46jK2HlE+6tEblgKN/SEqaNom8u9OCqcEQq840qblKoc
	3D+Cnt70gX2X3+oGTns3dIiyyfMlVQnWEH1X/rPYZ3DYo18XoMxGxpECYREf/hwQ57RKDiAvaBr
	fN+r/dmu+erOrObofw75YMLSt3D1w/+mDRNcgJbzQnVFr3qQB7Dk6aH2DWtSh1j9ScFVPqi2xu0
	E2iyXaeJ6Cl0rwmi71auu1sjdkkp1uZcykH+QVASoYtVwZWt+W9NrTTwnYmSuyiC9paypHbP/ZS
	Msf7uKbbUcBcn6S2IftD/BOKva/svd2ADPz/enZjvgQjffkRaB/OWWsfuudaims3UfLoAF1Yiyk
	PO3/U=
X-Received: by 2002:a05:6122:362a:b0:56b:6a54:1a24 with SMTP id 71dfb90a1353d-56cde40a346mr2499673e0c.2.1774279264125;
        Mon, 23 Mar 2026 08:21:04 -0700 (PDT)
X-Received: by 2002:a05:6122:362a:b0:56b:6a54:1a24 with SMTP id 71dfb90a1353d-56cde40a346mr2499650e0c.2.1774279263713;
        Mon, 23 Mar 2026 08:21:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98416ac27asm384992666b.59.2026.03.23.08.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 08:21:02 -0700 (PDT)
Message-ID: <f25eb68c-3877-4ce7-b3cd-0910a00be30a@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:21:00 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: purwa: deduplicate thermal sensors with
 Hamoa
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260320-purwa-drop-thermals-v1-1-2c9fe046cd02@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260320-purwa-drop-thermals-v1-1-2c9fe046cd02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c15a61 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XhOjOICij2rE6NPUThUA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfX1hzU2ggBtjIX
 1b5Ta0YPNdI/Ry97V2gK9Ltq6Z35AdPaLUj3qjbc5iW10oCEPtcK+sQ9N48+KXlDi5t6e53i9jt
 kqcZhziB5Z27Kyi1IW5PQKJRZbWF21ZTdfao0LTkVvsGi5AWvoVZteTv6VARWpqnziSfIucDN9F
 hLJO/FONQHQn1RPk5eXYKKC5snMjEhWwe8BIQArtWUeZGn6/X3ohXhvvf5oRGWpRjdGyhETPI+c
 xIYCvr5oH+7/NDlB6KTUDYVw9w/o0fz0RIn1CaoyENKbEbnJUdkSmrUq1zZZKgJ8Jc22l2NYuqh
 OVKFqZsKwELQbuYjz+ikHdyQWQraM/Y9F5/SKsJ0GGjm9JMVTMjWQUfol/bQgHQADodhD8W2LeL
 vaDXnZfPtspZlmMNG3QAzz7Npxduwa4jNHLPmQ3NtiddkbOs6IeHKdVmVH4GTUeumD1eNT6AX2q
 Oaze09u5hkrmEpM8pZQ==
X-Proofpoint-GUID: 90mGJHmO874exAz9Cq9bAemtYm0qz8PA
X-Proofpoint-ORIG-GUID: 90mGJHmO874exAz9Cq9bAemtYm0qz8PA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230118

On 3/20/26 3:33 AM, Dmitry Baryshkov wrote:
> Hamoa and Purwa have pretty close thermal zones definitions. The major
> difference is that several zones are absent (because of the lack of the
> CPU cluster) and several zones use tsens2 instead of tsens3.
> 
> Instead of completely duplicating thermal zones for Purwa, reuse themal
> zones from Hamoa, patching them where required.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Slightly reluctantly:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

(confirmed with dtx_diff)

Konrad
