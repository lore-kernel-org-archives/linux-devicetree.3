Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D7B36606C
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 22:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775340280; cv=none; b=Wws7v8PXxvS260t4H4/FCgVT7mi3AD59BzojUHNp5GLVw6EEmR1WxkqYn1TCsYTxzcVE9Q1BBxVRkjXPjlF+2qTbq+2AVhrpHIQ/OdTL0w+BQurYPfMJ7RYa6ILWxX86xid3SpMetPerkVyNx0wkbt7kFPn2l6LwWinqlVH2pck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775340280; c=relaxed/simple;
	bh=Mnenjn84goxGc+F9hR03yqfMbnySvASBDwsNf1LA+m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrU6WWEOQmmygOcRBE2JZf7QR0FSVOf8aYsOJXCPWhdMPt93WiVHwQiGQ8PnGl8kqvxs1s0DiD6wWrkPKc2FUNjayAbwaEgiCWvlL7WazkijPfc3Zue6H92Zm1TRNtrx2oAV90HkrDK64gT5jHteSpN0TMZRIT91cTuXxDzfrlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4kv9ThK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ug9y7LKu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4kv9ThK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ug9y7LKu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6343kW0a2869033
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 22:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dUW0RwB9Q/zSV2QNFW4FlByk
	kVTIFbYnaBQQuw6cd1k=; b=j4kv9ThKsVHyPQD0xJtUDSegpJ7WEFA+Fi+DGRIz
	2zROxRvor8BfJJKnEUdUvkErQxbwIbKlttGOZh+XtyEfYeLRqGniuJf7lBrJcinv
	jZ0YWyqhXLi61BqtykR9UJYfqJR1FtquEIACdqcqc2HNBV7tkMWqanmNYfXoZV0l
	v+30h3ZGlJsI+KRhPA/yBphQ3pH4r/E39TgEbswMtXfoDO6EK+Dmlcwje9x5l4C+
	2Lhm/XGJWBdbgN4ilwXkRSSC6a1tzqTFVnzZXFeFPQtd4GI/pOOmdUiJlRCPZulq
	+jR4p2BGL0pMOEJVXpPz6qhxWC6DWhydj9bW7KLVr+yKHQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dau14shjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 22:04:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d890580e1so398661cf.3
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 15:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775340277; x=1775945077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dUW0RwB9Q/zSV2QNFW4FlBykkVTIFbYnaBQQuw6cd1k=;
        b=Ug9y7LKu+cn/69aY/V3zHCowg2KgRjSp7BewurXBtQu8Fxj0oONlDH5BrsOlaaLrY6
         g1wmdk8fY9ODzzPzMIJ4CzHUdSGAb0NTtJEcrYh6zTui6SIXXOOxW2ZcAxhu0XOwkNUd
         SrOaYCVgOmtPBdD5AMplYQVo+1y1cy4Bh3OCC7dWb7FLHc3RunOSq/yxEZ8vw3wRCoj0
         Y+b8ZqDBU7zYi+r116x5ZwUCHePa626LkofOlqacC0SJGtaoz0RnrZPpO2Cn14DZHw9R
         S7s7YqgKZWLKAu9Umv/Y4uJ1uEbsvFlNbrX+7x2TYaPeZ+rLxaFCiD/4O8KWVddzvXGD
         rNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775340277; x=1775945077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUW0RwB9Q/zSV2QNFW4FlBykkVTIFbYnaBQQuw6cd1k=;
        b=EMl2QT9AVFiRhZ51F30A2+l8Wvs0CX1j1A6e6oBdmg+29yLZ3VKNJ9qDUgO/DsKom3
         mt4WgCehOjfBQ6eLT9Pk1vIgV9gyeHCveDRJf60gu3iS0Y12/yc2o4sdPsH2uMauItlr
         9X4X+whUsPLox2fzV75N10jjp3ltfnwRD/kYcFiTpx9oQLzAIGp+vwwzbYWv6QxF1QsA
         fOXToSTqjTVBBc6cP5zfTPNiHmSc9D6NOZQrK5TujlhsHy+ok74cPhMwzvmFqzKiHyx8
         LnpKgGEbkOfIwskH0aJ73adVbsdfgujchcMgp+7Pw+FXSSgiLY6ewA3rObz/mS2jh7mh
         cryQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjN/RtnR+/Ghxk5yUxM2U7yTg0hEH/Y3Tdg0biusavVwfSNSql7SDIZFPReRdymQ7U2GxjfgQHVqEE@vger.kernel.org
