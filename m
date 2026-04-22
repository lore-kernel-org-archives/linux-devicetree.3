Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4212A1AA
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 00:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776819343; cv=none; b=IxTPZLHcUqqXbJDzHMPArKSPJDhEskgRkvpkHK7BvxQPhyWpZHPOZR8Cv/6GdU+BLCJFwgyGDEcwOIZ7q/jtf2rR7ZQPTr1SJtgZ85PX792XaJwebEeF0xBaHnfbV6UynpFLtKgArl23kqlbyEoHzasGFW2pZ31n9Oh2kgJXSps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776819343; c=relaxed/simple;
	bh=6AkbpUFiVi+NvXSSBQg6tSo2wDcHwg2Yg/KM7VsukJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZph9ujkhORqMixkmhI/sLyw5A5/PYkRVC6fwiajIQO6yetPRx8cV6TQr7Mo85rRMdtfhg2+DLqQOtDGJvd6zGXEhDxzunIqEcfD4SrW6lFWs8ZJBKZK3+Xc95M4+cv+d5TrILiqyANeL+vHTti6lgL+eEcp01+OLc3JOjwtZjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KW1mfgZw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VlUge8t3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KW1mfgZw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VlUge8t3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZuEo727986
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 00:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fPOn1NAqsXtS8BF2EH3x06ZN
	xZhNwC2VHh7Rq+wAPUI=; b=KW1mfgZwXkzb2EEPJPeLpJ4rWLa6oLoWNtG/Lx1r
	KQleBgEvh3GFOetmky8JfmCbC1PQGLkVQ5b8aqgt8hQJrgtljzYtflCSIrmthjXH
	t6/4aR94mP2HQQQuKYzw3EXMvHms4zK7AZ55XDPJVPXy/cp8cPTb27RNhVHcGIQt
	QUkfm+OAd2lFUEydi2T3xyN9PYopO9auGDmjEfPHqbHAqMBqkX8pTrEd3EWpklGl
	AqDHnjKzttRjBoa+G33GTfL25tE3SzWpiWuk39kPKM0e2ZJA3CO5CEccKYtsu6yL
	tLHXqqIN0tQFVrzQPeHdwAA55gvbsbJHBVYkOk4EUbvZUA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenh8yrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 00:55:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8eb9f8bbbb3so281238785a.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 17:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776819340; x=1777424140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fPOn1NAqsXtS8BF2EH3x06ZNxZhNwC2VHh7Rq+wAPUI=;
        b=VlUge8t3FcHuj+CGqD5m11vlZ0dsr8Sa/3/8guZOlseW/0tQ/UwdpYeY43phe3TBsh
         OeRGAlna8agtvhdB+R90TjXyK4FHSdHKqHA9NKPPm+xPXAlCJk5h7YX1RBkbeL1KCnDo
         WLTVzze7gau0mMRzWwmr6PQY0X3wJagaoxb7bvCYU6sm1iZRbUbwQypp0ahcSa9ydiX1
         wNzmn/tJtpZ19LO/lkSWA8gyUbN43Qz6RFVhL+h6JY5VV0btp5O9aop6nOmEmk+3khtz
         +w/6rNm97H/ZtK4rOzaJR9qjyUZsfLaHZK5ag2lv6QFSlQcRpQpylLNaF8qxCSGwNhZ8
         r+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776819340; x=1777424140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPOn1NAqsXtS8BF2EH3x06ZNxZhNwC2VHh7Rq+wAPUI=;
        b=UfIFiJkKAn1iiwo7fwQL8SPU1Qf7M5IG3WniwGxDvCtHDiLPp9ylRX5kAG/YdUHN7L
         HJQqB8vAhrUNg8jwG/aW4k1HKXme/kuyiYT09eIMU9AOJDtV9FErcKENaGw5VlfJNIGj
         sHyOuMO51dyPVwEtSXeUWrHbp+b05a5iG0oG4Chne25Tnw3614mLi1hgT0ou3MTxin0l
         DaoXRxH511lNDgq5cm9OuRjuq+E8Hem3UMALaVFlU0Db/RvcRzKGR5P3OEqurlpfRwBY
         SkOlRTvpg5gNLYrusZeygAc6ymMP8LqNdSgtuhlb5wy2OxJ7xxUa6L2JazVNFxxoBWSP
         sQhw==
