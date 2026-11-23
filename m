Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439188;
	b=Pp4ES5XSYONUQRGz8qiDmkvkAyE5XIgoSAgN7A9Cq/gqCP5Fo+9J1H5PZPxzKUO7992z
	 JxE6w6enfZvpY4zxehG66HqxLEPa1Q/XgyCO16iiZ0C1Zrflh1+xjJW6kY8wd1Injcb8A
	 dGdhbI1efLVkEvzpB1783+jJwoqg/DoeG7BSUlpr5ov0rsy8O7M7bB5FihJK/+zyJnrn7
	 w2BmfhLW6yOudrHpP3d1UMGXj9Nbw9GIDnVKrc/xIzWsfpAMezzgnsctVqmgPkFfx3gT3
	 kpLCSCFvdWbWLovEmGX+Z+heI7uSnyKipAnuPkdpZqryXiRe6YxN+2jx7RLY3208GHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439188;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CYvomfEjy39LuVTvYKKSBWmOSbB1CxQU1hTSsCOWzQI=;
	b=KB3Yr3hMHUf68wac+jy/VPr4grVPR914l+oi/us/J1+2MxgkG0XA+/UJ2Zz8HBx8RWQp
	 CR7t912223Zgd41ViurbxgEvG4l4FulwiNIP9VNtD77PwLq/WmJ3zPlJqQl10N91vQFCK
	 Unn+NGP3CeET+zCGUHFD8bnAvZMSaGqkEg9Hi7AX9bOpuQPaB2DY8vcVjTP6XFg/c76CT
	 Q+JZcJJqUEg9iqBChhNakEQRNXtQWFeF8f73ZvgruE5oT5QnpD6SnC9jG/jGHkGZSWVP4
	 jARz/k7I+qVMSdkyerfFsOyFqzjfjqBdtUUAc0whf3ZGlhND7uV6ERnVOYvqy6M1f6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mEIydQaC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I6XzR0nP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64829606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64829606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mEIydQaC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I6XzR0nP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANCFvjp3186040
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CYvomfEjy39LuVTvYKKSBWmO
	SbB1CxQU1hTSsCOWzQI=; b=mEIydQaCn0XOeUq26SvZH5rXZXsBnUtA86crINI3
	snB9cfnqZz4RfgGxGYq4Poscsyax+YyNHO5xdFGxn32s6EuXjwXX3Pd4298x9SRe
	ZvYiubIY4v+ozxCjCri5iJXj855ctOQJiNsspG+Z7Ir+U7ZeP6fn3c8oDaE2Zkp0
	rTDLlVzIFjHnEXtrKIj2E7200CXRM75WKB0cUaDl77xGecAysds7yOJfybEdl5P0
	X/p86r1LgtOjOVowX5l+S3VEUnI5FiedS9sKi+ScUyl92/bEsyORYUzzavHjkWL+
	UnhZD+SzRSRiLTP3VOmpXO0wY3svAF6k6U8u3c9283T+Bg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd1g02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:06:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso4654808eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795439186; x=1796043986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CYvomfEjy39LuVTvYKKSBWmOSbB1CxQU1hTSsCOWzQI=;
        b=I6XzR0nP8Wvn+QBoOYKjqtSj1mbkb1jTdnF+/ukuIz5rCVQxKGSaFN4lJOANWAYR3/
         eRU8qfozUtc6UeY3oNwEni2VOdLz18b0RQX4B9bhBMq0O07qJLZyQIqy9qg1PS8G0HiB
         +fHfXTHlmsRsCixXTeH2D99nRfEVhTop210guW2Z+6plUmJHZ/NwEMXohRa7stUjMThC
         hrYOaa+49s2mQEQR39F+rPlh1bw1/E0rlZBjpQg7c5GXk8GFO6b21/uyIEJLQMQXNQ2I
         Qw+D9w3NbqDN/toztQwhmpaZCJwocY3u9hqRyWG79q/fcnxd/PylfcOKttCpThjCA/5z
         cGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439186; x=1796043986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYvomfEjy39LuVTvYKKSBWmOSbB1CxQU1hTSsCOWzQI=;
        b=gOHrDTJ6rycWKF2aWHh+H+oUTGowA3LboTG0otc5Gi/kuO9ijVNz6eFQa5Fdxanujb
         ZWI4RxjjZ/rcQ/CjjaS5zjuRwfrXAhWp9LnRBJOEYCNlES7C6ORNFonJWJDMJiC3TnYd
         juZ05wubrwBi0ccNJBhipQ1kJFHOHhufvg+/6KvQ4Tcah1dcxnzgRn2NIq06+lheb/2t
         n8Iclg9S1qBKVvgU00dbTQVs6Ulhwlu3IGo28wVWeyGLaaHxfVywms8dSSXQAiEGwGac
         BcrZRIdxo1Q2Z8Zqu8PkBHDQD5TlzaKlvKipXtgs3QARvXl2jjz4WSIQqmJi71efqFTL
         /tzw==
X-Forwarded-Encrypted: i=1; AL+hErEjdgRgKQ2G2YsdUWxLENwogyEvI/Q3Y/GtdfwjcBKRuGd2fy+2pTxetwNloLKoshZ7Ro1UxcbCK1W8@vger.kernel.org
X-Gm-Message-State: APuU4Z/NVp+AH1My52r3tqsNyUaMFmjmbta+H8TaCk3DtO5vQTO0jjPm
	MOUsJ5C2GdzUaIQpBRoVJ6ChCR8Vwbpg+KoWVsZ2m4xI9U/8KUEcpz1mNuHxThTCruLJXjdCkfp
	WfNO1flvTHChSKU9tNDMyyByFtJ6J5NaTd3Ob7sshjKK0v5C45cCXeSChTeY6dnLP
