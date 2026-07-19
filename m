Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B42380FD1
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 23:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784504545; cv=none; b=u2GUWmm5ETcF14W8aGa/R2rJZ3FHI3ZYSkOKCRzJJTx3ONPneqNYoLGD8u5GPnRbpmxYBf7dRqmEWDBHcke+bkMvX81VR6OaGHijvSmEGEIKragpqtmvvanlRz8uTTPCh1JgUcQV4/OXHPo8LU54gGX1IVj23jiPG79r4UJgDGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784504545; c=relaxed/simple;
	bh=VLKJ7Cw/L3FcveIqR2Y8pnZFxRpkCWbmrLEP6fQLU9E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sK40pJwgWzs7bPICoXbGzCNduZFSPeQdtPRBzVm6519TUejAktRpO3das5IeFyxesMvidyMlUivsjN5asVGkD24kSyjx/Ou7Z4E+U6JrHM5pFDnF4Pwzl70Z6Ynu/jwq8s8ztZQ6aXvZuHS/h1iX6virciK6vbXj1G/4rECWkwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZ//xLOz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NP6iBFqj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZ//xLOz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NP6iBFqj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JKRQxi596526
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 23:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ZIZEKnDqZXaj9DB5xA4pXkP44DXgaYw4bSJuLwXzYo=; b=bZ//xLOzn+TGYlzj
	TOpNaSDzi6SOqYyUAoiEMEahAmFDRgqitfMvdv1pNKXeStfE+Yg6ImDjleiicZDV
	5rOW0P3FLSCuweBi2ZqzXn3uoxdHPzC8S0wg0KplfZxuKJIwLIiv43Bs6ark3JDJ
	1UjFAGk1aC31QXutk7Pwj2s1APKL1YjgNuMBlDxJB4wg2eY+LHL0i7W7n9NU2g4K
	8H09vsFWNdkYiX2gLtycVEYp6vtqEwo/4H/GsGB26PLfwahnggAU6AQ32fGiaWwi
	hZFdmDYvEnzk/ZPMd+FOdfo5XP6JVfI9drHsIiahYGeHt6SSiSF32h8BUfHER3nK
	zjsYZA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2d93p4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 23:42:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8482b95574dso12356734b3a.1
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 16:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784504542; x=1785109342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ZIZEKnDqZXaj9DB5xA4pXkP44DXgaYw4bSJuLwXzYo=;
        b=NP6iBFqjX3lSUBoti7IQ3E5TXfytulAtC8lL2D94fdamPnQ5+h4GkRDlbjH1CLt4Xi
         uV7WS9RfLU9pukWxQj5SmSkowroyv8pygfjJfjqWrpgKwVXOUT1H2G6gZFObYHv5lY5I
         Std7OsUwlT7QzBdwPFK0SD42aPWp30DEERvOWHjgGfrJbDWAJZxZc+w8wWn+faKDeLSp
         Ov/3HDQjLt3XCczIzUrTP8JpCKZ7R97cv1G1hutew21x2DakW3tPu5L16LGrgq3PI8JY
         TYH44NBFL9hEW4bwSK1909PX+qT6wJnoCVaTP5XPwwOnqJGW+7pi+O1uHvOW9evojvmT
         dYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784504542; x=1785109342;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZIZEKnDqZXaj9DB5xA4pXkP44DXgaYw4bSJuLwXzYo=;
        b=qu32sFXrCcqtpBjQts9XkIoD9VXt7eUPa4bNUb+Oqowgpn33+CdiK/G5yjj5DkdIDa
         7oSuMUrYOWaC5XIrNHQrdG/NHj3K4KNemYQ/+1fnpSryXLdSAajnwu6xn988sQDqs/Zu
         1K/zO+EWWdb4XOSrhqcY9vhG6LDZObG+PDIhjrBUZiYFgr5dnIRpA8cS7Y7PDUTSl0+J
         YkdWE9PpAn2q/IeXv/JuB6xlWwwy5NOr53e3hs+ExUGg8VivqoJRzimx7uCML6DBk3eR
         tgu8YQDODBSscIJK1bVC9NN1BjIj/YA92YucV1SHKPsOrYo8f6yac3L3MrerMOILPPZg
         WlCw==
X-Forwarded-Encrypted: i=1; AHgh+RpOa07tWd5WqcA/CbFyan9vHnHg0cgDvwfryYrWZmkbyRm8bUtKierZe0/0gqAhfKNxQ57nX+RID+ZY@vger.kernel.org
X-Gm-Message-State: AOJu0YzMxx6id+dojA7tic3YfVVxg1+PmEYJVRa6LJbyDla/1Q6YUIVx
	021TdRnVY7WFnOlhZsuZmve7bQatTxtDroYw46EJf0d/6+3J3wr40LEKbkRbTmJD/AtjMjWQVaX
	g+q4FQ4a+qz18sy3l54STwGP2+PLNmgNN0MkZI7JqbtUk3HuJoYoxXaYe4x+kY5BS
