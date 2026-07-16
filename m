Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B583EEAC4
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190709; cv=none; b=HOHB/R1zyZAadB82DG1lSm8lJtmj5U86DK5CY+V0iqHDchnNmb4n006odM9mjc+0bcsVLb9T80DNKnBzMsMmtwxPmdy4PBTPg61x1fWW5nhiVJsURFMNfrulalpZv+opGYYLIymaSXyZH7m3AG5jKb3cIM9DocyTFUhWA2jRGqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190709; c=relaxed/simple;
	bh=6DHfUJVqQheLEpAIKU2YHLWqGBbQ8kKr9sjbdC1PERk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0FRemImFcxxsNU/yOhCJwTwakYa3pjxjxHU4Nq3XFtDPY+58/CWdAiMWoo1WVy9A7mDfgTgAZOLfyDLK0wPVCqHOW0cgeMv2FqIsur6w65ZvSJdVasvWqrfAqbMuq5uhpwJN9jIq/6rQIxm8ooThrD7uuX75yiJduGxZDg/eu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cKJ0mHMg; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cKJ0mHMg"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38759bcd877so5545742a91.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 01:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784190707; x=1784795507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bc4d8vqk+lliMKPmpqbLIgPhIFDsMX/hIWVD5yj9aEU=;
        b=cKJ0mHMg6aEmy0v65cg1aQr6syhYObFrAAz3Ipw+5pyERDObvZIzibmBLAiGagP3hC
         aRtfqHQLa8QGwLsgtmh7oillq20h7IeK0W9uE3ybzhwz9W1Uji6/vw7l/CSFdGv6znBv
         i7dFNY2eg56Mjp71OZbFuVxetr78jDR48UPQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784190707; x=1784795507;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bc4d8vqk+lliMKPmpqbLIgPhIFDsMX/hIWVD5yj9aEU=;
        b=Kw9kxRP1svWS5gjVSrVNrBL9P6ePV7Qlwp13HonuJZe9F5aUz8v+HF7tSNFkxAyZ+B
         H4v6JmBrjTLpb73/BAsaZiq6JR3V3NUSdCSYOMibwczDWu0JcMX+N3hmObHhj+8LPvRH
         fjscr3jLi3Ow5Dinko3nf313swljM1VwGgdpxZu5edVfT+0kRmv7oLjitHPYfqhP9Gex
         XWSOENw8xRHcJfhXwjMXeYUl3oHQp68h1+g8b7a1uvhRpLTGkC4A+04pe7kqFGqNSy8r
         LQdCkH6awP1s5F28OaBsN4ZI+4BeL8lOUxRxgvDpZmlrHeTpk9wPCTFVmpUTIi8TTXsK
         ryKA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3oeoyg103lt6O4sX1iotebVEHh7XQhecIormQrtAQm51Fa9tqZRLVYyd61tmwTzuTm5vsb/u6QAQm@vger.kernel.org
X-Gm-Message-State: AOJu0YzxBrGix2pRZ86NQhAYLjQvBt7IDiIwFnhfMa07lI3CcAxLRA0q
	bFe3MiMv5gHg/jfevdOFIWt6PjHps3zTZa/T2QgtAmeiytrsQFEMT5+Xp01kOU6Wvg==
X-Gm-Gg: AfdE7cmiOo0o88N+b1YhNLGOgtmRsCA/CsirqrTivAfzVKfvn0q39OKWv5l9UHxjSdK
	DN/y3C1a1uxhgaZvDYfI2YzGhZUmnVLIsTbU+0WXDy31F1jdLxARtMHZlBZ5l7xbGzDn83eSl/L
	kG/bP1tz29ydAqTBAJ+36WEV2a2WAwSyCCD2a7bpJ7ERX5A/rE8Q3UNs1Inse6D9Pg5NLzcvxLm
	+PeJ/qovIsOT0fp3EWUHlRImIMoAj6YFKCvvHf9q5YGPD+DdCtuR5sRrOvnUeH0AzEJlcPPRdzS
	F6fuP5BMDR8f2Tyn9rSkmXotZYSGrMvqaxHRecjmf8ezxTg100yHWzU9AwokWvbweiP3K+87dMd
	Q40FnKb0/OZ/S2VSIYJwW+zC9R9MMrAbF+MvWltVG31vBarQI0MBRTQRhB2eutJq3D4n3rOshFw
	R+bpy+YT28lMz+wt4koQhyBcJS0GI/5Cqmvw==
