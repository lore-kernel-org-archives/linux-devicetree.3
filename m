Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C277545A29A
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 13:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849752; cv=none; b=DJx8XU8b7VeGSXYZHAbhQRN4Y1YGfz5EUqrhqDbbcTRaqKdQZvvV91rsd5IpA46mNMgiKinOLpKpCn9hFZxBiJGEQ8isLvdUBLVca+Cst7DvJD4p+WLL0a9RvWJBHJxKyb6vKoZLzk2PabLEn3zfZLMVJLJ3qICYgWCMIJt/KgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849752; c=relaxed/simple;
	bh=b8cAENdW5UBfeKXGM00Njn9NJat57NtDZ3mXZlH95q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNRHkBkR+krQ21aVnPDyJ8UbhVlit8aNPXz1vY1710UwXIqb3j1lQh5c/e/Br5rngA6ov+oP6sUKfyV8qYFOvzktviQneEAffydLg0Ou7t+qtTn7aHuVX3gaZmy0zMj3RNnEmWHSGlLm7g/eM0GVHdkgTWmawTtcQVNGd2L2mBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pB8dDdrl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGRPTpkz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pB8dDdrl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGRPTpkz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CXPD33617684
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 13:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6cKta+lz1loaE7DVGHn/1G5j
	fGz45qD/ucV6NNVBOng=; b=pB8dDdrlDMcXRAk6hesoh9rlsGWYY34gISGdrdbf
	XbdhVLwKRBzU88GCzfJBw0cD+Vn2rKAy3kIhIkb3FZMgYZHX105XXIhNETvL0SuZ
	E/NQchlt/I/itf/5IQU8igTQ/1fJxK+6h3Y4oE6NKUPXJ9GAQILYWbbUhYsXy89I
	8IS+Nr8qGROBQWenmemWjOZnahGHpCtzWg47vmjRoCH5THqPJv2siQQy6rwRp6Do
	yCAeirE9IYXQxX0kvbDOf2YTa0JiI4wWdpy7iJIcFkICRJvHHuyKdkUC8BXGEE/y
	dlWU7i2tGiRcDfBFwuO0WOc73t74PJVJewAapYnVVaPIVg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu7272hxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:22:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0199faafso47591231cf.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 06:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785849744; x=1786454544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6cKta+lz1loaE7DVGHn/1G5jfGz45qD/ucV6NNVBOng=;
        b=cGRPTpkzJskeybKCadKWCwt55YWtxe4tJKuCDBAL7StKWrB0VGGc2Axy8fy4gyeraJ
         euVd7ISKFANRdNICune3Br4jkLL02yFa9WUYQMpyvXqRSpg/mA5urFHQSxvkpguUiNfx
         YjU/gx2VRRYVO/jEtCfeILt4Fe45bhKaq1hf6C+71ENBsiaJPYY6k6Le3d2MBkq2M54T
         vGeAP/jiJYIAzZMi2YypzTOhI1Y9OWaYoKalR4teu9o5zWQ3Jh3X+pWJKU9bA1lJXZ1i
         xO7wVmwW5AME3hgGy9w6qO6Dkp5NJu9kqY0f96zakcDMNfoOEfcg0lOk3gfuSHgMp41h
         ppCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785849744; x=1786454544;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6cKta+lz1loaE7DVGHn/1G5jfGz45qD/ucV6NNVBOng=;
        b=Ru3KWg0kecAfE8eHjA/JB1G0NqlfUrewNE2n/8qJn3/MExX5HQCaRVeUesd/y2WlQ4
         bR9c7i6xywrIZE34Nvd0mcMfK+3NFgOpj2OkgZ7WICn2hvphRJN+DPQ7TGFDa3ZDht/M
         OWcozWARUJkCqd1KScoL2/Fhm2stxCuPSamlrNyTrK4B0EPh70tP+iLWl7CxGoBvZZwS
         hxYQxXrkXn2KVmNWLPIMP5+QXDJixyDibiyYOTyNk6ak+ki9lZhFW15ePSyY6osOm7dk
         KpEFnLDgvyCYwTmOg2aq3uDQuglJ3Y2RNAZJqIBu0oFsrozmvDAtQhtZeC71O9KmFKXG
         xX8g==
X-Forwarded-Encrypted: i=1; AHgh+RrPXjIjzo2EVIGqr33LRSiVvVDGw88d8rnROxMsf+6GLSDdEdKxU3Bwv7E1qp24flZRZWriCqpOc6nl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmjj9nN1OKpYGPwEdfSUoJ8RE3l9ftPSRiaA1cmAobIP0YLQS4
	AH/4E5BQvenrAi/2Xt93CHSHElg/GHrKS5weRKb+gbRuDawOPJDxEsQEfHconrJovE6qw8KXT/O
	SjEPgEppbt1Sk9J5WpI0QJQsWkX+GZSqlCmJGRKvxlklwif2APmnkERyJpltFmCE3
