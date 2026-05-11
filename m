Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C59543CEC0
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 16:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518318; cv=none; b=MpvyLpNiIPe9sdCaJONPhprq0VNuipiE4NFZo0WHBfjTFbLPhyhqeOa/CakHwnHxrvDV2Aa/r2lSfkblLkPnejwcIHd3wvn9pWhZASN9fA/HV1Ip/8RsPw6PkA6vBivlJDRGkwyaArQqzcT4cAdFngEwMqTIDyE/CRaB+mu4iV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518318; c=relaxed/simple;
	bh=l5km0omBz+PU2uQln+PYGPhd2uNtw8IyzbYdICQxO4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcIs+xUDETGkHaOnTeTXghzOHqiFzmPaiHXm3nByvpjGbvBfjrQii8583xwsw82a2k8wQSidGHeswFAChr43OcW1zhde/DAEtgib/u1r5s+GPd90e3+HhowqHKM4g/SsvDBpp/D+dcHNcBdaf7fRyt7GE6YogRn0yB0+F8mH17U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZT2af0rW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4Rp7YOn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZT2af0rW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4Rp7YOn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BBIR5Z1344442
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 16:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A4bylOWpFQSI1VTsJy4jyU4S
	AXUBAaF1g5Vevo7vFR4=; b=ZT2af0rWbcKl6qok2KzB9/KtnhvuEpNdfzYlfavw
	FdH20/gFnJ2huQS0CoEp1Hz7ZD2+/qXAZK9p0WFylleMyks1gXl9C2czoc821odT
	u3h5UZDtl6wp3fxyXgXYS5M25xBUFze3D+Dz3aKP9f+wZ8RATJ8Qd5KoPqETGE9F
	U3X60cEOHRN76VfQnTFeiGHXD2omgp9J9AIt/1ORSIjcg6krnycmbvRFG4nmtoYX
	G6E/80U0nrwyhGNOSZ/3NdHDn2uAOGyCEED9/fbCmkzsJK0bdndDawx2eF4jxp+X
	OkEXS8qu7Us8Q4jEYTSsrVQSuYqD3sWywv0xfTX0St5Tnw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3e499dj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 16:51:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bce224720d8so2520710a12.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778518315; x=1779123115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A4bylOWpFQSI1VTsJy4jyU4SAXUBAaF1g5Vevo7vFR4=;
        b=h4Rp7YOniF+wEuPIOxW7s/sQqkn+jmNmDffn3/dSrGZH8uSRslg+ve8V27QwbBuCh3
         lj96bsmKv4S08fPFQ7cC4FKVCuaiIW9qcjiFSZWPS/1NAUjxV3j20xe2ENtzj70PcLxU
         1NqpcJKoFi8x7WSlXrwe6nf0hcUww1ZwizpZVbQnhZ1fXDiPk9ddWPbONy65ZUIjCF69
         Ue0ls6Wp1/uSunSJQtTeNFK/VAC+sQMbOpAs5Bp77M9RCmZsRmgPW3ZzEhvpQL3pUcpc
         KWuVaMxssr3nzWspHu/fFYNr5I3ySbA/PtRjrpwafdjtsly3sJ0eowDK0be7Uzdmi4OE
         BRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778518315; x=1779123115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4bylOWpFQSI1VTsJy4jyU4SAXUBAaF1g5Vevo7vFR4=;
        b=n1EB6+jilYWtyQpKrcRiqigqrDxAdi1ftHTWj63qvL1rMJWvW9Gjkhn0f+8r0aJXVH
         uRCsI1sNCqOkWKJ357+pHShow/p9Aksxtd96G9aCvsN2KI2azzJpy1ndDV4qJ5llPVuk
         OKiiVD0G7R1VvmhzOFuYQaIWo9BnlChoj6mIciJPRSC8XEnJe1Neq6aTVfPxBw6u54rj
         uzlvCQZ0RlXhUQVC+hBgNrq7QoyLeANRzMAXl+rVaUFJ9FUINuG01fSKQpb9Bt4YIZIU
         DrJF7xfQTNo0ND6Regkvfm4G8vUBbahfIOP/7fj2jTITdcJY77O/dldCz0NS+1QX/kMo
         SY3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/oaGclMB65avB7DIHsEXj0ClAdTm7ossD4UWQA6XZ26hontWXvEc2YtnCjTurKbO1pqLpZyeTn8Fyk@vger.kernel.org
X-Gm-Message-State: AOJu0YyzX3/LNb/SnoM3C6rCNAwGl+3v+NbKtJrsLpzgmhCA1kK4vlme
	d2f6RAcJmvpphdrd7XvoM+e6QeCln9VHnuQHgy/kZ7wLAIxzabujy/U97HfI/MdFoVeQb/wkiwd
	AvYMRyXt7ED54bNu5YDWdd/DD8ZB/91gNLOvCHU9sl2tfbElrQ/ECTcQ1j3rBqzcK
