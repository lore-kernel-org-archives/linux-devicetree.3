Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D163DD520
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021586; cv=none; b=afY45AsysDnPSytU5JyiBcpUN88MISSgC9E9oc/Hv+gRH5O/3oQMkCax3Zv6NRCwKJoNzkAI5mCeGOVy5IZUKoEF0mq//yFqqpVIz2hgat8Z3k4+Wmw7nEFysh4vbOLQS4Xdnc1W+/5haY1ajORP6FyJ6afdLc1w4OhoT16mM34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021586; c=relaxed/simple;
	bh=Ljm5/80+eKYYhfC/Y5wV2iv6COTVsHuMd6r2nW1uC7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APOXp5rhcNwgl9q+MUmcKdW809VdkXLWm9fH/EwWgEkKc2rKwZWh9/j8av7XVNH+tugQpbb9LT37Rg5/gWpOkcfTTsYcT3MqoTR8s+fufTEKgjpme4/1Sp9iUglcMlX1vZ6HSyXeB68+lUsFloHxckhHosCRYPp0I48Jjq8Ywh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O46HmpVJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyJhqyda; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O46HmpVJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyJhqyda"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMLmgZ500299
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ReKVbNx+D5AMrmxj0HiDzNjM
	MNMqfQtzg8j7u13LE9k=; b=O46HmpVJH9qI9Cc9w+33CO6yrWJ1EBw2T2z9pILQ
	Vh4AvXalBt4x0JsyiRg1RtPbCzoKDNZm+GzJRjwbIDX+gf2xYpNGMB+1mHxtzPk0
	P7/80k4m4HKkXINqmyQPdWn0BKSxPZUlVdjJpn8aChpLv5AFvvqlOV8PAop83o0y
	i46jyUhlJ/zq4LGG+MHe60GCNAclB56uAJUrgf6LRmaqJSJDYCsCrp2jqWto/hrP
	JO3HL0jp9VAEUNU+pQYgZdxCeExA36f6FabsbimVXTdpKslfgCJarrrr/8qXhwFJ
	vMTIP4UXyomjpEp7IAiuPUkjHOFKT74/8muEUeqSw6kidw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf28a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:46:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caa0ce0cdso125570785a.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021583; x=1792626383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ReKVbNx+D5AMrmxj0HiDzNjMMNMqfQtzg8j7u13LE9k=;
        b=MyJhqydaSLbDYIvHgV1bgceS1X8WBNzpaHYjvwl0KotpFnVR+zgeeLuhVtXA7tr+By
         lgYwYEXR9/mmplVeyLt0AADIKABKONx40NiBuTwEvu3CNw3NsJFO1Iak31lYGk8f+FxI
         90lRFFBvlMd61Cgt1y3DSglyvyXk16VIEAaCaiyY2ZG8smf43ftXlrQDCej1EIf2/9lL
         wth14iF+tCHO4lKpw4WCUu7BJy1LVd2FwLr2qJwSg4EJHqvvFjkZqhnt0zYMG5aXLpV1
         D3eNk4ULEE0amSpnORx7U2pZdaOgiH6juS82VmaWZLQzJxqgljv8pDS2bHlJdFoi765c
         wetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021583; x=1792626383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ReKVbNx+D5AMrmxj0HiDzNjMMNMqfQtzg8j7u13LE9k=;
        b=dY4DbHoVcrAM7CCf6mQeBsF/i9hUPaOqUcHtTvw6aMH0o7Qv5CX3r+xuhpH8RMIt2m
         b6X7aZRkD6aoqkBa/SG148DkXrGQX66XcdpzWsb9NuFIYhVKroIqsA7no6re7Nok0pc9
         26ofc3DSaaTd01Zh9d9nIPV6e2DbHKWbZCMav/b2nAd/cVjThN5kUhJBWT35EqG7rQJp
         OB+MewiGW1VTZOVxzJSd2mLAMmO04fFQZhUunMiHgHCM+3tZKHGwMbBrHA6i5O4n+sqb
         wLIm9p3U1CAbd5SM/09iK5R6FzCgPkwaigqWFOwP0djLML+UXSw/iluQLOCOhlGyJTu4
         bdmA==
X-Forwarded-Encrypted: i=1; AKwUvBylL0ugamDlOD4zGTqGmpBtjOH8Xd4lZYrHTDGvXfInSp79ZiVBtBlB3TmbpMAHpNkJ3obRrwn+wWaK@vger.kernel.org
X-Gm-Message-State: AFq9FYJSm0BruluOPl2LAZR2dutiK7B7eoP5RBBcJd9jpnc/W/LIKwYp
	FtUXEia3E38fcXjsqa+JHClk9jh9Ui3RmKjHaWBL3S7lEUX3dbh1cIyY91MhfwxOOdmGObEeTaF
	BjNKGldYAA/v7XOvhg5SJFpqa/xL3npHdD2JckZP2xwYDaOI8lTg39Lj4HlO5VS0q
