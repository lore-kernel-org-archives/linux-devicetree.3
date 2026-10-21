Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572712;
	b=Izji2TSbqqcO8UV+HGR237ApQXCBKhopoMZ3InJcMlnTb6EiDG5KMOetgj/eD5PKxUTC
	 HCZX+f5huAB0d8YfuDCD4eknuBvd8fJKSotz/a2xAUkXVtkMzhQHiGBefjXTp9qfc699l
	 PGVPp0LY+ApbJizsPAFnYWMvhdsej+AT6N75yrFnuzOj29Er/qtVg5/UoD0dWZAM9X18x
	 Fle2NjhtBrKtTP6TlZa+G4FrBkatsPXRbcL33VgwXMIUJeWItO+y6zvlE8/XQqVFvFxgC
	 r5awJ2JgrU38ruewyOFwcpCOGLRXrFN0wS+9u0JiX7B6BmsJB03Pbf/N5GzjyuBmy3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572712;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=//8emHITfe15m0Bez4BAG5beNHYKTojZgWKVzWcxLKY=;
	b=00hisIbdBn5u75k7Cd+PW9iw6tIX0zguCHzuvLFsy61W7kKpaYcUjPXAfh/K+GQZ0lI7
	 ORd3HajlG4F3nqMbKgGUwu030SQ3D+d69qul58/3QWn2DeoNdclA1ixTs34ElZ/uTiIK+
	 NVwGrvWmCTNvDm5JQTML3zaTuzWK9GIncE9UHjED2hpV8JVYE6alQcW7PC4Mjt9E6Wi2h
	 LTVwlJSTDmxp+SfmoYBsbdPDEUbWW0aW852cbgP9hBsIbUiEY07MqHtqRElRFusfhfUNh
	 dggAahu2mPFEBF9BRnpBFPbU+2G/CMaJ+883blWtQsqZ/oeD1hlCVGV0tildEZJUtpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eevbGZx5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BuDyPL0P;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB9D606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEB9D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eevbGZx5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BuDyPL0P
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jINf2848123
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	//8emHITfe15m0Bez4BAG5beNHYKTojZgWKVzWcxLKY=; b=eevbGZx51TjNI8eL
	BSAc+E9ZHVox7sAUAJAb6luMLvjAigyp3rJlTUZdPtYEvzH98x4xM7Kc/yewpMc0
	ITEhCIEnTVgNEu2fq4d9B67aL56zGvdxVllgf5kk54LjEb0ylXpICp3h+iONpxpO
	hTNZM5cAufuZ0thIDIxEV6Jw+M0g36/AT4f+1izFYUkyI29ajjwdRhbkHlQTN0fd
	KoNBfRiESnWM5t4aGZMvvg1tiS8I4ooCCYAXx94xNHV2eoa1axYYymobm7rTpwp6
	w9BFTSsOvtrW0qi7YpBffoc+X9W62iFG9y+iyEBtRwluIHSurn/rKRGOJfwe6KiI
	b3khEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9auv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:51:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e58614290so10340085a.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572710; x=1793177510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//8emHITfe15m0Bez4BAG5beNHYKTojZgWKVzWcxLKY=;
        b=BuDyPL0PkJclgCfP6c2h8rXJ1y2Ugc8edlLuJRDShyIb1NZryrV0JQOEufoMYH8Itv
         BoH6dS480qG60HjaQlvaOw0/ZNd+1EJ0ifHAtYDociR2OO7S8CSvGzp+38Ir/LLb1dFr
         9jV7DdjrOTW4b1KD6CbpfAvhPwSyr27LA3o+mg+p1z6wh0RdArBS0o45jHydvGPO2obf
         mvvj/G+ihaeQtn2Wi+bYNXClrnwuhveavIIE9rzPa0RJJjCkJDIksWTEvKfw0TS8EJxC
         xM/t3eQLexxSyS7YyT67kgBr7gjDYxdr9Hg4nX3FPZLcOrz50OTv6T6D8fVc2x7X2Lzz
         2r8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572710; x=1793177510;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//8emHITfe15m0Bez4BAG5beNHYKTojZgWKVzWcxLKY=;
        b=bBgi/2c22Au4nYYSgrAk7RtPMcB3c5SgimQvlbP9OOHaFVmpOsYX9z4sR/t28LxtPn
         wtRPZHFN+xcb7yf5bJva3nsVwBCS4PwJ7PNSZd6xLJDr6e0gPibVAmvl5R6HRfWfx8kG
         go68nJFt/+LhiJMGDNhz1MBpWnwE+RH6yJqFUjok9UHgC7V5HtZXzm53WbgJOgTCmMLk
         H8QKbqKugeDen9VtZQGypaUGyvAfSV64S6tzNh4gH3Pt+oCNExpFGeLIODOjNkOuljcg
         aQacuZkcyGzezbxid7VqiAMLS44A6Z+oNHebvGHNZspj+qqSSOVeurdYzCMZpQv7EfYf
         MnyA==
