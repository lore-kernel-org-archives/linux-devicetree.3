Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1D53E5EF1
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371572; cv=none; b=LpQk3rT/Oq8KL+FOsvoc50dQydMAek2VEbyLKVAtT4/P/MBhVniNQ2WKjQNK7Fl/2OBu69q4l+ZEcMEqws5+DVWAlNVvfKLti+QD2GpJTZFcOiMXcCimJCpdi18GZ5F20zcZiOJOVjkmT1Zm/0OF2+lmm9gdiOMV8ayAA0BBV48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371572; c=relaxed/simple;
	bh=+45AxSlhEZ22gOSJjZe4JD86VbvHcPcGnVduuHVO1qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afChXwKh/M8DuPrsSsbSEU8qmFqInnoERZDLRGhPCBXi/PQNTQv4V5p07M5tYNFwILkbaCzNu6gl6Clh0skayqfESIFy0MswGnmf1MNT+SO7F1oY5E+eRaqzc8hAZmHWCzMaeNiGJlKs2R+iVHzIN0+zznFYx+a5IY6O76QOYTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FsvsMdAF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1gFG0PQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FsvsMdAF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1gFG0PQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jcGL794986
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KS9bOyoJ1mlSi0Y0TDim8Esq
	aDPD9SDEMcYeUOECgx4=; b=FsvsMdAFDdDviKqbFzv3ULZ7ro/nj1oszNaXwRIY
	6AqG5HCIxPt/B+7bVIpRIFd3+g0CDCHLAdlM/KTcv/ewpPNP0AJ+sWeqAZZkDkFO
	p1rLT8Vhc/XHLVnpumj7FC8/54pgraABG07xx8SC+J7oFvPk34eapwAniXMwWSSL
	Pet3haSNz2iVfRgd6etx/qv6hkuMtsdiGUanbOYlE/4a+fdegI9+JPr38S+Tda3F
	+I5+bY6ueJyrF5xPIUmRqazaumWIacmezTyQENv9IhsPD8gmyrbRNoX3vLFNNvVW
	j+BgpQmN/oyj0BijXRU9rV1+fnjfKCvfvdIGcRyT4oaYyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnhan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:39:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f925ba4eso538013285a.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371568; x=1789976368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KS9bOyoJ1mlSi0Y0TDim8EsqaDPD9SDEMcYeUOECgx4=;
        b=I1gFG0PQmnH2Qo8zPwkq+/A5w6DK7F2e+YM2zQEwUgpAmr6/x18ueUd0fz8z0+5zyC
         gKld+G6BXF04imBFrfqN0LjwYr+nElcttmsElNyEu8MGmybwTl1vtCDT3P5gUR0DmJz6
         Qm9r0e/DM+vIzCpf4QGy7FelgSShGGZp/A7uvctMBtgCaT9kuf22wQ6gzkh0A9kICMBO
         12tCrnRaEsC9+sczFLdbkrEB1MZYlcAZcIOO9E/pT0LaDTxb2570leWL8sR6HV0x099G
         QeOqtdO3sF9AI7kIorTzG+s65gr1kkrswtwLZvRVP5mgwv3cWXJmM4IX8tg/QjEXMmSb
         G1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371568; x=1789976368;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KS9bOyoJ1mlSi0Y0TDim8EsqaDPD9SDEMcYeUOECgx4=;
        b=dDOxpdM5aWIGvpwDTfKtRytGxo1VvYbvwaZlOHAXkmmW0O0Wq43Wdhs4ZzjTVfPTK9
         KGVG2UOAvvjf9Mee+qyyTjPSlIOSYqTqw85NFid4beOuendA0k6Lh84hzzjhG7vz6bFI
         SF3nJqM5mPXdp5sP8x8a8OzCngmozBlUvyJ5DTAYwSwwNLTQ/V+BXZXNh30rtPUSWR6k
         MwqrDlewO3YcfJnCD0gKsq7gqDu19eKgw+EfZa3XD0HrCJYncsCrRVjLkt5Zjerrb+IA
         Z07E62lCB1gPpZQRIVQBHVZPO5BLNks83MyPgcV3MocyQLSgWnU1YpQrg0oHEXYmHnK3
         Nf5g==
