Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D292C312815
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785738; cv=none; b=FTv/hvfc+cv83Hk//CtNTvh9Z9oFlSIM9X8qFnfiliP00YkQlhmAYBvJTP6CXmt0Zj4FjfqtB07y77OOl3DmUjRnaDnyAEIaZ2P0SviT6U7ZtzdpaXtNtq143tH7CNUC+vZTOhm9+OOCnsjWu21o+1kwZy0HcOAbvU/lA3P6h8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785738; c=relaxed/simple;
	bh=EbmFd0Tfi7XIGnEjVIdD9hbEBtJUqdGWpGo27/LFtD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ut3RIBx2vnWEBpHzf4FNvLcWiznBHHFyP3c7YRSkbMpdSB4qiSTu+ycQk1Q+E+Qi49pdXQPM6Cx34AyffmdLzXgxJkw3Lea2zV1LbLdO0srFuTNKfpVqBMzfbfBm8HAL8jYZrE+LrRaMDzVOfyw8lZwrd14a43tj11elwHPAUMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzTQp74u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4oeQ+9y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzTQp74u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4oeQ+9y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673Gvn232393629
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 19:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GEmBlZfkkLSaQ1/YnkDoGRjN
	+kXC0cFm/yBC7NdS5jM=; b=dzTQp74uMWw2DQc8roZht2Hs6aOX8kzzanl5B6BB
	zYbBY4AqocfaQ+EYJhP/wrEriJMFIa3Ze8Y7Po6Tvo/t8i93U6hLS7Tx6LteJT0e
	dh5TqQsHrpGc46L8FneR/rxkxRciikayGGDHGn2ZBtdZZU4Sv90XNEdNJRGvX1tw
	67P1cBspFUN7hIdvcZH1MnaTFU5q8eBztrrCgm0au1k/S8ZNA42AMUfs5yMUKNhQ
	bHhHo/tjZDTemtLUyQyaRVovyIIXZiNVUSm+g7/b12c78VZ/mPi7nDhwDawgv5RN
	Z99nh1x0jhK3F2OUkImwTplhsbnXkz1t6JAPu+2VINXbSQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftwhds5rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 19:35:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bff5c7035so78965221cf.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785785730; x=1786390530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GEmBlZfkkLSaQ1/YnkDoGRjN+kXC0cFm/yBC7NdS5jM=;
        b=L4oeQ+9ymvk3kgoKMuCgCtpZdvxKBy+DIUOrEK4HN/yMWI8JWIGtUDBhy2IyE/RE8p
         hJUqcza+EGOwxKD8IouaeX5/GpzO8i6pUfLPZFKscUMlIqCyjcLai++cEE50Sn/PclGy
         opcS0Wsyc+H9lV1qiuicRnvP/K2l2xjABpF10LQByieQRNVfdZ/jvxYsMTxT+N9z008f
         PIE/gfylgypE1KmQyaifTUui1G6mTdwSxGBlDcgVUq9AezH1rf5OZdyLsOxuhA9MDBmP
         QiOEDFyJ6j/E8VWHLPQdLIDYOtirDRfwsjn4t4U+G4bNsPjR6fKWmJnPES41zFDb+Jr1
         W5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785730; x=1786390530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GEmBlZfkkLSaQ1/YnkDoGRjN+kXC0cFm/yBC7NdS5jM=;
        b=NHg4GZkURcCBqLsAs6RY/IlLUbi5ukpk0fpu7BQ0Jkrqvn8cB2nhTNo15h8ipWRU21
         oACDyjWjwql9CeWhQLXCwPso4wb0trwtPnrS6u+5tnCVXS2RmdHaOX9s8EHBnQTKmVvw
         q1qIAqL2qpO4l4m5n+7ZqsJCCtV4SCHewN6TaoQcwQujF+OTwyWepWCaJrSaAqO7k0Ae
         KPQ10nkf/HiJnYBLg4qvLKwCNtcmwDD9gowK+geN8GtDDCT5ChnCrYcEHzABkkzbhwFu
         YIK2X9wicanYz/kzo+7eHfERRzhFVgEbsaBjpcmhmHiajJ637B4skwpwfQV0rz1soWav
         Gt8g==
X-Forwarded-Encrypted: i=1; AHgh+RqMeUXljjHdgFIFmaJkD//Qmn8UkMXEup7l2Q3cHpbvBuiZSWB366/kuoNBAm5MPnM7OCSZYUt6vRVx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+BUtuLWh5r1EJLlHuMzyS1xeNb9Nuqsn0dPIB5qtDs0b1nx6/
	gx/bdGDxrZdEi6eTq/O93RmF52t8RSZ8oJcpS3pgLnicCfmJroaZdES90jcfgrzKJJzU4BD9LHg
	Q3cTAe6n7nJwAxz52izeeiKZYbqshHX0/Pp6KflbBR2+e/m6IDJY5w7f2pzDvx6tx
