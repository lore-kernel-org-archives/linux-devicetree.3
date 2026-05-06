Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC6D1643B
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 06:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778049051; cv=none; b=EpbttmCmUAfOqhitAX5TbcE4EUMqa1YE71nzOUlsDGTqbXIGSuME1fN0fWvq4si9FTHvsih4BnHQ9YbL9hKyZjcbVniiQUe6cYeiS1oLIlNl2oxCjiOB8cjVWbBJN0SojtCkTdh1XxiaPQb9r4TCAOKFaxMI9hQrk5jnSmNjPhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778049051; c=relaxed/simple;
	bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	h=Message-ID:Date:MIME-Version:To:From:Content-Type; b=TalwNDkkCl4ENkl8mrQjGr3HlD8r4cltE4B4flO8q4FWy8TXFqBIl3HCp2JeOwuOERPcSeAuWnOb5NYPHaIgyh60og2iK1kiLjCB0xgMUJZrKSxP/61CwdRMb6whop0BRBu2T+YaJjZkBGeNMdJPmRECbRtxvMAsvNWL920F/+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UmEuq1LO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBtfUsSs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UmEuq1LO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBtfUsSs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645NqxYD248146
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 06:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:to; s=qcppdkim1; bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++L
	fAOrCAj6OvBfk=; b=UmEuq1LOzGKfh20fZaD47uZ/p9nNwXvCCw+O8OEXCeC4Eq
	z8auPMlEEft8j3TBPyZQ5slY0eoW/uMcka665TLpzPDREh/RgEUuFrYJQmLd/xT4
	tvHHjsXgdXKXABDlcDO2DQe4rak5rldqaIi/pELTp+UutnjlsLzfTLtsHjCtHm5k
	rq1KcVP/sMkaywEeTF8ZApGr1gnMuEh3uJFPY+TruJuMtup3BIg6mn+7K9Jq1SZA
	QT9uOfDmPoV7rTuIu/DQiqRXaS53xM6diH5bPFqRRMnzBp9ZkVWjbegRoM6elz39
	E9TqEZGWVTBt3rFFStrbtNn7y1+laT15oh+3f1Iw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyjq432rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 06:30:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso55180295ad.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 23:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778049048; x=1778653848; darn=vger.kernel.org;
        h=content-transfer-encoding:from:to:content-language:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
        b=FBtfUsSs/kSA3l5g+xIucgkDs1CqPuWzJY16V4xUevbPO+63J+PZS+hucEgn8ukrup
         BG6z+BUc03NOh1kJKBTIzHydim9OHtGa0FR2uAUG6r5dxvCkggTiRltvkOS7U98GN87Z
         uMQJrj5h3ydF6Z5xE28iN17EfVmWNjAZ86WIlpcG4IcSVuosLHl9yED2Hbegv/poR2HW
         WBulmU2gGjcE5U9ZvkyuX4X7owiBxLfmvN3ekO7uyV29QRf3HqAaMXIyzLNPNOV0ZTG1
         x6MKEJm1PycqZMntSef/P3wlEYu4WZX61/Ty4FUPQPw65g6EKVXxuz3e7bxqt47oDb3t
         Yf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778049048; x=1778653848;
        h=content-transfer-encoding:from:to:content-language:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
        b=jA7pWCPtir0Qr8pzgRG2rOy6caPNY/l5ivYGMTgA2fNw85JAyknjU6A55ScOzFD+V7
         rDzrgUskmjm+vl0g8vCKdokDLBZ6PjW7Ve9pjzW7EyOVWjzbWbgPzFlQf8cN9RgndDQl
         UjftoH4kgXOUCtf1MhyUlsPO/pODE5ps2p8icoM8zj0ovFV+z2Z/jv1dXgzvE3DqZPHM
         rhlb6P9WQoLxypYLnEKsUA2CfZilWkTDURiOxE5vzrW0wurKvrWLN2/b1aJ9GKyc6NlM
         ilPbSFab0MXxHKk/sB5PbnHCPFiG1HrI5+Le+D9Quhmdjv9l2uSJjgMTivnS6lNuPgLO
         nn5w==
