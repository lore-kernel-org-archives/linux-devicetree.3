Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F442D94BA
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778667880; cv=none; b=KejaFwgt3Kg/Wry8dZ8L4DSUEGRlykS371jE/4BYnBtuU1Yx54YY5iCQ5SZG625uNMvt9v2Hxa5FhnwY0zAj+qV1427KLQusdFNHBr1b0k261v/6Qbua3A7o/rPrzqssnE54IZCT2dKWPjxrRY9mTORDI1wNkDu00/UcS7dN5Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778667880; c=relaxed/simple;
	bh=Rap07eWKuYUwf3m7asV/sd7fN/4knB6aoCl/FA8WpjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QD4c+6A4Iwzs94OChB2T3RJuWL4OXpemFqhmf/qxVZEcSV8rmSsekhFqwR3LKfn2Gd08f/7zczn8Y+0feau7coWwgnFpYgB93OP6pExinr1Waq95fv00zKOWkR0K7xbhJzT7WyAsBNic7nOFEKhdqcQDT7GH7ngSw110EbPYhRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n459xclz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OF33iybl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n459xclz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OF33iybl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pGnv2338932
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ifxChmry+TttLoFTQQ/tL55R4hjUx2mBibZDRYzje7c=; b=n459xclzrhyZI8rh
	ahLpy8jIzNeMLZuEued+3bxg6DPmCaFbTuDq8DU2owZzCvvrn2Mg+DQEPK0c50Sr
	jV6tsw5VvTlwESMA9S09qs3+PVS6VJOsfaDcwntdwxN9WFvJtHPCd7C0HeEilI/t
	sH1V3XnzzIgiYs/Gj8+TdiY1jdoZB67uIypgwYdU3o2cUXp5+tyjSTeIWdS3svfz
	lNG/o4/uUkNmJuGXJH15ZjtvFLzpBu+xyUAOJXBAG2WWtsbenievG+RMNEJZduDy
	5uNzH5D/C4NTJ3bFII9+xEhj2odA+sy5FgUAbF9BHpJpKjfnTpfNYJEqPHxh/yca
	y6UJdw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxayjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:24:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faf575af4so149925061cf.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 03:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778667878; x=1779272678; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ifxChmry+TttLoFTQQ/tL55R4hjUx2mBibZDRYzje7c=;
        b=OF33iyblBKAUQF5QqV+NnhX2THe5vg+1PIPjXrNNz/yLhKnkjSYu/tWClEXvSCDbZG
         HAHZYlWRlLHKnRLKqYQRGdQzr0cflM3ISARt8dg1edc8b0ULjCfEfN99axRSuXng04UR
         XjGmnky9A+M4kkpQRVYkrXFMlmYJkPmEwg0F71PQbrgEjd1mXO76oRIGWgYdfcM9SLhK
         IyB6IJ89Ilujt2PvfSG2Cmoa1EfsJnVRPA6ZHI85pg2bnpCTEce+u3dNHY/3cVa1sozo
         19ps2IydEnyNiFNXU6FsvLl/pom+5w73rZmECY/Fwe1x3y07q676IQVVr+lLfzwyYJrG
         2aWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778667878; x=1779272678;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ifxChmry+TttLoFTQQ/tL55R4hjUx2mBibZDRYzje7c=;
        b=FJb4rZ3d3vnYnNgLh2OAHUizxFPKIaKNd6LW3BV9dRlD2YhXHaqMlkQfJ4Dsvxvrpb
         ToYxSxd3xepoVvu3hFswqJDuTyBsZ+Wq0p5LcGzGo5VKdv/3HrMHwbo1+HllFYk27muc
         pO52zbu8fkTGqFqIWjfb3VKy+xXY+tgKW45VpzeXEKfhQyrYBErvelu7WicTobQibuKE
         36HySsWmbYxI1qEOWy/JIG8EeD8AhxHmhyPQOvG+lpfhkPNBn6f3vyujGxxm6ym0JuKl
         SQGml/DEKnQ7HYWJkOHsje1STej7oi2lUFR15+uJEHPrY8/kDNEtfsboz0BLxcqtKe/D
         YDWA==
X-Forwarded-Encrypted: i=1; AFNElJ+NWkzS+MUbjiTvgYDEtTrbLGZIcjtg7rYyU23ZVwtzMq8pUWDXCce+XN+RkX2Oqq0Lbg9rxpRle10Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzqALiI5+iQOI+RgPdpCzN57AYEGiXgROtZrnSqR0zpV/AvmiU6
	5PKahPXCrchdd5MpF9Ud8fqXwQ81+FQAnpjmEpza4+0vgjXPk7OT7+4ReOyra9aJANGNG9VCW+j
	XxlUj8Z3X/VOM/JYES8rVi3xJywOQ6fbZUBJ1wMnb0yhFskbWG8FEjNvIZfwlR1Qs
