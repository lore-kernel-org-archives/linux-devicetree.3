Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507362;
	b=qqqycgand47lQFBliw2fpSwIHA8j91Fly4c0AhTlAbUwwxvhYVdmBndE1bpgHw0yEb7/
	 9EnZm5u1FfBzisxbQ4CZMLQ7YduWBzwG7zIvBkAxK06k5tWoE4UktKeDyULvaengZwMuV
	 2lIVyY3Fkr6I0KqXvYdWs7WmF31ZRfMQRqJ3BDpkh+fb5t1DCYRdrbxTFghjlU1oMXRCT
	 l9SsV3N1QnB+JC95Feg2dsUyYvL6RSoBodBe7Gq/KRLNNtTK9yMbPXZJ7IQ8hmGqkLOwu
	 6sD5vG/i7igzmVE35sXmi2XKpwFkTa1fMMUxGOoC6Qi1cjeYrhNOGBAJEq3A3IeLUKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZnQPJgkZZu8xkO02BNLsnjQPwQjZq8Elk44wJNhSTVY=;
	b=uKn1JDS8MgexWFrSiiQIuSeGvHyUkaeAtR+qxxWClVd5YU9JFb60yl9ERuWrtcSQJiah
	 J0P+Xl5abFo6erkrHGw3EAmz+XRiNZGaaKeeVTkRmkIkUe1mP3bR8x4Tj1Cu8RwIunQia
	 PdKjJtiVWgMk+CQr7Cz2m5oN3s434ieSZY+xaZ5bx4m1BNEEPPN9LRZETciP2fnH3kTti
	 BLwBFZYxjDmxakhHc/qYfseqYteQlknN1auuphJyz4p5P/aQ1sPM24Kpvon4NngPYVQsZ
	 uaqajIv9A0XYwZwpuPzjCtwK1Nhqm34PnTEO4UfiGP6lSCMsGMUwhSId8sYNBmFQDTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=baR18xEo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8eqkpUM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AC4606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3AC4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=baR18xEo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8eqkpUM
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kIiX2208973
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZnQPJgkZZu8xkO02BNLsnjQP
	wQjZq8Elk44wJNhSTVY=; b=baR18xEo02GhDXQIJZmctaBVYOdtV6iV8Gs0QlND
	aQ/HtgxqYPg7YUxXBVtM1vX1SY742t/5LDqg71XbMgelY0Ru3K3ngTaoswFrHTSP
	fIOseEAfiejKaa6niUJL5zIWpnCztAMu+n9nEavB6htxb4X+qGM3rtGZ6z5sOdl1
	TMSr+jMnjsQKhViQnHROVfbNkF29dmNbxGDPdpF/wpboAM+yizyjwyY7Fz5SODIy
	q1/6VuF+L1MrL3PScm/TCiKTRglVVID+7BlD5cE7ABHZSxQtwZrbnDfvWsLuAcn1
	NgcITYU/DZAIfzQtBNKm5Tf/QJ84zXfNYLhbr+Pubou+Cg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy11hst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:02:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5908481eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795507360; x=1796112160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZnQPJgkZZu8xkO02BNLsnjQPwQjZq8Elk44wJNhSTVY=;
        b=g8eqkpUMY2taOzkT36IrLJAjUUWry0covxwWS9SJcaMrKK4T/cTHOBngzSg2/pp0Jg
         9bqcVvEiiD4Vjr+jtdpHG2hCjYMzibfwNQSLqXAz6vzNYb98O//m5+GyPRhjHFHZjdI9
         oZlgMMWODTIX5oqTbAXeCOptSaB4j+BZF59RAw0AgUbS3P7TmRhi9bxK4UudjW5x67qp
         7Ime1ge9MFvFnlEzRYX4l961rAC9oBxuTDlBuPZOBr1qzSAVsfR3G5cRzfmy/joan16H
         lqNgupNxgaumCA/FFqPoSl2qqwGxb2ob3lgYypGHtyj0V7f+6qsozd2+Zffn2HUemNCl
         6pMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795507360; x=1796112160;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZnQPJgkZZu8xkO02BNLsnjQPwQjZq8Elk44wJNhSTVY=;
        b=0AHGYP8KsR71GhcUYjOOL82v+M2L4N0IfJNaqNaSPdcm2wUqUyInjHKXnG6b9+C1vZ
         TNrx7NYVNlntdGZmYvgffJ/fD9OPTn/OLmvdjJbBjBhR7L/8TKyU7jniZ2RfSp4ZTxct
         f5jFWxI8ttx3cwgF8vqwyonIiDxdrn5And1HGF5LknXoUWohuG+g/uL+DmW3LCeiK3d1
         ICvor1KMrU6H2wlRRSkJsqzm9nhyE3m5aiGbChZHLp/r8NAqaPBpypGeuS9+QviOFz1r
         oAlTzV0SiWuVfAVe2RoxEWDiboK2fJPZvm76M3mnqTWLei4wZe3FAaUlDEjbwVhY+MnD
         uUcQ==
