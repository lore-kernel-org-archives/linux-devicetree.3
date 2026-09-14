Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5880C3ED5C3
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371783; cv=none; b=UQfTNNsqcKjSwRhqCUCyt7ESM7RYHoXL9g56GKvZoybCVGz1JcnDk4tWKaFcUP4quljI61nO2Aacuupy4jUEJ6GERruuOr9VBVqEW0URfpiyBlxMmz2xeQ5pDrEITELapHAxZLzpyq5e+TvqvHCPuizaWZPJCzxtdNMe5ZPJNxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371783; c=relaxed/simple;
	bh=Ecv9oMcZiKcb3r4FxfhtvajqCKkdlzzOKYk0tnl5+1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7wXPwnE5blhn/AB1PTRrwyakuM5h4gezgIUBIhZtilPOsye0jUFgTo9KCPd4rGmrj6BfLG5M/6pa634XUWSHk6N1py+H9pg0A5AHmO7v8m7XQOI0X8njQ6fSLJJlW95xKU0tfpX+QNLe300YVq4eztD8TYuM3io6dxVX0qHGvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fV9IQ1UI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g+B20IrK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fV9IQ1UI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+B20IrK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ixGx543166
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=18TzJHUXiw2eZS6Qr/JfqLq6
	QNN2UZmIxsv5CDBSN2o=; b=fV9IQ1UIhJjO0Q7okinpLeytG4qsb85MMS2VgmHK
	EwSUktM7r+DLRKbK5PT5yOrvjQIG/6ipTknSj/ae9FavH8RrjHcCD8dnms1AD6iE
	DOtNGWS/aYsGHD1p4nOMPy35J6LDnxWpuAR/X+rAxpJJ5mu5Za2Gf/PvxXCfGg0G
	v07D+NImqlfF6GsEWlXSsBLa8SVaqYVBObEx3IS6AeTHrneYLcVxqB4MrAokTLGq
	gUN7QSkEGPVzTtYpnx4+Ja4Q3lnugRpDB+AYNkIwBsge1XRZHpzdpvhR9l037m05
	OLCdi0SPo+7fU75N1xuUXSqT0X6+SS6mdYfRn17hF1Or4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k09dh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:43:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a082c014aso394778385a.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371780; x=1789976580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=18TzJHUXiw2eZS6Qr/JfqLq6QNN2UZmIxsv5CDBSN2o=;
        b=g+B20IrKizKbQjhNtjPaD7Dd7PtVpKTQeLK2YgmYYUUOmfV9gSUadbc926LN0Za+aS
         RBQmc9EFOrDElUUR9Unmo+p0r89esZhb/LM2MypnspPN1e0pKRArBZPqJ7cXI2Kcr+S7
         vHHZa201v8v6sQh1DEVnhMqRWhQ9zx8Tp3vUoEFqFcOIZEhgVGtXUypFcoDA1C9UG0Cn
         Uoc65fuU/ZXCzzQJrupT451i6GOsFThN7PWixDp+09WKifV8pQOITijsNN8Dlf1MsO3o
         jLnBfih4dm1b+ZKwXEOnWT2NUgPHPU4Hq4XrFsnKoMBsZYFEsz6Sa6eXv+axlsswPB7f
         o6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371780; x=1789976580;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=18TzJHUXiw2eZS6Qr/JfqLq6QNN2UZmIxsv5CDBSN2o=;
        b=D++laN0XEfwNdEVv8RKLyJ7irNGWE7decLMtM1tROvFUOhWFacDJ85F0qvZbIC3Meb
         9P2+xv1Jqoo0KVUJPnhD4QsmCDmqEjJRWQ8raodj4bLAccx9fozj5UrZMbrohpHPI1bN
         +Rkr05XTZbYpzF+A9OkMaEw0nN6gufH5gZesUJ9Yv4RdQQTlwNOu4GKxuOeLo7G6kyuK
         cmIkPlC1cQjPjCDuDYuGCX9CgKDOGkIxE5C8q4aKORpCA4uThfHolIBT6fz9pHnPT29q
         lD2OWTz43ecsNFtPKsziD3vGBOssf/r0QKR5iqxAEGW/1cYERf6kjHTLDwF0WuSZws5E
         Jymw==
