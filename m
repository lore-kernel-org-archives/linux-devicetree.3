Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573743;
	b=HGg8U/U1YiEFcneUJ1D7gI23lE4sKoxrRmwmJ5pWr3oSPDIvdOnHiJx5+YWbJ0Z/dPln
	 okS8V5k6JvepT1CCWUyZp+UzFgWSGSTY9UAAr8jPPNxSs7+VVylQgq+fd0lGZhc7Ob62b
	 aU/wYt0yEFNy+Bes5lXyqEPLiiM5HNdi0+f/tRt0MUAfkEyLVppC9oAhE7r+yhk1+4bwS
	 ioiG9u9LmVAvSyhnLbjy7lkkmMhUR0s/gCIGlG/rf0tr7Er0v5mWNaFKhfJxDubjec2ra
	 smAcIum7LrHbJrqyo2C5LScCKBSFfs5PVIQnvf5aHWQrb0nZtP9E8qaa09fH0OGLrDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573743;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GsnIM0p86hANMXW1GOBgAJw+27kK75Ae0x3nGj5okmI=;
	b=XpMqjWC/XVMeZUBrBY6c8YM7nleDT54e/FNVZn1blPw7ZZ/bvNxnYIZG3Y/3xQNPaa5T
	 gNeQMUA2cwDIRwv5fkTrWwGQs5f/1VOt3ZQkRKe2VJTSCqo7SB6JidEFv2LMJI/uCGnG0
	 tl9/XXIJDa7ttM3rPjU/SH/sEZ+kKkMTlO1sJEGFD8Vxy2Dy0+Dql9yB75EKxFCCNZUWq
	 r6L9SJob0bEKybVaRHjs9Kk/V6MwfdtGCehZyYHxLduIkcrnHu2sadQL40BFpk/8ZIGXW
	 oJwY7nX5/nmpVmttnQZ8DxzNLhxykFb626bFSxediJNfSR5J1OzJHp0OaD+Ms7Sedjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=niKGOsSB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aY6a7838;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC575606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC575606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=niKGOsSB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aY6a7838
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5iwpq164993
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GsnIM0p86hANMXW1GOBgAJw+
	27kK75Ae0x3nGj5okmI=; b=niKGOsSBO1/UkOJ8NdqAATH1RX9CpEKMnBQjtTg4
	WrlzWfxhOyHp11Fy1d9Q4572BZX152ZqdsJTj/TcVaQiCs7Pii9dOjP06XeAvLDo
	PA3u2gqR+sS8Cu/QLwA96oy45BUzA1qUOGECjbYekAcgr01SleVzCu5uEYDXLTzO
	GdCz3ztGZPem7GD+p47Wt1/YHpdKO024LVN70C32iZ/rNNEldBlJGVE/7RbJL8oR
	C2n3niXIUd5Km0pI+imPcnQzfgtzpuIH9KrgUagHjar2InYnsh4O8Cx0+4zkeqeP
	qIlBCh88vdSlVEgUkn1V1uLbma2EoP9aYvLWIwVQrAlnJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02ct1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:09:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so115150585a.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573741; x=1793178541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GsnIM0p86hANMXW1GOBgAJw+27kK75Ae0x3nGj5okmI=;
        b=aY6a7838NIJMzyJT7nb8YWgyLwrTnpIi3dN4nvaAv+gjSkme7A0PByQeaf7AoCfkH4
         +iJTHUyyiMNKSNOQj0NX0eHVW5IMU4rTEWMQLLzhNZ4wnx55Y04WXC3QaVXEyMoEqaO1
         5FCG5JeZEdD7vYj9fkP+Uk6neyuuMVPAHtICPLG0oUVbUMZcgNNH6PGpuj167deGOxWE
         WUMz1kiBUcJME/8TWrnRmRxadTWc7rVdNKLekFA3QcuNZ3t3sV+GPnZyZL1vHKdbLsi2
         Dw46zCylfRTE4dRCzWHxYesi/cjJRvdr0FvQ9UfghJqdbji48AO0KMpnd4bbsBZEh64H
         ZX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573741; x=1793178541;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsnIM0p86hANMXW1GOBgAJw+27kK75Ae0x3nGj5okmI=;
        b=KFWWEG+2s4QO7dJ+XZwOahOeV/T2z/yK+2XECE/pXR3wtEfM1+9SouXJweAcE/fPu9
         WwjUSA7STXDN91v3Ja2ZLYtgEGytoOUsj4Umf2XqIh0OgKB00twBDfd74s/IYF3HSJ73
         i7ilH/5dkatDSWuhhua8nW7l+TDLdvXsNOSlt9EVabsh5x/k58r4cRYOWy+X79vbMhJ1
         vihM4cfcS9bZey2ZXaBUIqg1YWGYtii/kba2CUUpp+/iXdOfKgauMVYr+UsCOTDjXQbU
         /1raWsR32Tgl+xi/b++TwFWEzT9iydJKdISbdolWrC0eCo9tXqJRrpS5ZvMQw/Gnin4M
         MmCw==
