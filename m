Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E213A5E9E
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255556; cv=none; b=eifxFyhLoKMIo7I87t3HQKBtu1Ezgo1Yqv4ih4B6X6giQ6cwu4nw97gFghIWU5rN1i1EGxieE22bkiqPHU9zyxbTlksMg/bocw7R1F6QwYOQt4xUgmRV4rnvNtaXzlUlNmJsU53GoB4k14YpyaZmWMnJrLKE1HoumkrsZsP1aho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255556; c=relaxed/simple;
	bh=J1AFntJO8yn66Ges7ZIJc4qYkwhNSJYwQcAxHEZv4U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnGx7beihlMl2mZx6tqPd62abv+WEEQ0ksD53kaE4jUyKXzoyJVfG5wJd+nlJBovK8OADNE+32hSgohrC/ntHC9PdXpQtXnUZ5UuCUzfJCcNEVvZWWp4BStFq9GxhofbrAZe5zA7+4nQYUYAF3YATtRejwQrufbPF9Hip0xWDs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFNQOBw0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=drLPnYJ5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFNQOBw0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="drLPnYJ5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39Rf52475909
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fQHHtK59LcboT6pjvqkOS+sy
	sywNj2Fo6GwGmNW3Glg=; b=jFNQOBw0YkLzDcDJnKXoiojTKiEGuD6hPTR+kfeE
	2ss4OSCbPpXkPqcf78P9LgzYKAqxaVmcPlAGqnC4mH8u2xP+ivX8Z1JKJgYJEiuu
	tFZy4jkbxlMuHM8OS5TEILW7PcEy6XJ+vVd8MXZaQ873NJ+HB+Ao1D4o1bO/TyIV
	VgTKANxBx0aZTaKWlh9+1fxOJPmQWkduGpSZMoSm+IRWKyDvfkHt0jY1Y3IgaWBK
	15jG+1HAywMpEhomeAzvahK6xEPIWgg+hnoa6czhQ64d/fuNWtlXMgaVvJnAfehT
	+9DqgRSqF6u6zfiAclJrVi8a4I0g7mc3Ush60MbZ8QcBMw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5tbee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:12:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a236220so13522981cf.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781255552; x=1781860352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fQHHtK59LcboT6pjvqkOS+sysywNj2Fo6GwGmNW3Glg=;
        b=drLPnYJ5yqlmaM0EM6PNqUTJ6HiVq+kvG/T1wFAH2kUnZ2tVnif0r5RKLShknjLTUc
         bKZve+jU8sSnJCorzQyzrYbhN8Yv1KORbXN2eQKnyx+y+wWtqZGsQPoD6l5MF6pnvsrJ
         TAIOM6tJwIvZolezRdba8WH5CFfV4SJqrUhpqkhcqVJXdMaEUHPRosyXntGIATOfogyq
         2Gf4DQ/29JlYoVxSPUF2CmhMm1Dnh7n2qzG5lJ7JW2pMMGBmDu62Yuh/A3E0MXjb2T2i
         OPZ4OI7ZBIafLfSb1iCV23fA7uXN7Rs+gNMUNF7P4w/LEsMZ1g7xF45TAn/NB4WCWrQn
         qv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255552; x=1781860352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQHHtK59LcboT6pjvqkOS+sysywNj2Fo6GwGmNW3Glg=;
        b=dJP5KnE+mFmOEKCBKzDxHNAi5WoCX5rD4HpCbdSSBzIMsEWkS1vbB/6kVuFWpA6aS3
         k21CU50Ui6f5WbITUnqFfGovKVvLCQ1ZDKH3XrNXEybHTij5KQjvFJdrb0GZAhtJ0g/4
         G85PXSOvFQmfH4juQoI9Ni7tIIZs+nL1egN5cjuJf+DaGVKTf60+ouSlqr6PDgVzjG6t
         qwKRapXfaExo9qJcB+O6Vr8fIUsvug7WspclRdBDJq/bRwFgdz1ynodudOQBKrDFpWjR
         WbSgLJ0MfjdYMqhbVAaBuviOd0MK6DoUbYB1ETSgS73gMc0PT1JqWU/iKBAF67+otgt2
         dajw==
X-Forwarded-Encrypted: i=1; AFNElJ9mhNFAXJ2fi+bMuojvXxuLR3dRvLmqv828dJa43Ebz4gbniT1s0H/DejFjLztA4rxZRlMr2eorsKP9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu3bCzOtK9RzFYZcjQILB+GR22cvMMbLBPBVUTt0sYS9pIw0yQ
	HPCBCEfepssDJ0xAGj6skWidbbr65OMdfqxxOl1MZr9xIIHWScjmKqv0Txi8OtL5ghERFincRey
	2HwHfZvauxvmlTkCAMl0W6iMR1ekZZ9bPrgJ1KmJuvMd7eA/ppGDES1PpMlcSsViD
