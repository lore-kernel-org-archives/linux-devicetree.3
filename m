Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667817;
	b=jaCpSYEhf8O8M5EnZ+zvDI25Kfoixg+fs/Oi/wWlG8JOlk8nOwRugOfGs/BQRHHldCTl
	 LZgVR5+uHazWcKjJ5GOV57FP49D2j3wumP2VFl93tg+tm/L1nmqhbccn+nhVerIbWWoSt
	 VvppHYwsvIzECSwb3Pf+/HahmL+a2dpXkatWdwTzYVB7tvwFCgVN5s2zx//sT57a3tqCx
	 CjIYcOaCa6DpqPsVX0x8IOpgTr9Ajojq4UxfuMmsnYdAqfBh+Wp+NcjSu1rbr1EYWFoKm
	 AVxWnOMae3/nFDKwl9Ucq6On0opYnRGRycBYZufBSj32QkIX09jOzfZIXHzsuwonWmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667817;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9jDnWKJJ0pLAld/G+MaxErfbFghz6SX2FaTcRT+rzJw=;
	b=Pk3Iv3lpeCylATpnYhum0o2cYAI6mli6+LBwKaEB55TC4TECM6od5yoIVXWh3PCoABan
	 BNOsrSJC2x8vnZt5Pmby1Cp1uS2l3Xtt1zVAwW+DdvNK16Kq8BXIUUddoyiNGjRJG8L2m
	 sBZg30yx/J4XKWBB6BL9yAnWhGEFRDqoCEXJEYcMZTXsKvBno80T9ECIXfSaDj9k/GOl5
	 z1OiuQaz6GlNn1agyOePmewrsASERV1di9j8SmKZ+i5iP1mfczvjNZWzdDQRthsua0DJi
	 G0mxwksINr+zQPomutdva6HMM/q7FHEaj01GMaxmFSfv0Mq8M5MNZCvPiI+W1E540dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nM9CmwQC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/4r8wfQ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7CC606A327
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 14:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD7CC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nM9CmwQC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/4r8wfQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDk0HA3629772
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 14:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9jDnWKJJ0pLAld/G+MaxErfb
	Fghz6SX2FaTcRT+rzJw=; b=nM9CmwQCDWM1Y68yxe98uv8Shx2fbbvjArambs3C
	ov8quEOMm+Dbu1yylZR9bjJNfEHXlDDKAo1hPizmYDAtnK0edBLTfhHulQmRe3W+
	YLgJVAbaJJ6j3IFQ6DpliFGKu/YEstqcivf+2HRS840cmGoOJADrimWdKjJF/RkQ
	apK8ZdOPQwolgelvS8ItdFU1ImP8PcfAdlFs8+J5eXHPNjd/cdopnwCTidNYiZ+O
	LrveVt1ay8dbt7c0HkXbUEbKyO863eiyl0HFa+pXVriQwud9urWfOH8R3V1X4xV7
	npOe5lzlf9GpxRu6X8rihcJ3Axf+JsXamAaHDXCBTXwMCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkw8yey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 14:50:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so215457585a.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 06:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794667815; x=1795272615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9jDnWKJJ0pLAld/G+MaxErfbFghz6SX2FaTcRT+rzJw=;
        b=R/4r8wfQZLCOmBdjUFepWd30POpqYihRSirArJ6RJCvJzqvIIhnxAyKdnEp09go3Q9
         TIvFvo76FRD9pcJGe8UJ3ylmd7tfBWdeRFtfZ5ALZZY07Fs2Ba0OmKdyxC/eBk68+pUG
         y0CxgmPdTSlnvpShLvKAT3lUkJ8ckEYuDXM4mT+GtBnniRAQmtibQ6WNrN61BZK+r3yX
         ndo3//zifDlj+JliI4lC1QKJwe0h0NNIW6Zk1mquvNHzY3ut6jRHBbDWGElV7XSDbfTY
         qTSSSj722RdtpgP5IVI4juqYOGabMRNzDF8xLFhQLvNM46u9kSjbudEjPl8yz/AFy8VP
         Ub8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667815; x=1795272615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9jDnWKJJ0pLAld/G+MaxErfbFghz6SX2FaTcRT+rzJw=;
        b=nWzGGBZYsO9+VTsrg0bvGmS2Rbxg+E68ZS6BT40r6mtjGla1VaJAOjSqh3rc3TVNmT
         6yrIGJ74n8eouroBv1kB4+aVmhjqA+lBLryiEEQTrTVo9Kbwfc3HpN6VVrywPeGRsKeT
         gqc5I7fTHTCPIBwWs3ZmiJUK5MbuX8AlPsIINbGTrbHTzDOZa13uTnZeX6+kmKYiPdMz
         qkirCp1OeQzKmQ5phPGDkyHbPTRmIsBvuBkY64xUDzWebRcnkc1Tf477OXm0dD4jrJOE
         8yPuUmFCXeSp/IRkZ+AISfEh2OjmUTYj2EABHh7jM2MSlZ9FLSGhaGaIdyFL13n0kVmY
         wPMQ==
