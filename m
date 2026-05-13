Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF8140DFD8
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682282; cv=none; b=E3wlTZqy9fZN7XB9ypc0ZmKjQbWVyFbkOG36v0DRpJ4/czp52MQOgVfPfZ1zq2GZYPfdvFTIzbkC8D7ttE+sOFK7556tNmwMZkhsqVVP0Hne8GFiVrpmSZVBr9Sg6sqJervsqm09UKr2V2rqX52x6D+lnMITjLR1VWbCuto46lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682282; c=relaxed/simple;
	bh=v9DNVcgbp6AvN+3guy/5FOJyEoFIXSrq36l0ZPnSLU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/r9iJ/zoHE6qRnaRoVaSHNQufi89HUQUO6G1J0PkmqZiPmtnDB8WnduOhYYyck/iKQE3pG6dyFE+e6x5tZHERAeoqSz/ggDtaD6VEIaG8p73MFnm59tth5V1wYRnSZpiZ1OlVZao6Bs17AItL0EmKUYfHaOswdo+nwiC/qccfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DaOAPn+D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jAzJPTLQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DaOAPn+D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jAzJPTLQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBmU632965306
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+mcP5MFy7RzNuC9vLmEtmub5
	kAChPr9XMnvsErhT83c=; b=DaOAPn+DOeblJ51Avd5Ur1liXcVibs5AnVxaRvR0
	Jvvuav8lFcqejdKoKFsa3PXChYS789s9Fyp44G8Y+N9sg5yQ8MyCROp3qZxRwIPr
	5Yo45Ju5TZHYzA8SGXIKdlIigz8ujijlwz2NAjJSSdujO818dbaPL6ijKay/5neQ
	OqJfwwVH9e31Gbb4tayVx3G42FOHZey2hQvKZAAI6hkwse4yZu14p/S8hw6hPywp
	4hMuYXAew/qTQif80owSphr0BxA3FZOmXJ1/ilPio0vdpUyt5wz5BAM9iapZlhsy
	z+5w1D0Ln9Hvm22ZAV+Ca1Cwy15+oMq2hjpIsIfc0QvWZQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma59s79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:24:40 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6313c9d983fso2679669137.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682279; x=1779287079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+mcP5MFy7RzNuC9vLmEtmub5kAChPr9XMnvsErhT83c=;
        b=jAzJPTLQ6OF/uF0ZzNFvQnSiQPSz0TFMXnqhIkfLzzZvsUeVoICXd1oNsOY/tLNlLq
         DCW4Fnt090t9Mymahe8aXzIxIUtY+3VQ2KoNIVH4MhI4zNy416J+eSiEeS5itl9IDoKn
         e+UVjGizBeGcEgXjHg/GIQR08jj62voCHzY3/RuVOAPOxYKnScUsI+fmUokqaUyib1Z2
         9Pbk7rfklRIayNwb7xHpZKEz23vOTczsr9qNPSx3dIdqy8A9lw3sZIDDUUoNrYyWxvOh
         Pt0BhF3QvkwWvElSYtLv7SWzQqr1giX5zB0gyAgTRyVu43ySEb5+mOc14zx+xol44UPS
         qwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682279; x=1779287079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mcP5MFy7RzNuC9vLmEtmub5kAChPr9XMnvsErhT83c=;
        b=PDQCWWp3LEpxRI5YPmyg5bhlQuAS313rH7uXe3pKuxw50oT0hEixr6NQ7fs2yKJCNM
         u2fxd9lm2hefrvZ/5YjVOdNV2B4Uyph7GWVJAXxKWBaduY4Wn1+c/bj2viN3d1WPO2Sc
         lK1P7WalSe+ohDLYElHB06c2g3wsvPfSK7xgLrddYhh8km15CWCBy28F8fsDTRe1OStM
         93TABRZvrN2TdUDMrs4S/WBJ6qXZdM9rNNwGka6k4qZu0F1S4zeMVSVDRd0jk9mgRUK9
         OJHV3UfIVvW7r1ERKQQ/UPob0GTgAmDaagpuimEQtDIUCRkkjgeoTMKd/vPS3eWBaTVL
         v05A==
