Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB2836654F
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 07:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183723; cv=none; b=QDpu/Aa0zK1YZg7Lv4Rd0Wo8lSXqdalF12nNlv6aZm9b+n1RUvpHJrYhW4UKfWI6JWtJLgyZr4yE4nlz/fuoMtJCBRPN3u0pom/lx/fbDNE51AbkYXXi+9Tqigbv5zM+E5lboGlrfJDb9V+6GmyfXSZkKilX65vf7fjMKPKh8cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183723; c=relaxed/simple;
	bh=XJQHz+fa69hLNOTfiaj+ntovmW7NecNwSmoTYXDh3Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoLEZtfxsK4LdSz+pc6tYUDokNumTIGKJA5LHdwkrUATczHmgiz+G2/Qd252vwnJS4aP6e5sL5VgrFYU6dLL2KuQAFsadVJp2Qh0F0/f9xY5gMxzK6q+C16IpCLrTkEDz3h6k4Bta9P3mNjNU0K/qJdzRys4muB/v+relmm9YVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFQigi6h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhyYBeNO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nFQigi6h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhyYBeNO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6950xuMh3241164
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 07:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44lmmXHu9OxWrvFv/Dp80+DaLPYnkIgWKx4lSUJuz5w=; b=nFQigi6h83zbdwZB
	Q2lq1gMOxSDy9X+GumLh1Om89Kg8/fsekKWSVD1znW59LGUVSx6HotCur7pAY1Kg
	1kPr6qv//09ZK/WzLKTvsj9ZHcMQjnkLD+gAHpFYqgy2xt+EXnRByJ/98kYNLPh3
	ufLT+QOYpTPb+slFrKde1nfFnMjZ/hGkmuP/bg7mQb0cHdyYEwpCB1K8Xl4avrxG
	vV3a4gEZQtYBSW65dg6o9xJdrqpaGRH1DKHA+mphS8EkXr0peCVgU9P4cfqq175T
	ILL0nvw91O6Adfxj+PN5CGE9OUz5MmELhgR+qqey/wvZEO3f9LpyWyfilJLCj2I/
	LNbMzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tvevp30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 07:02:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93be1861d2dso247705385a.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 00:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791183720; x=1791788520; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=44lmmXHu9OxWrvFv/Dp80+DaLPYnkIgWKx4lSUJuz5w=;
        b=XhyYBeNOFBq9dZ25dGXlYITon1dWz+uJJR3g3qGb1EW/hcJATBOk1wTBdrFviSDUL6
         aYtG+1wj4fRXOh177J6f4B4n4FimIkUEW1aChmoPH8OEf0sm6dXkHe2vIfexfQuuWxkO
         lLqPGpe5nOWp1JN1oDB2Wg6KoUoS+W1bRAbkdIULfoLWMz0RpetA9vGAism/GDMRKXjy
         Tz4PxXbGYZC5VDsTlSAH5mr+Xtxa/h7x6w/3eu5UOPAtFaidqyzX+PWRcvfZ9fmlUk1I
         35YsQyzbv/Psla0zwiVchfBbOmZjxPu3n+N6ENbQBez81U/jB8acgpHgD0+uQ7NjjIOi
         6RJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183720; x=1791788520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=44lmmXHu9OxWrvFv/Dp80+DaLPYnkIgWKx4lSUJuz5w=;
        b=vJPPlz+fTCMKVLTEvf7VXKKwamel2wlFyeXDXHjGKh3ctNwPUn51TOwbJJ0/m5P47H
         Y36xmbdowzJoRwNi9lR8EtGrc/4D2g52945cAJZml3h1nAVc8RB0QSDRpKMUcLBGkQee
         4pHow+AGM+1Br53dJO4ly/bF/qEZtedvlhUrqNAEofBTCYlaPqcUfr4z7Y6rabOFF9ls
         NJ9wNhFWLZwu7KoJhc9lqMECN5fEUGyttT3hLHbX0tp4onIfkVQeCdTMo3UBy92ODN6F
         oipDhBe7hxineLAPkr1H8iH5pjVEnjqua0q1j8FMUjSpEA6jjYRyEXm8PZ1uVatm2/mR
         CrFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXLiht9CD5R0KvyZTuicCB5VRpMq+U4jWYLtOGlJbaPooOrpaOJa0JQBqws/6RtmIKFFE+4SgT4TiH@vger.kernel.org
X-Gm-Message-State: AFuF++myeD5+da9OfS7EJCSnp0WNhR7ZZFM7iOZ0Glx4Mnpie87dfHQx
	PJWOEdIqWaKZSYJmehdfZNsHAAspVoolPTyRSPv4eTn3k648gqjYhd0vSKz33MgXBgEl4Wf2OPj
	548cnL6auwcNREl88+6VCeWl02mwU/O2boZ0cqztXUnRx21KI4h1gvnE6BRtMTOVa
