Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168863D524A
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 20:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775247668; cv=none; b=athv+Getwqt9yB04gOMC6M4lyis4oLB+S+jKcoje5HxsTz5CRHsFpys1iTTTRu4z3EVkq+UQEBioiiZNo5qVuxXRrXLodlQYWkVXraFlSL80Q0qVhIgqMvlBAzWzhUC42EOFHwNpVzCAtORCxX19WQAPRosJIkssI/WuKOKnQXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775247668; c=relaxed/simple;
	bh=8aiP6h1T+J1Y5W6D6bpL5A64MY3M4snDFjE7mjRB7h0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZynsaVLjHSSWf7g34LA29iMbui33RGpU9AgTZEGSojuu7piyR7ksLfT2ACwSadskA1iEqM/zHiF2rxDmY+2shVEa6DDR4KRFxzVSjvwvyNUTaXEBCTSq3t41cvENbBaZ8XjRvtUcrcx4SL0v3EkcQBzZPwi1+g0zR393252Kz2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHG/A7Eq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=euuAXcb0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHG/A7Eq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="euuAXcb0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EiWXd3772507
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 20:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IXtD3aepglFU36wR4gYJ9C63
	QOxUrZddwTLBJBANcQs=; b=jHG/A7Eql1t5aEV7q4qX7N3Bcq97bbRJWpvcY6DK
	cYUpIxe1l7PzqTgLKCxENUaNrzFi+bDbUrtkA7dno5PNCWCLa+khdhrBFNXofMSz
	W6PTC9FCg3Lnqm2GFzdvPyyuaEG64oaNVEp+wdJXR3k1/E5L5p4ZXI2DhHcU6IWT
	sYLygZoJUM5tMsdAU7S+76kIBpbAy/9T++9v55q/91yp017DTjbSmVKO07nrV1B8
	0Uz0KCPQ/v0Roz/sMdZ8oyS3miRkqQeVxwnKlEU3wvEdDU4VjiBFxrGguVzSft9h
	qMW7BROR8AXBtI5uyRjp3Ikt5btZchtWLl7zQpDnZohSgw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs43uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 20:21:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b323c43fdso48879401cf.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 13:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775247665; x=1775852465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IXtD3aepglFU36wR4gYJ9C63QOxUrZddwTLBJBANcQs=;
        b=euuAXcb0rLhGiJMNKKSHMp3GKPF4/YX4XFpwFrdczVLjFzx7r66WePthn8iyJrnezI
         DQ6PnQ2lEMqj0/ERoakMj9OsTUEHZPQMQ+2wYAVkimrELzSha0W15D/JG+pY7p+WKHR6
         12udUOjBVsMlez4QgmP5KmAeHMKPCaWOFCXUTRwalSfT2ksV6vNlJLfhyBD/oNLlkp0m
         iVfk6JM43ddo+L7temI9UuwpTk53LeFwJ7caDu3IEGNfz+sLVpl/foE2j8A0G8EaLwkT
         R37OWWqVMB3RxkKSpcU3lU/OsaWfz6EnpW7GbvGLdBxa+OXTtwDGS3hUfr/pHX1mBY+S
         xjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775247665; x=1775852465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXtD3aepglFU36wR4gYJ9C63QOxUrZddwTLBJBANcQs=;
        b=c2L+5gsztTzuRPPmI2KZ6dwtcEQGU8fbQZVjwRvTRmmv1FgYK6Zy9h43UJtCvuelAD
         xxQ66FHSfL/xS2bzpFkIeWsnfwXfaPzyoCasUmvsExNO1/XAituOmLJc01dYk5IHROiE
         kdx6l+fFI4v01pGAHNqkqsXHJst7ZSidCTL3ZgRUDCkJxmIXAvcWiDz7NyGPHUa/S8TF
         M6IZkwg6nhxR4B9SFGNdfbQyOsOJd9WQk5yUz9AesKSM2nN89PUy6LOVpXv2P/x2PPR7
         MV873CQF7hYWO367fH3T2+KO/U87VxnWER3U9FnNoSCUKEEWnN3gd7w6J7TfEq6e/iZc
         ddcg==
X-Forwarded-Encrypted: i=1; AJvYcCVG2XjHsWSB1lfVoCge+oycBNIAbI9ufoQ3xLmrHCriJfxlGsuquZze6ATV08ulHQ9M5EOwjGEZZtDv@vger.kernel.org
X-Gm-Message-State: AOJu0YxgWizXMSsGnoshTt60XmXXQLEBxm7SMN3BTRkV+tbdkjDn/wSd
	hHW51WpHJoz7HJckLtnUbOEAWYJ/wVt+Y8cb7SfZKsKvLwTjrJpAfIbLQBr446PW0BAgFF2Z4/u
	JndbaO4zm4/U/5hoxVGt9nObPxNc7HW+Kr+UUC1/ZxIJD89+YFhuy/6dWP6lNHS9D
