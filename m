Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228395;
	b=AbGttaOBSesMmFYSANGZcx6mFtveYcqg+qkQYO3MbG8HDKlZAmc6pbGZ8B4pSD/gdf6w
	 HSkqC1V0t4dPhdv3tUQnTWVKmnNmcbu9p5roD8ETlB26buZegMgTcQAzLKormUg5H0wrG
	 dhVpcOIc5ikh2wkCh/P6NgHFWI7XdqRg43micE70LjHaYB/QfdcoTs+cqeiEig42QkeFf
	 NfLVoOYXYlZhKwqn9VBAboklW0d/pjjVphm5sqXRdX6Z2aJKdczsBITQ4SKldIPs/+0Gm
	 r2A0ZvR3T7M6CQ/9UHkYEdH6Vs5VNcSZrbqPu8md/XLJs9JLwYnha8uzQfO59uI0nzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y2DrjEQhS2plkSy9Rd6l6RNyJAVrhDy3SRTeWurwWbA=;
	b=I6fVq2U/dJbNTVBffLfs3qEiN3V5QJ5nSb/DYBsLE0g4wSFCFCFv0RK/2jytCsQ9BoDq
	 Gl+2DyiT4YMSIb/EWI/mGJDFIOJ47Utmg/xpCzXJPL5UgyaPx4ouuuMcEPHX8L+r95zFf
	 iIfnMXJBO6Z1aVzWH2v27WEbs0p3fkRPHi0hrDNc10VRly4zJ+VqkLQr+Sy53qNC2u55i
	 umSETXeyDiRdM5Y9gGkyHDU2XOQILCe9vYnJGZZmTqXX+/FdqMgVYItXA2Kw9uTAgrfXa
	 wj2TKN31mhlgxoJa7m4U7EebqXy0LB602pXbl/WHMPitfnNP59yupdJUkZajVoa8RLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RomvDkRx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyCacWf6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1F2606A33B
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 12:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA1F2606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RomvDkRx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyCacWf6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9CEQZn1193226
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 12:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y2DrjEQhS2plkSy9Rd6l6RNy
	JAVrhDy3SRTeWurwWbA=; b=RomvDkRx5seqh3RBtVKxeSElUiTNUWGZRFrSS3EK
	YoOV3nhMHX6VByKAcP3tIYHQanrVkWHqOd6VvTuZIC9ypoApv5IuoZaYDOrOiM5a
	MVcF4O8d26Jx5um7DR5RzHKpdkbZzm8vSB/ocSUajzALuUxmKTtTTxbivPKwFBb/
	R/W5R1YAOMNNbENJuWBmNCums9L4H3IwLTJr7f2VMfWaUv4rHMCIQhTWcbLKgYhS
	FOQ6GJDPv7ZWj7Kv+Cb9JA5hbo6wdwS5aehNeQE2VBg7SVqDDFtoi+Lm23/ojvgG
	Kz+rzV6gMGdDr35CaFXafAPShlWb/I+0oGT9uLoUmVsh5Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qr3bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 12:46:34 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc450e6dc2so819633137.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 04:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228393; x=1794833193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2DrjEQhS2plkSy9Rd6l6RNyJAVrhDy3SRTeWurwWbA=;
        b=jyCacWf6sPhjmyJzdPBLDaxJZ/q2Ae4rKzLj4KSmyzJKNP9H5ASsmF3VcFONHFb5bx
         EkSBc+4tJ+8zjqCIe8aNeNWRTtVU3yuC0CFOb0kVnmRwbEVtZ7iOTY3Jec2VzLlcAm+H
         UxmkQPqoeMWB5/WhDTWWSECqoe/MzXZp1LdTab+ceaVcnTsMlWSstIpg/ZjK/WPbiLn0
         uag51yU5WKaF7K4pADG7fFOo7i7BeNbiN1J6f4MvDx9WdgKDdQUf/gpNGk9BBsPKLLhW
         VFqEjmLFJjasBLv3ADz4veA3lxueroTrHeRHQwoA4vJhvF6o/i+fGr8dAKIhLN3wYR5p
         midA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228393; x=1794833193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2DrjEQhS2plkSy9Rd6l6RNyJAVrhDy3SRTeWurwWbA=;
        b=0/syhdD1qdBT5SXDfUG6H4jAyFWVStUVXMtfGHZNxssuPJwdJHB72MU0WQTapnZXwC
         OeS4+S6YA/YcE6xSSe25khjJovKr7lzIl0jyvqNi7FqK6LWfnZkkKRJvVnVVa3jgB8Nl
         rC2gDWfEUEp+mJX3qzq7sjq90emI8prRRqMqKvUVEf2MHMOju+7HFRnPQoN2RfEWECPq
         POLBToQSkhmRIDachg4LavUZIPQZxoZw1tcib6N1+sQvbS+wzIY7LQ05fSTGNhrGxerH
         MBXaLsUqXfuye2a95i0ixYESvTy7VkSqB/M1EtAAPfz0aOsX1I4CIX8w4CQ2So56LL7o
         mE3w==
