Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501663;
	b=qk3J0aiW/m6OfYF8Ubaeu1KE7QVYKJWkwyKcZV2c/l/4j2L1kQ+e03A8+AIOyxIck8V6
	 WH/OUg7vG+9UgnlCaZB0q0yhdLyK14fn+FOpgRdIdUZtslF0tAVGc0wngeq53RIlLVDAv
	 p7J/zh5+eNBpW5TFh1RFsQ5ySHOpAmq5+PrawilmtTiMrRjo5bzLZ7xMo5EmgDAUsz9DS
	 gnbSZACqHqS/QFMz488cNXX1af4ln8dttveTR0MnhUKLer+4IlGqWnPxHhoDAwr+UViZ/
	 e+1HX6c9Zsc+bERU1QzjvKKBCmkzKrKvtxaVpTsQkdU+iVmWTFKk2RzCq89zDSzM5uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501663;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dHtMFy0XbgvQcqpGji9wXowz3KOsd+jONNfR8siOCQM=;
	b=J5oyC340LHwkfdsUdWGMsjxWCu1eTbj7gFSminBQe2CmomwlxwoC3gyw9UM8pXg0R7Z/
	 bG6Vum6gtkIGhdM6GxzicCwV4DTi11rveyvq/L52XoWiBm17i3O3Z6gNJPuqsU53SG2zE
	 SH/wKn4WOaHOC11sueZd9TxYWKZa2y0XfL3kb/7wfC9FFHyz1vAHdW9osuUbPmoy25gHd
	 F4OKM52v5gTgV0UoK96E+RhM22qYPjfnYhH5aemXusH9ZQGS9sv0Sv/ZJ9AJ5oJWhNqTL
	 W5lhxhyIP/Q6LrUoL/oZcLuhIgoA1zD9MAec+ocaQZ0rwDAy2+YXdvqLSFQ4yFKpsJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T9U4mXOF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cuHqGSCT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F89606A31F
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78F89606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T9U4mXOF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cuHqGSCT
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KCwlMd2272548
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dHtMFy0XbgvQcqpGji9wXowz
	3KOsd+jONNfR8siOCQM=; b=T9U4mXOFH7JOJkvItvsuIFvBGeMaHz2dltnDo527
	moLyl6EazIVCHguKQjFTVMSJC3k2O0+ROhxUeJDvOZqV6KCcwIN4eKEieULyodCD
	+4/HLbg43xYz+wqCTJpxEWUwy4c8ZACvMCObVMgRJ6LAqlQGBqCIHyzqoI4mQtaf
	Xd5qvOZiC/fvwt0B483UTA1rDn6qip4GYUm5nJk1K3NggcCunho0y5caAKNspi+2
	XgPRqZI+yPlZjE3ikTH2rWcpZuPUV0UHC5ShWCkPycFsdKs4CA6U6THVGzLFazk0
	TaqlTWBG48QGXHVWFNvNfWLFOpyyIsftmdYlpERrLvaQpQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pjkbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:07:42 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98a9c848bf0so205386241.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501662; x=1793106462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dHtMFy0XbgvQcqpGji9wXowz3KOsd+jONNfR8siOCQM=;
        b=cuHqGSCTlekNtKPe0C96yXEFMNWIydl9e4c/jA5Z0zqxWKZJQf8f8ZoJfO7E3Mb+cy
         GrWjTSxmP3EtYnYldJQ/fjDHZ3jhg6qB6uPZGXsMiqO3uFTLMhFHXiGjQq2NQ2NUsLsE
         nGk2LmL17GYTVyPFcRHbpYdylUcW4DbfUj4eSvnE/TSz00f528FxmWTtBNesN5Do/9vX
         JzN6hiNveiGt4xm7dx8xMnUzGQVsEwuEfvQnMAuH85yGhkKCfMIDkvS7K96BGObV+Pjx
         wCooAJu7XtxP4klDz3fRWTei34EQZtWp0zNWn5ieDSLc52XQIsT/uN9mUEpPNgZV2fCT
         fQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501662; x=1793106462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dHtMFy0XbgvQcqpGji9wXowz3KOsd+jONNfR8siOCQM=;
        b=EvMd9Y5siPuc0cZ/mlFe9hnkp8toGckuFgmapTmJs6O71A3s7iiE9JQIR/rH4zAaEP
         QckmjHjP5z4XVdY8Uighy1tTM9PfG2Op0N0ortC0l7mH7Dx+p2Z8h8OuANRu4PLWH4xn
         Jhb309lSFEownyUrD0VhBayhkpjg62TF+YzmkW3po3EaUBIAX75vJzoduv01Qfs2npUW
         7S9kVYjftGFP5ifbTKmIYh+rpUgQdA7VoRgW1XklRBcmhATNWLfiFjNcsASDJWyTKUPy
         FENd/8woaoZFmtvl0NcRvT8fG9COrj+2jsZvy7giTGNBSbWnSgEg3De4iWeodogJLHzs
         wdMw==
