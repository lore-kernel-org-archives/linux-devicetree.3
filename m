Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880477;
	b=uprv4q3QDFqPO287jGTrwggnE4MiZKGvIB5FDjD/KgFzwfTMUGGqBZatEr3WblwXm0xQ
	 k7Z9b06s4ArhrOMMRTmCpvRDNKa0WJkBpsfmXmThTjENA4LDqgpLiC1WxFCw/UQ/Wlvi6
	 kO/rEraKbAQjfxEhiz0Kv8DC8+zFBy1TMmw/sQ0OpHuU+Pk0drES4Hn0spSOd/V/HmdW2
	 ttd3mZpe7o6svgBqnwLFs782hrJHzHl4AiQ2mJzXwDaIOXAIPOKk46bCo1Fkl4fVncRkh
	 qcDJNDVuvQv9xHaDSwRRlMdxH1MorsfrjIfp2S9NKcqwL5U0tRyRJQ7QqAleJ9luK5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880477;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fiu9RClNGooZHVgoSy8QR/YNbVqqklxgEaTF/aMjok4=;
	b=MC/K7YQPTSRmud7CyeAsq8cZ+8SiDF2uSa2VzKePlREFS5XID1KUGUYHFTIxyISRIi/q
	 eu0nSu7rpqe8qoajVtkPLcAgg7QsIFBxgke/Gb0AgXN1EI7Flo425nb+gsYHaCCRFSrrl
	 dkTWGFShWWBT8cFSnqsQY83Z7FkPo8X4aFR1CpG1bqIVDnTeYbTuPxK2x+A3UTN7dchL5
	 QJG3oCOD5TwtgFqz42qtLCDiaRRgnXFesus97Id/vlcm8POqHaztR6AcKiwAiH+aQzlRq
	 dbXe6CuiX12jw3pGvizjSnycNRz66YwO079ZiLbgKeRIlUTEoACWZ4ocTzLgvDS1Zzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pPC6TXI5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKoCkxAx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287B7606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 12:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 287B7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pPC6TXI5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKoCkxAx
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Ahvp61582953
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 12:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fiu9RClNGooZHVgoSy8QR/YNbVqqklxgEaTF/aMjok4=; b=pPC6TXI5k5cu8c5/
	euzX6JjZXtNTvGDBeZMbjIlmHSE1P7u6icGrgwzL5C1ANqc/YaRy05NDQs0zUER7
	jHHAxcSh7FChS4GUGbJbbrCnPnurwllr8KoYXeHgzuukMNPp+0ZZ7avU993oEDrd
	ykui36jN6sTvOMM98+UBHE03QtlWYho4lpDgtzEnKIZEZBi4+bPK6ZpXspofOiV8
	XIBSxgvI4c5KgR/8RIZGT9Pbm4VlVzA0PTRDxQG+qw5zCvSv+V+Dld9d4Fi0QRjW
	kf7WUo6rOdtr8vUuVLJcRezBde6yfkWstlkL2JQ2bFl4PisExp3g2w2bzmR8o/G/
	DYTShA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraarbj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:07:56 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso129746e0c.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 04:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793880475; x=1794485275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fiu9RClNGooZHVgoSy8QR/YNbVqqklxgEaTF/aMjok4=;
        b=JKoCkxAxiX6vkb6QBj6oxRK797XS4OSI31dQDId+QaSLCgtYm7pQ5Nsc7OvRzoyjII
         hmxsn1b/vhXFltb2y3QJ747Z+5iaKjkXWpfmpATVkxTQXM0FUWPMErasa0N1hExne+KN
         m/C527VtkzpKeIHpqxyDXB+tmGRCyAOHNM6MjZu7VNQR2XbQfnZlOR77F1zQhyPU5cK3
         rIVTCrzvQsf4V5UBAaMEQBnH2bC1w7m9MEIrpSnQIYsYU4IpGxZ45luVEgdKZ6QtVmHg
         lm27Ppp3d1c6QY5GvBgLnlJ/S5tB8kDIoHABEY7ma5oZBHaf9n+kjdIFHsRYWGuWR3ap
         8p9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880475; x=1794485275;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fiu9RClNGooZHVgoSy8QR/YNbVqqklxgEaTF/aMjok4=;
        b=Wkjc3IhnX4NhVjlb85odFr9OyPHPd2ZHCRfy7P49EVP/34c6gyLHpwr6LR/KOxpr/J
         CRkhl++9/GOXgB6EEyHMhzx9/1lE2W2IQmTba50IO2IZMiV+kJCBIhiKUGVgWiREnkXS
         8c2w0N8PkzTdeSMbkh92FZubRhP474MUSarLI+0ajEbuFp4X7r7UD1j7xcRqWoUAKVyd
         Ix4IsQHQieOAp9FDuMNf8C6yQ9/4P1yIQBZyc/Kq7ypcoCfHZolzm22BUr6kW1tVxSZF
         yh3imQ9Hcsdge8h/6D3nZFIXqwrsCDPGJonWKa2q1Xi9Np1Z89tRs4XzV2FcjF5isp3z
         ES+A==
