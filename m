Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874328;
	b=IN+ERzJNpKR4pQF7GucpZeoIf9dzUf1omwPVgNscBBwa95RJ8q5zSpPdgT5/U7TXyD3s
	 owEhr1eorE6Y3zWYLw0D7SHODoIHWoo7q53d3dpCSbCnX43DtRWqxcWwMUTRAS6fSurwP
	 F81oFZZU1gL80uiuA4+tacl/N74oBvTOXee6kvlu1JBDnIgSMf+JpkY4hSwrfaz7QSt8j
	 3RVsZQLdmrBacTNjaaW763W7cOtejzJZI8CW4oPBpOXpmqtN3aPZNsD7mgJApaYzs2cwc
	 w8zQTEjcI3JXfJMysKLn7Kykge7hv9s9P5La2B8B9b2Gm7uxAZAGAymKGGEkkwv1oNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874328;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jmQdvOcLeHgrhM9Jlt4/V9JsPNpFugxpi7xLAla95oA=;
	b=BewmJ6nKP7+5Orr3MFis9o+SoEOseTaqpsYIgi1NHZkQaZQEAbBfAvJYMMO1ZD4pmajF
	 mdclwmKbA1YZiakxjpGbyx3jAK5WtuM2Wmxg5HYoyrFaP/ycP4yZ6mi/Wj8IN7c542KBt
	 Mm6FKEQRV4VwiD3IKxGMciARW2sP50eNxLAjl6gW2buFhYpnySDJaLhWglvt4ltmdUxZ5
	 cuN7vs4hJ0igCx3ewLueoHpU9O58J/yULfYSh+BULF6N5Y1fPftTC8aJfXGMPVQw/e9jC
	 w2YXlMisEFLuuoziEk9a0Ty4rM8tfVB7v3VwXety70Bc11AGBSOZE1nLEsRQICFNS/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ag+f3dIq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cf7N8aGo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B9C606A31D
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B9C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ag+f3dIq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cf7N8aGo
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OIU2Ba3384000
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jmQdvOcLeHgrhM9Jlt4/V9Js
	PNpFugxpi7xLAla95oA=; b=ag+f3dIqoUJexnVqnzI4uMwh/evPI7jYTcmjNgoR
	9pqLAGpdFpyFiu1WAWLYI3SiZOS8Tv7t/NslhB+2JhZlTs3mXaAleXygJ7Efbrnx
	P0WTozD8xJ0vI8oof10etJSOJp3Z3Yama7xPixD8VZn0BkKWpXqQt+xwKdjAemYH
	4RYNljpRpdcGfVT8LZ++ZG6qU4K+iyFNPXSl8mVwP/VgF2m72jVTAWD4UfM0EULb
	CFK6UN7jZ336qI69M24YK8/e8XLzT6SWvRuUaQjKMYRTP18Xmkn5jvuyKJBUNQ9X
	ZsYKAG7YLa7WM92tIiZgrkcmoKuqQEjwCgDBXBgyfiW2GQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcgt2v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:38:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dd3c3badbso500498685a.2
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 13:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792874326; x=1793479126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jmQdvOcLeHgrhM9Jlt4/V9JsPNpFugxpi7xLAla95oA=;
        b=cf7N8aGoNpJbpDoveH2HnhhQPIO/esV9GjKpXL+g0BnHHW1fOR4gtXv11YhmACVnC8
         YZjt21AINs/gRqRvSEKhsfh0v2bxjhobVEt4nPu22gQ6RZmHV18n4VjNCfH5fBgScP+n
         /+El3WWdbHafCqG+krX3hdHS0w4+ZRkdq/e3AH3oaVIsqQ5hwqo9dJV2I7ZFVbESsIEe
         nvvur17Ymt1JoFaxRE4JWblVa2muUxaUKbUqTw84FTqjUkDkovSt8FqsmnWlys/h90t6
         JUlHH0K4SoJ2PT0JUCB2OjCpiBC5ilC0qAWM+vgy4bCR57G/NFyMAkvMpqYx4AJOp0za
         u9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874326; x=1793479126;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmQdvOcLeHgrhM9Jlt4/V9JsPNpFugxpi7xLAla95oA=;
        b=Mmgjgsn8Uu377M3ZLQI9eCrM2d/UMVK3GlrzNUytDXEHqKF2K4QjJH6vkwDpLpta+0
         wVs9xJ7Ognuhnr5obbRbI7AxgqEp0c/RfMMFThc74j6S6uULMPMM6SdFez/VfYNoaHgT
         03QrDSJ6kwfa9xY1NUWzUPmWxs+bsW+0RMWxVLCedq6foqfsOxaXe7iTXFf+TnBrzp20
         Cz85Ok0roxvpH+yMMhr8WteR+dsEEMNd452VsHLrlQ2UPFmDDdhTng15X4zv2IJioiDj
         oOqq68l+c6Pf9r8BlRNg70ZgHb9acMqAzsRPbwR/BqhKku02buqsMKqXSwLruUgH+gxe
         UWjA==
