Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463396;
	b=hFgQxDFT0mNYIMd9Icyi8ujfF7mC0TBUgYEaH4YHU4gbR1unk2j4FT4LiLl6THD2iWX4
	 +8yRQDYZoamlJ7W/Iukweka2vn3XgoWFatylHSMcqwl6dNGwpJiGdVwsnk+6kYa1aEUTn
	 4B+/gIH32DOyXsELfwpL15NnEfeha6sWOd9WsRPm1Pp79K9/PZIBxtsBRhxS2zJFb3+GM
	 E6JWDDn2gXKmS2rkdwANR/BSp3vM5OODThlEdWreSiHDVJ3ev8sxpGp5kmElXVAOOxlrB
	 Aqljv5BArpZJO495m/+G5CVcZjETgNbdSXrxjcHcY8ZdEjvoKEWdSZGyADpAvV783XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463396;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CVJa0ec1ykJPShHAKneJEZU3KbXeSYGrLRw9bAOsE8E=;
	b=n2L0vt2fzhDWTBCmkDPkkq9JQQuWrh9nPlcOFpE8yiuJoGPwwounFreFUSgiGavi/lSM
	 eibgXPKXMiKKVtBXtNvBZy93/yRySyAUA3BMQKtoyg1tw3lwfktDrRVybPhnvHHov3AVi
	 XehUMNRHIbaH5GRZrMCIVDUq/fX0uc19xOEDxdO3kE6oRgyuBSe0OyJj87S9OhhVe6i+q
	 /c/I+7nltd07zXdV851os/mtU+l1hWKTJabewzvDrIzixMxuRxN7Z1JNVR7FgGAd3bwOj
	 AqqISNQi3h9NLWDwsRqhvSMysKSJrw7THKHitX6uyAswW8vzMwyzHvuObvWpi1A1Kag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNFDQYDl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QFCerCUJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E01B606A32A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E01B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNFDQYDl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QFCerCUJ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH8K22487483
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CVJa0ec1ykJPShHAKneJEZU3
	KbXeSYGrLRw9bAOsE8E=; b=oNFDQYDlUqLDGYSfWQjJgUc0WhKW8Jlb9ArxRPaB
	JWgxzwCvr56yY2Doe23s4TlGFoH208Gb8rALErW8OFPHulDOE3OqhdwqsyFpuZfY
	RsrOin4v5QtflLUBmxtjLCLj37mPfH9H1R9KXC/LPUljoBPOoCYYmP2bA5KAWZ2h
	r6dMkSUXHyehmwbWW+CTxb/oC7arNxGXGrxNO4SlBV1ZPXk1TaZfnlu00sfI0CjX
	H55FTe4ZsCkd/chPEE4/qULcu6G1Z4pQqwjpyM5Ob/iznvZBK6H/ElhcZbGlNlzh
	cf6IWlY2a++noDatMBjVbLsyB7m0gD1PyoxM4QQmweTBJA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy037hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:49:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944138ed63fso75889385a.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463395; x=1796068195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CVJa0ec1ykJPShHAKneJEZU3KbXeSYGrLRw9bAOsE8E=;
        b=QFCerCUJsn/K8lSCVJmN/r7GGi+o976WtwkmAfwUwhXiIYmx+I6O1FZ4iOsfFknVeN
         7DDnPKwjGRx9rdtP9zfp+vawQhvPAG9XF9HUmzoDOWTKL53xhPLWo3QVzQLYTps1JhwD
         CZBIGYAmlQi2R+tT0kesuoeNv5ZwnNt7ktpSXU6EMxBg3YgowScoIs58J81lvFYn25dW
         jvV+J/YWkVjuXgrGbEeVUv/4TEdpvXOiZFNe8N1y3VQMWV13F9vUzPOn9m1va7T7p7f8
         gH42xhWZH0FAa0TprYTbrvnw3fuuEld8RMhZPRLkhNJZpHClj4MRi8zvqI2uIk8QPJyH
         jrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463395; x=1796068195;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVJa0ec1ykJPShHAKneJEZU3KbXeSYGrLRw9bAOsE8E=;
        b=iruHSQpDlOHtM5/QsSJfeMRoMSXrSQq87fzgdiTnWvf1/OIQqdGFDpFSbNxmtXHFBK
         K2LSkfx5sRDY9I3bB0xLB4rubjzUKYbrJ7FIJ6aG5O67XtFxTgcsghC1IIEDM+uEoaxC
         b9twr/giBKmI2NhivPu6cM+8rLnhMrS5r4HrFXaJcyMBDH27GdhQTk7BJkOjYhB3k4/7
         y0fPwrsNXTecvp+1WImhHV8ntxjNUssBVOccW0zlMAMaedslkqIAv1Ymmgagma00Xs78
         rf9EgX2yWJLmPE/EHlWLE4SA/ACZ6i0ivuSFXt4tM/Vk1YXn1TQtyfmNlAwO9ujsckn9
         j0nQ==
