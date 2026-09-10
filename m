Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54973D300F
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028270; cv=none; b=fIPfL6k6hzJ5ItaNDlvm7hD3RqLZp6f60IdX9iJVFMfgtsQxsNUDGQHo0eOrDRNPiRYoDpZPG5H8czzOmeLTDC/R0mNdL9hP5w9nhZfvUVwafo92s0GKQWfagVcGrfj0TQ9fXBDPPpyG3T+Oxnhoc9VLV1XDSRuaI8mZ1RHOCJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028270; c=relaxed/simple;
	bh=PAqcHXy8LZXAS6z3iAsn07s1vKnAVd/2G6kkS2rSYHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuwmpK+uZBFmNlgRXsVxgoQ+ISvcNNpo0VFc92S2preZtyZruZE7ro4Ai3d2ODbluIVQOb+Qi/FikZZJqEObLhKVltOvxDlXfvbNuB21T15beMuy8bCfCUEstTN4vFic6h7hHSAlbIFZYq/MGfz9Tf51e+T5BzRvYGX50jiYI3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8gWiCW/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0UwHL/D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8gWiCW/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0UwHL/D"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GprY3655281
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j5AEaRW4+Q+4g0E3CSuLIXhC
	YjcEmOyKhDjUtjMfI/o=; b=m8gWiCW/244l48na8aW2DVd+CEhL+jS12sUq5UU9
	00s48fgPxh+/ghXT/IqYQjaAwvE7myfYikUraIQVkBoTqxC1WoLwd25DSjDrp1bY
	NpU6F5ZqwFhXiI4KhwVVyRuLSokyos+Eezh9ButWZ2HyPRtaMr7j6i6Siudi0+Vh
	+tzfWH2THZ81xKfaoazS3lI5CiE9MxOW0ZQkxR/3SzYNX0OWjazx94WwQzDKlvxe
	K5ZnAF9WcIIc6ovwt2nRX9a5ymQSC0LKaZfgm2S5CNvQ2H4wXKrmsr7SV08fQCdG
	hXlkp4qs76clZcaJueJn/1GMpTqbWOYYi2j0Q1l0ME6TRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydttbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:17:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4f946461so1256631185a.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 01:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789028265; x=1789633065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j5AEaRW4+Q+4g0E3CSuLIXhCYjcEmOyKhDjUtjMfI/o=;
        b=L0UwHL/D49jwbq5b3pNdQR6BGrr8+/5mbnAkafklr61jyAhdwtuuzfux8SsBc8YHwM
         aJlAO+kaN5NysW0ZAHdT55u5icEHPxh/XvfnOI4K2xNEKy8u5GrYnKWw3hk9RU8pOpni
         DeDXYTWVFuTPFUUv4bLbbIZoh+b41CDXSCN3XC7gQrDGc5tSK0A+4UqtbdtYWHwsLqxM
         YomlZ8F2Uglt02qtQnSHb3yf4WNEuV8VD7kQnmK67DX4UqkIio2rQC35cn0xTB6N16s+
         lMaQFeDIZsYWV3oEFL+WBC3HmJQAGjQVmxkS0BOsDfD8Bp5vmJEQ2ilT/Z6YPzQ53f0Q
         /PVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789028265; x=1789633065;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5AEaRW4+Q+4g0E3CSuLIXhCYjcEmOyKhDjUtjMfI/o=;
        b=l1GAxRz1Rptz7kmJJZhHSSCBEF7UW5aEnbys/kx3sneExKr9vHyXudKnJ/jz5BIq/S
         Pj3fM4HXy/bajjqR9cW7ArZQRbuHAwRbvDQ3YUQXoi3fuxyaFlj/UkW8v8Ulx3eLTFuG
         YxVPt3fCxgDdtXeKF3pIVyLWPOe2k/5gHfNW7f/J78q7iLGaa3Yjbr7txsfFuXbK5SWj
         Vimw63UvExeqXtOqlTl10zYVMpNu44A08OXrcKBMXT2CDmAd5X0zVO3ABEOmmepAVL9d
         AK0Na49sU51tc6Rl7A00lmLwewC/tkmdu6yVqE9rIOBO1g6aqeqEJZOu4unN3XnFJs/O
         N42w==