X-Forwarded-Encrypted: i=1; AKwUvBz5hUw9uEtZvHWZ0BsgcHgzjghiAScC/mzlLoCqjbc/tFjO02Fh1QbQsQGj5jy+KEvJRUKJITie+N7A@vger.kernel.org
X-Gm-Message-State: AFuF++nsRaUrnAS5LVbv/OPwz5uTNlnmJ8bfetvFRU0CRxW1kr5OC9+D
	Do3GEeoGc8+rfreKnPPLtBbsJCpYhDQ4PAmuhOjYhZR3XNc36mNSSzr3MWE26GjgKN4u/hb+J6O
	J1fZbzOeJ+SBm/LBrr2kMhwg0ozg5X2al++I/Vs9iiVJAWZ9LhyArsKSUtP6ZoNOV
X-Gm-Gg: AYBFou0ywTGC39yHwgFfTJo4E7VqlCTUbqF8WzgeLzOx9zMPs4fK3dgsGNjq1qOaxRe
	AvJlzzqX0QfflHADS9ZCHUH+I37m13ytY2ozrRk1ftiivZJlmmiSVQyyIOcq8AjhtFEdQl4vff8
	kZOXB4WAkyVG6bdZi5yNk00QGETkXCnqqr7+6nZayNHSDLxpp1TQxvVjD2c5MDaph2CKY1IHx91
	gb21HBXtiwPzN2LGmM7k3AUNrenDIIlq9yNFIJO7f9vRQqu8JGGHLi08zKB0VqrSi3hccmmwc4Z
	IufCl056tjT0V9wfw47LpwLZIsGCP1ffbjwXhJMHSJ0t0C7VeR9buDVKWWFUg8xc/85EPg5A3Wz
	w9oqfUF+bIP4I3cw=
X-Received: by 2002:a05:620a:4712:b0:939:72cb:bae1 with SMTP id af79cd13be357-93a1870cae7mr509595985a.24.1789371780410;
        Mon, 14 Sep 2026 00:43:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4712:b0:939:72cb:bae1 with SMTP id af79cd13be357-93a1870cae7mr509573185a.24.1789371775081;
        Mon, 14 Sep 2026 00:42:55 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm26412847f8f.37.2026.09.14.00.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:42:54 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:42:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 27/31] arm64: dts: qcom: sc8280xp: Add domain idle state
 names
Message-ID: <qmgxlw2tj3ngrwgeq46p7oscpfim54da6odddf46peopjzjx43@uqjgob2rawle>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-27-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-27-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX6KsQLDG1R77n
 gqmS7zCBKn6XwyPD3gzAGR7Y+yH/7cDeWhy87z22JZQ6gWV15a+mGWYU95HKR13oBUJevMIa10Q
 9iiys3NlsP+e60RWFvlPGV8oUsQ6ahI=
X-Proofpoint-GUID: w0iCPs6Ze3nE6AsR9oCrtmBqfMkBY7bw
X-Proofpoint-ORIG-GUID: w0iCPs6Ze3nE6AsR9oCrtmBqfMkBY7bw
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7a585 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXzEMwBhg1yfwJ
 hqcVBrDIlppfw+marEdREirnXmPUV+JCnK9zogzNNd1H83LMn1sOP9Gj4Uj4iLpl9Rdbpsnt5Xk
 vblDu55QvoKfmZ35nfyXcyVuLiEE09VL+Z4X7/18O0xV/UZJlAQ761gA68WnSq0f/WXmC3NIAe0
 wQ10YuybL1OTVohdtGT7ECTjNGKqRBV6xpY24XLa9kv68SChxlGJt4HBdXXGa8n9FSSPWGxpLNP
 ydpoCVJspn5t66PqthjydUJD92jSKTkzqLBlCA4Bf0ArAfU/H8IekJoXCGRrk+FDfJDyohYMTV8
 ds8N0H9nlANSfn8pw/m2W6RtdIW2yMEdWZLsWaG8rCwWV85Lb0U++w3vSZno9jP6wVF1+vzei69
 FdmNwS/LyUEjAdJ0ILMZDeSGsOpmuRAioonOrcmu2/kIbc666gS4M9Nz1J2cGu5SykHtu8VlPzN
 hjeXahXZyTvilnr82XA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:59, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
