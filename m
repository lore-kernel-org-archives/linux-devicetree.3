Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9AE363C6C
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353414; cv=none; b=NzwJkNwa1+mJIgv7p18+dp1CylJurv4tbNFUYC6DxunuZmPRq6kAww7bYhhLSep25oXxsI59zxNkxtVxIQRnP6SOsdJsYJPYyQ6obE1hnKoXPIE9ZElw9R4PF4xIKUfoSy5ThoWDGgKguAopqyCsHDg1XmamRv97peN7Uaeqgyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353414; c=relaxed/simple;
	bh=kjnTQfDH5ztmCMBHbUgrzt2rv6DZAPNRGuhf9YoN87c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbxU0ZfUrXgKGFzYPt/I+kSy3YZaYtrdmkS/NwhxeMlSNuKP21w6LQz6tuLRmDdw4c/ULLwJjNWBVu8aH2EnwXNekjsYt/8rSQCGoXPaSwCI9m36x4i/P/ZP/GLt7qRCYyXZw5NkgWZI3k+txGpTbNRNEOyjPh47pHMAjjs0kns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnMNJEvJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnLz/XKc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnMNJEvJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnLz/XKc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L8V7L1748454
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vd9ZmwiYnYNdA0AM4gu3iLlxaPjUKlAA0HQGQTfbg5g=; b=AnMNJEvJYA2RJqgK
	gu7/cUAhMobSm6IfTQYSTfSW8scWkmOt74Yh4YfFOFR7vjCR4jnCIQvfCSU6DKT2
	0vTcsO6cH0rgiEoNzvFOktY2YCWEDgxTNvmRHo5pjwgbexAPYFGJsyvm62H/KYRH
	4d6frdF1vgicruNAq219IALl83vNjuUgTL0vZrhra3O3kXFvIdwK4i6oaarT1GeN
	PkShEION0ZZmY4C+QKpsqik3u+lW0WfmF/s7MNfnzYgc/TdOZzsTq11xP++kmPcl
	oh8DkkzseRMqA4s7sWPZdryexClF7O6teeMQ7nbjH8DUb1KNARBsVVOV2Du4gb5z
	X3GbBA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6km5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:50:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90f04f07227so147288885a.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353412; x=1779958212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vd9ZmwiYnYNdA0AM4gu3iLlxaPjUKlAA0HQGQTfbg5g=;
        b=fnLz/XKc48HaqICO601aS8j/5cqkWEF6Y1D+vG8WvN0XwtHC22Sde2c+jzn2wvq4qS
         5IV6+sRQ0HKUrcr0f24nKJ/618F4jJtUnfEi3Wfymfg4hY3n4SnmRiELHET7A2aMnyYq
         Ze902MtFr8Y4nm4xelurL6HG3qp7zQQWx6nMIqnVUQjIZSwY0TXwTRBRNtQdMPz+VmkV
         Bn3JC5J8ROvHB1gAnOGmoILkO4JFVXc2EpTsNOWDWL5b65R7J6dRr7Efo4ImJpmoXg7h
         ogWSluHMKbg8hsytBqPFDVIKuy2frky3J4FhbR5TLfc7nmEbIytDRX/+0rEAzg8oyKST
         9YPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353412; x=1779958212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vd9ZmwiYnYNdA0AM4gu3iLlxaPjUKlAA0HQGQTfbg5g=;
        b=l6luTNueqgGVYZsuKLLXbiwM0EzsDXJYzlNd8CGE/jxCHGyYES7psKvVyvyEja7cnq
         FGjdswR08+yBNVV3b4pz3LSRjwNu44DY6yzk0tYdpSNgD0akHNdBII557HwI0RurusgK
         8rCIpam6SF5XS7l1T0vI9JGZmB4UVHxaV6HwVT+a5+rf/Zg+aL/tljTRh0bjXYHLpRYe
         C3W31+z+9Cg4FZ0IDszIyhWnE2jpTn5HWbB7jFoocABUd6uI+Zzqkee4L9Xgz2XlmaTl
         sCtHXZTnPOH3UdlzX6nT+6n6k1BWBI2EPRAF3hFszuiEdMPDZIrFXZTXNayvgz1P63Jg
         Xb9w==
