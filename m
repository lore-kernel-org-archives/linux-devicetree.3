Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378548;
	b=henJ5vNl/KxNn4YKkrDPMWub2dMzsdvjsHd1u9az/BDSXBVENJLDDAcLh4Y5K+s7+1f8
	 D/MJd3rRvN91mr4irCxsgE4rSX8LRrscJQqZkMujIdW/b3pHxU+fDrDzvoAijU7s5p6B+
	 e481asm/WYG/hVehtNQwl4/A8qwMxYbKqul5UckCP06GhsBJqYM+KoYZ+ZxQ34yMJuMZj
	 yoVZ6zw5RQL85DRI+oSvxEi36kg8vHGj4+SF5gR2juUtyBw0ryaQC+A1gBdfu0QvOd4Qz
	 NXee7yC50yK9ji+AR+aK2160LMMkX4+aKfCN6p4HVV1WpHqozGgTKtgUM/UqbWDRKtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378548;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g8F21DZMe3A4V+cCXI32wwp1x22mpHQp2eEhNQy6rZg=;
	b=vX3vZz7tYsnT+LcIjUV1UiD15iGtjV/p2w2aL5iibLZKwt8taKUSAXzJxEE6mLbU0iIY
	 Q1RYxRb69DkcwYTwuXeg+mtOUTRuHg2l/UMF2y3qV9DmGUUFc3pRYrVwplWpCWo+O6M2n
	 WyoD9u1fI83uIfI9YKVUAFCYFEmWQjamF5u5bODo6F+QnLMliQZyU3lRfaV9vcLCk/jJA
	 czk6DNIt/UM+dBSEc5aXWsbTZeDz7gDQ3G9p7d2sVtp+ojccpKfKdT0Z1/YU5UqJ/a7qA
	 DiT2yuSalQd5PI1KApI4NUo1I/WcS5B2FKvDG+5mhspGyB7sugqxnlvNUfNtCaF6sGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GxSHJkUC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZbeKqZBP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DEC606A320
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4DEC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GxSHJkUC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZbeKqZBP
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERT4i4142004
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g8F21DZMe3A4V+cCXI32wwp1x22mpHQp2eEhNQy6rZg=; b=GxSHJkUC5198O8Ih
	SFnWSUT53ZoG6dH9Yayj4yDGKREpJGRnLtX7RA3nqm+mNj2g1+HV5ahmoXmZ3B3a
	7W90tx0e4RUB2V/PFsJejoe/qQxXh49tXekVD2f8n/j4QlXIyBHaZDt9UKX2Z15Q
	k09XkDyovLji2vHvW7BiAzDzTBuZtiAJIBp5EzZ/Ebri7RjlhbpfhbVQRFxHWICI
	JSHBoYz6hpmjNjFpd+yLZcsUFuSflhVaajs5+X+BPTj+Dtl+fredVi/giyAyGWZu
	2NUU2n9ydMEowgV/XhZuNPdSenzEbbLtfsqwToyBxfANnhaZNTWVjhhq4AKxUDjM
	44yTyw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qv0d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:42:26 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-70273936138so682454eaf.2
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793378546; x=1793983346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8F21DZMe3A4V+cCXI32wwp1x22mpHQp2eEhNQy6rZg=;
        b=ZbeKqZBPEpk+WssYYbYsqnCrGXDed9tH0gpmBh+dH1Q257uHUdPvy4EYTvtJF+dr1r
         kZY/L+ZcycM47wjCKjkVM7ByrtqHwJcqd8IHg/jkxagDzTbHCMS4boNbWrRBplKoY3y3
         q/ppnPMVXfTk4jEs5jYM0zb7PXR8sp4p5zO5phrhVeGz4mjm49vjYdmDmyZWw/QiNtbE
         t2iGYWzMfqeEXg9s1wl+X5y4QZlf7bpz80svXM3RX6qjctm9bXKwLAZlYzmjSeNT20eM
         jpj2gAgpSz+sHhxqY3y0H1TsQoj5T18IUYmFaoXh/2tsRGA397og8Qgbc36Ip3CTWKA4
         i0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378546; x=1793983346;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8F21DZMe3A4V+cCXI32wwp1x22mpHQp2eEhNQy6rZg=;
        b=qzKxwjlsRpntSkwpYnx/34LnBTH/Mn0g0Mixh/3YB0FFj9TTKpl8zWgeETdX7T3LlS
         B322HNpF0+ETI1bGPvNHe8pMEr6IsdLaSyYjIW9zpZacuWb6h5C2oSdt4ir+GycPjfCB
         t9BD6qkRI7o4jNNRbolyRe0ITDEfz4Gf+ZuCch+f98j6lsse13BivR7CmuZWXR5MKp3S
         Mi4x8YI1kTeb93FDQepWhCG8zFnb1uNKI2DRrhzyuUmNVa5AWhd7qQGG0OR2zVbjCfc9
         69+t+l8bKUrZwle7EWkbOoVDWIJgStUhgGF8f9onIzQkakDk4csPs8YydVnpGSozIIba
         qNXg==
