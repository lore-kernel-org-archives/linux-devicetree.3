Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D72344470F
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784675588; cv=none; b=GFqnu/4C/KY+CLdRfbNNiJUYQrcitJQh9mbyjuYSKpH5B6EMB252YS4m9LrUIe/mWGvfLwrAQke6CETWQbRYtbamodIeMPLa51FEea1koWQiRjfiwsK+VXnD73erttMQR9KPxFiRSCS8Rs1l9LV1zE6H9RhpsEGkRhQFDzsFXf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784675588; c=relaxed/simple;
	bh=KT1c1OAV9hEPRs7FDQcUUYsNQA8f+0N/BkDtmtYHSi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNHTgcDroKCf/7S4Q0tRrLy+MINGYORgA47n/WA5pB8BZGiAjLm4QkhKOCK+ms9r+I9k5xUMb6YEL4MLjwyPRUVLUzejaYTjPMti2UKpRS9oTpDViXi7czb0iluAFKU9MW9IDWhrOujGQj/Uzhdv9ts7/AWlo7XGSL2BK5xt7Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6MO45X9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BoWygCq+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6MO45X9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BoWygCq+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZO333311569
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3bwtoUeYIX4CQ5hBjVs0pHHQlacY1zcuJn2ZoJQM/Vs=; b=B6MO45X9aDbulSWW
	7/q+ylGeihUTzwBF8CN2C4+63wxaPWBizhjoE5sSH48ezWpil4Camqt+WO9dGXJe
	5uU/urb9sEMPKOh9T4Cz9xMLegVKTb3Vv8FuxdOvZJDzSbLE2mtPQ9T9mfbdK5q6
	W9W8QQTaMqx+sjPTJ+9XbYcHkmhhXVuicC5tjo0TUTvUh7JRm88T79U7lg318+2i
	Hzw/7rruMrTvR+3a5FpcLLpf9yNx7/Lr8sp+hV2M/9CuNTZTLEyACItzCXncWSw7
	m6uTkikgitoMxlDc+tgvdCceUkuntVz9TX9aOF4D4QaPzg0a367qUGFwoclEeKuM
	XMq05Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3kbqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:13:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0199faafso182214541cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 16:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784675583; x=1785280383; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3bwtoUeYIX4CQ5hBjVs0pHHQlacY1zcuJn2ZoJQM/Vs=;
        b=BoWygCq+qu2doOODZaRFCC4kF9dGYp/xRGArkGKUtXtqESHsO4wAkCz+JLl8hG8GoS
         6grxViJNSGFrg2vcRBaiNqPS5OaAO/5op42QFQh9VyIgvwp/yl5JTAFyNBT150C7vPuZ
         H01xuaVMufdM/m49zKsiQeek1HWIKXpNW+/d0OR3AfpjDju8VQMMVEYKV3ERgsEaOQ5I
         xxFhM33Fuf5m3qfWE9p+FC8EIhP9IypKOUph4KKIyF+MS8ZHjEdR8RI3Ki/bWlPAuW1s
         TEbEMihW4yH4qhSfy9nYzjju8w5YGv001d0UZReJTe9HralNVESPkEFw1XM4AhG19XNZ
         cv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784675583; x=1785280383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3bwtoUeYIX4CQ5hBjVs0pHHQlacY1zcuJn2ZoJQM/Vs=;
        b=S5AaKto6YeNGikzbibtmfoRvzO6Mq8T8uSAqyBty3tXk3CJ91DxcYEDEztWo+1QLLd
         UMKfFva1+Y1Tla53JMyrnH+gaMnOpujucZXyZyG+wlcyIiITV+NYZYQX+Vjz/f/OVeZ4
         MIwnDiGhODZLW7ww1xsXO5bHBiX8JeWAXx7FR2grlCg+nO4cuXFRp3NyjJT5IgyNqE/8
         hh1cyLN8cYGTMm9dRpAIrM4Ab4B0R7NoCgWberoHYHD+s9KC/Lsescwj3do7Ji2CfMjJ
         jL460iqDRMTHmHBmi7RbzbdXmZLOgRFEHtq/mM0nvKA8abqeESifZB4r1S0R6/8kPRha
         OoNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqR+SHtGV+qo3973hiZIRiJHLFZq4h/qqX1v/BkXGMiNQ66blWJhHtQQ5+46Kft+0TOBjFn36e/Or4i@vger.kernel.org
