Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102468;
	b=SYRtw3AOMzoWDZwZ6Dz4guPdYZHGCmXzT7suUtGzQ8Zf1oDItriMmoZLBuvmzyE4QtfA
	 S2FY2P4m27M9NEetrCLgfsnwRW3wltEZ/17ayI08AF7JXOQhj74iAGIMhTL9CPsd3QIWM
	 ipFF55Nr2ajRNNuBkMAqJFs09yfrPg3pkCBAyZdErqeIlkjlf60qiv3gCv3myKp9IFj15
	 dqo5HzPMHveF85Z16UFCG1tnc0T18ckDjiSulaErLsGnQpbzpHv4bngc12BbX6U8fGvEG
	 X6r5s9w1nZsYgrwOYwDPud3U3Ls9yRZE2z4kdI2D1pLNkC6gINraGNotE5/8syTCFBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102468;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sWt6v7dOd/C066uGvGJiwittXamwS8tJI6B7PLI1Mxo=;
	b=OVlcs/g0ql6Ylm5H2JRryZ0x6csGvihWPeC11Hd6nGFWKTRiTSD1U/qIGp8Ei9p8zB1s
	 SCozjGrwN8fMq956+ckuDXp0IuNidiaJsRzpqZnuxZB1iNaMXp4HOp3xNkR9ar5D7bs9k
	 yV12GpWjJgo+FLkiKSKN1Rn3FOLopIHFLPvw2heBnaNLQaW4BerCMaRQdn5cT2YJqzgZh
	 2aA3mc8A/nPRWuORBKw8nq8hOmF+tFBNfSU8m95eE9hdceuSqGlHrId/0rILD7uS1MZUH
	 dAFNuqpKjokyLVqU6uRIfLoljetSuxLvPk4Cc+s2s8L/3r+qqPudjZn61JtLtUfAeiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIHhEyQt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aYPIF5Em;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78E660A3803
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A78E660A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIHhEyQt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aYPIF5Em
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdsPJ1921591
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sWt6v7dOd/C066uGvGJiwittXamwS8tJI6B7PLI1Mxo=; b=YIHhEyQtbEq3/pfI
	fCZVi7RXL0brQWGAHrRuNhcZq256lm3HPoS5MqTTitHUzsHf/fNxeazvP5hd1I2L
	cTLqBdiF2wFd62rKhbduZ14cakEutnpP0UtQKJZ2RrVr26xbDLoZdcnr0K5+yg+Q
	AVTpACF1G2ldixS88cE1XRwHEdq0hLpocQfJ66eKJA7up+eh1xRzC5ulMb+/T+cl
	6xIzahoERVFxr4IUQUfh0xc2bqecpLNZVwVMGHvgRshKVGJrKuKIr0q/vx1EK1y8
	zo/nnsFUQJdsvmr4ipq0SIkjs0DpD0G97ssXsukGVV/RDOBSAtGM1SM/adHFBJzw
	bAPIqA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq68r05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:01:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc2c798d76so81505137.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102465; x=1793707265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sWt6v7dOd/C066uGvGJiwittXamwS8tJI6B7PLI1Mxo=;
        b=aYPIF5EmMZ2cYry8cr7lyrPzLwzX4qoIBGoFk756U5zqQ48LFPH3pKwKmlhON0toOb
         BBJE60CCHaBZiSu+CI5mRymi20iZkZ3BWADzF/nx837vEvf5lJlWCWgJT/riqvu+rqmz
         Cx7O71Zk7AjsQN3AQH8YZEQ5nxRz5SepXi4XBsjlZ36SzDFJ7Ai1ayXWH83R7f78Ob+a
         mbDAUz/g3MJEap7ToRirJ86PXgV7rV6L4WBdgdjE+AUxw9Xhq1AOPLFhzgGrrz5r1AM0
         eDG4n6Eh/RC+i9tRpQh2X9aHvVVTy2INsY3AwbYLA9tmw/0/P9gwDsWJI/qdnRkHX1Es
         T7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102465; x=1793707265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sWt6v7dOd/C066uGvGJiwittXamwS8tJI6B7PLI1Mxo=;
        b=bc8qo27w2jX1xXxOjpn3suEM8cImX4Oh6K2qqiaXF/wwpq9qiiYvaZ1ST3GECi1UV6
         u0tnBp2gdIDz9ACpqnAT8TZgw9THLhlB+c9NpL27loLKf2ZSF5MbQFCegGTraVHoenfp
         qB7PLzddXwDK+xyncm7Z1jMOh+xNLtJTImHEgtyFaztz/duy1KrZ+riwnS9rvAuyRioP
         gdeUj4XoqI8mCNVLjaxucwyOjEOmBWi4p2w1o1k2WiM5cJ9uwSMr1wb9xS7lwRuccaUB
         qvrC3yQbSyCPPN0ifZPmDrZyTK9n32P3oweoXqX0DDj1US9FyY6My8rGuPXF7R0PofiC
         Yo5g==
