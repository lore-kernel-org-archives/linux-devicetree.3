Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699577;
	b=LFsKFSIZKjhHbL5Ej/jPZy7AVBZciI6MuUEdCj6rMo3XzsGoQeWHqrfscADTDPjFRIVp
	 yR10nN4yQBzWcGn+bHsfcgEGAW9FgaugpCVGmLJp+8onSFxnFSoacQI+3CcFVhOPgGcxH
	 j9MuUYtXEJKXUMN8C+PY/xl4oS+vSzezkU0/KHHXIDeKVYcmdX98wVaNYctuEle54A5hk
	 0zgLUsCtqUd/vchkFgjSXmIKeqpr7ilGqnYFc5vZXFyjyb7i21gSOj8+3kq/znV/My2AP
	 zrAKlA43Db+2rxtlSNdYFbPMhgTcELIdghmoT8lw7qPfqHrnMb2ezQTNMNsGiRlXyZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V2vKLAbaSmHgptJneH1h5y6dZZy9cK7QL+l/UJYqCHM=;
	b=PW/NKHogEfh/pCjlot9y9qQyVAvBKNrMOyogVK+JhDo8Rcct+480d7DD8PWk3cLClSe8
	 Rin8/m+GyfgVT5Qk+/oDvFg/blJnj2GjjSqtPan8gd0Xy17qhh2ow5Isw4o4YqrkiEz0G
	 bzzq2rvXEouT3nriCe4zcH27MA2TB0mDKOsnzkhSCuBpAQELqv2I6LmnPXh42ddZGh74G
	 yqgmQtHM0h62gzSRxCiuzU3XtE8gnyKyTbafScHmlL1vmMziN9Zact/LPo+0GxiHhMsUR
	 O3Tu9lHXzM9JMN7Pos5VavlxirI9ouBKt5i+xjWDfc2QjJFUavixNeZ5A9SHasu5wgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQiqC8J0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kgfpZNjn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BA2606D82B
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 09:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8BA2606D82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQiqC8J0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kgfpZNjn
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38H8Us1120773
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 09:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V2vKLAbaSmHgptJneH1h5y6dZZy9cK7QL+l/UJYqCHM=; b=SQiqC8J02pCozqhU
	iqF0eV572zDi8yFJatFb89kEKJrM8W3qbmf8Gj5FceM+xmt9lZr+71yZe/Dy0Gi2
	WfoF/BGPW1LEgoUKK/b8WzkhNIL9eIgB9Xho65imx6vqTHX8BIqfjpgGsWBGJQCT
	zdSEmLukpei9MUT1XEo4ox3zhNOa1vxjv1R3NrYdplRjncDU/orqVSE128hQPpHq
	QLhL+K3VHdjSrgcEMst04EQujdPlxauTRHXUN88qAsN5uPMnns7UfBLU7gtuosGU
	dxdZ2CH4Zx1AAVFkagXDmOWitCi5MGt94irBh0+dEmaUJBVtGCZz26mmLRAxJ69w
	nszajA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r34jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 09:52:55 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc175cb172so3421241137.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 01:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699575; x=1794304375; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V2vKLAbaSmHgptJneH1h5y6dZZy9cK7QL+l/UJYqCHM=;
        b=kgfpZNjnzwEG43J1phEbY+v/tfQD8Ps+LfgRRPAHGKoAI9yCXg6DFy3FaQYDPHqXvZ
         0B6GW0sLlrspS8FeezFz2yxfucIUAs0UvdwMPFVAVo1YznPYPQ7H2ty1kR60tg594Vfk
         bYrfjd2p1/wHFYfDtgVxcMcRM/k9Mv7pO6bq1ozqY9kPXtW45hZzLk1upl1on4/Xumd7
         fUu1x3ydJrC76X5uAgjjtr9qxvdG4nKMV8g00ynyskpeU0Gt5iJuqR1xQla+cScbKhfk
         M2pjRXYJP69VhTnDnYr6AwJH0rXLHSzunGC2z1OM6lkQMpl1FG9MKIDCyL1lR0tS69zY
         dAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699575; x=1794304375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V2vKLAbaSmHgptJneH1h5y6dZZy9cK7QL+l/UJYqCHM=;
        b=GPKuvgvrn2GJ/L0QRh4J+4qvkbLZ+9QPhs/qUCAYc5kSa3yVWxo7v3Jjt8fqzjxpSw
         NqxdiG0/ZcEf6oOlRlzEroRQxmk9bVTTNU3umuwZ5aFUCvBEJQjmImXfaSOyxhDZLVwt
         Xdv46e+W1E/Z79TOzYDC63m4w8iR+HIbccVk17tppWy41vsj/3oua5jd1CsfgoHR8vLv
         aUCIlywleUYRYJZchwyUemOZp99CWw+xhPYBMtOJ+4CcD5/jL62VB4uyhaqHwdXGWW1f
         VFw0LFTm0wjF60OtMxhHBYG+xQGO1g1HfeS5TmvRoWAiNrDF2mohFzZ4bh7p066Y4Te8
         6gtA==