X-Forwarded-Encrypted: i=1; AL+hErF/zFBwwuL1RaBLHNyb68YkQFcRfPfCl3IbXR+A0SfZQemy95e6o5+HThhCj8YCxDY58wnlGt/Zat8G@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y053bJhLkPb568DcmoqHI+obTAMlzY0L5FYM/j3n/7MsHFVs4
	rG/pd8r06pLb2sBcmoGCcZUoa6d3pfGv/s6cQzj4N67EHGS/l3VJk2K1NHCcp69LTDLzcgEgzTO
	Q3UAftM/YQzWeP4rVRYB49TDqgEejf5chovs+8rzuZy+Hvy9KBdEMveLlHnf2gyBR
X-Gm-Gg: AYBFou0BLdF1DaDAaOFhLg4bMJV2JIu0n7TRHQb1n2cGcx3GnInKAWVImZAZtPd3dKT
	IKoigQ7b6R4jKxTain8N+7dEVGpYn8ijWdRfGiq78Sb051zS7Vcf3Ex4/zZ7YK93zTQqXpLJoMr
	oUDY1vVVmyuzK6ucrKi6Fi+vxId781LHf81CEGzrHBHHVcJbgyoJMeRouZitZOkftCoCNP970Lk
	j7O64jScffwIAvYf/gqkt9kPeJp0REqpvTu+PGvnjOwY++WzXZ9TcavJ17PUl7OoYpLjo2P3sG7
	JXC603vC31i/Fgya6OpOfXMyRlXuus3rTD5YEUMVIfh+Ygb52ZylZRa3072a4ZmgYrRAYVYxyHt
	ZEN1yPAC9WnhtNGJJbckZk8Y2Ti3t6eStrGl7PddTE+TN1AkUGrW5J2xqDjqjt2c=
X-Received: by 2002:a05:6102:83d9:b0:7d2:8dd0:2ed with SMTP id ada2fe7eead31-7d2daf1bf52mr1009727137.10.1794228392939;
        Mon, 09 Nov 2026 04:46:32 -0800 (PST)
X-Received: by 2002:a05:6102:83d9:b0:7d2:8dd0:2ed with SMTP id ada2fe7eead31-7d2daf1bf52mr1009708137.10.1794228392284;
        Mon, 09 Nov 2026 04:46:32 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597e0097dsm9855429f8f.57.2026.11.09.04.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:46:31 -0800 (PST)
Date: Mon, 9 Nov 2026 14:46:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 08/10] arm64: dts: qcom: sdm845-samsung-starqltechn:
 Update panel compatible
Message-ID: <lr67aes7lfunacwf64sorfvuqgqshsmsg72kwebwq7ol5rt7q3@b6vmojxbaobs>
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
 <20261108-crosshatch-panel-v3-8-87dd4ec4f7cc@ixit.cz>
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
In-Reply-To: <20261108-crosshatch-panel-v3-8-87dd4ec4f7cc@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX9vT7B2PEVf9C
 NDYx0hpoDzVgLy6WzR1l+C1bEW0XI8IZ/Q+0LQweqcsKqjypXYR6xD9zxir536pQLLFnv/2A1d0
 zPmrZK+4m7+afJ4j9m4Qv8S1f+HD4GOdfTJ5tXJM37hiTOhqAgLBB1Z3LgMjhA4OzDtc3yk/VIv
 DTIuR0nKpQ8LchURHOjltVEUqurNCaBg4OJszwxxQatrbUiWYMYNkB0hfQ4HuVD3VnXD2/bRhkM
 p7hxYUfM6lQ2paOjLc6NB1/8kLJ/AX4Kwj+JJB7bWbj3Gz2jowQxhToga4LmHYmIKJwQki/mSmE
 a7kkSpQiuyUY17WO2u5/z2NlF+nSjToK7W4pFSpVutyT2XZyBuesdm9SeBm+ZQOOtCobPfPRSFs
 Nu7pWIBFF4Xh1D7DNbfoIyLCJHWibM8zAWlF/MW/Ca4vNMj12wf/0A1vz/ARac2iAV47cKxFo5O
 +RPoI3u1pXeh12BJhFQ==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af1c0aa cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=aFgLPouUvLL-lAFSJXcA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: AakR4UyG0LhG5pSk6sFtgOZcYPl8COkA
X-Proofpoint-ORIG-GUID: AakR4UyG0LhG5pSk6sFtgOZcYPl8COkA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX2YOzUp2z0OsD
 duQ2vg9mXijCw5jpIzXNrVwuQuSiUPTrBtGhAbdzVKcUq2/+fQf8u4uf9dwHHWZUo824KepfVf4
 jPITFmNw1GysgMyqZol8QxRXgMzYxhI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090050

On 26-11-08 12:32:29, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Original compatible describing only the DDIC used, but omit describing
> the panel used (Samsung AMB577PX01), which we have no way to detect.
> 
> New compatible allows without breaking ABI fixing the inverted reset.
> 
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
