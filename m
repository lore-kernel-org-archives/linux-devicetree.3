Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C1B306746
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 14:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783002880; cv=none; b=EuahAXXku6ltiov3nKM1bwf6b0Z/3DyXjXOQDfg/aoNG1lDNMwYWsG9+8obdC919uRMqvxanNCbS7Qfdzc8SRvAS6oFpFplRSaS9CJaDeigfZAkaOzAEd+DcGX4PLBZCnrK/HbBlQbZsDo4eU7b7QFXP3n7BGg6x+fg3aeV84NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783002880; c=relaxed/simple;
	bh=QMKFJFN+5z3CbYql5OX5/BAr7LzzYDwtJyOa+8BgPJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKZx/h/TSufH2K3iOFjMPkiYDTvwPb1w8PkcsY22SaypjueYT1I/2A76Nx6w/I0Kj+lqzbROBURz84qPClKizi04yi0PQF6QbCuSuEHZZd6TtnwmNuPtOaA13wFmT6Cl0LgyJk6JRXyXgGfDNozYPx/c6iu0RZlXqMTljmcOWi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SCkqh5W+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwyimWHX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SCkqh5W+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwyimWHX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3J1V514829
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 14:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=khEIiUG/D0adFgBLPcdgdpcy
	yV6+WIwATRQ/gKdvi6c=; b=SCkqh5W+Q270gFXuvdDMj5ANmHMR5JeObXsBn2Yu
	pWY9ulD2xVYUVHI0Nv6j09JQe1MbBzHxfRyjt9iWvYfDWzTgiLk2ZqYEoqyL5LcK
	E2ua9p1dBc2h1Ac5t7OSCLvzKTh2aXFn4Rq6W46+dbn6qbMH4PrO0GESdJUuXdOQ
	yKT1W004n3ktMutufXv0iCW7jR4EMwBY3/4cgKp5JEmr3ObBHbx3KjdNFRj8G0J0
	MoxogCJHiAzJPwz+t9MgUSPJpb+tvjOYLf9lbaoX7g+kJjDYBBmP8ThB92bvYTV7
	eDtQc2nXi87uGoe5An4Q/qQ2EAxTj0uefJ64l9l3Cx6epA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npr949v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 14:34:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ab036818efso665256e0c.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 07:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783002875; x=1783607675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=khEIiUG/D0adFgBLPcdgdpcyyV6+WIwATRQ/gKdvi6c=;
        b=SwyimWHXBA9UGzectkLmcZURKSl24d0MAeMas8thnKxpHp+X5/gyrpQ0xnMWv9hTpa
         BpzDUAqoAu35Elsni6x32456B9xF+2mQTI/BEnifCM5TcYHJLEM5z4ziQq9kYXFa9OZh
         1NfiAf6JLxOhlBCJnyF74sfRHI0fRUvbd5SKXjXgvEGj0YOXq1oixpNLY70w7X3lURJI
         e+50dN2pO3Vg9YFlIfwImHJvqQk/bI/dOoUWHpsoktGuoHvWSSbl/DzmjDVWkBjHhskH
         kqch/K59xUWE2GXOkEUlawtA4ht7XnEsb8id0wiac3wVOfzKTAZzND4cLYQtthTgh5Ub
         urhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783002875; x=1783607675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khEIiUG/D0adFgBLPcdgdpcyyV6+WIwATRQ/gKdvi6c=;
        b=VKqh5XTIWddCjpJW1YHq/SwM/dU8XMxMiETu4Pzform/shx9cb5ri4APANVhHdvvOF
         vW4V030GrPN/V9Fow3a64xvn0iBN4KsXqjXqFvQyxNCqnZUdEerE4B/DgOHVOuzwEsUE
         fy6q9lLANgMQuef3rDM/5rX/X/t0pL/h2/XJDg2G+xoHXdxCFPVspXpkK9dk0ZK+LHxU
         ITOF4hLw9AQA0bQVWUmrZndAH9oRaFj+SFcyORszAozYmvMkv4LT3QvQEG3FfgXZQqXP
         khn09e8SRAMizxyFkYZhwFHVeB7/pIkQUc5unUUI5qVzRJJgCm1oTQeSmOjBEgtH8mFP
         ck2g==
