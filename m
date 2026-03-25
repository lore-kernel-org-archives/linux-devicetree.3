Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D64CDDCD
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774469304; cv=none; b=WzW2c23ggZZUBDJFTFt8E7JDMsgLGbEXqzxBlSyRn8wVIxveS0VjMeH5Swg0LXol9pGLWBOZuWZqfN8oIAzM2/IQIAqFZlvmodRQ8Vurpf1u1XLMCo5lLYVrzWfDsi1wbXkox3UhXRNFWljp7fAAoE+IMVcOAkpW5q33FW0vYQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774469304; c=relaxed/simple;
	bh=lD2t1AMxlzRcnXK8iTU1zKwGBKi3PFz6qWPKGrIlIDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0LVqaol8XaF545eQ2WzYTFpqHfqHPtEFQ5FsyG+pS0Uc+IONXeR+BHsqnc1ZpnfMlBSqfkkd1Jdxsg0u/6BZqrY0SN8Dnn7SphY19/lRc93Y1V6LoE263t4eBZPkHYAoYKcdHROPQeHvCg+q+r3498XfYEZIFzajzWYyDFCZQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKSJO4vx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhjRPYSy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKSJO4vx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhjRPYSy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH4D8265517
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 20:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d/+7PKEkluk0xu811L4V4ceE
	Km1CSLIwU5nrjfkgJ4U=; b=QKSJO4vx7rXJhpV2pKIpBT8E1U1AfJ1BdUCegOnR
	kOkQbT4y9o2wrx4FQodSthzyrWATXm79MDb7loobcCIVGnsnTVQu96+8mSUX6C0Q
	iS2r0qMVyUMejqNqpDXpfpWKfgm1sHk90MCs/aUQDw76bsPkG/SIcYAkrHwgcVrO
	kmQcjyRD0rIpcHr59OVFqheVtyiA6PiG8giPbV2bIVGMvD8ebMcQFGXBieUAKJhj
	hnDTDBE+xUX6UOcgn3tVeVPYcfgoHMGtXfNER+RiSY7O6aYWbnr4RryqDGtxZRUZ
	Z6ozCgdxPQ5MD/edpSFOxt5yINstAXrTn34oRbBvntYEvA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40ravrud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 20:08:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090e08dcfcso6238811cf.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 13:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774469302; x=1775074102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d/+7PKEkluk0xu811L4V4ceEKm1CSLIwU5nrjfkgJ4U=;
        b=XhjRPYSynxRZYwbCWm77DykOxkbu/u2faJJM7VfyuswVI2m6zD6gsFxpxcbM0dkBsR
         u6HvMOgV+fm+0QnXom1VzZjrbSU8lF4DoncgMTenvPacpHZqAj+zsJKd9g61FPAgtCk3
         mvR8+6DhqhYI4DgVlvzz3dSi2gWgZamQ1h8m+shjWFfTWzAwuhi0DdDpZtd+4SHHdM7a
         bUVK5qVG4L9xqdKTQHdWW6mHBVGp/+IvOwdSbhkle7DAQqwF+zPUrCp5LBpEUxvq5Mfm
         6tM4Mk3g/L4Du9wMA7300NvzDsMVHHb0d2cF0dATXaf7EArNfVlqmF0wdQtcfq+Sma+A
         6Ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774469302; x=1775074102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/+7PKEkluk0xu811L4V4ceEKm1CSLIwU5nrjfkgJ4U=;
        b=QZeKQ0FMHFinEoxeLivadtUZvQrsGUsbKORB3CoWPGytTnjxf1zvcdUOiDGSJQxp+L
         Q8spjTJcHLZcoP5vYqhdwvPpgB4zsnWp+LAsh2pcsj/53JyR/MSYohBRXPl1Co33BVPf
         I9tlBVN8Df7ueW156g9HZR0RUTH0D1i29wiQsCC+mYwvoWfFuNTYZ3lES81pDEw6j0X1
         2sgOpCS4S2E4NeNf2cTfi2zoYV3IGHrJ2FzCF8+VlQ7+LEz7grx361hNrGHJX9uY4/Vw
         JXYasmy2cUNGuMRWd1phc1u820tPpY0svKVSZtjekK/ftIsALJyeEXsv0gzw3XmfMUOj
         fiMw==
