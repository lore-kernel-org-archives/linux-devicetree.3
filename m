Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B6F2F3C34
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774779131; cv=none; b=BCgMXTdzf23r+dhQlR5aYHlfyFYAqGp/DBXkHtIv5HKpxTNVVSwzaDJZrh8FzlcBb5WRQjKg09B9J+Sb1fZPqJgi35iCR3xSA07ENwnisiIozJoWjAHK5/jYCiIEeIM/Z5rx5LYj+e+WuMDphK/PLwbTnykALMa/VzFPAHwWxb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774779131; c=relaxed/simple;
	bh=dTsHauF+acSw2UdratfwITblpItoGJWz/NTU8kZd8Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7dZn5Ia2kIMm7YdDWHn9HNxZG3CvTWGuB66avsQ4Jm/9XLd5CnbGJXm3e6BpLXLpvCdlQdikCrKwPMNaJuqP5ez2NyuOUOiodXqF2hRfQ19uvHZ/9QE9MALAdkrh7poeMu6J1LLwF6BZF/HrBpGN3USBJBAIoKcrNP9iskN9dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDdB0hyO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XglhH3Bq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDdB0hyO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XglhH3Bq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T6Fs8H043269
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qcamN5b4r83psLd3XWUhDk/8
	Hm8gMoREH44LLVdVMo8=; b=bDdB0hyOPIfAI4NHVMaqK0JQBinty95zlRNWsiZE
	d13UnfXiyROzhzQOjpb28Y/7YVOAVVfLRqeyGzZwG151eCPQTo+Ngur5HYFPITCl
	EX0phWmKFtMeIzRMKSzfLbpz/v3aujEMBw81KbwbiWSfrrLPiYMVZr3CRezvwG0j
	uZdQkTm6U61k5x1079IIhMu9RBIiZ9XBhmtpFO4gDGOMGToUEy9XxePKWtZCPmuM
	OZnV1PCOU5WtA/qTk7g7gAu0y4uNZvufV3ySx70EL4BCKV3mkTJ/n3vayy3PF94R
	+/I6WmrwB3f1dQR79dkbYlKxjHY3WPbkWRX+dC4JrqAwUQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqjq4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:12:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4b81c632so114641941cf.1
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 03:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774779128; x=1775383928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qcamN5b4r83psLd3XWUhDk/8Hm8gMoREH44LLVdVMo8=;
        b=XglhH3BqG3tVkbr4abF81ucif7kRvGpI7advNR4GrtPHQoVtKi0+Z8Uiwp07oy6S3h
         wYAlPo8XmWJzD40Igs4PR+2S8TNg1snsXmrVZq+XdiOSUsdLjcL+ekl8iShx6eUDq95b
         +QoLwIgdLb7Z+MkKR1hGyewNjqPWMcZ6y0ujwjRrNerXu6GBYMSbRDqAyQ4o11qwUsmu
         I9JTJXJzypJyx7UknsQCodwrZrwdSMEltrtfkrsxQn5Z7UtrUe+dBqeCPUjMw2uuQhpw
         TcSGXoKj4HaPHdXvxlZ+AKSrSZNJVqXRy+cP/eZmjZTOGl96FhulkfX1Bk6ltibFdz1E
         HxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774779128; x=1775383928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcamN5b4r83psLd3XWUhDk/8Hm8gMoREH44LLVdVMo8=;
        b=W6AdCQpcusKQNRb1GyhugE0QeSfVg6bkYfE/R4xK7RBVQGOspGypbX8fX+M307v625
         xOGA2WSDiuzR8hLMEbH8ZfuC483FxnfgimVoH4bGvkcaQ/848zisglii2Tob8U0+Bsbr
         yHPrT5oyj6tDd1vcvrotJF1CJg3cuTztWfWdZVCX3B+YDsvE9t7Nz0uoKRcJsMPklPuN
         cLsdsHjK2NYIGXMeY8xhaZtNFmM2CULSAgxfcRs1myBTcVOaBEpi7U4wrxyGURqXe3aS
         Lbrpxf8JWYjwXt9OpSvhdFDFRjNd+qrjjSRCZR4OtPzvtjoUu0yGWnmEsx07sbehST2m
         08nA==
X-Forwarded-Encrypted: i=1; AJvYcCUbMnhTg9seyWTzq/MDXXi5jotkJC/tatpd/SDxt7duwumtfyt3rZKfh8nL2cJOL1ZNwwLIRZoo3V7F@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6QygcUffazZC/8qgRvPvlygiltPe3OvRuW4rSR3XeQyYOemNj
	IJqrN1ESa8SB3Vex+Cf1VrxrEn+i1VWDuHWkIFCyRqoPkmw4i9pP4n9rSWe91xadAXB71lhgrdO
	2K8LnydTaLEalvHyJf54K/gGVKfQNzAq8eSBnjuvRufLtigV1OyNGodDjcECqov5y
