Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BA74C10D1
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658852; cv=none; b=BANgEcHYGrr0KFN+cRBR9Bg4xaGjRwfWwUUCZcGA7Rn5dZgkaz+hzPZ+ntSevUjcBie8ORPnBFpdyPnv+Wm0vQKtUn5kc5J98N+T0Wbot6iSpLMAuszwYhb+7bIbqk1Xic4hgGpQm/PGBCFnqBgBhnG05Ekm4O2n5OmxKcLCX+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658852; c=relaxed/simple;
	bh=ORrkQdx7WaXLuX6nCR7n/UoR4xgg8OSPPnuyxEfLNUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmJNdOQMg2xd3Fin9fp9VWrJ6oyyZxhQLFfiNS02JhRrgAEt+RrReVR2rczUeQmjM9VnArf0S246crKJ8ti4ma3APklkc6p4KSg8h6UsyjfRF+VRrfqHJg/IT9EFiPltvQ2I7/6Rvt2r+GFfonhjy9FNOn2iyC2w3OxGDfM/NWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQ0AS78Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fF6FPlpy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQ0AS78Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fF6FPlpy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDjdh41307355
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lOcf1R7o5InmAsKwg2E0EjTS
	IYI7yDGuX6N2Ud8ufV8=; b=MQ0AS78YiydvB/L9ivANs0HuhU7RutkgB/3kwdsG
	kMln+VSjUbSBBkbM5olq7ZRZzRo++BRaqiiaJEvyz0Akj/Hp1UHnUUiNPhcVNDSq
	pBDSU2oW7E2Qzwfg6V/uLmt5m7FsWiMArz36lg4/pTUOcg04wcln4stYkJvzbgiF
	baJAbhBtKQd1MqqD0O2f2nwVFWzvlvbm3z5RoUurE/IWD78pLrjtaHdulPd1NWwg
	m/+K+R9RONfZyvdSC6pJKvZZ+M2QdJsKFhO/3iyPqUVyd7Cyh3DcuKaYkSkTj//Z
	X6KTcpwF+lDdjZ3eULZUuIS/dgjHB6Dq53/u/7u1UaTO1g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra9vr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:27:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91219341db7so17840656d6.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658834; x=1790263634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lOcf1R7o5InmAsKwg2E0EjTSIYI7yDGuX6N2Ud8ufV8=;
        b=fF6FPlpyCSwQaHGjcVNd5MjyCjbetN7WV1blgzFr9082tOU0WbDziUbZG7XZT+cZMi
         SNck0Hkd9KtjOR3rC1cg5O6dt/3H/0hBYn7QcWDFnZ5ZGhIi4nj1RSx/r+dNPrwfjKEx
         +kMnDfUu34tkct9uFkgbhF01K8pLn8SaOrWRvXsj+EjZQqp2L0BLIgTycOiYjnDaJskW
         9i4kJF8+5BJdlbO5Sv8gj6MRiY+oNcxD2Z9m4nc16qf2SW/ovq+iqOtZxnRnzozFQ8Ro
         vSne9G/6mxeVVv2bd8DX7gZjiXAymgcNrkywXqvBtFp0BldruuzNkh4KERopfqtUOiRV
         ce4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658834; x=1790263634;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lOcf1R7o5InmAsKwg2E0EjTSIYI7yDGuX6N2Ud8ufV8=;
        b=kGFSe9xz5e25oQ3G+n2qyGLfAUTjz+UdVa1qkIMEC1vtgRpco9JvODxVwAu3G/SfMf
         CfzKge54nDmlX6R59d1Tox1pea9F6oFmT83A8I6AMmxPdBl0RIDRGbrXDnOmj4pC47V4
         dxdmIGTCrmugXhl01f8RFVWXCPBvyIkM6B5/YfLD5irs2SUcqh+wtwDnSi5HaFjdEcq7
         y5LyeslhvSAreHu2ppjhu0XzePX43DYjmI8L7SdmSXGfyP78N9uTuUcaOmCsdqNEhJhW
         BaFNF2ghaXbp+y2teaFX1PW1FeeK9Brqze/54P4sNU0UOZlqkz4PZ/cDsoleuTqgDSw7
         IhDg==