X-Gm-Gg: AfdE7cn4+bliwbXXJ8UQK9uJ664va4zX1Y+1SpPashSYWOdC0fNKC7bmhTxIj7SUng0
	tSiLvVhlS0Cw2DUWtBAnvqxBmH/5H6nMOu5/yEM0r9VAcsDEhJ2tM0JZTIfoLhW3sWdGrZg7c79
	/RJ+Dd7hwAdPqZjp6NmnLAz8TiDN6pCGnrnHVtndIG5eljwq3OSuxEs/HcECZpWSLYAQfaLNtsy
	QN00v3BwJ0+mvUQZZtIeEgjxc6/HwJufXEF6BHTrBGreubuVNQ9OdRzKEZ3h5LjL8cReCjuBVSE
	si6Q7U/0OTgVq7hiGmqC8L1pe80n3xYCHoVk1gyTl69DuyYskTn0rlqucayT/5hETcYtuSfEifP
	CvGST378zhGidgN7b
X-Received: by 2002:a05:6a00:194d:b0:848:559f:1450 with SMTP id d2e1a72fcca58-84c295835c9mr11828556b3a.74.1784504542187;
        Sun, 19 Jul 2026 16:42:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:194d:b0:848:559f:1450 with SMTP id d2e1a72fcca58-84c295835c9mr11828535b3a.74.1784504541722;
        Sun, 19 Jul 2026 16:42:21 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adfdfe9sm4617809b3a.27.2026.07.19.16.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 16:42:21 -0700 (PDT)
Date: Mon, 20 Jul 2026 00:42:18 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "David Lechner (TI)" <dlechner@baylibre.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chris Hall
 <c-hall@ti.com>,
        Patrick Edwards <pedwards@ti.com>, Kurt Borja
 <kuurtb@gmail.com>,
        Nguyen Minh Tien <zizuzacker@gmail.com>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/8] iio: adc: add ti-ads112c14 driver
Message-ID: <20260720004218.4e010404@jic23-huawei>
In-Reply-To: <20260720000805.41022604@jic23-huawei>
References: <20260714-iio-adc-ti-ads122c14-v4-0-25f8e3084485@baylibre.com>
	<20260714-iio-adc-ti-ads122c14-v4-6-25f8e3084485@baylibre.com>
	<20260720000805.41022604@jic23-huawei>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HpxG3UTS c=1 sm=1 tr=0 ts=6a5d60de cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=IpJZQVW2AAAA:8 a=wGoPyE8iD8i8cuqfmxkA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: xx6c6Qn7JrotOREs6KqVhAfoE0vH2oZz
X-Proofpoint-ORIG-GUID: xx6c6Qn7JrotOREs6KqVhAfoE0vH2oZz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDI2NiBTYWx0ZWRfX8T2DrIVhIaAH
 PnT841Ss1FjPAnKjge0K3PyBX2ivGB+qgy8dN3tALyR1sK2VLUAOyV5QzxG+UgsKfUHBsaxMfyh
 0+nMw4JlxdFZ80Zegi8F53SM258jrgbPgr1jirGdylc8iCNK6QOuw+tcpqBWf/GjmfOQQy+awl+
 9amK0INfNdF2u3FLkAi/2ATToT4uhcEHv3gVRVGpPWtQfWOaz4XDppXIgMTNVau6vBd52jQmmD6
 qlVYoM+KrxO28S4QI6/UDvLKaC18n2soLkFEKXdLOTj43ObAO5EtV1UzGjAcxeIyyLi5GjpM6hU
 yIhfrQs6sqNugPM48objG0ge6cuf5R4hzY4+qZZ34chcobotbxpVWugr3P8s0I8kgWkAy9DS2aH
 1l43zD/Tk3BF/frPKynbxt8bEM52nLvEKhC1gO5JVoDDNfSgpkUhFXbXvoIho+BbVp9TuCnVdpn
 0qNSOtNTGymrKpw9TsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDI2NiBTYWx0ZWRfX85L1XsOwFV91
 t5szbTR1WlGDiRLR529d1qAdSki1JpwAUnjAAOYh351lR0Pd+GAXsD3ZCwaZj2Jm7HdL5Wrw+8C
 gW0mKV7ENii5y0IZYyLXXag1KnK3CM4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190266

On Mon, 20 Jul 2026 00:08:05 +0100
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com> wrote:

