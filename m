Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910107;
	b=y2KlLd5LW09dkwSn2utVhA0EVs82hYKyC7hT2xkzK7Q6YuO0Vg+tr/gNUEr13IdFI/Hs
	 nmjQWemIogidVDCei5QUiIWOC2wq2cug/lxaq4BbhO9jHza1GJsnFAqT6B4XN7p8aK9Mt
	 YR61snjvz6wWVJMyOVXbl6cyFTAtpXw3osWWzcmOxpM0/zbIzaEbfX4fxTC7dZtK43GtE
	 5S7r6mP8uXJPJpF6ifB9ViysVMWFPC/YR6hmP+fqiekPWMytDARnDkll2eb+Nxjrn9pO6
	 NqdcxZfDKUN8ey1k031yTqDnaVZjNjXm5RWDWVOUd6aGzebmIOfbhv1kHoWfz7GCgmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910107;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=71/VVXS9BeuWmakxmuuJ3siEvp9CNaloZsNO9/RiEQg=;
	b=YBpyeecgShc4CQn+++2I/pIo7A2hennHLaCShUPuRvMJisGPMkcDpnZwzwddbDToTFJa
	 U7OFHE5HQe8zYs4eQb0Mk0ZaVOgHh2nPMa2pH6PiEfgPa4muEX8P1QAs+wmrt4TGB/yJZ
	 oVTt4K0wa8YKMimJ1I7QvtWU4hH5cQHJz2Gh1VTzt2tNoFO/gRTDLRizT9hEkOaSEMHI/
	 dDFmo6I3m5GKoyBy28Z1D/z48mXtJQo0kqLN3ptGJRj2BmGwlaNimAkmCB6gDRAfTon5V
	 T+IFEqPI9D/X3Y/0ZDCzPZfQ8Qzw1nYfc5Ng0QE+uFXc37yII36DUhXJZ1+xLkpvsmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AbQRl9Sp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=caePMNoc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CA8606A32A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68CA8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AbQRl9Sp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=caePMNoc
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8OB9j3624321
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=71/VVXS9BeuWmakxmuuJ3siE
	vp9CNaloZsNO9/RiEQg=; b=AbQRl9SpgK1WuJyN+6dJi9yULWVDP2AgW/J6kEMC
	BS73aQmJLCFctBdD0PnGgJsbLJ2ndqieRJPzmld/RKi57wcF47KGYBHPIQizv26l
	BE27Jy8zCAxbYw37LzgUKRLAkdK2PEayYSBdTZfvuU9waqvb4nqFnYil5AcOuanw
	7hNDYswvpwAqW/uAujNaI8MQ0qiddi1H4MFItvQHcn9kGtzx4Tlngzwt76NKTqXQ
	hqIHt+yfCvn9f9cqdsmBWwmj3G8PDkltdyDZCk7G4gaJ5hpZkapMCkfpjdgFe4eJ
	FdidEDDLSwWahWhSx6OC6r9drR5L6JbOlSh8J0J5vTLGyg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rek1r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:08:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944138ed63fso678250385a.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 02:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794910106; x=1795514906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=71/VVXS9BeuWmakxmuuJ3siEvp9CNaloZsNO9/RiEQg=;
        b=caePMNocPmZTF8ew3Q/1HZkAh6u7Sv2rw74pQl6NkzugOaiNRL56OWFkgmRs3ulNUp
         0ZK3ofM0MAt/UH5IjvC2t9Ewskj1AT3tt0obOu+nMdvv3q/DQN66QAvOCaItIbKO8s8o
         SemTzQpo/0TKovEOcZndkSQi46BcUrYlqqIc1kskJPGWB4f/xs96gJHGMApLVzggRhKZ
         jF+uQxNuwWXxbOlhtD5aWz8No07emfRcKDME7ux5yBfco+txUGugf9X1wjTGZW8uTc2M
         Pa0GmsQ11+fBOCpjG/qP3eDHmY1hR0njyeIFiqKLF1jdK7jEGKlthaVh4Sb7IjaYJp2W
         dnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910106; x=1795514906;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71/VVXS9BeuWmakxmuuJ3siEvp9CNaloZsNO9/RiEQg=;
        b=CuK4QSJZun5v49YlGJnQJMw/ANTlzTSHx2HUUyCNABK1QXes5cNo4Wt67yMzeMRtju
         TMVJ0OZmNKASaLsJJAhY8xaEFbCepYJ4VVBjoCSRn8tFg969T0NpOimu1bCNS7a5mjEl
         9W0nqc1Uba1EnHTPL6ukWNnyDD7rKBoifaSWsrcVy9XfZqRuUOG/wvKcKzwhgNKTpWFi
         a4jpYukssUCrdLLi7GFS/WAt8q4kB3jfEanVqmLPaV/R0d77iEyvuLQIZ521ZPySvFuo
         tuiutC86+DVzsBxuEp96uIJQfuIVYuWmAGKSoLVTp+n2Qq3vliCK1uN8eJYVhuiqsxyG
         AJuw==