X-Forwarded-Encrypted: i=1; AJvYcCXzjgIo4i7RdmqjveiaC0H0etp8IeUzxUpwdGOM26++zjRig1Z6E/iMRYrlAS5ScJ8Ao2JLf+CPZf39@vger.kernel.org
X-Gm-Message-State: AOJu0YzLUjwzCG9sB70Hc1cgKBAjG1SfqPjJ7YkTP6TlqSzdoEZ4i2UH
	uRA8InNjPMAaQ3k8qSd1xuPag+PibtfyGmxoG5LhPD6mrpOAFsaeRL/nDRkpcF770VFUUfrcec7
	gdQMBJrLpuMMF4GjP8thUfdz1NQDlFAWj3hznql8UMdPqhYfd2rPzYauk334apwA0
X-Gm-Gg: ATEYQzz+Ai4BuJj6JnqYiW/HyHj7AZrwqFKZXzgKeZ9C6WhKq78cMZ1xaofuJY8OqFQ
	KDXiYqsWAdxFvtSm1wvSM72eTPf6GJJ4apmVeWcyeeIbOzi0wb0EUOJPycAawK2y59oj/kvWylk
	x7ysB1QSG1GgZgfMZUX24ermF3TQJxV1JqFrYsDLfX9Cmh1UDHgcqAfEq1s2i3zhOCDOgssto3o
	MKiLODiFglMnm3xacf6uEvV8kR8jXZnjP1GZ140o730Iys2P39N1DVNCZp/PRj2mVLmRvptk174
	Up12ag8TfHtWynhiCX0THZzzEwn/py7vYqrX/fHdXNh0miEB/XMKrcmknJXMfLppcjc3MS/uaDJ
	ut8/bLbyfwW7v6FdWCGqxNhy1slQ9nC+HnB4j4Frvfk3xi37R57h1TETT37vKDntWYjXUqbsPLA
	plg5GfHKXW69NQLnWdgnq6JRIcDtJhxOod1uo=
X-Received: by 2002:ac8:5a8f:0:b0:508:faa5:451a with SMTP id d75a77b69052e-50b80cd3400mr69468741cf.13.1774469302051;
        Wed, 25 Mar 2026 13:08:22 -0700 (PDT)
X-Received: by 2002:ac8:5a8f:0:b0:508:faa5:451a with SMTP id d75a77b69052e-50b80cd3400mr69468391cf.13.1774469301627;
        Wed, 25 Mar 2026 13:08:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c5332d99dsm1145711fa.39.2026.03.25.13.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 13:08:19 -0700 (PDT)
Date: Wed, 25 Mar 2026 22:08:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
Message-ID: <kirmecnwddfikawqulzwgkdple3jq7euvl45meevjmak654mse@e4wiaodqodah>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c440b6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=H_3iQ2LuRKvP6GoHn7UA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Bv3FzOd-LmJQN_9ft1RrWipbWiQh1M-p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE0OCBTYWx0ZWRfX4PVTi/tHE5KJ
 yMwj92BHJG8exJsKK4f3OJeLnnbAIBVo3O3J83djq2giGWy/3qraEqjz/kvXgidxB66wH0HWPFA
 IwaQ4zdkfzGniU5aDvAnWu4NFehMXbl/1ACKY3N4cjwBlhvARuxpEhwSAJ0dXIV+00uwudpBBRf
 xrJtF2mNl9+Fwh2J+K1UTMMrmFfQ7R6ITbapQHpnYzjdFr9044RosbNqipwh41tmCYa1Un+jCnY
 BpvzKY2C8NwTKej6MOZ30NwsaALzA4g+O/mmDO7en9JuANjVBkffUsxpmQBG82S2+9tCz8neFCj
 In2cSQmAMhLznC/I7qwcE1Yx4TalgAF3+y6JGgu4RVaBPkduXzIoUkcpjIcjAYfjv8IYJG0IePn
 B3srGsmHruPgTg/bl6194f9x4NAwLe9Pe3xS3FdrExVXelzxixMep4riaKE7wJR3EWrNuTckdJ5
 luYqEA7Ykli1MFirWpg==
X-Proofpoint-GUID: Bv3FzOd-LmJQN_9ft1RrWipbWiQh1M-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250148

On Wed, Mar 25, 2026 at 06:07:25PM +0000, Biswapriyo Nath wrote:
> Plug in USB-C related bits and pieces to enable USB role switching.
> Also, remove dr_mode to enable OTG capability.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
