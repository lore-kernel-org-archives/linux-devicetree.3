Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2583F1AC4
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371431; cv=none; b=o9F7wOSFchOXvcmpDIuH0poTb1w4e0FZ+fusB4VpkDOB3lJ0vmx8AwueBbtz4E4UP8qlftz4R+1tKzEmX5z7iKNN96jbwDMfrwfZrkvjXzXfQUrlKp84+yKQmrim6ig86bXul9ITKmn89/NSqqS3LKPKVr+b4IHUzoBEXR+ceCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371431; c=relaxed/simple;
	bh=x1nkctmLdzm+eKYIxds1fsZioTqfgcib0MN+bNpDhTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CK7ekFps+oJkwECS0z2dp5EC8jjPXD47OwSBHVptdoOEsNYot40NOQO251w5WBsGsJ7UW8eqwbB0Qb6jUtvV3PNR6cHH6r0yh2oJcbLNmkIbnCqIyX4niRQ0fLt4eBwf1jNsgYI1HNYUUi/DOmdrudYI4kCbvdwiSnrJe1FACd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1j+Viu6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MRjSZg9H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1j+Viu6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MRjSZg9H"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jFeW3740626
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0lMMfxXywXVBgLJe84wAsk1F
	o0aToKDQrrqisjMGSIY=; b=Q1j+Viu6rTgJYB9gXAl4Odd3OgxmvyRqeO+K1n2Q
	I4wrZU0KlxEwbyWqNM1jDIGdUf0BqFezKvreqjTClGdCyS/QMsD4vXjtsP6ZsIzV
	s0Ae9Rddi3VeFxe0wJbUrbmOvV9z7RsQexWpiS+rPEmgF83TjbYsht60DtXVF93X
	6G3d6MO01ivb/E6Vj2nyNS4lra4D9adWA0sC2YD1+EDEryhUbBMW+4l4qrYhEGja
	u18OIF94yDhgCh8YDJ0/CMy3yIN/O6Tbb1Gj6zc+iNgCFu7n38F5CRlkS6Hts5P+
	R5dj6XtaZYlfpLNiVLc+7V0BDsRbOPAs1Oki6ZUuZcyToA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ddj63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:37:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f1847fb9so324952585a.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371428; x=1789976228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0lMMfxXywXVBgLJe84wAsk1Fo0aToKDQrrqisjMGSIY=;
        b=MRjSZg9H5wcOQp0dtAIbrwlLAM7Jczmy51Rub9x3w/FxbgrSCIE57I3L3luCbAUHpP
         uSZCk/xM0ZmZI+fNJcFmvYM5/sKEAQiK3Zjqu6MjMu4W2zLt5OnebH72OvNEk9eNTI5Q
         897iR9az+tyQ/pySWU1XbMW7+074OVoIMGnm05D08YyGYnYaqGRImAo7ngCi6/PnX6DX
         NKhcdkHDpUE+ik4I3y3ZH4ejdsPqHKNQ+r7jYhPhsk80JCXMGL8Ub3G8XzthK5c8XztX
         FydRBE+yT1BoBZDzyL2NHGwS2w5DGqgGEdC6zSxCfyEjg27tD+VCKbshK6MxTOBodUF3
         BV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371428; x=1789976228;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lMMfxXywXVBgLJe84wAsk1Fo0aToKDQrrqisjMGSIY=;
        b=RTxLws1km7s1Bebcj9EYYk8vQiUruZ+UHNzVeEDDJVRIt8nQIO87I1TJnHyS1KLWUi
         nsK2/Ny/MfBsoCrPyZbjNere6HyOvILVlihh1y6G73NsSkc7sPu1KhkCe8nBs5WQi6ou
         FPTkXKgkNUAiO/3M3bLNr/ogk1+9dAB0r/xs41dIx0FBgmiYfY9a1hR+WibR0/OSsP4R
         ouWB4jBBwliuVWN2aOiuzN5hlbsc6zXjVnizCtQQd/XaZwtHC1yBcN+n9zrphtOQ8wqK
         4x+vp+kFHGA2d+JAunNY6ZjQuU0ueaWCLla1HuNOOtbVNPM5xPJN0blWF8MhisqeBzuo
         mi4g==