X-Gm-Gg: AR+sD100L65elHnDYNvSTAQcB1ujTB2KxBtNwcLzrKcibgsED1ZrgGOOWrzscwp3PXb
	szUNcLsK86O1ebzOOKWdR2aESZeh9SEgog6hhCxXXwLD9msUuakOJBl1irucNSNUPmO8vaWCZzx
	cwPnkiW7n+44bIXycVWMUD+JrgYyGL48icG24Ki332y4vmLQmyO/h1rlCQRABBbvbGn83CCA7o2
	y0Pc6TnDaLvgQgvIc406aqCV2pxnSa0hwwvfiZ+aUyH0yYgj9imz+Q2oYEU2i05USudtYiUobOr
	pMbb6Q2s13Z4NbsOUGEumFhUClGkXbPpVcejR3YMOX7K0UZhDjoqzxCxRmovLPFrS2PJw8tpgpi
	s7G3tyCUg0J+mqQ==
X-Received: by 2002:ac8:5d93:0:b0:528:15e:d1d4 with SMTP id d75a77b69052e-52b56671733mr224087691cf.4.1785849743972;
        Tue, 04 Aug 2026 06:22:23 -0700 (PDT)
X-Received: by 2002:ac8:5d93:0:b0:528:15e:d1d4 with SMTP id d75a77b69052e-52b56671733mr224086691cf.4.1785849743183;
        Tue, 04 Aug 2026 06:22:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fec7cdsm88266385e9.13.2026.08.04.06.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:22:22 -0700 (PDT)
Date: Tue, 4 Aug 2026 16:22:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: glymur-crd: Add FocalTech
 ft3d81 touchscreen support
Message-ID: <wj5vpe7lhcvvj42wndplekctfjegqpwzupwyqmaw6wf6rhgi6b@maii6v7rz6l3>
References: <20260717-add_focaltech_ft3d81_touchscreen_support-v4-0-5dd091e25801@oss.qualcomm.com>
 <20260717-add_focaltech_ft3d81_touchscreen_support-v4-2-5dd091e25801@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-add_focaltech_ft3d81_touchscreen_support-v4-2-5dd091e25801@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEwNyBTYWx0ZWRfXw/4aBcTbEonC
 k+RSZ6co8645FrcervTrR7xidtTcIniCu4SmKZzJVxUCVn7njoXYEixs10GRPZhuLFkCMXZ5wdz
 DMtvnp4FtWG9wpSGdC1k0kq+bJoNrWE=
X-Authority-Analysis: v=2.4 cv=Z6Lc2nRA c=1 sm=1 tr=0 ts=6a71e790 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CtdSQDPJOJc9UmKi9akA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: LNlKmrOuu-FmUqVCk0q5Pm3L0o1gR76Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEwNyBTYWx0ZWRfX0qEFKOArQ35s
 I1JK+s4frRlRJgBiDx6VPwLMwGxTPgO67XB6zBUJjPHLUhsBKATlHybJ0+n9wEyifu2k/N2LOXj
 dZT/yusx4nZdIYTQOdCm28oU/EgfSVktlfQ8LGbL8d55ORt34z7DQAyo6LUxqOsJUYBQve4Imhg
 u8PK1mH/lzJNHi+QIgEOE5txdemR93SoV/faBfRWWZUqnSiaOKEW6IDxCLtOMNxQ0UjEL+I2VQY
 5Pnv4RzdYJZE7kELjDjh5IZu0l501NzQwdfC1vau+hX42byHYbLqAadJqKcGKZ2mww1h91HiUTc
 K5T//nbQpmlVPeY7O8qw/tFNbT7mDSCgOuDemJxMUt4L+NkOc1KzGrVYEprExQhg9nemM0fWErr
 QJdDYFyqvDzirkRmQKnp1I1hUysTS+/sUTKot+aNvMkQm5vi1pQtjmcY5hubasqnsLLyxGynIsO
 jv/fB440vkDdpqroL6w==
X-Proofpoint-ORIG-GUID: LNlKmrOuu-FmUqVCk0q5Pm3L0o1gR76Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040107

On 26-07-17 17:28:35, Pradyot Kumar Nayak wrote:
> The touchscreen module on Glymur/Mahua CRDs is different from
> the one used on Hamoa CRDs and requires the reset-gpios to be wired to
> the device. Without this in place the reset line will remain
> permanently asserted during resume leaving the device offline and causing
> all I2C transactions to fail with -ENXIO.
> 
> i2c_hid_of 3-0038: failed to change power setting.
> i2c_hid_of 3-0038: PM: dpm_run_callback():
> i2c_hid_core_pm_resume [i2c_hid] returns -6
> i2c_hid_of 3-0038: PM: failed to resume async: error -6
> 
> The touchscreen on Glymur/Mahua-CRD is a focaltech ft3d81,
> which is hardware-compatible with the ft8112.
> we have added the required change in DT.
> 
> Fixes: e6bf559f7eb9 ("arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen")
> Fixes: f64ef325f1d9 ("arm64: dts: glymur-crd: Add reset GPIO to touchscreen node")
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
