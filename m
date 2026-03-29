Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCB435FF58
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 16:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774801632; cv=none; b=ssVwiXSIxRuRGYPJzLC+q2ElIZRei+wlh64YsnGqfTEgMyjbSw6fxV3fbW5U7D/0i3f0RUQ/9Afs6w30VXNaVhN3Hf8nqNgkHM4wCCuaGNBYOTFCqVFjhCklQWgQBSKHPqm4yLGMVQhbO1mByNQBNqJYAmuXSoKAJeuKaxGSpcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774801632; c=relaxed/simple;
	bh=xlO662m0unxoo5rjyx3DFIhOEQX0knSmHVlA5hbLlKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfHyaYDVZRV0qZiQFpDBb8YdzOFwuzF/x5nwvb3H369+QPM0RD8QIiyov7KlRxBZAffY2+fW/4a3HwF5p3Q1BmNeJE2TrBRGgKTVouKWP9PJSp7lu4puzIWQ7IhpQBMKDWAYyeRgcgw/hsm9e3E6c1R/MxID9gJ9IQfQLmiKE2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LH4yN1xU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=abN0mbML; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LH4yN1xU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="abN0mbML"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhMTD2952604
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 16:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2DRZhCEGAhiBuBP1YCe5luWO
	TveYo+3ES/uCRfsSr/U=; b=LH4yN1xUjGDj4Crv4C/8ISiVOaWv0I2qSshRYCPu
	gVSDiIq3RQ1WWt/rZjqfmoOkmG0FnZdSkBOpuWhqmVg/CchnULzkjGOBgqtV+Sdp
	hmNDBcxDNLtxRu+2sbXcWglE0EQYjCPJ4xy/EM2jO3QG3SvRQ7/zGcTIXhvCKad2
	owC9hl/9rrJ7sGlClsPS9yOp8vZj6YMYxgT1Q28ct0nWpawKFW3rxw89BKoelQm0
	DCczyUmhqSCj5P6F5sTK5Js93VkiTii+LlvBhlctBV+jRNbpxrUCA3F8Sr9f4S1K
	CfH7PkzDd/XgRDvCWdQWjspoROOv6E4RU9OjCTdOdv32xA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqeh1r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 16:27:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b3544bc7bso51235101cf.2
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 09:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774801630; x=1775406430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2DRZhCEGAhiBuBP1YCe5luWOTveYo+3ES/uCRfsSr/U=;
        b=abN0mbMLI2Ul4k+1JlPXqKNwyfx+0VeFw84+g0l4JTS4jtbiMib4WHdpZYWZ/4Lid2
         iM42L0Hxp/VmjGjYPYxjlCksEJAUJHWbLLcy10/IzmZCjr95UemdvK0lHSOfWs9y3UhQ
         PUQL2Tt9vayzuLekBc0IifjTQfkdqtVtuID0fex0vNfDPj2JXk2VA0IIXUB3S0PgwX9m
         cANiR1kUY6OmAIk1v1OCi2LEdhbFFQ6XiblkpYN53CksMDOWM0rnrrHz3G3KW0+NYlP8
         Nauo0W5od3v7EGrNwrhcUO9QtH8l825o5ld/MUS1jt6OY5Zu6vHgAWgKKf7bOSZFlOXi
         AnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801630; x=1775406430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DRZhCEGAhiBuBP1YCe5luWOTveYo+3ES/uCRfsSr/U=;
        b=mPHkApvqpoU+Dkaq1TWznH3JR5Ok4PsOpjPw3MroBpdVDytXlD7yz2HaJZ6wglhPHS
         WVSRGCq62Y6xtPuLod5sTQz13no+i18RhsyMWtUzWYVgrOjc4FFmzBLVBwu5JWvTn8GT
         jMug/6VR5fpw+XSptXk87eiVeO7uDKQAV6OPQlqRzbzH/UdaDx6ce0NSccLbe6TBkFwu
         W3hwq8xYc0IM4wAfaZ/VY4/QM33QJeGeZkP4MDBUmOg9raKW7JzaxDJHIttQfRAQfeoQ
         SciIX2MwlngwySgLCarbbuTSJBS1F5vBHpg04dBRFjTIywqsqrO0rhef69LYgiRTKBjT
         hk1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8noJSHxts6FH8DrVmi8HS+1/C92oBiHCMtZwLKfJyVY0VcdUp6SgUaE0OlM+djgIvbzyi4xkflznV@vger.kernel.org
