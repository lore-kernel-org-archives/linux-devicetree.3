Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A120330498E
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355751; cv=none; b=abE/ppeKOMGC3Ps0sXYXSS5xARmXBArqqghJseA4NVRPgqlOWT6TU2hlb9HrsN+yqD6nVucm3LrCvvZ4bFYYm476qizfdSoVtMjO1CtxXqQTozeZLyz5EybECU+u/CU/nhpe3CVwpO5ygpSgxO/VqIkxJ74PZ18hhfdgmz3s/g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355751; c=relaxed/simple;
	bh=mK06GAMN+hILvZvtuvnK53IOVlNURJ9vQy+3bYDxhM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SArXiZPpspxnt87aNcwRU+w5vTTjhNK/KGNSEFyaYcvNC9lgo8jph+uwv0iDt67pAdTSSopaVe2/tiDEP8wlWES2BeIOgJcQ7zp4FmterU8pW4otIADUgYlo1wJoCjlddjhLDt3aojk1HNEQo1Hn1+PzOKdtsRpGybQCoWax8Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oPVogkjh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LY9MgJoX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oPVogkjh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LY9MgJoX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2eVOb3453906
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6rzyQuCnw85ip+ebepgEtspZ
	yo8ym6Nb1+G0cVglh/4=; b=oPVogkjhJTIyXa14RLJbOstt326ApMDY9vbgzaEN
	lKWCiddNqBpw3ZO3r7h/TyKtL2lOevEtqN5jmgqzsGCVpbYRM8VueIIZJdpmfj41
	9nnA9iYpXCLmw5kDr5/89D22D5ODkVgmY2WCylccu8TCIEcp2D6/j5EzH3NfuviZ
	lgXXl0Q8NmcJhV2Zxsp5S/WgmfI1eCgrCsA/VMupTP7wamObl4eVuhYQtu65cjN6
	FmgYGfTLrHMgdLWYHcAaeng5k85PzPx6MCwUAZVQ6EzQ6alxJw3U1uPBSLzhbjRq
	/dm5wmQ9eRq9x0zAfltk23WPKaB/7FRPyuSFcAS04o7J+w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c4u6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:15:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so5757458a91.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789355740; x=1789960540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6rzyQuCnw85ip+ebepgEtspZyo8ym6Nb1+G0cVglh/4=;
        b=LY9MgJoX+Q6KiUbJCbwqp/NaMyqz2JzY6Lsyhduq41ISdCvi9Q5TgiZTHXQiu1bmPJ
         gOdENZIraymCZuPswx7MA/Z5s37lfKqTQz7t7GX8+Cl5CuaErzDtGRPItuStuOF6H9K2
         f46w6hZlcqndI8VMlZ9ONE1gMDztkCghy97Xcv2sVA95uhLcZ0HGZecbE0MtFAsJB+on
         AiZEt2/Ec62FPs6DV6VpfDYHGxV1q/dXc6cKVS6GgS35qs0k8gSalEE4iRUpG+mo0zhA
         YMrMiRajfvvXyVT+0c8S+HYvXlHkU5IlMTtNSkbtpsdFJ/UZNrY5Px/V9wZv9W5jatsu
         NB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355740; x=1789960540;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6rzyQuCnw85ip+ebepgEtspZyo8ym6Nb1+G0cVglh/4=;
        b=jATDbVCaG+MFwNa9ifmuoyH/+8K+/1Qr0YWvfflF5XYrEC9KCQ+GHyspqdmXtBqsNs
         GkLgA/AvygdxqL+IYUNnQ39JbYyKThUvd/5BLszYMI8QUb6DHV+oMUy7JG4+lFdWybfq
         1IQDM6+yu8aIymToZZ38FW1s/TTUeaoRF+3vlrQeGelAR5TUlcwadb5nq1xHTZaBuDeu
         GlD3MlHMgPcwydS6ZBewoHmgGpaMCTHsRzaQwA07FlRD1Iw6lE9QrklPC2D2sNUBUJkc
         dNs9dqDdPb9muh4xs9aZSFUikMs0XgHY4NMtJHH/Ob9Hdc69EwqkTIHoQYyFvvIHuGvE
         l2UQ==
X-Forwarded-Encrypted: i=1; AKwUvBxraNz+tgYjisyxQ878MBt6ShR1mUBj0qufrieYZ5MwlI3cI69ZyytEEp9FqUZKST+jg61m4hYd/puL@vger.kernel.org
X-Gm-Message-State: AFuF++m04yt59FBrsqIoyNIPeGAZ9if2bC1UiTSePOiDjQgGb1pK2IuF
	6FU0gQkt0Gj+ftXni/qpO+llJZD2S8nRzTl2QPDGh/SgCZ1eP6Ius6TH7zYH8HOxHjd8BYdbCmm
	EkK1Osfy2f++4lL6APZTcY74WEayzVvuibtwBZ3DgUZKZstaiz3NSVevyOZ9GtLGitGLcFc9a
