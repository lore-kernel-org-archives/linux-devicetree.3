Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239553A1E8C
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558357; cv=none; b=Q/FF24CcxhFx4Obogd5mAQK8I+Ks0tyznhHkbl7ePrC1BWbrlqFDNe8XUDAm2R7PSyKxiCMDUSqPHrv7NLDtdN2IiL0TuhI/D3+6GyIc+XnzJ1SwIu8+51xJo/ncZCrTU93SXl0QtjX8JFIpaVQR5AOPK61SSwD24/32avcLzUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558357; c=relaxed/simple;
	bh=2hqvxIZr5FydskzcmkSZz+91CJz7nOks/IGm0b03hfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+bzw/x96FmV15FOeaori83PME0PnhhpCEw477c/lmA6CangxB0QRVMzxc/0HufyCFr9GYvk3Uxy1uTFrGN+dYGfD1kmLuQDYQTe9NrJSmmXExn64pyFsMx1huraiyKWTwlW6culcy7Eqf3DuVmEBIuSfWSupGjFGxoSEvONtsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNZTul51; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SaYSpt1e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNZTul51";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SaYSpt1e"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O67bU81662614
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hwy34XbCewo0bCBjlQRatKiE
	GjO+3FoHbts9Y4GEKpE=; b=KNZTul51kgfQ8Bu/0L8pJkthUJ7iFr0jUmkKrkis
	g6sq9Q44BeBeAuCJ2E1GUymNhl6LJzTSU2COMFs+9ybR0c5g5yKYBacxIb1q0+MP
	iYIC42PrRoFxw7Le7DYJxv4mI3/yGDTthrJnhnl5Exr9eA4l1yf+bY01pY7nlqQ7
	tPboVXzfVwSMn944Jzrod4fBlVOFNCnmIOC0vZsKww+AfYO2hKknJrEFS8nO/p0e
	DOhi3F+9eY3zvOwTt9L30RoKBZ/ghi/UmEmqrW7zGRvseFyaHjyfHba7zsprbZU8
	pKSuMDAPmkdazz7DVccXd8u0AfwvQnTy78QFQU5za8ewsg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsgfxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:59:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-526da7e3c9dso32256411cf.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 00:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787558350; x=1788163150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hwy34XbCewo0bCBjlQRatKiEGjO+3FoHbts9Y4GEKpE=;
        b=SaYSpt1eG+X29qfzZi7egLPChSqRxlNy033iyd3qdyHBrrBFzOxJ/eKWWiu+gd5rt8
         nNS0wR+5io3XJ7wu60D5AN0ixQe4dEpccm3JR+0Uzpi3Ajl3Z5arDsFAkW0+pHWySfma
         giVe7tmzGjkur5KSRgodQXo3v9orQGa6wgaG0TSMUqo+FFyqRqoqbdXRMwCW+9EkGb5k
         swB3uoqJAu2iPsymaWKJ3ZIPXB5HG5v7OoscSF17X+Pynx3PxK//BlepLWWMG7iWXklG
         uzpVJXQusWAZCmm2r+u4XfaTGYjJRQvQ98RBFNDXf+j7N4zzDXsPDfmlRqOxtDAHX5SD
         gN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558350; x=1788163150;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hwy34XbCewo0bCBjlQRatKiEGjO+3FoHbts9Y4GEKpE=;
        b=roMAAK/NlIS1P64xBSc66HWiRSpd8a6wEYnDzd4T5I53LeNWO8K1Fg3/BPLmbRhAeF
         +Xq0j38ykb+oJwjmgakRUGhv5BYeBgTYjdOpvMSThfMW8X5KC/lxFw+Ps67t1FxJOsCZ
         wVooKCy3D0BV+suZqPQJJTVCxBWrhNxMF9Hb8nHC4yGd6TrHOIkpqAG0on3ZY+lzEmvZ
         XPJqaLbY/6Zx/XwLncMyfB4j9P/1OCBiXanQwoQxLRrE3d0U0v46X4Q2rVEHxX4PG4/t
         F51mE6j+BDHQtkJ1YMrBd73X3lXRV2leo/EQnCSqltDjHad27c3bYlfrwhu5q6jh0TGu
         HnGA==
