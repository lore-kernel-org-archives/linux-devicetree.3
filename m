Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873510;
	b=wOlvN3nxAL1Tv4wKyfmge6v5VaMbxKSsfZtXD+9ZAewVsFRNswyNlVtX3DFfcTM3auEA
	 mO6DKJmMZheR5wYvcPSai9p9oaLfGuN+Cw+GmouYfCRHlIg5prukb1pC77dGu8UXNv48A
	 PNwaJHHA35sMGr5cdrc0stzFzFlxU9SaggKkd7sShnU3nIGcma+hwRlHPP2uRsus/sBWB
	 tWd9CdoQqwWEgRQPtykN1tL0MDXr58C72tqifHS+7uNDKwzKfDQRxXixv/FZnv+kQlxwN
	 kQf75SdZ+KsRbjvsykZRkhXFGunW2Mlh951z/9dv9sD3cZGTtqkRpsuIaZawK8Lmtjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873510;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fvgN99J0Yong6xuWrkleinpqfRDCxfSse99001Aj3X4=;
	b=xexgSEMNW2ZNrqP1iOCtZ494pfPjqn2Z0UznbZdu8lwGQRxTKnqhp6TU82h6PWlhzh8x
	 HyCMgcmc74D5N57fyJf3bwActERyVIBs0hZVTB9ZcTumJ6re+OzV5JRsGI6wMc6UDBMvd
	 Kz3Yb+MpQdpBj0XAwWAi2enapGRCrYd2y0SXZCWsi7GirICFvj3B24uB/pQdSpR7N9IH8
	 EHx/0ciXJaWuiyEBJe0IHAuZKGd1GiWGpeTTcqUPhK4XqUE1BqgdtrJD+s4elODa4eMET
	 pHUElH6/bRV3hoOXrl4FT3i+I8i2YRuIpZN8kHCDDVBGXV3DSsEajZCASwN6ddysFGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODDHW1CF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UXHyF38b;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5479B606A31B
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5479B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODDHW1CF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UXHyF38b
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OITtWA1261056
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fvgN99J0Yong6xuWrkleinpq
	fRDCxfSse99001Aj3X4=; b=ODDHW1CFlJuMQQ3T8avwNsPwCAtKVwoK0Y06DwmX
	aK4+d/g1DecejGeTJDL9UbzyumMpgrUw9rIhv0ldELoSBTz2P8jeOyx+FTBY/1+s
	ifA91KBzkJbeEAEaqWnk1b2ad59VOkK0ScgDKuI7Xv7tuoEOrEfix+xklow7LyNv
	F+bo717v+uZwbJolfk2mbxMSqBsVECH43hq5KVzpnWMfjSKMxtSUunLdLq2cfQpy
	1fjMx3ZTAMAxhGBAkmDmq91RQwEf20Nbwi8uZo0l1AzANQhdpdk6GSFaq8iKR5Zg
	xjVyyU+tSuCs9gauOA5HjXSiLohMpAL24KsyH3TonboKoQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27sq4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:25:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ecdc701a2so251535885a.3
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 13:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873507; x=1793478307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fvgN99J0Yong6xuWrkleinpqfRDCxfSse99001Aj3X4=;
        b=UXHyF38b4xgm8WBKDhJLeJvtzM+aGdMkdpXoShW2v+NBXljPk5XcEWOgJE5+vDRJ+1
         UGeCtjsGLDZ/KMDekgIclEjxSl0GG4TB+4N/fTRCM3Uc+rrS7VFYJ7Z/Am2S7jfNlKl6
         U5yL1ugKPY52Qyp6kn7zrCmP9qZTrcAB/+TUOk2nvoRhMJuaj4E/IXtVkuvD6cXFDj5V
         ePzAyaQQyxjNIQxBNUtU7v2pIi0BRC33NzfawuAo1hhYfVVtZAmemkHw0K9qA0RmDfbE
         apExoAuGJSQvnNSGvwlr5pON7KtBqD1EKX90o/YvbZmRpUUxhhtn62n0U7mgrEdQxA7A
         0OJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873507; x=1793478307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvgN99J0Yong6xuWrkleinpqfRDCxfSse99001Aj3X4=;
        b=21ViuNjpxGTj0a4h5U//VayXE8ATaDN4bv+qCuw8TUuaGzVKVNiKvkJ7QXk039Ey3K
         n/7H7J8El4/UVPO8CybZL5LHJhi350nGaSWpVy6SbZZJdRGGndAf0UecDvVAQ391nzm5
         n6k0/pyTPrjaXVhU9R/XFdpxH8aebHcVIPhPc83cf4AZdUI2R55F0q99ik0nPaCNPY/r
         N+NHEcOMyRWTjKzJax39PFomL41E8Szl7JnUKRgkRIiU610JUrbIiV2K87VTWF2QbFbx
         C/P72YWnlZDCMYW1rmIDgT4KXjp/VlKAIH33oLgao0pH1bwInhW0/5TpFGh4XLrg6D/G
         ffbw==
