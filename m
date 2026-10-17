Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F67F33B6EF
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 13:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792244671; cv=none; b=ZpJ+tP/bV9nKgdEDO56SQSFgOTyGBon3dq7gTn1oTX4HjLEah9hC2m6YyYb3DOiOXB5ZgZPaKEhFmaRnYU5cTiRPXwqXeHWYWzACto0L6qIQ2Td5RYMIUGoPscy7EQCarJnzmJ4hK6EuVVu38fu/ZthanZL7CpJko0oZk4SHbsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792244671; c=relaxed/simple;
	bh=4G6HjC3OFMtDJN/ek0zU5CdmbYoC3FuoWdTCSbDnxac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sk9oDAPy73zuCKfduYUxE1MusVnx5F331KAmoUWN3Lvn7iRFj6H8OUBIFW+HyovjdeuHXPNER7M47MfK4s8QiSOfAceEBOJPvkIKQD4z3Jq1IUOsRbT/XC1cDSFr9KxBJQnuU8OnIUygYbngUOtE2Jo2AiovK6ACAicIo12OGS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mmj8a7+U; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mmj8a7+U"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df4f540ebso334999f8f.3
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 06:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792244668; x=1792849468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7zGCtE8QeIQktHUrqda/mm6sfjzhY0f9C7ySnIw33io=;
        b=mmj8a7+UjYp3L8aHicsuLP+87SnLSHyFC6vpgDb9i8ypaA6yv+EhnvfVnB8wjlGgc6
         Wr08N6hN22Wdn8MGuJpsuauK7UmOjR8XxovLRaZb+KgNy5lB9cgPqf6enLn4hfCtfwOY
         mYQnGA96IpOOSoYIsVww83azNriv+bypFTSoLou3IRyEOROvZAR9y9EbieBbO9dJn03S
         9bIDd34AhYX6t4lmjdjkILoXHqKxdSQnqEMtXR4xU5ulSCY9lnyOEyiSuaDUR21R93Op
         NIw0di+Ad9sAHKRZ2NaRhVSSOGwJyp2h5jxnT+hpVw+a+jpVtnqok/cQiFrsv1NxzvJ6
         tvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792244668; x=1792849468;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7zGCtE8QeIQktHUrqda/mm6sfjzhY0f9C7ySnIw33io=;
        b=0FMaMEBJ7MJI4U84wikqrowvdhcOrTFiIutxeDk9SGVKRAhvBcTBVkLTSpO9IIBeXr
         aL15+kr2B6RsoefzugCzgkuSMEEiEA7DHQPpVRGxG2G1ycmZNLjtPA62V01abC63JYxj
         /86SziBhwK7Ruqa72vmwE7PFW0RbuHldvrxBTcPeacbv5/KoUi1txawMA/7I300Ag8Bo
         9VRWSVtbEza44TvCq2e7txwDehDAjBw/IK6GzLyWokT2Xm4J1tkSrBf1z3PkutyzTik1
         LPwEQ9ZKo1WdrEHx40uYlcypGx73gj9Nt4wTjMY6K/nBzR4M2BZ42c3WibxnEGtkzgde
         EBHg==
X-Forwarded-Encrypted: i=1; AKwUvBw8ZD506DYcd/RrLmXqvixQPuMnzXrrlPDpYgS8SBLjGgd1rMec+LkUY5Z7UTRPiM0KGgj7aAo/BabA@vger.kernel.org
X-Gm-Message-State: AFq9FYIiSnUWgTKH4oADmuelhtQFmo7OCPMt79MaoO5g7ggjaGKFylSn
	IykPP32Pr2MeCOV8RsF7olAvgjwcDgzgZ/U4aTCqZ2OrcxLekOmrZLy/z4R0elsLiZU=
X-Gm-Gg: AYBFou3T7UYERZRIVap+IWliSyZ4rkGXGnqPLaOkStKo1gsWyJaYm0cmnHc1mxtP0fA
	gAEbFSNAd8eg421HSx1mrfSuWL4J+iqMY9SwG7/2NxCbEZfj1h3hg1Y8RNwbkO9rPa1ttCCw0pb
	hdr4Eui8+ktMi5gHWb35hKL5OQi/VlC3A+vUxgHJSRB/htMtWbPC9fevKAM7UkQV+i2tA4l4V+f
	HR2voAbMhv6+QTh2I0ig4wwSj5fu8/gOqoqMNRuKHHpBPMyi1phriOog2S9OhY5GoZ3fYWFAGJR
	Cp66mX8pccXcTQM2t85C0IW3UwMdC9+5q0Jz9xYqbedUGofUb7GNAg2RHHQtwXzkYiN36QrR9zA
	uKzgY2pukGDf+RtThobfheMS+siByfD1NSmWIXJAw8FhbjDesG9kzdqauzWHEG9QQV+kv0bqGop
	IFWkTWmgN83JTFzqmSS+ZSOw4235TVonOAIKwKthdbtJSLpOuCB5oh7XmyytQUFg902TMy3Gsgr
	ibDk5cgnnv8
