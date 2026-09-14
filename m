Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5233750CC
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371643; cv=none; b=dAFquD7ngmxIVURYyFDXnPbVfSjPf/9ejl2YIGC8UVqx9h1b+kJG+bnWGXj5ctA10O+tyTrFoGxavZSDg/Yj68lZSp1Oi4ahPVS6yaIND+MfQl+igCG4sYePpquvc+SFAjp+5Vuv+YsPTdOV5WiPpHIUiv1POuftbonfC5e8Hhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371643; c=relaxed/simple;
	bh=7D1WrDaOXw3jEwbtz6iaTiJ0Ik7U81oE17WafVAW2yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wo18Cv+P+0sIye4JhRzAWUij/Qp8875PXpP0PH9Nk5MGDfOGvC/iVRaD/MXsVAC1Ohlby5m9riHg2imUlSak5hYfZZ/YjNETI8FLbOkjvnpzDZ3qPuLtXPTZqWGeSMw8kLP+V+OQV1AUOAvKi0xvBlI+Wcqy2JMzt2vop+8wZNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBdy/+Q/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gCKjCWxn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBdy/+Q/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gCKjCWxn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5imLQ793401
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+MmYma9ipaJNApTwltViswWE
	v0iN2F3QjUMkSNVw71w=; b=WBdy/+Q/q0vdN9eewwBB5t9+2NZ37YLDTW5vL+fG
	pRODQtAmweFTGF2QIHVYwSJBRUu6gH+rnmLteHJbOsHmQNNbP7UtXFlhgYloXSZA
	4RNnihwXWLzlcpALjb39GZNuiHSnXyqZepB+5qwZZKURCN74ppNVbQyiuPuQSGsP
	gOJKQFSOA2fpS5GSrXahymmFnYvvRbiU1NbJB/7xf7f47h3S+3Y5BfVfp2Gt4PNg
	sBQLzx0hlsQpWzAhVLovKXr94rimfjUvmt0b8yLOmCHYEUK6xID+dGWTulBOEWOa
	lTXE03Q3HTeAlhgfhOpNOig79r1CN/DuyBYd6OxoeVTzxA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnhey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:40:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9393ac4961fso328933485a.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371641; x=1789976441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+MmYma9ipaJNApTwltViswWEv0iN2F3QjUMkSNVw71w=;
        b=gCKjCWxnaS9T14EW1slsHh8fxas1IeZKbY4Mn8ukAbsS2LaeX6jq2shpRJf5Ip7wnl
         +AREHrHJRq3D0GChqWsQLi8QPKhmCUlc2zciang15UlGTaaiPe8VZlcX+gMKs47OTpBm
         HpWThtK3lr+bAtNYkRXL29udHkjssjzCyWmOGtv0L0BxcBj6YVsjVySupsDSA9LSKYWe
         VxVmKE9sAYlmVYbugoQpU7zCHPkmYBpObMVGZZOFkfMp7U6Fo4PJobZIKF7V4RBX5vho
         0izavl4uqBkAd+2f2wOJ4shRcQaawhmUIaZgtI1I0wsUbSbqYI+UTH0KTwe+kYAmfUqi
         jJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371641; x=1789976441;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MmYma9ipaJNApTwltViswWEv0iN2F3QjUMkSNVw71w=;
        b=VKWPUztiaNbmrJnKh8chrXPQt57MHjVHInHmvk4jA5Pa3o16Ov10I4tUBvkB3jJGHs
         vzyJL25bBz50yFGmSl47wa3/NZwFVmOtIYpKwi+QUOnm1FotiF4Pg8S4YpXyv/FSoN5S
         7q4bhG0Gtr5ed7zkc8G8lfjZFzPVqGDeRfKbrrKTuSk7XodzPV3KgMWJS1ANFvAsPMwy
         QHtT1ZsZf3qUlMVxNbrAp3rEJY1+w3BIGCJKNrIfRsO6bQIxdLAc4JF5y3K+5qjEvtoC
         tE6USsIpTfvug/e/Oqh+4oNSPj1wXCcoAva5DnREyJjORmubdL16+Uq18w5lQzkKL8tM
         hhKw==
