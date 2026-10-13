Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709D14734F4
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887818; cv=none; b=BzSMoSIWRdOwJ6JEnl51Xeutm1yU/QZ6VOOmqtltwfPXTlD+Q2A0S6h7lY/p1swxs/of48vx9aOK8jN9iUtA1H/v63scxhkBbXDEbd1kYKwF+uY9eEv38Lm6Taq9yAgCw4sItTlvKSy3ZDsMXJbMLf0goSUF5FgWvKx3VGr9lHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887818; c=relaxed/simple;
	bh=kIYdOrZioVi+Jik4xHZPXcJ/cUSCGThc3VkwxvfhXeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7IKp+q4ZWYutUmWOeulKHvMwdru0EojuSAvul6PCOHgbd9YTprXbi0n26GuIu2iceNngtgygYhi8FrHjHuy+EiXrx+jlW8etTEWwSoJNRNzu2cEtypnXJT8741hcMFYPbfxGOq6kfA2Q7Vt5eCj8DmDMJ1B0aoE9XlaVpVEiXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+gZru64; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kDF8zZnw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+gZru64";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kDF8zZnw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6YsH43208378
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zYBal9rK8MNWw3sb2Jq+R78+
	bxU2u0lgzC26Uirjy0w=; b=m+gZru645F8w2TLq7cze0QWS1WUWo2ldE0TXPJcH
	o9c93wWjyTIXJBGf5o0lyEIRt5Aswm3YmWlHMmeV/IHf8Q5IRVTvad29KRGm1XGO
	q3+tk8klbWPW5UVNacHJz1WzrUyxCb57UhocLcDzv8zefoQqF7Az40k9T2m1mAgY
	nI7R0QuhmdLDOq1bR+6pBth2pxIOehKK9FIBSPGDQoMCfYsJeJ14jdkYckidv0+d
	b6XlPdEChMaXNp9luxV+hHBRJI3Dzt7HHd1L7zOTv5DarY1cYFqPAlT+eqHb6+gK
	Uo4sAUZRTRd1qKqm6P4p8lCMs9TPIHEzFHopqrD4D2OaZg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjh0mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:36:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so550690085a.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887816; x=1792492616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zYBal9rK8MNWw3sb2Jq+R78+bxU2u0lgzC26Uirjy0w=;
        b=kDF8zZnwn3+llg37DiQBw7rmglCSD71BwhFXD/vVtmIRIexRN9fq0dsbHTTLxeFNT3
         951zsryqBfvN6QnJ+32qifqqdEMJjZExF0gHaU+um2rSbF7m6h7k9L7U8iDAbuMTisF6
         XOTWrp5v73Gp5OPkQtfkLXBpJOhrG0HnwghPh1P9XBd2KTmTU5g07WxLg0HzqO0UZ9J8
         6SL7rRD7iTQcDLDHS0yz5lyupGqjgCHkL6gSCKwN763MEaBBcq44qVPC371k558BSCMV
         AojUMd4FvodKCDp7ojSy2VT0J7OSG+OdWtY/lKx0geHVSjSlPHn8sAzTzXS4qLgiFZ+2
         7M8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887816; x=1792492616;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYBal9rK8MNWw3sb2Jq+R78+bxU2u0lgzC26Uirjy0w=;
        b=U+8EBfNfPxvEjLA6Dcppv0uH9BfJEfjaCKVa+CdgyAHAhBaP1XBT1OFp/0KV/bRLTR
         W0Fq+/07jVrVXdS/yJjJuETWy6g46Bd8bKiwglUrClGmMwwJa9QJnbETw/J8OEWJWF+2
         MQq5pq7fkDagCveoWu8iQQXXwdESAk1bHH9qiwFz5svQU50U9of36aVqpEpebaU3G4Zi
         sgwHSY3Mz/2XFa227KrnY2Z5LAVocDAwaZvgKaThHZ2EZCXXjpkhP9SXavoGUe3MTTYk
         xPz3XqwAKAAidSr4k9cZwxwEAJXCA4vlkuLli5VpkUZBIANUE/GIuNDn/lm/c6ILvlGP
         nwZA==
X-Forwarded-Encrypted: i=1; AKwUvBxbZBLxB15TosOaD1PsDXoIatQne2rcNqByODr4+l63Xt5t/XV1qYzo66iw+7F0dzjc5vgWVjZtIUV7@vger.kernel.org
X-Gm-Message-State: AFq9FYInA4xz6c2Q6pe0sHndsEoOaMWu60S421ET/KFOB4idQhnS2iOW
	QfAMOBvKsMUB65c3A3GH7M62B6QngVDmHB390SE4qe2mzDSZc+/8bn/E9tx8YFY7DsVDxxl3Dwg
	fY+VL4xoXEZYflYO3Rf6RQHCDH0ZQetHI5No8d5w7LHHY4F4lt2UMl2zidjv7e3e/