X-Forwarded-Encrypted: i=1; AKwUvBxlD68tKupuYmR4TPOXVZ9LKXaHPSik4KQPiVT5MqWO7+gRy2H144XE7IJ2Psuj2aUWQLSnjidKZXUp@vger.kernel.org
X-Gm-Message-State: AFuF++lDEJ/8FADRi7YBhkrkr41KfPgM5gJ6wrYXPyqmp9YOLz9YBe5Z
	TK95aAQZf+2O0b/S2s3RtVFfP/UpPlzBV2y2kxDRvF7WggX/4/QB5jNPU1DAoYS706WMSI1p4OO
	hMbhksQQ/iFLuQ9YzuRiY9lmYnrdxG2Upi/0NFovxhy2TVWJoB1N7OjG1F3LNGxgngkzBjRYF
X-Gm-Gg: AYBFou1zIdi4LQlROy4PhihAgjTf+qWAbhqyX67ykpG/XalOnq4wcor4EhTNWxJm0KK
	hMlE2sbDmbbNTMUSk2+YxzCQ2IC25SCQ0CN1ND09hk3zupnt+dULPdidtRX2/Fwu3ITdLFWO6w8
	4okZyMzByZGPI17yxBcO6LsXEMIHlXFfNc/QcUgmk919axxeSmnF9joTRJ7Zzu0We+wXDY4KH92
	dzcNrps8ephxOIojdewV+K+4ngRA46vU1GK9uWI2WmhDXh2cLMkOeqIIc0DMTJbmK2mgm4XlXm1
	B9affvgJohOkL8iLPkIOitAecO2VxHDQggC5ImZfEt0BVsN6gbavY2UzdPs6bGGEMd8v2mUhdrG
	yxDaE2ODZqhEjmXc=
X-Received: by 2002:a05:6214:62c8:b0:912:4527:7ba with SMTP id 6a1803df08f44-91252411994mr6211896d6.23.1789658833832;
        Thu, 17 Sep 2026 08:27:13 -0700 (PDT)
X-Received: by 2002:a05:6214:62c8:b0:912:4527:7ba with SMTP id 6a1803df08f44-91252411994mr6211096d6.23.1789658833203;
        Thu, 17 Sep 2026 08:27:13 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf26c8dsm16288601f8f.14.2026.09.17.08.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:27:12 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:27:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/5] arm64: dts: qcom: shikra: Add CCI definitions for
 Shikra
Message-ID: <ns6fwcvy53zd3yx237nrnbyzs2dvnp2imucgdxmj2wqi7pupsf@dkif3wniurye>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfXyR2Ni+u6jNLl
 QmbNjJ/vckwCBQo3sdfIpbd+Z0Dn4Ii0GJqazO4rMdbg+PRi5ZbSj2FyrqMQ5nhceBw2zdjKP+8
 dva+sfLDaBYIlKelsjNltCqocPF3Vn8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX0E8Sm3rigkLA
 Viy5ywyeR8nLHww4jLj85D9ZgucJFcA5INfsz21m9msHGKvcOIhQLhRYxXEDEp6UsSHMBV7Z+3S
 rR5Ql9EPan/KETCSxK7gLdRYZNaTNwQdCQacz9bslgrd7QwoJK/AALHWRxcbnLfOMzTzUNZfLbo
 lHIzPKloO4g2LBmbRD43dVO1jZ5f22ZfixJ6tRdoy9KBa15P9BKFJfPLiQZ4J655dqIO+G97fVx
 z5rAlkppasr5fBY84pPfaUjzUww11GU2ZX59JtciPUndjoiNESahLwLaDZ12c4cpwVpRLwVQvPP
 Ro/Df1Pn62ccH9s1pY7akN/Zw9mZXVK4RXnNJS920rnI6pRG2sOUoAgjKhKW7vuH7Kk+UOBWGzT
 P2BvMfE7kRWjlRKbEgMWzJpmHemFZOlsOR2hJ2DqbeNm7F1Z3/5gM540M+rAbPzfPpZdspatLmq
 DgHozE4tvrGZ8nm8Tig==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aac06d2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kTwRDD6jQfcqJCPQX_EA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3BMvy_4_ikj7LZr8LncHeIcNF1hkZS5f
X-Proofpoint-ORIG-GUID: 3BMvy_4_ikj7LZr8LncHeIcNF1hkZS5f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170218

On 26-09-17 17:11:01, Nihal Kumar Gupta wrote:
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
