Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4B14A261A
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820364; cv=none; b=hh14tVvxKLaGi/hSig5AMTO+TvTQ0vGxZ+AXmwdVn0Ltd0YootpVpoN6SWGSGQKJ8owdrPMVKarMS6/C1ojenwK3Sd+7bZndNOVjO+KvavCtqoIYoBqUBaW9uq8FNn9MN1DG/0PZ+qptiMTY3u90mQEg6j4kPe2/qdbekJ8y5Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820364; c=relaxed/simple;
	bh=s/Mbf0x0sIgUm6VG+i/AMdI84Hw7nY61I9jfRK0CkHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MUC1MfiCuixGgpyDoS0bB/BLMbAUJOwyxQhjJ+UE3ZGy+MwJnPV31nmSoRa68gI1RYh+fKrKx5Hb+/UWOvCXjVYFso7p5oOIBw9uFJbCzTDEAxeDFe/AaMoPucixiLVm8EOXeVIUUZ7SL6F3qop2xdOHF41hDqCwtNYdyxVmncY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GWPxwrMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/6L85bF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWPxwrMk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/6L85bF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFfLdr2176515
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=; b=GWPxwrMkEjVUKxlK
	L/k+OZcFrykZB4BugiKn/ftBWMLJxY3lDlLVBKvBfcA6laNZ+QN78Wv1irHgeELQ
	o1BLycTd6TlWuueXF29YsnTdErn1JyLC15BS7RmslSesQ7LwNED2b2uA7NoVR3pK
	eWYyAye6DQ5H8/8TMAF9P68gxi+8S3cfvx67wQotTy/wmZsO+87Ld5kEUtU5NP4c
	zMi5CYMiIbqlv5xWMF+oiRQ0ggXN9CM3MTjPiAtyiDVSEugbVYSpO2mEOsq9y+tf
	yLxVOc3ZVfHMeTdWSLwShG1FmW5VVggoNP5do+QsUnsd1uOj0XEOD2u6LAswMidJ
	hd0liA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc1kaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:52:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso22520785a.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820361; x=1792425161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=h/6L85bFg0W3f1vjDgQ9LqdGvD+vt3bTEyKDfzzCMYD09Jmu9h9KPnz+US2vBacBIV
         wmHX50ZgiqIjOcefwUuXMte8xnllF5WzZbrX+muTz3iIr1N39Q1RtfsRyf7YHLDdm/fU
         PsCrnVBBdZaeGfZqbtLpAtqqJLQkuxd0mLq4508DZb5+WcASsPlkdXlEO1p5Y4K0MO2L
         9jhU9HCpTN++jtXelrW0zuYW0S9E0Z1uc6niYJRv/D7mmEv9IMTVajwNe+5PckHmC4pI
         ocfWSJb24iDYoyYVARDJdQlSrN5WhObBUl2X80taSVkP69mm9JhefCBTYMxmjU2+C0vG
         L+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820361; x=1792425161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=pSlAQyRMS+8qd4YlYQcnebRN2nluMA3mLn9ZF3tBe4EG3ASj0FloKsc+bbmpESOH2Q
         1noEpkIj3LAHHUQmu00RSY3F4038FrlEBxJMpUxJlB8yN3FRLkw3om2/AQCCSlNlcHhC
         IUXac6TdGovelETpjsy2NJmzp5pFTp1EbDj32wVO8+VqfMKYZ659r7rdk2+Ss8OXqRqV
         dNGX/FLNV36b01hxjXVjL7HUte0WLYSNcHKTlQP7ns4/D38nz+8F4yO2IDtX0XzYq2SI
         QxYBnY5h+QpDsjMLlfhQDIKLro5wfRYheZNMaps/zLrt/JFBekOyHk7nBLGYnDErMHlT
         929g==
