Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099521;
	b=sDHRBrMzzfoj09i1RlaGLJKk0yQIfpgJHXqaVZ98oOOxoyvDUHa5AYeA61oT0MGrp6jV
	 jzZljAG50drrzdrhkbUfw/89zliI631tWrzY2SMKEdoo02G+v5EIQonKItnHqABcQ2LA2
	 RxB4OT01RY/JQVNJqovOT51MV3Bc76stGYrYSR2Agbl0+xl608d/60REUzXNdKAvr2WNb
	 voMikFh/uUF8piqo2HvI2ypZZZ7g5ydUUzymKXO5M0K/cLhjbEl0Gmp7zdSuiosYrRKXF
	 OZPpRsMNKfA6C72MZAKRq6SNPqba6+v4vuC1sP8Sn7+cL6FjAFvodW0GXJOVVuPZ7eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FtCLJyhlU+SpPWQsK4RHlbtjukmxd1FVsKSyDoa/+wc=;
	b=3jQ/retqRcXInPSRumcFqCzw8OfSkh5iNImZPXH6s5cF60xkx99eMzxg0rtpXVQnPUyx
	 iD/TRKDiPQFs0kj87OLMhpMyjBfVRjMCjYdL/JpvvazjrtfusRYOi6JUmwuGR+h9Mf8+W
	 SCMO0Hu04sSmQRuX6oc0w81QrczmLHV89qsYwqyG8c2VeHOU8rL/0bI+2XPaKQ3W8B/oE
	 EjhIVQ1ajBxFKVt2iFQWEv/VoMcsgb39rjyuDFrrjAnFgm9a2xzxWcER0Lz8OwcEjM3bv
	 UndVejZe/T/27PC4jy17QgawH+BTZGNd4VqLHzsdQLCRk0Kvl6Oaljd9QJctiWzFL9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W3BoJ6xW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ccMwch2j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF72C606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF72C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W3BoJ6xW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ccMwch2j
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe1sP1921889
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FtCLJyhlU+SpPWQsK4RHlbtj
	ukmxd1FVsKSyDoa/+wc=; b=W3BoJ6xWd7t57pU2qjNrJ32YoieGr2XWsKmWDWTr
	wpfyEOPEpmjaU6fBJIRXpbhgqvLO+/oyq1KlZZvVxVMcXdMF35pWSv7t/sHJ39pu
	HP79jp7mp5dOERsaBIwzaWKDSQVqUdIXMf0mPjBoUVVl7Ilw0jzSVi9hf+bq667v
	oFhDecKIdSAteeIuPnmnzs4s90Cf78Uoun0LZll8j8K9uU/hafwPkUZl4tTid+2C
	XBZrHeyp/UCkcA6HdhSt2fLQvvoq3ey2rvChOw4n6JcNU6PFrODWgd5ZwBpib3sO
	CV8W7yM3MzwTwnCTzX63iHMBYS+jz/sZ8hzJjDxLHCjXRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq68jg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:11:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb71b1443so893583085a.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099519; x=1793704319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FtCLJyhlU+SpPWQsK4RHlbtjukmxd1FVsKSyDoa/+wc=;
        b=ccMwch2jldDtGSInmXmTq+QyKkyIoNLnQnoO+k0gufIPNRgGdnl9R/4hFhNNnBlxhF
         5FKRZvAQdlUPDQJL+nW+auFWW/UGiBjbAQmozBE5S8BziyLoDvRr3SRdb6OjIhKIjqaH
         AWxKeKXsnWKEBXdnL9Jf+Pa528khXOVoFSagc1YBCC3JnQ3PaBILVqdtZsFwR37P2Goj
         mi4lwaKUW0OyPb17l/TZDK8EsRfJKHtxMlMJAP0fiYFiv4sHwc9dwyU9jAmmxgjIFzxb
         Y7IV9HobzKExqpMcAdxyiqx+bHGeN4Y/d48znMD5giSzrctG3/adjKG+ggYE6vxM4/m4
         YSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099519; x=1793704319;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FtCLJyhlU+SpPWQsK4RHlbtjukmxd1FVsKSyDoa/+wc=;
        b=Js5UfJ1HzNefMKQpYQUfydT333pNU+vO5nwScNYgqiXZvgPdY/cN4a1w4Bhu2Ifp57
         5qHgGiiMsd5HoD9IBd+c3iIF+LIEY566ozO/72KhjAqGjzFZlN2Ikx7lq8p5SwPrEk3T
         y2lERVSvqaQMYRRKYH+1BKx8TZzQufF8NYkbTCd+Tw9mqLVzODyFaXa0S79ALIZm4Tpp
         RaUzwjz6BpoQWFzdpNYK4VYvFmb5QYr7Xnm/BEsx2TqOvgfzbj4PA0o8Mo4W59PP1wXe
         i1twEaNg2S/grUIotUdfhmW23a0unortN0p0mYXIMc87IU6CQqQ0bcCCXfZm15nD5vlY
         pIRg==
