Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178144;
	b=Itr0X9ernTq7ZDtHGC2k7eXincVlDklOQs2PLXIjTSs19qD6qcs4KKMmt9Ik2v9G21D0
	 IPvaHLM2KozxFN5ZkCT8KBZ4wKT2932oUW71Bq+d6MjOA66b3+C9PhVc1Wd+3H4oPHufQ
	 LKNnoKJ0Ryao2mYsbSsrcn541Am3/I3zfm/2FS5xAlIwAL9YD0yNVhuPH3V0EqfwxXuXF
	 5jRtDOVQoNte54/P10l0yLWtIzcBH3drG4wY8FW3Y9HHG5s55qWtWy72MrEz4vxIwgiXo
	 HfiH2GdGrbd9ab5jilPqKCtGevLiuwQ+LMiFH5ZDqUzMxAVZJgPabAxG76dWX53E/NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NR8gKvzZM739OlJnXa+9g1824BNxWUNsEDlub78+UpE=;
	b=A402rWtK+Kr1tc0yuv8C+UmLA43ud0vaw1EBON33SmRx1rc4BWTGUUWLjGMhUjucVbfx
	 +ieoM5TE+Eu4Gzg6dbJmitXTOoutq6hz+MAIQrBoHxcyTX8gipBGg9UT3DUeRJFHvHfNw
	 86cnovRx122TcEarynoL00Ecp9ZxRNVMpeb11MwzAQEtPx00kVS5tGzUpPzL81feO+u3a
	 6pLAVxI09zh5D6/MLjS9xJBZc6IqGHFKb+bXIO2VZ6niVFEx69+IpG7PTD4HvpM7mWZkA
	 0uzHYMJC5EKR0kX6ucdmQXyjstzrcPHdmy2MWyqIqgDKaUFheT2UPkvhAYYMrTIMPJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WMjuJJqQ;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9489606A324
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9489606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WMjuJJqQ
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso324303a12.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 02:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178143; x=1793782943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NR8gKvzZM739OlJnXa+9g1824BNxWUNsEDlub78+UpE=;
        b=WMjuJJqQEieWppwvO1baYD6Mf7PCfEoQtWeF8Sp7ea1rMGjpU6FWbaKIWoNqDibVHU
         i5AU3opSogd3nC6tqGIXZsrkk2WJfNo6HaAnYWEDFOMMbEjj10XtQmOQP3+jd6IEgu9m
         +roJmSNfySpcq0NGKLakQ6h8ecpMUsvIEybKD/fdJxe7PfVAzWtHSakz/UsO+qo/LjUV
         OEyerTjA7IMl6SLphu11DHtAE73/bKQtQiXzpgQA+sK86ywz9KAgPZhTHO+5OgiESVZ3
         izrequLpCAltOW8gQi6DaEcUkg5BeNwGjMFzAw9uPnzPnNhTxXstTMgyHGHQT1cSe4Zm
         MX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178143; x=1793782943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NR8gKvzZM739OlJnXa+9g1824BNxWUNsEDlub78+UpE=;
        b=qRc0jed+Zo/EwCe1M8V7RK7Q4SDbxqXcnAGRknOHLKMu6v1o3kyqVNX3eba8PDmeob
         NaR39Sl4Yc3ryS7/Kg9gWyQkz/vGylKD763xlNxzcuu9+gVApZJP9FW9T1LkY9pHqnWB
         fvO5Vq2DgOIpW7l+T3LSigve44HxB0TJ2W7vlEujZmDwd4xsjnk9hUM8tAq93EN7rmdU
         wFLPTKoU65Dgf9nfu7/Ss96p/eCu/JkdbyYOAZxrwwP5rsdg421MywdsGtHx3CbafiaW
         VvIATORg6cSIefG0oS8OxJ/xMp6SVYfI53K8diGLiFQtTBJJjhvD/K/RhGlmPB9qqQTD
         lRfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIIRLnYE40V+mUaPatLdSocEbnPNRzJMw1ooshgL7mDJ7n8aprcUgjIn6Prqovco7m2MMIy/0TO/qK@vger.kernel.org
X-Gm-Message-State: AFq9FYL4ybmhMsh+blEOeSgJxvaJh2Bwu7Se37hOqIXZykqkq12iwxcr
	pdNXxyUjFvIQlFYlttuL85ZxWHzRBIMneyRf6J5aUWSzLr/U0ennhL5n
X-Gm-Gg: AYBFou2HUZN1yvCb2hbufsnMtCDBthUk+Ih3KonVEr+C86XVtg1XmtkyjOABo1Y+912
	d9+oLvPWGJlUGfpTzzAbA95Mjf63nigWjQk5C1c7uWnaIBNzD4s7JT0TB70tTAvnZYLAjjIcnZf
	/WbpyHKj1DUCEeOKeMi8E1CxO4gaKJx0K3WhdY3MqExAfcRjxlu1/loen9oA4aRZEmn6aFWbzp2
	QtY40VOjDhXxeq9YJ9HmFRxcXX4wbN0nvY3pN0ayA7oApaIcaHq1dUYTBeym1GFZlb+2cJEvxRI
	2UncuRUiJ7YCpGVuTPQ5Y/bCi8tWkTVEkPJbti0jtpfc1H6Lfl0qxP3MSIudSX8L2yIUjhfcPNS
	3fRPiLflaeQ5DTK3TTwJGzh4HsUFzsj7pzKxrfa0wKllTB589FjhZveMy2C9QFWn+HqeRPwBzBo
	DpN01qppPCA61iEIJJxfaKJupKaX0KgrByTd7u30OFo1ZBNkCEdC1wh5p0gfF3P6ESGPxKAVAvn
	EqvH8s4rcMB1MO410Xlv+o2fP2Dsd4FwAAe2AnLDQInA9/QsAJiMW4oannuVZhFw/U5EfJrMdzB
	KZdEWYSqsjlL56Ofc0zhUPH8AuX9PHWUTTCUzN611FT1KLH9
X-Received: by 2002:a05:6a20:9e48:b0:3dd:a195:dd55 with SMTP id adf61e73a8af0-3e9023e52c4mr1537814637.55.1793178142953;
        Wed, 28 Oct 2026 02:02:22 -0700 (PDT)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21274sm3790062a12.8.2026.10.28.02.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:02:22 -0700 (PDT)
Message-ID: <116227fa-96ed-494f-805d-ff54aeef545c@gmail.com>
Date: Wed, 28 Oct 2026 17:02:12 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: imx952-frdm: support AONMIX MQS
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261028031608.4155958-1-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261028031608.4155958-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/2026 11:16 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Add support for AONMIX MQS (i.e. MQS1).
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> Changes in v2:
> - remove the duplicate properties with dtsi for mqs1 node

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu

