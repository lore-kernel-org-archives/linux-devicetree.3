Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623160;
	b=49vRcE7AZxJLAPssHRMd6QH+5JNbUlISnK76kle3+dpnxGUg5XHUO4KhsmDcagOEq0vD
	 A6MxxFIT79SVQljce9/sxd8NLJFNcimo8W/BgULcGjvwEmS1epFWhY9O71UpqnEmXWjqQ
	 KW1Nb0rkurG02XswaQyNxq59Ky13yCHX93Anzu+lyDShDrxzCJg/gIbKT80d3ykLpJNGD
	 M8VnK/7XQY9EBDEd04J6D/wZR21GP5nluW6lmcd5VVWblzbRYVO85gf6XVpXA06SjF/ik
	 lX3jzRtkNa5590U9Wr0x5z+yAYT+xE03a2374z//WeqUibChJEdU9fLQrlOSpQNWPyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623160;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aGDvSGUaUelkvgdt8SNqfNdrDK9ovbfPV8d3W40UaUs=;
	b=Ug2Vb9kl9gLribOImaNWEU+Au3xaUhJphlAxVnvKU3J+i1+tBQCfykIiB7yvWPFbeX1P
	 oNxIDC35jU/PNYa6Nyr3PyKxBGltUxk56/cw/Br21e/UennzNmbIJBlmes6qMZXn5UW6S
	 HvWkDehXssH0TrjyyLYC9w/jYD8VdtZvq3CZp25ABETZkrxNAQtsGjJck0gzVIl87N6rj
	 vmwi6a1M8sItfkdk7UeH0ZwhAaBtP2CEZVYCe/GlorL31V6lzS+TzRwNqpr8wICoPIqtS
	 5J+m5TB/0xXHpRIL/r8Z6QJF4cxofGGXSdC88FCETF/CxOn3oTaH/9ZsV/srCh3K+ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0saIndc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tpnfups2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD71C606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 12:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD71C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0saIndc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tpnfups2
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B2uZB076996
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 12:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aGDvSGUaUelkvgdt8SNqfNdrDK9ovbfPV8d3W40UaUs=; b=o0saIndcVHp8vZ6f
	CZ2rkVhjH6ouSd/s4V58y71yXm80mPHeAGEZO+CC0GP+LnpJ9lCUFhD7KjU0mpol
	LhVJHiTkF72NE9l1LmUq3b+c80HrkvP15aK90GU2lJB/zwQOfZqylENqYUtyeX3T
	AU2f5gRStFfAqYDzzvyjk7lLa8GfK7f1LNdcYXLNO11BPKqQtLcgkmyZ8Xpsixgn
	g37lQ3M1AHJJonE/at+vRCNLpPUe0IyzOUE1/wTnknCOiKOrUGj9i/319/V2CvHM
	KJxzu1UhoCsqrbX7DDFAWEqBWoRlU9cGIIM+8f3H1kFlqq0kV5l1Wqm0ffwKkjQG
	GNbzDg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6rask-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 12:39:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c99c10e33so7991746d6.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 04:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623158; x=1794227958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGDvSGUaUelkvgdt8SNqfNdrDK9ovbfPV8d3W40UaUs=;
        b=Tpnfups2+QSRVb7I1L0nKeK6XuBUsdWasskFT6gz395kizEjfAjtra6zsE+NL8Py1u
         3CjuXVj0dZYKlzPxR/8yRmyRoapKU7vIliy+5Y9pHcdngkK2UX/r+TGQRWK2Quk5f1yZ
         B2qE0aJzewN0aMeHsK931S3AgGDOf6Ywlfvx+uK130x9MTvo/RPDbhp7FQokaZeTfBct
         ugxJjtSyhI3MWAJjD/RYVAE9ce+AR3mXwTqRer79AXrK2xeTZRvFpDCWBzInAO56mZKN
         RwY5TtYITH8d1iaW4BEjKwH4SFPuBoyxXYPW9BLlPZlisegm6RUArGKOrZlsAe5zC3Dy
         rF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623158; x=1794227958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGDvSGUaUelkvgdt8SNqfNdrDK9ovbfPV8d3W40UaUs=;
        b=DKS7GKHi5ZNiIGcqYceJD2V91fJ6Ra8V8jPyx822zIzNz8jwgmUg5/XF/JhIsGQHPL
         CJbbzts+zh7N7Zi2X19N2+JaaUcDpYyYG6IdOSsP6CJKRVAHZYQKAO7Z3gLML8tlb8vs
         qkzuJndRw22vtP+2Aa3XSBQl/SmHUMK85VMH6jRBqkrjwbuWSEtdAr0W0YcF0Cy0Kewu
         Y3/l/BVu6tnqdnu2Jly0jT8stBSX0gTc6K0AmqSLYoX6gOpATagIZWduKvOusBH+4v4b
         0zJMtW8/EZiY5nmdpi+PAcesFpYDUKuy+/GslDXcQaiTfonnv9kTagHDVpnlTjb9IW8p
         4wEQ==