X-Forwarded-Encrypted: i=1; AKwUvBxaA46no2C/nXaa7fGTYJZ1CD8+tzWs22Vu3q3ho2YJUy1IHY9gW44/V9ug9acIjAxQvNbQ5pRKV7MK@vger.kernel.org
X-Gm-Message-State: AFuF++lj1euR6gLEN6RHa3RcSoCPKuk6eDMI8Sxa5hJmbVWZBvbSpIdW
	U8KsltQeLf/NRXtQBrIdr3erdU3V7msxg4+NW90t0MwuvpYcFzxUoIg3mMUMeURF8hL0xqtgX+k
	4sRJWe4/dYr3al+dJp7gK/nBR/JBgoXYfYPt+4oepTzko1BYvFbmAaB8+ChfkkgUwCNVuVr9w
X-Gm-Gg: AYBFou3P3pQlaSfGMnGQUVkyMK6nZokhxihuJbxZBPbbdbfnjKiyfHXpNhYkle/Nk0Q
	yqfT10iADZaEL6gD5+ndrgD9e8Yi7gmoVxbHgPfpEGgqxhnAl7TvqSCaf7Lyg/qLTqRwAn9bha0
	tt6thaHVNMhblP+C2WUt30GYO4xJBNLeW0YU0zYsjcrytH5OxUsLenAlTBiw0bWuh0QrtfZuOtw
	xC8au2KZCoeM6inc7gqmmCM43BW17/B/0CNht1sXcppSawMzZny/gJ0nvZC/anj/9MSop8PQQN8
	i3rAB4mvgqzg3f4Ou/BBfBgoc9Bi/Kw9HXpog+6qQ/hICsuQjYK3VtfLotPw/3OhARN0mserb8Z
	Nm/DiYnjohcqs
X-Received: by 2002:a05:620a:40c7:b0:939:57ca:7e08 with SMTP id af79cd13be357-939c939d179mr1371900885a.2.1789028265249;
        Thu, 10 Sep 2026 01:17:45 -0700 (PDT)
X-Received: by 2002:a05:620a:40c7:b0:939:57ca:7e08 with SMTP id af79cd13be357-939c939d179mr1371896185a.2.1789028264730;
        Thu, 10 Sep 2026 01:17:44 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm52018039f8f.4.2026.09.10.01.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:17:43 -0700 (PDT)
Date: Thu, 10 Sep 2026 11:17:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur-asus-zenbook-a16: Fix up the
 mic sample rate
Message-ID: <iavjnu7emwyxrw2ozzuwa4uvk74to3fwi4janpijkrpg4x6g3t@ftzeyvnok4d2>
References: <20260910-topic-zenbook_mic_sampling-v1-1-2532136d5a9b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-topic-zenbook_mic_sampling-v1-1-2532136d5a9b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa267aa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uZU3vtNHNVMDsrlGVi8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 001AfjxnUCagqgLIA3tQ5je2GqwfmMWq
X-Proofpoint-ORIG-GUID: 001AfjxnUCagqgLIA3tQ5je2GqwfmMWq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5MiBTYWx0ZWRfXzDDvXcXn1D/C
 3dpTSociaXi9zu1yKeTqjPE/AZTohjYfQfYPEC2ZKEmIhnULpiRHuMkTCcvnCQ5ntqas2yDkdr6
 UdrtEYeLpHlM+nPnqvh+cA/qoSmJnjg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5MiBTYWx0ZWRfX0jtkqLOdUON5
 1kEnzLgG0uGOhQExGONF3oW5u195SRKrFRqASZ0q4pR8iArSDVVzB2T32hCLwghTLUnzVYSoFMs
 niaVv7ZJE8uHFF3sVqm8af8kO67TkkKMCsMxNud2RKb4CtIFcQLoWKK0NGbMLvtM4XgUJ6byUPH
 MZk63aiT+DLnuDK3f/kYw+JYMfxV7RpoTCJYkbUbtkRMwC3MPoW7puvEePkvYRbwqm0YK+Tjm0B
 qMf0p5+MkStbIAeuTmuhwiZgZHFNO9SoYVmvgO3331Oq43///zGFXal/MFjQEXVpBXxTymU5XHQ
 acKfJ8L7cu3IOUNn9GyL3z8RXRwnEuvMHB2J8F5Ll7xMamWoJ+2TqBX118LfZGdnWUlBE7dOefJ
 2AF3DTL0HdEOd1YsQptstoppUk49SZs4yHTLVPWykS4LxQGpn10m3VWKCqBvxIfMZMMGwhm1W+j
 QBgGpQEn5qpG92rLmlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100092

On 26-09-10 10:15:42, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Set the correct value for the hardware, matching the readout from
> Windows during audio recording.
> 
> The microphone seems to work fine either way.
> 
> Fixes: e8fbbca94db7 ("arm64: dts: qcom: glymur: Add Asus Zenbook A16 (UX3607OA)")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
