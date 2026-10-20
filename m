Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500748;
	b=t8wnwv/YP3uCGVH71okrdg3s2COoxFfwWJXbfl9WeCDxnCUDGrN+gYPluCzwyfb4elw1
	 d/7qsfx0nd1oLm7iFHS2AfoqyIRa26Nr6KfEOSph+aCUTAjtp/wEiM5SMpN6WIsL8+OHE
	 YAphX5iRIi5uD74tgihYqwvZGzBUxS3iK/srZBbYmMBSCrXpRsR/9eRuRRr4kIZQVMibF
	 g72YthLQA5nXLXie00ojbmXUZgk/emLQOvOMWdb98l5yo7yc+lI2MsgF1yovhbIeDtEbl
	 NuCE5XYywjw5vHqOwtWFsrDNLFxHj2n8JyMzhwlSNs1JuiP9vH0Ou4ci6n+TFwuxASw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500748;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xdCT9mPPml0Q8wxCTcyjG2nS4+iWw9bwXUbx6nWuof0=;
	b=wL42afwMkTr6iPs+NgOh79tjsPHX2KHsiXQJOXCEbd18X9iA3aNPvNthmW5GnvFCtO8l
	 e6MyIVhU0a0tIp4d78DFJDVlsMic6lFbsP3vdQCF1Ee5VATIZQ0M1MGcQ6hEvx0pDmz4j
	 jS7BuW5DuF9/iJWavfi4Xt1IRMxyAHxVGXVPHQGYW1jgOQXmXoxWDeFtwLKXwo1Bdbxaf
	 hRhu8nkZ/HyPdWo/yK5dx5E4Tzi/a14c0jHedzva95ZkvWJMM8ZBONH2kzL8eraQPB9U1
	 THU67jw+RRYGGRfmShmwhmCVCtdi1P+5DNgpqsznsMQHvgmNTPkM5TCbuzuqQqrtiwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUvMggwp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NKvotkgg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7F5606A320
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB7F5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUvMggwp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NKvotkgg
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxOSh2524940
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdCT9mPPml0Q8wxCTcyjG2nS4+iWw9bwXUbx6nWuof0=; b=JUvMggwpxL3toZgH
	hutbs4SCJOrpTKJft8P68vKHx/tLNum5fkeLv26k2g6LlQNPIks0jXoou2PGtzXj
	FEn8IO/EqIVxK6mgqQHSvuwr37HqFEyzmm5RVdR2s0n+9QpIISgqI38Tw91G8MIC
	NeE/E6XEeN/T8bk6fYiwDJ3KPRRi96tkKqCFPpim1d1OB62AZclx4QbvKa5TqeQY
	DJVu77NwPGTVxKvRjGM71WjITDk47YQvxwj/Yt0564H6gk+Hg8g1dtgBiMECM4My
	un7NWuvVIkyeFkb6gMunwPXCEeS1OHqadnZlQNiNVZwr6pRdXKq8zZbdmxE+n7ka
	CDzlPw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p2hne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:52:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91bebff9fcaso90084786d6.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500746; x=1793105546; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xdCT9mPPml0Q8wxCTcyjG2nS4+iWw9bwXUbx6nWuof0=;
        b=NKvotkggs/uunAeiSyukUFvAIPFkm7QjTKUiPq2/ujqpm9Q++FBmTYDWmM43BoYahy
         w3fq8mapMbmjQYBp26KjPg0XFYdjWLE/aIBEFfi2GszvLwRqZNl17Xuod9dJPFPp4MfL
         81QduXHIOJFXgbucnMr8HM5K+Vi7ZYhcp9QHd2QU8SGUMoy3wD2x757DIpXpnP4I3WzC
         ky8RGJBs9+MZk1IZ3Gh4Tdmc4cy6f2yNw3CWHLRJ0sbcFPfC92Xs/rhUednqjp6YRoGQ
         TZtO8IkrVxZgUFHvFlRxwby+bfP86uB28g/Nz1PrO/JHiTsXqkI875TH01QDJs5jW58R
         QQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500746; x=1793105546;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xdCT9mPPml0Q8wxCTcyjG2nS4+iWw9bwXUbx6nWuof0=;
        b=B79rdx4J3ug0RpR6k2nPxoBzmuf9WPxEPlTv2UuWu6r50+cxI5uVVOE0t4lyK3/S+d
         ABrPdmDw9mhI4gwMbJoMsR5ZH5H2DayPrSAKemtjPplslQ6I6TMQkdVLFmSK3pgSF1R9
         48+wlDzOUjkFi0iVb71u28fz809tG4PDxQMIpEeyr0DuABWn992V63GBsmZoG3zhPmCL
         M0QS1d/IvWpn55Wah01A52FOR9LocJ1yOCDR+s4fyEBYEBfnwc7715PO/nVMZtHQ495u
         QS4Az8S82h5Lvd8FAxaG9APCjlaEFJp17JtIxntm5Ax2QVROtTq7S+YjP4MQECLNv8/A
         zv3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwyqRRh/8L9bdDB/2zXEKOq9ICfESwHF8QJGTcXBUZR2mWsmQyY1GuZxDDtvNcXFFMBwYrWXD6Julak@vger.kernel.org