X-Forwarded-Encrypted: i=1; AKwUvByl6dA0LPi8x8QNsHLw6/06hBXx24au9E1qJHpzwPf0CW6mjxXzgNy2o6cWthkOIBuOmWhD2nUCpn5y@vger.kernel.org
X-Gm-Message-State: AFq9FYITq8hwKlFCIr9DdbVmVz8Nx/tbIK7UC7ky3i1X4MK439YyAAid
	Q/n7Xaucga0G4DS4BmYyLRnN8Yb4XDRytIhV1z3P8rQyM595Yp1jeHvtKb/2+lCQrlRVovZvCEC
	cu9WkZHdsSU3j2X5kh9kA07h+zlcsvhBYVxZ5SVL8kbvwuigp72jFRtKOWikB1QuD
X-Gm-Gg: AYBFou2m/njniQEa6fdZ9KNNIC+7KqlQV4V+oCjnth5YvXl+GajXqKRL/RoYjSpKTZd
	Vt6D5P2uJpCSjzQ7A+oO+d20eoiJ8IDNlbqnEwuoiVUpqvoVksLBiZFpvoSdf1hFkyLDB/i8Cae
	6oxq7R8kkVtd99KULvZiutsSFrdGOmLCuoGiSCQseDPD2Ae8eTIJQyVrujl3Ohgp+jTHnIV5c2v
	EdzJ/4QqLEVTYO7VPTMMgghcOzOOTd0N/QSijSSEWHBXCuP5mE+qHfWUWVV9oCCcapH201mMgIG
	mJBA7wYmDbh6qmwtRJvd4173i6kZbxJdUCZQfTh4St9WY/A/KiMMEgwAFpzbIFy0fqGNbu61Fgz
	u5UzgnI9ABfyJ9I1K
X-Received: by 2002:a05:620a:a8d0:20b0:942:e4f7:6104 with SMTP id af79cd13be357-942e4f76149mr101912985a.55.1792874325974;
        Sat, 24 Oct 2026 13:38:45 -0700 (PDT)
X-Received: by 2002:a05:620a:a8d0:20b0:942:e4f7:6104 with SMTP id af79cd13be357-942e4f76149mr101911385a.55.1792874325422;
        Sat, 24 Oct 2026 13:38:45 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d6f6fsm73963625e9.12.2026.10.24.13.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:38:44 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:38:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc
 DT support for Nord
Message-ID: <p4auxf2q5hzcdwynse75ipjmzmlh625shldy32ovlv42gpf7og@vy6jv5kfs7gn>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
 <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
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
In-Reply-To: <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MiBTYWx0ZWRfX2y4/xZewDqRd
 yNBRa/aWezWZsUElKRPiI1Gx03vM7lJtxkamxXAWeNFYVsxP8QAOQJaGj5x8D0FgFIPzJtyF1z6
 n0vg/TNN9eNl7HlyZ+Tb0fU9RYJsrg0=
X-Proofpoint-GUID: PDAzLhg7hwIjbbeid7R2z6S_DQ1t8VXA
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6add1757 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OoMBhQ6JWsPECC_GQXkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MiBTYWx0ZWRfXwc4xi4EIIyiO
 39vaO4LsKMxn58UHXEhsavwxi1y3KOCLLoNplN6UTbmlOkcOorWKNc5rc3nKYmYS4RTFfXyYTBi
 HwDGWaCXW8g0ZkQR3YEgciMlzLxzm9Ldud+rbnnZ/Lr+TUVLyqtR2iUZeuMGdBInNNgiREWdS0V
 QC4cwBqZmfGjFPT38kc/kTlpoFEw/Tu8NScaatA1DFjEKMfhr1Kbo81vmOXymXXWryRlCA0PkiZ
 3e/uJBS8bgPi/36gHW2L5KP+YdujpiAKajrNHMYZv73kTe1BzU8D+edYNHhMYiDlDMhn63zK/Kq
 oxY6/wHDISjkSM1OEotsLfUzDDJr96jz318az25cleEy+u16cvkGUmSNwqmPqffEnb0oxETLSps
 48oL7LB+b7Z2UUOHHNH76JRLUH3FI+SiHtWOFnnx5Byt6n+zeWTU3F79wosyGBX7U6EiCifqkmX
 Kk6DjvHYuUdfSSru2VQ==
X-Proofpoint-ORIG-GUID: PDAzLhg7hwIjbbeid7R2z6S_DQ1t8VXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240082

On 26-10-22 17:27:01, Anurag Pateriya wrote:
> Add the SoCCP (System on Chip Control Processor) remoteproc node and
> its SMP2P configuration at the SoC level in nord.dtsi, and wire up
> the clock and power-domain dependencies shared by all Nord embedded
> variants in nord-embedded.dtsi.
> 
> Move the SoCCP compatible to nord-embedded.dtsi to fix binding
> errors reported for the Ride board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