X-Gm-Gg: AR+sD10xsFpn6PFptllqpq6DRlIuUuF2oEtZFJcqGzHPF4gknIwavAzLjU3pytQNuh5
	hT8s1+eRHIqlAGfJeMPJkTDs86s+8+xFFFP6DumCyozkS63oRT/lGjENFuwqzLEb22TAsevnijT
	WejGLzv1JPo/1Z6XBU0W7ougelGyC/KcZYKBSiCIT+YIUwt0UDtqeb1ss6iBxOlckK6aG7wQEOu
	ThtLavEuJWleY8GSmtDezwgKy5du2X4SsHWyJwojF6ao+SvadqZuOT7VnXq3pjq5Wd7jX1f+B38
	BIoOENceWYa9gRpPHHhOx3ORYWg4pMuTDVFf0oKfVrjFT3Fnxnfz9Ap2Do3SbVItE8VR2wFTt/M
	5dLpSvrFLrsWJkDEzvg5ACp2YP04voXVUoIzW8hSQYuLI13nuhu0WlZE/UKPJB6nvdpM69iw//k
	sPVOQXCoIJyzNYhg==
X-Received: by 2002:a05:622a:4119:b0:51b:fb82:67d1 with SMTP id d75a77b69052e-52b5674b01cmr215463651cf.20.1785785730045;
        Mon, 03 Aug 2026 12:35:30 -0700 (PDT)
X-Received: by 2002:a05:622a:4119:b0:51b:fb82:67d1 with SMTP id d75a77b69052e-52b5674b01cmr215463221cf.20.1785785729578;
        Mon, 03 Aug 2026 12:35:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cb44bsm2166941e87.23.2026.08.03.12.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:35:28 -0700 (PDT)
Date: Mon, 3 Aug 2026 22:35:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to
 PS8830 retimer
Message-ID: <jx5iackeevtgqxycqbmctfohuydyarxxp4uqsu5dpihca5oc7m@gyyd6l67kzhx>
References: <20260803132753.994619-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803132753.994619-1-xin.liu@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Zf4t8MVA c=1 sm=1 tr=0 ts=6a70ed88 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=0xWNcfA51jHuHAl5ng4A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: VmDiYLqIiWX-j4AFnzroErIiraYuP-A2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfXzrTpt6un+SnV
 7SmHToFA19RJmJz/QThnSAS6irBHxIlLQ1QyVuZy+xQl6ZuoUewEF1CipmQeG3JvpUxSGpo4135
 YBz73TDAxMEEv/jmSV4QDSKvXA6FnloBKZhUGxoV4H/Sg80JRrdD8sJWRrkGaMBaGWBaTh0X6Oe
 OrudnmIlw0bNdcf7AMuSBS9A0UZtnlczWW9FbSmZbmTyQH3a5n/vXdqYgkOS6KcjaSqszJV9eMD
 rH7BkdFcdI40qXj/XjY84AG96lL53yABIwn530zm9AsJTP24jMwp0uEFqqqG6cARicMMFzby780
 0vwuy/CEbXgTczr6/o8/rw20NvOzI9dnhl4PIgecDDKdo7IPD9uIKRZGfI9HunLbCRJpnV2HVRD
 mxKVcIkn3eokEz9l1g9EngdGn9QQCFJle8J2gYLANU40AH9rgsVSpBf590Oie8KfKbW0i+by7i8
 0Rj9coiOj4WQpcApxAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX68+zeucsbhh7
 M0cuqiHHOUilFw91G7sOsoi1bsXoZyRRNKGOUcshuRBbwDvWrSo/FyfXxeHC5AK8bqO7kOuxwDy
 A6kx6fFkKtRuSvquJHd1ZA6qMxjvulw=
X-Proofpoint-GUID: VmDiYLqIiWX-j4AFnzroErIiraYuP-A2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030172

On Mon, Aug 03, 2026 at 06:27:47AM -0700, Xin Liu wrote:
> The Hamoa IoT EVK hardware design uses a Parade PS8830 retimer on
> I2C3 for USB Type-C port 0. Describe the retimer and route typec0
> through it to enable USB 3.0 SuperSpeed and DisplayPort Alt Mode.
> 
> Supply the PS8830 from the existing vreg_rtmr0_* rails and remove
> their stale "Left unused" annotation.
> 
> The FSUSB42 SBU mux chip is present on the PCB but with all signal
> lines unconnected (NC), so remove the fsusb42 node and its pinctrl
> group.

Why is it still present on the PCB?

> 
> Tested on the Hamoa IoT EVK:
> 
> USB 3.0 SuperSpeed at 5 Gbps on typec0
> DisplayPort Alt Mode on typec0
> 
> Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
