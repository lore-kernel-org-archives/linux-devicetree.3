Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C0448665D
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549825; cv=none; b=PsbGnE3u4CJt+MS0tm8JhMD7uJgl1WFkhoP281yd5gSeNP3mRClRK3WPIT9/Lc1SOzwk1D1vGDHIHQ3HrU3yfLxmpuivLTKFALHZm2Z2vGYQNJnaNe4t06C/RXqM7pATnAHauAe6mLkPzgM7Gnqt5XBMF6ss6A+USifO4bSM7Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549825; c=relaxed/simple;
	bh=X5pF3A7h9wkn5uahSdbhngWdpSiTYJvZ0s+iTq5H2Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKrvHZBTafryxPUuIu0xp3Y+sMRSuzcMCcBzMuqJagEUsqAgh23m7kZOWoGxdJwiXd4WqneuRlsSRRe3SV25ID6OKHhSv1NLXmKpX7ZRktLGvz1QrjGkfV/VjeaYXFINOEgKe2cVvzs3Trn6YjZ6pAta1+nr8TzMnAjZieuEM3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f10QwLbF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VSbSh0fv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f10QwLbF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VSbSh0fv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G932021587167
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1NmUklAtL1cxikroewbZT51l
	w6No/wycIXEfydBGSgE=; b=f10QwLbF6UnpDxNXkivB2+dPWQB/yGSJ/BpBsQb2
	hXEbWSuCbmn6g5x++ILtUj60VR/hPD9AaCTCgEnbTFuvNcfikaFCtTrhTOoAzTs2
	FYoIyW/c8mb7l2P+PS8tJfu3vrHZcVe37p8m+6udDzPVpMcya8tnakA/i0msMUG+
	lvmr3RCoP6cbl7Fc0kecAfnr6g1VWcJKSRr++OUi6E8pW4m4vX8oMSzKudX3Wu2S
	f7R44FWlBGdlr//8kl7ZC3PbNjt42203ThqDvSFKXIBkO3qKxeZTMJYrOFVdM6Ci
	hXFfRZkFo5P7ME6uebfnNZ43uRL8QKnVkwMjsRPU+P/4wg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqageke7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:10:06 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8052a85c504so4124539a34.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 02:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549806; x=1790154606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1NmUklAtL1cxikroewbZT51lw6No/wycIXEfydBGSgE=;
        b=VSbSh0fvW0EcxbEPw/6nLOt8En12aKfyWCsExMuW8dM46XeTaX7nNWbbjOJhIE+7Yu
         NpSTuMFNfB6tmcDj4v5uik2RM9eWgJX9EWv2P0uizItAvWs3R+f2JWoUzE1NfC8RoEtP
         +gkQRZkKtmZN/ewJcvb2qT6OtN33IPvhzeipk7EV8X4cA+ugC9aX1BjcDxTkI8BUVaqX
         NgZIa8U7uKkp2zkAZqsso3lyK0QLbD+TxyCTexh4WK6DiGZzcN8nSPwreR06+scgJgci
         lDlyjFT69ksdSxIbuChxu0ONDYCZQwfjFvm3M2QO2bpLWqDOzyQIGTK+qJA3EyW7YTx6
         NPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549806; x=1790154606;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1NmUklAtL1cxikroewbZT51lw6No/wycIXEfydBGSgE=;
        b=JeAdHOheHdZ17sCHg53UnnRF8tfh3Sp1dDGcEUAREGlpMECSNjsUjWt9yuuYg78psP
         7V+v2U/Qz4UwvL5s5oo4N7sp8paTeZS6ODdb7FskONeyVC+5MKf4ePKrzyty4eCzm549
         oTHZ8O56uP4E9FYOsKeUuivivrG36kQfPmBsISzaLpSzgeQODnZOlQVXO5LX3ozb7wXV
         2bpE9vk06JdcBAVsa5dhnl3FseGC6QMTKS2+Razsy0OVPkuwFGlUBv1DSgyWlkRrxbHg
         s3ceW+TRj+3X5NUV0HgyDZNvX9Ous1FeHWLtlXSzbaXdBfbMUnQ+F2uNPWV+dZBhR/6q
         fu0g==
X-Forwarded-Encrypted: i=1; AKwUvBxIwFTPlYxRz0JyZHvaFAvlqXfzBygOTLbAUVRr1+fAHDHIIJs+aAk7xqFtS5mwQiA6YuL6zGHmSokZ@vger.kernel.org
X-Gm-Message-State: AFuF++niryNJIZfBN8xgV35YTjQoVEVD01Bky14ahFaYNuNRn7KnMeLJ
	MHKR7o+Gwdlt6SsGRgxRmaOGCSTMPDmbn1k+Cwi4aCe1i13KB+Q95LZ65qhun4RTUwOnrgVcTOx
	G/Mn8cEnjooU/1dt8nO7sZYd0hW7Bdlvr23Gl3c/cQn2BoNxpE+zE3nHUmaXUI2ri