X-Received: by 2002:a17:90b:4a04:b0:387:e0bb:5802 with SMTP id 98e67ed59e1d1-38e2a12332amr5930901a91.41.1784190706821;
        Thu, 16 Jul 2026 01:31:46 -0700 (PDT)
Received: from google.com ([2a00:79e0:201d:8:8cee:ac9c:232c:cca3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39e5f713sm923742a91.14.2026.07.16.01.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 01:31:46 -0700 (PDT)
Date: Thu, 16 Jul 2026 16:31:41 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v3 08/11] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
Message-ID: <20260716083141.GA4101439@google.com>
References: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
 <20260710-monza-wireless-v3-8-46253587af64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-monza-wireless-v3-8-46253587af64@oss.qualcomm.com>

On Fri, Jul 10, 2026 at 11:57:34AM +0200, Loic Poulain wrote:
> For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable is
> controlled by the W_DISABLE2# signal managed by the pcie-m2 power sequencer
> rather than a dedicated BT enable GPIO.
> 
> When the serdev controller has an OF graph (indicating it is connected to
> an M.2 connector), acquire the 'uart' pwrseq target from the connector's
> power sequencer and use it to control BT power instead of the bt-enable
> GPIO. This is factored out into qca_serdev_get_m2_pwrseq().
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 35 ++++++++++++++++++++++++-----------
>  1 file changed, 24 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 24dc5bf6d192be7e1d500df6bdf36e6184f9eaf7..f6529d359ffbd97f8a3c4c0593680ab200215b36 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1872,6 +1872,9 @@ static int qca_power_on(struct hci_dev *hdev)
>  			/* Controller needs time to bootup. */
>  			msleep(150);
>  		}
> +
> +		if (qcadev->bt_power.pwrseq)
> +			pwrseq_power_on(qcadev->bt_power.pwrseq);
>  	}
>  
>  	clear_bit(QCA_BT_OFF, &qca->flags);
> @@ -2387,6 +2390,20 @@ static int qca_init_regulators(struct qca_power *qca,
>  	return 0;
>  }
>  
> +static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
> +{
> +	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
> +
> +	if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
> +		return 0;
> +
> +	qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->ctrl->dev, "uart");

Note that this ultimately ties the lifecycle of the returned pwrseq
descriptor to the uart, which is probably not what you want.

I ended up manually doing pwrseq_get() with devm_add_action_or_reset()
so that the descriptor is released when the serdev driver is unbound.
This was for the Realtek driver. I haven't sent patches yet.

> +	if (IS_ERR(qcadev->bt_power.pwrseq))
> +		return PTR_ERR(qcadev->bt_power.pwrseq);
> +
> +	return 0;
> +}
> +
>  static int qca_serdev_probe(struct serdev_device *serdev)
>  {
>  	struct qca_serdev *qcadev;
> @@ -2417,6 +2434,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  	else
>  		qcadev->btsoc_type = QCA_ROME;
>  
> +	err = qca_serdev_get_m2_pwrseq(qcadev);
> +	if (err)
> +		return err;
> +
>  	switch (qcadev->btsoc_type) {
>  	case QCA_WCN3950:
>  	case QCA_WCN3988:
> @@ -2426,17 +2447,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  	case QCA_WCN6750:
>  	case QCA_WCN6855:
>  	case QCA_WCN7850:
> -		/*
> -		 * OF graph link is only present for BT devices attached through
> -		 * the M.2 Key E connector.
> -		 */
> -		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
> -			qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
> -								  "uart");

It's already incorrect here. But I think the original patch that
introduces this hasn't landed?


ChenYu

> -			if (IS_ERR(qcadev->bt_power.pwrseq))
> -				return PTR_ERR(qcadev->bt_power.pwrseq);
> +		/* M.2 connector modules are powered by the pwrseq acquired above. */
> +		if (qcadev->bt_power.pwrseq)
>  			break;
> -		}
>  
>  		if (!device_property_present(&serdev->dev, "enable-gpios")) {
>  			/*
> @@ -2528,7 +2541,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  			return PTR_ERR(qcadev->susclk);
>  		}
>  	}
> -	
> +
>  	if (qcadev->bt_power.pwrseq) {
>  		bt_en_available = pwrseq_power_is_controllable(qcadev->bt_power.pwrseq);
>  		if (!bt_en_available) {
> 
> -- 
> 2.34.1
> 