X-Forwarded-Encrypted: i=1; AFNElJ8lLwlal5y7KTipC6HiiXB8kc+rwm8D19eB1nfdIA2wCPVJxUqxGnvSPSP9Zqel1y8/nhpqQ1zAvpoc@vger.kernel.org
X-Gm-Message-State: AOJu0YyLRf0xtBhv0yho52qOUo/tO/MvQ+6EW5tjPrx9BhXCOuz3s4x5
	niLO+iu9wJP4dg2eswstDRvaIlhRy5Qlp6UHf7ifpj1nFJCXCa8MSgk8amhMtLcFx4CHc5ZtTy9
	OJDCtNNWK5ccmZFwiLP9O/s+wBxpZCdFyOVOX5w5pQKQSnchgMrU5buJiO2dIVUje
X-Gm-Gg: AeBDievPU/GJ4CaZ8BLIUfaCbypDliIqcfZrHvRLDz8ZWEPkwL7vE7gKidudvKvoU9U
	oF6a+pNDzkrUAGlr8sv6jL7POoG5w9pXwdOMTS2mnBugggvnTryiYc4r+u56TkOtESfG0hII/pV
	RcR4eTUXATKYrJOK5xfu6jLOvNtYdCsgjrPSZNJu3KlkF4oxcC0VBLkytwRUHTlFJaRX1+mmRqX
	s9P2UN7Livj/Hih5HYe5hggw91km/kAujNXbhi5qbvOPKYeIKaLsbQr4a7Drzs/qvFInOEihF3w
	y5KwsSwpPIiJQw3/rnvQszE2qGFi2euicT0VwGg8W6ptjFreIlbTGJcOTjTMh60XlL13rV5pJDe
	2o28vxb30AQ1P4x5RVQAfhFS0swvnizd3/b3/5L9EdKR4GgWl9MpVbZj4r8KkDILyIxY0KmqxBO
	Ui+OwADhTtBHpejJtH7U/VYPEYzQN5VnU/+xIqaJlJkVTmgQ==
X-Received: by 2002:ac8:5987:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50e367390a3mr272994691cf.23.1776819339948;
        Tue, 21 Apr 2026 17:55:39 -0700 (PDT)
X-Received: by 2002:ac8:5987:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50e367390a3mr272994511cf.23.1776819339542;
        Tue, 21 Apr 2026 17:55:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7dfesm3991891e87.71.2026.04.21.17.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 17:55:38 -0700 (PDT)
Date: Wed, 22 Apr 2026 03:55:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH RFC v2 3/3] arm64: dts: qcom: eliza-mtp: Enable
 DisplayPort on USB
Message-ID: <pgmbgau5tpsoh6lrwntlxooy3ktdn6c3t5ru2r47joptwd25ua@f7r22q7dg4ea>
References: <20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com>
 <20260421-dts-qcom-eliza-display-v2-3-67f8cf155331@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-dts-qcom-eliza-display-v2-3-67f8cf155331@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HdUkiCE8 c=1 sm=1 tr=0 ts=69e81c8c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=jqvgCZr2CLc5mZK5VosA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAwNyBTYWx0ZWRfX11aiA86m2uDK
 0ukhqXPCbhcEkw7OnEfpwH5iERFfBloGwkz+yUg+/UVOqLRdz/DZsEwnmKNlVQ0V+MZ3eyvlYKU
 YSQlPCm0o4tvVjvMDALzskmg58ZNgI6KOKq5qoct674q4PiOb7hJmA/8iEaw1Je6zv7AQ7R8bQm
 VlMaYhNXb5LD4OYDvKoVOs9fUQZLgY72JUcdQF7PHnXx8fGtFtA0RlQC7zGJm4S1PBgW14T5o86
 pWP110xju6KrfepkkqTg4WDej2+adBTeVZ123cH0K6lUXuCiaurN0L4sncjvOAn1WX/7jLqpIkm
 9o2AoWHtGska/tp6oWGohbOaaDcGds99VtS1PxFkg2+izkYKrk/X3Q/v7G+XY9hMgrLlWR0+Xh5
 7vtouXP/GBEfCFusgwyv5YlANBflHKFkYLacxSYdC+X83Cuao2HmwAbg+/IOh0xAEMqKcTBmqDt
 ZtmmSW4ghZY6eRI37HA==
X-Proofpoint-ORIG-GUID: gpno3vjP2SLEplbFphEK_zVBxwJATcVl
X-Proofpoint-GUID: gpno3vjP2SLEplbFphEK_zVBxwJATcVl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220007

On Tue, Apr 21, 2026 at 03:45:30PM +0200, Krzysztof Kozlowski wrote:
> Enable display on USB DisplayPort.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
>  arch/arm64/boot/dts/qcom/eliza.dtsi    | 1 +
>  2 files changed, 9 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
