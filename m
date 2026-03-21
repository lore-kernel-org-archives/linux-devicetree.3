Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A170D2BEC55
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076525; cv=none; b=f2ItVBuhX+8+lFfu4+MZuV7ULdwvwF/rEhOpR4pRtsfpvVLgMo9j5OXPM6GC66hAJvgdIHGo+iJDR8aJg5O0b0MjzY8X/8haX2deXpXWFEQMdppE5sUIHozO27Z+6q4oyNl36gNbO4/nOHV01tFHsmuban+VDaoGR+sZVYZbgfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076525; c=relaxed/simple;
	bh=5u02XgnLOl1nM9VIRGqhIO5H60GCoTiXnFrL90a7cFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0hfKsz9Pz6qFUUUo6+y90bynea8rOdqKpY0oT3aXnodow8DlUrWwrFRXuXpFBbxgWPWO/7G7fF0AmWl0tn1+7N99oH2zZ5v6sLJOxx98rVoEmeh4MiQR9kmlIQaPmcjlRBR6P7Y+ZAEft3cNbNynNAHmefFG125bE2RtwAGzE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0ULBMtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MeZvsQrC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0ULBMtm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MeZvsQrC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L4pjWf3826047
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 07:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F1+zN2bFuHDO4Dnbjwp7azYL
	oYdf87yVpewfEpXF2C8=; b=S0ULBMtmBntl+XYfrJX6oPnZULRmPPBlJZb1IweZ
	tRfk3xgyBHWdBz8ZkWKzKmzCm2zSacaUgA+lc13AZvsI3xgROAnbX5s/2G74dAzn
	0y5g0RkdAHDCa+9MQdsJeAH+Z9nnCl++VzStYZ1/jDkNa8s+PpRmgU3adcSNpriQ
	O7V27AjPuUNPObPTeHfWMtCxmbsHJnTfr87Z9bV5aI5848YYZ2bfecUXN6mgwMxO
	Vso7d4kAGYRB+Rxcw6IfAnsYb4PDVcnYyBvGNKJ8NGUuInNTWkFDbt8riyUfAecb
	RFNodmrq8PqNjcGArH0c6PJ/JDW7yTWnuUxhC6lhcIGj3Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kj1g801-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 07:02:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093b92f327so158003011cf.1
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 00:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774076523; x=1774681323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F1+zN2bFuHDO4Dnbjwp7azYLoYdf87yVpewfEpXF2C8=;
        b=MeZvsQrCGM4479/Wdlx+cNltCGS8U9ooWrmQEfIgcPMN4XFy/cBYMzRVr8bv/OC1Gt
         L8cRD7CFmw1amxUcdNiGT8btfzMvMoVSI9ULWotbH7Ta2I/zrfdnvW1HDTfKdbsCUGq/
         xdeRbl6QQJmjkHysishdL69Gj/msqL+dCWWoEmnTGmtPNSZh1u3Xq6kuFJGFoiV6/Ztk
         S9RxwsbTiWwn5dw2/Br9U8rSUDx7xX3hAJdPdqEIeHYg9u9tiVgYypxhjUcwwzFvegve
         ksier8LX7yp9WHFrm9GMSHSkYXT/acr8TZ2yU+aLxh6czHTURGLuUaL4jsm0r9rifN15
         DsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076523; x=1774681323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1+zN2bFuHDO4Dnbjwp7azYLoYdf87yVpewfEpXF2C8=;
        b=LqLfZhYj9EEklZTNd/mWz1zhWDKNA3L4zNedIJSmYuHgDwJnRKwpOxnbfad8mfSo3d
         xy/fFiTbvLd53dHSwOXOLqAfwub1wtuD9j3fDPo7ynSShRB7OEb1q9BTkqEFZl2bqlrs
         riMMMfBnD271p1x44BLP/9GeYQjC/vFawYaIE3zLHlEctVmFzvDkrzHGTEpPDM0RyiPs
         4u2fPmvWgaHK3lab4I6LPdnP9USk24tOQQWzK/q5wy6hTCH74kL1oHmEB7HHdyPHnjJA
         hcl6gIgqZK7c/D3QVzaN++WovVrsS41NNIeiCB8EciPD7KafvQwmpDBOUFFzAJOT2sEq
         RHBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbeKd18mxR0jt5GV+yhH6bJ13UjpIIuN/ry37KeO8j0xKIjBK3RrnPifNGiadKQR3tHW0JLIetAeea@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/PVzWRiPEZxrsLJn0tUvUcOdxrCKSLLuMfOymXmqQGarZenPe
	DKzIyetI7r/3PLuvHZZLpXqGAK0pYKH0HC4l69OvWsyfIhv6MYe0EWl0x4leGtQ3bn6UZucrPGG
	uVb2FScKCXBUb+Gx+PvZ8jvP8Q84WDwt/m0MUOSjDYgr31/2gsLk6fB3Vz//TKUaVDSUOFp+C