X-Gm-Gg: Acq92OGgI2oa1OMCHR+IzZFwPnKKd7FZaEdRvco4K9TigDggGPEZeIOBLpxgdc7PZrJ
	z4kzzjwJmfq4oeM59gRcDnhHmD+Fx7iZ8Ln0sSrIDoksk9HTL3brCvcXcCjhhHaZWMJJ4jRO74B
	/cCZaep15dWUfkH9JUHOL4eBR6qtH+V3OXpTtHqV0qvZ4UpB3+r7hzHYkNd9M2Pv+VMXCTA8eo1
	5z2+tO84VmbSNOK1boKhvgUvU/nvadzOSKjrRYGwcn2xxt9HXwkJ047ZzsXt4CAUgNhAvCDidu3
	BMJTYg2uhAfHhCijyYQtKQrfD1qK+diUG2h+OGiy3fzIwvreKMZWdJNVSij153kmbsJtY5QtZvG
	K2M744Hkbiq9V762vd8Jr+bhvRwLAzRgZTo2ruNozd2PQj0fhyLFd/I7hC+v/lKAGM2q9RpB4e8
	kGDYSM1MsObb41EaocQi/w3WOCWKNjGwVppwc=
X-Received: by 2002:a05:622a:1109:b0:50f:b257:9301 with SMTP id d75a77b69052e-517fe566319mr24249391cf.52.1781255551625;
        Fri, 12 Jun 2026 02:12:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1109:b0:50f:b257:9301 with SMTP id d75a77b69052e-517fe566319mr24248931cf.52.1781255551221;
        Fri, 12 Jun 2026 02:12:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7357sm381663e87.42.2026.06.12.02.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:12:29 -0700 (PDT)
Date: Fri, 12 Jun 2026 12:12:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 7/8] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
Message-ID: <uybyiffu2czpzhycp6x7w2pptzmhajxlx3ogglshamppo66kqn@izztlisgr2xc>
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
 <20260609-block-as-nvmem-v4-7-45712e6b22c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-block-as-nvmem-v4-7-45712e6b22c6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pO_BQSG2uO1i5FFS3ElcewvLM4odmVAy
X-Proofpoint-GUID: pO_BQSG2uO1i5FFS3ElcewvLM4odmVAy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4MiBTYWx0ZWRfX+YwezLsGbX6w
 y5QuB72vA7AM574txFSc+lZH2QlbMbnQOlcGRNrP5f/VSoLlSYdyR+8INtKaudbAi5bfn4V8/JW
 XhZVravzJMBgl/lwwEe8MMOQsnNO6LE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4MiBTYWx0ZWRfX7jYweDsu+z31
 Js4b0i2+u6TCELIWGy7vq19tsMRFMJgz146zRLIf1gNWokHz87CQnI29GkVu7m7ety+sAQI8MGx
 a7bwDoPP7SShml2zbwY9hr2JlouzeOZWCZwNTUdyTxtWuUypnCvSSiiryaZ0Yj/XPp5JmXgHe3y
 o7P3I/INETsreKJ9oPuB7fAzThcGLL9m6XaXNXSNmS6F+goWoJw395w2QTBnhkYuZr7unf8i7Ru
 L8gF2xI8Vv7KAQy7xt7JBjafoTjQzg5LHUIYPmSU4VlhZ91De9N2p8FY+SOZXNhRinuVwrzR7Wk
 k257sZAjjVa/hRYCrKMdd5TsFbQxk+qgycyr2GpTqdPyIJarT8Zqk9fO/GP6ERDodn+BKEejLfl
 0WfK5fW5lrwINj8i8QE/uuf7jO7e6i2we7r0z8ghKKZ0WH0HaalYIEHy2DbruV/7K4PMqpUjBob
 N7eXk0c/Gu7jr0Vjh+w==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2bcd80 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=m9cM9ScjmTDVYK95jDAA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120082

On Tue, Jun 09, 2026 at 09:52:32AM +0200, Loic Poulain wrote:
> When the controller BD address is invalid (zero or default),
> set the NVMEM quirks to allow retrieving the address from a
> 'local-bd-address' NVMEM cell. The BD address is often stored
> alongside the WiFi MAC address in big-endian format, so also
> set the big-endian quirk.

Okay, this answers my question to the previous patch. We need to support
BE addresses.

> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
