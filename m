Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78806340402
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278176; cv=none; b=hS3pktpyP422kJuSzvYasoQM+9/0QIUD23XwfnKtJEhXk1i1/ONULTXHBOBvjKGGNfsnUPNLeIQJZaODJt4KU7Z8Vv0SRHStvfQrl+KU3laoXD4xQ0QJn+XZlapqZi8xVRoJ5B53cgmePkH4KX423xUS45qN2s9tmfpeuIYorXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278176; c=relaxed/simple;
	bh=T17x5FSYTfh9vCvsdSg/wE+KeD5tHNDbO0VJlhTCAo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqhqZAjKueahIyveXIsVPwAOaHMRopOM1tk0IblValKQubnuFpKHVLmykZiyMjivllm3TACjXsWkz8iDSS58sGHutdJmYG1+FYDneB8jmJdLpfdIZnYPgrRWozbmTRP4kCEU0F6TG05vIfoGmKj7KJMvXtmru+Kzv2SqJBB+WXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vr/SLqMr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bC5gAOlQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vr/SLqMr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bC5gAOlQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6caFG1066306
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kaPio8JVQrLCtYd7AhcOZiz6hzao8PNpTKSR1pBSvko=; b=Vr/SLqMreNIHAIwV
	1HSyJYKL7VP7PBforMcctbIZMxh6rqr1XMRzGqmD6I2M6f/pIiBGWqKaRG60yxek
	Ro4LmGA2TewYyF5qGR6yZXVBU6/sRyNOKIjG8aFTMr9l1MMIkwkp+GU4rPmV0lJH
	fJJtOLA8Utz1vxhltyOBkON9NpbyplQEyz7X8Ixou5TUdkfDGur5cSsqrw/Zw+3j
	V7YMyP0jjP6h0itWAMDDwqZYSsBG/QWsPH+J5QfNo+uQM+u2uKSYmnQhC9hUPlrw
	TpDemOjwiaQeBIwc8CbhriXxttrq+d1/6WHXX2svbREqe8/4RTt11OsPbFq5twrI
	AOUyCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbquh8s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:49:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930a312222dso43550885a.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 01:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784278173; x=1784882973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaPio8JVQrLCtYd7AhcOZiz6hzao8PNpTKSR1pBSvko=;
        b=bC5gAOlQuVkKih6Kf9JTj+3LDaVqxsbQG5sYqEWMo9R7s8beeQx2+WMQ/QcYGbnivP
         b4++yKDpCmNIN5KtCiOASDqGuo0DyB36O9skYb7RIiCm40gjtnFcSgdJFz2Mf0fvnJnj
         GklQ+Vn7Z07036ciCpljFT4/InSNpz88lh38iraLOUTHf5EC1j4Cn+Q9zkf1k9/8ziw7
         UmcICgKcvVLcgmgeQLx6830iXvuLcDP3ypn5ju+apaaur77l7rCy7DklPOBJTW/k16v9
         CP8qArrpcHl3BOGYzP2V4rX4tHrs+fILKwOhwS7sqhV/fIAhFarOQkJ0du5xHh4zl2Fh
         xcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278173; x=1784882973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kaPio8JVQrLCtYd7AhcOZiz6hzao8PNpTKSR1pBSvko=;
        b=ZvxVUySjfFtV534p3YShj/0gntwpbs3caqLfCJ1vMtK4BlUHw7Udn0ATdaDae2uJeM
         xenTLhXYHrBXwIrrqW3XrMBK+t1Epfyr2KL7GKSNQT8xixKQfM9T8mEPiz50rzGSo5W/
         brVOM13jLAeKT+rW2dZvYBdzczwHJTSHBf3uFzyoI2exrfxBuRQ5D/iMdOzX/RPcNzHA
         wE6ekSPFZWRGG5rl22o6j+14gD1CpgTNuiMvKfg4h8R3+D0xlklusK4bIt6v4g9uaCfd
         b6HQvqxkdZ7PeVRr5/8usk+rRvnwQ5a5NsXcQxEOC8QlkU5It8kvNkSOrB8nBAioOOyM
         priw==