X-Gm-Gg: AZFdTZe7QtEh1KvqubPjXFOQFJVeMRFu2mDK0v+300GO1Ah995Kl8e/qJum4t3aq1i9
	fKIzx0xlvsrdwxTvM6AciSMOT1IHd1+FwouteJOJzx1FPCAk6QtNlpm/0w/HdgnchAfhDogXYW2
	MjxTHIpNmfvcyyThASFoqTFVA5WvPtJ9V6D2RkXo3W6pM/LpJN6k5DpXlRtG6FOXVrFFoVB6vDa
	f9340pPkQLIYsB8E/g91suSnN/nneYgpRC7nbvcMGqJRyAKzD6UqVgo/CKcQ6A9c6+vg7uC5QUM
	Ac+EUSZ6H7BIUikd9iNax2Ifz2gxbKrz0sWG5sx6lUB2aS8D4jQ7dkiQdkemhVHC4/AI68mrc3R
	1YE96+SIvyuNjW4V/m17oXUyO6z8kiTyuxCLHOM3F0F0zykXB4V1tWpMh3spQPH3ZeDh0c+6Zqy
	Kaj/d0EnnRvfgmVa4=
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id 5a478bee46e88-3857181d8ddmr11689001eec.41.1795439185700;
        Mon, 23 Nov 2026 05:06:25 -0800 (PST)
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id 5a478bee46e88-3857181d8ddmr11688972eec.41.1795439185184;
        Mon, 23 Nov 2026 05:06:25 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm37649809eec.12.2026.11.23.05.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:06:24 -0800 (PST)
Date: Mon, 23 Nov 2026 21:06:17 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/2] soc: qcom: socinfo: Drop DT bindings with IDs
Message-ID: <awQ6SS1GVPz-QUYb@QCOM-aGQu4IUr3Y>
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
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
In-Reply-To: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wbdtt9OIgk_UoVbEePLYVe4RHPSuFDpP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MiBTYWx0ZWRfX9lQya5b2q9Ne
 zNb4iYgM+Y3AtaALmFaZ/qkgO5UoNlbCA5Gm7cMDGDWFR4klRzcxq0BWEp4rh1Lu1td6H8ilpXs
 4lKQywWW4y2Qe9LfJv20Su8bNnmOltziUZrlrppQbm1WNwK2d1HuOQmfRokkF3cj12h6Egj4Xa5
 zARD9Vb4mJbPk3jorwxGWg41PoqC2APJ2QPWS9Rqi9o4iY3NS3SBrY/HgTZX6WpsZeh77nnIj40
 gpqEN4mpUO2daOg/0y+unpVA9I8TBbrOBHKjuetzu29PqfZ1Ur6R5FbZRJX0RwnuLIT+d1NmiAF
 rqFEoOw9/ygEhRZGx4BqwTW/eAclo7wVF1/ogCBlI2pxufIS9ANj7hTTpyic7OhoOHG2M4LajKQ
 05y3PXqdpBr5SHEN1xz1hqx975ohZ960s6DzrIi2yEeD4Pg79hI3/OFU1GBzXD8jHITSydY+Q40
 njX3NDGOaWli6mUbF4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MiBTYWx0ZWRfX6TeqFIu9GkEX
 tJNxkberP3Yqr0L8xwx7ElO2N1Z8zqFDwRp50kj9S4QUYRFG5OfOgnsc6KIpikeuoe9earMIOus
 GKLkHWq5ZS6MkCJbLrgci9Boom10G74=
X-Proofpoint-GUID: wbdtt9OIgk_UoVbEePLYVe4RHPSuFDpP
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b043a52 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xlrlT0MJ9oWSHFZ2GFAA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230052

On Sun, Nov 22, 2026 at 06:46:19PM +0100, Krzysztof Kozlowski wrote:
> It turns out that people add SoC IDs as Devicetree bindings, thus ABI,
> and then want to change them, for example because whatever
> renaming/marketing happened.  Well, that makes little sense - either
> this is ABI and cannot be changed, or is not an ABI and can be changed.

I like this cleanup. Keeping ABI as necessary as possible makes sense to
me.

Shawn

> 
> https://lore.kernel.org/all/9eda2209-d64a-4a1c-915d-4415ac47df45@kernel.org/
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (2):
>       soc: qcom: socinfo: Copy new SoC IDs from bindings
>       dt-bindings: qcom: qcom,ids: Remove unneeded ID constants
> 
>  drivers/clk/qcom/apss-ipq6018.c      |  2 +-
>  drivers/cpufreq/qcom-cpufreq-nvmem.c |  1 +
>  include/dt-bindings/arm/qcom,ids.h   | 93 +----------------------------------
>  include/linux/soc/qcom/socinfo.h     | 94 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 97 insertions(+), 93 deletions(-)
> ---
> base-commit: 74ceacafec02465d922ad68dce9498c8f50e5f5d
> change-id: 20261122-qcom-socinfo-id-dt-bindings-e6fe815b4480
> 
> Best regards,
> --  
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> 