X-Forwarded-Encrypted: i=1; AFNElJ9fFL9Yn0cSlIQyNSQfv+ySsZNMiyztMs/0+NYCMFGLC5ADSDXXPbRzACcEoRvUJspPnhtXfL0X3LjV@vger.kernel.org
X-Gm-Message-State: AOJu0YyuSRQ+iH+NAjBzABQiM3A2/YVj/dZzA3IypwYNisPp2v5rnAeq
	vVVMO4pqraJDY7FkwV8oJXkvl3GNc49OYKRmwjhtYSZvwrL0Ph1LfTEmqWH/LQUwIeolNhkPEh0
	sUg9l7Xe9csrvRmauZeYFLQhtTqbZzFt+wLuU8GCzq/Yj20uKWrKZo/vopF6FpI+H
X-Gm-Gg: Acq92OG5lWJwwU/Fr8W7ZLpf1CJwmmaJ2JCiika1ug1xMW/cUUi1u/8Xp/iH13Ij0Fr
	JtwlBYzOleNvuTn0QRbJ2JouG1dVHXI+PrGWtbRDIFn7riwZ/bE9XM9KfyNIeLrHkefaPbfl2z7
	N2MvFVed1dskDMTR9Fgs97j0lcMeajAmDZA9QsrYHhLeNN0QhLk9ekHgxcibw6n45TYGKVHiD53
	kYnpQtHspFkI6j7yAsBp85ZxV9YI2De41XjcCKh+pINbLaoAJRuucPsP/bZ3fwhzV+fSZ8s/Adu
	rPBMbnSJc3zlEYYE/KHW4ii3v6tQL0u4uh/UliToH1KPfBIID08YVb6WVYd9Spx8kq2Xzz10YlN
	rFRTkruu8+d/r5OjeS0+yvclXNbFDOtP93drNjFB2kUtvSQd2Jb4gOQjfZXytbw/5W3b/Xu++/Y
	IL93M=
X-Received: by 2002:a05:620a:2586:b0:908:a758:baae with SMTP id af79cd13be357-914a2cf3abdmr154519285a.6.1779353411728;
        Thu, 21 May 2026 01:50:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2586:b0:908:a758:baae with SMTP id af79cd13be357-914a2cf3abdmr154515385a.6.1779353411301;
        Thu, 21 May 2026 01:50:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc87e77772sm17619566b.14.2026.05.21.01.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:50:10 -0700 (PDT)
Message-ID: <cd5a8576-2f06-4620-bbf3-43b3f84de630@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:50:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] arm64: dts: qcom: sc8280xp-arcata: Enable the eDP
 display
To: jerome.debretagne@gmail.com, Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-3-9df52552bf87@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-3-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0ec744 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=LJ_b16ZpFTZdMs0EjWwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: -MJr4Q-5DrKqpS3EONg-km_VYiQIc97g
X-Proofpoint-GUID: -MJr4Q-5DrKqpS3EONg-km_VYiQIc97g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NiBTYWx0ZWRfX5+3Ykl5Xe03V
 Mt1kjqMGtNFaGqC+F63WI/S5dNOL3PDhiVT2P/fxSIzZiHH9w8O72leujC7Gcy9xDpwYleX3cT1
 b4OujVioCbuGeXHj/r49RH93Uj/UecU4VKgLUvPO7IYXjaqYUX8bZdf+/cABlyiklhW9HUAwaNz
 LAxEqxa7CiYbPUDJeyOwKk0UOh/L6m/BP/p3TG0c9xtE/yWHB2LOBREQf82BZwagLSp3RTzszEv
 KzdOksy5zQs2H+eUSIdBuxkI7R/Zp1Lnj9JIoqs0vIqD7aGWqFFtwc87hfuScBoIDCb/iIKQHF+
 JbvmxguqhMOCYS4pVwzHkZsfBOkWpxHub7niklVMDZFMHfWP9UOgXPHCk48n614NvrOrTJUB2U/
 A5PY8hXP8Pbhg6D9uPPfLk2K2N4IJ7g2eAQ8mlxqaDQ0FZQAWLjfjunZG9DPFWVL3TYVg7DNArF
 Bn9G3nrnHjpVPNyvYYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210086

On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Add the vreg_edp_3p3, edp_reg_en and mdss0_dp3 nodes to enable the
> Surface Pro 9 5G eDP-based LCD display (LG LP129WT232166).
> 
> The enable GPIO 36 was found by decompiling AeoB dumps [1]:

I'd like you to strip this from the commit message, as it
doesn't add much value and makes the git log unreasonably long

otherwise this lgtm

Konrad
