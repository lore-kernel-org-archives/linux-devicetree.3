Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E14E3C9437
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 12:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776192; cv=none; b=rqYHfzdpEjmOgxAis3Y9rq/V0y5wtO/F8RkbWAynGOgjgVAtMFvkzIYvMMxtDbDFJei1LYZRij2pfKJjePiA1F9Rbg1/EB/NRn6JdcE+yjdgFaNzrEAE/DQ81T9FNwUQWvy0L5bg6vsumQUvmJ98PIrYVaKA/cl1WicoOgztfT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776192; c=relaxed/simple;
	bh=fZxcstZOtHZken6KyX6sF1sb4GT7D1BHeIJ10cAP5OE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSVhmlMZc0EpBZuBqcvpPzmfg2Roziyj8SQCDvRRoQCs3v0uiAYjWxdLysYVT2SAcO0QEpcA9Fm0u/0Ozvgz3gy6frjqzBbc6L5Zn/JT0VVrrnNgvzC+Yo0UxcAOLkmDMWvgAu/KTtCxzZla2PUHVt88/06/xFJxdMqwom3otok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLNVAWjZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDakIPHC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLNVAWjZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDakIPHC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LCsQ5N3574133
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 12:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iIpjnj4qJhyWrwLOyoN8jJDUuolI9DeQZdXqiYE21WM=; b=JLNVAWjZJAjaSa8B
	7Sc2N9yzIKI/ZHt2xq4TGTGQGkrE3wIIoR0cu262e32Y5o14hRemLW0Jpdyjr3Rs
	JZkr0gl1yvIUQC1/a6W1iL2mJPeExY1TeSqK6hhg7iNwgDo+aYmvVy+ERUqRIFqz
	pHHPWdvS0a9NwczufXWIjVKPgPFqp6ECU6HD/QVrx/g/HT5OY81eg8Ys7nXABEcq
	/dNwFptXf2XA/uhTr5AC8y3enVXKL7up28Bcn8g24owH6fijvTC5BYFndTF56NiJ
	CoMz1gUaNqkKNkr083PTv2EgC2B50/Z4LFWQWVMVmzS/0A3ZRd4i9E12EjQaLlzN
	0/D4rA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp465haqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 12:56:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d9f1bccd7so7214151cf.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776776189; x=1777380989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iIpjnj4qJhyWrwLOyoN8jJDUuolI9DeQZdXqiYE21WM=;
        b=CDakIPHCDz8M95HHeILYTLAn+CtJbMCMFBG0opAsR+kwdgwHZftA/BnHv7e3aWsBSp
         na7YxeEXBgmyi8aLo0FC8274hiv2Z8A6KSFOGwmpwNkUFNiD9fx4xoMMOg4Dp8t5cg/s
         Ug4W5rzKjptqA6fXpGxAO9EJYepZ6ST7nBiHIrCC0BLTpcjA6u+GO/mUWdc+Pb9mjLNf
         iDwcWY+v3R/8TySBtOWmoJHUfNRw/tlRHhifAw68Ovgakg2GsZg1WqDf9039mjswN9Wm
         v3784+ADrOK5weYOzRgSgTydJZWs8UtDDD3uSjpyrd2Fc5j4IVZvPOF7xcpocPb/mIRI
         5GQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776776189; x=1777380989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIpjnj4qJhyWrwLOyoN8jJDUuolI9DeQZdXqiYE21WM=;
        b=PUtZXdVNdCtXva7y3DRXAXoO8DUpcEXuELuMLXVXy56Uhe8bCmi2XEqIo9duwSsiIT
         aZWYVw03SMKFu2wkuD2sH4RMuUF8MwNd0TeBgbenqxxvcbdj9a8hzV5N4DhqMwRsNj5a
         RfaGE7USejf3Ud51s0NG7KeeskxGve2h1jKuxp0DgMluznpksq02TySpHli47/NLrC1F
         4ndKNvFrVU+4bhEZszLmRdD71bIZS2+04/i6HBSJOURNwrPiQHdEFwVc0ZqHhTWUI3YU
         dqi5+i5xhorYFkBrVpUq7Sig+7in4Pq4sRK4Mg/dC9E8+E0HIAsJcqFjEs3CfUr3YGGT
         I9yw==
