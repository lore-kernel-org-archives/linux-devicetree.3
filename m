Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676483B6364
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777287572; cv=none; b=t7w2bStnupqzprfwe8M6DljsqSVVrSdOblSnY6MKakMd5SdY8/kyI22nJ3+0sXW6bIx+yvAnMZRieSaOVSmVP+kAv/6Awpv5sgtp86MB5DKQ9S3+i9XFVIb55Vb9PCyjv8ymxCVuKCak7vc2pZ7zaVBgivvlA6Blg1G/ZJeYv6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777287572; c=relaxed/simple;
	bh=gksHzhz6jM2JMwAGb5E1ibHl4HAsMdO3XrDOeDM6+Ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUfatsvMB4aadQdIPUD36eEXGzWRFRsfo+/4hqpenJJR6QMkXjmNku82uZRsr5Flhr3flVPSoerTInkZUJcibIpDD+RmUO6fwwI2LPkuhd7BK8uaJWJlmyQUxXeSQ4r/l4IwiICJg8PY5JlDcBHWlNqcN49pm6uGm4i1hGc2IYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6WcaYDw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCt98REn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6WcaYDw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCt98REn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TC4M4054507
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VkU+JJl/K8cKkgwkX7d5IDmAB4GLCezaNEtXZjr23fQ=; b=n6WcaYDwHAdycMlj
	sROINfH6SEgOcy1eR4owin/qzupXJxsjr2Le+YObTLfIvlflBSMn9nv+LSlM6Vq8
	8zaeEks3hMvrWqbf79nUAuqNb8BYJtcNqrZ5EvxM5ZNDX3JLZFvX4TQZkmL5klpr
	5ZL7bCWtMj8tpZS19VCaPUTqS1bMXU9gKzpogAVPlRT9sxmePd36abpWFDe2p1ws
	HHnDPq+reu2EPATvvgmJtPyxASDiiYPanBjGQVNLpPoTmewyHZVkma5M7mq7+X7e
	EXgnZUxpkUYnkC3PaId3HgT6wr4hMSEG7pVB+vQc0N0ZcXa0k98NrLRkO1Z1WkIB
	cjCjXA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkxds7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:59:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-895375da74bso19554606d6.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777287570; x=1777892370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VkU+JJl/K8cKkgwkX7d5IDmAB4GLCezaNEtXZjr23fQ=;
        b=eCt98REn9uB+lCzds0/vI02+4c8dFUL7/H6/cprc2H1JNkSJ5EQscNabONy+34o4qb
         Ug8k7XOzF87NdR8L6I3mDY6GcVRmRayHliGy2ob7hEWLQ1NtEtJGRxAniyvG0YNP7/cY
         trC9z5hIn4jokcpCHnOrsw45iR+CXR/RJVKZQa1uMGnCj9GMuukqalJp3zyBiYE7sY4Q
         MpJpqZo41SWE20xsPFmLAJj9n1wJ18xT64XF4WEwhsGp1IOzQ+M5BLrTkxD3kXq/19cJ
         aTGRPNjsthe4i3D4rcutnprb1qOnvJspVF119L1934g80ZlTdFm7FL14mqem/V6vD7we
         yZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777287570; x=1777892370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkU+JJl/K8cKkgwkX7d5IDmAB4GLCezaNEtXZjr23fQ=;
        b=ZSPUhjlCHiZuc6mrMpyBFI/jiAW+0JHFz7Y6MU5gsue4bZipl4Bp0j+f6AFOGyjLlF
         08CbeM1hYNOI+UHIGDBfXGc4VHeugYXxuX0FZ3BQb9wlwzfFI5NLiV7k6fsNqcuNQJyb
         IqgYNZv4iqS8IrpN6Uqeq1ZPUM0wgBOLmtzxsPw3zzfZc30NlEz8bfUxyFARK9HafbKO
         hdx/eYJEpgeRLkiqSbeoAJdE/epTzPmQDFCfLYaz+9vxbA8CO88JmWI9+WvpJ9c/TyQX
         KZy4nCJToNTh3aoHJQ4/Lo8F8lJW6LxQ41U1ak6U9Ovee9nZaMikFVMaN/HPBzkCkYA6
         kEYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fGZ1IxGIT+0gsKtyX7Igee8Hcp3NLFaNQG3hN/e/+AE7Fe0BxEdVYNhNr9qwvutSi/+AWhzQfeBlG@vger.kernel.org
