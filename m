Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5ED34B1A3
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501454; cv=none; b=bYdrOd0HTjckmpbynq6fM+ycIFQa3NOjAjEmbAnJTWM4BjecKnZMJA3W/GEmKwdRCI1QPfOQFliLUx3g/7+cimfkaLbm/hFrPG54sxyLdODAZLNkCUlrDq/H6ECdgpM3CJt0G6aS9ORP8Z1xqwb0Q7OTJQEOs78i6IHEB5Uuo10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501454; c=relaxed/simple;
	bh=+cgC8o6objMlkRYtUNMyJwtnnyGqaZktPOsybP4qn4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezB/LiQsZoLrnxsXZ+7AbSHv1Pw8wpy134phQRTsnt/Dh7WwK1Ha5Ai+aKLIyJHq0FpRVeozLNVaG0dNmHp+Ab20QA+Fl78BguKhYHj1W9yMPtSvHnInsSk7irBpKe8NMsq0NP+KOIPABOZDktXji+JBKnj7+Dkr9OBDCYM3i+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPDdWEY1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b11Ji2SL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPDdWEY1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b11Ji2SL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKwDjq1175621
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BpZ0T/5n/sg40gwyNclxxw/d4xlHDB3hOtWU/1HM1bo=; b=cPDdWEY18SIimcmh
	0ECvk36yiBEp1Q9JGjk4Ho/zBw2DZoXSf25bJ2G81hgXrK1o1xtWMiNvzhe8Sr/n
	rdAN/yzRW0jYgHcAtocszJlvbPs+vxGJpfOydLtAXpgG+g5IIDse3wXszgvFKbZK
	gTluDoq9Me1yngcSjKFY+2+cHiTVlWuu1D0jR7ZrZ9AsRddKvg7sLBSNYrF7l3rI
	A0Onr70DAmPdRXbuz2Hm93N4LSJ1ncGEqgdti1J1fnunWj/P7VtpJCY5yXtwaRt2
	ZnV3z5wvMejFryXOii/SOMNL363pBSrcWJ/om+hq/+VFrJZLJT8OqC84zjW693du
	p2sLsQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q76s83v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:04:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-359fe456655so559702a91.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774501452; x=1775106252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BpZ0T/5n/sg40gwyNclxxw/d4xlHDB3hOtWU/1HM1bo=;
        b=b11Ji2SL86x5pDjdumxaty+dXdsg4lczsa7SfPK9Yaoiv5N+wf2EaoYgxLKvkN1xkC
         BddmoN7Vd0ABWSaMBKthusueuYhyhi8y/LIHzbdxU7WtjVnYMjd6nt4ECS07JAIQeb/2
         HgOxmPnWt0nIUwdjVjnZmGCF4yMWlcoxARf1Tntflds7gicIW0i3oY91CbY8rXfuFT78
         wLohnz8+6vGyVAvmYNLF+2E+OHo5rzpwdu0+agBGD4vxdCzon45Rlvhd4RYV4aQPWfyW
         Byl7ebogXJLcKoZs+HBC4uTybaJq1Xcp4v1GVUW+1jdgqAGFrDM/3tcMOv3UUkWLqxBl
         u3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774501452; x=1775106252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpZ0T/5n/sg40gwyNclxxw/d4xlHDB3hOtWU/1HM1bo=;
        b=o6tDacj2erUIxXnm7wvUsf/TloaK9vsEeio0/xq1jXbcYEp3IM7Gq1pCirkJpfCx5w
         2IOeTdEwDjvgtfvRq/YHVwtiexS82nIxlolO0txBZJ1FMH5tuZ6Oi0in188ZotnBQ1j3
         PPgeV0vwxXTOMTVn81Th2wz52We6z++T1IJWn+T6U8tkJJ02s0zDzJ1AdVkwqcNanGed
         2FR/MgTbZWxCmYCu/wha5dH8LdemG9zmyzYuGOJft4vf3wVRyNE5oXsNZuLjwLDFirqz
         y75OcHegSxUvfzV+f41UB/5fgrX6Goez1lG7spvzPfjy9xYqXhRVYxy+yulNN7NR6oUn
         lD1g==
