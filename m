Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBF63CF201
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164227; cv=none; b=dHZX4+im1oNCFDkFPUyNP1CLq3s4VdTrjk6smp/htRkAvgWMr1oPgStXvkAhbEr4UgYPOz6MLREHmTaKclYBSH0rzHsTxhZRIrHzL3Yd2jZiBrXBDZOYEFhE4aIlQUUTN7qAbfIT6/EnJ6hXYsJcpReufBk/h4n9MXRYmzWnHxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164227; c=relaxed/simple;
	bh=WXjSjOxe3vtjSAPiOCN2Y3FCXm/CUp+X9sB7J8Z9MG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnHY7vllxlkBVJqAWCDg9ga9ML8x/ojSvN+2NQXdkcnCUg68oW2u0KaGqePUN1Ahmy90WfInY8lzqzMWY0gN4RSoUHgnx9hyChvgXfHe/HrfYgdUUtn7a3HJUqwAt4S8Q6h7bSkTRgi+MjKahYMZzyYWkBNyP4CjG5utTtUQheQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTD/9Sw8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ry+z5umb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTD/9Sw8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ry+z5umb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xHRC4081387
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W8UKaoXLjx4+ZXFYWlnQX6j9
	wxIaBVA5kfkRlMlNbpI=; b=JTD/9Sw8on2zFdHQU0ONFcw3jXFg2SkDf0QiG0VM
	dUetswLlQ+Yu6JhPERoPr5/Es4e8pMRkBDhclaTtftQ1yy56/cN6xNK7WpyVjA1g
	D/ocB2wQOihn7SltjbR0a4jtcFC1E0xukCzr7oawaq8FLG2Y8iq33YSI+W8hDaRE
	fLGmiqN2PMJ6JsZNY7CTdDeT3avj3/6QPL1v0fYAVMy4CnRsEMiRsKOsGPDSsDMB
	OCgfpSxlxDhi3+4yf/sMvMKSI5d1P5d7euviBHOcp5FZHPtQqBZgzxFPXc77K/D8
	8kJ9vbwUdjP25F/4ijOzrG2qi5McJa35K+71/fiB8JkHsw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h1n33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:17:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e52306621so416071585a.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 01:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164225; x=1788769025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W8UKaoXLjx4+ZXFYWlnQX6j9wxIaBVA5kfkRlMlNbpI=;
        b=Ry+z5umbQwA+F/y+ESZEAbgO/GXnHELbX8MD298tSjqIziWmE8suZYxDcSd+/7iGGs
         0P0VG77nOLiFJ21gLUcot0JmZLcAvpr4HVBTRt2TfAAMVJALZdqGibMM85kMrs9/3mO7
         aN5XAm28DsogptnPaD8UXcdW+QmlAf6M4i9RdnkvmGBjO/AsG5h/HgA9E0iWHQCIhKh8
         Ywmndq7kMkR4su/a6IIm6XzMzx8e9xVVW+Yz4/lBKebPNBGvXj/lMmrJEFlvhaAqaVHa
         /E0Qj7o2DCdIIfx9ZVR/rg3bz/3vjPc48ol/4E9I34NP3oVSNBu073/JHZjH1EqDAczd
         AHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164225; x=1788769025;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8UKaoXLjx4+ZXFYWlnQX6j9wxIaBVA5kfkRlMlNbpI=;
        b=slZe6OsUxpABaBbwnRbixbEkCBF2yNFIscYA+6FaQegBvxUTBBDCljDKZAInnpsuXp
         YcgESrCl1b8vVsulzXoIC8uhY3oNoCMVbfTRK2aU1xkwidWuGWonZlt1Uqal6YQmrnzc
         Zzcz//oWl73UBMqDY557tbMPcq/YKCtObu1KXhZt+d6deDfL3H3gX300WrSdURT7Ffmn
         b0PGlzYGGMEuLXHAn4acqgJ/BG9o78TBQMBIPMBvU+LXWdNkP0QULJQNj2dbE7QKBqmV
         Y0m9kMvwXTwclZf6q25zai3GxaBF9NfHn+qRNYqik910LFzYPEpESW80Xeo3iVL3eb0l
         0pbw==
