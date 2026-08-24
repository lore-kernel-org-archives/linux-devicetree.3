Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5190F3F4118
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787564771; cv=none; b=Wm0ufvo/Ui9eroGkz4EQbeYcAwwhDmyV9GTGz8Vd2b5O5JBLgg8KWhYaqO1WktkpeR2zMakZ8WXyU0E+vIAh1BgaEqAG4SKhn1xyPsgZhKIbBmo3LCayW/bPQZKRJ06Xzig2Cv/f6MNq4z09IeETt9lFog0+0SJXh8uOkH/HlQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787564771; c=relaxed/simple;
	bh=/RGfyliEUANaO658nqDO6+n5k5sqCSVWjr4Ade1cf7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BWUoX25g2sOUW7D3KTr4tp7/wR255Ji+2Yn+K0uxUQlh6jahgBOVIPmoNPrY5080ayRtIBjmx1y1arOd3VFLJK5fR4TdVtX+Nj7tyGKKFb6kj+iWr3vkJBatMv/GvYcTXyBv/rrLTjLAE4DfSpbXhLUX041cCYiVFN/Y3NsgXtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvR8/Ayg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=efub97+C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvR8/Ayg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="efub97+C"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99w731509291
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jPkYMwpH3T9LJMuYXSpWS/SaNpZEHk1LI9FfTb8V1Uk=; b=kvR8/AygV9gO21y2
	I2R8CqukLcGRVPn8I8EPKndDknVeGi+gtNr3GYKYzJrzj7AUHcBKrRxgiqewy7vK
	h9hnbSxjYrnXCrZwRw9YMf9/u2XSLkH5hzwhpEQhXjEnEp9Uffzx/YO3Da9ETGQ5
	Ht5Ce6EKFDjAgk9rMhs5ztNKwVHFa8zu/V6eGHOw9Dp0pQGwbMA54qbbBMoJ9+T7
	MH9kJZrGmV10HAMfenQCxOnVVchza1CN/j6juESLcGz/YTEF39rol8hSbNtBhDt0
	UkE5noOHlgeEe5pc/wfnXRxW25YF2xWxpMmluI4SWmCwBJfnrpRXFnnOJdv7dBxb
	m8/17Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74xhec0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:46:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9375d92d0caso2129685a.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787564766; x=1788169566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jPkYMwpH3T9LJMuYXSpWS/SaNpZEHk1LI9FfTb8V1Uk=;
        b=efub97+CpVsxwKMZy0dlyDtABIJod4YVEHM1TprbHjNIYsDyhx5P90iBHmk/AL54IK
         ewzSnu0TS0vhmIV0w3cx1tSTjOCkEw6EBGz/M4pHE7xBFtDY6GVdjJ5VNPxQrg1ZffOZ
         TVfG87SzJteRUQShiaL4NFfxDcnU70+WPJmsFQUIkqh3z6z2sqy95qlrligLalfozjRv
         EaKNJqzjKi61En8grCiniPvjw0amu5+72SPQIyP0q9Pttp4meWl1olEJSZfPocY62Eku
         E5gPP2ctcwJikUR9d/yrIZi3bfW7XyJDpNPejuk3Q1hykiZAHZAjW/+yqeC9ZJkt0xEI
         oLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787564766; x=1788169566;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPkYMwpH3T9LJMuYXSpWS/SaNpZEHk1LI9FfTb8V1Uk=;
        b=Ih1gTjmdf6CV+8U2lIve2eXtBqnvBdoiEr68whsO964DYSm1BKxDjHMDy8+SQyhG5J
         T2qUnULC6P1KMynzc2q2yQZ9B6uJu2oWHdlXTinEWUjDdyP+Zj2d0nOttg919upHrc4k
         sjb8pJaEYtEiH1E93x122C/6Z/D+n16Dw8Bu+ijByaisW6IAz7G02UBRFVXDM1gSXYgy
         LjDOFbhm65qpqLIBc53DtnjFiB33WTOji1HJsSmYBDwCnjhy0KxEDSinisAe1HB14qUm
         FnTeXuaOeAsf7tNdbsWtWAuwNKXcZmkgDME9Zxu4/v9LKjzCjyCzn3bv4ZFkxHTSGSVt
         sa4w==
X-Forwarded-Encrypted: i=1; AHgh+RprXxdLqxlvv6y8DwfzzKj2jCLXAmesSeE+ChFG9e5P6IptUlI4mg/OfofGFjH94BrRyxMl0hsJdf46@vger.kernel.org
X-Gm-Message-State: AFuF++l9w0aqyWBZvA6iiSIcFbjourdYZ3/D3WPgmxDQEmzGY9G1W/ah
	ORWkNGsjf4P+vkDsJI7iWpSN2vgBcjAxwpivH7DVOLsJDdQqe/BcwoghFZ5j92DDkYNninEd51C
	Kw5WRw98B1EHPfnQGmdzWocpEbN3g6jTeW3bsLN5E0ZNZR6/Ute8ddA70ABVHT8q/