X-Forwarded-Encrypted: i=1; AKwUvBy8cKEEfo15H/J57Z9AAiPfcHQk9W3Gg9emDyipX/II4EGFXV/+N1eBxyZF6630OMCGXPeDPVodNj0B@vger.kernel.org
X-Gm-Message-State: AFq9FYIShwR1/+U62cZAX88guysyAJOAR+ZkIGD52xOU1TxSvxLm+p0S
	Y3kWVY7XoLVPj7meeYSxuktBCaMgKfa2scjPeif8zh+MimstHPGajXv8rApH3Q8XXB7H1Iy3Wvv
	rVhcs8zGhzxYYNYwVLOd1X6s0jVpTBw0Ymb4eisxOBgYJ0gvpCVlWFwCHxluEBfy9
X-Gm-Gg: AYBFou1zikkKmEt5cve1SAYLezWnR/usokFnX5zFMk7X9vsmDh++NCBpngV3p4B2y1V
	0wsNWSfLhqKsiKT/1iAxwOFCIwf7Ku6KFkahtx0AWuQ3309/g9Fb66T0WUnAkyujSCVay7QMZpr
	SafLK5aLBxyqXIalYGrQX791l4hzuFYQHjdOE/yC7R/YvfQrEgDaZTFGfmrxRtOI5lo6pu8woPP
	+IU3oI2iZeViv2omEaS+vLeAQrXAM17Dly546N00k3XAfhL+MZ2bEzbR/Bau0xBcRnex9OzdF3i
	3ES+DkdywpWjeRUegrQ1RchV3Zjv4NkDWXvzN4U+dVjK8lVp1ed5A2SFJ7rgUgu308QkrbRjGbj
	OXsktc8FShRMlEBUYfEikLng1d/M7H33v3Y3LMaegFNF9a2ejnGO009yzUHfq/JZ8eryQ1gxdwo
	KK
X-Received: by 2002:a05:6820:1354:b0:6dd:a0e9:1ed8 with SMTP id 006d021491bc7-714f25315ebmr1576138eaf.57.1793378546013;
        Fri, 30 Oct 2026 09:42:26 -0700 (PDT)
X-Received: by 2002:a05:6820:1354:b0:6dd:a0e9:1ed8 with SMTP id 006d021491bc7-714f25315ebmr1576112eaf.57.1793378545592;
        Fri, 30 Oct 2026 09:42:25 -0700 (PDT)
Received: from [192.168.1.14] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a818b9sm2364487eaf.1.2026.10.30.09.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 09:42:25 -0700 (PDT)
Message-ID: <d21ec697-c3ef-4bcc-a74f-128191a417a9@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:12:13 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v23 15/15] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        rshankar@qti.qualcomm.com
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5oIuQ-Ys_SAN8lKDF6Qh0Ij53SfXfKQd
X-Proofpoint-ORIG-GUID: 5oIuQ-Ys_SAN8lKDF6Qh0Ij53SfXfKQd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NiBTYWx0ZWRfX1J/VS6K50cie
 TV5KWUdLe3lndbhvEe8PD/yN8+VsVoiq48Is90vsIbYwujbA1TUaEzREadwC2XeezhBus3FxD1g
 nzYrgrAiF8+ctnM7RaqfX9KKAHhGkKL8IStsq3+bUE4jhgvVICOayLCyA4n6PbfSRUix9VdkhOs
 qnrtOxgYnq6jmli24hBm25HROSFX/48cz5kgb41yBK7fQnikQzIMbL7CGUGnZSbIkG82A2FrMiB
 aP5ZJwwUAqFs1FuVhBhxn320IKyA1QD3fyW2wGohCCPIH/5g+mU/wS6vXcNkjY674BwjY3Rx7u6
 FIzkMkMTz8UjVcEC2kaiyQclz4iP5oxDnMWGE75+G3As5Fdjsp03eCVWEDq7YpTEjby90OBE6Ju
 o90ayDvBYBeW2efbLsBP2/fwNaZwrt+Ei/rh3atqfzfeYrDkpEXp+3YcHvCLtpItN9BOda0DApj
 VanfSm5sXnljCWtEM8Q==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae4c8f2 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WWpD2f5wiKzpAssyet0A:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NiBTYWx0ZWRfXzZX1tWkomPxg
 TJGHVb9SKnwwosvByWT89bG6t8PNxYla6Iq5nFtZTUGeutxrht4Xgu42CCObS7khFSQP7JjvCSE
 JVX8nUBVe2zmXCqjppmTFP8zX/hy96s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300066



On 28-10-2026 20:50, Hangxiang Ma wrote:
> Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.
> 
> The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
> DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
> lane mode on a rework camera module.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

-- 
Regards,
Nihal Kumar Gupta