X-Gm-Gg: Acq92OGyr4zk9sIKXpIWDOcMRNJPBMRRj4HQbgxJnWRs9Ggnm7J5gTJX3FUJkTsAFDc
	DyWd6FGaG8g7y6nD053TVFO/i4ttaaVWmCBqRtZ3vlk/lkaGCM/KescRka7VRHkaAqEO8cToQiE
	DEEhUv+4b5wotQ2GnHo3fGqmLCkEkfVm2FxkEbACK1zdpzHwbZDD4ArPvue6i+TEs4R5KPBMy/u
	ZJAzUPU5kSmYEMM34skYEDxj2KHx4tOdnIMBRY2Kc4HX4mkdJuW/Sbenb1Ou7/zUtYOc6kl/EyK
	qwuqJN5eIO/HI57TEg5qT5atTsy3e7xS9h6SBUUeSd0gB65Cv52PYRj4mnYFhMGgA5S3XIzNFHJ
	B6dE1Hry0kKVWOLSkpTMX2CEuUHWtwAZKQHjJuniai77LjZhUUq5R5wn1fDS3akXIWVmL7eBCxy
	n1PvaZ6mhI9cB/qT6Q6Rw4uh13o1t9WgPOqwc=
X-Received: by 2002:a05:622a:5885:b0:512:e813:7ce8 with SMTP id d75a77b69052e-5162f67cf1dmr32339351cf.54.1778667877686;
        Wed, 13 May 2026 03:24:37 -0700 (PDT)
X-Received: by 2002:a05:622a:5885:b0:512:e813:7ce8 with SMTP id d75a77b69052e-5162f67cf1dmr32338891cf.54.1778667877183;
        Wed, 13 May 2026 03:24:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955e19dsm3963961e87.49.2026.05.13.03.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:24:36 -0700 (PDT)
Date: Wed, 13 May 2026 13:24:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sunyun Yang <syyang@lontium.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
        mripard@kernel.org, Laurent.pinchart@ideasonboard.com,
        tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com,
        xmzhu@lontium.com, rlyu@lontium.com, xbpeng@lontium.com
Subject: Re: [PATCH v6 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Message-ID: <vly3gbft3k76mrcztcn6vxuqadz647hsaz2q7qpmpofowofodb@nnxrr2cdueru>
References: <20260508142500.4922-1-syyang@lontium.com>
 <CAFQXuNYq5QYAXRzcUBnyvVh5ofPBVYONCs1dM6qPgK0BDja5Ow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFQXuNYq5QYAXRzcUBnyvVh5ofPBVYONCs1dM6qPgK0BDja5Ow@mail.gmail.com>
X-Proofpoint-ORIG-GUID: LIt0xBLMVTzTPU-mdlZHHE8OKyDj6KdX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEwNyBTYWx0ZWRfXweAzEUp4Yjud
 Bu7oRPwK/DKkzIyU0xzoLmVWl7b8yHY4ii9K62vjLfZjAcHW+R2YINHIh2dZJIhdT0fVkOaaISv
 VC4+PQejSkzAdsfN5inQvWbCXoFC/kATqmfbTcx0kreEtrZLQG0v0LFjcAPXFU97qyf3eL9xEfX
 br/HB2jaFw7+U6AKOqXMA0GShvYwvkapDYujgzRA2ZzCnp+9al53xJ2BHBAeBuOqfFoSpTxbYxI
 7Bko7zksnNBvGOzbk0oRSr1L9LP27niZlqodMtseKEYfpROnSmW2bqEd1RQSd29iJi/L/IaFzRK
 HZFZNnA7rterAVFXYQWrdkM0ZIwYnaPgLDPLk3l4sJBGkX1s12Z/61Ynk7pHJDdue3ek0T5mcDK
 fZDwoaDDxk2n/Fc3KmvGo8DG5MVIWGa92YhgQXtsjHhqh9QQjHDfmHnE3PxB11xWI81xDI5dq5Y
 FH9ia2plbYM7zNBoXfQ==
X-Proofpoint-GUID: LIt0xBLMVTzTPU-mdlZHHE8OKyDj6KdX
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a045166 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=Kz8-B0t5AAAA:8 a=IfaksdFsjFagpZptrvcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130107

On Mon, May 11, 2026 at 11:28:06AM +0800, Sunyun Yang wrote:
> <syyang@lontium.com> 于2026年5月8日周五 22:25写道：
> >
> > From: Sunyun Yang <syyang@lontium.com>
> 
> Gentle ping.
> Thanks.

You've posted the bindings on May 8th. Please give maintainers some time
to react. Not to mention that you posting the bindings 4 times in a row
(once together with the driver and other 3 times separately) doesn't
help maintainers.

See https://lore.kernel.org/dri-devel/?q=bindings+Lt9611c+v6

> 
> > 2.34.1
> >

-- 
With best wishes
Dmitry