X-Gm-Message-State: AOJu0YwvBT9/akuiofEXZGirhJRDwesMFvsdShTlPOGHCbRaaJe9hJ1d
	QKmVGNFxR+LS7q3918uXTYh+LRKLLyh8+bqbkwjkL/peq9OWR29NFpwE+Nw8Hpjyver710z3ms2
	uhhETlIa/viz5EOCQkJB6knTEDTNWpMTOJRPHoVPk7ZLsYCqrcIX2Dnhgnofa7x9EZ2V06xjRj+
	Xidg==
X-Gm-Gg: AeBDietJQdvPcnlAi5NmKUP8UForr+92IySj+e5PiBX7eIY1MmxI67BfVjUyvIT+Y4b
	o1Wg/LAhdHyefSQmf4dyjY/ZncrdC7PQgdcVUdxWNO1Yl5PX6BBufrPgrinhrt9/NUXylriZ1ez
	C1xeAp2WOQQNuGbLg0uPcbZvASHnLZLFrPtVqvrqEb0MqelUugtN8cUq6dTq9m6ukBz4/U8b2Px
	WITnPwapGA7PC4BVdGKcWlznMifTxv0/gwm52kL4KUJl1Bz/Cc+r7rpp0LM+XysO5g0v46/uOAu
	c/czVUq1d9HOEAN2s6SBT33bFv4J79TEX5aQvgwc4VMxhlVgyRShtCsJCV5tnZOYU0RkOVeab0g
	WawtqAHdsQDnGfB/nUJpnRGOdmwysTs4X5NaZJtc=
X-Received: by 2002:a17:90a:e7ce:b0:364:7467:53e7 with SMTP id 98e67ed59e1d1-365ab9b727dmr1953460a91.6.1778049048352;
        Tue, 05 May 2026 23:30:48 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ce:b0:364:7467:53e7 with SMTP id 98e67ed59e1d1-365ab9b727dmr1953433a91.6.1778049047836;
        Tue, 05 May 2026 23:30:47 -0700 (PDT)
Received: from [10.151.36.91] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b1258768sm668158a91.5.2026.05.05.23.30.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 23:30:47 -0700 (PDT)
Message-ID: <8d57cf55-8920-4474-ba56-ec45f007908f@oss.qualcomm.com>
Date: Wed, 6 May 2026 12:00:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: devicetree@vger.kernel.org
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MYxcfZ/f c=1 sm=1 tr=0 ts=69fae019 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=s5jvgZ67dGcA:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=JV2eVSZHMSyV4Tj97bsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA2MiBTYWx0ZWRfX6RcOH2/+lGor
 PMt3kN45W1iekZCOt4senVKC7UFp4vW9FHnLPlJkkR09cFrGzMEJL+MAXAERCEHthMBbxSNYiNq
 W5QW+9CVj7nDOv0CgX+vMxnNCUFubOzI8MrjfNQrRWpye8SmKokFB4LdxbvNoqSv2kpjmulaHLV
 15u424jBRfl/kKKxqTR3qrMoq4z7v7PsuHlwK21gg/b2Q4OoC3aaQnlsWiROt3GCk5D3mf0IEjM
 0F3FenoXkHhOHVWB2CjwcelvuqEUvmjH2KL51R4l3X4sxZvyys7iKMApYRn8y106swr+0/z1nrB
 +S25p2u4PILj13/CXVqxmW89twmVXNT8o0DwmIgSkDhQF/BrdvjaKUZosT7lnEA0AoPhjn+XF5o
 BoF7aj1rL9ZV6QTZgoi8MlZ7DfTKkIbyfAPWCphEP3i+CL71CaUJ7cVf3HqU3gR8WYD6R8+7Lyw
 YigwV4rM/JV07Z35Cqw==
X-Proofpoint-GUID: EIwlbR2pG_2NJTZ4mDFEYxH8xaCMiKZF
X-Proofpoint-ORIG-GUID: EIwlbR2pG_2NJTZ4mDFEYxH8xaCMiKZF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 phishscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060062

subscribe