X-Gm-Message-State: AOJu0YyepvAzIJbAr3X9en2GE6243HB0QeLViYbRSclVoX8DohSaH96y
	pv0Yw94fWyvx8jbt8NG+Kc6Jf2H5gGM1r/Y15OYQOTZ8547LBrwo+cpsyiP5/COQVx/0sWn6ksg
	wTu7VKd6eIN0fCNhyhUsghf7SN6yDk0RxGLh6aeGraekkqrgnwOSlmN60ArNdhtr/
X-Gm-Gg: AeBDievomU8JD5BJXRFU/rJb9t86lpueIq3sOorN9pPhyCaPJNtQtTn2yzoqPJLVqjR
	u5g8QQ1/Rc3GS8MgUq94/NWI5pnG1e4HRwJqO0N/i54n6B+tJfDUmrXwltOcMZgMiU/53OBIl5b
	jhcNykr9N1tT16hl598Wj8P9Kjua+xbiymo6l2ButKYlakmgnS95oQM378iRfQUVbcD+zk7grah
	xyG0lrw7jpBpWKU06ukL2clh4kd4DJTzdC2sOxHLG1daaQThbl55YGW9CjD/7l3j6GQywTXne+7
	ZJ6lYwtKZtuCIFtVDljs3SOfv8Mb38m9tujA8cvUHjSgqN0p01biBglFe0NeD7YOVjQiJ03qAqw
	AYfm0zLFCPKIfDevaicLRO16VP8ohJWFp7fjGpP0Kmj4eqmEJU/BShSrQ7QzUJVWLioT1VTYsl8
	0FxIMIEC6LgSamGQ==
X-Received: by 2002:ad4:5b85:0:b0:8ac:b9e7:a95d with SMTP id 6a1803df08f44-8b0281482dcmr450411586d6.6.1777287569773;
        Mon, 27 Apr 2026 03:59:29 -0700 (PDT)
X-Received: by 2002:ad4:5b85:0:b0:8ac:b9e7:a95d with SMTP id 6a1803df08f44-8b0281482dcmr450411246d6.6.1777287569240;
        Mon, 27 Apr 2026 03:59:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bf00sm1082130366b.33.2026.04.27.03.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:59:28 -0700 (PDT)
Message-ID: <ba3674ab-fdba-4211-9634-610e10802270@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:59:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] phy: qualcomm: qmp-combo: Add support for Hawi SoC
To: Ronak Raheja <ronak.raheja@oss.qualcomm.com>, vkoul@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        wesley.cheng@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
 <20260425070002.348733-5-ronak.raheja@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260425070002.348733-5-ronak.raheja@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VB_azDGqR1LlgrIHuVx59x6Kxf_Bs9Mr
X-Proofpoint-ORIG-GUID: VB_azDGqR1LlgrIHuVx59x6Kxf_Bs9Mr
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69ef4192 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1tJ3z92Lny5kRZNiqYQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExNiBTYWx0ZWRfX8mE0/T5Ak5M/
 3gZK7zyZzHpPH4THh5tzH0Avy3Kpnwr/UbwaCUJkD/S/GbVzbZnCth5CcPP0RuOg5QVitsjcxHa
 y0Uu0Fw3Dc10cPN5wwDyBTy/MhymDI22Nlhjgj6L0cot5fwipw9hsT30Hwm00CgfWyndGpj3G7v
 CjQJXYyeNQTE4ZwTNIMF9W+Ae4hYJL1UDoKvJ3YyW8lacqG6IiRlfZgjN5hqrkwpX8LCtbpdbeZ
 wEEkE3N/wxRuTfOwIPHm9OhHwG0csEikU8wCD+v/rVrt7o071gdL9nm852VXfhCtAXoaXdN11eI
 GYgCtGJCr/WUY5fIcbrfxgsdWrCWLbGsDnOsnWYzvA+VJA7ZPRAnL5y0kaO9YFDLWz2eXTUzOVg
 O0PvxhpBzsPZXFRaMv3F8hS4neffQa/uiG4dIE3tUPN8pr8DQJOQKzDnuG0bB7yAtJQXuFg9M7T
 1yQdQvG/0ZTi8mKdXYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270116

On 4/25/26 9:00 AM, Ronak Raheja wrote:
> Add support for the USB3-DP combo PHY found on Hawi platform.
> 
> The QMP PHY for Hawi uses QSERDES V10 register layouts. Add the required
> PHY sequences from the hardware programming guide and new V10 register
> header files. Also add a new v10 offset structure to incorporate the new
> COM AON register module.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> ---

[...]

> +	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x27),
> +
> +	QMP_PHY_INIT_CFG(QSERDES_V10_RX_SIGDET_ENABLES, 0x0c),

nit: stray \n above

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
