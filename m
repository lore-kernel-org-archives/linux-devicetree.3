Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501632;
	b=M9rlZEfAp2UClWiDGaswqMHjRdfGcwdHkP2oWdzSsEFPTPIFLvdeHl4ePsNqOdq6hAEC
	 EvsasnXSf28mZfCwtZSP4ttyeBRo0kii1b3m0wX0lTr28PTw5b8vF87fI00c02oinOrW6
	 iSJfr1r5vKvt2tHths9aSv2txT+CdVttCDHsKCLh3tr1I575o7OzrClKBvhSwP66SC4Es
	 4TNC3UIRYeCVmlFmwVD5XDwpKEOUrqeJB2FEQapydsm+BEzaNHa8elnCeIsSEWd5d8ZDE
	 HuLHV0H6Ts8maftPi3zdjwiwn3m8dWf+CGhEQDTTuJP4XNgy5QrfL1idoHY8vnWan0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501632;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SGCLimzuaJwjAPK6tsNiAwtxFv6nKdVZflN0Nff4aOg=;
	b=rOPgyEaY1vYzDimKTtxaIJNVNYog9NA6NBfizh+jB1OxWU/RI6lv+Doe6T7XD0lT5tJa
	 YjiFRFuOlCAgDwp0jOOa1MsVUG7vh0uEsiwMRksedhu+dcbx6Eb67KQSrC0rb+86bDToM
	 G1YYs84FyQgexwMNh1eENFvyiI7D+uMPV9qoP37X602up+lAhMNv9gP/1ETDf0U1CiCCy
	 z33d8nw/i/C4KcJZaM1BvqhPWiHaU8B3IIyQjBqmtWdSljbKjK14IXTRJ3ggX6IaHCir4
	 E7d7jtdBczYi2r5QBigwaRxtKYutD4rVKJl8StEaBuCCeAIdocXUBcx15PPqTLSI7sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GdyKHJM+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NrKaBdi9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34383606A31A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34383606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GdyKHJM+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NrKaBdi9
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxK0R1145611
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SGCLimzuaJwjAPK6tsNiAwtx
	Fv6nKdVZflN0Nff4aOg=; b=GdyKHJM+TDw3hI99G8P5HySP6jbcJCQRXZs5wBtF
	WywCWLmHVGpcxYm35cgmlcCmn7Y7T8K2LSzRvexES8GA/kJLJPLCSz4bVHkRaVR9
	PFDAB1AmVJ1ierm4tO2MtLoZGf3HpHBsLkSpS6bes6VxqcrnNxfPIPWFx3Xtjtgt
	nqOaFUXRDH/MItm9ZY04dQpOEZ/8l/P/GTfPR/UVTbX5NDWtVN+gCsG0qBdPoc04
	lv03Fi81WlxSeOzLJJjs05jPSB5EiNDn4wsYF8rVzYNTjJmPeJ4YkQG6aD05VJFE
	cfil/Y5C1Ud4NZ+1IXu2+QRN1xiOxY6Paoxq341a0X4XcQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5qaj24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:07:11 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9902e6f65dbso364942241.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501630; x=1793106430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SGCLimzuaJwjAPK6tsNiAwtxFv6nKdVZflN0Nff4aOg=;
        b=NrKaBdi9QrwN+aZGMSXRNIh+aJDUNPJ0s+W1JlUNWW/C+JqyucboBUKDC7I8t1ER3Z
         AhKu1tAC0OHPS/w65qsylI4AzlbJ41BUIbXS4sdg5lc9UCAwn9EYfZM98dnvjSjYc1Rw
         WSazPQnYu4Yff7R6pNNaE52MVqVjFqUud/Y04MbowoSjVVPOkkiuKiuoj+plHddVwsCP
         EY+zyVXtiE3Y1vlzojYrLENQvU5L+VvJi5/WdScyjUUWKPbVWgSIlJa8/bS3eCnoZ1nZ
         rE2o7Q+qhKs80BRiqt2QTXILB/GMclmoi15uzGUHBxD+FT83QPRJQk8sSXSuiixamkDs
         J0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501630; x=1793106430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SGCLimzuaJwjAPK6tsNiAwtxFv6nKdVZflN0Nff4aOg=;
        b=Xex3XZTv4IaOmlnk4JImHM2KxofMchb+LX3yQNnOdOCsUFvgVIozYBsyf7z1DAq9Hb
         pvn5vULN0aVs2GRbGprxt5TAXPdUdYwmi4bwspu76nlUYEP0cQk08pBrEkbdAsfd3TB8
         mslA8nPpXsQw3mc++1705dFA61H22vcBVhB7CGCY1G10kjF+GNPQ7+fB7Lyj3uaU9BW5
         UiftXKjpCxSHX9UgnREt+2k98tVHYalkf7LVsEt1dRGuqSeH7ouWheGS8KK351dtPhvV
         jwuo9gOOUzenqtAutQ1IF6hFCY7OlM1CXxOk8OUJBqfna8HFaRbeaYmoaZlxB8BTFLId
         p94Q==