X-Gm-Gg: ATEYQzxGGPt6dewHdv4gUC3BXcUkyDV1etaZ3IpPAhEUmu2Dzta9cMfc9P8xYx+4Cmy
	AlkRa2ckfNvMTuIkdI840AFixtaJEYa3TUmwlZuwI1DHO2xfE4RqfICBb0cWhVSzPsnnh0qfS3T
	r6fO5omfjp6aefINefFVBXaEyc0lXA0k7ict2Mf2FZilUaaN7jaI6OTxBX1kP1NwEtPuZYAEG5h
	ToZTBWTKojKc1akSfdI8a3DtWS392ixYe//hP3qYFKvF5CW7m0n0XkaumL/0vXregNaDN2m17Em
	HgXhNGNXzNl3puvGkh5swQng1gxqmZyQdk/BswXwyylUg8pLGHH6uZ4avZKgmQku61szEyGa7PB
	UJ9LJFu0KuUuBlUSnNWDGzBfdXGJYWojdpK4eMWDIomGd3BxikMs+/mDwvlzN4l7fbdzjKH1vg/
	vOUswCbzmlgD0HQ2MrDqUOP6kXYuGNE8wd2V4=
X-Received: by 2002:ac8:5905:0:b0:509:1cf9:ea09 with SMTP id d75a77b69052e-50b375e6175mr86368811cf.67.1774076522884;
        Sat, 21 Mar 2026 00:02:02 -0700 (PDT)
X-Received: by 2002:ac8:5905:0:b0:509:1cf9:ea09 with SMTP id d75a77b69052e-50b375e6175mr86368551cf.67.1774076522385;
        Sat, 21 Mar 2026 00:02:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530bd3dsm988211e87.73.2026.03.21.00.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 00:02:00 -0700 (PDT)
Date: Sat, 21 Mar 2026 09:01:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>, linux-arm-msm@vger.kernel.org,
        Petr Hodina <phodina@protonmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-shift-axolotl: Set higher
 touchscreen i2c clock
Message-ID: <gdwkcwne5amodws3kh7jspcrvf56fivj5c7per5m2vhfwbcb4l@kd665sd2yjy7>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-2-89c9b5ecb26e@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-axolotl-misc-p1-v1-2-89c9b5ecb26e@ixit.cz>
X-Proofpoint-GUID: mnD5SwLE_Fu3F7Vyef3UVOclAepvzso6
X-Proofpoint-ORIG-GUID: mnD5SwLE_Fu3F7Vyef3UVOclAepvzso6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDA1NSBTYWx0ZWRfX/4Gt4hMdp/1J
 irK3AWupREMq8TvQ1uk1Awu9e3pJ55IUVyVz8cAv412JodigsN+Jb7lKHZPDGWStQcvdHXttdnl
 tYHI7iRwuyRtPT44gVND4TXLBoYLmvga2HSrR4gAdONRE9VnHwfo5QkXWHqF8Gs3GhDhuTAoAaX
 pMJ5AzUhiH8fjc1oHRKeX4tz+n1q1AzwjXbVuMUEUOKMw856IQnM3qQXEv21TiwsaYOozcVKKuD
 oMZ1Zg5URuH92FzHpn1BMQ1NQE5V+ll1Uv+6P0KrgaEKQILTxuHtVRlXgcwc7JM6ArsUPz5aeUK
 IkbsRyA84IT0RVUTSGQS40fannqH5nP46Lc2VVxbD7V3a2Y0Tl+D2O70+3PjEY2hKVVR07CT4rf
 N2rRAvdCtBzDCG/qQECdp0QCgFHKHX+/zkgqZ84iwOHa6us8/OcWd0CbFG0Zvt9nOFZwBhccG6O
 19135kiikdtPpjP5QCg==
X-Authority-Analysis: v=2.4 cv=dYiNHHXe c=1 sm=1 tr=0 ts=69be426c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=jB8_oC6jW5EHyFLWiXQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603210055

On Fri, Mar 20, 2026 at 05:29:06PM +0100, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Sets a higher rate than the default for good responsiveness of
> touchscreen.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
