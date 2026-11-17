Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910166;
	b=KS9l8dvP3PTiiJaGc/ZABv1Uv8C3MKo78ZqfEpTOfJS9wXUW0M8pIoJLUCal/f3v5Ia3
	 jA6/I8LT4xCA1IHAlS1FS8rRthU0LEEfwADaHxw8c8IipX5PJHrB0g0SGA1YwzLpLZjXk
	 v39uD5gi+VvNHtiG+hjeEzYfDZIAaxu//9l2A8QT0c2soILgNaHSyFbduonOmb01Cfg8+
	 jw0ZwKgU+ZpEsyEjbsT7WNC3lqmwrWHQYaLYvrlOmi8CGHgKnnXMF5LR5sVsF7FcK4Xxe
	 kNA6u675chvnMSoQqncE3ws4+eIO1OVCebHahzGaj54XyvlpOFJOgC81YifoYKiqdWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910166;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jca06DZ/VwnBNDjjcC1Z70V7zzYoec5uq00WOVrwmWM=;
	b=SbRm6CyjbDswJVIHgdpH+2YXZwR0XsIr2Lar8NDbnFqx5YQgw9gza4n/cpYhqCSAIJVZ
	 Eu4rEYYM6mL/GltPt1DghufGoGsk1iPGaEaE7xWbLxlRDXkkW6ZCQeFet64uIG16ZmuZ7
	 byyn5OUPYlJ9WBA+1TTUAacd0xMcv/9Z00x5hoWOf5kOxrRdOKsRooGGccAxoprByO8QM
	 7ldgHdcFakzeJqECdaVu9JuX8hMt0g7JR6FnAU3cypNqmbDMaXhFbIFemOa812o7jzhjL
	 xLBkfgFAAPCidesGonADM6hfh6ZbqdCity335DepEBbwrMQYpTvwP9M4X+o2MSiAHhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f5w4MkuN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e27TCJNI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0CA606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C0CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f5w4MkuN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e27TCJNI
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH5354w3458009
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jca06DZ/VwnBNDjjcC1Z70V7
	zzYoec5uq00WOVrwmWM=; b=f5w4MkuNnugKNHkMWKAn1+WUTP/VE0UUFOuyO2ZK
	G4UXNVP9mlvSmxtkuSycu0Eiqd5Hqw0wnfrUH6ygf6v58c0FXKW855rQ1urEUO7R
	oYJrytQIxM+EFW0AKawUKZh7LFMUwWKcDcOrSKzyFyidE2Fz+OxZ74ORdayhwYtG
	CApB5d0Cm4hvqBumIWW08n56ogrgWeBffsVyXVUmCRp05gpezXVr5o9kYvvMzi9u
	rRCTxCFPdrAGgf8vi1x9q8jyxiTyK5OKmkdJRfLsSBV0RrqglPX6dSxzZEgMjRQ8
	9oL9Hu8A62gy/lsWuORbhUWIBkjFNEa6Pctzp5GJ68wfag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh95ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:09:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-948d83322f6so745883685a.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 02:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794910163; x=1795514963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jca06DZ/VwnBNDjjcC1Z70V7zzYoec5uq00WOVrwmWM=;
        b=e27TCJNIBkeVRCwZp1sSuHWMIQ1VDHJAa7Efi+S1y+Ql6f1z6SLk1I7BZQFNfJMhMa
         Gc6abmBTEaudbzlFliJBgeWEIsNQo2EtLKA/eZIf7m/NvXTZeqRRuYte7qmImHBcjq3m
         7mGCtW8Y/xQbw+0hXqFRDC2bHxEnxulYZDbEtBIwyTVXPsuOqmcp2xU+qOquDXYqntEZ
         GXvQ+D3Ys86YfOBTQbdgFYk19vWKPpu9a8MKAoZURMu0K0XJAaIk3bU2T/uo5cFiBiqt
         n5ZZkaOhRFveFNhFNwJRV/hMXIGllhHSdSaXONKYJi7istLo+035GP5Mp0o5tyDPVOPA
         0b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910163; x=1795514963;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jca06DZ/VwnBNDjjcC1Z70V7zzYoec5uq00WOVrwmWM=;
        b=X6b0P1rCQzGVioq8yamzDrYVl/BTLQQ6JWUyEtJaW4qgNTgJX2DybNjkss9zeX3cfi
         pLha04hHXCTDw1wOUeTxfL4EkJ9CipAD0MJxcgGY1vyaNDyN+p61W9sMskA4Ic/3NYF8
         SjvL7BuEFFWVuQd3PBnkML4cY2Wz+8BRwkUw1uxT1v3t040+7U7r5FBZbQRoTN8JF13F
         2jNFQBVS+GdJarU5ZgeKZm13MWBBEJ/qPcFXjo/U7g/ApLnL4751Q816j19NWR3YeV7a
         kPzy6jp0oFZHaIPFK9Tnr4A1TtSUh5CegTceh+oTqcY76GQKKi2fWtGVurJA14DkDaNR
         NxQA==
