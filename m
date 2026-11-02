Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625725;
	b=DcMUSMHKeaHPHjBtWjevyy4GOje4qLcEsEqBP07eTukDkJI1VD+DCAEONNHEKB0Zx5Ee
	 whehvsyHpJ0S/7nb5ijfOASE6Mz+p9lfg2ymTQSj0Uo6C+FkBzBPPY+2s5vzocWuS8exT
	 hcusiF4jbICqmOW69Ytl9dpyr6mPGMPiv9CsllXx7eAZnZZGl5w8JDsNJ9ePE5hAq8pYz
	 nThkMhURzQLRIKKByjqjeV4CrAyZONjc9wGn9dMdt2RESKPJlJRMvA4S8wMHiFfma1quv
	 /GiQEsjv4JbkxmKvQ07SfU+/58x3LLuSyS26/iT6ZoOTlxlktK1FyQlEvxRO/znKtfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625725;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=90Ay6la8TU+IvwZUCYiWLuxyD2NB080gAWQ5QDfHdus=;
	b=4LjIcEZcynsczsO4NXJezGwR1KfR2Oklpho6SIqAY8Z4/TE1GiXZEJy387zEb79rCt/O
	 r9o0dTyISDzmkjQSmkvZGDXSQgayqlj2tIoZqtlB7ts2ILxYcYdW8gLgsmlIKWMxtyWeB
	 nEUO1S4saGcLnZUT89zMJKwflYhG4Psw0CsDLNQOAMTmiRTqyJjVFo6bXKI2neSXe1Jc/
	 yT1fKDfLPhLFRlbMBhXwB6oJ/4vsiPyAQJStKTxy9RjTWpFyYA4C1QfRIHThfgJLnZbo1
	 YZoelJ2d2iLLgh1doP07KJXOOe+9gechZUAyjftY5d9wYwuhLtUOtgrVSGoN9vvVIpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="B/dC0XIq";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f9kD1gQe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6143606A32E
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6143606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B/dC0XIq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f9kD1gQe
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAN5q756973
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 13:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=90Ay6la8TU+IvwZUCYiWLuxy
	D2NB080gAWQ5QDfHdus=; b=B/dC0XIqpOw30TIvCbrrFaeOref0hss7IVinJ4ch
	bFvgPMKXhVgCOWOvgGBdA++EJ6oVWV6epByqD3fWp4FqUOresDL3rpcEWJVClUKa
	nzrYlQj2wtix9isgxcty2IAY1/rSLN7y3g1Bs599XpYzdXJ2PUfE9PxYcOWn5BhN
	NWq8SSEtvJby3zpTxkiSfjgYQXvjUKhloOdhpIDZpIcVzYaTxFDUENQ3FvoN3LPG
	z6OliLWDYFkiI+zFTzj0ImgVVc/OVJTiuOg7C+dLoITPmM5kpE1TT3GC770oLGSn
	pYNYwA5VLxqrSHrQS+AWbUoPpVOibvmwql/5bg/VBDZexQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1sryk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 13:22:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so578386185a.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625723; x=1794230523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=90Ay6la8TU+IvwZUCYiWLuxyD2NB080gAWQ5QDfHdus=;
        b=f9kD1gQe95fzg7MGuelyQxBZwYbuMy6lsxRiXlq5YIShefsaGo8/o+QfhZZFO6UJZB
         rBzic0EzUI0Hn1n62zV6p9EzNmnEZJDrB+pLPHF4Fr7egzSOua1bxrEdGEhxUMqHF0ax
         l2SaJunbpajcD0L3rH/SwUdPeMa2btwNai3v+3rVlCtIaty8TE146yarV+pym/394OpY
         K5R4OnznBXYlCxHVnx1wkajYCgkkMb4SFFxcrHXYvFUuTJm9HqlzoNkIFiruTkX2dZR7
         rg3MMdF/uIGXS0HifEcNgI6XmhbjwXGIHDd0KBuPniRcJkGeilnHiYUn+CbFVUeSsi16
         N+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625723; x=1794230523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90Ay6la8TU+IvwZUCYiWLuxyD2NB080gAWQ5QDfHdus=;
        b=ienVCaTIiT5BEM1juYwF8UUdFms+BQePgdOZJlo3TvKMLym8UX9Q/4Ai3ECiYja5YO
         NdUPERAY59ZfD3toMAuTbePnrVA8N63W0rtV77HEvKm1oG0JtDGRfo57JC1HMqX38V3g
         HM7kKX4HBEEZybr4CyOFWhuHLQp/7nUi6Pg458LKJaFBfrdyt/GarDG2wGjLKXJY5ipB
         420F8w+UwftV4LKIvXkH4iAYOV4WnBu8QwZoBATs3ZP/MhsIZ1LnZSVgBCJVEGJfXLG3
         H9mp63AuyDFI9KBOyQI+AuLyEzoKli2Nu2ED9PKx0kYtyxYJW8kpqy9e5m/TZrSHp/Wy
         9cVg==