X-Gm-Message-State: AOJu0YwbmRPja1b+5mqYS4umd7+tXg5RWaBjfHi+n1hRLCGwOAPNcm1I
	a/HvMkE0uFSfffx2P82reSnotuYoNatgi0o01G27N6s7frF9nAOfvLxyIByyCkLV58iRmh4u+XO
	pKOVYzhpIuLqCh3O51MKPwrpzqk+hvc8G162axIgyKq+s46D8OqoTs6UU2HladV+e
X-Gm-Gg: ATEYQzxLUfDnQgc5UhIwabQOy5wIqCY/06zCSuXuqzYMU11t1AZM+/a+bpgY0b6hjGa
	b/ERFYA0RBBS1wCn3GWuqr05GNZPCZ1ZET0fcNPBcUpeF6/rsCQ6KFXxh7POwLblYVa7YuJQ/Ze
	rFGDdYjQfLWyif8ks2Z9QU2W4klQg3g4I2Tz+giVNXoVApabnh3OEbfooWqNcG9EE5KF5auHN2e
	nnszHH/tdnKeZ7HBfXSqwhNBDLM3HsvqD2ccOT98Bh16oswlFTTEpZ1jMyt9aJIqiVbC0Kb1cKP
	nL7AUYwIEmBTQLedh484oaz9GewNY6STeGp5wd2sLLwdMi+xLgekQdjOlo3xbKyzQ/YneKkogCV
	LjX9alDDQuaPLr+Ta4ILeMpkzSW1bzU/uIQQOy94296aITaEKsbVGRJ452m9wk8pi7+VFkCNu+A
	ETxWEixFU55w9FHnTmXnYV4GWZRaZSxEpz7/E=
X-Received: by 2002:a05:622a:4d4d:b0:50b:26d7:eaa9 with SMTP id d75a77b69052e-50ba398f174mr111884951cf.64.1774801629995;
        Sun, 29 Mar 2026 09:27:09 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4d:b0:50b:26d7:eaa9 with SMTP id d75a77b69052e-50ba398f174mr111884651cf.64.1774801629485;
        Sun, 29 Mar 2026 09:27:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8389524esm10059401fa.21.2026.03.29.09.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:27:08 -0700 (PDT)
Date: Sun, 29 Mar 2026 19:27:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 ath10k host-cap skip quirk
Message-ID: <iudca2llwe7dgisilievlwz6t4vbswfywmz43v3oski5usbvxo@ll37ug7adaoe>
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-3-bc08538487aa@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-3-bc08538487aa@ixit.cz>
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69c952de cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=I6QQIrWB-BqS60JhQb0A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6IVfVEsqXFOPRT1UAmRXYdiEOCEENsgQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEyOCBTYWx0ZWRfXzhvwa5imshTA
 WAV+upSZ+eAW5jV/VppPAkrnmbdbzxbpVkNhUoy7/I9pl35ykQ1QZGDy3EzW55YwhVcnlePijaM
 xd2DBWXxqc9pBTMog1ZLkzRJga7y+mrWInXegH+28mSisaXOHamfit2Ttm2AXqm4vVgTVixPqCQ
 7DDs6Iz1DEswXG7Swf2E+WGUHlCAikZl8Sv1avuIuhiRJWGVJa5ZHgzD8piMMZyCbT3w6pfSuUP
 lLKTA/va33okBiOpOhZbEcqO11susGw3QoLArGojal84DVCz6i9BjngAQymiQEL4x8WIGH2KKGk
 KD8AIgAol3e/3WoxS3kWxGKRvuq7NXRt8qGnFoRGmwAFigFozIecigk+oHdcvVuRxA64s7mR3oh
 xXo5eV9AntnU/F0dB+SOj5W1qbOaFa9c3oSCBBJ0ObGdJnO9jC7Ta/DQbM8gHRRTKAZtKlo/kmX
 YGJy5/jvaKnU7wo9+7A==
X-Proofpoint-ORIG-GUID: 6IVfVEsqXFOPRT1UAmRXYdiEOCEENsgQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290128

On Wed, Mar 25, 2026 at 06:57:17PM +0100, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> The Wi-Fi firmware used on Xiaomi Poco F1 (beryllium) phone doesn't
> support the host-capability QMI request, so add a quirk to skip it on
> this device.
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