X-Gm-Gg: AYBFou3Yv2hCw+rio8buveM0wHbpGjAFEFcq37/2csfJXNY2n0kRVzJRKChw/8owi4y
	YFHvLTXVz4GrzaJfFcGg7Li/4VA3IX6wimkRcgI5Y6VquxfkIDomGJ4RAwZJ/W2yAaC0mJtyiW6
	QMy8ocP2/FLRq4Fe4kF5za9eE2OEl2tbeTlwUwshkpqgfuyfoxH2goHakVMcIoVVdQR9GTqRcpQ
	kFjIH/z+pf4jTlzHFibT3CxbLoMtLqrVA/nic0vXBhj2Ljs3ItJHJAsiYWQrDMXMTF7QW69BSlR
	jMzX6EzJlAovIyG6kksUEQn8SuDDfRgXJJiDSItnqMe5Tt9nINGlSH20zyDer9nnVI/xq+1bYun
	Sh3w+a86RNEWd8ohKUGVUtg3WW02eu8vJqqYHGG3HATvSzgpmlo+8NHq+fCLMDCdJd5HC1Jy9j3
	spMHo5vKOBv2cd
X-Received: by 2002:a05:620a:230e:20b0:93e:6068:7e8d with SMTP id af79cd13be357-93e60688896mr486490885a.10.1791183720117;
        Mon, 05 Oct 2026 00:02:00 -0700 (PDT)
X-Received: by 2002:a05:620a:230e:20b0:93e:6068:7e8d with SMTP id af79cd13be357-93e60688896mr486487885a.10.1791183719641;
        Mon, 05 Oct 2026 00:01:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79f7dfsm2903284e87.58.2026.10.05.00.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:01:58 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:01:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: power: qcom,rpmpd: Add SDM632
Message-ID: <zk5ujmwz5jfna7xzqaaove745lrcarqmkqua2hswl7e4mnme5l@q4ik5vuav3a7>
References: <20261002-sdm632-rpmpd-v3-0-95c47d0f26cf@mainlining.org>
 <20261002-sdm632-rpmpd-v3-2-95c47d0f26cf@mainlining.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261002-sdm632-rpmpd-v3-2-95c47d0f26cf@mainlining.org>
X-Proofpoint-ORIG-GUID: _PQdH-NezLwUzM2selryf4C0PIulze4e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX0HySplktEyy+
 YRR2fPrfjfNgrwlwATl0wLueRc3K6xCNYJdaafFl6F8/8c+PIGE8FXkiNoDYy0i7zSGkkG2PQT5
 /XZh7irAHeb9viF3ZLFJXTqIaSoimSQ=
X-Authority-Analysis: v=2.4 cv=YoGa1IYX c=1 sm=1 tr=0 ts=6ac34b69 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=OuZLqq7tAAAA:8
 a=qZHw2mh3vVBxtvyT7EIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfXzbRp11/m1Oz3
 YH9l0s78MP0azw7hDiNJ9Ti0WYf3oOWCXeOaHcIuuJ+Lgyk22hFYG2NgIo8kOzTPFC6HaPCf+lp
 bF7ZLGtPcF6UaAqNC1JL6heHrL9f9sac51BxFAcEpmoaHxW5J/TqQmTPZh5BK8fzVJ96kbOJyTV
 p2LTeQ2rqCB6SasfZdwc1yKSrQ4R/pcAPYsnKCW1mLe+Rq8kuI5ekG8A3jynu7AlS+B6EVMJGPF
 GxWRG89WPPvl8DtKJ5HbbzMFazaMN4+WuPvBUUJTyPdqNQkUIZWULAv90ltfh9e1Loge/9BEzMr
 qLhq3PrhTbuo8bMlfTOkbauKfsOCfeOoI7+KcnaltXhbcEGKcgf+/tCp97QyzrFzyiU23Dwhwy4
 XQ/3Z9QYr2H7HTsj3zTDTT49ukupydjJYjRAoeiKT0fhJyb4ekSt2Qp+WBMsmVk2vLphdqekqzN
 69xbhPBYH3kB1AABuBg==
X-Proofpoint-GUID: _PQdH-NezLwUzM2selryf4C0PIulze4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050027

On Fri, Oct 02, 2026 at 12:38:30AM +0200, Barnabás Czémán wrote:
> Add compatible for SDM632 RPM.

Please write something more useful. For example, why do we need a new
compatible, what's the difference from MSM8953, etc.

> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index a70bfacbc5d1..4b263a982fca 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -51,6 +51,7 @@ properties:
>            - qcom,sc7280-rpmhpd
>            - qcom,sc8180x-rpmhpd
>            - qcom,sc8280xp-rpmhpd
> +          - qcom,sdm632-rpmpd
>            - qcom,sdm660-rpmpd
>            - qcom,sdm670-rpmhpd
>            - qcom,sdm845-rpmhpd
> 
> -- 
> 2.56.0
> 

-- 
With best wishes
Dmitry