X-Forwarded-Encrypted: i=1; AKwUvBy6GRoxqtWXf/wno69rWFmdfRCWM8KwUPcOqwGhK/JDG79JuC6lYMJ7UDJh/prxXUT6IZhwLs/3lOLl@vger.kernel.org
X-Gm-Message-State: AFuF++k0iykmTuVdpa9vhJsiC6yOYwN32cdHlLckwxN8ubE/Ek75UN08
	mmp78Eynt3+6x2t74YUiRVA1Mlsdjtn5u5vSbdR19jQXsGm6rpmA6bPc5GSascFbkJrYm37Y+yP
	z4YHNmgDChbGXP96SBB6XLtbcekxzXEFS6DAAmhiDklc7wqpMibydOiRQf+magy8j
X-Gm-Gg: AYBFou0WMaU49vtG1lUxGVQW2Sl66iChpJSFDxxxoNKw1Rc40fpVk0mcC0tDle33clK
	UYyvqGkxoUiLwgHHEI/KhS0VV4BvcY6O9qpLtQE3RfioLQMKuEoHm5QiZPFnqJBw2KoUdkyB+eP
	bhiJC7UBzjiaS6VVVAR4V9lK3y+v2jG1UGl1zJb15Qi46F0Hq46l0wNLwFTA5zJa2AAUQ9++3xR
	KEkdI5QAzxGPQbPBd2I97PyNO8WomWRNQCU8TaIN70CcBIytSzK3NmvnZ46IW0WuzN20fZQkBHF
	KKCuEGvtGMC8lUlT/cQFDHxqp9PoWidm8AVPXFPsxbtppRX7UYHmStYDH7ywNw03b6f+FGdavRm
	J1KZNwLXTMHLoKnQ=
X-Received: by 2002:a05:620a:2548:b0:93a:10b8:4c3b with SMTP id af79cd13be357-93a296fdffdmr200303185a.2.1789371427962;
        Mon, 14 Sep 2026 00:37:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2548:b0:93a:10b8:4c3b with SMTP id af79cd13be357-93a296fdffdmr200279585a.2.1789371422789;
        Mon, 14 Sep 2026 00:37:02 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm26423399f8f.23.2026.09.14.00.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:37:01 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:37:00 +0300
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
Subject: Re: [PATCH 07/31] arm64: dts: qcom: sc8180x: Add domain idle state
 names
Message-ID: <xs7l3k7bf5autezhevusjc6gwxk3fkj4d5awf7m4m22etibfdi@osmbppcbkfmm>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-7-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-7-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX5bnFiLzsloUl
 DLMPvEb4XObruUWWHIOcrMmdUEvv+cQ4YMA/8voHFjZW1mBzqmT9lK1V7R9QZ7HbVJ8LLE5z+WK
 jYCUiXyabQkyrHj51uae98/PUiy3Z2oB/yXMjVY3LVr8LareKiAIGqtHjzvKzqQlMuXep6c6WpD
 qwgek7bWIuSl0yJJ8AmOehWeSwUC9hLWC62oHsObf1XZaSLfL4ocJBJ7yLbUgB8rJiJrmqB9/Dl
 lajMxk9hrAe9zrY2b6XHkZ3wdg99L+WWxkXezchvlV686Y+sZWLQNXGSYnGr2y+cPnT6px7nx4z
 9nJGWlNVYZufs+F+OwZWJcA7cD1zN+/WmIX+fEFEhuYUDA2Ap/ftpdtLsVQV29mCNJ1uTErVybl
 CiXHcJJwJTyiRcPXhFNBKW6ea1YyW4mpw4HTOIfn647tjksNB3GWgeUWGzNvMPR/j+uPZMW48n3
 vOjPM4o18c5otPaM8iA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX1ccGk4hoyn1x
 dgFc0+bJdfEXRjSs7KbU4ZFjBM0PuMN3ywjsmb98gIGKqKm20MjNyCV4MWzmqunawNdYFmAoeLp
 YupjEvvMETA1L3CXjajPjknz1akJ1go=
X-Proofpoint-GUID: nYjI7onVOmpuYRtugxm4kGVRfdMqjq3f
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7a424 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: nYjI7onVOmpuYRtugxm4kGVRfdMqjq3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-14 12:29:39, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