X-Forwarded-Encrypted: i=1; AKwUvBwmPiZ1QtiW9tKdzhcOOBZCK2w3YwAN8QYXpzuSwlduQMgGwN1wBDcBRvYKMehVT1QTeS0m0adciGx2@vger.kernel.org
X-Gm-Message-State: AFq9FYKv2+7UUoMnU5eoO0Bmw8qPt6hU0PNCLoeU1ZGlafHg4VHubxD6
	3yXYghCUxBVt7zTB4J5aW2+gxZGQyATSB5K5SvoWrHJmf7HV4ZFGx5Hqivjqd6eqEUyeezBiVjo
	IYyGZKM1jQwuTEAgCzv/5fr6bNk8e2Gd0DkrOVmNO5dAB2w9ZZ9kh+60Cosd4uhLg
X-Gm-Gg: AYBFou2k02lvXYSC17z05MdCNlfj6AC+WZVJvtkWPOx8sNdMzcbzkmPw61JVapQkLL0
	6GhXsmSyRKlaXpSe8Y1fc9wSUj7koj5KfXg6/u2SHr8TkGlwlLzeYB3OWc1shzuqzG4Z1bks0RM
	P9RyconYtXeuzeBEftTPiLVg7aEkr/o4x4/3EbB9OH+cUDKQD9XGH4FF9mAwA5Uf1A0utQa18kq
	TY7p+sPiOB9J7/oLNW4aLIxzvZWTAA0CuIBFgoMBl/H3UJwlHe5y2mIoo4paHggRkSUtOjAYHJF
	uW8PotFOnocjBAO8c80IpwBCBQ3J9CraR6p8NvTw1/AnmnLhGtVHnHjz4Q4z91FhnLyv4N4KUo5
	eV7XxU32Qmjrt8MoxJWGHcZqG3rrQvOLklGfeVpAz8Ef6J2ysYOpHsgTnYHj0MH4=
X-Received: by 2002:a05:620a:25cf:b0:93f:3120:6c7c with SMTP id af79cd13be357-94421799b6bmr1603115885a.50.1793625722500;
        Mon, 02 Nov 2026 05:22:02 -0800 (PST)
X-Received: by 2002:a05:620a:25cf:b0:93f:3120:6c7c with SMTP id af79cd13be357-94421799b6bmr1603109185a.50.1793625721709;
        Mon, 02 Nov 2026 05:22:01 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf396dfdbsm273630695e9.1.2026.11.02.05.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:22:00 -0800 (PST)
Date: Mon, 2 Nov 2026 15:21:59 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8650: Add CAMSS test pattern
 generators
Message-ID: <kmijrohgr5lbkg665hnini6qhz2a7z4ee4croaxlrut4dtpdj5@xugb3sxfgmri>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-7-vladimir.zapolskiy@linaro.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031112203.545319-7-vladimir.zapolskiy@linaro.org>
X-Proofpoint-ORIG-GUID: QG5hr_A0O9TawC7ipzdx2Iw2rni9ZoDW
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae88e7b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ABvto48SYsrZWTe_A2YA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX2EQwLzYGXabx
 Uk7zILWRLXWFFbX6J4bcvw1S4PyrZBy6zHzWZWsh1bTb012wOyEP/76PvVp3lK8sIyx5x6HuSAu
 K30tiJg0RjvGG4p+pEz5QIkXv7hHmTeT2IWy95FIXPHTNoTffV/ANEFCnMyRPmCxrVNJ1UhI3Df
 CJPbMo29Y2QUi3dAn8wYccbbNRrHm7D2YAfywjd+/VusEAffcJS4XYzuptAavMTptSwpsqjl+Hv
 vdfJBI8eVq30HxM+gXyintnyeE5zVzNuhe2VPbfUfolcMtgDpGjeVcbb5fHbqyqqo5i73Wf5Anb
 qJueF3dPLDNpTbTg8h2+M87ADZcarulU6iJZ853rIWpix/W3JQy70mJirzCF2ON5jLhBOZ9JvM+
 bu/4oPUmxQan7fC0o4B5nf8oG8CqBr3n1BU2j3TKnqwMoMzcTT2kg+lep7dnVXx20fFWqWnayBm
 re395MaJcInE/sIEfCA==
X-Proofpoint-GUID: QG5hr_A0O9TawC7ipzdx2Iw2rni9ZoDW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX7m3IZiCuNLDZ
 r1ntj2P2koOUYQ+hF8HNUApm9ccpoqu+J6Bm0kPuWs7OoT1iiOPr8zCvMPSLT0K3yQqC57ghJ39
 iVgsZSC3vNoxM6IZILLbDKAB5lW34kU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053

On 26-10-31 13:22:03, Vladimir Zapolskiy wrote:
> Describe register spaces of three test pattern generator (TPG) blocks
> found in Qualcomm SM8650 CAMSS and the non-real time CAMNOC AXI clock,
> which is needed to get TPG output written to VFE.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