X-Forwarded-Encrypted: i=1; AHgh+RoNU8L5uliURNTPvs3f2k39zwpE6sULZRKqTTrYN+NCwviuBNJGVnbvNIsPAopgJFt5/dtaiuSwJroz@vger.kernel.org
X-Gm-Message-State: AFuF++knMUUU1SAUeSWuA5b15nLnYWce8HISIbWyX0IwKNZ9cWK6h6Om
	0qKw34RkpfGzo9CMqOkd82QiUfpfYj+rdmKIkb7Jp/tdkdIMXFuP6HXKXStpFIuGtPVnpAeKT4I
	t2UHp6yTlrBBAiv7NgbndjWQGwhJoEx6ZSZGUaBMj58on32aLbop/mLJgn8WtH2ET
X-Gm-Gg: AR+sD10GwmtvMyPiACwzJhOg3Dkw0AbaSQyINgnuRMWO7L72zSJ98EJkkd74Ji0PA7Y
	CgIVNEWkB+TWgVeOZld5MQUTAt4QIX01Ox0ze6QHoHn1+jeCfJ87LNnGbKE3D1wjy/BXcliXoLZ
	0vo1WiwW4/l42lFopNrpu20FqVKhEkkS8E80tbBfSeE8UxOBcwihFouyBeKRX3wYza+g88iG3ba
	cZJwh2APj4ZLT0UQJ2deR71hk7OLk1SVhtSmnsMA6/t5i1fGyAQ5b1nBRtxQ9nqO+MeQ2Xuqwtc
	rv8INxiQ567pYMmxZ/EBsAGoQpY7eGDDYV1VII4RKkwVujIxtqHmNJduYj+HBa1tOWgac8a60Nd
	3Sl81dppXXVt6qA==
X-Received: by 2002:a05:620a:4691:b0:92e:cf8e:67b9 with SMTP id af79cd13be357-939138d817amr2706638585a.21.1788164224578;
        Mon, 31 Aug 2026 01:17:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4691:b0:92e:cf8e:67b9 with SMTP id af79cd13be357-939138d817amr2706633485a.21.1788164223956;
        Mon, 31 Aug 2026 01:17:03 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c7cfsm291111315e9.11.2026.08.31.01.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:17:03 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:17:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Message-ID: <ywkrf4rui35u3fuqzxmuyocskwrf7w62lcgnhbxcjch34vsvww@olvgcxp3yaa4>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831032103.341633-3-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a953881 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1Jmwf9m3hYnSCzCNOYgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX4o0tfcj5ySdm
 jJOOglhk+cVrTrwUb0OdX+ef7z6C8jR3MNGlwaapx9hacfw6UAin9QHfQMiYnmJvOJigMfSzbKZ
 nbRxd4p41jZDn8+ght65ozplh6f0+eU8i7bQoLByc7On0+2I2dXyZfQYue4ERm5viB2AV2saT8n
 N1sQAOmEEveDu+aErrPuSRFhJG6mDFpd2knd8nWEqf2DvN9Xd6yeLQ6aDMtPUudM3RXuN2/BlHn
 fq2yecLavOF3ZEezDJK9w/b7l5Fan4xBh3QgXXxMYGozGNql951bUtL56XzVaMfu0gnTUiCMb6J
 0MYR63Zl4wd11p4jELlEBslMzp0ZVYv8Vln5RjlVShBA1no5VXtxCIKc4XBvW2AyTtOVub5+0o2
 yyFbijaTVo8lDhhb/oAqsksHuTlEh4CVyhxzvihFgyl2I4WqpVnOKyh7PDZTDc0yAo0+o/P9f66
 86Vzdesxp5iMAkImKUw==
X-Proofpoint-ORIG-GUID: nyKtzAvNRnZ93FoucrVCd4LFi-AoJqG9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX0/co+uUadFx3
 NOgF4BjXe6SrcgFdFjkxFU+Qre//EXttCaIYTeHiqC5bxi2BBHiNlZ3hbjRSIocfGNRmdzQMnCO
 pK894843XBwdXxGICF86wZ5RdBauqzI=
X-Proofpoint-GUID: nyKtzAvNRnZ93FoucrVCd4LFi-AoJqG9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

On 26-08-31 11:20:59, Shawn Guo wrote:
> Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
