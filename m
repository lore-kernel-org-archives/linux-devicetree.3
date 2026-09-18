Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560684B7A53
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726002; cv=none; b=h6Y6IHYBpVMTlJpyrx7PlnXXEIugYu2ZiJ+RUqzhL4U/BjniGJAAZTe9G8HARJDi0nNwcc0HuneC9dgWBTWKlP295eArfSqx6mSfSod0bCQPhnl2Yeop6ITNkHFdfNLQw8clJKvFhcJkN4oIJk7ARyBHsMq49hzhlZvI3bfjVB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726002; c=relaxed/simple;
	bh=ZgoSaCzKmKHz2p33jtXBIxb3E8I19yAI6VB7bch70lA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D4mTQrx3FkckdqoLll5NPVf0EEzh28oW5gvyeBelk7pr8ueQPC8rxU2pZiEOADf//T7jq9frIXdO+QSc4ffMF6F3ay8H7GDyeslNDh8bD6HP374Bpj0cT6KYI6hLmP/1rHLje0Y59KREoSZCxsG+dUsej/QF4w/Cc64BtfNx+Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oN4cxsB8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8P7Wy0g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oN4cxsB8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V8P7Wy0g"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dsZj139323
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8/Q21cSCqT7ec8jqFJIowAyY/dNI1Dq7UWonJbvKvDQ=; b=oN4cxsB8ZDAfv36F
	0FW54o8hbwK6DXkgs/iK/I9KG/AP6Tcdvrp3zLVIBbOfjzKzDK/UXmSusLGGv2UO
	nHVSHu9FhdyOxYexRvu2Pw3U/YcxaHhb904+j+DzP5ddQSFQqhE9sEehs/MUGPfn
	BdfgN7lR7/bZ8d623yeAVMKNxgvDqQJGVyL2b3jsPQs2lxFxNvzgq0MS7uqN+XAD
	AX0ghV3sx3vIXXjlpokrbAU+fkm9fW29AqpNjbT15rsOnIbaDh6hzJCwHvPokJK6
	aNMIxoyWZVNo+Bkenu2KX4+ucQ7uZVszqjZq71PUc1GaLiTrSuDR/8mpTHcudZcL
	A3u2Ag==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2bs4f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:06:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f4002c1aso9011385a.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725985; x=1790330785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/Q21cSCqT7ec8jqFJIowAyY/dNI1Dq7UWonJbvKvDQ=;
        b=V8P7Wy0gZh8N20tvVk4fnbc1tVyVnahYIg154K2LoURt0iSiNywpPN1lfHCS3tdgRT
         qXc1IfN4oFr8V14phM6YAZtuXJVCEY3fEevY+33PRsAWTZL38YYpkoGhEarpT85a5Um5
         cKE2pPkTbiSc4VEDp73oZkuYA1JptZDkBpEboP3Y6eJ01/4dMouv8QLMfsJzmdLrHmVG
         G2ZJX0uLU1YOUOm9Kpx4DBTX+JLTd4D/ONEvLm6uvcOG2AzPo7bNbXxpqcsZEpLEv2N7
         ikKmm9r/smoT0WwD0GQAKczy8GFDP5d6iKzmG1f0GAsI/tzWn1HwL3fpuUhvUBMiz7Wq
         P9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725985; x=1790330785;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/Q21cSCqT7ec8jqFJIowAyY/dNI1Dq7UWonJbvKvDQ=;
        b=TNedaXqsips5YyGl7TiU7YLSPkhmI1soZLZz1exxcozV/rM/aIXdNb9trgPQwBScHT
         CHBhqze/PzOXvqL5KsgTkyqV2/TzoLzMsvNG+x95Qaa7j+Cg2nZ8sPbwhGBGx4flAxKK
         FrOwWHHIDsCjrXQJ084AYCeN7hl1meX+AEXQ7NCiA+4ZUrRSCoA8IG0ZVmzXhjxzYZob
         FCyob3Kdr2CfO3VQ3BwpJK5HPw6ALoGpMnmc9tsPbAw00KUm+CTnQ1p315S2Q8OyFP4D
         tS16Lkutt7EU698W8m63sZpA78LwD9HZiyZXJgxFygK/nckLauhS6SSEyEFSnvYlPhSu
         rReA==