X-Forwarded-Encrypted: i=1; AL+hErE/JNPyWfXl+kZESP8AtIBqgI4tTp19GUYdz1BUcP8/wzhXMzHYZSq5hdAGjrRPiqZ4ICL2xYpWB+3l@vger.kernel.org
X-Gm-Message-State: APuU4Z99A7MNLsGMiceKqlCG/rKawKMK+82Ve1yl5c5Wn7RI2di6ScoS
	49AWZdNT2bM/8pQvY1YipE1+HnrU4Ioa6CX+sPuoqQo+JAdDvaSbVyAmWwvTLtpCn1mIRJNBlrR
	pirderIzeJWlPJmUzjlN/6ZrPSVqiX2x9065sTTbCFEko9Yto3mum7KOxYSJIU+zN
X-Gm-Gg: AYBFou11vfEjZoT2RH7Hjwv2bzlpMgCPtri8mdgZPFuzVdGecceIDmzH1KpKsoILsZP
	+34RkjJewutTuNdKocl64vsDLlz+WfVKi5od8FdGQrdTjKIy7XkSFWsvPCtXtRhZaf0BfQa71BZ
	Eoe/eVlttbby/UbFpmdiJaz1gJGGrrT2ySo3MY8bpTuLDNlf8YSsXG1mtl11CsKPF+lpRkQt1h/
	fs9Y15y21dB8CE4New+rb1fcn9SqLEmEhvsVEgLLrSh0a/QMo9X4YU3bQJshdzryEmArXnJyYKS
	1yTVwcN6cU8wMy6aL68t1rK5jPRawCAplA/hnH/nfHg/1ZXtwkEQTXNyrvgCfPX6rixlI+0E7aC
	cjSsbg1VQ7oWb4faPbnBg1TJYYbVjN4HOtdzC92WMaY9VcYKU9UIrcK+5r1ZO4pom
X-Received: by 2002:a05:620a:280f:b0:93c:6028:6d2b with SMTP id af79cd13be357-9494bc3c155mr2081414285a.43.1794910163157;
        Tue, 17 Nov 2026 02:09:23 -0800 (PST)
X-Received: by 2002:a05:620a:280f:b0:93c:6028:6d2b with SMTP id af79cd13be357-9494bc3c155mr2081410185a.43.1794910162514;
        Tue, 17 Nov 2026 02:09:22 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm27416482f8f.28.2026.11.17.02.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:09:21 -0800 (PST)
Date: Tue, 17 Nov 2026 12:09:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: eliza: Add iris video codec node
Message-ID: <nhbxbsvgegih2x5sbyl4p3iczjdhv4oenq56e5gmr5klplq263@5v5agcijseya>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
 <20261117-add_iris_for_eliza-v3-3-02a55a9272ef@oss.qualcomm.com>
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
In-Reply-To: <20261117-add_iris_for_eliza-v3-3-02a55a9272ef@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: nYNT2YnvNGuaEa_IEGX18acut-qD179P
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc27d3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=mbcfl85LdsPLy9AfTWQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: nYNT2YnvNGuaEa_IEGX18acut-qD179P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MCBTYWx0ZWRfX9Xzlsrzn6a9O
 ixUEUtCmoUx1s0WwQhtBzRvcnPIGSKL9FbbJ0iSSOuVskeClQ4pmwd06X2sLUfQi9N7C5PvtGSJ
 uFbEJWHeBbaKmUDeN/+FSfRMckL2JS4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MCBTYWx0ZWRfXwRIii97tgqlR
 HR8tBdxqiDk6Ha9d6eeVLGCoBB3Fb+8gBROKaoQUUBpDcj5FSyapquJzZZEYfLtOuVuh5sqN//x
 GRydy/vzIbr3C8HsBh9SRUBzhOkRooav5ms732WOiYeDvuf/s6DDT7peIwkmJG0S2d0JFWXEoBJ
 PJdVfW5eeM3WQbdns7qO7yb2SNLA7S1L8FyusI/PgitGXXMM/dgiWlBYaQxioYPygg06V4Zoaaz
 g/hrYj7qTh7X+BstkFBFU1dcwwqADZGN+sa3NZ4HXBZszhN5YChZ5jhZlkFLLJPP6aoGDsE7/l5
 9Ag7LVnybY43hv0cZLZV8l1SlFPFrzqldlvAjWA43VhqOM0i2l/UwnKg4zRZ+QPFNelfA4pGRkw
 VMCRVq2x7FhqkJU5TTKdtUz6ajMd9iZwaUIGzvCyuvb2nvNRWSGnIqIjYKK0yrekRUrsTifw1vb
 yivVk+/jSY5kgrNvjrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170040

On 26-11-17 14:34:32, Wangao Wang wrote:
> Describe the Iris video codec hardware found in the Eliza SoC. The iris
> node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
> GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
> codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
> support.
> 
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