X-Forwarded-Encrypted: i=1; AL+hErGfSNf56B24VAA8CHAqwU8ilHmbOWjQYFLnEmVsGdbFOnRt7pf3BweoKBnDQUmfMijOll8gpsJyjZFn@vger.kernel.org
X-Gm-Message-State: APuU4Z/JMgav1G1/Uu0iPVzziR4FWlNw965px/xv0bT/XioA/Syge4Jb
	fmlLyiMYUO1II8ljz11AZkdvLxxlfmf/JdW5N9Em+H8CjXqEPnn7bG/A14axDNx6AAANNQU2xbA
	NQJCx8fNM08w7jRGH/YeS+V0KwdV+tV/ptWaWT83m67WIvuBLC8pkzvITq9TA1j6rfMarUgZz
X-Gm-Gg: AZFdTZfS1U7L9jYa6a98EK894iqmn5EWfTImWElq3MZi2i8skxSm+s80NdrgNJwsqaK
	9jphuGFyqToAw7J6q31dvFQNq3egwyq+Vmzp9ZM/H4fNTPs7sFEWGHeSGQINDQl4dvjWBji+0pA
	e+Ed4ZFfYCXhJpA/gTxgPx3f+ZZg/aUOisguFqje3C8ey6W16hgEch6Yu+Dv+xbMRHhj72cFOTQ
	V6TEzN28Vnq+riH+HjCAJyEkFQmb/1i+MBg1CwdxzYOYsDLYYmT041O0Wh60A3ENPLyx/wTLT5K
	+6F3IYD6xDwXY+lyyNsWnMXb4Y1NF9lc5oiZs1aw1btQ5o89gXTcrss6MngMBpigC+nztT6w1F3
	eV09hU8lPEP7S3BRToFqg3MT7gLsisy/IYHvNueoiJHVnat5THsMfnirnyjqUujjD
X-Received: by 2002:a05:620a:4485:b0:93e:c12c:9b6f with SMTP id af79cd13be357-949bab5bbddmr2003882785a.74.1795463394451;
        Mon, 23 Nov 2026 11:49:54 -0800 (PST)
X-Received: by 2002:a05:620a:4485:b0:93e:c12c:9b6f with SMTP id af79cd13be357-949bab5bbddmr2003877585a.74.1795463393771;
        Mon, 23 Nov 2026 11:49:53 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm376934425e9.3.2026.11.23.11.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:49:53 -0800 (PST)
Date: Mon, 23 Nov 2026 21:49:51 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qrb2210-arduino-imola: enable
 the EUD
Message-ID: <wq7xaiclvk6mxabafp5suuczp3n27sifs3lilfqpjx24esgike@q33z4veqdbtw>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
 <20261123-qcm2290-eud-v2-5-9bfc432dee07@oss.qualcomm.com>
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
In-Reply-To: <20261123-qcm2290-eud-v2-5-9bfc432dee07@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXxPloiVXS+MXV
 PfhL7oPk8osMJTh2Qq1eEeUA2svB5epq7ccbsNFadgI7hR5r1nQOv1mLCoZvfonVgF9NoEtKbIj
 M9Xqj/uD0QwJeJoY5oruFV1uds9Q2sNMGYfZScIfgG+lT/IC8O6D4x15nmWI1eR1979jCzITf6B
 awiUOpHb7Wt83y5wDrxauxPeT49TwUdGsps/aJLyWWZzgPSljTmhyb33tnSXolRKrcZIhtggGdJ
 x8+lQYeufvTHwM1ovYpBSULYqnRZDXqVh02/27wzDusetnLPnMzThiZZv408MVM9wybwuPSfpef
 /aqAGOb/142sBdOyU1Ru6Q0YcLHq849ZFsYGa52EGb5zFYWMum3WTW1VPVBBsoc6pHTxSPY/+6i
 i5J/6VTzh0K+LGetHKc9mRpxSsX/iEpmKHiGPwZcBdWg6p1qIIhL1THm30RmdACwfl5ck4QeXP7
 KTSdETgqNPMZ48sfLoA==
X-Proofpoint-ORIG-GUID: ZJC_WA5srDJIi0QhkTvwGuR1NBsEftSC
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0498e3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kF10rs2o5Heqwnj5SzoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ZJC_WA5srDJIi0QhkTvwGuR1NBsEftSC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXwL9fqlTIENrb
 mCzQI45sePNmilGJrw+vwlld+A84pT4gpJUv18+Ss+bUwyey6NpYjpkF31lwiwDQLDztZdd0Kp4
 IcKNqLPywTrZ3STNHApppmO3NnsNqSk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-23 17:43:00, Igor Opaniuk wrote:
> The UNO Q exposes the EUD on its USB-C port: with it enabled, a host
> sees the EUD hub and its SWD/trace functions, which OpenOCD's EUD
> adapter uses to debug the SoC.
> 
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
