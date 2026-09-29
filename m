Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA74A526A80
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687686; cv=none; b=ddeXDbU4yePYZO7bwsJmyaP/O24Ho7R0+YJOEafn3KxgBMUTks+sdKrUI5rbA03/RXayv1sEijzCvd8X2QVYdRgnR58hZS8fXnErXvZFWpc9Ttj09OnArtbYWuB1cLF4dWZCnsbUsm+YsUzgeBq+ujDTHWca074Mg1TVprZHlxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687686; c=relaxed/simple;
	bh=xdrO1myBWGBIv/hH1TwXt6OF+1tzWzncPVVGp8qnV40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pci2yh3neJ8MxSQbLyl83kxCwDcPz6oaxtxdm6q61BVEwwYe9uQU0TyrWQq8iSXeqcKQp770UDaC2i0SyIKpTA1QQL+JgpmHIIbmJ2o1DJVyKizqnNM8j3AiahnVrNqgoJyaIZxaopRCyhZtDDXAyIdHUBdl12DrcL2IUMNPa90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHsXHbbv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGrJ+eaM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHsXHbbv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGrJ+eaM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqiPL3842810
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DRukBmST2VE0a/WBfTxx/trw
	PBrGDRklQ7X6L/zHtb0=; b=BHsXHbbvuAATzaS9L3KTerfR4xvWNig9hCnKemHR
	AP7OKjXHDxRL/ZmrAiK8/fYg89/fY68wNZP7vISfSPu2kZwW8RVfYfoP/zKyOfXN
	jFJMVs5vDgG5BL9V9PQmLbnqYercKeXptBhc8csaamFP2I3m8K0QVz/kMPXeVJCp
	v0pqeK3DjPioKtV/HwmRalGC/TVnxm0UKj2RhLY4iTPkpFZ2GSA/g/sc33+sUGL8
	unZ+wVMk63r0jstzkUR+RmiAWXDOaTfQTJl8FlsYRfp9vsONH7qxXyV6vkPTFOGi
	m709ffz0x/6oNBWh/anWlX2xuWQewl6VxwpGdsJGlu90zQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0v8udk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:14:42 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7930cb5cd3aso3176692137.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687682; x=1791292482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DRukBmST2VE0a/WBfTxx/trwPBrGDRklQ7X6L/zHtb0=;
        b=XGrJ+eaMFmPnMZ/z/ibkTpvUl6lD0KkYFPobECxyNb5FwowACH5zLZkPume8c/qAtl
         FcFvFpvh2k3t23jTN26goS2KQUMbI1rCobKBVQCKhCcXnmexEYflYuuVMRplFroOzP52
         fwPmckc3xWaLFeOTMr705t1AJKsisu8V53yxEH+FbMAMCvvgQoXuyNkcHLQ9OorTaqwj
         8f3tppCu1Lz5glHVwHidmJkQoL3t68KIpfOUgUlmo0VpaN0VdQfVARGZ0QbqQTkfHSHb
         GA4rOhmaz2sIBc5eA+OhxY6I+r+rw9UvQTRbDvr874nbwoUDxjdlAncxnV2MKBH9NbEo
         dQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687682; x=1791292482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRukBmST2VE0a/WBfTxx/trwPBrGDRklQ7X6L/zHtb0=;
        b=Lux5rs2xBRlyRfbCJXS7PgdxosbYmluZbll8IiNkiEzCLSp54e74IHPkruJ3GcN9MI
         xSQ/0UlmRdPBpP3zjHDUQZNoFBU2Dtv38QYtHTP2VzL7g/UVDe9B2+e3FnLyppGgHpnv
         ukvJcjGGhlNgx28CZGojKPXTKemFx1/Ya4nHyXD21jbtZF33j2ie8CBF4d0TUfVG/7Ra
         OK10qB7ZkxtKb9vardJ8SDVv94koBle4M7c7De2p7zKppgB4kGSPT/UXIiZvqjJPOi3M
         6dNmHKmWIx7bKpusMJHYbz3lAa2ua94V5FZvQ4MaiYQjuX4gUCxcRM0MPJbpnixTOb17
         1suA==
X-Forwarded-Encrypted: i=1; AKwUvBx9/97cC/MPbsB0gsMfZcudRmZ8NZwh2WQqbCDrnJCvLrPhltN7hgN7BLm+nKLruhi9phlHsfOX1QnJ@vger.kernel.org
X-Gm-Message-State: AFq9FYKZNzNISrzMn1GtILWPUS0SsnD1QY9wMppBwi/jSjYWN9pdYRR8
	surWeIgF5ksw/HHFAKfvJDJqSZc71Cqmdt6FOvYDbWBQbE+A3QpFAlpEXBzfjtfQ3Y2nCy2BJ4a
	ezDwp7aJcMYrlBW1EBTKEqg2yRH34COgqlzwN/XVHrTjGXkm9y7EoHRfQAhuwZYg3