X-Forwarded-Encrypted: i=1; AJvYcCUpSH1kMShRTMs+alp0At6O/eb3qsl6ZWw0pRcZbChoPt+SVY+DmQS+vOg6Vv8P3gvz4nyWPXwVrWz+@vger.kernel.org
X-Gm-Message-State: AOJu0YwP6o2l93uXEjvEq/AtRCUYKUo+ycn3zdCx9N9TSojeDa6VANuQ
	ythxPGsYk6Lr7rc948CNN541YAWIrN4luutdJMis20GSG1WfJGu9k4N9b5bwxMuG8PVKE9wplgn
	SmIpHFN/bloVeYgdSEq0a8BQd8WEw1mGhAphKUHyzaQKRncaRVGrUe4CNSXaht4Ua
X-Gm-Gg: ATEYQzz/Ws/0ZtOSwtSy0QNtbgtRgRaH9rXYQNdwB4Qd/jf2rTarTX9cSJJiZ3fVx/+
	uvQqJugAgWepOuErjicMxFzNfhtg/XkZ6W0pJSQLngwrf0KeCD4TdQZAykZT/b9w85HCwGrWwpm
	MSsVXNnuqf3Jpmy1fs4aSNYsJxhGNGZVS0H4yWB+ynhCbMvG7/u/nktgWN67OkhQCHC5oCHzczy
	GzXkv+n3BQ8JJdHf9xvmnn9MVR8dRtj4Jt6JdiTB7UEwA9A7wqLP/e4j/8oNRbHOn8yAjWCDUyE
	QuwGwaJ/EfmrpfLaFWZ6FLPvXFOLxCawPMs66K7i9wzT9pYlYfwl65ii+RtKdwevWkKzATvfPaY
	/QZuLeAmQSJ13tgfbdbF5nBj2PCtZS41SX0iL+Y2JF8pYlK5hKqYW
X-Received: by 2002:a17:90b:544e:b0:359:9016:1e72 with SMTP id 98e67ed59e1d1-35c0dd6b831mr5486705a91.19.1774501451678;
        Wed, 25 Mar 2026 22:04:11 -0700 (PDT)
X-Received: by 2002:a17:90b:544e:b0:359:9016:1e72 with SMTP id 98e67ed59e1d1-35c0dd6b831mr5486667a91.19.1774501451083;
        Wed, 25 Mar 2026 22:04:11 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22b9fc96sm186754a91.7.2026.03.25.22.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:04:10 -0700 (PDT)
Message-ID: <036c8c0e-350a-41bc-b56c-a9f4ab6a156f@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:34:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document ipq9650 SCM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260325-ipq9650_scm-v1-1-ad6a3fe53f38@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260325-ipq9650_scm-v1-1-ad6a3fe53f38@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NOPYOk6g c=1 sm=1 tr=0 ts=69c4be4c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dMwID-rZ86g1OZKhrE4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: GRjGbS7V27U_EHqsOOEarKzS2YLAdZO-
X-Proofpoint-GUID: GRjGbS7V27U_EHqsOOEarKzS2YLAdZO-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzNiBTYWx0ZWRfX7HpdCN6cqplB
 m83S4yuCRNGdrdXjodq/oIKuQEMzb14vZkk1d5NotN9tBgF4r8+d3NSyYwOLwzcIY3NZQID9BLn
 m0uiGgBZHhvwBzhuQsk+ezYML6j5OV8N+VuOJO4jXqx2l+5CtXvS2mVu561i4SKAGUhnI/TNFJC
 8oO2XRjXV7x5GeiUN0ryCxTQkNwUM70DVbmk5009DMcdq1ZFA1q7aiez7V4r6HBqlD6jZfVvYsG
 Qbg0MQyiqFpkAiG543IYde4us0eVCfHZ2eofrMEQzQYWfsshG5ggl3F4OMdgmWA0XE3ekN5gJ1z
 mbVYTl9TMGNN+yYB5OYX48K6myULwO8vBXn+Jhrp5pFs0qKmkoo0XDNdyUSYFpawZMNKTvrIHJs
 00bIawZaE6a3IyNUVphaIDu3X2Y7K0ohC4Ia6Tfzo+Gcy1Uf+1FTNkWlLwb+RtBwQGXoBlAkiug
 HdcJeYD+MOt3hK0EbsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260036

On 3/25/2026 5:09 PM, Kathiravan Thirumoorthy wrote:
> Document the scm compatible for ipq9650 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> index f628b1d70fa1..7918d31f58b4 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -34,6 +34,7 @@ properties:
>            - qcom,scm-ipq806x
>            - qcom,scm-ipq8074
>            - qcom,scm-ipq9574
> +          - qcom,scm-ipq9650

Where is consumer of this compatible?
If base DT isn't raised, can you raise along with change?

-- 
Regards
Kuldeep