X-Forwarded-Encrypted: i=1; AKwUvBx5W7S5eBtL2ticXGWwrNtZIUhI3FIY56IaeyrKbEjdaMMZj/4QUUbg8NeDo6TOdqbDMEcXLpUOY6ki@vger.kernel.org
X-Gm-Message-State: AFq9FYI/bPdp+TRmjYPGihbJC1LJab4q+aOMbcczsnR9Be0ekzbqy9Bo
	SCqPHZOFHFXRAyoywcvbYJh4XXdfuQuDORW34EnUgBDeudZ1FqBoFtOPGlaXFTU6XhHI+/BeAjL
	r5HKZL/1vfzX6eI6gFeGaG+jpGcm6Gv9VY+NxQai00bN1LgZJnjCqMoq9mHa+2sQt
X-Gm-Gg: AYBFou3N8iqs3G+jp9Zhh8s/ria1syz+06Q11eBdcIND/aqBg3+p1fdEZhEdlphRUOs
	mr7biK7+PErHCgBfAwPEByVKAGQJCXnjgO+XkD6u+vgQ0mweO9hEFWHNU8xeTTH+aO0scgh7A4P
	1Jl+SkFDQR3Qba+Vw6sPPeT87eKOpN9qofQYrPwpcGkdEAgskrl7Z0DNIEjTYVQYWgfbzvWZr8g
	cH+cGrSZ6v06dp2cBJ9++LN1Sdn4Zd816cFY7I7OVshHuJg+OREDka9o+vJQ9d8niUmSO7GyAPh
	A/QD8H5l7tl4twhQPweJOlUGIItonE06kBqAUB/u9THBBhRTS5ieKrDCB5J5QvdcsBd01G9ii1+
	c5xNCpMF+xhfqt82w
X-Received: by 2002:a05:6102:4193:b0:7cc:1942:c156 with SMTP id ada2fe7eead31-7cc36a827aemr2633463137.31.1792501661580;
        Tue, 20 Oct 2026 06:07:41 -0700 (PDT)
X-Received: by 2002:a05:6102:4193:b0:7cc:1942:c156 with SMTP id ada2fe7eead31-7cc36a827aemr2633447137.31.1792501660992;
        Tue, 20 Oct 2026 06:07:40 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d97b7bbasm4264685e9.0.2026.10.20.06.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:07:40 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:07:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sdm845: Use ICC tag defines
Message-ID: <5rkmjbhbgodmfyhd3rd2w3tbv7onjoclqojiehd6ug7enrnlke@jrcx4nt62r5b>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-5-cae8d22649ac@oss.qualcomm.com>
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
In-Reply-To: <20261020-topic-icc_defines_ao-v1-5-cae8d22649ac@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad7679e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=S3dp9cuBsdvKgzaJaSwA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: Ge9RUrjewTummo8l_48pTgQ3qJUMgnp0
X-Proofpoint-GUID: Ge9RUrjewTummo8l_48pTgQ3qJUMgnp0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX9dQTytxqh6V6
 2q1jHALTMCkiCN/MWpzcM+Ww0V12Z16Q6jPI9sUrOSyTIEscp+4pzpz/Es/PQJmMB3p/3mPqEtW
 dYLWooiJQT4RufRB3z/yxzvGajab8lP5FrU+FHpkOlAnMLdBDZxYWR5YEAwfiSTbwIt6eGyzwSv
 952ZIeHyKpSdyXfdMa1GHGA8zINBv7T1InY9rsd9N4iR0XFv1ScujQr08bo2Ow25Av00nLzyFmm
 ghdVM/DVYNEHgCmadLBqn0tnfbBQOkiFUunf+MaqyYnEik4BBRqV0gXw9EaXS6qE9W0tFXH7+dc
 6ShNz+tAqsmEY3KDGXKZ1pyCdpOPCKq6G2aAoZrd6XMzxNKl7ZaUEzaQ/WXEg78gJcPx1KHdnQS
 rQkSS5CDYNYVwTv+frw6KOia2awDaysQFfRTcLlOnFutyWi3KE7fEKgzssXtM26FB5BJ0wKLwRa
 vN6nlnTE0A32c8iCDGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX2nGwTHhH3qdZ
 ZCqqTKUBmjihbJ2kk4eF0hVuRySyxs7SORtGhBzukfDjlT1ImTjT/E6VU3Sx5kHh9iyN6ViwvdV
 ZzdX02RglxPuR5yrSZrIlSBnq4zxgyQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-20 14:42:09, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The magic values come from dt-bindings. Use the existing defines to
> demistify them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