X-Forwarded-Encrypted: i=1; AHgh+Rp79L9MfdEcpAOY+wfDGj1F5oQMOgr4r8dt1ZfSqj45lImiJtczJNwrgfXmAu0u5cS9Hc6xkt0eS+HG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhamxfnai5aRAsszPRr/hxJTFJC+rLQ/cdK3HDCnovkyy7B4zE
	QVLOCaSHEzuTbfwJa4QemOHvnQbRwtndEQ5T+T7bmdiKgV1e/qlXDd+WLQViHibc5mOZJ3wD9s5
	NqomIqlUoXmMrAHP+npzoToObvbTC2iNBbQPK4uZaC9OJPEQFkyfXhNRS0Gihi5kb
X-Gm-Gg: AfdE7clfG6Nq1CrQvv+D23N6W+8+yqsOh99Wu5+NEgD42EwaBw4iJoAsi7y1hwhIwFb
	rxYCJzbJWhKmJSsBh+x+mlnkrhNgPCt49hTj4ugFcNLkAX2P0s04bvxyI+CI8/3tSlzWuamIn+U
	QeUlHuRbFsk8v7zftC1yk0TVahVSMCTl0HGx93QQMHI5hUvqYhrl6hJXoyapmNm+1Mr1su1pMwN
	y6CaBqfVfWggIesxsSkJ9fbt27/5DTc9Ah6EXiNhmaPny9kYCNLf1QVRP4IhP+HlkkE4yp8MMYV
	ioHfCCAJcYKirfYwnEsoe2P2giC386sP6bbds+VcL7Sv1/VkVa1vv3d7nX7R6kmq6ZlcLEP4bne
	z1aO+0rGZyNqW5TOxrjkA0asjCvwHBEUro56lp0WHofDyvoAEeoCFdX7tMZhYIISyENzGXsJ8jF
	6DpbQJm2WmMKYV/A8gzJ/+VH1y
X-Received: by 2002:a05:6122:8b0f:b0:5bd:ba0e:1d6e with SMTP id 71dfb90a1353d-5bddf66ebf9mr2302725e0c.11.1783002875274;
        Thu, 02 Jul 2026 07:34:35 -0700 (PDT)
X-Received: by 2002:a05:6122:8b0f:b0:5bd:ba0e:1d6e with SMTP id 71dfb90a1353d-5bddf66ebf9mr2302698e0c.11.1783002874807;
        Thu, 02 Jul 2026 07:34:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec899a2d3sm710745e87.25.2026.07.02.07.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:34:33 -0700 (PDT)
Date: Thu, 2 Jul 2026 17:34:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
Message-ID: <u5ieok3hgjcf74sxjdzv6xurmlbve46xa3imgfnom4hpjarmxa@fna5daqpyk3r>
References: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
 <20260702-monza-wireless-v2-3-7b56e2a6a6d4@oss.qualcomm.com>
 <43re752djujsh2kiyvjlkpmztxsh4atg6472qhir4lgay24zbo@mtlkn2xc2ors>
 <rxt4n6vuscu33mrw24af72lb3s6urqfpkhtia44yfo4j7wtu6o@3xp57owekrgj>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rxt4n6vuscu33mrw24af72lb3s6urqfpkhtia44yfo4j7wtu6o@3xp57owekrgj>
X-Proofpoint-ORIG-GUID: 5VtU1_HqxZ_O1VBhlAOYkNsH2ypNV3Cb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE1MiBTYWx0ZWRfXxbPLw7DF1DTK
 7hnrTW4rGbVSFM3gZ9Tz1lA6rGBWfduXeqQgNWSqA7m8Wm/+Ny5ZKrJxtjVouUXI/06tUZm/nAr
 keOU9eZWdQCnSj1DEealAoIbZS+kELY=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a4676fc cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=yMu6vMg_nfoMeO1ix_IA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 5VtU1_HqxZ_O1VBhlAOYkNsH2ypNV3Cb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE1MiBTYWx0ZWRfX3nHy5kYXdNio
 rp/SoaZ4q9ECmn7iGHyFECzgNoMFs1YOTDpS/9c6BCCSVPDuhnJrEi51vYlmcT/fXXvjQwWTOB8
 0qDb2FRJi7FkkeVFn4iCL1otKzfRwCAqDeR4BzRcAbZaz5C9hRwcU03975TGyPS3ZhS3UySw1Sc
 DNM+zotCSTBLrDeHCTP7YrHMsWfKj7UEsovM0VP41qLVm8O0hwGJ8fwzHCfpGw4kYqJmsu/KXkO
 jDE5NUtIZKBqZj1qRTYV511o3rSr03tIyMQJPi2sr4T3o7i+imUGb9DotJnkYohyR9if3iuHx6l
 anSQMJ21tglrM0Zf/RCMxeuXfSo/8bBcR93CIAxT2K8p/BxMYWBlhZT3JBI5EQOlN5m0zoWY4eB
 +flRYC4cN4RXWlStaVWKttaHRWUqOpkoUpl1+vuGJqYkqfT+UWTMK1+RioTLoeaTz/cugoXmIDp
 GqdPSU9fZY4ngWalKjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020152