X-Gm-Message-State: AFq9FYKOyT1hRkuIKWlXOm8/ESP+0KF560Nw/3gD8cS9cn0zGG5lQvNy
	p+GbYGk1aszq5vf9g928GqGPYw528x1WK1edh/+wmbpAFCHTyBJg7Fmo8JDZT9pf91d7OnutV4D
	+dsP6Sab2DX24hsdtWeG3SWnAw9DbR0g3xNlgU3NWcO5OCOGFK7winEeLuM+y7Pp0
X-Gm-Gg: AYBFou2nAsVF+o99FD4bIaxjJa/yzlIG59HtNlVe4Wshqx1FUspHy/DpbMGv/t2DRtX
	St6H6xDFdDxsizNDbeQKTBDug6M2zXBthwlKlKgjqdjkhawdu9KuPcVYYzqf1cDmrlLq9O8+Q0G
	6h2EhfTzVS5EAx9BHYwneZU81Yvh2ZgCz4h+JGphI4KIC77lC2i5pJGMd8cL53xUyVUxYcUvpaH
	6rW3FCwNB/bE4Xv2bWTocZZJ6DN2LcfNKJYpNXTWWEI029500fCmjl7ja05GIPZS+KqjqTuwLxZ
	6infefgJslBzmPUyEWgBUbuZc9pfWXfWU1FTOhO5PUxLkG0WeIL/ZLcb1veAWDLpCWNRYrCrJ/3
	OkSRnD1WW2sUl+KkY
X-Received: by 2002:a05:620a:2948:b0:93e:d364:c9ee with SMTP id af79cd13be357-93f29dd495bmr1630743385a.74.1792500745849;
        Tue, 20 Oct 2026 05:52:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93e:d364:c9ee with SMTP id af79cd13be357-93f29dd495bmr1630737985a.74.1792500745230;
        Tue, 20 Oct 2026 05:52:25 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80f9b3sm5714688f8f.20.2026.10.20.05.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:52:24 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:52:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, gaurav.kohli@oss.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable CDSP & Modem cooling
Message-ID: <isldc3mvcyqj3o6dzndztlobwft76zkph2lmlryki3qkpoxset@izxcyvx623vp>
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
 <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7NFwC33VnxMpdcqU5ik9MneQNW1vvLCE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfXxlVGK1sxei04
 Y65EDgRkG4sLsNHZN9TmCY3cmyO9lyP2iwXRyi/BLev9Lf4yDvK9OltcvFHbIXL4lOJPW/Fuq3J
 26rzCUQ0yDzh+dKjrp0080gccfuvuKY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX2YwfbrVg/D+f
 v64/gb0BCRVg2ImoFIT/ePddz0utzRM15Mi7i/ybIXTo68Rkiea88Rirfz1h2fz20CpGoJVV/Gx
 PnsMZD/3Zv5pgpQH3tfFcIHjZOh1aE6dvchKVC5NcvVLtJIOXTal5eGRJVZbwJHsChlk1GFYqeR
 gy3qZVMKK4d/HJDv1TBfKT3u9YfTLZbeQ8mr9pWohkIhcc2pUZ9COE9c3UNwvL/kXcv5RwBD/rc
 5Zmr4flGa5WEsGMOjDGJcxG1EI7x0SAa9+lzTwm418KmVJfF+RFjttbpax5mGztkpChXUIvPUTR
 u/qpcTo9aZr+uOgIWOMWtVTNZXs1mGpgIFWSHWKVJRtfFVfwQ4MNdbKumMxi6/6KAJGLbw0Tab8
 qp0k4ljN4B5DLgX0xjocL4IvY02ex9ZeFBuUCGRBgtA0OgctubyyhyQNkDaulSbcPWKj/7PZQEZ
 9zhehvCHfxTAoAJ9u0w==
X-Proofpoint-GUID: 7NFwC33VnxMpdcqU5ik9MneQNW1vvLCE
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad7640b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WKeXBwMsz3nlfjH64nsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200051

On 26-09-11 10:33:04, Dipa Ramesh Mantre wrote:
> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
> when it reaches high temperatures in shikra.
> 
> Set up CDSP/Modem cooling by throttling the CDSP and modem when they
> reach 115°C using the QMI TMD cooling device framework.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
