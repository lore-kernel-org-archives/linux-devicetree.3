Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199FB15E8B
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782651090; cv=none; b=XkmZxnN61p9EGkyfjV9MQH5QGVT8FHls8RAeWFXSzcrlQ9RdX2hekuGRi421sdONB2FTKh+c//wacs4lGhNrcFGhbvNbGArGuADXA6fNNASpFAbqjKM6LGh0XYYHKfj7EFRl896Z+vILCHY50sDjinHQTqF3wxbYpIcd/zq0j8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782651090; c=relaxed/simple;
	bh=RDSYHfnxcOWds9DWCjFzNdwK3p9oDntSlN05/iqC6sM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WayWTqTXqY+7nPmD9avuiqqAuMXXwJ1qNgjaMWGbTlAmUo3fN3N2/4uk424CZbQb66xCxxuqUjYH5xI68CsRjlZ1EEqYSB650zHCBV4QgMPYltgRK6unCJahVAGpcmv4vVXuItYIzq5KjUrXtj+J4+Z6G2uBpz52pBRHS15i2xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kN+iuZAw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UngzVjwT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kN+iuZAw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UngzVjwT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9P2jp3594830
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ehENsRl0qPpAQgK5q0nAXXAN
	4wFst+lTFJbIeKL/+yk=; b=kN+iuZAwZ7aHzx+m5UJxv+UeDzOzlC34TL46iJff
	ehA5cDaMvE2itl4tn+ePtCGugU9YXEJZRgkb1wzGZyb/rL5dQRsK0Pcu+rMd0r7s
	eMp7ZDjvjc+IX5TZb1ttDdRv4t/5DAZXJklEs3Hmck0qwTXO+yjqCDb5/2QKkzVD
	t3hei8gAhudjYDG8XaRfbTG3QQv3WjFZimxlykO5UteEjsWeRuzCI5oUQ268X5dn
	Jivlb6xHFVVqze0Nj1AdhopkY5Y8HD6Bpe4WFbXKJ80E/qnVdzXgTS/W08V2mU6+
	W93NylTZC3B5/VxbB9btEnuu4qqL4G/H6vXMbl6myUrIag==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734awk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:51:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eac2620cb0so32397696d6.3
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782651087; x=1783255887; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ehENsRl0qPpAQgK5q0nAXXAN4wFst+lTFJbIeKL/+yk=;
        b=UngzVjwTM+GKpo88Ui96ppwy5vrkL9gPT/hgM2dPeH2h74MLAGW2HW4484Bc8zMRkL
         blTi4HQYWqO8O7lbGoZL7Ile9bjVSr30n42M20ivHX2r3fk/3e4h5UBi8M21CHy+JWRv
         oMVKrO5ltjbLx7NMlhXWfyaOnPn0S9C2lmuYeJDc58yHltKTR7NFihF57nt0MmGFEqoM
         izMWKfsAPvtCLiIDi+I5cT1svVsMZ3O4BySKH67yEl3B4/HpqCN1RBWLOAtQzyQzxLJG
         ik3vuOdUo/UQ58Do9Gl8WPYPA9TeSraMGvjf1PMxbw51axHXnqYeGb4+vqXrKHA/85qY
         YUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782651087; x=1783255887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehENsRl0qPpAQgK5q0nAXXAN4wFst+lTFJbIeKL/+yk=;
        b=E9lRT/PoZHGX9FdHkgBglxWO6FJO0DM+KNcddiGuFG+7KvDVXMZjCuQs7jki7p5A2s
         rB9cj70ED984wugB+o2PaxN+IWHf3ZakGGIAg2i1O4IDB7M0UaCLLLl7AJG55+d6ksRi
         oHTN+Zh3ZQT3swmQ3BOST8hYfgCw/2h595+mSMD8Xm8PkdK1dhKEu97I4OX+k8jhOmA0
         qkF85/ms1SFmIXPxsUgpiHQO95r/hLbs752mpMKsVudDJDfuD8Rmee7YU4EyFouTawsA
         iBb4fK0UeY6VTxPIj7tsx+Lt2pPxIencWwVRb+yTkja+IyRWwIuMEG39LWq7uNSgO4Tz
         Em8A==
X-Forwarded-Encrypted: i=1; AFNElJ8h2LRnowmo+V3W4tuSPP7p1XvgbJbdcIB2HNFfrRfR6cwiDUVRPpfNjRAm1Mxfaf8V7BkEQLVdCmbF@vger.kernel.org
X-Gm-Message-State: AOJu0YwGSmMPMP37CTKId+njuOTCNgIWTONhS4nmXnPfmzAgv4RHkiAK
	bsduFDCYilY8QNs6vNiL3A36orCnvzer8SLkUBQUS69qABFzkwsUU+NN8VR0dLfycTKAZrKk0v6
	rlWSk+fuxDW7wyc5Rb5iR6WExm9tY0lG4MJjOyVzLgvIOLOpgiuWp6VIgHbyhxDJ8