X-Gm-Message-State: AOJu0YxR0aPRZabFjfdz6ve1/vBhhv+Ej98NEJQ3851saLsZ98PaRvkH
	oKo79450JO+StEJm1vSMQIQNdkREKGG7BEP6NzTYDzabDeQWppvPawqRNsy9JFNhgSOgow93EZ1
	ngRfdH2nHNNs14WCt5bH4NQQPgZuaQJgkCGdEhvwj/iXYa49nxkjtdubn3YxHr8ur
X-Gm-Gg: AfdE7cluNE2slRVNG52aPfd+t6/qXJGIF3FBKnVHUoOo9opRgLcZXLoIwa6zaQF4Ikc
	WABqgYtOahfTMvqd61TXN/TioiE+Jh4evJftT2+Qo7FjhZuqVGpPkQjLgmohAJ5mUIxh8bhkgMv
	QqsIK2JIL6OIpLTfARU0Z5p8cJvQ97Pmv2a5+KjLxJe/4m/48I23e5LHgBt0+1GIbFfT8rQor3y
	oezEaS+7OWZByVFhXjocNhlxPJK0dyivGWue9T1LW4cCuldTWEAVpq/O1ypcLow9PASBd0kjfDP
	HpmnClQlGNZAD4Ru/48M3mIAyNO61J16t/E9iBjUVCxYGi7mdCLpZkhgoDAU2/BKanPAYdd1loi
	KzShqnHixV0z+XudcSQshz/wgLSS4WKlFYeqJ0ATqz4gI8VHoLfaTnLdoyNbhEAUwJQe1JPFBjW
	cO8iuh3XuaPZ4T7A==
X-Received: by 2002:a05:622a:4d90:b0:519:e91a:f4bb with SMTP id d75a77b69052e-5213c9dfbf3mr195128821cf.31.1784675582860;
        Tue, 21 Jul 2026 16:13:02 -0700 (PDT)
X-Received: by 2002:a05:622a:4d90:b0:519:e91a:f4bb with SMTP id d75a77b69052e-5213c9dfbf3mr195128411cf.31.1784675582389;
        Tue, 21 Jul 2026 16:13:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8bfa3sm157071e87.12.2026.07.21.16.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:13:00 -0700 (PDT)
Date: Wed, 22 Jul 2026 02:12:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH v5 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
Message-ID: <bp3rrxycikefsoxeve7gzrattjpbzlzxfiw7vacr26e4kf2z2s@gto4byj5sxcs>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-8-99620e07f505@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-b4-qmi-tmd-v5-8-99620e07f505@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfX7P/H6FyUrpur
 EbmH9czBPJMqKKH7j9CEM3LJinlZXLpE+DyNrQOibCS/BfmHCIZHFhiMnRsDbq+UorC9Z2ZzZCy
 kR3FpyMzhObHC63PxKJUjDqxeEJ5cW5cvLPyBpjZvyp5pIeHQ4ihfjskbWZeWFIEh8Jiz7Sy+C9
 VrAt9p2OWbEcQE1HaNhiJ/LwqW+oOX5QQtIi/VVV6H+DRq4Ut7RqciiwaRdF8R85XfQZazEiDhX
 RhXm3h1ExiZnFaC94LfyIoMKBV4VVwkJPFvXvPerSzgp175Qs0qX1ThkpfUS/8X1XEEPwLbpnB+
 oVJk/Lr5WI3Vrlk0C9d3lCEs5er+kNNKBKXtlZ3h5rLa/Ecj4ul6JlDmJOFuwW94gofT8npM3e6
 rJcii3yYlW68riAJrmxhUXmf+etXIvw1sUJcuGBlpnfTkMVAMof6yrlxvG4bYozpDD+fkGpcslm
 qQxhPN3RXlLiDSnJ1pw==
X-Proofpoint-ORIG-GUID: wpxbiqYTJDtS8xglEKcZ1I9l9Hdcm0vE
X-Proofpoint-GUID: wpxbiqYTJDtS8xglEKcZ1I9l9Hdcm0vE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfX+lZQjc/hXO4A
 uPATnJ7UJqroZ0L+aU5p3KuKpgk6qSGNGRcIhU/lCQsR4pNccgbb2UH/7ef2qOqrRJyp3hUAi7Y
 pRU2o00TA2s36v95hQLiusI/hcOz1vA=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5ffcff cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210239

On Tue, Jul 21, 2026 at 11:59:05AM +0530, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in monaco.
> 
> Set up CDSP cooling for both instances by throttling the cdsp, when
> it reaches 115°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 99 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