X-Forwarded-Encrypted: i=1; AKwUvBw8W1NhQ/zuTrSD/+iFhh4fBgyXnG/4o4Lyjf1mZ0t8uoRSOrPrMi8AeaP33I3vwXui8EtYsKU2Gwu3@vger.kernel.org
X-Gm-Message-State: APuU4Z/qNiFA1bA8/AEVWisK5yeozoRNJjbq0GC5qJiXvfUKisYkTt13
	/fXqQXtjY8berLVEObNC0xgGbP7GjeDJxONjtEc2ihuG0yRVB05SgB04iNb+7G22K1Sp+m0gYbq
	BefV2ZqLmrXjafaxqmfq8yWKMBVGa1TeOjvq7MafCi7ztbM/TSMt8rRa1QAuZNblh
X-Gm-Gg: AYBFou3ae0m13Zzn8uEUu4eWk0iaHUjKKy2nsXvrQmMpfIpzO5G6vYPV3lda9pfiQCh
	H3lX7v3lTq7gb6oN9iFUhicmBocpuExWaG2gYACrkPUlzpvP2qFuMx5ofWWLb4epH3HYQXUDWPA
	Ip6IknV4+hV2zukMuFXJ0+Mh4KyE60JZYlyspAxdZIImeNbTMg5byssm80coSZCpTQ+mj+/0mV6
	AdmvtMKm3g3ubZ5BJ4z18IrMxNu3CLHWhvJMGegCLScJA6BIg0UlvmlnOz2Jt/xKKsNNmOTYfN0
	EQxKNg/P23D2nBrMODTo8K+xftZ09gNFiUhO04wGFXebswaKPqZUyKTof1GVj+QcNR3XIJ5kkCN
	X+II3p1L3JTXcO0Kjq0BO2U/IAAWwZ1usOSic1EwCRnsuYMAXp0wRCbrMVKTo79s=
X-Received: by 2002:a05:6102:5093:b0:7cc:16e2:c1a8 with SMTP id ada2fe7eead31-7d07261536amr5055173137.8.1793699574816;
        Tue, 03 Nov 2026 01:52:54 -0800 (PST)
X-Received: by 2002:a05:6102:5093:b0:7cc:16e2:c1a8 with SMTP id ada2fe7eead31-7d07261536amr5055154137.8.1793699574067;
        Tue, 03 Nov 2026 01:52:54 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae0f4sm21429736f8f.58.2026.11.03.01.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:52:53 -0800 (PST)
Date: Tue, 3 Nov 2026 11:52:52 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Lukas =?utf-8?Q?M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, akhilpo@oss.qualcomm.com,
        jie.zhang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
Message-ID: <73wofgp2y2f5gwpdqg7rlqolidb6kwxbjay66qo3dbabjw3w2s@doxzoh6vj67n>
References: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: mDzLw2V6U5AwCZIGn_hehemXkv1XwL8p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfXx0uElQK7R/Hl
 QSKcwBwu3X1kIbEKrqvnAEqpykS+WgfIPi8cbvi+MQOVmMWmbivkQN7mBzMccYesswx8A5jG5PO
 YrjvDWUbYr7E7f61PrXnZDUKi5xHrA+dBrIvfB/ambRyLusSXesjSCYRDey2gFiVWhkbiLg184g
 QC6gU8TIyxVtM5v+cZLRGTRxzGvmLoqrX5ntEw/xU5azggKqH6ak/iq/n7wu5uwby5FdE+jErKC
 /cIKrB7Ht6H8cjv2E7lY0unOe8Soo97NbY0R4eqRrOJjktKVwkqGle2QkqHvkXdgBnDfjyHl6RJ
 DIFJthZOlhvrZQeRhuELR9/BZFf6P8y32Rbl3bDkthEhiPQZRvFdKDEuvD8YqRTtkPd9emCyc1J
 0jNhzjTYQWzVnzYpfRERFN+17uzPAod6Wk4y1yYeCfFBjzxVNbV6aExhkegxB9KVBbDbCD0lb6d
 Q0uwQwQUOLbHbZkTv2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX/0hueN9zDGoa
 bnJXXaWiXjIdUukcDOkW+6WDQf7VQvgWVkEhiALSedDKpPNF2zoqcWS+yMbQJ4JtIBaE6TPFbhZ
 xxWX5rOXSCNTpSaPiQP4JFUhGLn8jQM=
X-Proofpoint-GUID: mDzLw2V6U5AwCZIGn_hehemXkv1XwL8p
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9aef7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Bn5j7JmbtJmb3Q6V_lIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On 26-11-02 15:28:12, Lukas Märdian wrote:
> The GPU and GMU were disabled when the ThinkPad T14s Gen 7 device tree
> was introduced, as the Adreno X2-85 found in the Mahua SoC was not
> supported yet. Until then, mahua.dtsi inherited the GPU and GMU nodes
> from glymur.dtsi unchanged, describing them as Glymur's larger Adreno
> X2-90, which is not what the Mahua hardware is.
> 
> Mahua's own GPU is now described: mahua.dtsi overrides the compatibles
> with "qcom,adreno-44060000" and "qcom,adreno-gmu-x285.0", and the msm
> driver carries a matching Adreno X2-85 entry. With that, the nodes
> work as-is on this laptop, so drop the board-level overrides and let
> them inherit the default enabled status.
> 
> Tested on a ThinkPad T14s Gen 7 (LCD): the GPU and GMU bind, the
> gen80100 SQE/AQE/GMU firmware loads (GMU firmware v5.2.38), and Mesa
> 26.3.0-rc2 reports "Adreno (TM) X2-85" for both OpenGL 4.6 (freedreno)
> and Vulkan (turnip).
> 
> Assisted-by: LLM
> Signed-off-by: Lukas Märdian <lukas.maerdian@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