X-Forwarded-Encrypted: i=1; AFNElJ8vjjuMfHh5c73zUPDfcvZGdaYffph0h+6dwvN32jgBrjaAlGtQdKhMqJOxDF6WBb6npDjsA+VDO+4U@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa1Bwx4YyMdTt48t4wd5+/ZptAe1ZjFYF8bCg7Yx2tqYKfWeQH
	9LJ2LK5STGViph6T+SvxfA2RcxeIze9LMGi8OcY6eezmTw3n2XLRqlMcrVAYmQOJUpoJekDWTxu
	WQkUJEUHiYD2iv66If1lwRavmKVaFMZ878T8nTNolhIenr+1nxtOhVB989w/Qiueh
X-Gm-Gg: Acq92OEvrZKCtL1Nss8DmqJK4F+tbM8WmlnDrGMhfbW8F3n5ZSS1HE2H57smHt6czA6
	vu+w75qODsoN6XOAkU84rvqa7pNceBrtl4tPIIQPviFKTWxKzakumsE+WXcwdMjrI3WdpacquOs
	5q+AeM8wfwiti2XgbA5KjZYxAYfOiYPEcKYr7HkoBtrpcUGba3cAfN4+hh8ruA9FQ2KEyNge6yX
	HlNvahCT/UQjBS0I6BIGh+75EqEuJnVV83aQ8UW804cocUqX0EYjGW9RCxnfNdOhDPRvRaNgHoP
	IlYnxpvX2Z4X/DifBlx2RQrGWcjjCwhXhHWz7Z00I5USgCrSq3Esn1KldnIJJ9TPvTKNCdsSkVb
	PuzJWlnbdwUP/cROB9zpPF95Mz0DTM5nMmiVFtiveYbwXiDsQ/6nf/hinHuGC7YrjgTaMPI0eKN
	MYo003QrnQyEiahM1mdwaKmLU8DcS3iD/svTY=
X-Received: by 2002:a05:6102:3907:b0:631:ab8b:c34e with SMTP id ada2fe7eead31-63771e9aa85mr1645011137.11.1778682279054;
        Wed, 13 May 2026 07:24:39 -0700 (PDT)
X-Received: by 2002:a05:6102:3907:b0:631:ab8b:c34e with SMTP id ada2fe7eead31-63771e9aa85mr1644975137.11.1778682278513;
        Wed, 13 May 2026 07:24:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660c1sm4198174e87.66.2026.05.13.07.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:24:37 -0700 (PDT)
Date: Wed, 13 May 2026 17:24:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: eliza: Add SDCC1 slave node
Message-ID: <mlkphm6papkmtyvpafrllev7vzk6rr44bbll25p7gdwbx7codp@rz6m3xd4gytt>
References: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
 <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-2-b1edf81bac3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-2-b1edf81bac3b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX+UTMgNEvf0of
 RRr/WNJsnzqhvt1EfRPFoTchycYkBPEawSO00T/mnCqIy/Bxxzd7YTCaz3602+tcaeTs6+0blra
 YVzqZWdBukyYFp+uByyXdexbWDe45ntuMqEcPtAlAsmMSpZtEnhFK5zQfkCS0Ba8ypZuJZtefFe
 IPV0o9UGaTmFtBwClhpmdDhhheIbxd0iEx+gEgsjyVrP/gesQ8gVIRAwtT9TB1ySwW1yHmx+DxV
 1qgh5PXEmIDLMLd8Sx+gjP9v+02jkCXf1/xXfo+RIi2udOFrIP7Oyr/uG5RoM1C7r6ElUWCBU/Y
 oghbPJhSQ7sk14R2T9BlaiN0IS9Y8rIqsNskaFNem+GDAgmLJdcezDKAnFyATALGB9h6uX8GHTI
 s4xiSpz7FbVSN0HQbUXlnIHVOg7nhNC++7AuNDDgD7E+DZxwr1bBXY1Zz0F0PjO3hDz5E6efw4w
 pJKqF1/MzLgZaQiqIQw==
X-Proofpoint-ORIG-GUID: MS7CxqRrgcbQMkpC1WR7U4JhVXwePyf-
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a0489a8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=zvxfrTDFQEmcjWDhNOoA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: MS7CxqRrgcbQMkpC1WR7U4JhVXwePyf-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130147

On Tue, May 12, 2026 at 03:18:53PM +0300, Abel Vesa wrote:
> The Eliza interconnect provider is missing the SDCC1 CNOC CFG slave
> node. Add qhs_sdc1 to the provider node table and qsm_cfg links so
> SDCC1 interconnect paths can resolve to a provider node.
> 
> Bump the qsm_cfg link count to match the new entry.
> 
> Fixes: a39efc80ff50 ("interconnect: qcom: Add Eliza interconnect provider driver")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/eliza.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