X-Gm-Gg: AYBFou3m/6AXwVmybTDPzNrBJdC6dYAXR7sq/YGe0rUQ/3toRRqr4Xs6BOu1APchIm5
	RzaVyxVRRDYRyjvT78YEZEhlw/bViLqddKzeBr+aOivhHg3+Am216BvVF6vhE4TtK3NijhXcUtb
	Lf88sY50kyJMoBsCrDDPjMmCxGcXLXpinxAQc/3Ne2qW53IEOWMozaPbE/02qVlD2YXBWR0Ww7e
	9pxriZC4mtIbWhYdr2PHcPwbnC+ER1kzR8gOavZ7pelNi9neRk4hS61q2qTH/WQujVlzJxMCUEt
	Y4A57qg4jkOpL/Woi65Z5Vq1ghms7HwYJriwRTkDH9+jXVJlRch3mKb9yvd+jtDGLS6YH6qPIoo
	HpGqVybpm7HDmXoCisTnfiuKaOSilkeKBa47216F1DZ4=
X-Received: by 2002:a17:90b:1f86:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39dec0f9ff3mr1737750a91.24.1789355740008;
        Sun, 13 Sep 2026 20:15:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1f86:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39dec0f9ff3mr1737689a91.24.1789355739511;
        Sun, 13 Sep 2026 20:15:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ee07f2sm21136098eec.18.2026.09.13.20.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:15:39 -0700 (PDT)
Date: Mon, 14 Sep 2026 11:15:33 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: nord-embedded: Fix i2c9/i2c10 pin
 functions
Message-ID: <aqdm1VO1IWs_n04v@QCOM-aGQu4IUr3Y>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-2-shengchao.guo@oss.qualcomm.com>
 <zsohlfgrvaqxg2wsymmgeiiasstmk3y5t6vj3aj3v6gl6arcqf@dwyie4ondge7>
 <aqdY43X_kskpsjYV@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqdY43X_kskpsjYV@QCOM-aGQu4IUr3Y>
X-Proofpoint-ORIG-GUID: 5VccrOZ0EWgC1_-7e60OxwU2sOrhkQyL
X-Proofpoint-GUID: 5VccrOZ0EWgC1_-7e60OxwU2sOrhkQyL
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa766dd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kt1rYbH7FQegcMq7uf4A:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA0MyBTYWx0ZWRfX/m3sMVTiFCrE
 Q5Dckc5HB88LIS2dSWRmji5Q6XjQaNkpIL1IGk/C59RjBnIQZjL6Ww9VdGJmTksjMdmlz6cf0CN
 io+GKGAMk2+zO4UU0ke7xrzQ57E598gGJ9tEF5GNYb/xwCxZyRTipm74ug4qKhWoSI2G6L0Z0di
 zMhbIF6UHTx6Vcz6Rh7SG3rCLpuMAcLnkJdp6b2YJeaEbg/W6s1w4Px5sP0HMm7hClusHLldV1A
 mY1FlDuCA87IwIb0e/XopDC6KPJPVxdiRgHdNc1mgRj6kiEGlyYkBcW9EVkhRBWQk0sGKEuXOAM
 sP3YjhwuCxiNtjawxkeT3QpvypvgfhiinSQBwpFuzP6dOIQ586KGD+7IWf/JCxpOGUSqBZs3hBE
 fcKTts5Y3CZd7kYojwN9WwXXfUwdc+bYbeTq/hOFpJTo1EOZ6l7WWDOGlt4canBKNP+x7eFZ04w
 59G/XN62MT3LGvGWLtg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA0MyBTYWx0ZWRfX+MsL1sU22RIs
 hFmL4Wh67nGyk0LAWsdpkysccgQeQ10DJg2kM2j/Aw/ykPwEHho9xb9A0bqDubdUT1kTNfWcRD9
 zCondDqEgYr9fTKmnV0bixCjdBWR9Bk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140043

On Mon, Sep 14, 2026 at 10:16:03AM +0800, Shawn Guo wrote:
> On Sat, Sep 12, 2026 at 06:34:14PM +0300, Abel Vesa wrote:
> > On 26-09-11 22:20:36, Shawn Guo wrote:
> > > The i2c9/i2c10 and uart9/uart10 pinctrl states shared the same pins and
> > > the same "qup1_se2"/"qup1_se3" function name, so the I2C states were
> > > indistinguishable from the UART ones and ended up muxing the UART lanes.
> > > i2c9 and i2c10 therefore did not work.
> > > 
> > > Now that the TLMM driver names each lane pair separately, select the
> > > lane 0/1 function for I2C and the lane 2/3 function for UART.
> > > 
> > > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > 
> > No fixes tag?
> 
> The Nord DTS hasn't been picked up. If it's preferable, I can send v15
> of Nord DTS to fold this fix.

Nord DTS v15 is out with this fix.

Shawn
