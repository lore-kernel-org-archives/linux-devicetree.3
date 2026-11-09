Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213823;
	b=FNiLANeNnwUa2hBI8KxtgQO5JLDjXY7rLg3pg1FdSzq9dwapOtywYaqVKZhcvozcI2u2
	 /SBpydQtDZhLiH0tYz0u0vbNCysSYUBoFFx+rlx0ZYpf/vgUcrdvOIWKl6h8zVsJnUCKe
	 Rv7zujsixPeq813DNqreyffXRtepuNN41+FyeJaV2Ji0L8FajA8vYdwUFN6UhHJD/8M8H
	 ElBvLmjugvXhlVvPIXeIbMOMV2dsa2BEOSgBe8ceV48xReGWBS5M8jGowEPs6i6V/Uit3
	 gAeB163DuZF/l5aVcGbXqNMmYrmG+4avpqvcSwEoGfkqAQtowvkA8V6pntA9kCxAprA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QZinr1IAPmVW7r84wj/qNINxqSVY9URVBnEwGBpoonE=;
	b=tpqDMUc/TEIKnIBubfeaXfZj5sgO9ErEUYc/JH7XNly2Q4blfhSMAK3nQJFidojO05qH
	 9oPn2eehsAHncvU81vfZ5KgphYC+upRX4snxeIwmlWQGJqqt3wtTPylu9P/DJL+fvHTsr
	 gXV8iMX5THHrGorui8OhS/43oE0W45dNjIaS8q6nXTo76krmAwNQ7uysdwRnU43aQbvOJ
	 ZxyNJj1FYz8Hd5H9moagKwm7W4X4caCVg/9mikZQb4UIylntqSHyMw2q/yyhfmRHjazbp
	 Fu0QONyYXhfy1ZSRrH1jcXq5iAbmPAV3tzD2oyYtl+siuCk+oZ6PpstnGQDU9mq54Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvGR+y+0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SOGy5zDI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7C2606A323
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D7C2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvGR+y+0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SOGy5zDI
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A9933634458
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 08:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QZinr1IAPmVW7r84wj/qNINx
	qSVY9URVBnEwGBpoonE=; b=VvGR+y+0j8b0rhQLb0HVC4mSOI+FUqfuaAEz/Qot
	axbIu+LIoxtWGQMG7NMBK2wqU/Zg12WJ2L/eOBsviPDqCh2xbQonaFtAXHPdXrYR
	PwE3/DphKE5hepLXvAN+Tj5xf1iZAdAMlj3EQikKBa8vn5alDS2T+7eaIXOhC0iT
	0ZTAZCaTgW/N3Fqjs6c/JMWNZtQBRz34MjrAIz3R7wSMnakEv8NX0RyOvjIo4e4L
	9P6a2QVx3POhffcGv/RXdje5F/MwAcunv9j1CA6GOcgcpdlY+rjDbxCUf01sAv9S
	i4UvFFYJIpdo0x+Jx7OcfA36tAl71VPMy1/mFy6+ZY856Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2guny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:43:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so65133085a.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213821; x=1794818621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QZinr1IAPmVW7r84wj/qNINxqSVY9URVBnEwGBpoonE=;
        b=SOGy5zDIrjS42khZEbmK4fz9VuLy7/WxjHA8vDZB6HHNH43vt0sQztxXAq7BnELLzD
         cJk4PwQBWcDj9e5kQuzljlpaW3bK/ZNSmGhfXYb4V2Aa9h/KKCSe6T3+G44b3Cm7CKM4
         2J0fDj2wg8DePiyjyvbfx9UyMuLT89YPtZuazFHEjck2yv8lOREdPxIXz/suRmjqKiT0
         Vrg3SuH5/ez+WG+1ZhYgJN4XU9ftlPWnAb3zm75BmvWGaR6wbz58kjKPJYG94iJbETZW
         wm9rIYeiVefHLt6RoiMJuwDLy62RHxAaee2Bsidz3Z8MiwydDkoYhG3JICuvdquz+IpI
         eiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213821; x=1794818621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZinr1IAPmVW7r84wj/qNINxqSVY9URVBnEwGBpoonE=;
        b=j8Ax/Xl2h2vd1lwOkjsF5Tt64AknIEI1tMkumhJtzH+rGBEr2773NyCRfDAwyMCglc
         QRgAGJwBXNkflf68+N15y4XZzfwbq8Fpac2MOM2PcZ/CvGsbWX1l4+gN5HZaofBQt+WE
         rpTGQF2mpDd7WNgGzmIuJJjbI29c5aPkNQHMIbKtQvMoRnE250F4X73w7+z/D5jy+WB1
         LH9K7trnYHnkG506W7vRUJRtTOq1SO8AHfjVxkZiw27fDfXPT9H3TXgPBAEXa/+aLjZd
         O/Lx1aJhn0Me3JqZESaGe/+2Rfjlk3I+72HfUVMUL/jLr2emeHMT96JqI+7/8D3Wk/mQ
         LZsw==