X-Gm-Gg: Acq92OG85pIxuALkkvUp4dRV5iFlxcNGtecApLn02NPWV2PZRoimQcZ3TPgUgyQD1la
	KNUhrnVuXJNeUmXKkCUaS36Yb4HmI/sppHUux1TjY4rMW1ADW3TOZWXEpsyzrCU9hVaZdExUN7M
	YYo0TTlln2bfFbOGMaTzs8g9KnDn+GKkG28ZdDe90mbJu8RQzdkvw3V7SduRsMsVK8+Jb5uDMIh
	k3kMmi/2+jzG2yB4PkGXVPBDuG7zlh3P6kcMPJtbVlsYDa8PW22kmictZIoGDa+fgoVxdxzV2Pf
	CaCwLgnoeNi06fD3gZfEt8yJfdm/od9OBjYVgB4/H1+7OV4JistEeV/nUSgB2xJx6y3zea0HAoG
	jqv/u/Eh+1rHvuz0dIx9t6P/3VLeNhllhGrUZYGZgeTzIi8bq2v1y2ieMU+o=
X-Received: by 2002:a05:6a20:3d0b:b0:3a2:d0ed:f1f8 with SMTP id adf61e73a8af0-3aad4426d43mr12203982637.30.1778518315049;
        Mon, 11 May 2026 09:51:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d0b:b0:3a2:d0ed:f1f8 with SMTP id adf61e73a8af0-3aad4426d43mr12203951637.30.1778518314442;
        Mon, 11 May 2026 09:51:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267711a67sm9693642a12.20.2026.05.11.09.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 09:51:54 -0700 (PDT)
Date: Mon, 11 May 2026 22:21:48 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] firmware: qcom: scm: use dev_err_probe() for dload
 address failure
Message-ID: <20260511165148.qxz3v5jtwysiosjq@hu-mojha-hyd.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-3-mukesh.ojha@oss.qualcomm.com>
 <afyajZbt1hjEbgvY@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afyajZbt1hjEbgvY@baldur>
X-Proofpoint-GUID: _b_UqxllZ4SUA9IrQR1Lt4K2jq4dxMrn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE4MCBTYWx0ZWRfX+JmWzqBKApWd
 vpzk1XLsb7tX6QUUdZWRH2aJltqcpnt3Bfpep8w01hF8iCJjAgbBbb+g/G3E904K7jKrK+WdH95
 5yp4bxfXy9VNFqOJh3ZagWazSdtviVd+0WkYpBh+7fUJMrUa6nAT+K5lZyIVmT/0RIt0ybMMBYt
 SrZIzaeft25p7bVqFRLBkPygTxSEMsdUl4jntrNtsCxbkIG1Z1uHgIb/jgOU6b3rSkHIkUxVux7
 ayq+JQAE5vg58L537USsX8e4Q/MahEj23BeSawMugywJFJ93c/aKwNM8HLuF8eRrulTEo6rholV
 9hvw6Gm0M7/9YUfwtDaQq15NCkAcY4ksPdVMVN9Hsat7NLIc1oFrMxMheJZZ8W6/SnlFcXhjIS4
 076ft6sDrmilZBppgIKweoZ4I4c7zvKXHUnhuYuwJvrvJdJDVaitzVZZQOdsEApoTE8RT65IS60
 8HM3QxN1V7YC/Y7qDeQ==
X-Proofpoint-ORIG-GUID: _b_UqxllZ4SUA9IrQR1Lt4K2jq4dxMrn
X-Authority-Analysis: v=2.4 cv=Yr0/gYYX c=1 sm=1 tr=0 ts=6a02092c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=MdV5vAzaB1W4e4OnXksA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110180

On Thu, May 07, 2026 at 09:01:24AM -0500, Bjorn Andersson wrote:
> On Thu, May 07, 2026 at 01:37:18PM +0530, Mukesh Ojha wrote:
> > Replace the bare `return ret` after qcom_scm_find_dload_address() with
> 
> Describe a problem, not an action.

There is no problem here, It is just for consistancy and an extra log., Hence,
just the action.

> 
> Why is this patch part of this series? I don't see how it relate to
> "minidump SRAM destination support".

Was making a change after that line in the following patches, So,
thought of sending it part of the series.

> 
> Change looks reasonable.

Thanks.

> 
> Regards,
> Bjorn
> 
> > dev_err_probe() to produce a consistent, deferred-probe-aware error
> > message when the download-mode address cannot be resolved.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index d9ee180388aa..f65b132004a5 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -2762,7 +2762,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
> >  	scm->dev = &pdev->dev;
> >  	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
> >  	if (ret < 0)
> > -		return ret;
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "Failed to find download mode address\n");
> >  
> >  	mutex_init(&scm->scm_bw_lock);
> >  
> > -- 
> > 2.53.0
> > 

-- 
-Mukesh Ojha