X-Forwarded-Encrypted: i=1; AHgh+RrnJHC9SOmgxfQnE1H+hXFCrvTT44daE0bZ0i8L7/tNL1GN6c0Y7xJqjOVRJKoq6c4CwiBY04j3A1A6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+AL65h+MTkCC3dnwK+1SFsbfBtIQf9ygTPyqrdQ59lFUQtLWM
	PZql9hvB8dRfzEOIxprLTYCHq2Pu3kMYk26pvnS0MP7UiL4EPTOVolYel4dkWjZcZRl803lUIvS
	vGYVgVjbNr+HP425qEV9N7Io3AJHiVPE2kGkeIV6irEDv3ITuq8kz7UhfFDIrk0Ok
X-Gm-Gg: AfdE7ckSc6zupLmlWQHW88w2yhT6O/jluRE2okFJkDjdNRY6lRHY6WgA/YcJNx1GGfq
	FV1CrSj2wA8E0LOJiMFh5nS2UnLFl6gv9yP/NfLK2pblFscmPJPdHl1iXmtBO/iZewUfVAdfPQX
	MpDHHupheD1ub8SpdFBSr7SVb+dzECT4otpDk0vHRR3H2B3hVNLbT+SXWmzYUi2Yduk25lEMB0j
	BvhKmAtfjruc1kUn1lPu/BxvQmTYn5aFbJ3UVqShxhXFvWfbXUOlew9DmlbgQbiqY9HtQzoyeOK
	YUIBeXKQTXd1zCXAJy3HoPfzDK2hNxUt0k8un5SBWYV3xhHc4Nan6xWI1e6pXreeEdVxxOq058C
	lt2/cW0zkHy50TedLiRQoNGbu
X-Received: by 2002:a05:620a:a712:b0:92e:6199:9fc7 with SMTP id af79cd13be357-930b418d109mr105141485a.4.1784278172684;
        Fri, 17 Jul 2026 01:49:32 -0700 (PDT)
X-Received: by 2002:a05:620a:a712:b0:92e:6199:9fc7 with SMTP id af79cd13be357-930b418d109mr105140485a.4.1784278172259;
        Fri, 17 Jul 2026 01:49:32 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbc8acsm317537a12.18.2026.07.17.01.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 01:49:31 -0700 (PDT)
Message-ID: <ea54070f-5292-4113-8e3d-23caf6480e79@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:49:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
 <20260709-glymur-soccp-v6-3-16f70227547d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-glymur-soccp-v6-3-16f70227547d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6siQWNewyTlM2aSjqnGh_JpBpP4shw2Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NyBTYWx0ZWRfXz9xSLI5L6aqv
 h5QCiz7ow2h6giGt+31ETiBjYJOfGIYW9hXbAoA5ynUdWvuoE8A+izHwtHUPiSx5OrmPCR/scLz
 ujiVDH3GaiuxBNZhHRET/M3dy059CcDdPgDZoJ1Va7HgPpDVNAgcN/ZAt7i2PkTstG4VLECfzln
 opcX/9faXiJXcIHAJlouweXlCd4LGF7mRnk46b+4TjawK43jVYftH3oFixnaU+zoYnTGYOXquZF
 YkpcqzZVOnGSNDN5QHAYaje4DIULeOduOSFgQoq3z5Re7vTkGFrQtcRy8rOaJvmzikd5ipXFEsd
 ZQcopQVwzWOtRJgb0QtJ+DygWXxKtdMDyHAlePxaz8p1FrOQ1JsyQIRCZF3usG2jOB1ew/pIdx2
 1lxRk6lwO9oy3ZlVOSi2ojwEG5VGPL1M5BexTEm8OesuwDBevFUU9sRAfDcqZc9FfKWEubADLXq
 IVozFQWsImBK9WYpppw==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a59ec9d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_LHxOxAbYH_kBMrIm04A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 6siQWNewyTlM2aSjqnGh_JpBpP4shw2Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NyBTYWx0ZWRfX3VNCG+k89yd0
 wX5Gq0tNdWFPjRchjwb/WF4uFmQDarVTTljFLUrwELPmrEyTxAP2Z9WMNObASbNQl13k04jrseW
 vwP97py3k8IM+WwRr0QYJMOLxwFs57o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170087

On 7/10/26 8:39 AM, Ananthu C V wrote:
> The currently listed SoCCP and SoCCP DTB reserved memory regions
> don't align with the memory requested by the SoCCP Firmware. Fix
> this by updating the SoCCP/SoCCP DTB memory regions to reflect the
> memory region requirements of the SoCCP firmware, as described in
> the Glymur v21 memory map release.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

