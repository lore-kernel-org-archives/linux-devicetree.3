Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3D247798A
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252512; cv=none; b=iKoxME+Q0yHqLZT08ZMjRAVFwK7S3a5omErg1Pqj4mbaQjoLwiIm9oeaarNwTopnsIb9YSRnbasAnyzyZ/5VMKkXaSKVwT12SaekLwhWZNClmdAuYKhYQdjVcFubqZv7IC6UhS/IkthVECQ9H7Q1v7/ICA3Osy9JyTeZ10DHCxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252512; c=relaxed/simple;
	bh=W539Vt8Z6SG2mVSL5MO66oLYOnLooDYITh5MIwCmO2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeXJGAJnyqQmyWrktBRzZYRaK4yBMiG2eIFz50+XWe+jd9r3Qsc/qyyIWQWeRsEfo/cFq1lHZegPQEoWK6dklZWRpVDYlqZ70n3Bq58JAOFWxAZUolk7fttBGTcvpC4MqDanI+b6H8eSd55IKSxE8FprLtW7xxeBTlYBxAUITYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtjemWms; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GtO2VCBr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtjemWms";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GtO2VCBr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4lxP1437264
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uvknsm0QJ7SYg0XlXl2+u3TT
	lUve2gsckv66eEvFF/o=; b=XtjemWmsEJWlJ+BBthkyXBKppucex9FwGrYroIgv
	uZ8YiipvdjuL2W7hF9MM0lA7pQ9FXZDmfEULx5bapR3L07AJ0GVRyxAfz3dGt69n
	9irJysdGphuIOsmJvcUBJdYoQgMA7XA19uo3Prm1bh+iUqguMOlZbz8q6YeDLT04
	3mVEVi+vW58Kvcteq4aErABG/r953eOnGwgof2qxTtzehc5M/hx9AAZshGcQKJVw
	6nKEMb2nzbXVMR9ameZ/VpbWF1YTo3+kRgWUSMW8wHu6ynSR7nLqSB9vqmSCjhd/
	Gp1WBWswWIL7iPfKIGX2DEWVsIbAAp1V3J9IRLxJbMP/cQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7rgm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:21:49 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-980b637ed69so296528241.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 05:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790252509; x=1790857309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uvknsm0QJ7SYg0XlXl2+u3TTlUve2gsckv66eEvFF/o=;
        b=GtO2VCBrUzslAelGNEQmMFlLY/bmrZbXGXPbz/dkjTo7UJy+0caEv4uCq3EpML0HQA
         kCDaOqAwNW5m5tQHALQ+uEjUkl7dbfYV96w8ludmmjBppFuTe0WC0gSsPVunGL9k5KP0
         B2zbGvzM5yYXg8Hp4Kntg59BKJD6pksCdIfjaMEC+ZWwiTpuqRB6+6V2vDL+Exj4df8W
         4dWLx3CJueKxeoyzI6rXHAvg+EFB0WipQ+YLEGwwfkYyJr+i0Px8c6NA9GpfuWbim6Bs
         Z98Tk1FUVAsQTDCqP5lOra5wmG6TB+Xyf3CxvCrruQteEdmd0UjE5cgI4Lfqj+2g5uOD
         S/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252509; x=1790857309;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uvknsm0QJ7SYg0XlXl2+u3TTlUve2gsckv66eEvFF/o=;
        b=H86ZpyztdiyoqSI8wh2USxTfbKeVXpjNLEISWU1OKx7l+zuRdAsHUDzyDWZ1OOsm89
         yMh4E2iAA68KiNtjfHAfEsxF4q55hmC8mp8CRZqFG9MrJbv+IfbdNwlvVl9z+SIZ8zFa
         LM0A8jAeXDS4fesk9ifIkTMnic55F6CYlJ90ZW5UgebaHwO4/AT4Nfz5e/34Q3sWMumb
         56zg4RXN+NkfWriTKQFiQIuWO+Kw3vv6lrStCMGltRInZGihfQjkGieJXybg2TI5hj2l
         yVasFI0f3s4/S13YU/M9iIL7hBdTVfehJZ/h1YPmZYntb0VXR44IhBM/pC/BYXFiUGzL
         Fa4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwYRjJjyhJ/fF/+lKI6hAGWXk3PeOuE5tbZfRwBOg2Yb7KFz8Dytm29lctniQr9RQGlquElWpWbXrI4@vger.kernel.org