X-Forwarded-Encrypted: i=1; AHgh+RofbRO5hOu2b8ckxNWJ9bXrzQnG0XAvJJnM5xNv+5DCM6Iz5B8K53rQyDEfU3n2e2sMgWo6VtLnX68s@vger.kernel.org
X-Gm-Message-State: AFuF++lMsSA6oDCxjSa31BBfyH0HkfVxlwekMfVhZWwYLt1QI0e90jnJ
	OyZayE1qeZiUqcpPtELOBYau45bvMe3mRK/edorSYnNMcEtHtqEEnkKfSL4QJJppnIQwQDEy/zn
	Ao66atIiYiWMbnYvkmQBeDRrz34lPU8T6S7SI8eyNXwZzhl9dHjqAobiKCaEoqTi2
X-Gm-Gg: AR+sD129tNtfhqJ2V7RN4qXfmdP2Qridgua20lT3BVV5RFDbs57fB2sIfnFoGhGpOX2
	gjZwBNDYQcqOleCkPrehaZQPbJ5HPOOUds9gNEGve5wDDNsLtRSf63Nzt1rBqUVO7AKNEdxtqSu
	GhwHfWNw37t9VYO46y8vTFR91r5ZzDpS3+ysFixqHKqxA9moECFdgeh3PfC+o4dDM9QlHwcoIFu
	nZaz1rkGbtV8Jy+VZX5wv36plUBCFI0lPbWBHdJe9WGBev38dGK/SniDkvVLJUyT8Ad5mt3S7uY
	n6SMFHjIxjTzklVEqDjGrFIq4hhHSlCsaIZXVECf9vWt+2Xj0Qzy+vLiuqwV/u6wTfuTmy/r2OK
	yFjkBhKJYaaFCPtY=
X-Received: by 2002:ac8:7d4a:0:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-52e09b80e3cmr154417001cf.9.1787558350316;
        Mon, 24 Aug 2026 00:59:10 -0700 (PDT)
X-Received: by 2002:ac8:7d4a:0:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-52e09b80e3cmr154416551cf.9.1787558349816;
        Mon, 24 Aug 2026 00:59:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249689fa97sm978725366b.57.2026.08.24.00.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:59:08 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:59:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: Re: [PATCH v3 01/15] soc: qcom: geni-se: allow selection on 32-bit
 ARM Qualcomm SoCs
Message-ID: <ssts4xmgxvfy5rctjskpva6aq5imxi7b4q3jerbnfyfn5sfehx@hbrk3pbfc6sb>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-1-196e2b306368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-1-196e2b306368@oss.qualcomm.com>
X-Proofpoint-GUID: YoitYxcJexKDedgs0vbjFuXH26Mbtcsl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfX+9H+aTGo13fh
 rBmIgRay6zjI2sr2T6LJuzMU6cz5jendCB38aVzowclCwEhsXx4xXPfn7jKZXxp81xoQmwRD9Ig
 6iFRCxgZ62vQE1npTMAQch+2zHXCkHSFXn06y9Ls49ovpx19kohxol3qJILDKdcLB92JilR+TQz
 Ovh7vgL1QwOPJcUytbvubxHKTOh+KJtSt7iIec4rN4/8LNOrDrdFtUshZ90+nd3bPj/YX3mUrII
 8/CqbexFczZ0JKTiEG+zqv6NppsZ/rYrx7x+x72xnkzFyJ+zPYWRqo6bB+7IShFVhHzvGqG2Q3r
 y1iqz9xn1cgyWq4LraOkREIYhtNBJJCGBbW2d8ohshWITUC/Dmh6vFnfzaiZPC0GS+fqRuKuPh/
 AgESvukxTdowgub5XN+oSVQeaXT71/HTd2sKoeJEg5gyDyqHQ/Z4QdGpob1wlqXCxg0bfqwpOK0
 agUTu3TmTNhKwaZikwg==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8bf9ce cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rpqCqEIPHYpObKgDwZ4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: YoitYxcJexKDedgs0vbjFuXH26Mbtcsl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfXyfNASAwKvADJ
 w3Di2x4dosamLpw/SJA5h/Tal3Qn6i1CsLemuDQePds4nTv5mM+KRq52mIZHRn2jjUdERwS2EfB
 XMsfON+zX4JywkFBdpMK6+Bc0e8n9cA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240069

On 26-08-21 21:38:54, Hardeep Sharma wrote:
> Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
> wrapper for its debug UART. Drop the explicit ARM64 dependency so the
> driver can be selected on 32-bit ARM as well; QCOM_GENI_SE already sits
> under the QCOM_SOC menuconfig, which is gated by ARCH_QCOM ||
> COMPILE_TEST, so no replacement dependency is needed.
> 
> Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