X-Gm-Gg: ATEYQzwLKOyAjTmcYVMAXxx9dWlWNRneVqhJbx0POb9aej9NAU4hWWPyIYqy++/UIUz
	UkwSqOSgaQXExXOITXX59HBD8FDKT3LD+YstiZjwBSrKth04G5ghQZybAnZRc5fijhmZz4RvRa9
	Fn7ELMrrZ/8JK3oTthEavkKESjAJ8Y4bsMvddRMV6TtF1UuM7ojhy8Mgg5TXulMpFQA3CUNjF1h
	VdmgZxUe5dUGXWagUOAXfLXfYD4B9kp/kJV0oXOp1pyeV6nBrI6MGc7D5S5ORsf5Mj2wwl5b8Dr
	SIIAf/LYsVKJCc+NFH+VPIAGST4DZlagW8Min0fc7HYBctOQNnbAy0klm4fytckuMvN+Qo//yn3
	ewUR28ZP98acUC2JgkhyX9Gzz7+s3AKUsciMidUW7O5LhX40X9rDZDshIT+nN7nrKr4Qe3Z42X/
	aP/aGfn17Lp42AXx5J7pebGzP2sMw2ZjFMmEY=
X-Received: by 2002:ac8:5785:0:b0:50b:2e8c:6ae0 with SMTP id d75a77b69052e-50d62ad5287mr64692301cf.45.1775247665328;
        Fri, 03 Apr 2026 13:21:05 -0700 (PDT)
X-Received: by 2002:ac8:5785:0:b0:50b:2e8c:6ae0 with SMTP id d75a77b69052e-50d62ad5287mr64691951cf.45.1775247664836;
        Fri, 03 Apr 2026 13:21:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c951b1sm1688529e87.6.2026.04.03.13.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:21:02 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:20:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kaanpaali: Add USB support for
 MTP platform
Message-ID: <n5pxrfwgqdg62p5s7mgxmvx64o4mon3wlys3nxzjlcq5v4o6bh@3gl5dtfctmvp>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-3-krishna.kurapati@oss.qualcomm.com>
 <10a9a474-7612-478e-9fb2-85b7b01ec7f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10a9a474-7612-478e-9fb2-85b7b01ec7f6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ysSIbmNw-sMZKaCfOQxkYWswHlxcI5bV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE4MiBTYWx0ZWRfXyR67k9Fn9Fm7
 Skz1ChsIFY87xxTmugu/BCNurVztOCie7pU0QSPjfWBebeiC2aduEJaKRQxFXh4n4viw8UjpK54
 LykXUwtXXPtAaz/pLMM6kXwdNCI8m0GwXSDTuloidRCyisEVPJ2tfUZZfiip6ng9OHy675pc+I3
 G9Pavm9edfdbnoNA7Cc+SpIIbTwRSwNPxgf2CRpYqJTP+Cv+TiWNQ2DSfCkMQMPAfumqhnRRihF
 znRi23PGH5Nvr2e+cR4Qy0l1OCHHVVuK4AHtG5leHP3p5PH+QGEwUoTJsAJGh+eyIYTXtQd+X88
 181cYL+bc4l563Fham2H+0bR9mhS5CTm5Xuri8kLvObAdaTtHrOOhwIfTxk9ZSlsUW+ACIwxDrM
 3Yx7gWHEnLXfFkt1mcZgmDoFLe6xRYYKRixVpQfYAOD6BUV86FiW7I6PpUsBWcLyue02cwef71R
 xdqa3yMg3iWJW17eK6Q==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69d02131 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=2h0Dhg-k5Ge3AQLY1mIA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ysSIbmNw-sMZKaCfOQxkYWswHlxcI5bV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030182

On Sat, Apr 04, 2026 at 01:39:50AM +0530, Akhil P Oommen wrote:
> On 3/29/2026 11:22 PM, Krishna Kurapati wrote:
> > From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > 
> > Enable USB support on Kaanapali MTP variant. Enable USB controller in
> > device mode till glink node is added.
> > 
> > Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 27 ++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > +
> > +&usb {
> > +	dr_mode = "peripheral";
> 
> I can see that the usb port in the MTP support 'host' mode too. Should
> this be 'otg'?

It's stated in the commit message: OTG requires glink, which is not
available yet.


-- 
With best wishes
Dmitry
