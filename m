Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0254C382391
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 07:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776757112; cv=none; b=jCE5PgWdHofcJtm2FWV496QyAtgyy4iyXN6klf7s4bpNS/EFMPG5i/c3qAuagZzFmkoNETaGpv7sOau4l5jUkLjN0S6xu9Jfa3E+iI+DnPZRssj594kBenjanVWyR50sSXswyYZHYaHLbaalkWWEkiTx3t+Ewv5e2CjnKLDh/ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776757112; c=relaxed/simple;
	bh=wjZTcd93cD/Gn1mlEqajarXrdExhXlDw4BM9DJe8A1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BxIHpG+6sx6zBrBdyNqEmY1h94sTAUt/7wRyVuDT6pzRdgw//WZbqdMb+VtapKWcOgGwb3R51dR59Xev4dzzNIEnXCOcio1rfFPUe7jrd2aDHUpzVMHN1HYVkb+SH7/7EOZ7CuHnNghUT85/Fj6jLdKud3oKoZvC6ry6pEmPR/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5HaO2Ld; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eah/Fbst; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5HaO2Ld";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eah/Fbst"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L74GPo1538510
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 07:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GIXG4RY6c17Up46qA/mgjCGl
	PBb37O53AFXQ2rdnLLw=; b=n5HaO2LdoHrLLJwjsxEM3/IB1/P6cgltzxTSo+V8
	D7GZBzVolPGymlm0nJ/Mby0NI0yHWSrQamBCA4rPMxkT9Yb7W3rO9MJeetcOA4gV
	lPmNCG+I1RG5cVVLn3KRIOnaqqq4aL73s2dYZBvxZWZRnjZZvCjF0Sf4mKNC2+K7
	biizt3lGVhz4dcMaupRPftzw5EWhsAsKmb49HgHtMZpxuq8tNgKZMqJdzl/2M7qV
	LIxux/+PyVM0O7Lo/0dxcElilV38bGkr8QXVjE9OOFMo55GkMEdz2DH6VWW72jut
	vZ6r+iRfbm+Vt4svVuwkeZNSETNB4i6sp+637lZJ+sR0mQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp4hag4cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 07:38:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2de07c12745so2382607eec.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 00:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776757110; x=1777361910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GIXG4RY6c17Up46qA/mgjCGlPBb37O53AFXQ2rdnLLw=;
        b=Eah/FbstBnWUbGYeDdbZUM2HvpdWnGKZBTYIiksxN0V2e9D1Pj8dULw1a07rT+YEBP
         OJQGWfZNsXwRAnWfCiJ37ZDzz9pCK+rr25dHGaGQMgzEx2pIZMLOzFu+HYOCVixKtkC8
         +PyhBUZOZfx//xTULiKtFbtHS6xXyjOqRBZuXEHs7mXOf1psiR7a9DToV4J6Uj8Hejb0
         cKCOMsNE12PHd7QJAOA6EG5UArx9jMMMkjxBcn1qg+jWEbZyF6T15W3l1hUfti2eIReV
         wM3IBqQ90Uqj/8i9AGZ/PJ/oSdT5Gc4t/3oA2kl2xhXId0GKfHLm2fhgvbwr8hM2nTni
         SlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776757110; x=1777361910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIXG4RY6c17Up46qA/mgjCGlPBb37O53AFXQ2rdnLLw=;
        b=ctZdwbmfh4YofMcyqNg+sj1lz+H9RsEkRUMunNma+1qhWggbfYidn+/TWF0qUroI+K
         2L1CxBsauMKWpy634Lge/II8aAPLeEOgRT5O9XaEfju5hRvhWj09aMkYmFmunzGX1Ybt
         rYw1m//RA7ZEK0jZQPklTcZnMHTCarBcUCnWjL+BHlb3jrfdOBiGiBrefNXfRbfrAJcl
         t0VEU8uYibzRx/kt6MJ35lw+QvVVSvSCn36gjp1ZDOI5P6ESp1pSXpnjjTrYF3ii0LIN
         6+WbX85Xa5g926pBa5OhCehcX6P0n8WqgkXqFdg63gjb4dcuoybAhgQqq8RjhNhIZ7nu
         z2+w==
X-Forwarded-Encrypted: i=1; AFNElJ/U71bz7F7FJzzhnAgCQachdW7vVOcZBF4svk8mhBOKQY3Wnkgp3YVd3mlXhTFLlitZJwftBTzqcvuq@vger.kernel.org
X-Gm-Message-State: AOJu0YzoLAOoIJgrXbJZD9E6mRE/E3bICv/GZ70ROXe4gXVWXCa04l1Y
	ZYKc1XU3lkmuFk100vohxAkqSRZ4z8FT9FhUn29U++g0lKiXe2S78FjTUSERI8+y9sy7RAXyrT+
	yWNZhKTHpJume24KKGZfH3qUVtVxIG4JOqduDuJu0zB5s3ioQhS/1npDq+UWfZfjz
