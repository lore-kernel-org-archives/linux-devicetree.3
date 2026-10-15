Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358A947F79B
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051263; cv=none; b=k7sxtpBR23Lp0iidZnaJdPc2Lte9ecd0CKDP5KNSSj3PGDMUNINSDIfoMno2fL40Wn65ijkofwsHDY4o6yonJfAoQCUf51nImJRAKLveDKNojANo4APlKEELwcGxD+RabkUIZmhx0s0kaoIkwAyQMWOqJB5/sTY3KbDszEpF9ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051263; c=relaxed/simple;
	bh=ZGoe7RNQAwBaz2PwJgBJz7q4Nu9oMgKtek/8tdm8EhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qYjGU8nwcmW2aQZeAHuvmSPgjW86H8UjDZ7u1cWaHwjIxPCHKlZSzRb3Z2lj+9EIfcfs7LVam2oZns0jL6Jm+dqe920TxiDTUuy4TgMD2G53vX+FcVZxexy4ITeczlhTVHTTi7WENgjU8A4VPZXV9EMmGBguFDKnpALOy9PDNu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=liQxcyuS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iKJvOR5X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="liQxcyuS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iKJvOR5X"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6KKEV644643
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gv/aV23P7UOIz2OLhmRwngNHyWsHnDAuW4uKnTteBNU=; b=liQxcyuStIlyKE+p
	27XR2Bwvyb0u/vgWSGD8S9NIkg4uO2oZM3P/MOIVTrwx9H7l2cGooGvNy68ju1dd
	AYGJsSparnm9zva2oFBn0Ke8d6v8QFe9Poly6kF4gJcti94Zc08w6mYZkahckZ1E
	3R1bIdG46g2oiaVEbG95cKA9R2jVgyudOxoNTznSANM0WdLpXmR1EnouQ8qFAliH
	jp+zRmps+3sKalVKlsiOwUZcs1/cf0f3CeQcZeGHp//DJK3+stwVFEE41p4SV+LU
	qsUudT6yqC8s73gjWXzGvuWECWIzqY8VOyH/ZZw21UW5E1gAxYsWGtQsBcRxzUE0
	PeubsA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmy9utp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:01:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338a4075d3so15990501cf.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792051261; x=1792656061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gv/aV23P7UOIz2OLhmRwngNHyWsHnDAuW4uKnTteBNU=;
        b=iKJvOR5Xx/hD0mh5vOa3Jxg7PrBQ74UFAir3BhoKeU1cWXPFw+AEUsh/mj7Ypz9x6h
         DUc9NPfrPz2HFJWb5Ws63Q6PIW9HAaP9JQ0d3S5yHTHWp1BEN/wswGJ5kL1wjQrJjQJA
         WmvN/KMXodChRR6FKfPtFY+w4PC4PSg5i+3lZ5cJfyyccCzUbiN6k4dh61e4qOdsl9dR
         GtUuh1cOzUr9cHnWsWHzhz67rZUsexcZIlpy45HVKJk4h2Jt0y01xTLKyhu1D+xMyNOy
         h4LiT/ZiTHiLoaOQWM1/bLgQyqkjiIMxGSMMBYE+f/xCa4JpKt85jF/WsdU5M2cN8Iwr
         +ajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051261; x=1792656061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gv/aV23P7UOIz2OLhmRwngNHyWsHnDAuW4uKnTteBNU=;
        b=FyRYERh7BufqgmwjK0OTIT1wjhiiG12HASaiHcJpyhnuwsMbh2pFcoDLiFmPorsm4y
         qq8VUyFyWQLZEdKGfgFcBI2GwW9Bkxe1Amq5z4gFAPf18PvD5HdCP/QlDBfJa8IBV6Dd
         K7BsRUT92NlzBq+NomWU3kxDDW/d9RUTLkz/be2Rn//nKMRFcDtzjwqRI++ol+5yvygH
         XNbN/arDECDOXrnj/6vpV1CuszkGUpLOnGZVr6vxgBA/P61F6hplLwoa+Hna+Ag8zvab
         bcl6viW1P504L94APuWw6srgtTMjhFA7CksKGuPSNrE/h65LLn2hKQTemFBy/KZCywqQ
         Fa6w==