X-Gm-Message-State: AOJu0YxBmwDU0IJcaOlqlNiAwteTLJlxakt6v8CN0agEd6lPIwhDAg+d
	6imYHBHJMto0iO9E9EJMA9HCI+QcbolMuTI9hVZHYtBSg9bqnizqYc1KlsB06Z9+w8xmEKWTU4o
	4xFDFrZh4ueqrYjIDJV1icAT1eXbe6OYCEVa/PMIQJGn5c9Rea2/cWKYMIY5yXP1y
X-Gm-Gg: AeBDieuYHq/MtkDYC4jRLZWXRLT+zsK49bglEPl1yH3CWQJnzMNLi5gU6RnHwjjJH0V
	reZNYgymcARsyKxZKVVREbOTXVYYIV1VbgT/fvTUok3noJToEXeHWWDYvKWlLPDqTqQ2nRs3Kwj
	0Z8oYhNmfqs690Mr6yCZYbCdhIZeWbNHOaLD9SVOx6pbH0Ca9yEHKXOVJV8laRM7EfygjCHVBtT
	/QpZhofh6CfL4KMoGRpEi2IocRNy/tRGpR+36LCLeCZpIoAOKw+hwsQlBHXdvEXmkJFWejrEc5C
	dar8OkUDsfDLfQ9619ik3cs/m24ky3cyUyq7je0pvWrU6e9wlGvKhogmf3pRFh6E7c1QUvZ/8HI
	YIpHLqWH2eucLnlpKNjUdRIHi1n+4KVJwyV8mJGJZcpzNJGPM5w5sSkhU3Gr+2wajUlFUf4GvCn
	ZuPVWLdig/994uIjWI6PHoN50HkOGBz3ZlbsI=
X-Received: by 2002:a05:622a:586:b0:50d:8102:e9c3 with SMTP id d75a77b69052e-50d8102ed29mr36229081cf.57.1775340277225;
        Sat, 04 Apr 2026 15:04:37 -0700 (PDT)
X-Received: by 2002:a05:622a:586:b0:50d:8102:e9c3 with SMTP id d75a77b69052e-50d8102ed29mr36228611cf.57.1775340276788;
        Sat, 04 Apr 2026 15:04:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd212a940sm21365631fa.29.2026.04.04.15.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 15:04:34 -0700 (PDT)
Date: Sun, 5 Apr 2026 01:04:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/7] dt-bindings: display/msm: sm8650: Correct VBIF range
 in example
Message-ID: <xsspzrpmlxtmfageptdvodf4bptbnd5msvelhr4tvjvj2bznjm@jicwkpbukm5o>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
 <20260402-dts-qcom-display-regs-v1-3-daa54ab448a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-dts-qcom-display-regs-v1-3-daa54ab448a3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIxMCBTYWx0ZWRfX8wx25xIakcys
 o+itqPvK3Z0Idhh7qk9VreBKDnB+wP5zHxO6N0HjXN4H0mInb9nOV08cgLQSmUrap7NR6ei3AIl
 23aaU75+yWYjsaag2SP6yB4ikmp1ZvD2DPjccwbkTrtfikx1I/1m7lvRT1Us52Y2l/xnVKfSlJY
 RZE3WfQF2xg4ItIBpu7FnYMg27foUjWFXBpe0UbItWdbkaD18u2EAteEXwzOyPpVDVSs64dWlql
 b1uGFZBdW8fwqoH/zvPHAiUoPX3imqjhpaLtQf3U+i2BF5VDYUV1KXg2iorUuATpRDfgqCwD3tt
 iE141M1t8nuXIFD1ya6jjpxwp9DIfj57YsM4mc4DF3YgEXiFDhJ1b0z3DYxfaNRdMVHwUsm7a+m
 v23GgnPV8fGtVlnEtZs77V1wKmc5JUZrks18E7xiNZcyLrl9SfNe5Ul36pygzQY7loCvMizQkDn
 gT52pcPqykS7zkB3UwQ==
X-Proofpoint-ORIG-GUID: aHLIY7gkMk3dJsRVUER_1nPsCI7KHDVD
X-Proofpoint-GUID: aHLIY7gkMk3dJsRVUER_1nPsCI7KHDVD
X-Authority-Analysis: v=2.4 cv=Q9HfIo2a c=1 sm=1 tr=0 ts=69d18af5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=vvC85rtXJxrRrxXJzTYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040210

On Thu, Apr 02, 2026 at 01:45:14PM +0200, Krzysztof Kozlowski wrote:
> VBIF register range is 0x3000 long, so correct the example.  No
> practical impact, except when existing code is being re-used in new
> contributions.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 2 +-
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