X-Forwarded-Encrypted: i=1; AL+hErFk09OWsFJF/8OWRZEDrO2Ri6TavG2noIn050ihA/OnvqufBZzYJC7+wz87uRH+EzDgCY5K+kQRF1PR@vger.kernel.org
X-Gm-Message-State: APuU4Z8O0YTDi0PWxBK64laH0T90Q6/kjCkhRXO19FIZXYgB7a2GI71a
	JvXWDF96kOV6HzklH23aOunW6GTgukIEHZFNw8NFeIZxyJniUUjTpmDAC2XzHFqPuAk/3ATO7zN
	HpMSKpq8hWVazytYXojcjZUxt6abJdolxCFn122Mzrx2PPtKhXdhFz3I7OHCrqPue
X-Gm-Gg: AZFdTZe/h9lrnhv8hl5/6AVPwJrqL4w5WS4WHfAMByehGsh3+X9/yU7mX9wUtSUnMTL
	VKkqP58s347VmJms+QdXseDdG5UahEaISaqYsF8YVMrcbViiZj9p4tewgVdeUYgxU3eHpEUDDvW
	/xX7O8/KPZISjLsZuMxBwLXJQlKigTWN/C+QtLqXudpykm7HOD26+ClsLxRvVJXI8cOuv2gaeXG
	wgY+Teat88mS/8ekZUGhoqv/5bLLqHqbseaKZgxiLR5ILjaZ+s+jQB6HanjomPMs6heEfLXrqM8
	uFGnKeLXC+7UesVDQNhmAAwYDS1vZiBMRDOfXRWRExcUJrnqD53LSY4UbUqlTzW8CypaHGhftc9
	X1c9GfcgT6Tnx72kWyBpKe/PQJphSrcuvBh7I3+TYKQtBJTB3XcteR90pDUr40A0Bu0xENg39xT
	tAvb2PRD0Cq5oLs/VZ
X-Received: by 2002:a05:7301:424a:b0:386:b132:6eaa with SMTP id 5a478bee46e88-386b1327096mr5323683eec.16.1795507359767;
        Tue, 24 Nov 2026 00:02:39 -0800 (PST)
X-Received: by 2002:a05:7301:424a:b0:386:b132:6eaa with SMTP id 5a478bee46e88-386b1327096mr5323651eec.16.1795507359246;
        Tue, 24 Nov 2026 00:02:39 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm74469866eec.3.2026.11.24.00.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:02:38 -0800 (PST)
Date: Tue, 24 Nov 2026 16:02:33 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7225-fairphone-fp4: Use
 QCOM_ID_SM7225 from qcom,ids,h
Message-ID: <awVEmRII9RyK-1gY@QCOM-aGQu4IUr3Y>
References: <20261123-sm6350-msm-id-v1-0-99482c9ecc48@fairphone.com>
 <20261123-sm6350-msm-id-v1-2-99482c9ecc48@fairphone.com>
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
In-Reply-To: <20261123-sm6350-msm-id-v1-2-99482c9ecc48@fairphone.com>
X-Proofpoint-ORIG-GUID: FBe2mePcULgPKq68jPQYtkeyYHTbUYPe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMSBTYWx0ZWRfX3bwMsTB/cHGV
 LsQPqsqG/+JkiT9PHf+9KNCqx3+z/Uh2mE//+82qhd7KqC7Cvw3Cg/ykZ6kCQAH6sm4fgRvLltH
 9wdO7rCJaZQBtDZQAu+s9R4awyQi5ZQ=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b0544a0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=b5bS7s7mT8qicE5fAIAA:9 a=CjuIK1q_8ugA:10
 a=AYr37p2UDEkA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMSBTYWx0ZWRfX4nIzzDtUqHRF
 pPc1wTBcEEHN/1NnXMP0OBxEfPoCVrsGeMsv3sh5Gl0re6BdFr86lIpdOYRTlHLQdOdwrL4WrqI
 KrwRpdQuwDan2JOXZtia5HJtGpn1VFssvbwkBKa+u4EdreGNoAUjKmnLAmlW1lyEfd3Xvrd87Cr
 jkBP4mZI5/DLZ8QZPrKDbeZ8AVz4N8wqhNso8VwsaKp2Sb9jAUhCDmDL07HUmzkkdSd73/Oy0J0
 WnKIGNPUO3XEFqMYGADC5qpxmfStI0sEonyPnwbdk/npXyNGkXVlnrKj8GmbWzYyT1R3UFh46wu
 R5rJJrtCPCkX2wYC3aJxOKOHIThAQPE40j7dTppxE4jB/LNaZULExM/LRAoT5XPHqe/oj+esbeY
 HgZkTWlL6Ogfc7+I57T4oXbMZbrjHIcCWz+Cs3bUvdPoLrq7ak5ZJM0WN66sMpsh+5Diq0dk4CX
 dMcAD+I97XpkUuoF0yA==
X-Proofpoint-GUID: FBe2mePcULgPKq68jPQYtkeyYHTbUYPe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240031

On Mon, Nov 23, 2026 at 03:46:34PM +0100, Luca Weiss wrote:
> 459 is just the value behind QCOM_ID_SM7225, so use the define to make
> the meaning of the qcom,msm-id property clearer.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