X-Forwarded-Encrypted: i=1; AL+hErHJN0E/Mxu6w4zAaHEGnoo/JnFTQhyxiZHmkzkyRj9wl80sWYydc/kmIJdWBxd1LWqDvX2NLMZ2H+6J@vger.kernel.org
X-Gm-Message-State: APuU4Z+vyRrUmRg4ijZoERQZ/UShlBUqC7h19E4RonjFjKM8UxkZi04B
	B2XmAmB/X5XRkhAH7ZGYXVP7I0tKHFWopqHBbDUipauNORMu/cpOqmz7k9oSI+jdgW7GTkgMhXj
	VGGb4YP0DhTGr2PdoFO2n/yj5HWPjEFhxy/9hpqNTYjRAi3sI9gnYSXDNtXhX5JvD6vaUhBPp
X-Gm-Gg: AYBFou3MCCgjpBaKUc43rZ3LfsILrmNVTQ3K7840v6LayHDrqIa4F1lFg18d0xde2xB
	Y7aOO8QLRF50VHG9hQkC15L4KKO+bG54UFgXpIgFwoL6kzwHd+KFggPTH9K6ZoFfv5Z2yejVvv7
	1scB5xr1SVBgRA4SQk/MiiCmQndZMtXiDo2YqDPtZzHZNpErvNCn/mXQWRg6G1/4nCDRY2kGVGM
	9wQnbzq4q76pu5ev79bpvWEJmLs6EhX94D8lMp6Q4UWFnC7z7jANKJhrlcS2KxiawydupTbe6cq
	qLD8bkeef4oHGu95BFz9HXj/JJ0/B4GHfRcyDFyYELjLYiFIjzvN50txkrQQpJpSx/X9UIol5s2
	1zVSJvWqCCigMwDyCsVEjxXnDjYFpLHfw0PIr5+vJLBIy6RSMDn/9c3r+V1PujsZ9
X-Received: by 2002:a05:620a:46aa:b0:949:6a51:5643 with SMTP id af79cd13be357-9496a516960mr173681385a.6.1794667814900;
        Sat, 14 Nov 2026 06:50:14 -0800 (PST)
X-Received: by 2002:a05:620a:46aa:b0:949:6a51:5643 with SMTP id af79cd13be357-9496a516960mr173674585a.6.1794667813989;
        Sat, 14 Nov 2026 06:50:13 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm11025041f8f.5.2026.11.14.06.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:50:13 -0800 (PST)
Date: Sat, 14 Nov 2026 16:50:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wei Deng <wei.deng@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mani@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Move the PCIe and UART graph
 nodes to the board DTs
Message-ID: <egxevic5xnzmjxikmr2hsj2tuvco7zjktbyiw6oifjsprgw73a@vflocomd7qds>
References: <20261112-hamoa-dt-fix-v1-1-55efbac840f4@oss.qualcomm.com>
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
In-Reply-To: <20261112-hamoa-dt-fix-v1-1-55efbac840f4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1OCBTYWx0ZWRfX9yxvVh9f9qXb
 vFTq6TF0gG5o070ETIeQwvtzZJiTWKMZLsvy+67RM4WeLPrQEO2gEUhsN8QfboQkoR7zdwmQuWa
 osRb/bykJJLSWxrB6znYZeHkjGDjhkEWHDteQczd/xddJQsktlnrGKYmYT7F37g02ss1B2Bviz/
 5ETFrq34Ndz5KKvWek/s1GQx1W+jNyx0yOu9rnyAzVfWwHFMrbifweGFwCFcVKhkET21O+W7Zyx
 sAflY0wVyRBIeHnzkjwDO9Z4f/Ia1UpS+rjwevs09Ppb9KBIpRqq3apoLvfsCaqa3MUUncZLCjh
 R1UayrvlmTPfQKxtSK4tIPeiUV0cDK7jpLuXJE3lDm3rQkTlpg5EnuzHTs332Wokupo/pbKfCwr
 HurOFCfHtGOuWsqH9PZt1YU953P21daNYNQAGc1Sq+XcJaz62SnbWWuLLi8nk98v+kQUNw7ANJX
 17CP20iBfUOwdYq5kkg==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6af87528 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=c6MnNOAcyMoAY2_djnMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: JQZN-oNpB90SJfoVrzgVNK3HyJgnmY4t
X-Proofpoint-ORIG-GUID: JQZN-oNpB90SJfoVrzgVNK3HyJgnmY4t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1OCBTYWx0ZWRfX1VFQO6RWIY3y
 Bl/jOe5eMY8J12AoHAN4Yb+CqGd9lN8HFmZvBT//c+lbM2DzhjveZ4cQou6/6m+ioy4zqcvBGW7
 hvUj68x6SxNSxbeJHbfFVz4gbxW4Grs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140058

On 26-11-12 16:00:25, Manivannan Sadhasivam wrote:
> hamoa.dtsi describes an empty port/endpoint pair under the pcie4 Root Port
> and another one under uart14 node. Both belong to the M.2 Key E connector
> and only the Hamoa and Purwa IoT EVKs ever wire them up. Every other board
> including hamoa.dtsi inherits two dead nodes they never connect.
> 
> Apart from the dead nodes, the change also confuses the pwrctrl driver.
> 
> So drop both pairs from the SoC dtsi and describe them in the two board
> DTs, next to the connector they belong to.
> 
> Fixes: 014501d141ed ("arm64: dts: qcom: hamoa: Add graph port/endpoint anchors to pcie4_port0 and uart14")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