X-Forwarded-Encrypted: i=1; AL+hErFBGJU9/pG4bpe6hal4QdfyN5BPWF2PUVtUTGI1yGxsb8qVCuVYiNwVtScoGgd0gqvtdZIi/zY/mIZB@vger.kernel.org
X-Gm-Message-State: APuU4Z8FIWnhAgkTRG4Rd7b/Rt5uRLpzjKBPHMGT/gO3kxyo2VUEZCro
	TTyNkQcpa0ay0xZT7e09ZDApc7BrF/x5LP10RqsUc7r1e9TgwMkYMTznC/LzWga0AqCvOJeIbX3
	b9Gdh6fQgoDmqL/Pi0BhwxRQNGQzUEqoDqg3NW7z756D/cIETbwmMPjfOPaxpxWso
X-Gm-Gg: AYBFou1W9YOip0P6rP+GT0T+gcoBkrQmSuXqzlv+zqPZSYuRdWCNfEayLrlnbUnKhDz
	liXnhRBfHnJgjzvbybgUHl/DcpnoBhy/K4FR7yJNA/z2ZDAko4x05SBGSunKtDjyY/LPLGnxkZy
	QUDsGQ6p4qsa4/lA6tcX3qypeGSWu4H6GivDWxXMLIJXbDdhUGlMSNk1cfHJA7qT+Gz7gAWZVYH
	q8ZLwh8EcA1Itc+piQGauZmf89dvinZhMgXCj/V2vuidGaF6kRGusu4kVR7pulFmV/SYH/9V+Q3
	yrxcTMz0zuGEJ55wIV6bQaym6cVjEi+FAC+HCZMfxNofY3XklbOMYCq1H+l7V/BezW/aJ+6kltq
	XL9Lq2Nf7UWKfaaIUZlZ0tFnMrK0dwJEhMfQwoP80J+EO2uKJYXUUDMi6BpMDF0g=
X-Received: by 2002:a05:620a:6601:b0:93e:c12c:fbbf with SMTP id af79cd13be357-947842c578fmr423490685a.76.1794213820760;
        Mon, 09 Nov 2026 00:43:40 -0800 (PST)
X-Received: by 2002:a05:620a:6601:b0:93e:c12c:fbbf with SMTP id af79cd13be357-947842c578fmr423489285a.76.1794213820190;
        Mon, 09 Nov 2026 00:43:40 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm111001085e9.8.2026.11.09.00.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:43:39 -0800 (PST)
Date: Mon, 9 Nov 2026 10:43:37 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/8] arm64: dts: qcom: Consolidate Glymur CoB power
 grid
Message-ID: <643lhglqyf6322f3jmioy7xwl5uuqgy5m36wfh7okny67zxz4q@ommxzt73cwkj>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
 <20261106-topic-sip_cob-v3-2-52cd3826ab49@oss.qualcomm.com>
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
In-Reply-To: <20261106-topic-sip_cob-v3-2-52cd3826ab49@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af187bd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WbsCytHUCBBKkCb54EYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX+nZuCb3AjJ4q
 Ex7w+0asvJi0PxR4l0wW+IYc8CQEnBRKnJHaPHgVSyILtthVLS59KhJwLStmZkiMtTclMuWgwro
 4hMuYenQJsuufEyx97qqMdn4F0IL3pFeh4wErDFss4kQF/WIFL4Sc/qMhf73B4Kk/hMprE3582h
 Cmb1T8w0p6iAQ/VXaKqomiN5InnHZy0qpvIAgMPnJjVJ7GVTel1jmBi1fDOfEskJB1OxoN52Q3B
 5w2pdK8d+71dmBsEMf/542RPLgSMRiZY9yuVCZ02yXdT04bGek/9nSwPSGkV4GLqOgDS5bp+nPa
 AdP13iVr2bImUB5/4/XuBmcTnmfeeNpL2EiVj0Y/+4+WBZZ80UWLs0dxPu+t8SQq/99x9lKyjkc
 /PN9TvrZcDCRb//YYP4CmZYmooqDioxtnkkudu2+CiQLU+Ai5xBpiDCC/0v8dr79LERxubnaigr
 YTKSHI/uQsTLN7OqLdw==
X-Proofpoint-GUID: JdldhHGSePDkr5Ra-IqEmaeqdpVQ6RHw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX2mKHQY12oPPl
 RnFLQC/UkEHN1j9bhVKU5O7oA+xfxjSHwPlHMFMEqv/gka8TrONAEsQkVR85kj1eI4JjbYOsXNY
 cdA19FxTQ6lq7Axc2L/EUqhqIaY0ViE=
X-Proofpoint-ORIG-GUID: JdldhHGSePDkr5Ra-IqEmaeqdpVQ6RHw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

On 26-11-06 10:29:03, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The power grid is partly defined by connections to the on-SoC
> peripherals, which (due to various reasons, electrical and practical)
> are well-defined for each PMIC configuration. Factor out the common
> bits for Glymur CoB devices.
> 
> Because some DTs (mostly the CRD) disagreed about certain values, I
> made sure to look up the desired one for each of these common rails,
> they are now set as expected.
> 
> This enables one to take care of most required vreg settings with a
> single #include.
> 
> Tested-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