X-Forwarded-Encrypted: i=1; AKwUvBzarzaTmM6wRsQ60eq7jZwqKLzUkoQMpt1CYDoydDTTbAb8F1e9D0LA2T6PHU3hC73G7CR5TqGTyXWa@vger.kernel.org
X-Gm-Message-State: AFuF++kuDAgSjmx8E5HQxtTIIdSsU/8+Ui4RrjV/hOTpQIRSnoFbanPp
	3ScI6dH3SHlefr4oI2zKDk1/Esc7vz6t1cQz87PtyLrvGXKuEpX7aetkdddhRGvSVCBaRlzYo5h
	bYyWqva9DcEBBAzM430RoaDjZ9OxEnajVBqiY+NpkLtqQIJTL3214xelEkutZe2NF
X-Gm-Gg: AYBFou1CHp70Eu5a4J3bliCRoV/DwVYXEIKrl2T949TWRZ5URwyhsgyNGQNM1JJWNzJ
	u6ibFVRrjiz7RcEQLIc8axT96XHQTjDTqGbe+Jyk0HiCxL+614XoS5kWL0Zpuoy68YOpVbhOCjL
	7JKGZzaFclE3DX+WwFXya8B98h0hyXF5jXjO39NwpI/ErkBQQPL1YBCQawf6yhP8oLJXYNRbt+A
	O8d4+2umeQ9i05lYosufrmz7EKLDwkj0XIxynCiNrPtlJOb4q+PlYpQr0DdELas7kryuhIcnb2s
	hv0bIYAx0mrKpJP7QdQgVy2nD9jit+5u4TQSdnCFEjYWxqRIbt52k/DNTSYeprCkpPXB4ZAe6bt
	nya/gcUqM8QW+bA==
X-Received: by 2002:a05:620a:6018:b0:939:6df9:f991 with SMTP id af79cd13be357-93a29c360e7mr165579485a.52.1789371640680;
        Mon, 14 Sep 2026 00:40:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:6df9:f991 with SMTP id af79cd13be357-93a29c360e7mr165545685a.52.1789371635437;
        Mon, 14 Sep 2026 00:40:35 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34f353sm23982368f8f.26.2026.09.14.00.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:40:34 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:40:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 19/31] arm64: dts: qcom: eliza: Add domain idle state
 names
Message-ID: <h3grscehc53f3rvw73jbvnpwbc2m6fhr7xqrexsrrd3t7yphpu@vq6gu73yqiom>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-19-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-19-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX2qC0JjTXDrC7
 JChP0pzyLdxqeIPwocWoXWpzsj2CBIM6UHQagfYCCFj+2MuYfAPLGLjYhPS7K0EV3pTY1n+2OIn
 eqd9Y4BCy8vIuJk6aYyfTZiOTGcSorfR0P5eXoxDfaRbRqx3nNK7RTpm3L2mplclNVcbCI8oHx5
 dEg5bqBIny+QhmQwuqmT1FDd8v5guEChOzksWeu2mBa3LGDecUzYtMC1iNhvcYrQM9W5ByV0Dfg
 DPs2VMmggOFhMPGHuuQ95dlmMGbRH/Cn1RYCIfZrfDmtEeKyf+gOM5C4DQ6BqoYko9XVv6mkRTq
 pMlxBIIFIPtNQsXIaQczihC780qwG/K7aMvWIUd+7Yok/yn5+AeMjLfP2ail4lCMyPKnN3Ch4JZ
 VWtAT0UqpjxKLTHXX6h7qMRqLLYJtvr+n+KoUGZKGIFJ8rm4I7+pRZauxb8Ez6LklTvo0Mk6+Of
 SqnInkvafotdGz200wA==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa7a4f9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX1KnY/thTmzLq
 AMAnKzjyrsZg0ljlVY9ZAOPi0HnlkvKEwV/UsqFAyhzpR5SMxDfkY/KeTViB2EhIuf2c2TLkGaS
 /Z0tsGhPJEU8wxQ22CfQYeeyCVBdF5s=
X-Proofpoint-GUID: KdpvSPrR2A7D3MUD6XbkTn_kAti2pg20
X-Proofpoint-ORIG-GUID: KdpvSPrR2A7D3MUD6XbkTn_kAti2pg20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:51, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
