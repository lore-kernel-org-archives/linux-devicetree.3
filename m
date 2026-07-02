Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F8046AF3B
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 11:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993129; cv=none; b=BvlaBekyaS6mWsQ6osiah9hDWeyZ+sUQRMwGz40Xw9x8P2R35eqAM2uNA6OIJXtHnm5fAz6FX4wdLICC5IzsI9bl23uNSibYdIdADJyDAzotd+CMjZ5mV+S6p+wwkxW0oNNVlff/IE3yM6gUw93962nUh1UOp8azGKBEwDRCH8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993129; c=relaxed/simple;
	bh=7pAg0jHYHuUcvs3UsZmIL/gUh1l1YnY4i3xBryoUv7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KiPXsTizykhEoAOmkLfHEnqv7D8zwmfVNC1FF3m56ePmJuVm6loN8SrG9bHUFCC2/kADxxjOOAR49CP6gR/cA/0W72dicMQBosZiC+bpDry+V6gSw1nmdgUL+/+hrHWp27xxpBYnC+QougJjVBoOy4uwpPhlrtrtg0Ss5lggI7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OgOePJyo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i+PBQ0o8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OgOePJyo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i+PBQ0o8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629nPhr4139534
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 11:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tjHvOWDz75WdWM4Imt7TzKxF
	FuS5SqBe2+zuwdMJriE=; b=OgOePJyoMIZ/VDua4SiojQF2imHp7LP6Xtx8e6wl
	Ra+cKAhe3DSNmj5jNcaACAQWAmbu0QbnljDOh7bP++YTzl2I4jiirPcB4cyqBU7o
	Slg10JMNPBjPR7uA4F8AtedL1Ttbdgjf9YfzpQT3SBkK+9q/B6d6gSqBZR+FxnL6
	2hK2hXhRDJmQxbm1ogX9Ux7ayd5EKnuwi2wc7Qw1D5g2m9cY6THV8BbMDOnJHKJh
	CA53ewPkycYB1ukaMqfvYRzewGW4x5qKUKAV7Vm3mQAjo/1mQqFj9TXgAxwQZJv1
	sVMNwVjaf8GJks9hYqcQoyGBy9i1FHxoeaQgvn9oRFI7AQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npr8e80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:52:04 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bdc8169a8dso1770863e0c.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 04:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782993124; x=1783597924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tjHvOWDz75WdWM4Imt7TzKxFFuS5SqBe2+zuwdMJriE=;
        b=i+PBQ0o8ea9yXSthi4iRTg/KQGQ5JsVptqlF2qSyMVb3AaeLkimWmzQRZypes9zUVn
         UDa9lYLlAYlDRhbJAtWt10uGr2GP8tDhQkAUejP21NDJAV09jP/B0O8FX3jmJg2IF+8j
         G93jugrx1BusDpQKhXILPxul9OF/cKT8MrDhYuOSRbmuagmLcKlhq1sOHxufUjmQAi8T
         4CnGL8RBNfreaO4Yg/BFhTx+K1MWYizCB9j+PByoR+AXs55+HQjdGi/v4d2Zuw4sgAHy
         w6MWD0roUEfExp6bgY/E+mg9mLUwSYCbtl/y67CpYtVn084v9xqIy7xrWgk1zWdv0hIv
         qafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993124; x=1783597924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjHvOWDz75WdWM4Imt7TzKxFFuS5SqBe2+zuwdMJriE=;
        b=SNC4hqi0DA1w7TvxIugD7h2beSwe+HdeSrEDqh53Gr363LaJBU0diuJrdbENTpLHVr
         vuW1wqhc7U4U6hHGcFSIYcHGQdRdVGfdXdJ3audeBTHI773sRu959SMPIrQHCgWZDiar
         yMsjQXZcQIt6iqQFUTat77r5P3QV/BgjlilICA38bOqzFdMaTPacmxk58yMWQwVK53rE
         UhgneksLbdd6lywnoKPjiFYDZbP1w/D25+WrbQ7FDIEgbrsCmI1zzaG6oddhAI/QMNs9
         giQuMwRhJaMr2p9ZEqnY6s8hRGIBcidfgl/hyniMzqknrVdJvIbMGU87vhMwW21DBJXd
         zWDA==
X-Forwarded-Encrypted: i=1; AHgh+RrgUydVug+f9eRO5uUj7oswyySJj8zFS5KpFNd6aZe/E9ioesDiCfJ4XhSJU2yUjDMV/T3P69g9xsKH@vger.kernel.org
X-Gm-Message-State: AOJu0YxGggXrxgHtu9VnrC7l34wOV1yu76MNZ5S2VRcR9Wqk+u6S0G9V
	3eZhgZSCbMPEaiJIzldoji0LZ5aXZocsGRGDUefwmSLkXLvoEW32eiwKoeaXi4C0ve5yrt37ycZ
	l+dS1VlAVEUbonjB9n6UE1mQESLVhAm3G6RTw6bewDLj88MXk0OMOb8VIeG1m0x9A7QKyQpyA