X-Forwarded-Encrypted: i=1; AKwUvBz/mwJAgRUOhAaPFOpS1FrH6gDTSxAQrSzwwqnJ8A5PCk1EY81Q8bJt4IxzbocppaKbmZTZ9hTR0pjz@vger.kernel.org
X-Gm-Message-State: AFuF++kLuf1FzhvnHeYE2+FBVbGF9KzA7zqrylXD0UKHjUONI+hxs9db
	o5xuByw4N15ZVO9ylLacU4Si7+11Sy5HqTVAyeN5suKfMGDUbj0erow14ya+i9SW7CBC7oo8LJS
	qDfFDXVnsQDxxhdWIvKnCSAJkzh0rBBTyPmlFNY63l04Y5L1pxdjM8iDWJd/E4H3RBZhWPY64
X-Gm-Gg: AYBFou3oNW0PhSw7F2PQQVMPpirhDxletGY/zFg9AVjxLXFT9ssSbuwuOXBzv97/CvC
	7Yi48tFTavefB3qCAzyqHyqm5oVdqM/qrulXaOZaP9Ocm+xs7Ry4FAB1Xi+8NntGNKy6cZhU0Hc
	Jr0BMkKUXpMVaap1vcyCVwe8oJO4Z0H5L5uCzy8swIwZV7BWh8QrJLYMYGyeXzIaJqzAkskl9/j
	kMJ1AE8MpQykeURy1FwWhWXVXsc9fW/xy9CN6x5h7jO5TysNhc7NPa+OFlvKB+xo8wNL8Ntz3XO
	HeZDHIygdlTI0OlT3kZDPoeUsqIghRxI44hg3Ib3rdSzfZ4GM561Bj6WleuufRDM+WV+4w/R/2b
	kiBOMgUJksXKNBbo=
X-Received: by 2002:a05:620a:4688:b0:939:707b:ec10 with SMTP id af79cd13be357-93a29c360f5mr175324185a.52.1789371568347;
        Mon, 14 Sep 2026 00:39:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4688:b0:939:707b:ec10 with SMTP id af79cd13be357-93a29c360f5mr175320485a.52.1789371567800;
        Mon, 14 Sep 2026 00:39:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6499d57bsm440910475e9.3.2026.09.14.00.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:39:26 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:39:25 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 14/31] arm64: dts: qcom: sm8250: Add domain idle state
 names
Message-ID: <evo5r4og575lxcct47sx2cjylkya3lbjoyqjhithqdhzimdljj@lhx6r2b4xs4d>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-14-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-14-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX6QOZ722BBqbb
 RXGv2AEzLj3316XMzbR2RqNh6FjzP071+3p9WF3qHYVdDIx5RJCNFRJblNLY+D8x5EmTq2pRkqJ
 eXZYgSiCNakOlSC9N5j7EKoxcMKNOvOJt0V28RQvw41i1c8AJnDUGYc5LSoPLdrzDSwlNOUAxu4
 xeUf5KKU14tfqu8YsqnF/kX9PJVCfKPVHggfM0Os8u6+Qhj4qK0zShjU8ygeWXfyy3kRdz8AhVL
 R1tJ02pABQNFAynQROsIEGakVGquw4ixiWMm5jMxuK4tcc/hxYVyoAxV0X4kW7aPmNHbpCfStHc
 Q9yElQiL3JRAwroJII/fci7O12Nz3Hhhsq/nfKcfM8fO3+epVRtlC5eUU2Yc7j095XKWkui4IhJ
 VSNGqmgeF765Mnauj1pHANOBLrxbU2zWue4EybWgfaUKywPuV1+jUFXGkQG+MOXixewM1EN1H+a
 pT0CpA7E4dvSsL2wSxQ==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa7a4b1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX32ayzTBe72a6
 GmkP8Yq2ZlvN8/+hDJO+bGX27Jzbern5livS7gMiFht9RWOnl1cjv/QuT0eC6wZcikG2h3bzosj
 S0k3ibQJwskfjVawoTJEAbqCQ4tcgNY=
X-Proofpoint-GUID: olAMnWp3AsVE4M7fJ4FS3P2ETRmO9Md7
X-Proofpoint-ORIG-GUID: olAMnWp3AsVE4M7fJ4FS3P2ETRmO9Md7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:46, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