X-Gm-Gg: AfdE7clj6RaIdLO0stdUMCNbUrzUPme0V6KAnQewUsVVlprQOS5pmATdVPF5ojMgCbD
	sFclON6Ejv1OkfnFb03UvCpQ/CdbNlgRn2W1zeWj7YubHKKNFQLn1lBNz2Pr3k1Y9C+kghQDQo7
	FRXy6aVKXNWe5pn62CfLoKJnNNgAZUfyi7rl7aLviOaOD8AVTez6wkhaO3zvN7L4jhSSljdVcLn
	uUx5QeLlpAPAWI9JrF/ZTiHBML0tyJwX6l9pqlRc0Sa4DUp7IE2EKDaK4EHSENldGmjKTGUHcIb
	t5/ATH3NzESajfQhNZvOscBzaArFE7xMGyUBKJN2yfEHE/rcQlm4j4otAtjx1wZL9S0irkoQlv6
	38jhDBBvNZFpOKBPLJrzwtaVHKK2H0CSGYHpUx9SRWwSYeifuKwfb4FXp1OWn09hl2aT2GmLvLN
	fXEonk3SZt3oyYhKN1cD7QlMhX
X-Received: by 2002:a05:620a:4451:b0:915:b852:4361 with SMTP id af79cd13be357-9293bf25c13mr2064033785a.20.1782651087275;
        Sun, 28 Jun 2026 05:51:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4451:b0:915:b852:4361 with SMTP id af79cd13be357-9293bf25c13mr2064031585a.20.1782651086833;
        Sun, 28 Jun 2026 05:51:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ad31a81adsm26842481fa.28.2026.06.28.05.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:51:25 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:51:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Konstantin Shabanov <mail@etehtsea.me>, robh@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14
 device tree
Message-ID: <fcpwtgtyfab72iwkouvybul6o5cwswqxxj6vud6giljpqzlpp3@oyvcbx5227dm>
References: <20260628094031.54452-1-mail@etehtsea.me>
 <20260628094031.54452-4-mail@etehtsea.me>
 <20260628095420.4A7751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628095420.4A7751F000E9@smtp.kernel.org>
X-Proofpoint-GUID: pXia5GPcRaCsMY7vbf7zakSmHH8FFDCm
X-Proofpoint-ORIG-GUID: pXia5GPcRaCsMY7vbf7zakSmHH8FFDCm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExMiBTYWx0ZWRfX4oBbR6rU46R0
 lmbFkVvGUutmKxbChRh+97ECQJkHl+DiyRjJxO+SqrRg1QjEoDAEDeYy8C4hou7fc/kNPgz4HhH
 YptRiSFkar5DnwpKE48bl2Qqqp843NQ=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a4118cf cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=WHjzPRnL89bxSTNla3wA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExMiBTYWx0ZWRfX5gbrBcghDb6v
 Y8o1APNeWbU7OC+OVmTM3ezM4H/dlcl6UDZ0yE6NtOQ+i03esjapEyicUOBz5QxcjNbw2OaN+n4
 KTCMWOScPITtF64ToR7juZflKLWG4Icig4irPyPOh30+1/sTfnDZ+QqBWQAuC6d85rtyV6Ms93j
 XZqVwXP/5NnQcD+nF/dSb7LnVr3tnwktYofPifDcclM1klpuZp9iqGcAv2WW7ErWEdOrNTcRyoE
 rv8VnCYpBWeDpK9jhxxSKdT1N13rF8bUn8hxATT+VFcreqFqJ87NDXy7d75KAeFJlFzIfa4NxgI
 +uZXx+y39t3Yo60+bX8dpD77yLQCh5RAJzr1n2DPHCjfZbGACVubuPhg3SuCsFHyA4Q9oBTaUsQ
 CC55xEXHoKL7qDjsLwCpThmbh1ynJeL2k6TmkWXgSVJgBYKADcJW9awvSvsy9KXTelqRKcFlVNx
 JD1BFILTE+bD5Ji7WuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606280112

On Sun, Jun 28, 2026 at 09:54:19AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Mismatch between touchpad interrupt GPIO and its pinctrl configuration.
> - [Medium] Type-C SBU (Sideband Use) routing is omitted from the USB-C connectors in `pmic-glink`, breaking the DisplayPort Alt Mode AUX channel.

This is fine, assuming that DP is rewrired...

> - [Medium] QMP DisplayPort PHY is directly connected to `hdmi-connector` without an intervening DP-to-HDMI bridge node.

... and it is. But here Sahiko is right. There should be some kind of
bridge device on your laptop. Could you please check and describe it?
It might be driven by the simple-bridge Linux driver, it can need no
control, but it should be present in DT.

> - [Medium] Both WooferRight and TweeterRight are routed to the same 'WSA2 WSA_SPK2 OUT' source widget.
> - [Medium] The touchscreen reset pin (gpio48) is configured in pinctrl but never driven to an active output state.
> --
> 

-- 
With best wishes
Dmitry