> On Tue, 14 Jul 2026 18:21:28 -0500
> "David Lechner (TI)" <dlechner@baylibre.com> wrote:
> 
> > Add a new driver for the TI ADS112C14/ADS122C14 ADC chips.
> > 
> > This first step is adding a very basic driver that only supports power
> > on/reset and reading the system monitor channels.
> > 
> > ADS112C14_SYS_MON_CHANNEL_SHORT is the last channel rather than being in
> > logical order by address to keep the voltage channels together and in
> > case we find we need to add variants of this channel with different
> > voltage reference later.
> > 
> > Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>  
> I think sashiko is sending us on a wild goose chase on this one.
> 
> "When ads112c14_single_conversion() calls i2c_smbus_read_i2c_block_data(), it
> returns the number of bytes read upon success. A short read (e.g. 1 or 2 bytes)
> would return a positive value, bypassing the (ret < 0) error check in
> ads112c14_read_raw()."
> 
> An i2c_smbus_read_i2c_block_data() response doesn't contain a length
> unlike i2c_smbus_read_block_data() which does. 
> 
> Maybe there is a controller driver out there that messes with block[0]
> rather than returning an error on failure to do the read part of
> the sequence. I checked a few and didn't find one.
> 
> It might make sense to make it clear this doesn't happen by
> adding checks in the i2c core.  One to consider after the other
> ones on my list!
> 
> However, one small related comment inline about keeping postive
> return values meaning success as local as possible in the code!
> 

I'm having a perhaps optimistic go at tweaking this to resolve remaining
tiny issues and avoid need for a v5.

Tweak here is:
diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
index a69c595ab518..bc0fd6839b72 100644
--- a/drivers/iio/adc/ti-ads112c14.c
+++ b/drivers/iio/adc/ti-ads112c14.c
@@ -322,9 +322,13 @@ static int ads112c14_single_conversion(struct ads112c14_data *data,
        if (ret)
                return ret;
 
-       return i2c_smbus_read_i2c_block_data(client, ADS112C14_CMD_RDATA,
-                                            BITS_TO_BYTES(data->chip_info->resolution_bits),
-                                            buf);
+       ret = i2c_smbus_read_i2c_block_data(client, ADS112C14_CMD_RDATA,
+                                           BITS_TO_BYTES(data->chip_info->resolution_bits),
+                                           buf);
+       if (ret < 0)
+               return ret;
+
+       return 0;
 }
 
 static int ads112c14_read_raw(struct iio_dev *indio_dev,
@@ -355,7 +359,7 @@ static int ads112c14_read_raw(struct iio_dev *indio_dev,
                        return -EBUSY;
 
                ret = ads112c14_single_conversion(data, chan, buf);
-               if (ret < 0)
+               if (ret)
                        return ret;
 
                switch (data->chip_info->resolution_bits) {


> Jonathan
> 
> 
> 
> 
> > diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
> > new file mode 100644
> > index 000000000000..a69c595ab518
> > --- /dev/null
> > +++ b/drivers/iio/adc/ti-ads112c14.c  
> 
> ...
> 
> > +
> > +static int ads112c14_single_conversion(struct ads112c14_data *data,
> > +				       const struct iio_chan_spec *chan,
> > +				       u8 *buf)
> > +{
> > +	struct i2c_client *client = to_i2c_client(regmap_get_device(data->regmap));
> > +	u32 reg_val;
> > +	int ret;
> > +
> > +	if (chan->channel < ADS112C14_SYS_MON_CHANNEL_BASE) {
> > +		/* Not implemented yet. */
> > +		return -EINVAL;
> > +	} else {
> > +		ret = ads112c14_prepare_sys_mon_channel(data, chan);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret = regmap_write(data->regmap, ADS112C14_REG_CONVERSION_CTRL,
> > +			   ADS112C14_CONVERSION_CTRL_START);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_read_poll_timeout(data->regmap,
> > +				       ADS112C14_REG_STATUS_MSB, reg_val,
> > +				       FIELD_GET(ADS112C14_STATUS_MSB_DRDY, reg_val),
> > +				       1 * USEC_PER_MSEC, 100 * USEC_PER_MSEC);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return i2c_smbus_read_i2c_block_data(client, ADS112C14_CMD_RDATA,
> > +					     BITS_TO_BYTES(data->chip_info->resolution_bits),
> > +					     buf);  
> With all that stuff above about this not returning short, I'd still be tempted to do
> an if (ret < 0) return ret; return 0; sequence in here so we don't propogate
> confusing positive returns beyond where we can see their source.
> 
> Having done that make the outer check if (ret) 
> 
> 
> > +}  
> 

