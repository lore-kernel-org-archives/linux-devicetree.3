Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712845;
	b=0IkGsJ13kIxEMdjWBFY4OCkV841KbSleJ9XxuEGgCKnGhzotjZfhL/VSo1jNAjpQ2OzR
	 7J8//KdbRUtTM1464Zf5iduHoMM5bCSUpijE9bMw8ziiCBjhTmkAruUvWGbh9IpL3/GWI
	 L5fvo+nb4xMQ6o2OL1emhKXb58yX1Zeri5DQWdgq5MVaJ4ay/ruGJj27O5dsDN006HDA+
	 EH+S/1LZ86a3qYj5uglxkJxHSgEC44sZX1KSYdZkw6xy6dGmNqNe7lu5Ev0idJ4fiRhx3
	 MLbL2jiY3z6EU035QDWUDD0dLKmoZ8U7Ya9Y8PB9tmA0iWUqg3qWpo/xNX3Gywf/fOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712845;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DGNnS1KDT9U2hlA7Y5N5vTjHwcDSHZRJ9lAcF86hn2c=;
	b=SuGSLe1bl2nmRH+aTWYZkOQXxrdtvaiqH1jqQPY7SeOMfOeq/JNQ9ReDDIxvLqP8DHpm
	 FSpWEg+WQfHy+QERDjBmvdNPKN9nevWBaEdpUzT6CpAnvJmAdTRHTx65tWY9QffpEb+Fp
	 oEM3YKcuEM/+2CMoAEg1eFl4K9j5JWR+n6Vhd6keLudKyq3Xy0x11ZchIhZkQuad6wyzD
	 kHQMUfBY6bOLPWpArVbHP6h3JEBWKItwMU8oTWF8d6DWzk+mv9+NmHGaXFr3Pd1j3ZEKQ
	 uso6rgp5f3YNCizVBLij/AZwwHPZJfbr916un9sEP7NyAY0AEeJhJYDS4LA5w0EKMjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aTaeY8pY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVn8JOoJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5C9606A332
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 13:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A5C9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aTaeY8pY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVn8JOoJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClLcG2866031
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 13:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DGNnS1KDT9U2hlA7Y5N5vTjH
	wcDSHZRJ9lAcF86hn2c=; b=aTaeY8pYqKW/lDJlu+aXk12OEIFdcLcZTjKBbe+S
	zbVJcD3buxpIo5ueC0SWQ/hEgPGdgyRdQQKClIEJHpexHzlqm0cafh+JPhtOlwX+
	XB/N6dxacegZLiM0/nRMuqz7fz4XGSgRRDb2wm4L+Ytoj+GQX9ueqjELqIQA/A5N
	nPKx+uByj69LfjgOQyMu3EslPLErMjMtbQXZJwYsy8e+dPPi3Lg/Z/Rel4u3sb9r
	QL0LFL08NZGdu+JRQwlq7y8Q0bsRpipU3hdePcpGDKUIRuLKeRChmnTuRLVUJUsi
	vrM0+CkyXpo0zvBg0ZChmnlU1wuLn1sdHYPS/sP2ut3BHA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5jvd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:34:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so687031285a.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712842; x=1794317642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DGNnS1KDT9U2hlA7Y5N5vTjHwcDSHZRJ9lAcF86hn2c=;
        b=bVn8JOoJX/cV8ZZOqeZ1WalPtHRVAWJV7lL7ophMCten8uLliFI0J+DvWtJnrxk601
         GEbFQ+AQa61IJnR/H5r7l9cpyvjRqXFq9W/ul7o73U1pnKamNoG6xZEGwk1BFNTZJILv
         suSZ2RdyDCKspvgSQ2uHQNU7vn+dKRXPsMVrtvtqoUEQhQyPLfBWMvR+eb+LUFIByrNY
         1gyLa+qQ7BpWEDYil6OWy9QlREX1uZnrZ3l69KNN6So8+jpHWYj+Rhww+0w4YUgcfpCv
         ocYM+L7/T/YLZF92rd6hnCON0+w2uhGmyXyuTJXAJrk48SCCN6NbX4VjZn5gGHIHAS0T
         Q+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712842; x=1794317642;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGNnS1KDT9U2hlA7Y5N5vTjHwcDSHZRJ9lAcF86hn2c=;
        b=RVQLTmnVdfna0ZF190yLKj4FFRPdUjRusJinZl6RgZFGZ25ctjLs7ud5b2o0HdgvjC
         oJ0irHNLY8AUBCplkaY1j69z57S/yNa6qP/kCW8/HB+FZe6UM9VA15lklTaj13s4CoS0
         PzvgCCmFQgrCFxrJo95c6tbQ5fQlvHd4bnoqczy4DzOMRFpHvSOD41ot+tQOnGPOgR0i
         y9FMlXFEK9qZqco5omLiHvSrXDtPYqxwBqPsTpXBGLfZIvr4OpkdALp+pSBoAYlj4Bmn
         TmO1PsjU8jRBAk+BYpgYLh9A90fhULJop2ZclCrDS21XgyguRaQjyNLg02SxkGw9LOXm
         9y1w==
X-Forwarded-Encrypted: i=1; AKwUvBz6bofQhAorA4RlqrTurM0bwAlW8Oy4Ve55kqwx+xdLbRqxPZnSfwNzTNHvwJRMdRTh6hX1M59BRKqB@vger.kernel.org
X-Gm-Message-State: APuU4Z+RtfrRSA7+3JLSkbNzpZtXVIJse9WYoQVI41qwpkJ0gibw6+J+
	1Mv07aprS1wP8te0iPFV+F6gcOgwSIEMlMt/a4rI0/MEt4ibXGeFOHvrKQyDtCqh6RWzyBE031r
	smBV2E8CwIKRg0Dn39zv1unc5AIj9jo0+FtYK0WIU7e9VwXZEZMgzdA42aWoVjjsCETJ9fkdzIj
	M=
X-Gm-Gg: AYBFou3QHys7n/dTMlJmrddBf2FaXciienEL3rx7IHzYUmo1ob5Xs52Or4nXCi0t5iX
	btOvNsdSITb2O1Hp/DxnH/Ayc6ItcGvG9UY42TtWllSboqVF+Y2KRV0j49KQ6e1BKg+GPUYj4Sc
	dYTS0LdciTJT8r7kjZJsyGyctoPxZj1Zbh7f9opGSRF4QT4EG03ansWZ/s3gXTtb7TgncIUI/Lm
	d6VVI0kkVFwQ7gj7NeHYXh6UQscmdTlCb75LgM0IL5w72VNeMvcpInobm1oon0A72PDz4fTOl2l
	uR2HAM3+By9mlsZM3eiyOhtumEEbykMAZgmDTw7HGIRvjttvIXaGMm9/4unFj+NHA3w+A+2FHhd
	7YF4mRNm4ow1nXCaEjosK7p3RJ/UrkkQPBl4dlR8JjlR2F9993dAGeNfqvbx1N+Q=
X-Received: by 2002:a05:620a:400c:b0:944:16e7:15c1 with SMTP id af79cd13be357-94421659b79mr2181061085a.19.1793712842178;
        Tue, 03 Nov 2026 05:34:02 -0800 (PST)
X-Received: by 2002:a05:620a:400c:b0:944:16e7:15c1 with SMTP id af79cd13be357-94421659b79mr2181054085a.19.1793712841552;
        Tue, 03 Nov 2026 05:34:01 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879f401sm54953005e9.5.2026.11.03.05.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:00 -0800 (PST)
Date: Tue, 3 Nov 2026 15:33:59 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add RPMh sleep stats
Message-ID: <emrjperfywy2xcuxpu6ywan2qvk2jyxf7iy7hpgb6gm3vaqj3i@masqj5hu6ywf>
References: <20261103-stats-v1-1-3dc062db66b3@oss.qualcomm.com>
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
In-Reply-To: <20261103-stats-v1-1-3dc062db66b3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: X3pYZC87Dha_JnFw-p1mVOYFQkOuK1Xg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX3AMNbKEeQ+p9
 8fX16WUWNt5E0GLX8ZRZP2qQO7iAoFLWsa6/L2iBS5VG3YwfKAPiWx3gLnFDKOViZezQSQfmCMG
 gEl1jh915sFGA/jE7g/aGuX1ZOl93+7jRl3ZkK728wBGoXJ2EhsGbH65WjS2WlWl0oqf5l+vtlN
 Ei4dnq4rmuaidUJdQNMGOGgyzrmoWwFO8oHBASL0hlSGgPPxl8XyQhWqHd2OLkTP2kHR2NN3i3j
 dY4Mqsa577A7nf77O4otQmGh7cpCDss9KRtvPFwbnWUjmwEcfcV4zXKpNU756IOS9V+9X6gL9SI
 CtwQj7OCiF71dwmAkJisZRB0Dz/Yrz00Yry1QFxFV/D01Z6R0CFQvu7ugwaBRhWOXvvjHT5K41F
 1budWfaWv/bDEWgliNUZiszi9bajy4+HGfteyNUgkAVE0SNJmz/jC/MHFoB/Err69KhXw5zVU+n
 BevhqInou+oEV4NnECA==
X-Proofpoint-GUID: X3pYZC87Dha_JnFw-p1mVOYFQkOuK1Xg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfXwg9j5J1ST+Qs
 qaT6ZKw2xm+KQtl+Yvp21GU8C55SCJIeO3/fc9o4lflkl3tJFx88eADeRv+j2ZVrqWDRFjSF0oI
 Hg+TnNpbiz98iaOVNF0+PtHdzbe9fsg=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9e2cb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tvCzrSW5HJhQ_1vAfrIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030053

On 26-11-03 18:21:44, Navya Malempati wrote:
> Add RPMh stats to read low power statistics for various subsystem
> and SoC sleep modes.
> 
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
