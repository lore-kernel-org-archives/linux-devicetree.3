Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA8B4D09F8
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551905; cv=none; b=WdCH6n9yEnU6Y/9DR4vWTAqYveRsrDpWdZC8/66K3whJk7s6V1i1qPiF7oyGqA2zlbBv9DICuhUz5FkleH9yKe02KkEZ9BBjES1NGQH6eXnDBvYcyxMVC7SvrG9Xvs/4hDxJu1dRvl7Fl2MMZyXMdwB3aq97jXSgAoPXjIryaDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551905; c=relaxed/simple;
	bh=35owgoMuwrrGhU1IN3tED+EYAqd8IALpPDCTSNeIVXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWOknTopSjN/bMcxQ/tYUoHEjU2Ndxhj7AXf7s2znhyu/C4OreWbS90XnW9Sd7FnKIVHAt5o5fbPDI2u92R++UU1ZTcuMsc1nXIhWVCnSpUhhx99ZnXQjzs4HYcdBG4u14qL1ou6U7Z1kH7bJ5OodC+ndQtYp3Kf5Y+URn8pnF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZ6qkEpN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LabpTZho; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZ6qkEpN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LabpTZho"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699A4hSU1336320
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 13:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qYYBr2BmdY4zOcF4U3A9MMVD
	JkUDAoza8jdCzVd87J8=; b=gZ6qkEpN/3z0dp4iU/6TBh+4OpMelin21NOP/SRx
	MNxj7f9rZy6MhtORC7OPNIKpz0JZHg1I9i3mtUqbFcWTJLHI7Ojsva5tvjyY5YYe
	Lb673H5g63L1jckeq5bpK4hyA+XyP7tRAflWpb/Y71vJBHMrIc7SMehyyJEvBLZs
	Bpe6xluCmmAjxK7RFkfekuRVqoY1UDIk/2xSvobcp5PCmJ7jC8XP8VmxbWpeNcAX
	e3SSyS/PTEE49G1VR/8XR/5vL+X+sx7n8Uz6ekGflQa94kdQ005deNVvhvkg5/Jn
	ZOrVGikNdxHVoM4cJnL8E925DFF8Y9Fx5bbR+Jw66l+0QA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6x6wgmgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 13:18:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e46b4b700so1116168485a.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 06:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551902; x=1792156702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qYYBr2BmdY4zOcF4U3A9MMVDJkUDAoza8jdCzVd87J8=;
        b=LabpTZhoIoMEjsMLcxGlMQ9d0VSJRd34LHbzVo64uUavhPpEBAcvfOcZPM2o48P0G+
         RqbU/Z4z4999j6Z5DpTv5vs8iLO425chbW4xPGn0VxUc8aeFVNHEcTnKBkdK9lMFffm+
         qV2FQWVOaSo4m1Ho2GOK6UyE1m9v6EgQRmgWLx+a4p6hHf6fQANlKesOoCzG/Opc9I0G
         m/COS17MgQ8cC45JA9ydbn90k6UBUv7zUb0pnpUiu5SwpWtbHvrvFarJI/Y9BSXIcVEa
         KOky8b+IZfKYy5dZ/L9U9d+hu3aanePPtQPNuZRLWgMzERMUX94th8y6U+UXOzblry6O
         pLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551902; x=1792156702;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYYBr2BmdY4zOcF4U3A9MMVDJkUDAoza8jdCzVd87J8=;
        b=YKbqM58EPDIUFIkPyccEHNoD/+86vG5tJDg8WY/gXcaAMFn8+sXZJ/kskfCeWeiyKM
         VfZY1uX8a2dB1P1Aif5Dl8W69fnUcMSNya+bSG3sknVwgI/BwOXtd5ZBctVSoEA8U3CJ
         CVy90qQE0RFAXS2rlB4VT/OJGWuvoDUtSUCTk6tzvhd6wGJVe0kxE3yXsyNI9aTmpchO
         kAa32AfzOTWgs/pYW+XZcs6zF31Hz0+y4KQD3s1B1j/rbyB9FgcoHuPYdzJGRQ1TyvZF
         Sx7uHckkVvcDbu1iQnbzhZc3SU1pPS0XPJ5zK2gp1hd2oiLLcdW9h2edAtAGNV31IvsS
         F44Q==
X-Forwarded-Encrypted: i=1; AKwUvBy7yF/dVTubR08pa4IW3QcUHoEWFC5Uge+M+IyzDNAsgkmdzDlJY/M+dsVIkVmr9OU/8jIO8Z/qnEcg@vger.kernel.org
X-Gm-Message-State: AFq9FYIXkSuwTPn5KIu++MbcS+TSCrG56Mf8XmNLrHPlo8c2OL27TfWE
	iH7cS5W4wkf4hx2WTgzXjnUP0Mc88sm0liwXnyvNRscxBILP4QFP6Wr0QctWtS5quR0fd1J5wz8
	0TsII+t3uvywdRb+VT04aBrvz+swVtFv0jvTG6F6RrZMdou0OzpHBhRdO/AHalwSU