X-Forwarded-Encrypted: i=1; AKwUvByfuO3Bt9NWIkGBFEqtbhJTZl0gY5LZdJEHx5RecC5/FD7HsXRCdMnGiW1D+hU2tweKQo2W/l5L1otq@vger.kernel.org
X-Gm-Message-State: AFq9FYL6m5mf2gUnuKeJ3g1OO/qbCpGqKij5MRQRfDA96V8aJPyhBN/v
	JK8D/inoN2hP71wL6h8zqBKEy4gf9YqP8lL44P3ymkN+G433CMOriLkvTWWefIR/qqIKYdXxS8F
	UVZO1ZizbKNQx6Rhs1iSbRvHlTeopFfKOpspMMqHuPQSjPx2BUYi9KcwQKbvWZzcK
X-Gm-Gg: AYBFou0a197emeDibZvDObgWVzyiZ6I+85ty5emakqC+lXlvOid7UJlL6HQL+vxqO4r
	hdFtNGWItAWwk+kwtOpO838MiIBWgt20G2ZPiVi2PT12jFLCeKGlmnrg6IiimPN7l9RaWzSIzpJ
	Asj6rqJ/ARViK7wrCpwNkknh3Z90eZUvwfKeHeL9QwzKs4qjTTHMGNpy4i/4PtNRArAyaiPvKAm
	UlHa/9Jpjqd2H4ijt7vEpBSyWDj/0YNoYfsAvSR9OBT2vCZOVpk3vEqZ10U3jKc9Alq0z3i/Vh4
	OUT76aUvQ/N0yjBoD6Zf+WPpo7fi6g97GDUaLpcj8+hXiUhz0ttz2DVtK95tbQ3qwDwP9n+ZOod
	Dr0D/r7g8y7rSof2SRZ4J6A==
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr339635385a.3.1792572710042;
        Wed, 21 Oct 2026 01:51:50 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr339632185a.3.1792572709548;
        Wed, 21 Oct 2026 01:51:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c467900dbd3sm53534866b.81.2026.10.21.01.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:51:48 -0700 (PDT)
Message-ID: <cc411497-6acc-4320-87fe-481c3a904f76@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:51:45 +0200
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
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: glymur-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
 <20261015-glymur_camss_dts-v2-5-e7b1f403146f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-5-e7b1f403146f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX3Ut4naZ5H+oD
 uAeneKbEMuFZFQpqSPska5kDVXlnVBJ3dxKop7sMWDONFo2NkNczDHn86nLFi/NSyZo5qYy/fI5
 tsklflqcdxlb7pjNGefSt4/2meGxH1Y=
X-Proofpoint-GUID: dfZdBYAVVrml4hWGALCVreKw-G3Ne41f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX6En6yT7fFEyh
 Zg+GQDwJsEgRRtR29JdDszJ34wvSQZN5mrUZ1VIwLsao8WWPMot4aGbD7ZO130on9aPh9/8uYfp
 to4abqHGqITbH7YC9trf2sARW29FtU3oKQfFX1amF0jCYV3wOVNgfB9DQknh8MWxjkHo8yzfqud
 TeDEOC3sQ046KVXq+Z+cG1tfOvskEIbufcy44D2XtkAqPXOfJq+vGG8Hn20Dq4VUcBt348vj0kf
 lcspvBMTJ42rr5aqOaIrl7AheEmEL79ZcUtKUvFGn9knYgJd4FxU6XVlTkMwd7whvgi8o9cm7pU
 Cm+8EaLo7ko1GS4B+QFBQCKL5KQWuMoIKb3aQS4KtYi+TTiwQU8iAskOw+WgL0CbceyKmOWWo9p
 P7UXDICds+WhGL4OfDzioK3SdlisC9amnXaYifm6iyYpLJxTN37H/N88ZEWWZRak0mm+jzRGuL9
 HFrKKutTp4Y+bI5UT9g==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad87d26 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6BLq2ykjfKK3BQYAMXkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: dfZdBYAVVrml4hWGALCVreKw-G3Ne41f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210035

On 10/15/26 12:52 PM, Nihal Kumar Gupta wrote:
> Define ov08x40 on cci1_i2c1. The RGB sensor is connected to
> CSIPHY4 in four-lane mode.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