X-Forwarded-Encrypted: i=1; AKwUvByE9CUPtNEV6wOJBQe8mJ7c/m6YNavKjnn/arwVcH8NkYWpbCSr7J7UIiWovDCxxG9Pqy8Fe5Xtes6J@vger.kernel.org
X-Gm-Message-State: AFq9FYJXVfOc5Gr88KGqTu7D59MZMQWbK9eEvbWiMyFF94N0KIvNeeWc
	Ro9AWCdmaCr/G1zblco2EY9FIj4vdBVsQ1M8HJLMU+6XcjEDLKZRJ9uD2sQX5U7pIbGAWq+9N2X
	nQ8bdGgneAQkPnsiht40WLBfC7UdosX2d8QE6DChOcHJUOKH4qjGJZ4fGZLqx3Yq6
X-Gm-Gg: AYBFou16Q3cm3aKU6f/74xTn1AUYYH6okppY0Z9cf7tissdndV82Mr6ME1gQUoqV6BD
	zLD+IjMIaKvbDAdwTef0GKSS9ucSeCg896waw2lSpnk1B2Tp4+DJ3z+crjFEnnB/YfKBLwBklPD
	I8co/lDtKmaENZyxRw8fFv/2/m/qTNVSwBLXh+cBf8mQ9ZPd+CCFXZ4DhBqxeWs0dqeMHGrtNLD
	ZxMbpNJPM6ch9QWeoa/DAUrBgEAE5Q9iH5GTkEFNQc1LtdfZfMlgFMgIkxqUY6HFEvEwEyB/w19
	dEq04xtFkQyY2nwwYwFF0cPdKP4+kUA6y4cAl0HY0PIObY3rWGfeKBdVlIT8jFwyQLqcl79fQqZ
	K+UhZ7RgZdXgiXpyC
X-Received: by 2002:a05:6102:5249:b0:7cc:2a3c:9a33 with SMTP id ada2fe7eead31-7cc36b49079mr2485518137.34.1792501630229;
        Tue, 20 Oct 2026 06:07:10 -0700 (PDT)
X-Received: by 2002:a05:6102:5249:b0:7cc:2a3c:9a33 with SMTP id ada2fe7eead31-7cc36b49079mr2485502137.34.1792501629023;
        Tue, 20 Oct 2026 06:07:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm76533525e9.13.2026.10.20.06.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:07:08 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:07:07 +0300
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
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sc8180x: Use ICC tag defines
Message-ID: <oeccvssjstt3o7pxautzzd7wa7ngo4aey32pahbca3vyoskonz@oyl3hqabwbgz>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-3-cae8d22649ac@oss.qualcomm.com>
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
In-Reply-To: <20261020-topic-icc_defines_ao-v1-3-cae8d22649ac@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xVNTBGAWUR7w1FByLNQ3zxx3x1AGAOtx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX0cyw8hsB68ZO
 OinHLrr4eKC05PeKoumoENRG6/UDDHm04qBKpi3mz6SrXHWTAVltn602ssGB3z8dfmys7QE4eAX
 rzeOcDaKJOe/hT2Bv9aV/+7Lh2siUU/UHwowp9d+OxL9GjhV4HQsRH1g5D+O7xpURkVr1Ecp03N
 EHU+0ejcLzoFwUue9HhmaulmPq8g+HDY4OTmvdJAxHEXtjqY09z7TOAgU07TP5BKbmfN+LXHkUL
 Dd/BObFBimaCoVuQd3vEbty+zvQUCAPsFJeJbadyMI3fC/WRGbOQPZRmRPB/6GNIXh50R7f9gAJ
 IuCCihMLg8j2mXJmbA/2J7KteABigoX5Ep8UXFJ6E2IoJYkO9JXOcmCiNrijt6ZaAfsodRNjmgz
 0RFs8Ui8F2idtJOi36Ej0F+gxf+VCCLKQpJ3OfMo00CpEf9Y9Y3pTkVOaaQ9SwEOK2MmJWb3nsm
 4DyB8CsJkOUJ/UHeenA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX/mfJrSi+wbPh
 U8CdFlub5bcZxyP31Xn4FyV5ETpF37XVD2plnavgu4QFJ+ODDTZpbstQZBJKMKgXLmFn0/s/Y17
 ZE379lVsBQbven+4b13ietFxqaOoKD0=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad7677f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=R4b9nUW322TDey9Zsr0A:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: xVNTBGAWUR7w1FByLNQ3zxx3x1AGAOtx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200052

On 26-10-20 14:42:07, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The magic values come from dt-bindings. Use the existing defines to
> demistify them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
