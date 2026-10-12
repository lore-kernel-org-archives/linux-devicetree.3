Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187A74A0907
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819133; cv=none; b=Qg5DJa1slUEAmKPBALVfm2Ljg0MarbfEncEmpEGhNFnsHaasbPWTNe+0b+IyF983zODErESgzFbQnwoERHavthwUBjpGgW/z4xr4O4duFGgc6OuScnazVyRrbobRP1OgL9vHK9r0FyEnGSFMZD05Ik5hmDSApcBaR+JeARGzgOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819133; c=relaxed/simple;
	bh=b4y/kM9nQQeiicS4RTPuO/cyCI6SZtxImdln7AP0eZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OZD1KAll/EzcYZZ/49wR3DqYvURuUl2nI7RBeep8W+d/gQb201MoOCX+sePWtZsmkalF1ePN/xT1rkO5nY1L+Zva0yI5eURdxwbHqn+NFUeXa4WLFyqFvZdgjWTHNFjjUii8vF3kCuACU2VaORVXcSb6kwCWx/GuEC9aQKGMpXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrmAn3z5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJc0ZQ3Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrmAn3z5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJc0ZQ3Q"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0B1C2275899
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K2E7NWsYM5jefqd7x0KPOme7rcWFKAPCKoT6nTZ46xg=; b=DrmAn3z5sO+ufxHX
	zziFm+zFriYdEvK/CMv4BjzqGJwWI+L4/0Tsxg33R4qxp6H0q32LB1zsa2uxQgL5
	0XAs27RrBIHWndwhXP10ptzfxf2x+aqolI6iovroBoWABbBd3tw6mxEDDq04N6mi
	xBotHvagyY215Br2BKnrZs8cCWFVckTWsencBFuU+zRktyzmMFSAspF89B4FbFkx
	LAsmGook6Kp7riODSV8lYXUemGtZ/Ewu8w5ktUzfB038ixNrNcJn+wmrqK3LzFME
	ibuHWrXdsU+nxnG9uZw3jrUTqUHacGWIC7yJEGYlhh1ZHQL4jdpOmI5mun6ITmJH
	hoVj3w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq22p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:32:11 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c101b7f863so47851137.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819130; x=1792423930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2E7NWsYM5jefqd7x0KPOme7rcWFKAPCKoT6nTZ46xg=;
        b=OJc0ZQ3QiuLtTTyNSQ9Nzm9UYdY7n1Lx7/BXJQ+SIQQAwCTbqEx0YSZ2DpCmH6+/iZ
         TGs7ngBeD7fRlgIBM+jKHV5LglrLJPvKdr9aYYIOzzirRJe8sVKVfIUPSRu3HLgH8lNi
         VNK/JNVn16xh/87H7t8rM6A5D9rHLitaYL8MnSKl2VDj2pwaXls8EZtkRkrD25Ote2Bg
         bP9I/ayfUkwnD5UKWpdh6Sec46j9W6xdFrWtqWG0wwRRTp0g75nm16mLHNdq3QXeveXj
         Hd3J6AcihJMhsxOphfxSkbKp9H3rXurd2B1IV5Xd2wXsgJDI0YQ17+l+aViIw+Up/LHV
         kJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819130; x=1792423930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2E7NWsYM5jefqd7x0KPOme7rcWFKAPCKoT6nTZ46xg=;
        b=uCqZR0VMHhmulxAhzHPeEZ23VGE4E8ieJKWW0VgmjbQa65Q7YSfNQmHKh6+n+ONiK/
         j+Pp1bxbX3tWz+t7E8WMnx2qlPMEhd6EvcPBXTmAeOvFbOxmxv8rW5tde/FcDZMLct6C
         +JiU0ttDe+oSG3+W/8JnniUQV0tB6fgL647nRhS0t6pZy8yZjB4u32qv67HnnBSAoywf
         4skl+4pedr31TEBKP4oGHShv33dJsC1ta1U1QuktfI/pMaYKBkdrj+K/oMzKmUhpgj5S
         wOEANmlLByAqrfo+8QnXq02JwYNUmrPrX5NpaBedL9lAJRP8fF2/HAYaQ47r372Cn5nl
         LyHQ==