X-Gm-Gg: AYBFou188QcQhcnQWD9tJNq96AT+bmztgwoR4YpUC86mM1la8mKKa0B0TCEfp6okx85
	KGPICrkZpjNoonyZWv4YNtnuP+3NC64/nylb+mHe4xekrmUSOoc27e6MscG+2a84XsVn2JWl5Vj
	9UQi8nssGnUMEunE8ivf+KLlGFuTca0YkldGPpAEgx7q+8463DXDdn4/F8jqOTic2ZTa9WeUO7z
	zx1HwjgGRF2YxzZjx7D7qDfN0aZGWH6ZIf2zzCLj2wr8ggoMc2b7QvzPLCqZp8zSrxf9WMn+OPv
	qRvgZj8M2SUuX9b2md3xCIo0L8kXYb9eRa3XLmmHe82xevKj1NDYiDzcgF93jV4lOwqDTVCxR/5
	iw+rneEIgSNZvGjb+6KRhEi23rwqPd3u252Vv1g0aWGQ=
X-Received: by 2002:a05:6820:180c:b0:6bd:e592:2c74 with SMTP id 006d021491bc7-6c7d45ed069mr1787752eaf.55.1789549806222;
        Wed, 16 Sep 2026 02:10:06 -0700 (PDT)
X-Received: by 2002:a05:6820:180c:b0:6bd:e592:2c74 with SMTP id 006d021491bc7-6c7d45ed069mr1787671eaf.55.1789549803916;
        Wed, 16 Sep 2026 02:10:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad9ed5sm6791317eec.22.2026.09.16.02.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:10:03 -0700 (PDT)
Date: Wed, 16 Sep 2026 17:09:57 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: nord-rrd: Add sound support
Message-ID: <aqpc5XuF8U-m9zWm@QCOM-aGQu4IUr3Y>
References: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
 <20260914024003.120931-3-shengchao.guo@oss.qualcomm.com>
 <d2d2feff-4823-43dc-9014-099e69195280@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2d2feff-4823-43dc-9014-099e69195280@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX1cupDxdwRKyU
 d9sIeTN3U/NCe1FHbYw1nRN8x2aggfXSEaaPoaqPGBMuncnld4bfKxt+BLK+n10fXwQ8KgePFlm
 CljBDybS5LX9s4wxuThWIFY4V8pAFSI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfXygBhG/7xXdaJ
 U/6ggTRv2Qr0FODS1XFaTXGUeHINb5KA487Xe9BRGOmg4QUNKn1ilnQGZ7EFTPj3SoPnwrjbncn
 yKJovMd6HOpICO4PReqyu/DKlRC4n8NZOIDvv0HhwdAH17AOidRq/M6QfBKMLZTYwnGz9/6OHrb
 ax2vz0O09npplDEOsxDGNOCiWBqlQI57ZissDWQ1OxwKENbCfFZROQjmLuYQO28Vu/Ss2S8Xb2s
 dx1CLSIpD5xG4R5Cl8OKEHG6F0Qelca/auqp1Ge1q8dQDcmNaz2SAwlB3E684gKKwbkVYYvv0hU
 ZMEinjuGae5C10Qa1grM9Pr3+CbuZItBf2DZlseA5jmRYh5jZJXMlaJwAJDj2Jhm7BX8Y84yO3Y
 bYFFFYCsRtY2uqgOJWr5X1rJnMss7QScxumFVhmqiBV4vnz70ZgwtoPKVKtDgD29tQmSRs8xDL8
 O4Swg7iFJv6u0Y8dF1g==
X-Proofpoint-GUID: xB_C9lRcAIdAszdcuQE4ab0RiVOvWQnD
X-Proofpoint-ORIG-GUID: xB_C9lRcAIdAszdcuQE4ab0RiVOvWQnD
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aaa5cee cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=K4Jvm2uu9IkAFHIyoRwA:9 a=CjuIK1q_8ugA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160118

On Mon, Sep 14, 2026 at 11:01:36AM +0200, Konrad Dybcio wrote:
> On 9/14/26 4:40 AM, Shawn Guo wrote:
> > From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> > 
> > Enable audio on the nord RRD board. Add a soundcard node using the
> > qcom,nord-ride-sndcard compatible with two DAI links:
> > 
> >   - PCM1681 playback over Tertiary MI2S RX
> >   - ADAU1979 capture over Tertiary MI2S TX
> > 
> > Add MI2S pin mux states (data, SCLK, WS on GPIO 73-76) and the MCLK0
> > pin state (GPIO 99) to nord-embedded.dtsi so they can be shared with
> > other nord board variants.
> > 
> > Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
> > clock supplied via MCLK0. The DAC control lines come off a TCA6408 I/O
> > expander on the same bus, so add that too and hog its dac_enable and
> > click-pop-mute-n outputs, both of which have to be asserted before the
> > DAC produces sound.
> 
> Sounds like something a driver should ensure?

You are absolutely right! We will try to control them from pcm1681 and
simple-audio-amplifier driver.

Shawn
