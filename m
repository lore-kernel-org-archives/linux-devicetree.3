Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242984;
	b=MIu+kRO/dgXWmg1EGXLjr7IjjnBZYr5EWEA1pfbrLp6JNyobcfv3lvQz4fM4poOqQjKl
	 kkx1bztV8mSdijsKuW69+Mj/CywOEqzT3F/0wWPc+ipkAOOmQCKb/pZv/+8mUbqZ/7paa
	 vITat7+5nGVe0ArdjUTbpZydYc58Sk15QMT8LdCHlb0nTYacD3h/FymGFa8jtDCNzush3
	 5uuxArOXYCRlynK007fyfXVU6WarXAuDEmnf7VITkOloJ2S6660P/xOE6qvAJTzfTDXt8
	 txwvToLDp8ZhPLHSefPhSzKBI6hA6ohIeyqrZOvqdrtqu1tMU6f3/kbriO1gfkWkUZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242984;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0MUhxbWDDfH0Pr44fdAQRQQ5nxMYgF5W2NWtbwUlm6Y=;
	b=aBo2/Zu/5Glx0h1y1uFBsopjfr2gNwe5sNsWgNwryfC2XHJliHkn0ndrb8BBuDcHCiVR
	 Hu+OoP/OTCxeSo2CICeSOeODvlaIjRcZVQ6v/0buMOSkIGshodIRxUSsk0JbKpDcshSop
	 cisdZSnqIDGs4ze61UnQCl/G5jlUcP/i/dP/dKPFmD+J19aTMFGga1FmBmqRKDzjHOvaJ
	 wnr95WB6U8v9Dqr6eGk4tEn0KNjAEo8ikgi9z1KLeFd2BMozCM/v22Kd5m6oB4Okht/ih
	 8nWYE+dIYu597HI3UTb7gXTSPei2saoaM2btQpbK8kvDcqjSOEw+Cj3zaeLBs5DgPZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KC7CguAf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S4KYiYgh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA879606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 16:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA879606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KC7CguAf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S4KYiYgh
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFBOe022881
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 16:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0MUhxbWDDfH0Pr44fdAQRQQ5
	nxMYgF5W2NWtbwUlm6Y=; b=KC7CguAfa8iBs2P29e6oQQPgHbafjEd2ffGuL0DW
	UqnHX5yB/jTghZ6hUFCCtTZAnWkk44cc9vx8MyLXLoLFZNwv4da0brsRaqfDMI5K
	JvNoZxQvq9YfoOZqobJKRdjW+I8MQAGxjyoojtY8dFzaDyOHsGbfREfxdROcqHZW
	dhiybZIRpy033tEJd76g1eOHGzm3jaOxWnqENtpN+TnWXRQjodKMMDnDb+TC5ccu
	ipJrUzBlkHzfwRmNe3vma5jUPwP+c5xLBWoaWHKq6Dq1Aj7+SYj5V/BUhQTU4pU6
	UjT6NdIlgOWEj4EvvcwMQ4TWUHMZLXnvOw0vP/C3gy2eAw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydh969-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 16:49:42 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2ca2a4489so156548137.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794242982; x=1794847782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0MUhxbWDDfH0Pr44fdAQRQQ5nxMYgF5W2NWtbwUlm6Y=;
        b=S4KYiYghSTSwwrSjsJ7a6xgKsLVHMyUM9E+pHccQFK7ny0VGNm1RRP97I+ZkU6EPFf
         jiE2v1jvWH8P3ffVAm2cWE00E7TF01nHO6PmKWu1r+qu24QYP4+n2uKuH9Tyu0Dk1L+2
         vrNHRr5hYiyFteV2CzpUE94RWum6vK1WMYX1keOcOEM4GFCjiHbN/vL8LevPTUhJulCy
         /AblkjbJ2pU+HYF1q6tmrNOWy32FgychJtCt6y8xnmWB+5V0gA3zT9boTP+mQs/4z4CV
         S/xeduoo/RtG6y5NqxMaApLR4PxDPCkuFOjAasnpMebAFr0i3KzdhpE97porFEM5x5qP
         9AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242982; x=1794847782;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0MUhxbWDDfH0Pr44fdAQRQQ5nxMYgF5W2NWtbwUlm6Y=;
        b=Fa/xW4UQXla9KfQzsC4jXtjh1QAhd4CJKo3fvwgC9IJJH3CaLE3TiYQ6L24GISCP//
         2VnCLT4rXHBjK2e+xEn5vjF9RG/Fv+Xl9A601vDSh5EHw/7ViG9FP4+NkJ+8q1Rp/hlJ
         WSB6J4+oc1unvKlc4pnYyMLK5UH9jQSzdGRVWtyxbJFq2Mu5QMGvkvUjKsqg6tqRs+BL
         Xj+uiDjliiT7Ih/ar3oJKBHeh6GFU7n+WFaQI6jPBxHRkhOU4d/u33zIWC+TWnfAh9Je
         yZ+sdAuDKicKyQFaDlWj95uRPZn9g9/cpk4sla3/VWAGE/nPNY70vkmPNJ5qpN9v+Jkw
         pUBw==