X-Forwarded-Encrypted: i=1; AL+hErFfkpeDyMb/BD2cKN85TsgEOXYbdbE3zlYXP0rcaEP4tfhWPj43icGWkDRwN0CZhY9ziNsA0D3tqdyx@vger.kernel.org
X-Gm-Message-State: APuU4Z8hQQdR4c1vD/DvcPSS74VAcxqiz27UNVz9kjak91oF+jPUrJk+
	qLS3b5CGaH3xggTAi2DMmdMVocowSaZMhH139VJVophfspIyKAwLQXww2M2K/i3fBEYmroonXBV
	e9BKnWxmeoX72vKp4RKmxB2w7JdyYPIh6XJIuccE0OnM/4Z6Frt4FJV4qcbfMKUnA
X-Gm-Gg: AYBFou0J4JOx7avnf8dlM75NzrrNUyysEzUIk0PzzHNk/vt61iqRPCDYbfHEprYnNZs
	p2B+4W22oZFMScd6oFpfN6DDfHELfD+zQktLGKLELp5Y0r9XZRCeh4UiVJPOIlPFPRcEl92IY7/
	8WQJa4hSxK8GtbmLnwY9M2niU4ubqP9vHAlLYmO7Wj1LQe5yl9sW8bFf32cm2yPWAEvCEBBtjqj
	YFvsJtQ1dLZYlZeTPpTWXj22sE5zpEuLapzmDjnXRrUO5tkC+XdoqO9Kv+mVHX553fOYqayHrW4
	VlWeSv/D1seaRzGDD67aN5LBflEcDprjh4jGK+cH8ZaH/uOBGJF7kOMH+uakO+mef16Ao0baa3e
	z7Sgc4SJcuboW7ufp5HipT6P9I67Tf8KL10/8KSWZxI9ZupOakScsYKd15oO1yyKC
X-Received: by 2002:a05:620a:45a4:b0:949:75de:b22b with SMTP id af79cd13be357-94975deb4d6mr1050249985a.2.1794910105506;
        Tue, 17 Nov 2026 02:08:25 -0800 (PST)
X-Received: by 2002:a05:620a:45a4:b0:949:75de:b22b with SMTP id af79cd13be357-94975deb4d6mr1050246485a.2.1794910104932;
        Tue, 17 Nov 2026 02:08:24 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7813fa23sm69006895e9.2.2026.11.17.02.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:08:24 -0800 (PST)
Date: Tue, 17 Nov 2026 12:08:22 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: eliza-evk: Enable iris video
 codec
Message-ID: <butvfwbrzocwbiftgdssebxnlotirut2e4ub4few4e2am765ju@w3xluxibav3h>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
 <20261117-add_iris_for_eliza-v3-5-02a55a9272ef@oss.qualcomm.com>
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
In-Reply-To: <20261117-add_iris_for_eliza-v3-5-02a55a9272ef@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MCBTYWx0ZWRfX/k+JXZtJw1K8
 2bc0FFj3XFfE9uJzCR/3KhDGrmgVCwG+ye+lumLZJwEaaTWKsavx2KwC56Dmp/b3tsb1Tfqxefv
 6uTv2EHyFnH5jsOY4m21+rBgbrvMZTk=
X-Proofpoint-ORIG-GUID: VRoj7zk_JmzlwNOl5ORMpRVie3UZeGex
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MCBTYWx0ZWRfX1Hz0fHBUUiUY
 9pXzkg78CLKlqvKojn7xI3tSY1bWS/wVw4njyoAXhvlftlFX0jFWcDdZEh3TGAlqX8aKOk4NEL+
 C37LQZ++hukxbKAmpWQeLcNsRx7VHNIVHmEKb88IpS25HalilBC5CaN/qb5yx9vKqeuV4AfZpE/
 f8NCzXUVeBxBHujDCtFvIQjaGOSFawluUGNF+gmK/0plNYHBrJ58TkWDdhwSboYK+NqbbFIgSha
 jZaQnFUvuakdY3nBGnmJPlSrSZwK5aYYZXFh5HZaHdSp5ipD3cGF1lMR79OFvfyPervtF2stukM
 /852Q0+TWqLXJ7qE6kFtn6GnYHBtwqgj+TITqbmQEFv7Nu5p83QdUosBJo/h3djJ6P/5LjDbPTt
 6z/lT3KwelDZSJhNwFrkTZQm/dAfZ5Dha73R1+V/X0npuGXk9OIuZ7Yq9GvWIB0infAI8Onxsbm
 U8oPXSWxqNXctSiKV2w==
X-Proofpoint-GUID: VRoj7zk_JmzlwNOl5ORMpRVie3UZeGex
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc279a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EICV59JFKgBgiyABiDwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170040

On 26-11-17 14:34:34, Wangao Wang wrote:
> The Eliza EVK includes the Iris video codec, but the device tree leaves
> the node disabled. Mark it as okay so the video codec driver can probe
> on this board.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