X-Gm-Gg: AeBDiesPPedQwhX9LhiHSdFrR4Eix981X+PsiLvugo2QS7d/EUQBdB3bB5Vb8urvZzn
	JuczSNLNKTlTUXiTZsKVVkekIMUX8ppIZWuegdLLd9Ry31Q+LZknPWDiFMb675LUxIpmG6l0GiD
	I7tNMthsWGOE/Ic6GpeTiFzWIL8URlfcACktcaP9FNjQNs8qJSLqSCW7+5W0IZ7owXfbEai30oE
	vBOy6VA87vMK1fc1sE2FUasNljBqkIfw9KP4aXMurspsstCBOcX4Elag9CGvkLifcI2UtCM3JMM
	xUQHHkCH9z7kqvI9CrM334wRtdco5QyI2dEmhojcd7tTp2d6hfDq6oWx7ZiMx+y77QCXM4BHkFg
	H1dhwckiY4PR6H5URvz52g1pujiPwEyz0GoYpHdnJ4xtWyWkgIl/ychDzAC5OC+4XYgbr89OXwS
	E=
X-Received: by 2002:a05:693c:2b15:b0:2d8:97d6:6abc with SMTP id 5a478bee46e88-2e47a105b1cmr10260800eec.22.1776757109517;
        Tue, 21 Apr 2026 00:38:29 -0700 (PDT)
X-Received: by 2002:a05:693c:2b15:b0:2d8:97d6:6abc with SMTP id 5a478bee46e88-2e47a105b1cmr10260775eec.22.1776757108969;
        Tue, 21 Apr 2026 00:38:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa5c38sm17526024eec.5.2026.04.21.00.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 00:38:28 -0700 (PDT)
Date: Tue, 21 Apr 2026 15:38:22 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] Add CPUCP mailbox support for Qualcomm Nord SoC
Message-ID: <aecpbjIVy_oh1c2E@QCOM-aGQu4IUr3Y>
References: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
 <0c2425dd-0ba4-49ac-853b-b157eec1fdfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c2425dd-0ba4-49ac-853b-b157eec1fdfd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bOQm5v+Z c=1 sm=1 tr=0 ts=69e72976 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EzMJCGVPsnTdBwCGCsMA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: piZVLD4zN2fxRGWdc0PeSnhxcsIVkFAi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA3MyBTYWx0ZWRfX9gM9l8MgWK3T
 9gpZ+DQeupigJFySHQM2TKnekJcAExYzHa+I4rm8E6qVVQJK8WXIMEoV8hYmhAor/gzDFp/psSd
 5sGrrpFD4umGJGWdRjk7iCapqw7N4DjAjVQ7ObHjwKK4UlDJrq7Zs9CjOcspTQAe0bJ55U6P5wg
 A5q7Mhf9KNfVicGxjlHdnyOvq3nt7/J8EXULxxVtiM7CgzLlrg2l6RnahqCfPOXYpDKvOjF6MJP
 9vdPt3Lms96a8IRKAxwvkIwYGmiqvFB4g7xOvtl5lIxvtQZYCx4tdsb9q3K0V/nRfzw//yMuOtJ
 xSuvNJeWc0JVOX3ObHH9YwArSYxYK9I83+rvXz4izWKqIzy4tMNJWBTY1A64CfwWdwGRGnSaiHV
 dPYllmP7ta+E2Va3b9rKydcTezJSiONtGt0c9hzro7LudFQNDWBuY9OZiOyg7kqaVOzvrqflGmL
 NOeQikEuN2l+F0Mqx4g==
X-Proofpoint-ORIG-GUID: piZVLD4zN2fxRGWdc0PeSnhxcsIVkFAi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210073

On Mon, Apr 20, 2026 at 10:23:20AM +0200, Konrad Dybcio wrote:
> On 4/20/26 5:49 AM, Shawn Guo wrote:
> > This series adds CPUCP mailbox controller support for Qualcomm Nord SoC.
> > 
> > The Nord CPUCP mailbox is functionally identical to the existing x1e80100
> > implementation, except it exposes 16 IPC channels instead of 3.  Patch 1
> > adds the Nord compatible string to the DT binding.  Patch 2 refactors
> > the channel count from a hardcoded compile-time constant into
> > a per-hardware configuration struct populated via the device tree
> > match data.
> 
> What are these channels used for?

Per my search on internal documents, it says that more channels are added
to support following communications:

 - Between Hypervisor software and CPUCP firmware
 - Between TZ software and CPUCP firmware
 - IPC between CPUCPs (Nord chiplet design)

Deepti,

Correct me or add anything as needed.

Shawn