X-Forwarded-Encrypted: i=1; AKwUvBxeVHmXcHsXLEQCuF7G3CFQSqWM0RiUj0ES5/C946WEJcBEK9YpC/4HAnBR+TV+BIbJD1T+wjjeCu5J@vger.kernel.org
X-Gm-Message-State: AFq9FYLka/hJu2PTmwe9qrYMEyIQ6zr5a927NFHiERYPyTm/gE6XpHbk
	TGPAWuUQy7AxBAz3drYxjka6ra3K9gSA/yj8i7l21BW5PdhNBDcBhpp99HhDZx/++cGbLENLB73
	9g884NHRbS3S1YvbIhHQK1MpkbkrLf5JCDRZB4q2cdY+bmvKmmlgMjIFmKowhsw0y
X-Gm-Gg: AYBFou3FOjg0xqbI3h+O04Nkw+YIgoZWBgirdKqP0LMFCUC1q17wZ54C9ffIE+UoB6S
	1npL3IY1q1grJyOPbxePtKKPr5KdGxslWUJl8gR60Fh1x1iF627LWgkQa0u2IyfOhupuEMbNPqn
	IPtY7WQGwVGPiKB0oZdQSCGUk9mYYvBXG6Jfl+M/gDbFRGgSS48QHa7kMnigbNDjskszh+QK9vj
	OiVSzA5OMF6PgSSk20Ck7qSb2mogBTBAbaInnHwNKSvPzsw9wwCHJv+qeLr4xIO8pDzP4CR4k//
	awDZnY526BrW7+OR5asA/vmCCC+H9S2LDgduBWniBSwZ4tTdEblMEdrQzgTC/0b5WC86ZrVPiYf
	kzitOPKsIzu+HQyUs
X-Received: by 2002:a05:620a:468a:b0:93e:5821:2c5c with SMTP id af79cd13be357-940ef92bf84mr1471866785a.60.1793099519209;
        Tue, 27 Oct 2026 04:11:59 -0700 (PDT)
X-Received: by 2002:a05:620a:468a:b0:93e:5821:2c5c with SMTP id af79cd13be357-940ef92bf84mr1471860085a.60.1793099518606;
        Tue, 27 Oct 2026 04:11:58 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f523c0sm128773315e9.0.2026.10.27.04.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:11:57 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:11:56 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sm8450: Add CAMSS device tree
 node
Message-ID: <gntt2dsfdsv6iptnl3wo7ys42adio7vogd7eomwuj75yli7e4b@vfn4n3shptrx>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-7-vz@kernel.org>
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
In-Reply-To: <20261026224957.1115370-7-vz@kernel.org>
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae086ff cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=machDEjTdI7jPHO31ysA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Rzj2Tog7MA3c5Be0dYzK7cpcnMeC4Vap
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX93DZ78k1SYy7
 2y8OIxT7qHHjujg9LccW6mNf4b3LI5bOZ7TQEsqCsOAvlJYVs/zVpiPHjfCjT1bZ/JUY0/8qgIn
 Q+sI6B/Kd44uznxn8Cw7whknYrm08uk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfXzTqPsM+zzQYz
 LTuxt3ftnxRHzRpz40hYC/PDrYn4M/sSlmDh5kNZ7yqhBlBKfP74ZOggfPx3TkS1X1R49X8YN+O
 DGByvQ0ABeq3uSV7J+nUc1I49DXNGEDIhjFOKfDmOIzSrexE+bqnQiYAnXiSQntwNVmMX4CTSKH
 SUvEasSbtUMVZMpbmZglghqW6DWMtfgVjkyf9nTo3+2x3YVb9sj/ysH6NI/plFu2PcrPFIYE6Lr
 iQguH6aFgQZe7Wr/uFGLOGRBLXS9+bdcNARXjzJXgCwlZgY9G2osut+no1CcgwLIgwFJ4zY1R3q
 FsyKlfusbk+1dn1hrvYbd9lxoKw5DIdaCyirq/bHTZBbISYIgnayV3jAB+c1hoJMAKQgV2t/gFc
 rwAjniTjUbnvNguGQkJPHxR7S9qT2rnc9umUYerUSZMn1OjlbTnu4fn6NkAui19TE2nobNVa658
 5hcOXx8YEmHpfnYWrhA==
X-Proofpoint-ORIG-GUID: Rzj2Tog7MA3c5Be0dYzK7cpcnMeC4Vap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270044

On 26-10-27 00:49:56, Vladimir Zapolskiy wrote:
> Add Qualcomm SM8450 CAMSS device tree node to the platform dtsi file,
> the CAMSS input ports are connected to output ports of CSIPHY devices.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