X-Gm-Gg: ATEYQzxgIwMy/7S+MYAa8ewuaY7wavzmtbcVAzVg1j1VnFMci4EMLAhP47XyMG6RIE9
	TgnB5cylUHGYJF1bBWYsJ2eNWSMOsUWsrRCtYZzoUa6//4fHAaFu4KnHgcE33/d9Y6EERs4Cu9Q
	mXE7DAJzsQ1BJ5yzKuR9e0tAMZa/P8fQ1Sb0tzCxpio4rx5UeYAtLAUGEOO6Lb3748RGWZjDJfb
	MLBbCVeqkZZk2T2j9frR2FcCT/Sr5yO9KCVa80bi9ZsnDsDSHjMaUYyzgKtn0OCOzQeRb0Zw76G
	8fCy4DXUR54S7qpctPtMrxhEpSr7mnBbZc7qDEZ1uCTXsESqElw5XSFuRIEAenVecqhgzzTjgpx
	3zjK/ia0e602BiG+3udBvCog6/yHdDf19f0gIVA4OJDC69P6Tv9rNb3o5Vw4/Q0Ld1hnbQhfKsI
	WV5BHPz8DByk8HZ5rCseWPqyE/XzQB1u5rcDU=
X-Received: by 2002:a05:622a:1a93:b0:50b:532c:2ab4 with SMTP id d75a77b69052e-50ba380a52cmr118052371cf.12.1774779127733;
        Sun, 29 Mar 2026 03:12:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1a93:b0:50b:532c:2ab4 with SMTP id d75a77b69052e-50ba380a52cmr118052051cf.12.1774779127248;
        Sun, 29 Mar 2026 03:12:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8389524esm8614521fa.21.2026.03.29.03.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:12:05 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:12:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
Message-ID: <o2sbqzcix74u46g74sil2c3b6mgd6zsrmafesoqltfbbrzqhjh@uochk3so46yx>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
 <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com>
 <us3ps4bgf5ekk2iudcgs2wa4b5qd4mzokec4q55pmhb6kvt6ht@qm4mmzdai2t2>
 <O7THc5h8ZhgzNpklYKTGOnEZKlN4BtHZHjKZt2KErekNb3E-hizt2dw7xuJ8G6giEyivmvC0f6-eIfCT6fJkUA7_CVQwhAktCXfBqAVV_Zo=@protonmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <O7THc5h8ZhgzNpklYKTGOnEZKlN4BtHZHjKZt2KErekNb3E-hizt2dw7xuJ8G6giEyivmvC0f6-eIfCT6fJkUA7_CVQwhAktCXfBqAVV_Zo=@protonmail.com>
X-Proofpoint-ORIG-GUID: rJvzK7nt0Uu7yLRVOseUGNxpVSfIsVak
X-Proofpoint-GUID: rJvzK7nt0Uu7yLRVOseUGNxpVSfIsVak
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69c8faf8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=sfOm8-O8AAAA:8 a=BrrjAlgp8CM1T73XSN8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA3NyBTYWx0ZWRfX2q/NtqJrO5k6
 JKc9TbdR79zExZnqtv7w91qzCvoHmg6Bea2jLQ7YV3otkP4bzqJ693RS5x/H3I18aZL6A3CBwCd
 99Je3ql9nloH+N3o0yH7Xibxv8V3rIBm2vcE/xOBnK131zWNHOsKoC4UKZwbnthxcNNMZ3A64AI
 MThhLDZCWgQC9urgnKjafQUWCeEASe27PSq4dFeugKw+poT4/t0bPbDAgJCIta+RI93yW0SCemS
 H5X37vynmYCGulY5GuiZyfH+tQQGYtMaTMq1QufE24/SJNZfi4+/WvN42YzSL3JMwEbka7n0eN8
 /CkbhQ0OsOKqm7U3a7A2jJoTVjXP24JXOKmYHQfOktEHB7PdjRpHsO9qzzEe2VGD90t5adTaT9V
 2fnNN+YK6TJUqp9YR+OzNnRRblSxLfZV8ZbGl1Y97HBNgemDC1xlexvduEaet1Z3JYqAF6+bmaQ
 W2k4E+yOEYngSlnXtoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290077

On Sat, Mar 28, 2026 at 05:30:53PM +0000, cristian_ci wrote:
> On Friday, March 27th, 2026 at 23:57, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > On Fri, Mar 27, 2026 at 03:30:49PM +0100, Cristian Cozzolino via B4 Relay wrote:
> > > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > >
> > > Add the description for the display panel found on this phone.
> > > And with this done we can also enable the GPU and set the zap shader
> > > firmware path.
> > >
> > > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > ---
> > >  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 73 ++++++++++++++++++++++
> > >  1 file changed, 73 insertions(+)
> > >
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> I wonder if I should, instead, edit the compatible property by adding a 
> second string (for the fallback), like this:
> 
> compatible = "flipkart,rimob-panel-nt35532-cs", "novatek,nt35532";
> 
> and, therefore, add "novatek,nt35532" string also to (patch 1/6)'s 
> bindings example. Let me know what you think.

What would it mean? I think we usually don't include the IC into the
compat list for the panel, but feel free to prove me wrong.


-- 
With best wishes
Dmitry