X-Gm-Gg: AYBFou1sHjK3wLw/72uh5SIeLpcIg6NIJlihBJDwu8uQrQKO7MNW2os8CmD4+2WxmH/
	+srQ2vvS7a+SS2eicZXMCeklCa+X4kc7r598R7hq4HcjDktZ6gTVAvqSlI0denH7mTDP4cuVPUb
	kBmx1QYhW8SHQphjxxVgw76E95t40IJtNsjQc5803AMFB4eof79+womQRp1B82lz3lgxQrTJiQH
	6bc8eCEUoL6DJUAFEys7+e2Q71kCDuy6VmMXLZXm1IgnUf6ScJpvyicwqO0wNj+gn24yO8i4vRW
	okbQwyJMAq5VENNhFQKieO6E6iHiRL7OFHFKHBt8VfDGqMkdu7DHE9qc3RH0836TnFr9Lk8dFI8
	48snrZ0D2jO3x7RcT12HeIHeMJMFL/X8CMlWzGhH+3OQD064c8X2T26eDOXFIZUNmzK6TcyGIsS
	G9bxFXmJgxCq8H
X-Received: by 2002:a05:620a:2951:b0:93e:6da8:6cde with SMTP id af79cd13be357-93ebd207afcmr247614785a.35.1791551902211;
        Fri, 09 Oct 2026 06:18:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2951:b0:93e:6da8:6cde with SMTP id af79cd13be357-93ebd207afcmr247608285a.35.1791551901630;
        Fri, 09 Oct 2026 06:18:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cd5d8fsm5986561fa.30.2026.10.09.06.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:18:20 -0700 (PDT)
Date: Fri, 9 Oct 2026 16:18:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/4] drm/panel: Add driver for Novatek NT37705 panel
Message-ID: <xwaxsqtffljmv2tgobybq2f5v23hs26wy5zjdti3dziu62kq6z@qpzlpnmplnwp>
References: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
 <20261009-fp6-panel-v4-2-7c3819664778@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-fp6-panel-v4-2-7c3819664778@fairphone.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX8c+OMnaMRvX8
 ijN3B63nRDDZHX+KjJ4wmb6vsoAN8SZhl6Yiv7mbnGZnLueIQhYbfijP6zJ67LDtZ0URB0P6+QE
 9kpoCnqrDVwupHy5obA9Fl54ua9qPNo=
X-Proofpoint-ORIG-GUID: ZJZk1LJ-Q8VKpGf_niXNt4P07z3BCTn0
X-Proofpoint-GUID: ZJZk1LJ-Q8VKpGf_niXNt4P07z3BCTn0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX51FPbCFhCZmn
 UcFNyB32pRYDeT4eMRzqiWUGTVn/VWpOsT2s5hS1o0ezxpmWANmGIE7DVo90q+NbpOTP54tj4M/
 9RZnafMj9jTa4LTeG0kRk9UY9LBksJrySaToX4gKoChiXXUJYYzQWd5HD9jz6l6H0WAC8TrxsLK
 DKOGmNXDzutp8SoHW3XYlwhtjDLYc3bp23Ypr2gUcmYqrH0z5d7076qyJR3+uNWuzvTWJbtdH9G
 OQuWIKWjq8t67vFg/ErAkspu/CO4nkJy8Arlq5Dx58zJ8ahOoPOQDgqanUVVLM9jFoxhfgA2Q+H
 mUsfTE6rM0ux6YUt1xOlE9LL9f1oRPszpb/L2IoYNGIK2eRUo6X3wexs93X/nF13MZCrqN+J7PW
 +oDcBDu2c4vMA13mRYSnSGOvbFP3IOQhrpll+xK7M3/QN4mzwSA0yhgo2G5+bIVh/nF2RlmKDtH
 hi3KmTuon+Gpxnnsdzw==
X-Authority-Analysis: v=2.4 cv=ad30Dhot c=1 sm=1 tr=0 ts=6ac8e99e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=qNtwOHy-hT8K20Jd0IMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090052

On Fri, Oct 09, 2026 at 01:25:01PM +0200, Luca Weiss wrote:
> Add support for the 2484x1116 AMOLED panel from BOE (BJ631JHM-T71-D900)
> bundled with a NT37705 driver IC, as found on the Fairphone (Gen. 6)
> smartphone.
> 
> The panel can also be configured in 10-bit (RGB101010) mode, however
> currently it's configured in 8-bit (RGB888) since there's some issues in
> the Qualcomm DPU driver when driving this panel in 10-bit.

I hoped that fixed all of them...

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |  12 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-novatek-nt37705.c | 396 ++++++++++++++++++++++++++
>  3 files changed, 409 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I went through Sashiko comments, I don't think that this driver diverges
from any other panel driver.

-- 
With best wishes
Dmitry
