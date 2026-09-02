Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ED53EDE7A
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339129; cv=none; b=u/5Uv/Z4r5QbvavPpw9zPe8sES4bSHDLRF8rj02rNne1O3OOrJjNECyN+m08jmFopSAc13itMCrNhtAl2AWoXqEC6XwvC2AIs1PUKV+0xAXwg9lJtRrXiD+ZepBRmzVrmHZV/rI5avoSHIyaruBXeUd57iO4fuuaU4Nm5WxN4Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339129; c=relaxed/simple;
	bh=fY4pT74fhdIaLqtFaOeg5ea925uheICqOwWVTugcz4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoVdXoxgtNHeUn5jBlnyZtea5sEP1kxfYD9WRgrflBSuriEidWKL+n44pBQpUfJE3qMvbzZGNTwZJgIBjwWR1u3gx89BG3P8nKedVGmso3t2YXEaHTSGz/KtbJ63MfGVY2wYuJmh0lH9ZSpnQfIci/sXBUe+t50OX+y5aM88g5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y7W+CFzB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HFTvI3bS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y7W+CFzB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HFTvI3bS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VTfg1859130
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 08:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bXgXs+hitlGsULTyD6O1u+uS
	3oBd0amHcEygCG/DrZU=; b=Y7W+CFzBbKBcnA1f2R/CmUJYsXc2JXJI5t4kP7bM
	aFOEYQZ36p7HOkgAh7Csj23i5m8q+Mu+leLNAAyKwj4gAf/OZkKHxJfZGwi75FFj
	5mFcvqP6rrEYnnLX5MULigu6cSLi096NnU+1NO2p+6cY1ExQm+x2+U8KxTHly0SJ
	fJF/p/G8xT2Q4rR7Tw/cjB8zv2p3+DMArXaRp3IXXv1+PK8nmD7HIRyQHBqKpnPB
	22SM4nj7qRZM2CiBBmOtsK+EPqKBeA6lmL+wWcxtcJBS8ASEy1TReebqBLQNHDVb
	lp2l7utTtCRdU9y3v3PJ9iyftlEKoDG5A0HqPioPjQF6aA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge8whhp5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:52:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939062ecda9so133400685a.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 01:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339126; x=1788943926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bXgXs+hitlGsULTyD6O1u+uS3oBd0amHcEygCG/DrZU=;
        b=HFTvI3bSoQET2DaYxph4+V5uoe7mEYoWDABOrfSvBIDYRGNzApjqJ4lBy9ZmDvsM/G
         2wtTgdO7eB24pp8bEOBJFoONqMIH4w8g97y+gSWx6bYKceYFP1DgCzSJ54ZcbRvRM/aK
         sMUly8dktYCGdNiQZODxaYmOlJXtSi0xLaxKYs0CD0SO+bHRuiD/0vO/N5PlJn67VNHM
         nhYoWZ9RRHgz6lkpJoUfhWSkT4Q+MGphv3CWj66dRg6W7zdUreGfsE2Cy3/0Uk+Rc9A0
         u2qmC3GbsmzGTWn15tzH54sIj6c03l0iUly4KX7xtfwaPwmd9syPXNsB2G2BvdrliNMO
         hXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339126; x=1788943926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXgXs+hitlGsULTyD6O1u+uS3oBd0amHcEygCG/DrZU=;
        b=obeNR4U4KABpCJraQnDwgx8jofxWUzlz9uyYDHuCcYBPUeSScZTEI2vUuRRqvYScr9
         3XLCQtYqlBqgrVFJDsnMcRd26RGqSsJ0GTRrWMwxhHWWV7HoYVv0dfR4hvxwHW7QUD7r
         xChuQCeJFxoGGsCug0syWni/Y/bHWo78GDnv/+b8e8WQ+Ows1LX2pzH/ukyuqYUd9WpW
         2UGs4rORpTzsu3hlLvWf6IKeuWppEaav6dc4zxyac9cMLTZOaZ0sYQdQ7cdW9UnYMZBo
         mSReozY4ydvhf+3yLeqFEMEvZc6w8kzF8B//IKmDgZZERDv8uYOk+WuBiWAUIVsLGyxg
         HGTg==
X-Forwarded-Encrypted: i=1; AHgh+RrGVWgRXXKNvyBQZPpBlLMMAB8YlOa40O0bGPT4XmY936GFGGVGGNyK0aU0pHWu/744qjzolN8LVW1G@vger.kernel.org
X-Gm-Message-State: AFuF++kEiIfG8lj2T60BRYwwqBdGNYdDEgINvf3fh8p0bkPix1IDgSi5
	6hFWgBoghwKJWg5c0ZA3Wm9RTRYccB2OjxpAFQKZdGUFnv8mqAJRum6qICWJ57iGQDzOZ4EeV0s
	Ysw0DlcbR8NLk9wXU53tg0Eh/HWdHDK9zktZg6v5mmaL1xyJ0RSsVb15h5aLLk7WD