X-Gm-Gg: AfdE7cnElodcRkr/OPPgOJP+/sdKp+OuuVnUT7u04xqybR0b5xic7l9SzOx/hdTwQBn
	K3z7ae+mCsqjJ7zXGqs5mIH7aIeq6saLIbaOHSI2s28KcaMYSx6xUPQyT9BWsCUL433OxTJLKJU
	G6Xv1X5mVi0D5/dO7is4KCC6qE+ueqmWSKwTjXBVOZ7YU3U7gaRm1Ju7vosRxvpuG6i8ZPJQEwu
	d7f7mB4UdVTa1GU8CBl9AzpZUGGXm2k6T3yDTqnQtyU0YsYerimyoHdJ8ScwDz8zTRAE/xWU+4t
	+2TZ9lLdcaqBTWqs396an8lsn64eJupQ5QztSrxnIap6XF+gfhV4rdVllehmDxrBWwxCjuoFspx
	yqH0LVER4ufK8YXJPbQX2uh1pu+CacpvJ6f6vkFTKIU3EzwS4PuQu3vxjtZqDHCW5m+LGoU9UrA
	pMPh74h3pEk5+EFAnaUhH1kP+x
X-Received: by 2002:a05:6122:3786:b0:5bb:d233:70bd with SMTP id 71dfb90a1353d-5bddf516321mr2558852e0c.2.1782993123754;
        Thu, 02 Jul 2026 04:52:03 -0700 (PDT)
X-Received: by 2002:a05:6122:3786:b0:5bb:d233:70bd with SMTP id 71dfb90a1353d-5bddf516321mr2558835e0c.2.1782993123315;
        Thu, 02 Jul 2026 04:52:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89a1732sm628676e87.36.2026.07.02.04.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 04:52:02 -0700 (PDT)
Date: Thu, 2 Jul 2026 14:51:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
Message-ID: <3jlopmdj36kj4vi2dbokclo2fhteydz7fa6isap5i753nnn2no@bvsklelcpogv>
References: <2qlpabzpyvjwd2siwkpcdcjq7geyzj5egu732dg775asn2wtbq@tcbj6r5ti2o5>
 <20260702105509.1360340-1-sarat.addepalli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702105509.1360340-1-sarat.addepalli@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: LExHMUmm1NfB8TWf9lR-7na7gV2URGMK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyMyBTYWx0ZWRfX8PRUy1TAfQQr
 lja0zB0L6aG2xz39z8CC9Y569KPJVrd+FeQf6YAY7NVR3pZ9+UEP+zuW0cdA+TmdA+J4BAGHoO9
 x2dUrnkDQOplJNaT8lqidZi2uiChjs4=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a4650e4 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=cWqEqOhgNhVGA34jic0A:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: LExHMUmm1NfB8TWf9lR-7na7gV2URGMK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyMyBTYWx0ZWRfX7siq5Wr5I744
 +nTa63oXCxql/f1py8c6zAtRqPAutgjZK2l/n+jAH5GG8Tn6Tpl5a6tLR2TF89MhABEUMI0MWNr
 ma1K8n9b9useBbcLQaDhkhK9oWnW5iq+COY/uY295s7DSGRQMKdEtf/Z2kCzbcTO6KqzVVru9h8
 tZ5K65IzMzQmIGQIK2kYi6IWxqcpO9GJBwhYcIdunYgEdwaS5MX3sWMJZG0ZeQk9CYYwVahEQIB
 jOCBHl/+LJtm8LZz+51gA3t4mAmFjv3Q6g18ueDN4WiwJTTVbIzlFX/5oljCswUjX+GpNmwIxW4
 EKQ42lbPEG8sJkMngP4ZVjpPWzwF4JsgVjYuiVz8IuNB5tHT9z0jckJVQ9oQKTz2hoQdsIJ9TzH
 BBp2cMoScxdmBvT+L+MGXTDCZYkFpItZppn3tJSTFPkl3czpDkBkRHgzzo0Zq08BZWg9m/W/cJ1
 OqDgQQdKOy8AUFTXArQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020123

On Thu, Jul 02, 2026 at 04:25:09PM +0530, Sarat Addepalli wrote:
> Add IPA nodes for Qualcomm qcm6490 board.
> 
> The qcom,gsi-loader and memory-region properties are provided by
> kodiak.dtsi as part of the IPA property consolidation work, so only
> the board-specific firmware-name and status properties need to be set.
> 
> Link: https://lore.kernel.org/all/20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com/
> 
> Signed-off-by: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>

No empty lines between tags. Also please don't post new revisions of the
patches as replies to earlier series. Always start a new thread. It's
documented under Documentation/process/

> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 5 +++++
>  1 file changed, 5 insertions(+)

Missing changelog between patch iterations. Please fix it for the next
revision.

> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index bdc02260f902..d4f96bdd3a90 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -619,6 +619,11 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/qcm6490/a660_zap.mbn";
>  };
>  
> +&ipa {
> +	firmware-name = "qcom/qcm6490/ipa_fws.mbn";
> +	status = "okay";

Empty line before the status property, please.

> +};
> +
>  &lpass_rx_macro {
>  	status = "okay";
>  };

-- 
With best wishes
Dmitry