X-Forwarded-Encrypted: i=1; AKwUvBwvOqPSz0O3v8r4eJXEFncOejimsgCaHFxuYF6zOGKtLiX9Pj9t0JIVM/gRIqOWfPjKY7CqWMhGzZ8A@vger.kernel.org
X-Gm-Message-State: AFq9FYLF+H21zrk7kGQkHvHW3mqzTwjuBAO4znXHjS+8ePwJwApadn6P
	EPF8ETtkoRT8I8EhIsrEN8ZztxVOAXvDZgMR0CYeNbqzgRfDBuLOVCtyYFqwYkdo6FJMazuhQl+
	y2vBV5hfYx0IANwc+I/2HtCOG/EOssAPnTdpNeoK/No30snkM9vISt2bhT2TY3WMY
X-Gm-Gg: AYBFou23Zdj+LX/Ip9+n1ZQ4ws7GyR6R3bG6q7YUhxPLayS8A+AxIEC6/RcvWp0tR2k
	g+8/9sH5U4ZwaNoRYku+kamLpIXpWHV7+yPByL2DOcd2RnH5abjXp8Kev+lTYmCLW51EH5/tchv
	/8zolbmwua00Cu/ZIxEqAVSbcLM5YMUhlIZJs34FIIfnwd/iy1HY9xASbNFoTGL1+WzRk1yh1/V
	8w5qycTgkhKRSgC4aIBN0rrPzUYpwisOVesC0PTn/G2jTvhU4lScm+ViqkanDqD7ZRDNCv5RGYU
	xkMhHnndGBpualsE7w/kGYHlgC9JstGqvkb997XfDgC7t584aXUTje0xG5ejbdIUKPz5KWuSubF
	mhiIoR+D7LK0UH3p7
X-Received: by 2002:a05:620a:700c:b0:940:cdec:c867 with SMTP id af79cd13be357-940ef9bf00emr379196385a.70.1792873507424;
        Sat, 24 Oct 2026 13:25:07 -0700 (PDT)
X-Received: by 2002:a05:620a:700c:b0:940:cdec:c867 with SMTP id af79cd13be357-940ef9bf00emr379193885a.70.1792873506753;
        Sat, 24 Oct 2026 13:25:06 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f59750sm52347475e9.0.2026.10.24.13.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:25:06 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:25:04 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sm8550-hdk: add DisplayPort audio
 playback support
Message-ID: <e67ppax7mdncrk7jlty2s3yrih3sqwom6k2rkpfg5pmeudwinm@o2x4i4besp7v>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-2-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-2-8a189c71938c@linaro.org>
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6add1424 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: zPInj44XndinucjdxltFZP4KnQZTQu4z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX6jmEbRwG5OxR
 ngplXt9FqQuEMLaTK3LkA0oCipY0MzSmdjc4K439mR0VsqLxq3yAQvP4pjG0TdH3ALCbsS1JdSr
 POhYoEyrLKjgahvUhvzFNV+C8Rwtuyw=
X-Proofpoint-GUID: zPInj44XndinucjdxltFZP4KnQZTQu4z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX6gpteLAdaOT1
 kVSSIFW55degB59YNUU14AjVYVt9YBEo26W+NuJXVMsy8RtyG5aDJIciDpnEKccUKvoUGUyZB4B
 9+GV7cOOXVd21bFZze60ZzBBZnrI61XyqtHFiQJFRtdTgBhHYRr86W6Ste417pZCmIGafJl5JFt
 SKQFb2efPIv7Mbo+9fQKL6d6YPfBGIgTLbgd04aMZbG5/aDVecwzdxV1wMNUJT2bJV7naoxGEgF
 AcgKvsvByLkSy0nGd6QVjN+hCS7byj0LenFhnu+2yQC8z28seMKLZm0gUBTVqOn2x/PKYQOgo2i
 CAcFn8+nULrbZll4FfJFCivmD+VCn3+kDj3av3FWKwDkmTHTfaD3zi1Zp+KkurofR1uE1PYrS3e
 9jbBYODCWhhvIzqr4KLu4Lu6oV2fPBcaJAmNAW/VBQFdr28iurPAd0Uw0oqvXqyXd/qn+CCBzMw
 /blTQq0iLV3lO/qddcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240081

On 26-10-22 11:36:22, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