X-Forwarded-Encrypted: i=1; AKwUvBzVR5KmYBml7tkCFGSjga9RBBRuz92d3kuEyzdOtNiwldYAvxHijsFlSnoUVpIsoi4fXW8Fp8oHd/0x@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZOvxb+2Mj4nrkcI9OaGG63mO62/TwRq7T/QcwmXLXdBhLLFyZ
	XGwZvIh0r/Lo6r1fpz+QQRJZ1m1UW4Sbw3RDEs7WlFgY4TQ0oX1i+Mjv8notdiqAdnlBxx8PvHs
	a+XZAbgJTfu0KfwmIcpZqaslV50yekigbhGAjT8hnUfhPGRMoQ4Mrbx/LUxKjqlnw
X-Gm-Gg: AYBFou3U6BQOwj5Kv43fxfcLfOqnMUvH4V30CHMasESBrFxiMJv3Euv1YWEs20Swcnh
	S/rtdMk6f1jJpIduWIdcO8EeA9ztgorQMUw7MPaY9Fvc8earRhsGUde3hIZdKSz9Vwps/j80j3E
	CbrnGtzvZAMWZiqvXG0ucmBp2rdFu7ovRiq9bYeU+qsiE86ZPj86dhrjYUWdlL1PoDie8sl7a+R
	TapajkvwgS9mwjvWQp3X2Oq/QRXzQFG7ZRZk19UxSz+QyenzK61eBVlxHfZZE7UaJxT8WztteFA
	3X7GZuF98OfRhzImuRXYkju7Eu+kul+w1C0nd6Z618IorS1CTNGLRBdVskd7V+/J5w1hkgfbZEr
	xrpHBiNDf5G+PVdro3Mqc4ZDR06pvwjQUhaPw0tlOqYmhVPTKUMP3Igb7crksOgw3M75F
X-Received: by 2002:a05:6122:11ae:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec689382bcmr9586249e0c.4.1793880475432;
        Thu, 05 Nov 2026 04:07:55 -0800 (PST)
X-Received: by 2002:a05:6122:11ae:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec689382bcmr9586231e0c.4.1793880474981;
        Thu, 05 Nov 2026 04:07:54 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e423a48sm170533566b.27.2026.11.05.04.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 04:07:54 -0800 (PST)
Message-ID: <e24d7d8c-ee7a-4a83-8daa-4805a7920f44@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 13:07:52 +0100
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
Subject: Re: [PATCH v1] arm64: dts: qcom: glymur-crd: add DisplayPort audio
 DAI link
To: Chiluka Rohith <rohith.chiluka@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105104657.621104-1-rohith.chiluka@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105104657.621104-1-rohith.chiluka@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0OCBTYWx0ZWRfX6QGOgDFq81ip
 xlOoM48VBRPPZZwtwBHxY4WiMsQy5mbCDpmx7/omnFypIlFZBWUpULbampkm0KT80sPloS799Qk
 Y/5ZYkm/BhuzxgzjcUru1JX+g0j9jvQ=
X-Proofpoint-ORIG-GUID: FiIICmRDnz9HmIURGel-CHj4wp5tE9hM
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec719c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=IKU54Xh4PqmdtQSvpVMA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0OCBTYWx0ZWRfXzk0FSNEl0pcm
 XMaYqXeJh2Ba6zgu4EqDiAxKqwv2XdzDFQt8kylr+ucJ0LJbIsYJHsN24jhnADTb2bbfrKLzaW1
 q2o6wP2v1MS3vWIaKFrXmXeomOvW8JjhdhKYIcGlrrefk5oCVUg1uOj/9jWc9um6WFRlv6C1Z2a
 8ZJGMv4vIcHUBjOLxQBLkD7uP6XWumSVOsTgD29UxOwx62g8cJnTKbea+HesbKVC5coCS+LNIuT
 3jg+0ld1E/ip0+o5UBjmCCdiuJ0rx9nbb5etLdyTjEr86MPRbp8CENj3LfaWzGhrsVJu6PN/yee
 WFZLPFQtFSOyYpZDgHyZ/1bLUQb/67b2emRv+wxY3EQ/oAx2DxPiSw5iTCJLjIXvZTVdmWXuxkH
 YhNcJk2YvPQskMZSjjLumzMmYtygtjfXWhKZbpPiynRgn2zit3p+UrazAH3MMGN2Vo+cxJB4bo7
 e2Gc8r5mYkm+zRfqC/Q==
X-Proofpoint-GUID: FiIICmRDnz9HmIURGel-CHj4wp5tE9hM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050048

On 11/5/26 11:46 AM, Chiluka Rohith wrote:
> Add a DAI link for the DisplayPort RX path so that audio can be
> routed over DisplayPort on glymur-crd. The link wires up the
> DISPLAY_PORT_RX_1 backend of the q6apm ADSP to the mdss_dp1
> controller, with q6apm providing the platform (DMA) component.

Why do you think we should only have audio on dp1?

Konrad
