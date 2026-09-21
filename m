Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACBB44A3E0
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991192; cv=none; b=Qp5AjtiHN900gJOnMbqBSWzLgTLR5SkL3ZpekGaAwWmsg1fejgrUj+jc58srYd66wM9rWx+PO7PcuG4lSzo22Vqyk82IxAlVMBgzHQB9I+l20ylG27nxJJjnLUsRABKIAJ87Er/aSA2rvlPInBNDB2I/wCwqzYFKj+wxRV0BDOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991192; c=relaxed/simple;
	bh=b4wQJ2VD3XKr0VatPTGksgV+sUzbD7Mn9xfsUOwE2pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cry016vinO0I5Ie+cf1WWw3UjMhujCNe6UbZvbk13FJIxuKHJZhoeE0rPnxk68jnmtxisvJjYdaimkyRqrFash7Xwjv7c70SGf33G/VeQcJ8W3b71vAq+rRDObIEIBSK7FAL/T8rRqz6N/xuwkeTzVxzmFXrjNzjinK36fb+FQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B9Ytn4Vo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H5+coWGt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B9Ytn4Vo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H5+coWGt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAduqX287308
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nyH3aN/JsW/ONYaDE57+9lAD
	VN4lin3yudBnNOcvlfM=; b=B9Ytn4VoaDfbxxPTOm7SQBNAmz84WpqIcexHRvt1
	UE0NfU1VSBAIEk5c+c2iHEOIUfSygU/ECvWMfW9IGDIhdwJPzUcIU8L4HzANDqAb
	w9+SI4RCFqCdEAqSxmQijq0JWmdxYUBCbiFRH3BioW94wb4i1JfCWpQKxCW6Cvsg
	rHqGjVrEO3ZMCx01ULzQtQzm9Pj/5LUsxR5Hxr3FUTibv9wKoUXrN9eldp0OjQYv
	VBW1jBTU9uZTn7ECBo61jT/dy91JcqQg93Y37nA5J4Zihvo5ECE6g5+qe2uFrHM5
	dSLyF8PQsXcfGWNVYpG2Rfjb/hK0vpE7BawzWnah/gg0tA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj0vs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:46:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78830f4bebaso765299137.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 04:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789991189; x=1790595989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nyH3aN/JsW/ONYaDE57+9lADVN4lin3yudBnNOcvlfM=;
        b=H5+coWGtPWF2Mh9HtAP4dKKCO/cg/RGc5vTud8ER0TPp/+Givz4tkylqria5S/mGot
         NMfhwdLuhEES0537j8uvSzYmc3jIY+rA00ZxK9wll8go5KdhFqNRR91a0xFdOTlFHZE5
         7UZ98leyI53BAqJt2UEgC5QnsNIZS/OaAVuSKPStLyB8wy6VyHJd1vNPyMmfNS2rt1Ok
         FfqPuYgdQRg0J2F6Hpzx4aZzqo6Q1caeiGZBd4tlziWRe0GZgigbdKrcxOOhcn/10guD
         +yMuYkGH1NiToS3t+E/W7Seu1Cb83KTdyDHj6qfdBg7/P3r8GtgJDMCtbPfF+spQMhIc
         um+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991189; x=1790595989;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nyH3aN/JsW/ONYaDE57+9lADVN4lin3yudBnNOcvlfM=;
        b=1dHK9lvhL2VbGTXDRls6GRryAls8enQaeYgbVqdEiifqb224ognQrCBlsW3g9vWVBY
         jr/M8x5KZtRc23/YW6ikN2w+yHzNI2wpTsMuiUB/P6QjgJn4pvrP42215yKin2WkEP4N
         KUYSlH7In3oAUH6sIB0esCArY8WF4zD2FQmmvjVDsp18NSdqK0uBTATiF9zhbO79U6N2
         eNctNYECX0/2l4tg0BHuTvpoA0abxydkF+7MNnTZy6d3/VAYkVCv3bVH2oRg5UlPdhjs
         IXRSSeyEAfqQCZshZ9kcskw6LemKI5rTzpOcbKX2MbYox6qZMCvboOIj3DaTLets1Whn
         /yGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpNIUmEYjGxHIWK4JTRz0awOBD13RDjPfgUUtp9tDWCy3Um2AzchcTTbZqIix2X7/+bjIKqDFIGmCD@vger.kernel.org
X-Gm-Message-State: AFuF++k3IWOTvRaC3Qzd5E15y9NroZQRLhSaKR5JIhAUSx+JQwHUfNLg
	LFFdM49AMKwhrK0emL4L4yj8j738KeWLGSy9nYNmICVOMpAHyK2QorHEznhs4F1kRycDHc0rfmw
	6Vtfem+0iYjFTXWx7V7wgppdg7Qz2m7/H/UwOSno2xllc4ly1kwDA0fiLwRp7JWKH