X-Forwarded-Encrypted: i=1; AKwUvByitQSdR8ufjUSv8ewwzgJgcjLUAElFstbyHHAHB8wxEjncIyQlKopm0Xjob7XVyoGHBYijSgYBLJeK@vger.kernel.org
X-Gm-Message-State: AFq9FYLbgOaPMoZrFawOsxHBmyPsMW11HfGDr3BMD06nMy/8uk8sE2AC
	t+dBUSwzHqHTGya5GJg+b0E9jJGP6ROhltE0z6eZ+I9vBnJbsPq2uRA5lenVkjMbUCZAYvdeFbC
	K9bk58gHKEKy/V128h9Eb4Qy014y2tEkmJDaZRD0LXiNiLaq110BMGcW5NPluYcCr
X-Gm-Gg: AYBFou2lB8JSJxlCFY3hAWdIwBDAc0gVPo8ApPDDQmKCQ/v36QCkUgs9StACYsWEox7
	k/trkWoOyh+PXEc6gJqRrocnypk5uKkWBGtfq8HLBBeCnqG+4tlU64HRAwutH5U7SOfQLpAIMoA
	PK8ZEiqZqGJ4tXRFH3sGW+Xv0MqAaNYAZngOwGwEC87wBqsZNcZTV6GVadbC/Ox73naUWTr9DqM
	ZnPm0kIdpsMkG4KwD/5p6lDTx/BzPEgEuFw4WweqYyS2SDbAc+jPeSbcbH7TwJ66peGmBSN1VNJ
	ht8tzj/Wv65S6+wSmTa89ISOC5H5B/flG6NVMjkWkQkeCZAQe+Mn5mX9Qcgg1CDcDMhq82i6m+M
	EBQXx+xdYgeyJmcS9nlAHgw==
X-Received: by 2002:a05:6122:4a52:20b0:5cf:69d4:10ea with SMTP id 71dfb90a1353d-5e92e15cddcmr1543510e0c.0.1791819130058;
        Mon, 12 Oct 2026 08:32:10 -0700 (PDT)
X-Received: by 2002:a05:6122:4a52:20b0:5cf:69d4:10ea with SMTP id 71dfb90a1353d-5e92e15cddcmr1543473e0c.0.1791819129608;
        Mon, 12 Oct 2026 08:32:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34feaf0767sm124748466b.40.2026.10.12.08.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:32:00 -0700 (PDT)
Message-ID: <1e086c0f-148d-4dca-a129-9123dab0ee65@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:31:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/38] arm: dts: qcom: msm8660: Align closing array
 bracket
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <0b1bea1463ef62cd786c8c7ad150e723f6bef8cd.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0b1bea1463ef62cd786c8c7ad150e723f6bef8cd.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accfd7b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=C61bhbeWJC_1YFl37gcA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXz/jSuCtbgFlf
 mr48/SfYqFVexza2PuwJ9LXmEInpXVMELM7OobjJ2aU3paZSe/PubRXq+c06BGz4ikk2xy8Jpc+
 KcEyENLK/X1kppMQNjftGs+xMaufmdA=
X-Proofpoint-GUID: X7MLQESmZno641wPceczoV9qas3gECxw
X-Proofpoint-ORIG-GUID: X7MLQESmZno641wPceczoV9qas3gECxw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXzxq//SGhj6V0
 rN4A8XXK3R5t6irRSEfPhvj+bnBfVBDuyvSxE+trwcjQ12r4epluvvaar2UX1NQ9Nl6LaWEiVJd
 YPRI/CimTgGQIUuP8yDow1rAZmNTY0+E69n2fsBdILhT7QfW5DIPOdjAtSYcqjRM+cA04HgNoWi
 MXHlYJjHIF/yqw90Mr+3mSLQhT9D/X2CkbrYn8GS2D1uVBjSui7FnUJdy8KZ5mTzwRPuujMlpik
 h6zwIH0G5amydMSMiisslFSRSrI0L76f7b+HVgHCXN9w2Fm/ZUXBMT/NpZuXOU0dDkJgCX338Oh
 X/rRJL7TCoBAc7HgWS4BAT5+EE+W00JAhRWZZmSugbjBswS0PWi7f/0/9J1I1HFgnF6qnHwDW4L
 JgWzDO1uuisiIC50xlsbVs2PAtwMUeSAfoJ7/Vgu9lKLd5D3xPsM1/zglv+rcaOvA0+ez5XEv0A
 mM5InOwyFYyg5mEAJTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Closing angle bracket of an array should be indented like property name.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