X-Forwarded-Encrypted: i=1; AKwUvBzB3t8WS3vZleI3lll2nmkj+Rjjf5pX4bcFQ7Kb6WLhJ7DR6YVnYGH6Xf3o2dLccc7VPq4mF2Mivdyp@vger.kernel.org
X-Gm-Message-State: AFq9FYLJdx3yfg+JIY5dGWf74qNjuYdyyDd134jF+d//xIEMNQWr+HLu
	cghXMYNngt2uRajUasted/ndm3YnhGyDUmEIZqbQKQG22G+X9Ceg30GQQFL7rfddpI1VD47yYeC
	TWzDJ46jIMDV0eSLg5ui6DYr4Fdw/hF6ocPSzIJ8gPz9iRuU0+WhZI/p/RQaVDdKX
X-Gm-Gg: AYBFou1qDqIBJo8k/NTQ1yHo5Z8S894mQ2/0f2Zjvaj7ihy4xeoRCA1bIP7hmq4kQ9X
	Sg8uvv18TmS78eniYEX2wVieEtPjMN2u1RTyqX42AsAmTEczg4RSxq9WtTBzqhmTr6OQNNBDaBd
	NAzf6XV5wP74AmbRl319mt5HcwcpkLPyCfwQa/s5DE03bm7Cs0gohPi8g/lTUvmqvMe0XQ71bNN
	HbhV1Bk73elroXml+Za7xPez1Ckeba6D96Bot4ydnjtjZsTgbX82LkYwlk2SpBmyZDAmMhJfH9x
	udP13RH3NC6WwExbxtszpdcRSiBxngPDh23INh65gDXb8ym2H2F4cZtjMmGVcqh9TXVhRzlDp4E
	D/SEk8nA2/lO2Me/zeZJ1Nw==
X-Received: by 2002:a05:6102:8699:20b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7ce5cc59d5emr2997326137.2.1793102463414;
        Tue, 27 Oct 2026 05:01:03 -0700 (PDT)
X-Received: by 2002:a05:6102:8699:20b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7ce5cc59d5emr2997246137.2.1793102462214;
        Tue, 27 Oct 2026 05:01:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459713f9sm4988292a12.16.2026.10.27.05.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:01:00 -0700 (PDT)
Message-ID: <7e4763a9-31f4-44cd-b3df-3404725a6dcc@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:00:57 +0100
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: nord: Add display subsystem
 nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
 <20260920091930.2215803-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920091930.2215803-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae09282 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=B70xErdyIbx__L-6yYgA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: VQPMAvDy9te5G48WKc_wXN7isXhlFDhD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX2YPsO26C0Ta4
 xY6nPQG2P0tXZlWyPa9R5cj4hN+05K/1+OsSYlFed5+1o7cl2uyQgGUFzLWPMInyTqPOTKvx2VU
 IxQAJqS7vKD8/MJ62Fw3ysRM76Ef5zY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX/If3itnwXK65
 yKp/jxizX76lGf/F/v3ajfGxzPrSQ5rmng/aqpEyr6x46GBHN9bRCyKgoF+gTk9iXBQ8BWmjMhI
 KWk8uPyBAbTjFOHKpIvW768jq3gZzRULUfg/MWjkOrpm8zFPm6EQIctB/wgFFYc04tGZwdVahyS
 4KqzHMU7PmB1CSbPLTMJb18pcjloQvuNU/AMWNZ793BWADidcJnfZklyZPzAAskZj4B2NvZo6KE
 wdM7h30vl/tZG5GkllDZEOfUHt0mH+IhX54muMq+wNNDsEZFnwPcXZo7hBcyGKzjNQkFgDPeqUm
 X3ZYoE76G9rkf0L5SFOYsPpyklL8erRh92Um09V3S9kQHfaDaZhDZqGWd4pY7vhn39cgoxP0EUj
 ap+WmcL5EuQyFk1fw+X76b3Pq0OUtxvfy1hSEQgBvUzBC/kB5GxFymud0qXR6otDY2u7fMzqS6E
 bhPfGT3P8x8+3ulH79g==
X-Proofpoint-ORIG-GUID: VQPMAvDy9te5G48WKc_wXN7isXhlFDhD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

On 9/20/26 11:19 AM, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add the MDSS, DPU, DP controller and eDP PHY nodes for the Qualcomm Nord
> SoC. Nord has two independent display subsystems, MDSS0 at 0xae00000 and
> MDSS1 at 0x8c00000, each with two DP controllers and two eDP PHYs. Nord
> is DP-only, so no DSI nodes are added. Wire the DP PHY outputs into the
> dispcc0 and dispcc1 clock inputs, which were previously stubbed with
> zeroes, and add the eDP0-3 hot-plug-detect pinctrl states.

[...]

> +	dp_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-162000000 {
> +			opp-hz = /bits/ 64 <162000000>;
> +
> +			required-opps = <&rpmhpd_opp_low_svs>;

Odd \n above

Identical OPP tables can be reused (both across DPs and MDPs)

[...]

> +		/* Display subsystem nodes - MDSS 12.1, DP-only (no DSI) */

Both of these comments can go

Konrad