X-Received: by 2002:a05:6000:468d:b0:48d:f39b:83de with SMTP id ffacd0b85a97d-48e07b92058mr3310171f8f.3.1792244668447;
        Sat, 17 Oct 2026 06:44:28 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.131.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8d1esm11547094f8f.39.2026.10.17.06.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 06:44:26 -0700 (PDT)
Message-ID: <c3608c29-a20e-4b88-a060-165116d2b6f7@linaro.org>
Date: Sat, 17 Oct 2026 14:44:24 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: configure C-PHY in the new
 csiphy_stream_on()
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, david@ixit.cz,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
 vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
 jigarkumar.zala@oss.qualcomm.com, hariram.purushothaman@oss.qualcomm.com,
 akapatra@quicinc.com, linux-media@vger.kernel.org,
 krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
 konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
 alex.vinarskis@gmail.com
References: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2026 05:05, Anusha Arun Nandi wrote:
> +	const bool cphy = (lncfg->phy_cfg == V4L2_MBUS_CSI2_CPHY);

suggest is_cphy

>   	s64 link_freq;
> +	int i;
>   	int ret;
>   
> -	dphy_cfg = &dphy_opts.mipi_dphy;
> -
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, false);
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
>   
>   	if (link_freq <= 0) {
>   		dev_err(dev,
> @@ -346,23 +345,49 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>   		return -EINVAL;
>   	}
>   
> -	ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes,
> -							 dphy_cfg);
> -	if (ret < 0) {
> -		dev_err(dev, "Invalid config for link frequency %lld\n",
> -			link_freq);
> -		return ret;
> -	}
> +	if (cphy) {
> +		struct phy_configure_opts_mipi_cphy *cphy_cfg = &phy_opts.mipi_cphy;
>   
> -	ret = phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
> -	if (ret) {
> -		dev_err(dev, "Failed to set phy mode\n");
> -		return ret;
> +		ret = phy_mipi_cphy_get_default_config_for_hsclk(link_freq, num_lanes,
> +								 cphy_cfg);
> +		if (ret < 0) {
> +			dev_err(dev, "Invalid config for link frequency %lld\n",
> +				link_freq);
> +			return ret;
> +		}
> +
> +		/* Set data trio lane positions and polarities (no clock lane) */
> +		for (i = 0; i < num_lanes; i++) {
> +			cphy_cfg->lane_positions[i] = lncfg->data[i].pos;
> +			cphy_cfg->lane_polarities[i] = lncfg->data[i].pol;
> +		}
> +
> +		ret = phy_set_mode(csiphy->phy, PHY_MODE_MIPI_CPHY);
> +		if (ret) {
> +			dev_err(dev, "Failed to set phy mode\n");
> +			return ret;

We already derive the lane positions and polarities in the PHY driver. 
There's no reason for the CSID block to know or care what the polarities 
or positions are.

drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c::phy_qcom_mipi_csi2_parse_routing()

I guess the PHY already knows the polarities and positions - or at least 
knows them for the DPHY case.

         /* lane-polarities: optional, up to num_data_lanes + 1 entries */
         memset(lane_polarities, 0x00, sizeof(lane_polarities));
         num_polarities = fwnode_property_count_u32(ep, "lane-polarities");
         if (num_polarities > 0) {
                 if (num_polarities != stream_cfg->num_data_lanes + 1) {
                         ret = -EINVAL;
                         dev_err(dev, "clock+data-lane %d/polarities %d 
mismatch\n",
                                 stream_cfg->num_data_lanes + 1, 
num_polarities);
                         goto out_put;
                 }

                 ret = fwnode_property_read_u32_array(ep, 
"lane-polarities", lane_polarities,
                                                      num_polarities);
                 if (ret) {
                         dev_err(dev, "Failed to read lane-polarities: 
%d\n", ret);
                         goto out_put;
                 }
         }

         csi2phy->stream_cfg.lane_cfg.clk.pos = CSI2_DEFAULT_CLK_LANE;
         csi2phy->stream_cfg.lane_cfg.clk.pol = lane_polarities[0];

         for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
                 if (data_lanes[i] < 1 || data_lanes[i] > 
CSI2_MAX_DATA_LANES) {
                         dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
                         ret = -EINVAL;
                         goto out_put;
                 }

                 /* Convert data-lanes = <1 2 3 4> to bit positions */
                 csi2phy->stream_cfg.lane_cfg.data[i].pos = 
data_lanes[i] - 1;
                 csi2phy->stream_cfg.lane_cfg.data[i].pol = 
lane_polarities[i + 1];
         }

---
bod