On Thu, Jul 02, 2026 at 04:17:43PM +0200, Manivannan Sadhasivam wrote:
> On Thu, Jul 02, 2026 at 03:14:49PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jul 02, 2026 at 12:46:15PM +0200, Loic Poulain wrote:
> > > For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable
> > > is controlled by the W_DISABLE2# signal managed by the pcie-m2 power
> > > sequencer rather than a dedicated BT enable GPIO.
> > > 
> > > When the serdev controller has an OF graph (indicating it is connected
> > > to an M.2 connector), acquire the 'uart' pwrseq target from the
> > > connector's power sequencer and use it to control BT power instead of
> > > the bt-enable GPIO.
> > > 
> > > Also allocate bt_power unconditionally for all SOC types since the
> > 
> > Can we just fold it into the main struct?
> > 
> > > pwrseq path is independent of the SOC type switch.
> > > 
> > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > ---
> > >  drivers/bluetooth/hci_qca.c | 81 ++++++++++++++++++++++++---------------------
> > >  1 file changed, 43 insertions(+), 38 deletions(-)
> > > 
> > > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> > > index e09debdb00a1b8e74ccd5de6147e240e533b4594..b04593a96e14ac9e87ae76fa00eda308e81dea25 100644
> > > --- a/drivers/bluetooth/hci_qca.c
> > > +++ b/drivers/bluetooth/hci_qca.c
> > > @@ -1872,6 +1872,9 @@ static int qca_power_on(struct hci_dev *hdev)
> > >  			/* Controller needs time to bootup. */
> > >  			msleep(150);
> > >  		}
> > > +
> > > +		if (qcadev->bt_power->pwrseq)
> > > +			pwrseq_power_on(qcadev->bt_power->pwrseq);
> > >  	}
> > >  
> > >  	clear_bit(QCA_BT_OFF, &qca->flags);
> > > @@ -2256,7 +2259,7 @@ static void qca_power_off(struct hci_uart *hu)
> > >  		break;
> > >  	}
> > >  
> > > -	if (power && power->pwrseq) {
> > > +	if (power->pwrseq) {
> > >  		pwrseq_power_off(power->pwrseq);
> > >  		set_bit(QCA_BT_OFF, &qca->flags);
> > >  		return;
> > > @@ -2387,6 +2390,35 @@ static int qca_init_regulators(struct qca_power *qca,
> > >  	return 0;
> > >  }
> > >  
> > > +/*
> > > + * Acquire the M.2 connector power sequencer.
> > > + *
> > > + * An OF graph link on the serdev controller is only present when the BT
> > > + * device is attached through an M.2 Key E connector. In that case the UART
> > > + * enable (W_DISABLE2#) is driven by the pcie-m2 power sequencer instead of a
> > > + * dedicated BT enable GPIO, so grab the "uart" pwrseq target from it.
> > > + *
> > > + * Returns 0 if no M.2 connector is present (nothing to do), a negative errno
> > > + * on error, otherwise 0 with qcadev->bt_power->pwrseq populated.
> > > + */
> > > +static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev, bool *bt_en_available)
> > > +{
> > > +	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
> > > +	struct device *dev;
> > > +
> > > +	if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
> > > +		return 0;
> > > +
> > > +	qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev, "uart");
> > > +	if (IS_ERR(qcadev->bt_power->pwrseq))
> > > +		return PTR_ERR(qcadev->bt_power->pwrseq);
> > > +
> > > +	dev = pwrseq_to_device(qcadev->bt_power->pwrseq);
> > > +	*bt_en_available = device_property_present(dev, "w-disable2-gpios");
> > 
> > I think here you are looking into the exact details of the other of the
> > graph. There might be other devices on that side, while the code now
> > assumes M.2. Or, consider having an M.2 controller which handles
> > W_DISABLE2# internally rather than through the GPIO.
> > 
> 
> This code only deals with M.2 connector in specific, so I'm not sure why we need
> to worry about *other* kind of devices. Let's worry about them when they show up
> (with graph interface ofc).

I don't think we want to go through the drivers using M.2 connectors in
such a case. In the end, the contract should be that there is a power
sequencer on the other side of the graph, but the specifics of the
connector should be abstracted out. Do you know, if in the x86 world the
W_DISABLE2# is a GPIO or is controleed by the hub.

-- 
With best wishes
Dmitry