X-Forwarded-Encrypted: i=1; AFNElJ+ftZr9PUxmWU9kdaP2ft08Knc7s+boFmHk/Ha8H25Nw3LReQc7m7XsgfoHnJD32+5D88a6iE0IP2FF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz65a0Ep596k02KJcgTf6q4FyoZXFS6ydM1UWo5OgdS+The2UMY
	tRHhkXdsi5FAKP8UNgE8xWRvparYTaBrTR1cc2cEo050AhL39b0MpX0cu4paRYtcTb6gqjyJ99O
	87x8XfxdZNsJPXEryttcmZpVeXwPHzsrN5+xc5cg0jJQfBMi2apuWOGu0i3p2EdaVL3uyNsSN
X-Gm-Gg: AeBDiesy2mJvbiYIQZiS6oj2C3MDUlOmErnnVEV/L5ieepFCzpoy9dUQQ4BJQTwi8+D
	MpTxF/Aa8ptMiAXqEet/NO5tnlsNcUogRX6XGfQStoV1SXgJAAME4Vx50eNNio7emtP6eJNQ0m4
	Q1AUVZf4PTv2aUGgkQMX21ccdUURWtLefL7ILlK/IDWsZWxBIKga2oWQBCzCbZL9pB2MG9RJE5F
	XKGX8hCZhdQMy+k5YNLMehsJL2tlR3AWrLuj7cVV3xofR3YYKyDbWTwp5HoM6UqkUFGWOXudhO7
	1+x/a4DfeBUP+DCaRXN5ax4Zs/dLN+e1GHoMZojtYTxkDRON7vKqb5xj6siLX0V5TzdT4PUROrO
	/UGomr6wXzB6MlF3K1nXAxpPltfDAkugrNggZ9LxQd3T4Iu2nZAALxbvuUAoVeu+blc9MTQUPvK
	bsbM3GrBsr1KVMLA==
X-Received: by 2002:a05:622a:5c9:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-50e5cc12306mr85384001cf.7.1776776189472;
        Tue, 21 Apr 2026 05:56:29 -0700 (PDT)
X-Received: by 2002:a05:622a:5c9:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-50e5cc12306mr85383581cf.7.1776776188975;
        Tue, 21 Apr 2026 05:56:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480e18esm2692261a12.10.2026.04.21.05.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 05:56:28 -0700 (PDT)
Message-ID: <cdaf1f7d-72d1-4481-aa3f-4b15990cf6a6@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 14:56:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: eliza: Split up some QUP pin groups
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260420-fix-eliza-pinctrl-v2-0-b68329fd6701@pm.me>
 <20260420-fix-eliza-pinctrl-v2-2-b68329fd6701@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-fix-eliza-pinctrl-v2-2-b68329fd6701@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEyOSBTYWx0ZWRfX+lBSyJGZl36P
 bMZ7YO154JH2PviXGMLBoLPnrRuukjyLiToJLRE/CQqkr2dBaqVnUr8PrS7eFDSbttv5WOuN4iF
 sn2dTcaxFYFLFjNfiFz0ZU+jhTKQaneIFxNPBuh5ECYk6ppygEpuO8ItGTrzAt5GCTIc02kPLk4
 bPUwxfpHb8RAYXvJNdl/n5RsNe2x9FTdj+6FbOlatUdVz+nH9PEjezYtsYjnBySLwVi29ij6F8E
 XnuN26upeh/TYpbF4S+P5m8vldi+jQsNH1/bVn9kU44ZkGgxx+EEfTQ/Q3aRXhj2JRrX3CaPtRZ
 +2qMMVlJZ1B+6mrSsvs8uX42vbwOD1bUCSALpAEirD5pl+SyB4R6w/7Iefr4VPZrRgaMSInibni
 cyjuoOm17xvtVYzi0vo+fMeDoqgQeAEuDs6uQi53M10JJRXe2lokrH6zzsB5ixiGaRPpTxDQIOw
 AD9kOPbah1W+okL6sZw==
X-Proofpoint-ORIG-GUID: zsmORr7PD39RSG9WKv-nRJfqS1xo3H2Q
X-Authority-Analysis: v=2.4 cv=YOSvDxGx c=1 sm=1 tr=0 ts=69e773fe cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=sxPfDhhxBCIg7INJgBsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: zsmORr7PD39RSG9WKv-nRJfqS1xo3H2Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210129

On 4/20/26 4:28 PM, Alexander Koskovich wrote:
> Multiple QUPs have lanes that can be routed to one of two GPIOs and
> collapsing them prevents devicetrees from requesting specific routing.
> 
> For example, a board that wires an I2C SCL line to one of two GPIOs
> cannot request that specific pin with the groups collapsed.
> 
> This change splits them up so devicetrees can request the configuration
> they need.

Please massage the commit message so that it highlights that the issue
is that there are multiple functions defined for a given pin, sharing
the same name

Konrad