X-Forwarded-Encrypted: i=1; AKwUvBxxSmWbCAyRWLBtcPDvYEknwZLsmVKi+PGZOQ4aqw9VJdYBR8QwvwP6LIowIxOBnMZxkkx3d/IwF/cQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJQredjNtDGONqrMoBzD+0vrHIvGUVjDuyPaPYJd4tIOPygsk0k
	1u3QghDYejC4DGMmuX/dka+y0te02qx53crT4Nt3wewmhyAcaa3D8l3I5hzdtFJWfPFB5wGWDTC
	OBjM1iYh0O+oGO+Onx3vmvB/mrrYp2rwQuOxGfcpz0I14lY5z4cPt4thyLcUnDeTn
X-Gm-Gg: AYBFou1GwdNoLebT8jf+z9a1hFF4QqsDqiTS9/JUZhPnr1NXipqLp6MTLy99gdpGQMO
	lRYhYZtFWyEt77zL6S4qKdT/On04mkDCyG0tx83U3M4i2GnbwgbPli1Wk5TeuZ0HPMq2ON96F5U
	WTfI3F4qhvxoZGJN0CnVqdgEWG6gE1Fzth36bxd1MOnOfObKhhtd9+lv8Dc+cvUUqiMl33dQjw6
	vgJtWFLkH1zJmuH2bkFuOvuaw27CB6s7ZbXqc7bwz6bCLzWamCY9+Yamh0Fso4fTw0bTeEylx2B
	E0Hup+kMNk7ROS4gBiakK5CYwFz4X+jAvF4nT53mQs/mwSFWh5rqLg2eMR4obe5XqnGtvOVaklR
	RmqFrNOu2e6tJvVaHRLotlQ==
X-Received: by 2002:a05:622a:586:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-5359f4965eamr358236211cf.1.1792051259011;
        Thu, 15 Oct 2026 01:00:59 -0700 (PDT)
X-Received: by 2002:a05:622a:586:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-5359f4965eamr358233581cf.1.1792051257010;
        Thu, 15 Oct 2026 01:00:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda044aabsm91788766b.57.2026.10.15.01.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 01:00:55 -0700 (PDT)
Message-ID: <9e591ab5-d1f1-4ede-bd0b-ab0241394d4e@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:00:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] arm64: dts: qcom: sm8250: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-4-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-4-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hM3F4pWdq-1MHGRADFXK7I5HGTRE2Fmh
X-Proofpoint-ORIG-GUID: hM3F4pWdq-1MHGRADFXK7I5HGTRE2Fmh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX6GkCzZrEN1wD
 U39r85VLZ3B9ibXd15EVhS0ODBvpchFDeACn8tWdN9XEZT+Dyzzqrqj8V9lxg+5jsqUpQtfyo5s
 lsLhUk8nEVyPnzgUBRF7frQcDCdgt+w=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0883d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CjiZw0He1JKpzbGRn1AA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX0ygSKyJxwZ/i
 C2wXmMRleJ7q0KlAvuXvA+vHkPnufPC3Rgz4U/0NzEGJ/uhiPCE/sn54iu3qr5utfxpnQA8raKy
 lIv4UWdtILWcsZ9EPca1qXh8zfA+rvsm2XRRwVZWgHeSsU+M6Kz5IituFKQdWGuE2Fk8gyGnyo2
 ldcB9/zAnXvA1v68OMKM6aI2P8GZICoMM6sFTbQmIikqJQU6TzQS+/oY/4QMLxnVnGzi70vXVUI
 eo1jLZZ9es7XOq4HP0RUmWkoRoOLiA+YLTQZeSAbmHrKeQv9X8t8Wb23IGYdyf9pRPbPeenuXzZ
 9/qf/EByIuFMQ+rjFENsOubDCmian9dfpY1Dl/+ljdK2RBmWXv2sFBD/+b8McM1VYcExm5wXR4a
 zM+a31kOikMK8b3GeLcxkc5uU6oLorVNEX2A8i5Tv8WilZR8/SA0uNktEKdUcIodrncu7O17ktS
 OpVuaKx4QGevjZipl6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150031

On 10/15/26 9:15 AM, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable CMA pool. FastRPC
> assigns the entire region to the DSP during probe without allocating
> the pages from CMA. This allows movable HLOS allocations to use pages
> within the region after HLOS access permissions have been revoked,
> potentially causing synchronous external aborts.
> 
> Replace reusable with no-map to prevent the region from being reused
> for normal kernel allocations and exclude it from the kernel's
> standard memory mapping.
> 
> Fixes: 531ce288b6dd4 ("arm64: dts: qcom: sm8250: Add memory-region for audio PD")
> Link: https://lore.kernel.org/all/20260619-sm8250-audio-v1-1-8a76e033e209@oss.qualcomm.com/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