X-Gm-Message-State: AFuF++nEIyWQ//SynRCmmztrmbYHwLPxztnHwdv2xKX6J7B3rL5fG2+L
	uKWMMkNYpPXyHQcVKSAcqaPgfunxaeoAMkfi/gVYF5a4bJ5qPJ/cPmSXpk3+WOPLpqiz7QOVQkc
	opzFIP/yGvbq1nBvoUrNDx/3WtgpwUHKQ7fw+6VEStdvudfBO0rc3tC249IV4STnI
X-Gm-Gg: AYBFou1W/LScmRywFgz/ZLbz5qbnNZmv5RhSwqU6K80fTdaDrfxJ3PyacQ8LGHAKSKe
	TZhh8wMUsKEfsSq7qLVHUPP+4Egpe+FnUg5xHEuHHYAlvmyJ7fWcxaLpaNt8myfyiDWj1C9ZpSf
	gbhpnaP6JaPzmGY1AQykMixSZ8/aQxxn6TOwKg59EU687AyvRerghH4PixZgL07tlS8ZBuyVPXz
	nKkIihcA0RI5VCbKFJzT001xyU6zLz/pursKhEXRhpQFsxZOzOsdzWlDIFEqFMqr0SG9pmmFVRT
	7TX5bHZuVeO3gz1laMonr8B4fXuzBxW6Tqz5IJksS4QXOFbSfvnbaNeHSE409JeAQoyzd+O+14h
	ZloFB3UWO74zHFSM=
X-Received: by 2002:a05:6102:548b:b0:7a7:1db6:c613 with SMTP id ada2fe7eead31-7af1d0b5b98mr1049095137.14.1790252508946;
        Thu, 24 Sep 2026 05:21:48 -0700 (PDT)
X-Received: by 2002:a05:6102:548b:b0:7a7:1db6:c613 with SMTP id ada2fe7eead31-7af1d0b5b98mr1049085137.14.1790252508382;
        Thu, 24 Sep 2026 05:21:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm62285775e9.13.2026.09.24.05.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:21:47 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:21:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: nord: wire up GPI DMA for QUP
 I2C/SPI engines
Message-ID: <liusvxsimvsqrzor5jy2bflngcweotwvrnnczobtb7vqqj6cja@kugz7ucxyxm6>
References: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
 <20260924-nord-gpi-dts-v3-2-74a85134699f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nord-gpi-dts-v3-2-74a85134699f@oss.qualcomm.com>
X-Proofpoint-GUID: S_HyvPu2IBisc8yeeqiUb5r-wqt-veHe
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab515dd cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IF4djqKm59Tmvoe2PpgA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfX7UPb7My98pJW
 VLrR5VfEW6QlNajo5T4FKWRSNJy8sYodqi6/qsC7Mu1gQmkU0pnEjWLo3um4HeJTTlOeA2sG9d6
 t22oGFpe8MySmISOcMhluPWKKBRqgBi033pY5sipHid14a2ZZFjlo2624vQ1QEzxyWvCrgJI3MS
 mjz4RXqzd+nx9UIPSchdU47jgHaV6vT1Ty+n3yT77zePdBp513Q7cew8ybNjtVK68e0La3H9e2S
 G0nGBG4xNIANSKfCJhJHr/aGmmVoXEcPzzan1Bc3hLVeWYPCfoO5VCFzPhOAdMGYdgUVcJlIzEe
 Gl1jP67E/qoviT67aflXwS/yNvWOpNM6zvABx5fYFk9tf4ho2Z7116Oceb/aYi8mYqjoaT/oBPN
 VGAFhrj5UbIKyZuLUij8D+AAJ/kEO8GpDyqb2rL7yjlDepMeuXAPt42TBp7Ich8qRvcU/3J3A1B
 IPrdX4qmoD/t02XOtnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfX0bBNY07nbJ8q
 7JHSS6zn7nKbUIZi8QnCkmVpIwWkQ0hHrkgMCyHCsJW44DQeLKSuP6NmSPURnMAFkSj6cs15toE
 KpWmTIPElSXiuFLVmelUh9y5iZZGOQ4=
X-Proofpoint-ORIG-GUID: S_HyvPu2IBisc8yeeqiUb5r-wqt-veHe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240051

On 26-09-24 14:10:04, Bartosz Golaszewski wrote:
> Add DMA phandles to I2C and SPI QUPv3 serial engine nodes.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