X-Forwarded-Encrypted: i=1; AKwUvBwOMjs3tobU1SxjWhd6vly9R3rI4cw6K7KyDkt3ZlRdvG1QmBSSbp6k5A1cjdioNdbRCjPRKz/x8xCC@vger.kernel.org
X-Gm-Message-State: AFq9FYJBfNshG1wF2lPFHwaTP4QTOYfvwaiG9ys60VmmK5NabRcK+zyB
	rLn37dX24xJ5PCkGKPVo5aTLIgaqhcvwxyYIZeH4zsUsURzag/0UfHMsLzh2NXkcOseIQsVFR4C
	vewAa5w12A7WYs6GE/FBlmpN4FicW/+rLguyt4vjqXaOzRoqFClloZEVR2TwRGFz9
X-Gm-Gg: AYBFou1q1i/vO94X9Y6boEfKCI4M7TVFl/NGm6Z/9Xchs4SsVX3v6DGQ3img1TAc+oE
	ZUt9+kGLR9Cwx4O6YKkZ+YZaLypCYQ2Icq6sTLEHB2tMXZqeFBE5BOSwpU2j0oaQkvTJH5eChZg
	esHFB+8iDE+ppRcQir9JS9eGdsu09LP4wYJGCRvBMYQSkL04FbG6QhTgm61LcZugEK+aU8Sk0M/
	fOdtH9AGJF0DACeclNtsmtx8GHa2lcIPd9uLTgtaSliEPnxfvQbBYTVZyIi/UbcRFe/v50NCq1E
	pfuFwy409eAvrUvaDNwvwt1Zx4uoSnP8eHTuBqkIZJAp4XYrylYtMO9Yn2X+KO+cSvVLN8zXra2
	FbBcfq9KBsMSlrcqr6xKHlQ==
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr1908146585a.4.1791820361119;
        Mon, 12 Oct 2026 08:52:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr1908142185a.4.1791820360671;
        Mon, 12 Oct 2026 08:52:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3bbc9sm480313466b.20.2026.10.12.08.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:52:39 -0700 (PDT)
Message-ID: <339c25f3-72f6-456d-906c-a6baf37257a0@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:52:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 38/38] arm: dts: qcom: sdx65: Align multiple property data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <d0585f480c491b5d58d7f73a7f4429fb4e35f67b.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d0585f480c491b5d58d7f73a7f4429fb4e35f67b.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX5jmSE0MbaOq1
 vokfvotFwSS292p4mgq6xTJQuhFehRkkkNC2xhfc0YeET6KLCXplIBNRjUsR3vw6R7ZZMMxpHkS
 FcRasLQhVhFRjmpP/d6XK5PSkPTsxj8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX0r1Enav9PFOd
 dempRBe7SMI+OTzGvO3yx8PqVXX8JU2b/SFP1D6SRAj4jK7J5P89tYIN/dTyodlbLt7zAHJV3or
 2wHoxzA94774FpIqQsacIMUI/DV418wjZe8VmTgLynNqBemaeRg0V2HAs2qvJ1fa2smAVusXvph
 noRnzX9D0Ivg1BnFXihKPdhB8zNoztuYgbN2Hbo5Vz7/l07JzorBDXdLg9XdWZZa0N+JqNltjRe
 TCrveBi4V527RYD/1MP/iKRNXaauZSsa8ohT/DiMcAFiDT3az/A4Yqfx7PlQybk2d3TW2DydW1Y
 Q65ZzzPr+zgrc7rmso9Gf8zHYH9sWCO6hbF1RTa8mg7+sdN5nJXsjgCvyuyll5DFuC4RhzND/kC
 uycrUZBF+YalOaZOvIbgQ0DIlJ9na8SLaiKD4nmpAiN7+vUbdFQWn4qbVZASPCVIgeOMJWCwM+C
 /I3zaSPotX4FZf9FEjA==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acd024a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Bz_mBq91WImKixDMOFkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: gypBzzaGx1-kU2S0wllAOaP1GsbIkc4q
X-Proofpoint-GUID: gypBzzaGx1-kU2S0wllAOaP1GsbIkc4q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be aligned with the first
> one. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