X-Gm-Gg: AYBFou25j0y0Tasu8JKhrGVYq6qxWAATujByUFfzMWUDNIgDaiAExDiXdSAPoRLCeoR
	+GRVY8tZr2ldjM7TRR2HTsneAFDDFGAdhbyG1Qs6/lkfGQuSVf8AG3ZB5x99xKhUrPVPJjr5cC2
	izMfNoSTzZr+91UBgNUM+wpQ4iQOupVKYZOTI5N+TOS3nwuNI1dQIIuJls+3H2N+0b9wbhfE3v3
	43Z1kCLvgETIh19TPZwW1o1TSPJdITJwWHGPb+Sp8ttkm1lUu1uLt5+UYfUu4lUIDNwT8pFmlsp
	csdKhws/iV82NwRZhjdS55Vzd03wb9mDDYJSDEJWazFJ+seRt4kgGTgIO0gRhn/I5qie4DAf3w4
	d63W+CykeBvllk121gYVKTHd80PIZLVULI+8ijho1rD8ktf0OQFfuNWASRhC3S/pQXWpqXv+LSw
	zSXcSpo/x5Y8gt
X-Received: by 2002:a05:620a:4693:b0:93a:9ef5:d370 with SMTP id af79cd13be357-93ebd0be3d8mr2916450585a.1.1792021583026;
        Wed, 14 Oct 2026 16:46:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:93a:9ef5:d370 with SMTP id af79cd13be357-93ebd0be3d8mr2916446585a.1.1792021582503;
        Wed, 14 Oct 2026 16:46:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d90ce5sm957598e87.59.2026.10.14.16.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:46:20 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:46:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 1/4] dt-bindings: connector: Add DP AltMode VDO
 definitions
Message-ID: <otk44i4caul5k5dhqsprgmv4hr4jrvtpq2nhcyhgc7ngul5iyl@jmz2ebrwhcgc>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-1-b657c9b6e4c3@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-1-b657c9b6e4c3@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX4pqwno8ybstm
 F3Vk0p9ixTmyu2aR1yN0bY6vq/q8Oa/tCvwOqHvb2rU/pwaucgwe2ZY+z2RADmLOYQ5Vz0bWlM4
 GeIUooWFZ7H2R+/CWtPrYzfbwvQWXBNaJH51w17+1Ish8Jo5SpGj7wj3Qx3yQeL2+27EIQpn5Hi
 6Y+IFdp4bhiCfIDRJ+uEAX8yyatc5NQb7ZsEgIoCQ29hiRkhNfJUAoTJqp0q81ZTsZa71R+Gi+m
 suhgOyAjFm0qYYaiX3+wnSB44w+HH+3FH4hsdZopcXgslGJBAT53if8sdpOKBoUjpkvBTEhIYMz
 CWNbcMww8Q7iflLYihycJ/OyfmusUZK3Q4+GqS5jZAQjTfLKc5vJfDircl4ClLz70n6BI9hqmke
 giBfKpuf1OCm+2WlsTsOpKABtCC8h/ddGD0yIOlI68dp//+qsFHaLh7sEF1HlUx5+HSEWJjthNo
 GtcmaPe/rSRvayFo4yA==
X-Proofpoint-GUID: xda4YokL7DDybDBwioQ562JIbQ30rmwh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX++jwc8gER+LO
 4E3353WC1YIBC3+0FypU6IvjjXYLEWzYzjJvNAc/7sFHeqMzZ8tgK6elmV0jDwZu07V4k5Az6Ue
 aeCWUfEOPU9fLHXfearMIa1l25aCIEo=
X-Proofpoint-ORIG-GUID: xda4YokL7DDybDBwioQ562JIbQ30rmwh
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6ad01450 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=YnuTlg8LRq0IA_Y-aJEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140094

On Wed, Oct 14, 2026 at 11:31:49PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The typical USB-C DisplayPort AltMode capabilities for a down facing
> port (i.e. sending out video data) looks like this:
> 
> altmodes {
> 	displayport {
> 		svid = /bits/ 16 <0xff01>;
> 		vdo = <0x00001c46>;
> 	};
> };
> 
> Improve the readability by adding defines for the numbers, so that
> the above instead looks like this:
> 
> altmodes {
> 	displayport {
> 		svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
> 		vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
> 			      DP_CAP_UHBR_13_5_UNSUPPORTED,
> 			      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> 			      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> 			      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
> 	};
> };
> 
> The generated DT binary will stay unchanged.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  include/dt-bindings/usb/pd.h | 58 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