X-Gm-Gg: AR+sD10/u1YQ8X907w2SF2GzZb7LAvPOKuc4f1/KW6lKGCVP4PMQxOo7+2eTgdHR7aF
	TBeaS8LX/y4nhjd7CkDT73ao5nxOZ2jphsGb7Rm5gLoTc8EiW09naYKCvI0GDDHmSEyt30Pukbc
	E8HsXXjKrhEZWCQ8/pcIr2qmhHoERR2dgTquASgJqkBH1f+VQFGAxLPowwXVgab9OlFaJHfIqmL
	Q2x7DegVCTQRwtReYc+9GyVcjP5QGjpTazX8zeSA+dIsz0/IjSmffebme7cqITDZz/0paXVZvFc
	8RXunCcPwEl+pczyLq00fq0NZkyPNcNA/PN6X6+ZScpICDo1Pn+rU/XSZA+tSRTQ9p9eMb4Hngm
	KWxbmpkiKthpPeWU=
X-Received: by 2002:a05:620a:d95:b0:939:383d:f72f with SMTP id af79cd13be357-93960f52c46mr372897985a.34.1788339125875;
        Wed, 02 Sep 2026 01:52:05 -0700 (PDT)
X-Received: by 2002:a05:620a:d95:b0:939:383d:f72f with SMTP id af79cd13be357-93960f52c46mr372893185a.34.1788339125191;
        Wed, 02 Sep 2026 01:52:05 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce464aa32sm64094195e9.5.2026.09.02.01.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:52:04 -0700 (PDT)
Date: Wed, 2 Sep 2026 11:52:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza-cqs-evk: Add power and volume
 keys
Message-ID: <nl4lhbhbz7i5pohlenlbnp2odqybcbgv5n6aeulh7hkhq7s5nn@7ylcarl2fkil>
References: <20260824-dts-qcom-eliza-evk-add-volume-up-v1-1-0cee16886d43@oss.qualcomm.com>
 <bb5e86d2-2525-4abb-8ebf-75ba7780bbd5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb5e86d2-2525-4abb-8ebf-75ba7780bbd5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fLkJG5ae c=1 sm=1 tr=0 ts=6a97e3b6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=TXGBW5t7IxE_6OFBbK8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: lnhFJUSlx7fBam_jACrdU6pkHiIY3U6c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX3RhB8VbBIBj7
 mE1B/Fc4tl7NrHhmS/BQlWJ5Jkv+gqOifvCBpe1fFS9KIx2ipQgHY6dqa8vxKknhq8hJyoSMeBK
 XanXhN32ywBnFLlETAhOYcGBlf3h5rFX0/s5LznnTbOYU9wg0tGitxK4smTor3klsqAvwzTK16C
 QascfkGtzXUJcMHE32WQRly9IReUCsSa3y4Bst69MnnaICoI4QvRUBuX/fro4OnLN66OVnNMXZm
 6z+9nvWEq7qNi5vavVFHjT+dlI9HKD6k7YqCzajO3C6OUYahVRi9ZWYOQlnsczmAnPMheGGgrFy
 vF7mV1H0sxxo0y3E3qsZaVpJ6tolLrDk9dNQdzmmAwi2iWv4MfYJUyEqvoLAQm8Y6zewRoM6hiU
 nwPxlP5vdNP8ZvDiv6HHEIIZKFwPg+L1dAGiXJN4oKtWL8fNSERhJ2Dp5Tq0rEi31YvK4BS/bHZ
 1hXDQvKeX/ql3dKk66g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX+JpHwXwlJmu0
 vinEiLlPu3WUxGmt6Ooigbo416vFACQtD6PrnDXj/E1ar7IKX5hsj1VddtCQh1qZ5L8YyIj/yDU
 bc4jsfBZphjbMMDVfWSd7PTTEV1Qgk4=
X-Proofpoint-GUID: lnhFJUSlx7fBam_jACrdU6pkHiIY3U6c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020078

On 26-09-02 10:30:38, Konrad Dybcio wrote:
> On 8/24/26 3:45 PM, Abel Vesa wrote:
> > The Eliza CQS EVK has three tactile switches: SYS_ON, Volume Down,
> > and Volume Up.
> > 
> > Enable the existing PMK8550 PON power and resin keys for SYS_ON and
> > Volume Down. Describe Volume Up, which is connected to PM7550 GPIO6.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> Can this go to eliza-evk.dtsi instead?

They can, but what happens if the CQM variant remaps them to some
different gpio? I don't know what CQM looks like. I guess we can hope
they do not change.