X-Forwarded-Encrypted: i=1; AKwUvBxQ1Cr6fqTQVjJouDc55eCRKUF1Edleo40nYExWiwYkPBTetuDU0y/frHYwS+C66mSNrLquKvhfarSn@vger.kernel.org
X-Gm-Message-State: AFq9FYJQRnMKMRDWy68ZPj6zlTVmWLqA/HC+/JwW1gTFhwnpZMBkSoe9
	Vv2ytP593lJzaxadVWgl6dQcW79kFDVMLVNbJxiky6ArVlUs13iT7LXhf+FNc0HGi3s+fx6hEZ1
	6BFvLoc5ZbUbPblE3Yu/213tUQ2M2HreiX0cULjSfp1uX9PiahQkcNPHNxU26RzZJ
X-Gm-Gg: AYBFou0jOZOUjxRpQqoYdvGajZAdbZ/gr6FEtGC7X8iaZoLT3htcVBgj6o90Bm7aHLi
	lystgbZcMtvKmyI4mAYE1CtV9h2mNvSMol6tHojFNWDnE4ZF1eQEQOARhNdaROLJS0ejdtF3HXv
	aXmdLKSWgTlpNWRuCe7iAFhhUTsbP4MZkH4LXpk7PlxZ6WjgG4oy6oDQhP/W/d6ojl/54jEdzn8
	dRw9WAE9TuzSgkxXto7204wGiGTqn1lJj1/gH8A5UAXo8EEfwuvBv7mUCoMvKnSXkPVE3hsGbnA
	ydB1bpopCc2C6wuZMFopTSPHG5EuxIui6yQebEfowtK+BMXnAtRcEWimjYDS7+ciX6IDwGyPXpK
	OEQKhl+B2h9sIlVbK
X-Received: by 2002:a05:620a:1a1a:b0:93f:2aa8:c555 with SMTP id af79cd13be357-93f57fad39dmr302300285a.57.1792573740993;
        Wed, 21 Oct 2026 02:09:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1a:b0:93f:2aa8:c555 with SMTP id af79cd13be357-93f57fad39dmr302296185a.57.1792573740394;
        Wed, 21 Oct 2026 02:09:00 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25841fe4sm4461248f8f.53.2026.10.21.02.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:08:59 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:08:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/5] soc: qcom: pd-mapper: Add support for Nord
Message-ID: <peg2pnqbptiq7luxtdudddakrzuphe2uc5xlwi3vbifprsm4ww@kd4toenw7b75>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
 <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8812d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4e35E3TMtzUg7Ff5I74A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX+xuEPYcVGaT3
 aRoDBbn0ZHqbd4GuqihzxmaJ4oigGe/jD6wZ1nE03LQjXGpTbwT0oYTIJAt4C7f6IHUWb0jrmq4
 AE4D+g7lSjfZizhV1bVBUpzcFO+bCGuYAB8bA+VKMOQW++mG9200IcOnMTU2eCfEr3/N510emlG
 1T4RQjS1c3GFIuSobq/1nwaCZ+F0s9bhYF7ZI/Nx5tdjvou5nw7HRzJLQh+yn2FO3IFziV9TXw0
 kG7nKEmCj2UdTLoBTX2MbtnAu4M5kUYwdaAG3egXQnmsSIadzfQYgE4M+9IJUV7wLaLaNdEaymu
 5TZ3aidWdkmOfe9qppGnoweJY7yM4pDwEDQkxWJlNYxqfJyWCQoJ8qSPHSre3aGr1SqruTGxdpx
 eWFkyc81fUUn7Y4UxFn++Vy7iHQV+Ax7jWdV52lqJWLVvqNcNOusNaDBiGU/i5eBEzd9N+ro+lr
 kQ1TFnhPcCmU6HYc+jQ==
X-Proofpoint-ORIG-GUID: RxBWfZkhfuS4JeIzswcWh_0BePC66WUt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX0GtKTKzmHa8V
 YzJnGm1bvyZgHddP4ehuT7A76PaSNGrIBwZNHGNLligTbY+Q39B/yDvW5/4o1szc3S7mpGY7haF
 oUhPNxoWemM185V52O8tQl5gu7IP/DM=
X-Proofpoint-GUID: RxBWfZkhfuS4JeIzswcWh_0BePC66WUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036

On 26-10-21 15:36:29, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add support for the Qualcomm Nord SoC to the protection domain mapper.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