X-Gm-Gg: AYBFou3Td7SO6ccMJ7hs/rnt/3Ztymx7zNiJ8AdNJMbdPR7zDbwX9yQ0jQxdgafso+c
	o4IXlnZgH25Pj0HE6TfvLi+A4ojunMr6AxlT0gNHS21sm2gzDb8GWvV8iYveFT3kygvDnAbsydj
	2HrbKMfGvYS/SY1ak4aXX0kH0ha67LYtafGz3zbnjkjOuNOmQKqEkFdL28cChNSMEbMl2KYhRiR
	eNQD5JoCzqWjE+J6zd7rYBjEnh1mHLehvxqmfSrpWRmsm0wCcrEfYuuyq/0tYeNgfHIuONL6aRB
	3p1auZSDVsduRAGE71QxjuNCTtrI6CrXfgpzJt6oTKMAfqJt9qDKFhINQj2FY6zDKh1AocGVp9/
	lxLpumqg2sTFdJLI=
X-Received: by 2002:a05:6102:2d04:b0:7a1:f7d2:e824 with SMTP id ada2fe7eead31-7af1edec5famr7288803137.29.1790687682003;
        Tue, 29 Sep 2026 06:14:42 -0700 (PDT)
X-Received: by 2002:a05:6102:2d04:b0:7a1:f7d2:e824 with SMTP id ada2fe7eead31-7af1edec5famr7288788137.29.1790687681384;
        Tue, 29 Sep 2026 06:14:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5056b1bsm3956094f8f.17.2026.09.29.06.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:14:40 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:14:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Liviu Nicoara <lnicoara@thinkoid.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100-dell-xps13-9345: add the
 front camera
Message-ID: <eo4lrod2xvxx45afrw6fawdgrd5rr6rdebcgx73rl7vr4etzy4@2sdtr2ehdecs>
References: <20260926122533.8200-1-lnicoara@thinkoid.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926122533.8200-1-lnicoara@thinkoid.org>
X-Proofpoint-ORIG-GUID: ofti1JXxCGV89c1JIdrIPWZ7B3jM3ilC
X-Proofpoint-GUID: ofti1JXxCGV89c1JIdrIPWZ7B3jM3ilC
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abbb9c2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KOsBq0R2AAAA:8 a=EUspDBNiAAAA:8 a=iu6A6uHwReXJ_BGCYJYA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=p7IlednmDx7li90OXeev:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX9A9dBxenbSwz
 S1UcidTIpoAfqUWxWox+IVbrxFsL5AX2HI3yGHFDXnr1vl3hKDzMLlLkFZ/1R0YSpdtL0I7b+yy
 23rYH2mOZQWR6xaozej+VdJRAaiMTmq6z1HbigW3ia7UfzNvSo9a8njsLo41N4C9S39svdv9CtX
 JqKWq7UglkSdM+lPonTbU+X9ASU9sg2MqGyriIDNwtYdVMyeIr6+a4Bfg0DN7h/edlh3pOJ1pgj
 3Ux2IjPZFu6Pvvqlh2BdqfHzgrRHraXKE6/vIAGn6B4PmjnwM7H5S7qCdhu2dK8eE39vlQSd93w
 J2Iy75ByzBEeYVdgYGs5iusUwcw5sLs4Hycl9VBK7dSAbjymIjiyUDISRpv+a0QNJHRE4FwZ/VX
 ER7a+GIz8QMi8zeDDcwsatjvb3yNRPcAK9L4li8JCJpG6YUd1pQFaa4nJSP+4BJ8LgIdaAdNU6X
 +uyTZGPh2OUqSRsCI6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX/SrbeDXbuh/4
 cDqy2LDWGzzoBUi7UMbMmFJMsjDJG0KySzPnAmyVXBPYB5Meu3LKttW8uFRyuibOc9hDrLhao0A
 6xAsrEkaMJXykAOqxfMpQvNuIBePlvk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

On 26-09-26 08:25:33, Liviu Nicoara wrote:
> Describe the OV02C10 front camera on CCI1 bus 1 at 0x36, fed by MCLK4
> at 19.2 MHz into CSIPHY4 over two D-PHY lanes at 400 MHz, the only
> link frequency the ov02c10 driver offers.
> 
> The wiring comes from the Windows driver store. CAMF_RES_QRD.bin
> switches a single rail, GPIO 91, before releasing reset on GPIO 237;
> GPIOs 235 and 236 are muxed to aon_cci there, the CCI1 bus 1 pins, not
> rail enables. No camera resource file votes a PMIC rail for the
> sensor, so avdd and dvdd are left out and fall to dummy regulators.
> The CSI PHY file votes LDO1_C at 1.2 V and LDO2_C at 0.88 V for the
> PHYs, which is vdda-1p2 and vdda-0p9 here, as on the Inspiron 14 Plus.
> MCLK drive strength is 2 mA, as CAMP_RES_QRD.bin programs GPIO 100,
> and tested streaming.
> 
> The module sits upside down in the lid: with both sensor flips on, the
> picture is upright and unmirrored, so rotation is 180.
> 
> The white camera indicator on GPIO 110 becomes the sensor's privacy LED,
> so the V4L2 core lights it while the sensor streams and takes it away
> from sysfs; the comment waiting for a "camera on" trigger goes, and
> panic-indicator stays, as on the X13s.
> 
> Assisted-by: LLM
> Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>

Tested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