X-Gm-Gg: AR+sD10cSreYfm1G8tyOk5Hhoin7pXLYhGZYbnHnzyCoZDsc23p0mh6WaUf85w/9opD
	6ssZZJ8lLNOLXjOE7KJ9NNbGfvKmSau1OMSqEX4MB7eczDQOeGisHAKe4sxjREexWp7X0s4krCP
	i6hi+DWq1x4hGSsJKGNf6sw3bKW8M2iGLXk4MIeHr6HfFNt1GTdxCyPeAFvIXl45+gfbfrLfl2b
	bsu3PO1VMs06RRBSuiWGniXo85n/5rBhQJsUV+03z/VT5TOhVRe6BF/yoHeUMSA+bUKDCEgUPea
	PEPxlSFPFo75cIMjIlW85lCfSxbeiuuU3K5TixidX9ktSPcYqgZZILQAh08GO6cB30gEFsoRFIL
	pnR3sK+TcaU9JlBxooebnOl8S
X-Received: by 2002:a05:620a:4728:b0:934:95d9:85fe with SMTP id af79cd13be357-9373957a356mr1703822185a.3.1787564765796;
        Mon, 24 Aug 2026 02:46:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4728:b0:934:95d9:85fe with SMTP id af79cd13be357-9373957a356mr1703820785a.3.1787564765402;
        Mon, 24 Aug 2026 02:46:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966fa8aasm1256229366b.34.2026.08.24.02.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:46:04 -0700 (PDT)
Message-ID: <2aa0e4b8-c22d-4dd9-bd05-00bcf9cbe736@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:46:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony
 IMX576 front camera support
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
        sakari.ailus@linux.intel.com
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Tarang Raval <tarang.raval@siliconsignals.io>,
        Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
        Kate Hsuan <hpa@redhat.com>, Xiaolei Wang <xiaolei.wang@windriver.com>,
        Walter Werner Schneider <contact@schnwalter.eu>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Mehdi Djait <mehdi.djait@linux.intel.com>,
        Miguel Vadillo <miguel.vadillo@intel.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260806120216.24145-1-himanshu.bhavani@siliconsignals.io>
 <20260806120216.24145-4-himanshu.bhavani@siliconsignals.io>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260806120216.24145-4-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sDEbSKd3Ap1e2Sy0GykSfmDyjxtHB8It
X-Authority-Analysis: v=2.4 cv=GdQnWwXL c=1 sm=1 tr=0 ts=6a8c12de cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_fYl8KkWePwGJAbRzmcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfX9DtyZtn2nnbC
 CUVkIletzohk3vOWHNWd0e14Bf8/tz9+w5KpWbJ3dw9YG3mlkTDKDMyExB/HOyC1r2EOvtTYKZU
 klLVqS3+z4M6YcJWiRE3YhcBuCfhkQk+w+rgr96ve5gNBmyRzDHkK6qxEW1NM9pqrOo3ujQxxpv
 KazXezP1pG2WhqWyHAc2NpiRgp5zHzK090Oa7fDCQi2EEpfWsj6zVc3JKWyqMaYn0Wv0SBC/ACU
 58PK0kIELVSv+Opem3ZMSt7dLBEKAP/bf2j+slVJpUB3GDMSuV2gNqF44yIKFq5Sv4om+aDciKy
 WtaroiVH3AzmIJRNwmPBtIOAFyMZ6PS94ZloboYhnPNeCAXrFNwCRoL2YuApuTRRgTy7MsY4Drs
 KFr1KEjQ4OtaJq8j/xMZAh07IAc5OuNyWr/WpyGYYap1ywLgKqkXasp7O0+lLa2JBZsjMOCKU56
 nWGBm0qkyWmYdZPmczQ==
X-Proofpoint-GUID: sDEbSKd3Ap1e2Sy0GykSfmDyjxtHB8It
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfXyo7PArXtMMhy
 Oz2zLhz/3yZWpdxOZTNt6CZGrzTAt9rGq+LRULZ1xWKqSgblW1SJDduSwqXkA4PSeZAFX3YSM6J
 F4qXU0q8DcB0ri6heVWFrJBng5O5tCo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240084

On 8/6/26 2:02 PM, Himanshu Bhavani wrote:
> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> 
> Add device tree support for the Sony IMX576 front camera
> sensor and connect it to CAMSS via CSIPHY3.
> 
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