X-Forwarded-Encrypted: i=1; AKwUvByDD6vg5J7LVL0q3T8eANnJuQUUVrkD7MqKzj69NMU8w75tnCoUIe5RZaLfBRYw57dzyub50SfVa5CN@vger.kernel.org
X-Gm-Message-State: AFuF++mVWRBvYKushw4c5gnw6OCDuBc/W35I3QBTgn71a5ybDy1OD0M2
	4lwhQ7LzSI9cr/IzU7AyqpiTotkGRnt+GKncaHEvY+oXaj5pPGMTcA2LJVV3GHdftSFN1ZqVoyS
	ZvKWa059d4/V73hqjbItLvVG+RJrsZKrRurmwHbkQzdqIZoUdKlg6m14Zu8/LqR3S
X-Gm-Gg: AYBFou0zM3p04ilB7nS9qyHi8UdWZXCYfVPQcM5lntglzZA4uL27jqia/Z6q739NbLg
	ko5EmspNKQxhqoaVwvqUNaImo2l3a2xiksfC+KVFwLIt3owqy7k+oNbQysAvMK0doUBMlN23UpP
	gD0O0XXyXyx8rplTlvgrGRmIPF9+XV7F+S1TMe9N7pf2df5vTLZNDOs5vESNtx55umBHMGcDj3w
	pVStSknhQhOmje8B0io71FvdgYkSQmBxFMSwk+SRy4xhVd0LdUs0OrYfwCrD4wrNAcLslS0/+Sk
	rOb13FioW4JCCw0p5lWEBZysV94Dh2raz54veGxL2F1n9h1O6p2v2Kf7LOyn4gh14uYOTtt6ODw
	/4UDOxHk/sngWsstNvp+vAw==
X-Received: by 2002:a05:620a:6888:b0:939:94c4:b799 with SMTP id af79cd13be357-93be074c4efmr193663885a.5.1789725985715;
        Fri, 18 Sep 2026 03:06:25 -0700 (PDT)
X-Received: by 2002:a05:620a:6888:b0:939:94c4:b799 with SMTP id af79cd13be357-93be074c4efmr193660085a.5.1789725985335;
        Fri, 18 Sep 2026 03:06:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59715eb1sm618412a12.16.2026.09.18.03.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:06:24 -0700 (PDT)
Message-ID: <05b9d20d-5ef5-4ae0-8507-141a92e947bb@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:06:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] arm64: dts: qcom: sm8150: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX7cZSjKszVc2P
 43O+Jq7xBmqsgKZjTrEWUdKn8iQMJRELtUo5tNelvgW5ZI204SsO0ym3CGgi170a9xob7FB+W/w
 1I1NKN1XlwCXJLt6Phc2vcQfDRh9564qwe7rt3iXqw520ovrHcrUjrl3lUtPQg/qlR8aG0Rfmi9
 p5ZmGgcxXa3OaNWSxHuxIQwEllmHlC3ZAsIBoUwufhw4s30zmDyBvHhmc9yZmKGKNszssVKLldb
 0gSfhqZbiyiIOqbs6QDHTpsMiFtI7mpGzIDYtzJuJqHwOkAnrutAZPfgEshZFNaffNxiFtF1JOy
 7n5rFTJ7n5TzRVZOby8NEMHCt7tcLVZKQZnlK9gtRu3hJIJYmzrWi9wo8Z7+mZwehfHo22Hb7qa
 QUALEn3H0bqf7I3kmr3Valuk1f9xDRi5OunifXFGpE2aE/6CA4GDPlyEfxodpIKAntj7L34yvFC
 GDQ4tFEZjivARrGHO4A==
X-Proofpoint-GUID: 8H_Wa-XejATMEReCCGxHwrQZzJ0-MUZS
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aad0d22 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX/WK3BunN3rme
 NCz6tUz9h+KMEYJRWrGnWdifxEtbxhq/7q3TBgxUxI1yzUr73uHZH7vlmGiIqFZ1uheMzJiZkMc
 ikx+zUPwyVmaycejiAAJeRgk6JupRJU=
X-Proofpoint-ORIG-GUID: 8H_Wa-XejATMEReCCGxHwrQZzJ0-MUZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to pcie0_port0 and pcie1_port0, adding labels to
> these nodes to allow board-level overrides, and renaming perst-gpios
> to reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