X-Forwarded-Encrypted: i=1; AL+hErFzVQUDqPbJEkBaUDvFHGROVTAS1mnqHvwpwJ+5MIFG1OGKYZQU9Id1/QShgIYLSkvDlBAdr0duOKhx@vger.kernel.org
X-Gm-Message-State: APuU4Z+KIBqKeBCyICk/IfyxuhW8lpoSFYX5nGJ3ZWmHTYV4DSGoS9pI
	m//kNIOUs2XF/p/8NB4ojPqPqp1AjWIjjrICExR4vDiq807pT4sDhzIpBdUduphsLfrohaTTTyi
	7plIdJgv/20LQpbQhEi/RfD+ZPYxJcGz5gj0LMX42zMQTjb1sQjSCO2TqtHtpOjBS
X-Gm-Gg: AYBFou1SADjIvO67HIi2OWoFGgHWXmbfSB1eZ0ABQ8WRLU1GWJcoC7KHjXatlzWqqGG
	67IiSN/MIyo6ax1PSzaka79MgvtDi2opd26oD5l2BlI/YJktA1DpX++W8qWP4hQBsqv1uOGRks8
	88kv/LGqmhkb2nHsbUOOtPUyNvWIDFm9RPbEsesFI+cihIW2jV6l5EX6hJ9O5Zdu1qxcX8fh9oi
	IOutdKoc0KnJhTS/v0r2WxCRWPUEGfyRRvlDtZC9db7bRGuzFXTRprjqTqPRm0uZMLU7HZ5zjCk
	CVP20G403xxa9n2n5Z5G0WdOhBc1GgsDo5SMHJi2FulDELvbuRiyPPTZVQqY2U13AAsw35UkrHa
	fo3fGM9J0KjObHP8DpwPQct/EjSJPq9NDCLxOVvT40SjckicwK7y2HhFcypTsb74=
X-Received: by 2002:a05:6102:548c:b0:7c3:9a36:bbda with SMTP id ada2fe7eead31-7d2daaad4dcmr1467421137.5.1794242982002;
        Mon, 09 Nov 2026 08:49:42 -0800 (PST)
X-Received: by 2002:a05:6102:548c:b0:7c3:9a36:bbda with SMTP id ada2fe7eead31-7d2daaad4dcmr1467408137.5.1794242981355;
        Mon, 09 Nov 2026 08:49:41 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fc8abcsm629675e9.9.2026.11.09.08.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:49:40 -0800 (PST)
Date: Mon, 9 Nov 2026 18:49:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-crd: Enable DisplayPort
Message-ID: <3ldmalxx2qiphh2bmkru4dgf4j5k4q5rlhsn4urbwmwxit72zh@7bzssinqivhy>
References: <20261109-mahua-dp-v1-1-c1fdfb8eedb5@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-mahua-dp-v1-1-c1fdfb8eedb5@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfXyFrksRG3szxF
 ktFgcPOUYt5l65lqQrLPfnYasQccTXzE/2UwyGjxOM09vg4l5j5tqCHUQ6mMkVxCbH8q5kP3CiS
 xLboCaMYDZBDSgMikJtJeNXQ64ncXPA=
X-Proofpoint-GUID: h2JE-t-AJwDTN2YdVHZjBlRCWPk1ho4s
X-Proofpoint-ORIG-GUID: h2JE-t-AJwDTN2YdVHZjBlRCWPk1ho4s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfXzKt1yPl3xwBU
 sNb7BjBl1sAI8/uhMrjLPTDbbpxFT8pYn08K8fq8MApdJilve0JpdstMGY0oY/YzccRvNadv43L
 1matqgW8aAiRY0l+DWTXCE8aJSw9+dWf8aQzO1SDWW28X3diiq44U/jNzhXVYoMxvAmHG5l1k3N
 JzRVw63clclKtbTo9aIUNrkr1UVezzMQ1PpDHO8/vvxiRFddII1nVJ52TNk9FA+tL82D2kZ6FJF
 wGXlyoGnT5hlGohL3FHtQw5Vf5zKu0UiMfcAtgyfk18Zh9g0+H9V7f7r58SN4GmCJmuqYs/TywP
 wbdnxzvHluLO2dETfmrxNORzpP0+UQDl5K3gqlcGJBLpYhuKF3Mk7iDBxQ0ON6rMMsJwvJR/zIx
 siwWVIR6QyWSCqkJFDVTBNMdj+3gIcPRd3CqePeec7L/SBfbqgDDyJel1y8AwIXncmA5SCJW15K
 hYXUDccriZZhiVA+e0g==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1f9a6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ArbKvjEle962CzFOaqYA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090066

On 26-11-09 21:20:00, Nabige Aala wrote:
> Mahua CRD uses the same DisplayPort configuration as Glymur CRD.
> Enable the two DisplayPort controllers associated with the
> Type-C ports and define the supported link frequencies for
> their outputs.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