X-Forwarded-Encrypted: i=1; AKwUvByZqdS1FCVUSK9cyAForez7uOKgSmp6L8rWyG+2uwRzWSIQm0XVF665pQ6LRDXziOISpr1R3QSWdsGs@vger.kernel.org
X-Gm-Message-State: AFq9FYIfP+qqOeeTH7GaashuUK1r8Wo7mj1AP8DkGhv/mtWSUfv/n0nk
	bUXUhMuDQ5cman+qpeJSjfuXYeCpsCKJ+GgP88mcy3vJ4XmyxzyGfkRg9n16/RZSZ+dNgwHEFh5
	OcDe5B3q1ijrZLCfNf3V6SquYtv37tOGfTU6p3ZvqXHQyDpKCum9nLcAXNry+ZOSN
X-Gm-Gg: AYBFou3KTeKLObtfxjnZhcqmQZdPSywhPgPDEmJ651nhRgrNR0o6grsopXSTmruYdE7
	T2wVdmvBj1xvyRhozRVjUc7BE5zOUFuKMg7pCPsz1lGivZ23sl4s7yxtu8lh7cNMw2dDh0YDjrr
	Pc1C0JuS7y1AwDCW89+EnSl24cB4s3M35XJmWNFXXxEiaZkFgmEMzJnyc4Qhm7SNA4fNLmNoIPD
	OIqnzkdzsBmp65zxABTy6Vo/mmftUa8dsjdjaUrXDuGnPnezasJqXTehvbz1hDLJGmS6R2wCZQK
	IfrDD+Ton6XE032EHSMX72b2apzHaE9GLwN4yltjsyI/wnrI0pSSYzMKqw4i5PX1oWua/wgCtAR
	G639BiaLqiL02WdMkdjFTDh4l2LQxshwajtCfrJq+p7oG1uzwdRfO2cHwzn8ekEEiBC0zEDo=
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1815612185a.3.1793623157875;
        Mon, 02 Nov 2026 04:39:17 -0800 (PST)
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1815607285a.3.1793623157435;
        Mon, 02 Nov 2026 04:39:17 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbebddacsm23222831fa.6.2026.11.02.04.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:39:16 -0800 (PST)
Message-ID: <ee443167-963f-4a12-a49d-0b4523afc14f@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:39:11 +0100
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
Subject: Re: [PATCH v7 09/11] arm64: dts: qcom: Add initial support for
 MSM8952
To: muzafferkadir@mainlining.org, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Jassi Brar
 <jassisinghbrar@gmail.com>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org
References: <20261030-msm8952-initial-support-v7-0-ad748ace375d@mainlining.org>
 <20261030-msm8952-initial-support-v7-9-ad748ace375d@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-msm8952-initial-support-v7-9-ad748ace375d@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX1Rm2zCJKuZ1D
 o8BadJXjYvcw305KmK6kGnZvm/t70tcDBOozlYTnfsqKw3vX11rnOe5ccLIIdseWedU74GfoINl
 aSoHPdzwbvhkYJAHdEPap5uvNiVbIvVil3qvWsmowimgNrRZasVLJ7uqZBrOOnBTjPtA2Eu4Xyc
 nj/4cKdkk+x9M3RYw3elb5uGuqMJxYPDvgpjuhLoJzQGf4sNCzvAAGa6GYZ9zhQn10js6ctLbY0
 3pZFt6FT43oxn3y/eqhREZGNH6pWHr1gnBrAhCQzVmVOHYCNioA4/WZUu8TdinG5Z4DV3MtGoi0
 vjRMY549PYw6JlunI7JTLC+j9notj7WDXqoYwNkh2qp4M2k2g/sOdTDvTrzZnU00oLsuDwzCn+F
 jwEQ2I3iAiLFBCVGPc1ARb+gjwQvtlebKqX8CmBO+m+ib4LVbN2gqRvpyMo3HqnQpveyUOURhKg
 2Pkb8cv7IrMcpkjUDlw==
X-Proofpoint-GUID: V7VGOuxL9QqakBUEjPALHRhj_FCRTc4B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX0cmU39em4lIS
 B3b2T+vddLdc7YbDzTmesdbjWM7ZGI3aenWWtRw8HbjXbA+mtjyt+VhfaPpPpDezyGJVSzPP6Fa
 oghYyT5fQI7zrpc8tD5Io7/LjKhpqhI=
X-Proofpoint-ORIG-GUID: V7VGOuxL9QqakBUEjPALHRhj_FCRTc4B
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae88476 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OuZLqq7tAAAA:8 a=MxLZmUXcRv2kY27zAqIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020050

On 10/29/26 10:02 PM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add initial support for MSM8952 SoC.

[...]


> +		gpu_iommu: iommu@1f08000 {
> +			compatible = "qcom,msm8952-iommu",
> +				     "qcom,msm-iommu-v2";
> +			ranges = <0 0x01f08000 0x10000>;
> +
> +			clocks = <&gcc GCC_SMMU_CFG_CLK>,
> +				 <&gcc GCC_GFX_TCU_CLK>;
> +			clock-names = "iface",
> +				      "bus";

The robot suggests this is missing the TBU clock (and also
sister iommus)

Konrad