X-Gm-Gg: AYBFou1ll+eB38oHExfYWbq3XMEOxBcwYyCsX2WKUPkWXUVP+dbm2sjY5Lqp+cyuAum
	sWDnuB0yQ0Yr01S6hObL/qou9ULu6NG0NEsVu6bRB8j6qJm936psEZSwmEXsz8/M6gecNkdzB6f
	BQAsl7GVLKALwncsHbulLtrn6bZVBbWR4u1LO0OxZrpPOycubFZ3ikDtfvYRaT0KRbivSLybEh3
	70DVj20tKbwZYOOx1zLfzfd71Mzn6b1WuMJE/Sx74LByg5gtJT2smh76eTt5TuTTROA1jekuyht
	bYybPKqfSDIRJuz76lNrBqJEt6oRwtRScz0ytgPiLc4gFvlM1q5UffUT5qjbl69cUznUnIIfpFp
	uDv8s/nqM0I8bKw==
X-Received: by 2002:a05:6102:5785:b0:7a3:833c:49a4 with SMTP id ada2fe7eead31-7a55d38a3eemr3187884137.26.1789991189341;
        Mon, 21 Sep 2026 04:46:29 -0700 (PDT)
X-Received: by 2002:a05:6102:5785:b0:7a3:833c:49a4 with SMTP id ada2fe7eead31-7a55d38a3eemr3187866137.26.1789991188740;
        Mon, 21 Sep 2026 04:46:28 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0eabfcsm231778785e9.3.2026.09.21.04.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:46:27 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:46:25 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/15] arm64: dts: qcom: sm8150: Move PCIe phy and
 GPIOs to root port node
Message-ID: <bf6b4mj6qsipargxnweemhf4fbiooyusnbrwajq2kcre2g7mng@itk5yojodzra>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
 <83244e82-1f2e-4b9a-a85f-1dc704a91c3d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83244e82-1f2e-4b9a-a85f-1dc704a91c3d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfX91Q7DvzpMbKr
 Vso4H+QJsrEyAKGmpPh0FmUzC3ECaJwF/0KOe/36jzc2BzYP5k3mEE3GV58jJW6D2WMqsCouadc
 4JT5ROZGom0dhRqOnrBLYhYf3uP4d5Q=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab11916 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=o--Rd85XcoaJmgBzmWAA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: zjKdRdaO-G4e9wyg6PoVzl-5Z1xYBcj7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfX0aDaUDdWGoDx
 l74qtsL/0/0b7I00WmhPO7qgd/zTyjHXvUsDqPsbz/ePL9FX8CtUOFD0WB41LG5yOQELkwpKkD2
 CJdFawnIbUXXoPYc2l80KmmwSSphasslwW0Ta6b5lWbTCIFme3nh3pOVPOs/IvBry44/p/qYEPW
 HdA0qeZMGed+KS5IRNI54dq14fBmE1b8esLQm8sS42MH5FCju2BwDA6zgP1eJfLcr3L0OQpXQPw
 POe+bIY2Leu39RtX03dlJGRXm3k6afuklvCe1w4tBTVzzUy0qEg3nzi4yygtZPY6YA1z71Hplls
 3PqHAzxJ24rQPrLf1aPw92oC68MSXxeFe/r2GXTaohjn7aFsXsDhvYFUE3Cjhn/cr1vR8amqVej
 IIJbjiTfDZHSb9OfkDzyYe6/drc1ypJEpOcTsfieFMeCbDshIQTPnqZ2kPg7XYaE2QLU8LJ7Cil
 5bvi84bS0XNjFR+hs+Q==
X-Proofpoint-ORIG-GUID: zjKdRdaO-G4e9wyg6PoVzl-5Z1xYBcj7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210170

On 26-09-18 12:06:15, Konrad Dybcio wrote:
> On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> > The PCIe phy reference and the perst/wake GPIO properties are
> > per root port and belong in the root port node (pcie@0), not in the
> > RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> > from the controller to pcie0_port0 and pcie1_port0, adding labels to
> > these nodes to allow board-level overrides, and renaming perst-gpios
> > to reset-gpios to match the binding used in the root port context.
> > 
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> 
> > -			perst-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
> >  			enable-gpio = <&tlmm 104 GPIO_ACTIVE_HIGH>;
> 
> I am mightily confused as to what this GPIO is.. bindings don't
> explicitly allow it but don't seem to disallow it either?

AFAICT, it isn't used at all by the driver.