X-Gm-Gg: AYBFou0cEvrJwKDMQW7pmPMsL/V/kUyaKo+CY5qbVWtsKyZmyxksz95Mlv3wvcVwlxx
	W0Pu3jNoqrfzMqlzXzl4dvt1QGDsM3tZFJ8q71onQp08R7qgNc4nIGSmqkICD1K5N5uJ2FoE7mm
	L+PlRD4KIyKnAtCj6Was4hsRKyCgIkVjm1F9ZNszrP2knzLVYeYUYRyMHVdOyDjXR76DwUgK8B9
	SLePqJtdvZ1aXXYUs5ACbjJprSibI+UO2Rl0eKyI9Eb5vxd6UC2E2JyLJnrmBJVJADr8LUDwxQt
	NhclycjIU1W7BgzsXJoXvwCMZ+akmHW/DJ3/4R79XLUEY8uVsgtUSP6rvlhMNcV3xRgBqD4L3u0
	isTKrI7eQh0BW/cedn/eehRCkVV3lNUgEj8y5unkvhW4kwxti0sF77pfhKySs6w62u82+k7WhDq
	URfoJbge1aTk2q
X-Received: by 2002:a05:620a:29c8:b0:93e:90e0:d2f2 with SMTP id af79cd13be357-93ebd20b75amr1988581285a.41.1791887815620;
        Tue, 13 Oct 2026 03:36:55 -0700 (PDT)
X-Received: by 2002:a05:620a:29c8:b0:93e:90e0:d2f2 with SMTP id af79cd13be357-93ebd20b75amr1988579085a.41.1791887815195;
        Tue, 13 Oct 2026 03:36:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cd5d8fsm31886291fa.30.2026.10.13.03.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:36:52 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:36:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v3 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock
 enabled via critical CBCR
Message-ID: <oqi2xquf7w5qahh5ufeecmkpy2qhfenu6v33t3vbz43nsph2q5@cseg4p3vlnyh>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
 <20260724-nords_mm_v1-v3-2-32b45232217f@oss.qualcomm.com>
 <as2gyLK95eXM0WgM@QCOM-aGQu4IUr3Y>
 <as3_5EFx01FaNFmJ@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as3_5EFx01FaNFmJ@QCOM-aGQu4IUr3Y>
X-Proofpoint-GUID: jNy2u-QMvzLP7BtVFFufOZ9o0q8glVoM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfXzN8++DghLbhg
 amBBVWCar/kKueGIV29xrJaoeyqr4Csr3n/Ae8HqMGygs+bWNnnGIo2JAEodm1JRkmii34iFPXU
 HIdUNiyETqDxfcfMFu502eLu9S3Xtu7/oiJFmOV0rfHJerG8SKxzX+eiPB/cKvHOyclNDZ13W42
 ugqH3CIxbvMX/2cD+9racpSTRcwsT2TEvE4xLDvuFzcaXSykGaU78UaYI7ym/FewMWTYDpVbnY2
 T+q2IPf4PpTcxgv21yEpQP8LXkIwt9eD75EtCxzVxokmf/t1rB2Zaet6w4s9ANp+BmRrxFfkP7Y
 DZ5WFWDhGSI4szvxkaxdvupRL1L4WwAQtAoO09woJgCqaNvAoqI5bsyuP3/4fjmlw2/QP6NRbAY
 RxDw+bKH84LYl6d16NBVDSaQWWQhRbI7h46Gdi5634csrRTx2X0MieKJjyCZiEDCJRKFiH6q/1D
 rmRBl4Wy3HfyxnF/cjg==
X-Proofpoint-ORIG-GUID: jNy2u-QMvzLP7BtVFFufOZ9o0q8glVoM
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace09c8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=7EVh-ISIaqCJ-n5hSr8A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX1k3+fKGcpHs6
 yLDke4Cz/03GHqrOy37cHwq+mH7JZW04HPUKmYB/mOgobrjjYW/UPmHaP4QI35rpN5OtqaZi0pQ
 nd7OkHv92qYfcUL/MzfQrR1ZAUfOroA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130042

On Tue, Oct 13, 2026 at 05:54:44PM +0800, Shawn Guo wrote:
> On Tue, Oct 13, 2026 at 11:08:56AM +0800, Shawn Guo wrote:
> > On Fri, Jul 24, 2026 at 04:25:06PM +0530, Taniya Das wrote:
> > > The GPU2 CFG clock must remain enabled for correct operation and
> > > should not be exposed as a controllable clk_branch.
> > 
> > Hi Taniya,
> > 
> > Could you share a bit more information why this is the case? I do not
> > seem to get any problem when testing without this change.
> 
> Never mind! I can see the issue it fixes now.

Would be nice to capture it in the commit message.

-- 
With best wishes
Dmitry
